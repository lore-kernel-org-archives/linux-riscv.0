Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43049C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlQwI2ggqCrLUqqQWHeNXtyAaHXuTxUJwaMF5fGRxrw=; b=uJR/bDqSO3CpI7
	nL3WpYiUlsn76jOfATF4+b2NuSELumB8VxrKu77dmwr+5V3gpf6vY5dPxMrXA3vZgGFQho34cPWxy
	Wy7oHVVBXVg9vB6CtuT7TjYKqkWRAgI6iE6gmHeBO+r241teQZ8+ohHNNATS1V6b1UVkaNLDr2DLP
	6I7Gm93glibD4T4Yb8KmpZ03s13Byxnw6OmAsGaLeNL0s5FyGrd+4ls2MoWK9a+ZjUJaxFOEGzrDf
	Kh1HSw93aKxVqeJt64tjV0YPoT6REH2NvQyaF1eCIHOBJqrwl3ZOw4AGvcI72iYutUITyVV1ifON7
	rvh5ejr+Dvjaa8imrlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uizwH-0000000BA0a-2Bdq;
	Mon, 04 Aug 2025 18:29:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiymF-0000000B4pK-0ajA
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 17:15:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-454f428038eso40367145e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Aug 2025 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754327709; x=1754932509; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
        b=ITmumUs4OonASMg1psaqJ+RimBo7dL8KVtzSLEAAzZ2mvzSPeHSvbc9E8eSbEZOrFs
         zmPWIARzreTuSoifzrX8W5LAYySxjV32LJgyjWIn+iCs72We3Y/o8p8TAK9FbJSRwCu7
         PH39SHOOG7eUNnBUIa3OMkc72AYKo4uNSpHkVIBnHltHph4iWZEmwR+TZq45h2JtAGY3
         Hqh2S02u+m5ZWjzGpBO9KBVfvDcqISlbvR7TA/e8/Q3V6kh5XptXG/Ie2ah6Sdi1rEjI
         ICgFAxCoBF5cQEm9CBzUyuLnH9hgPlDiycHu1spH8B3SMBoFfuBmxKhXWjN0raEuEWqw
         OdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754327709; x=1754932509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
        b=gsww3ntP4vhBeBhyJixLgqwTY9LH4wirs5HdVxtXAngswuf6Lp4ezUvGYMSfk6DUcx
         fukLtQf9Jh2qtX0GrXTEK8fISji5A/2iI51fHY6GxZV2Xtiz6EGyniRCwoVEvyd5tKVR
         PAmgPP6ANfYe/2TbASblLYhYfV9W8YlcX0wtRNY3kCR3RrIraTlw6miZDFdO0vn+VScQ
         CbGb6K5+PB44+5Pk3fO0/2RPjyIu5RsIWGJuzsar1HkGIbD78PSLh7H/Ma1Up3Jyzv1v
         v1B6V86PkEUwdaLk9xzJK1MmTmWx6NJhBLdkcNuqQBK0O+m/vZvZeKdlMiO8m/jtLvY9
         i7xg==
X-Forwarded-Encrypted: i=1; AJvYcCU8W940ZQYILly6dh8B4VfMrxuR0kxffGR1PEpq9ocUg/Pozw0jbOawJRu/qYiqqTJwXUM2hzQPiRMhSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/+GASdvSVZiasqviu++17dTXr1Op5KSPPGGdp9rCTVJ0X8bMg
	XKFjRiHmP4b1Nht9bgrM1QbW0QyNQFMBoWXtI6ZYblmFo3ahmLpSrXHm
X-Gm-Gg: ASbGnctZ+5I+qBwEx2V+5FeCFzBStdNhnCl/1iQytWF9qsx9IyO3slyRz8FqzjKe5Na
	YfDMPBVjpoB+QvEYIBRuqIdfT2bgYBwsCD4UVQ5fA+p4Nd9zFufc0tv1aj2UftfPLRdn9V6V4pb
	916iJfuEKMfNYbisgRf+hbaJiBYVY0VgoaJTia8PC+t3UlUtGYKB+XTAF4DnlU7Ptin4Yl1lVYS
	v2b9lKxfAj1S2EhyPNoOeW8CcGKpCNesR7bmZFep7hNwCRP9ULxrGvkSHVDrlNpgxKfWS3quGMC
	6oyBROPvgQwKrjt6cueCR5/6GP/g8rpXbCmvf9wfcRY722E92EdUzI5LBIzmRVVi2t7Ml5nVPba
	qWYAqoPaAz+7or8S0FuQ4IxngFrLzqJj3wtzN+oae+gdHOJCtFzOXcA0n/3KQdg==
X-Google-Smtp-Source: AGHT+IEpNawQWUPhZIXoNWLCtN2+qaXCsKArzNXCXzW1yE3i7/WUxeM9GsxIUXvlWMi666W2l82q6Q==
X-Received: by 2002:a05:6000:40c9:b0:3b8:893f:a185 with SMTP id ffacd0b85a97d-3b8d94cf20dmr7323692f8f.53.1754327708754;
        Mon, 04 Aug 2025 10:15:08 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ae8esm16051546f8f.61.2025.08.04.10.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 10:15:07 -0700 (PDT)
Date: Mon, 4 Aug 2025 18:15:06 +0100
From: Stafford Horne <shorne@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 10/17] openrisc: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aJDqmoUNhwWeAlpa@antec>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-10-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250804164417.1612371-10-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_101511_182041_E95AE10D 
X-CRM114-Status: GOOD (  18.82  )
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

On Mon, Aug 04, 2025 at 09:44:06AM -0700, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add missing __attribute_const__ annotations to OpenRISC's implementations of
> ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
> functions that always return the same result for the same input with no
> side effects, making them eligible for compiler optimization.
> 
> Build tested ARCH=openrisc defconfig with GCC or1k-linux 15.1.0.

THis looks ok to me.

> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/include/asm/bitops/__ffs.h | 2 +-
>  arch/openrisc/include/asm/bitops/__fls.h | 2 +-
>  arch/openrisc/include/asm/bitops/ffs.h   | 2 +-
>  arch/openrisc/include/asm/bitops/fls.h   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/openrisc/include/asm/bitops/__ffs.h b/arch/openrisc/include/asm/bitops/__ffs.h
> index 1e224b616fdf..4827b66530b2 100644
> --- a/arch/openrisc/include/asm/bitops/__ffs.h
> +++ b/arch/openrisc/include/asm/bitops/__ffs.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
>  
> -static inline unsigned long __ffs(unsigned long x)
> +static inline __attribute_const__ unsigned long __ffs(unsigned long x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/__fls.h b/arch/openrisc/include/asm/bitops/__fls.h
> index 9658446ad141..637cc76fe4b7 100644
> --- a/arch/openrisc/include/asm/bitops/__fls.h
> +++ b/arch/openrisc/include/asm/bitops/__fls.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
>  
> -static inline unsigned long __fls(unsigned long x)
> +static inline __attribute_const__ unsigned long __fls(unsigned long x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/ffs.h b/arch/openrisc/include/asm/bitops/ffs.h
> index b4c835d6bc84..536a60ab9cc3 100644
> --- a/arch/openrisc/include/asm/bitops/ffs.h
> +++ b/arch/openrisc/include/asm/bitops/ffs.h
> @@ -10,7 +10,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
>  
> -static inline int ffs(int x)
> +static inline __attribute_const__ int ffs(int x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/fls.h b/arch/openrisc/include/asm/bitops/fls.h
> index 6b77f6556fb9..77da7639bb3e 100644
> --- a/arch/openrisc/include/asm/bitops/fls.h
> +++ b/arch/openrisc/include/asm/bitops/fls.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
>  
> -static inline int fls(unsigned int x)
> +static inline __attribute_const__ int fls(unsigned int x)
>  {
>  	int ret;
>  
> -- 
> 2.34.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
