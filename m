Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8219BC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/f0TP75m9c4ZbSUERb6hglJK6OV+ohQm1jfQnRMlrY=; b=HFNli4LAX0ShV8
	jz88EBMtJ+j1HflFPmbTKcGx8Yw5Mg+0NPzqt4cVzehypCjLhRJ8veo7cT4WMDO1+ZHr+c8kak4js
	9nMtn8kNQ1YZ9LaCj9+KFysnI1jFhFoIncq/+5AtVkIRz8Fy2NANsh3pZ/+uais2rZKoIyXgNxUmb
	66t8ey7zGlP+Lfgg6TelFWOfBYL8dtIBjtxW9dClIMjwN3msnI3neuFKXADq499ai4czZzzsExa+2
	4QKoDPigIZZtnLA1uBQ+/OMVILdBWePW/YpEESAi2aopdLly9xYOzif9oYll2OO66cKs/+bdJyZID
	z7ccqfa+/WgKiwvU6r4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVCu-001yyG-2H; Fri, 24 Feb 2023 10:21:40 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVCd-001ymi-TQ
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 10:21:25 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id CF0F9100006;
	Fri, 24 Feb 2023 10:21:16 +0000 (UTC)
Message-ID: <22aeef5b-99cf-bf98-daa1-8e7cf22dffa7@ghiti.fr>
Date: Fri, 24 Feb 2023 11:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/4] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Content-Language: en-US
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-4-jeeheng.sia@starfivetech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230221023523.1498500-4-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_022124_153118_6472DE78 
X-CRM114-Status: GOOD (  12.28  )
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


On 2/21/23 03:35, Sia Jee Heng wrote:
> Currently kernel_page_present() function doesn't support huge page
> detection causes the function to mistakenly return false to the
> hibernation core.
>
> Add huge page detection to the function to solve the problem.
>
> Fixes tag: commit 9e953cda5cdf ("riscv:
> Introduce huge page support for 32/64bit kernel")
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>   arch/riscv/mm/pageattr.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 86c56616e5de..ea3d61de065b 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -217,18 +217,26 @@ bool kernel_page_present(struct page *page)
>   	pgd = pgd_offset_k(addr);
>   	if (!pgd_present(*pgd))
>   		return false;
> +	if (pgd_leaf(*pgd))
> +		return true;
>   
>   	p4d = p4d_offset(pgd, addr);
>   	if (!p4d_present(*p4d))
>   		return false;
> +	if (p4d_leaf(*p4d))
> +		return true;
>   
>   	pud = pud_offset(p4d, addr);
>   	if (!pud_present(*pud))
>   		return false;
> +	if (pud_leaf(*pud))
> +		return true;
>   
>   	pmd = pmd_offset(pud, addr);
>   	if (!pmd_present(*pmd))
>   		return false;
> +	if (pmd_leaf(*pmd))
> +		return true;
>   
>   	pte = pte_offset_kernel(pmd, addr);
>   	return pte_present(*pte);


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
