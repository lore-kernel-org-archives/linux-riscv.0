Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A506606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H5B1Vem7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=W2/poyEC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:Mime-Version:Date:
	Subject:From:To:References:Message-Id:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yz/j204uZySaKvdiK6ZvI/1I1hLaCkWn71q5vcnJ0hY=; b=H5B1Vem7T3/A0eqdvJb652vfGM
	zuWmKJN5703rpNH91uwkisZEIOjEcLXOQcdkSO+v2q38y+oTglGGtER4deLJEaHWf6WqKTD3nSwVe
	jwdaIx9YLo6ci/jZ2pvMj7gJ4EkeQKSTm9T1YzSb4GXLGxBn+uR9F/PCIIAKQXkevUPmgNK/a7F4v
	kytHiKGc17pV6JB7vnrwyTW92Hwsh+ShLVpQIwmsqzZyRGaAjKn0kVxf8fFTkp+jgGeIpuEQ46fnR
	I4kuU+doknhweHK9x05/itaneC1PQ6mCDggc5bxUhhkTIjdpj192M7JQEHAy3HngVhkkUiczH9lR/
	giVi3BfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW0g-00000004dns-0UlE;
	Wed, 04 Nov 2026 08:06:18 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW0d-00000004dnT-1tYa
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 08:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793779571; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sduOP3VW/r6BpntDuFO0P9ijMJnVNglrHxEYHPAMFGs=;
 b=W2/poyECXARfu9is4ZU+Li4KeWeaPximlH2D+qD/TtRq5pFs1hXguohrDoTv1QWajIW5bE
 bWHGMG3A38jijTz83NfkZL3Pjn0ZD8cxzuwiLiXl2U0dFvlBU+XcHz8qkl32oAvv3HfK60
 FUJnM3Zs4xMx6vor1GOKrQq/BBEGresZkX5H1vS8bbQQlIPpX8d9EvgcntG2PJuU+ikNTM
 ybnyQIulSG7ks+IUOMg/UM5P007X1Io74MBRw9ASOO5CKOFRVHUZ5PblRJ/Axi66s+I3Re
 zEyGK/bX70o+82tz7jD0IzEl+XJqRybW6elVag0fk5w6JHlWlEbDNnJ0+RMQOg==
Message-Id: <b8f28bee-83d6-4566-889d-6119e2837ddb@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Received: from [100.86.223.207] ([61.141.241.106]) by smtp.feishu.cn with ESMTPS; Wed, 04 Nov 2026 16:05:58 +0800
References: <20261022083212.84721-1-cuiyunhui@bytedance.com>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
X-Lms-Return-Path: <lba+26aeae767+8503a9+lists.infradead.org+yang.yicong@picoheart.com>
User-Agent: Mozilla Thunderbird
Date: Wed, 4 Nov 2026 16:05:55 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Language: en-US
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>, <zong.li@sifive.com>, <wangruikang@iscas.ac.cn>, 
	<debug@rivosinc.com>, <qirui.001@bytedance.com>, <guoziyi114@gmail.com>, 
	<samuel.holland@sifive.com>, <ben.dooks@codethink.co.uk>, 
	<cyrilbur@tenstorrent.com>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <yang.yicong@picoheart.com>, 
	<stable@vger.kernel.org>
In-Reply-To: <20261022083212.84721-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_000615_599898_B6B17B44 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 4:32 PM, Yunhui Cui wrote:
> __switch_to() saves the sstatus value of prev and restores the SR_SUM bit
> of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
> and next has SR_SUM clear in its saved state, the old SR_SUM bit remains
> set in sstatus.
> 
> This lets next run with user memory access enabled even though its saved
> SR_SUM state is clear.
> 
> Use csrrc to save the sstatus value of prev and clear SR_SUM from the
> live CSR before restoring the saved SR_SUM state of next. This keeps
> prev's SR_SUM state intact, while preventing it from leaking to next.
> 
> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

a straightforward fix :)

Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>

> ---
>  arch/riscv/kernel/entry.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 61b7a77166971..628b85e3915a7 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
>  	REG_S s10, TASK_THREAD_S10_RA(a3)
>  	REG_S s11, TASK_THREAD_S11_RA(a3)
>  
> -	/* save the user space access flag */
> -	csrr  s0, CSR_STATUS
> +	/* Save and clear the user space access flag. */
> +	li    s1, SR_SUM
> +	csrrc s0, CSR_STATUS, s1
>  	REG_S s0, TASK_THREAD_SUM_RA(a3)
>  
>  	/* Save the kernel shadow call stack pointer */
>  	scs_save_current
>  	/* Restore context from next->thread */
>  	REG_L s0,  TASK_THREAD_SUM_RA(a4)
> -	li    s1,  SR_SUM
>  	and   s0,  s0, s1
>  	csrs  CSR_STATUS, s0
>  	REG_L ra,  TASK_THREAD_RA_RA(a4)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
