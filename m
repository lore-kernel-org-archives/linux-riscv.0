Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BA2C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3bppJ+S4mLJWNjklx3uRYjUN0+omBLUTTpSbHQzDw0=; b=Vv1rO8KJuht1yo
	lWYpRFoZKqBradQGIPbG+5K1mbw7fqkg8Z4CQ2lz1UYhKaXx/XtHKdc7+MyBaRp+n03UJPR40q3nn
	qBeWrwx8itJ13LcD4Dl9gXopy+3x71K6P4glW59X5uEMYIqKhwCfBE0l2SuY11ftWvhNWSx3w1yLv
	q/TGu3YidVS4P25uNsEBrDujDp/BF/2z43chog2P2DUVZ0242+3QxS9ECH1HHNhqj+6FdwYXh+i8D
	MwRUeOFBiwDTcpZMNerseeFrI9AN78Cd2YAXbM84rPS/03FXUFDtkCm05Q7X26Bx3+YRpP9e1j1Q/
	DxRzZ1FE0e4vYfgKq4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmWaG-0000000CH2Z-32tI;
	Tue, 19 Mar 2024 10:20:40 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmWaC-0000000CH1A-16yj
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 10:20:37 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5a4817189c8so2150545eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710843632; x=1711448432; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QL3EGbNhVw3JtUTld34AtoZby/9DY4UaNMDtaugQZHE=;
        b=EpnyoFTMbCQGL2DF+r+j8Ibr1T+MVpgclKOppFeCXe403H1sCPjegOYUF28QdDvvSz
         gsqeq/xTfkL+dloKTfC00aPrDsIEi1ZkBCYcw6lKF2CrcT6g1CTU5w0Ld+GfBIfZ8a5H
         Q9m11G8UYIpfk2Slb9IqS+bLbt48QLIJ/KB5ZmeIoy6TQH/8xYdEguA5LO1GpnsNELXw
         yyyl52c+Xq8eeC3rXjfzMoOFQGW+ocgZDInbv/PRmkyul1pDPz4spLve5GYehn+WR+VI
         +ityVHknYyH9Jca/viNKIWIigQdZ7T528wlagX2wzcQVckXrgkRrbPuRoOiYRxrInVdU
         UW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710843632; x=1711448432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL3EGbNhVw3JtUTld34AtoZby/9DY4UaNMDtaugQZHE=;
        b=XOrDPG/7DKAAfgLRlk9agXON7p1+p2Ozh3EuFb8oTgfGNT5MrkW52d/rsylzwNnNDl
         m8bJ4bsVg1qF2BybTe1dakatdF8wDqYp257GYJ/U/Vt0OOMlS7nzAFDAAaMJ1Wh91StL
         o5Z5+/95pPu4J1p3S/sufYrMlDNZhpEEvHqFbWdj0koazuSrvz3O4AQsvIxAoZ3KAgYL
         vsLgeVn5SmVJ38p4hXmV6YPOdwn3W+Vbx+3gffAkqauFBVMaI5fUpj5Utk6oPmzuGMH9
         CdEbIH1V5a4gzdupA43FiZjys+V6KGprNm9tNcMkWX41uJP3De71HfoCJHwoIGMjpQWt
         tx/g==
X-Gm-Message-State: AOJu0YyBvDrGjv9HkIkRclhBFXKyX2zQ+NGSw/wL+INVqMct+UVvnlPB
	4vWjfQUOIB2NCea2ceivKjbMH0Jyri/8QFAe1LIvka2sPH4nwMoWxDnywiLCX0E=
X-Google-Smtp-Source: AGHT+IGVGk/H1aT7F0MOr8+0o1ytVFNZ5mK4pp0hbrmu8U5f3VIEAqB/PjrEuaGzbfdxTTLcPEkOJw==
X-Received: by 2002:a4a:6f0b:0:b0:5a2:37c9:d91f with SMTP id h11-20020a4a6f0b000000b005a237c9d91fmr12704898ooc.5.1710843632056;
        Tue, 19 Mar 2024 03:20:32 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id dc4-20020a056820278400b005a4a656860bsm1040842oob.2.2024.03.19.03.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 03:20:31 -0700 (PDT)
Date: Tue, 19 Mar 2024 15:50:21 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Drew Fustini <drew@pdp7.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Message-ID: <Zflm5cje/+rnZ7HH@sunil-laptop>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
 <ZfiKooxO88h1nj35@x1>
 <Zfj4FnG5vAPP55ri@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zfj4FnG5vAPP55ri@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_032036_335878_610A43D8 
X-CRM114-Status: GOOD (  21.93  )
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

On Mon, Mar 18, 2024 at 07:27:34PM -0700, Drew Fustini wrote:
> On Mon, Mar 18, 2024 at 11:40:34AM -0700, Drew Fustini wrote:
> > On Thu, Feb 08, 2024 at 09:14:11AM +0530, Sunil V L wrote:
> > > This series enables the support for "Collaborative Processor Performance
> > > Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> > > encoding of CPPC registers as defined in RISC-V FFH spec [2].
> > > 
> > > CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> > > enable this, is available at [2].
> > > 
> > > [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> > > [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf
> > > 
> > > The series is based on the LPI support series.
> > > Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
> > > (https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)
> > 
> > Should the https://github.com/vlsunil/qemu/tree/lpi_exp branch also be
> > used for this CPPC series too?
> 
> I noticed the ventanamicro qemu repo has a dev-upstream branch [1] which
> contains 4bb6ba4d0fb9 ("riscv/virt: acpi: Enable CPPC - _CPC and _PSD").
> I've built that but I still see 'SBI CPPC extension NOT detected!!' in
> the Linux boot log.
> 
> I'm using upstream opensbi. It seems that sbi_cppc_probe() fails because
> cppc_dev is not set. Nothing in the upstream opensbi repo seems to call
> sbi_cppc_set_device(), so I am uncertain how it is possible for it to
> work. Is there an opensbi branch I should be using?
> 
> Thanks,
> Drew
> 
> [1] https://github.com/ventanamicro/qemu/tree/dev-upstream

Please use below branches for qemu and opensbi. These are just dummy
objects/interfaces added to test the kernel change which are otherwise
platform specific features.

https://github.com/vlsunil/qemu/tree/lpi_cppc_exp
https://github.com/vlsunil/opensbi/tree/cppc_exp

Regards
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
