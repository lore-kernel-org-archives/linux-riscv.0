Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C0EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 06:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6Qwc6F9Ry9iTWP/siYn+U02IRzWldFWUje6BVbBQW8=; b=ShwVw9/Uaf38f4
	odzTzkkrKuinCI3GqpZMl8e7nW3NtNa9fInl0i3dSvmNPyKHBZnnjG4S+mCKzW6luN0j/Z11yuZGx
	Zi+Ji65NdzTRrLULzKmQuDINwSoDaC2pTnTH49wxi1W02TbJ1cQj+3HPFFSpPQ4F40y88tPPdwaK2
	8Ziy2B9aMXiEKkObPKykQepN0F0eEb24FAS5ER24Dv+pITfEBhuuXTzwxryHi+t/xc+kX7/o81Sj4
	TMlbBmhqcBh0QlpqDhNhFYc3PJB7+RSNJUVEK4Re5gueV/gmcqPQfQl8Jey9sFkphpvNIXNJ0XbOB
	1wXhrcr47fivrWZy87Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZ68-00CG7l-2G;
	Tue, 04 Jul 2023 06:01:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZ65-00CG6m-2i
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 06:01:11 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-992b27e1c55so593172766b.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 23:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688450468; x=1691042468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl9gTJEQlp1epsps/bWt1kzzLQTu7OGXe4NvbD2+dJU=;
        b=C+63iSwAWL2QEv0vXOTtpkTpOzgfgDV8ArF5AQ98M1x0FpUFDjwYxEkTSpOLpEZDTz
         lv5BozU1lxxx9H6vVvEOm8YKdTyb/wg/78/5TRW+J24ix/xuhXIZwSkkoDmbiot/4cr0
         QCyIyGYVokfAlzaHFR6DwmaVJRRSCKFe6BGuca/G8BawV01HkxYVpjJUSkVrk0c2mtD9
         tln2SulLzmzn0G3Psk4yJSliN82FGCwckLBBrKrthFxAkln4Zj9cLUX78weHlfkzIY8I
         SI/HaWTYJrNHfzbs2EE/jhilLXaCsjxKdB3Cg1syg7rz/aBBQiX/BI+dn9npt/2cmNQD
         8GxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688450468; x=1691042468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nl9gTJEQlp1epsps/bWt1kzzLQTu7OGXe4NvbD2+dJU=;
        b=M7FFBkho+pUlKA65lA43bVq0ooKEvOVbNAinbOVk8mtwDElw/q3AeiJDoJtM3Ce8Zm
         8n2j2bx8tqGBefVrzXHG3Jc/FdfMlUaPIQbaCmOIuMMPmADlrr6AbNt1Ya0ckOdiApz5
         XBRNlHHafbFUR9vvHFvbDxQR1N9kNnGcvKaSmUBvtxIJzzrUhWa34JEsfZT3x4ucKEPi
         liLjmeggvkJylCGZ1hp1S1NkmJXsCX/8n7untTHhybmHIDD/cZmUICXVMmwPYY5C82cE
         qrIc4N4WhF8KVYXFbmZPt/38uA4Z20sdlcugbtAU5E843n5mMsqpOGDPztXjr3NhCy8g
         Mzug==
X-Gm-Message-State: ABy/qLZXYRuRBhMnVmTeyDglm2QHWaxwBV5vzEeUzS2+9vit2FNcP2lM
	p8TkMPMLipzVtsBMITGrGWTqYA==
X-Google-Smtp-Source: APBJJlHQg2PkEmmcSnTVZtihp1VqBSr2PqMhFlzgoDfMBKwN+COmCPeIF8RS9L6pzXrtBhJgf77Q/w==
X-Received: by 2002:a17:906:74e:b0:992:3aa8:b21 with SMTP id z14-20020a170906074e00b009923aa80b21mr8972282ejb.25.1688450468186;
        Mon, 03 Jul 2023 23:01:08 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i26-20020a1709063c5a00b00991d54db2acsm10381224ejg.44.2023.07.03.23.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 23:01:07 -0700 (PDT)
Date: Tue, 4 Jul 2023 08:01:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Hugh Dickins <hughd@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>, 
	James Houghton <jthoughton@google.com>, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH] mm: riscv: fix an unsafe pte read in huge_pte_alloc()
Message-ID: <20230704-f273e5ba6c440dff03d07101@orel>
References: <20230703190044.311730-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703190044.311730-1-jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_230109_901869_30D2AA99 
X-CRM114-Status: GOOD (  26.91  )
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

On Mon, Jul 03, 2023 at 12:00:44PM -0700, John Hubbard wrote:
> The WARN_ON_ONCE() statement in riscv's huge_pte_alloc() is susceptible
> to false positives, because the pte is read twice at the C language
> level, locklessly, within the same conditional statement. Depending on
> compiler behavior, this can lead to generated machine code that actually
> reads the pte just once, or twice. Reading twice will expose the code to
> changing pte values and cause incorrect behavior.
> 
> In [1], similar code actually caused a kernel crash on 64-bit x86, when
> using clang to build the kernel, but only after the conversion from *pte
> reads, to ptep_get(pte). The latter uses READ_ONCE(), which forced a
> double read of *pte.
> 
> Rather than waiting for the upcoming ptep_get() conversion, just convert
> this part of the code now, but in a way that avoids the above problem:
> take a single snapshot of the pte before using it in the WARN
> conditional.
> 
> As expected, this preparatory step does not actually change the
> generated code ("make mm/hugetlbpage.s"), on riscv64, when using a gcc
> 12.2 cross compiler.
> 
> [1] https://lore.kernel.org/20230630013203.1955064-1-jhubbard@nvidia.com
> 
> Suggested-by: James Houghton <jthoughton@google.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  arch/riscv/mm/hugetlbpage.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 542883b3b49b..96225a8533ad 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -73,7 +73,11 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
>  	}
>  
>  out:
> -	WARN_ON_ONCE(pte && pte_present(*pte) && !pte_huge(*pte));
> +	if (pte) {
> +		pte_t pteval = ptep_get_lockless(pte);

I think ptep_get_lockless() on riscv (even riscv32) will always just be
ptep_get(), since pte_t is unsigned long, which can be read atomically.

> +
> +		WARN_ON_ONCE(pte_present(pteval) && !pte_huge(pteval));

Ensuring we only read the pte once is good though.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


> +	}
>  	return pte;
>  }
>  
> 
> base-commit: 0a8d6c9c7128a93689fba384cdd7f72b0ce19abd
> -- 
> 2.41.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
