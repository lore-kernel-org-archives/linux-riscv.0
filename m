Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8B4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6Eay4PeFiT7UOkkx/RVlBmItIwdFn56t8wzvXFQU4Y=; b=b/8EODRJ6aiIYp
	SihfKMAWrf2MSvSrSyGIuGEK8sL4bRR5ia/VBDuOATfq/eMof0fM5JVybIyJuM0ypVROxIdtrH7r7
	xAVln9ezUcynT2cUkH9nc2mbCGFtJVlgkraZmuCdly82Wyjp/bPzEoukHH8lc0um3MFCoe4BpRH8g
	lPkIXIdufNiX7LU69t+S07KP4wjA3xP2+rVnbi7cBXC0m4xxukXgceOVDeylrDa8BJQ1wWWZoc6N8
	B5e6/IpbD+9wypE+aZRYUVcbkxB9yq3sszksfxSPWq/RAdGJpGhDhv3+Ub52lyE2zRRDi7RG0+yyo
	rs1FxJ8AZ2TIKADnCDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCOVd-008coJ-7e; Tue, 25 Jan 2022 16:17:29 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCOPB-008aIw-A4
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 16:10:51 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by mail.gandi.net (Postfix) with ESMTPSA id 930DDC0005;
 Tue, 25 Jan 2022 16:10:41 +0000 (UTC)
Message-ID: <36519886-cedc-a3e3-70d2-712f8a6d3a10@ghiti.fr>
Date: Tue, 25 Jan 2022 17:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] riscv: mm: remove the BUG_ON check of mapping the last 4K
 bytes of memory
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220125155542.3753-1-jszhang@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20220125155542.3753-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_081049_556632_19E4E116 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 1/25/22 16:55, Jisheng Zhang wrote:
> remove the BUG_ON check of mapping the last 4K bytes of the addressable
> memory since "this is true for every kernel actually" as pointed out
> by Alexandre.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>   arch/riscv/mm/init.c | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index cf4d018b7d66..8347d0fda8cd 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -811,14 +811,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
>   	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
>   
> -#ifdef CONFIG_64BIT
> -	/*
> -	 * The last 4K bytes of the addressable memory can not be mapped because
> -	 * of IS_ERR_VALUE macro.
> -	 */
> -	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
> -#endif


This BUG_ON seems pretty legit to me: I re-read the exchanges we had, 
and I see that I didn't notice that in your v2, you actually removed the 
BUG_ON. So that's my bad, what I meant in the first place was that the 
BUG_ON is true for 32-bit and 64-bit kernels actually.

Sorry my RB was not right on this one :(

Alex


> -
>   	pt_ops_set_early();
>   
>   	/* Setup early PGD for fixmap */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
