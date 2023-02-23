Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C501EC636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 06:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BldywWFPyVI3azb6W8qMNiSkll2QyKW2q+AhsVNT8Y=; b=o0IR6uluYMtMZB
	6+ogGizUCimnOyILaHi4W5m1v5KlFih7UZmj/vOav2N73AenbmKRZR3B0r0u1pAWlAJM7qKvicD8K
	1AcTN8f6VItGDBom0GcF9H88YWR9CHV8S04Jd8MbwWVFeLcT+XVKyNvKP+mkLPmP2crhCP4IM1PwU
	LIsyBBfqen23z1SIj0AqBnoAu9HS+DLgABNONVIrN4jVlLkvqP8e/NHIUt0cWM0eA6W6HPOf0Awec
	7GSENXvL5RzjRGVudpzDps83SLLkV3QJU+RZx4144uE1VplW5gj1kYD3QpUogcfJhrN4MJ3y6lHOu
	hl5VRxIXpBhZINDWQWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5Xn-00FLpb-A4; Thu, 23 Feb 2023 06:57:31 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5Xk-00FLoW-B5
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 06:57:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id j2so9633083wrh.9
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 22:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KD2BbHM42s+qBr4AAb9fqsLLnrBN9ef1lpzrqkSofU8=;
        b=I+KKZ9EwPLLCgyLBn1Nfv7AXEZy2LHfIYVutHsCPPlix2651u56DQIMYSbi1kUNEzJ
         JrB1eBqntxgCvv0LVgGtwAZkb7TU0OynhwmQRhqRw83/cuu7tf+w8ipQ4WPw/BkwjhSd
         y3nER6oRYsi2nnXzJZxVNLzpWa1m41ZWBs6BBfVuxjXo0CSeR0bFW4CSoxOf7atfyo/J
         FaBoHU9LXIcJKBwCX92gv8O99kEFk8Ik3XPSBV49gWZHiGCXXNgkx4z4lqkxEn9TMAk5
         29GFaQz5ggMtjjDooLwmpEgDycRGGb6rFQDFwnJ+MmCGClMf818KrrGyhQc3NlQ2EqEH
         62tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KD2BbHM42s+qBr4AAb9fqsLLnrBN9ef1lpzrqkSofU8=;
        b=WcTTZlz7kHaxzrz9RCXIstvSPZdBv8++zy0/tmbibDkdXlAaKKuOsiZS+dHD81h6xO
         NsVAnoliFwpMf0S58sgGlN3LwFnbsKElSltTxIBB/zWatHU7TOeCpi3NscpDNgDXyrl8
         4cqJIB0WNZfCYPAeY3YaUYE4A8wdyzNi+zKFYwdl6dlVbWHzYF6ylsslnhHxPYM2W9hp
         ld0bB4Ggw9z/k8rkxQrC8A2QBKNgCGFhw1ZxLD3pa1KPq5Ro6GCaamsmC3co982zDI1G
         FNPJgZOsYZC6DE83MjM9dligwAsgoMlNpGDzde8PLJSW4Y4K3+8d7ny9KDePJVs+UZ/S
         u0TA==
X-Gm-Message-State: AO0yUKXyTybFKOEJUpl/6lfcKDLRRjsyMXo6bcmhju8JzxrjkA12UwpG
	7AF9pw9KRtMmmwoa7MXi/c5Ikg==
X-Google-Smtp-Source: AK7set+Ho9MkNNLGFSCQSbmPjDo0YWzb+lX1SEoWKWu62OlrzVjdAzu7byOiHrA41Htt3R7JCZN6ng==
X-Received: by 2002:a5d:5848:0:b0:2c5:98f2:486 with SMTP id i8-20020a5d5848000000b002c598f20486mr10548278wrf.11.1677135443421;
        Wed, 22 Feb 2023 22:57:23 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c15-20020adfef4f000000b002c54c9bd71fsm7148700wrp.93.2023.02.22.22.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 22:57:23 -0800 (PST)
Date: Thu, 23 Feb 2023 07:57:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
Subject: Re: [PATCH v4 3/4] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Message-ID: <20230223065717.zmlf2gxmtsgqperw@orel>
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-4-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230221023523.1498500-4-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_225728_424347_D0FF0F7C 
X-CRM114-Status: GOOD (  15.26  )
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

On Tue, Feb 21, 2023 at 10:35:22AM +0800, Sia Jee Heng wrote:
> Currently kernel_page_present() function doesn't support huge page
> detection causes the function to mistakenly return false to the
> hibernation core.
> 
> Add huge page detection to the function to solve the problem.
> 
> Fixes tag: commit 9e953cda5cdf ("riscv:
> Introduce huge page support for 32/64bit kernel")

This should be formatted as below (no line wrap and no 'tag' in the tag)

Fixes: 9e953cda5cdf ("riscv: Introduce huge page support for 32/64bit kernel")

> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  arch/riscv/mm/pageattr.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 86c56616e5de..ea3d61de065b 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -217,18 +217,26 @@ bool kernel_page_present(struct page *page)
>  	pgd = pgd_offset_k(addr);
>  	if (!pgd_present(*pgd))
>  		return false;
> +	if (pgd_leaf(*pgd))
> +		return true;
>  
>  	p4d = p4d_offset(pgd, addr);
>  	if (!p4d_present(*p4d))
>  		return false;
> +	if (p4d_leaf(*p4d))
> +		return true;
>  
>  	pud = pud_offset(p4d, addr);
>  	if (!pud_present(*pud))
>  		return false;
> +	if (pud_leaf(*pud))
> +		return true;
>  
>  	pmd = pmd_offset(pud, addr);
>  	if (!pmd_present(*pmd))
>  		return false;
> +	if (pmd_leaf(*pmd))
> +		return true;
>  
>  	pte = pte_offset_kernel(pmd, addr);
>  	return pte_present(*pte);
> -- 
> 2.34.1
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
