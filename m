Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6484C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvHz2FBScVreolz/k4NudOGIkHLIp6j0ZlfflsYFhgw=; b=nzpK5pWqoIBY+H
	3+hY/IPolhEX/mDexW6199x6OMJDffdaGFHMMbwBKBTqecWqyVOQc+zuFbpaDFyGEF0kPaL1UQyjC
	Ir6kP87Gv7F1OeqxtxuXRh9ir7g3FzRyV0V+UxDz4PC7apsBa3HnHQ0tKaIoojstkVW+HD5jX1gbf
	qBuSybfaTQjagVz6Qwmp9spqQxyuYT3gKtPNZ5t9t4etCv2DjFzT2O3SmZHSmD87FxFf4Rb1/Z9Cq
	ZDpcGvLS2/pW6vKiYyuHFFsAoxt+xgB/76v8MeasGZ45/xAA+S2GEoMN6tWCNvpWNkpU6CGy2ukqM
	sJIl+4Gi+pGF2umONO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbVA-003JdV-16;
	Wed, 26 Apr 2023 09:31:52 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbV7-003JcJ-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 09:31:51 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 30DC1240004;
	Wed, 26 Apr 2023 09:31:35 +0000 (UTC)
Message-ID: <83540cb1-0c9b-f572-849a-cb100437d049@ghiti.fr>
Date: Wed, 26 Apr 2023 11:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH -fixes] riscv: mm: remove redundant parameter of
 create_fdt_early_page_table
Content-Language: en-US
To: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 heiko@sntech.de, conor.dooley@microchip.com, guoren@kernel.org,
 anshuman.khandual@arm.com, mick@ics.forth.gr, samuel@sholland.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230426091511.674496-1-suagrfillet@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230426091511.674496-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_023149_630505_F5E26880 
X-CRM114-Status: GOOD (  14.22  )
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

Hi Song,


On 4/26/23 11:15, Song Shuai wrote:
> create_fdt_early_page_table() explicitly uses early_pg_dir for
> 32-bit ftb mapping and the pgdir parameter is redundant here.


s/ftb/fdt


> So remove it and its caller.
>
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>   arch/riscv/mm/init.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0f14f4a8d179..6ebb75a9a6b9 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -843,8 +843,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
>    * this means 2 PMD entries whereas for 32-bit kernel, this is only 1 PGDIR
>    * entry.
>    */
> -static void __init create_fdt_early_page_table(pgd_t *pgdir,
> -					       uintptr_t fix_fdt_va,
> +static void __init create_fdt_early_page_table(uintptr_t fix_fdt_va,
>   					       uintptr_t dtb_pa)
>   {
>   	uintptr_t pa = dtb_pa & ~(PMD_SIZE - 1);
> @@ -1034,8 +1033,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   	create_kernel_page_table(early_pg_dir, true);
>   
>   	/* Setup early mapping for FDT early scan */
> -	create_fdt_early_page_table(early_pg_dir,
> -				    __fix_to_virt(FIX_FDT), dtb_pa);
> +	create_fdt_early_page_table(__fix_to_virt(FIX_FDT), dtb_pa);
>   
>   	/*
>   	 * Bootime fixmap only can handle PMD_SIZE mapping. Thus, boot-ioremap


You're right, it was never used, weird the compiler never complained. 
And the function name clearly indicates it is for early_pg_dir so no 
need for this parameter. You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
