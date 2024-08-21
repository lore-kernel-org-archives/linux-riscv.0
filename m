Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C94C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBGUcGSWPw21PuDklgPsuapvVgqHMLX/esYTuYojQfE=; b=kK9259VllyfC2O
	7NrbqcAwhL4p9vbwMwUEc5MokXJxaoUJcwVy8P+M3zN44SVTGutfeOnBxnPAMN791YpnZoGKCPCPd
	o1nzfDenVhk1KwbqUbktpSex4BlYrEAoLXJ+9e1bh0wauvfZM77L4hsYuPuhFykOzb+ZsZvxlISAi
	yLfV74PEA/rLaeDZfFrrxA6/L1fwjbKcXPXj1AKZ2xe4cd77kvly2uMWY1G92/A47s2i/U9BdeFIv
	kmt3bRrQgZdUFN8y6eHvEm2fnkfH+qICXhN65G6/eRQQbITR43KM2Mif2hLFu8p433ddAC7jZ6Re5
	HCZSJZpxXhiUshvGW65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgm3n-00000009F0t-1iPF;
	Wed, 21 Aug 2024 14:11:39 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgm3k-00000009F08-3s0N
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:11:38 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a83869373b6so709816066b.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724249495; x=1724854295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XBOHL837jA2B59cJ9N1CVTAML3ruQr41aXO6bANSxRE=;
        b=JJ+XWWGdjvZMbaARf7fEXSMXV0WPi3I4P7VBtTwycaJF91Z3eOm8GTXNWApwWvCl1X
         8tfBoKT9LPJ8iWdqwUGQZf1k3412XLSwyj70BQdmRpxljsRs8jU0R0aTtEuXBM4uhcM9
         RDY9OxD6PznIVVlmj1F2NB9hR9UrP9I8K85/k+IEWY/mbtv82CGTrdeC29JCn+8t32CS
         hEcqz3MWgyGZSWn3Ux2YPRtaiiyEELlJ3JYdhILGqzkxOIaEDhGjTUrgDJ+SqhXxVoOv
         Uex1vsNWAjzX4m/A/sJJlYj49qJdub1DQNzfS3lyis30CwGqvWnh0ej+hWzYD272jwqj
         7QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724249495; x=1724854295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBOHL837jA2B59cJ9N1CVTAML3ruQr41aXO6bANSxRE=;
        b=HkTJrh8MpxUAz25JZSCcc8OFgYBXjqE2/LM9IYocWsdFPx4CWj1OPqLPumjGRMtRuA
         ToCCIdqyur7vq+sMcuHBeYVjfahFAMYOXIZCVu2TIFBePq3de5Xywx1119bv0debR9h0
         GoswnhBXd5uOUZ+yLJh2F0pvVB5cEu2JXwD1V9xnsKjIpI9DtxGGD+vBWT2MpQpSfZCu
         eP/VOOTEblR70+WrYST2QAvcv83zq8xmKXCXbCELXcqyvmlkwiXvPttBnF5yxI8NUgXs
         7jGwbla8qLvxLd69XKtgBwG6HrUzne7i61S6VuVZ/qNKsP8lkexgCJJ3YWWbotzE9+ET
         EBHA==
X-Forwarded-Encrypted: i=1; AJvYcCXj1g3cuE1soW+EXwAwPvSOyrYmeOHN1C1eEOVC6fScQZ032//up8dEq4OtPRX6zlzET6LfYirp9VwuNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0thPXvlYy9kRC2zMxKKGf49lWfUkcb30hFBfBAdS6xKLGAek4
	ZIfXTPHjgv8wE3UrCm7caCskJWd2GxkjYJNJuPjShYPJ95/9rlK9Z8em1L4ri3k=
X-Google-Smtp-Source: AGHT+IG0kyQofIzbQK74kuC8mV6f7JGisMMjMYnCb2XVNIyD0azrMDsyQFGQgXYRauDuPTktDhBa4g==
X-Received: by 2002:a17:907:9490:b0:a7a:a892:8e05 with SMTP id a640c23a62f3a-a866f359158mr186667266b.33.1724249494018;
        Wed, 21 Aug 2024 07:11:34 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8679a8e3f9sm86081266b.1.2024.08.21.07.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:11:33 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:11:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 02/13] riscv: Do not fail to build on byte/halfword
 operations with Zawrs
Message-ID: <20240821-ab85a511044c72f0511f7a1e@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_071136_986241_09607237 
X-CRM114-Status: GOOD (  17.04  )
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

On Sun, Aug 18, 2024 at 08:35:27AM GMT, Alexandre Ghiti wrote:
> riscv does not have lr instructions on byte and halfword but the
> qspinlock implementation actually uses such atomics provided by the
> Zabha extension, so those sizes are legitimate.
> 
> Then instead of failing to build, just fallback to the !Zawrs path.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index ebbce134917c..ac1d7df898ef 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -245,6 +245,11 @@ static __always_inline void __cmpwait(volatile void *ptr,
>  		 : : : : no_zawrs);
>  
>  	switch (size) {
> +	case 1:
> +		fallthrough;
> +	case 2:
> +		/* RISC-V doesn't have lr instructions on byte and half-word. */
> +		goto no_zawrs;
>  	case 4:
>  		asm volatile(
>  		"	lr.w	%0, %1\n"
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
