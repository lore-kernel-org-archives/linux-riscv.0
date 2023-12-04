Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC08C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 03:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Kv/P7urs0oosn2060ywGoz0NPNY9d+vVgJdXbjd8wck=; b=nhy3b9fOn7CwrNn6Ar76tGcSxZ
	AzsBKYn5SADn8g0wMgy3GWuLzSme6V05tNxS8Wt+MIPv+wS7TOcFVhL0iz9L8nkUu5aB1rNh0fmev
	c3X+AKE8gadMFWM+C66pCnHJfPaJ76t0NwUbjB9VqNhweD3U76Pt4cFk4We6ErbYMjTfiCBMxxqaF
	hEiadzu8PUcDaPsf78FF96L3C/WSlhOwZBDVFbHbpfQQ4sTWOb79FhWBNr8Pod5pGci8VdoUsQcu8
	PYZUg18iuncsKf1zf++GnsZWBLwa3EI65q83/e2iZq/JDgi+Tdocb0exU/mwVgwPJqyjzhbelx2Bg
	d5FTmrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9zDY-002sYb-2u;
	Mon, 04 Dec 2023 03:01:56 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9zDV-002sXu-27
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 03:01:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ce2ff70619so302384b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 03 Dec 2023 19:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701658912; x=1702263712; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=CQYiiiRLontcDI44whmeD/LoEJVxuqfkBiryqv/zBTg=;
        b=e3Q1W4Lq7iuaXXA1W75ZYoph517gaIVr/P19lnuJvKPGykJAlkHmWncBMgBzQ2cAT8
         cAScqSyc/bJ93hIA4OIOSueWro4Fxi7femaLgFlu2NhIz/cnvTjhF9vowLbD9U5PZA9K
         fufxKeJ66zb2TobIfpbXFLvbcf+d6PlvlBa9AvhWT67pwlz2c4El2VXebsfJ0ZdFEclY
         r2GgsIlb7RsH8kn6xfd28ZT5uwTUDVcb8OGygWCfuS2c6qDTvMpPbfNtlRIAsmY119QW
         6YJDz9qhLMECTJof1O64eGYF1r3mH9mXS/0JqxKqCAACuSZQIP0f6MVlZxizf9SiJWNG
         0Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701658912; x=1702263712;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQYiiiRLontcDI44whmeD/LoEJVxuqfkBiryqv/zBTg=;
        b=ac1NoqyFmD7NTgvzS4KMvlqaffzDh5wX3eu+VgKZ+th/unNBCj7Q3TYBEtDNKUCP9L
         roGdGQJO3c6eLPo2KbXLtmympAuh39Xta7eTqkZo0CBNBDGzEb1HiHIM/5HYwQwc0yhx
         JO/VX23aHdzdJPGNlXDEZm+hl7R0vDVyAziGocXHRuOwgN2jG8O30bhqJeSmhjgQ5cmj
         6PsjHaVks4catWPTfU+gGzYTIKgADwEwom+Wtrqvw2XCkCw2tgpGxJKMdHPB+qWMqkI4
         Gc3BQz+EKj0mpj86Gi0Fm5qjKxh/teCjxwy+27DoJdcrRrbefLxXc6ZFeV9yaBp5Vc1M
         /ChA==
X-Gm-Message-State: AOJu0Yx6orh0/d89Aj3b8AHdYmeZuSkLeQ4uPK4h5d2IP8eU2Nkgge33
	Ig0YygnLmUOkO5WR/5L8yTtCXQ==
X-Google-Smtp-Source: AGHT+IHFLJUBmtnWAvysao8TWHQlyk2Cfpox9jD8bkyNgUP4wKyxIxGZHkfjhvm//XUEUavLfPd53A==
X-Received: by 2002:a05:6a20:748f:b0:18c:8fef:22cc with SMTP id p15-20020a056a20748f00b0018c8fef22ccmr1035248pzd.24.1701658911982;
        Sun, 03 Dec 2023 19:01:51 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:979a:226c:de55:73de])
        by smtp.gmail.com with ESMTPSA id c24-20020aa78818000000b006cd88728572sm6562301pfo.211.2023.12.03.19.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 19:01:51 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-13-201c483bd775@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 13/39] arm64/mm: Map pages for guarded control stack
In-reply-to: <20231122-arm64-gcs-v7-13-201c483bd775@kernel.org>
Date: Mon, 04 Dec 2023 00:01:49 -0300
Message-ID: <87a5qqisbm.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_190153_751854_C5807072 
X-CRM114-Status: GOOD (  12.67  )
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


Hello,

Mark Brown <broonie@kernel.org> writes:

> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 645fe60d000f..605d4e6edc1d 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -79,9 +79,20 @@ arch_initcall(adjust_protection_map);
>  
>  pgprot_t vm_get_page_prot(unsigned long vm_flags)
>  {
> -	pteval_t prot = pgprot_val(protection_map[vm_flags &
> +	pteval_t prot;
> +
> +	/* If this is a GCS then only interpret VM_WRITE. */
> +	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> +		if (vm_flags & VM_WRITE)
> +			prot = _PAGE_GCS;
> +		else
> +			prot = _PAGE_GCS_RO;
> +	} else {
> +		prot = pgprot_val(protection_map[vm_flags &
>  				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
> +	}
>  
> +	/* VM_ARM64_BTI on a GCS is rejected in arch_valdiate_flags() */

s/valdiate/validate/

>  	if (vm_flags & VM_ARM64_BTI)
>  		prot |= PTE_GP;


-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
