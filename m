Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0646FD8754
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLZ0BNN/3bAtZ5imNvUJ6MJfaTiH3pDlGqg8v7Qnq7w=; b=XkYa4Is6F9igp8
	HPzoBbOK++5KP0bKcLNwJOS9Gvzx9LTFEWavPYgEd0uCFwKXxus7v9wywQpUxobXPE9gv+B/sZSfa
	oLVJeJO/LdV380eAlJvEp8HT7QWeWJOiResw99OQtR87/iQPZIwDe4LrvgwhLIvco9wcz5J2TVCa9
	efHoRBj1BdMmbeC83jR/V+M8JGGJ5Mp1P0roGW7SbsuuyN5/1jkDX1+RAL4A1qe61by8taKM/g0Ix
	i3eREUfyETTXeJIC05q7NJ3uq+IYqzlEm6nv/UHnVrHaRWITMlxcvP2D+g0Onn6xGDloHxvd5b9UT
	FwXfd5FSkeb9zDwjuZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TGl-00000006GjQ-3Llb;
	Tue, 17 Mar 2026 12:11:32 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TGi-00000006Giq-0PBf
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 12:11:29 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1FC241A3FD6;
	Tue, 17 Mar 2026 13:11:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1773749483;
	bh=Utd6oJ1tj+m9Jqdz7mT53RoWT6GNYXeD2+o7QCiiQkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oB0y0qE+SCdnlDpM2y+Mn8a/rTEGxabKolC/EhFVeCZyJUvyfE9DU7/L/gU9FvvvL
	 7Lu6zzQt+Iq4lnjuDhlxb7UCzDtC98tYiRc0nAbYhaegU2a2b9uoGgRC5kevSq97kX
	 uKPjTJ0ciJ6HgChiAJ0m0EYVxWP+OW7fy1ntJnfb8xDL6L/l18S7OFChno+9TRBAAj
	 mCoL2AyPyZjjUjDIPkBzVxfk+y2YOawcBjkwaQWReOsBp2ZRmn6VpYkDznBtMRjZJr
	 NMG2px4vUe+RfmH40cuH9TzBcL8JTzEvRdmiGNpJUoIrmoHKCLUaO1twqJcViY1lJ7
	 ld15RUhU2VaOw==
Date: Tue, 17 Mar 2026 13:11:22 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: fangyu.yu@linux.alibaba.com
Cc: tjeznach@rivosinc.com, will@kernel.org, robin.murphy@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	baolu.lu@linux.intel.com, zong.li@sifive.com, andrew.jones@oss.qualcomm.com, 
	guoren@kernel.org, ajones@ventanamicro.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/riscv: Add IOTINVAL after updating DDT/PDT
 entries
Message-ID: <5woghxzq2ovb7z7bybqwkckmpjua7proqqket5vacw6kp225nc@mee7c3zchkir>
References: <20260122143224.25146-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122143224.25146-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_051128_355341_E0A45BD3 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 22, 2026 at 10:32:24PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Add riscv_iommu_iodir_iotinval() to perform required TLB and context cache
> invalidations after updating DDT or PDT entries, as mandated by the RISC-V
> IOMMU specification (Section 6.3.1 and 6.3.2).
> 
> Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> ---
>     Changes in v2:
>     - Reworked the patch formatting (per Drew).
>     - Fixed the call site of riscv_iommu_iodir_iotinval() (per Drew).
>     - Moved riscv_iommu_cmd_inval_vma() out of the conditional blocks to avoid
>       duplication (per Guoren).
>     - Dropped the #if 0-guarded code (per Guoren).
>     - Updated the Fixes: tag (per Drew).
>     - Link to v1:
>       https://lore.kernel.org/linux-riscv/20260108134855.91341-1-fangyu.yu@linux.alibaba.com/
> ---
>  drivers/iommu/riscv/iommu.c | 70 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
