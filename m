Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019B8C7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q26vAE0BOUkcOx9av8irKy9U9CZRBV2rIOsjji+lC5w=; b=R7Wb2pZhT/B5Xv
	X2w42Zol2aoBGvnC3gT3NEelX8GJN5wFC91LdTYk8xI8pthMvDKDxHKej/cehjsctiE6BmuMyLghG
	QRYDAC/PYDLs/0n3xCTgnIlqgPXJapaGDWCxYB+WdqE/2tXEDu0OhmBrTdlxwcpJm1OwRuYnFSt5w
	AIAo42Igc7G5gmmwRlCQ7FmX0XU1T49ErntTE0xCUvwmDeVszaLbHAm68du25oQvHeoT2u/GxIgh5
	5fR/QFWQJSvYbvSEla99Vn4x29sDq3xaOuo1kFDWv+5bZqXvy4z94/XN3MeyYk18aP0h0iq4alA7p
	XidIwHbMjoiAEL/orkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjGJ-0000000BCYE-3ML8;
	Thu, 26 Jun 2025 09:51:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUizw-0000000B9Yv-2ikx
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 09:34:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45348bff79fso7620655e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750930463; x=1751535263; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=54yRkloeTOXwJZtYTXvyBltimxLORdzQsrxNGOdvL4Y=;
        b=DJjNcjX3MJabFlhs+2cpJEKiCUwn9iRapTuhsb7tIzPn27MoWiSlCvQcX9YY6KsWz8
         RzaMwhwCzPJi/iX4HzyorMz1lp889dOxfJY3mF3QrYj2IX51igoSnTrSNJYR59cbzqKU
         iKMaIGVl2HhxBeM+iyLv6meTWr8K/Ms6J5IETaqrwie3vY6PH/8YbNuRmtZjp+lRGpo3
         pKMmsrp7MOw40P71DdjBHpKL0B/3UCcOAEiNJFTRsVv9NI9Rj33sJC18EnsgJNWOuEgm
         2rPNG4mJJBBiha79Kqkci5hidcl4AJNGBsIjtgGs2S60pMYguKYgzFqEU7V/+c6Vz59A
         uYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930463; x=1751535263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54yRkloeTOXwJZtYTXvyBltimxLORdzQsrxNGOdvL4Y=;
        b=boeSAFBRZOhsDJTZ5ckg8pcnkidI6xki6aKBL6U53B5eb/pLa77UVcZH8fkso8iGki
         P6obJT8EsOGjsSiUNyYGCvo6y39lCL27NA3xOfl4lweaiZl6vazDs/LAksY4FmmLgXB3
         fXwJrJmE3mm2bW/ckQiADi7k5rZ4cKiDCcyRVmL9f3W/CvU/DpKFaXddCxle3g1lv9+P
         tNPZ33XpsARjFdBIdJZpfNv7ZvVucKkIZwXOffk1CKasuvXP3sElYv/E7pgSeKKEEG7i
         7YdfSc87d4pi0/pBqItrvHUm4+VY/fMnB7pONA8AV+ke/u2IjLuPp14IslaSQulGEqVx
         bbBA==
X-Forwarded-Encrypted: i=1; AJvYcCXD4JrmiiOrKrTrMoZSXUx1MhjJN/qDw5xsbj3Zb9HYnpvYv4SfI2Ybx5IwDG3InWH64bgQJ8e8s2LSnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv5B4WbOz4F//WD+x4jCW6qVfPgTkfLhsSKNDQW+qMptSxsPu/
	pDpQ8NlEGWCL3nVokLWzH2CtKVYbuqVcolp/UfdZFSIKYLQIi543/4UYpV2FFLATaPDoXLqcNMQ
	R/IUEymY=
X-Gm-Gg: ASbGnct45kilfLMNVxmAVoYgqgnTIC6SzuBmrhfFOkEGNzunYk17YAnrm+f8wpfw47o
	EjGThh+USpAwBo4F1gL9J6C0TPJYjNHc3yOkn5jviSIRyyqBf6BrYMsydOsWEagN3ezn7pSUcWM
	W0HB270mLSbWhrg0m7kaG0JgPOrktSv0OMSTMdCaPX6hcZwSU1hefYK2L06RJNP0wvdrvYV1Sod
	i6NCGOFCL9vPQyeX9J5IjafqNaNuv2xmD92YChsHTItNuQnFBjBP/QEO4pE9jZ3AsnNkURNehQk
	rC4I2Q/8aqnZBq0kewGE+EwVcyW9IdsuzAVEuZQZHrwJ7RJ3QFMFGPzJ/BY1
X-Google-Smtp-Source: AGHT+IE7SPMJdXg6Uib8sBAANFP0uaWykfjpxucbRqhrErUMyjsBzbnn2KGBiDxo71YCebyhHfo6RA==
X-Received: by 2002:a05:600c:8b6d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-45381ae5182mr57051005e9.24.1750930463049;
        Thu, 26 Jun 2025 02:34:23 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f26ebsm6897038f8f.51.2025.06.26.02.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:34:22 -0700 (PDT)
Date: Thu, 26 Jun 2025 11:34:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Message-ID: <20250626-0186dfe9df28f9bb72a91426@orel>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
 <20250626-a1aca9887bbf5410741e17c4@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250626-a1aca9887bbf5410741e17c4@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_023424_688559_486A9B55 
X-CRM114-Status: GOOD (  25.58  )
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

On Thu, Jun 26, 2025 at 11:21:10AM +0200, Andrew Jones wrote:
> On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> > From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > 
> > Use the hwprobe syscall to decide which PAUSE instruction to execute in
> > userspace code.
> > 
> > Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > ---
> >  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
> >  1 file changed, 17 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> > index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> > --- a/tools/arch/riscv/include/asm/vdso/processor.h
> > +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> > @@ -4,26 +4,33 @@
> >  
> >  #ifndef __ASSEMBLY__
> >  
> > +#include <asm/hwprobe.h>
> > +#include <sys/hwprobe.h>
> > +#include <asm/vendor/mips.h>
> >  #include <asm-generic/barrier.h>
> >  
> >  static inline void cpu_relax(void)
> >  {
> > +	struct riscv_hwprobe pair;
> > +	bool has_mipspause;
> >  #ifdef __riscv_muldiv
> >  	int dummy;
> >  	/* In lieu of a halt instruction, induce a long-latency stall. */
> >  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> >  #endif
> >  
> > -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > -	/*
> > -	 * Reduce instruction retirement.
> > -	 * This assumes the PC changes.
> > -	 */
> > -	__asm__ __volatile__ ("pause");
> > -#else
> > -	/* Encoding of the pause instruction */
> > -	__asm__ __volatile__ (".4byte 0x100000F");
> > -#endif
> > +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> > +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
> > +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> > +
> > +	if (has_mipspause) {
> > +		/* Encoding of the mips pause instruction */
> > +		__asm__ __volatile__(".4byte 0x00501013");
> > +	} else {
> > +		/* Encoding of the pause instruction */
> > +		__asm__ __volatile__(".4byte 0x100000F");
> > +	}
> > +
> 
> cpu_relax() is used in places where we cannot afford the overhead nor call
> arbitrary functions which may take locks, etc. We've even had trouble
> using a static key here in the past since this is inlined and it bloated
> the size too much. You'll need to use ALTERNATIVE().

Oh, I see now that the next patch is handling the kernel cpu_relax with
ALTERNATIVE and this was just the tools cpu_relax. We don't want to make
a syscall inside cpu_relax though either, since it gets called in loops.
It'd be better to just call the standard pause (0x100000F) even if it
does nothing. Or maybe there's some define that can be added/used to
select the correct instruction?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
