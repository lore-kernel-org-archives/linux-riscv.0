Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F40CC52D7D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpWr1EcPOxsfszAtftKl+19mxV7WeER5+QVqgGxV3ek=; b=OljuzGh6aICY3y
	6nt2dYtPjD2jNPF65XHJcBwvLdnrNjzsCYZD/0phs9tQ8qJiqrDifc2r4a02v3m2bV8Q7eSj39Z3C
	lbXq9vnUi6pId5atuIymCOtMdwExHLaSCsUnK2+H65coT6k7aNrTF+zHzpH6G0A89EnwYHXUQzx4K
	FNxW8GCK5FA8v1+8omPjLLKFm7K6K7t9rKfHkLreMg6D7+ppUfK+rYvuW/rOdvWP/ryKiVnr851eY
	9gt+wX+vdYKLIds5ZeXOSg4bDxiNlspkT+cSparlYTuq0kOUxJrykJivU5hpfT+i369RQIKZutteK
	C/Sa/Di0XtuGaIs27mKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew6o-0000000CsOO-15XP;
	Fri, 16 Aug 2024 12:31:10 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew6h-0000000CsLX-3aA7
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 12:31:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63E441BF203;
	Fri, 16 Aug 2024 12:30:55 +0000 (UTC)
Message-ID: <665dee3c-1833-49c9-88d1-9f92475dbb59@ghiti.fr>
Date: Fri, 16 Aug 2024 14:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Remove unused GENERATING_ASM_OFFSETS
Content-Language: en-US
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20240816101912.1049329-1-zhangchunyan@iscas.ac.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240816101912.1049329-1-zhangchunyan@iscas.ac.cn>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_053104_055248_EC0A891E 
X-CRM114-Status: GOOD (  15.09  )
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

Hi Chunyan,

On 16/08/2024 12:19, Chunyan Zhang wrote:
> The macro is not used in the current version of kernel, it looks like
> can be removed to avoid a build warning:
>
> ../arch/riscv/kernel/asm-offsets.c: At top level:
> ../arch/riscv/kernel/asm-offsets.c:7: warning: macro "GENERATING_ASM_OFFSETS" is not used [-Wunused-macros]
>      7 | #define GENERATING_ASM_OFFSETS

So this warning never shows up in a "normal" kernel compilation, but it 
happens when using W=2 (with quite a lot of other warnings).

This unused define indeed seems completely useless, I guess not all 
unused defines fall into this category and we should be careful when 
removing them, but for this one it makes sense so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>
> Fixes: 9639a44394b9 ("RISC-V: Provide a cleaner raw_smp_processor_id()")
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   arch/riscv/kernel/asm-offsets.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index b09ca5f944f7..cb09f0c4f62c 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -4,8 +4,6 @@
>    * Copyright (C) 2017 SiFive
>    */
>   
> -#define GENERATING_ASM_OFFSETS
> -
>   #include <linux/kbuild.h>
>   #include <linux/mm.h>
>   #include <linux/sched.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
