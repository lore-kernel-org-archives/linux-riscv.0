Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AC4C27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 22:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO5qMKi1hloF3pdUkDFX02fPXrIIPDXIR7NrIFU4cCE=; b=jYAbWgIF2gURDX
	EG6tPAUdh4AL2pBSlV3wu/df3G0kQ1IxY3Nr2OurJrN7grK2bupl03IESeT0ECG/ghkl7H3jUvlNS
	4s5ut47Xi4AkA+1fYHa8qSQXYpRwU5fm/d0wABDSmN7IvmgcjD2Tt1knSl753Mp8kXjUdKX1Jmc8P
	B2Hk2A9Wnx9/yBi3FeCSwbw2AO5Gyp/5KPb4MdJAu8oh8hWEVHpeDrZaUDWveGoCxtAuRyJuf6G3B
	L1mcJx02cxqfE+NP7jqrROr2yRScTds8GQkU+xa5Zf7iKUGXuz/UJ9wycNyZ2x11SGLuAqZH0zjak
	HKOsWwJGC3OSpt/P/e7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFLJQ-0000000BW44-3WJV;
	Thu, 06 Jun 2024 22:10:24 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFLJN-0000000BW2G-3SHm
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 22:10:23 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6f8edde24b3so800242a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717711818; x=1718316618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJTeyb0eINc0gwLURpfqtisGaEu72F/v9nDe3ziMfx8=;
        b=cyi4cBZgKsoFlBQzwU0uBcVVSAWX9vaWZpIHXrHCC9dx0TIXZimUn/UyLdT5JyjVkJ
         PkFz8cWKQnLEr1y9wYxKFtY6PGoCbNtAYHF4qqPZHbZ3SclUNq7f3UIcgN5oWC9dzPpW
         lhVjiAJrQlsMWpxsOBUbbHPtVKLT8CqUu0lWvO38jWODQZwKYlhfHazEzvg6BAFlnqDk
         2ZALKNVvjhCM9xxQiubyi8NGKpoyKbIBmzeFXyKGQ7yK3fHQPlPa8KWGRcq5MJXDk3E6
         tvAbP7/0yc3IZJcUTYOOC42OEzatig5/A1TAbByyL+0mmd0A/YmDqem5PrOB2y90LgyP
         hOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717711818; x=1718316618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJTeyb0eINc0gwLURpfqtisGaEu72F/v9nDe3ziMfx8=;
        b=BjbKdBGEzHkOB9MlBxLTCOpiAFhWkEYtPWy7CCDHoQyvhfbF4QsbGrhMHFfESqdnSw
         o1LfhH366+NdwzSMLjwjKI0vrI1QrpFJsfxUhjOOOPX/BI0jPz7l67cRzPgcwoDk+L66
         6HR3A0Y3kdiVqpxH13ndYuwUQsJKJG5f63CPurs/tVJLjkcjD+/Qc17KsZpveVHTVf87
         0hsb3TXc9QgbhjHT94P//uZsTfGG2PO22GlhvHEOM2UqZBhZtZxLKP/Dvp+PQvH7zNS4
         8O/fKZ02+WkGM+mxIysf1OYDNco5jcaazCEIzVBVYCKq0xnYIk5Rb3uIIKdAsAA6Ua4B
         foCg==
X-Forwarded-Encrypted: i=1; AJvYcCXGTCSS4V9lybCt5B3D+tPaCFwpxnr0JcTayuiBWzbdKO/hpDsao+xle0f/YLNTcT1Qu5uMcPYy+lDzCZOAjSfKXnsbeYnsFWAicA9qobz1
X-Gm-Message-State: AOJu0YycvYaaY/4fY/3CGnJDzXkWoRxfiicMfLeAXW6aANe7J2+tT9sw
	isESgTtxI7ODDh7yYdq2DB9GUbIZ9AFq8QzhuITRb/XSd/Hqbhx//y0F4+Cvh60=
X-Google-Smtp-Source: AGHT+IHtnyWwXVrneu4BW4k4zNBmga8uhKsNdRgD+FGVHVTj0yCMQj+8zj2UHpYqSzUhz3bjsiIUww==
X-Received: by 2002:a05:6358:63a3:b0:199:a132:8aa with SMTP id e5c5f4694b2df-19f1fedc4b3mr123515855d.17.1717711817515;
        Thu, 06 Jun 2024 15:10:17 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de2017fc69sm1356840a12.17.2024.06.06.15.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 15:10:16 -0700 (PDT)
Date: Thu, 6 Jun 2024 15:10:13 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
	Erick Archer <erick.archer@gmx.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] RISC-V: Add Zicclsm to cpufeature and hwprobe
Message-ID: <ZmIzxcdUJftnxptc@ghost>
References: <20240606183215.416829-1-jesse@rivosinc.com>
 <20240606-acetone-whisking-af2ba796238f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606-acetone-whisking-af2ba796238f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_151021_892970_6A6CA129 
X-CRM114-Status: GOOD (  30.80  )
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

On Thu, Jun 06, 2024 at 07:43:52PM +0100, Conor Dooley wrote:
> On Thu, Jun 06, 2024 at 02:32:13PM -0400, Jesse Taube wrote:
> > > Zicclsm Misaligned loads and stores to main memory regions with both
> > > the cacheability and coherence PMAs must be supported.
> > > Note:
> > > This introduces a new extension name for this feature.
> > > This requires misaligned support for all regular load and store
> > > instructions (including scalar and vector) but not AMOs or other
> > > specialized forms of memory access. Even though mandated, misaligned
> > > loads and stores might execute extremely slowly. Standard software
> > > distributions should assume their existence only for correctness,
> > > not for performance.
> > 
> > Detecing zicclsm allows the kernel to report if the
> > hardware supports misaligned accesses even if support wasn't probed.
> > 
> > This is useful for usermode to know if vector misaligned accesses are
> > supported.
> > 
> > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h        | 1 +
> >  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> >  arch/riscv/kernel/cpufeature.c        | 1 +
> >  arch/riscv/kernel/sys_hwprobe.c       | 1 +
> >  4 files changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index e17d0078a651..8c0d0b555a8e 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -81,6 +81,7 @@
> >  #define RISCV_ISA_EXT_ZTSO		72
> >  #define RISCV_ISA_EXT_ZACAS		73
> >  #define RISCV_ISA_EXT_XANDESPMU		74
> > +#define RISCV_ISA_EXT_ZICCLSM		75
> >  
> >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >  
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > index 2902f68dc913..060212331a03 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -59,6 +59,7 @@ struct riscv_hwprobe {
> >  #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
> >  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
> >  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> > +#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 36)
> 
> Missing an update to hwprobe.rst.
> 

"RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)" was also defined here in
6.10 so this key needs to be bumped down one.

- Charlie

> >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3ed2359eae35..863c708f2f2e 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -305,6 +305,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >  	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
> > +	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
> 
> Please read the ordering comment above this structure!
> Also, you're missing dt-binding documentation for the extension.
> 
> >  };
> >  
> >  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > index 8cae41a502dd..b286b73e763e 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -125,6 +125,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> >  			EXT_KEY(ZVKT);
> >  			EXT_KEY(ZVFH);
> >  			EXT_KEY(ZVFHMIN);
> > +			EXT_KEY(ZICCLSM);
> 
> Order looks off here too, I think this should be added in in the same
> order as to riscv_isa_ext, although the requirement isn't hard here,
> just that adding to the end of a list means it's annoying to check for
> what's missing.
> 
> Thanks,
> Conor.
> 
> >  		}
> >  
> >  		if (has_fpu()) {
> > -- 
> > 2.43.0
> > 
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
