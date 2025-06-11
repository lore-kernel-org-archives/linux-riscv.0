Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48DBC71135
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 02:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHSQ6aePccPENOnZjVIG4INSy+lqj0z6hmnr96Stl7Q=; b=rUSoAdfS4PWE7S
	CRHm7428F42Wqt/cmpthz/nYijsVIFunLyR7oKhV1Ka0VJopriSlxMYHqDMj22s3eW9WXdzwEYRcF
	vR1g6NTo8nb0TEzjPUJv8xMIBFYtvVHuUL3OtT0LkVMyGPs0hHGiKHvSte7cs9LLIAn27wcaGfcpG
	vxk/X83Oca7WIjMKucyBlwnKS0FAmhhofkw7IN/gNcY90N2w2arVbHczzrgprjuyOVIMYUPWUjznB
	U835iW2rVyU3aVc0ETBKdy5bnei7hP2XmkaXw/n4nlXVBlid2h0RbLm91W0DXhpncZQEcib2zN3g0
	W3WModvQvxnFrwFd7z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXuI-0000000BzVy-1RX6;
	Thu, 12 Jun 2025 02:43:10 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVF3-0000000Biyg-343d
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 23:52:27 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7485bcb8b7cso411130b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 16:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749685944; x=1750290744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds26m+OEVEHtTwY8L13PNjwlyxHGQ40Hrmpl5kY1WfM=;
        b=soJ5MvQitMz8V8Q8ME8D9qp2bph6LexSxnVkjvOsfke/ToXekhhSfPupQB8PfUNW80
         uKqFVNd3q31AApRDl1w2sC5cOOqOErfCxH9fjG+on6QjDrOj0i4eOH1f2Y4eBeiwT+6F
         6bdPzaimx8upRm/Y+XlgLWJTkCxAqaYKBnYsWBlo1OefZ7Hs320shULpd6beKBZX+HJ/
         Re7ugTCGqMqBhMjliaXDxzVowXRYYGJFJlMqdNCj0kY0IZ9TrBSt4762SUWq1Zd82/8/
         dSrJe4FA+FKraGaseZkFcBTsVAE0ruJ6Y00/BoP8cC8MvGF++g673OkaAMORf2se9PyD
         l/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685944; x=1750290744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds26m+OEVEHtTwY8L13PNjwlyxHGQ40Hrmpl5kY1WfM=;
        b=enFV5+CvgXFUWL6axI84cZBFYlysefswbNACUOC53mR8T0F9yXXUHP6MnSkREd3Kff
         8rY5mX1jSKeQh6BXZfpvyqwQ7Hzsdj8XPAag+6549E7nl8NKc23++9KYU7li9SOQjoDz
         Cz42CXfOAcAyoSy83WwbwJqvw+c5T0viyjx9llW7sePE8rVGFLD84dKvcAb/FF7M9ZqY
         BMWlk9eM4uBTCqdXIR9MuZSEnOnmf9qvvTRwrloZIT8RMPqoOMx2xeES3+6MsOicvMVr
         LtaZUb20rtl7UzojqtDbUC0KYDIy0v+7/I2ye2Gyt8UevW9PWhYbdo3a0xDexDeohrAr
         D3wg==
X-Forwarded-Encrypted: i=1; AJvYcCXTgJDt8m8GZsJ94ktuFRgs7FIRtogc5AbU4KQ8zI00mIKOYRAg3eVfcHj+5L7LD5S3lCYTocdSV6MNGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwglOPRIGk2meis9zv0eBk6k7+48HGvGbq1xRK8186ATU2cMnnR
	P7xrUfsv6uuU21Bd6qekitrs6ykU6/dm4ZL4TI17ke8WatXI8IRjLMp1HQhvwOW+8Xs=
X-Gm-Gg: ASbGncvVFhtKdpi6kHJ/T8Ogk/ssaCFABkt5xoDYUkzeDUq3Y7q7Ecu1mBZ+8mX6YJe
	5MXo6IVIJzfcSS3Akk98Z2jOi8MRJGXMhDNRtjI1QU/ACSKEjG4hvocIqocF0CG/rac/RvXLvJp
	jQTXptZ4HJbB/8okik/wh1DldIC3zEaT9WSYl91lRNokJL7EaKx4fKO9MJaiXGshAKN/+VPgtXJ
	ZghlR0b7qASc+OJGVH8KX6tmRQvuWCMWxoUSZWWRrJQaSLkCru8EB8g/gVWTZpnJ176jSIKNJTo
	Wt6pRV0ggTgwsTaBw23EPVKUgpbdMz2n1Y6JV7wt8Agq6BWgOAajE+haKtvedcftpIk+04aFRA=
	=
X-Google-Smtp-Source: AGHT+IFS+0RpPDsIJ7Pc4hAG+1bB0h9nua2v+kKuA7YHahR/7bpKq5ETyy2eU0pRRy9UZ+rORXm+hw==
X-Received: by 2002:a05:6a20:2587:b0:21f:53e4:1930 with SMTP id adf61e73a8af0-21f86725dfemr7771431637.22.1749685944426;
        Wed, 11 Jun 2025 16:52:24 -0700 (PDT)
Received: from x1 (97-120-245-201.ptld.qwest.net. [97.120.245.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd62a4e59sm121567a12.55.2025.06.11.16.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 16:52:24 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:52:22 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aEoWtviFl0vYATXe@x1>
References: <CGME20250610125330eucas1p2a573627ca8f124fe11e725c2d75bdcc9@eucas1p2.samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
 <aEifXZnLxKd2wa0w@x1>
 <6ca6016e-3b17-48a0-ad8d-bb05317aa100@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ca6016e-3b17-48a0-ad8d-bb05317aa100@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_165226_005646_5C5869F9 
X-CRM114-Status: GOOD (  39.74  )
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

On Wed, Jun 11, 2025 at 05:14:40PM +0200, Michal Wilczynski wrote:
> 
> 
> On 6/10/25 23:10, Drew Fustini wrote:
> > On Tue, Jun 10, 2025 at 02:52:48PM +0200, Michal Wilczynski wrote:
> >> This patch series introduces Rust support for the T-HEAD TH1520 PWM
> >> controller and demonstrates its use for fan control on the Sipeed Lichee
> >> Pi 4A board.
> >>
> >> The primary goal of this patch series is to introduce a basic set of
> >> Rust abstractions for the Linux PWM subsystem. As a first user and
> >> practical demonstration of these abstractions, the series also provides
> >> a functional PWM driver for the T-HEAD TH1520 SoC. This allows control
> >> of its PWM channels and ultimately enables temperature controlled fan
> >> support for the Lichee Pi 4A board. This work aims to explore the use of
> >> Rust for PWM drivers and lay a foundation for potential future
> >> Rust based PWM drivers.
> >>
> >> The core of this series is a new rust/kernel/pwm.rs module that provides
> >> abstractions for writing PWM chip provider drivers in Rust. This has
> >> been significantly reworked from v1 based on extensive feedback. The key
> >> features of the new abstraction layer include:
> >>
> >>  - Ownership and Lifetime Management: The pwm::Chip wrapper is managed
> >>    by ARef, correctly tying its lifetime to its embedded struct device
> >>    reference counter. Chip registration is handled by a pwm::Registration
> >>    RAII guard, which guarantees that pwmchip_add is always paired with
> >>    pwmchip_remove, preventing resource leaks.
> >>
> >>  - Modern and Safe API: The PwmOps trait is now based on the modern
> >>    waveform API (round_waveform_tohw, write_waveform, etc.) as recommended
> >>    by the subsystem maintainer. It is generic over a driver's
> >>    hardware specific data structure, moving all unsafe serialization logic
> >>    into the abstraction layer and allowing drivers to be written in 100%
> >>    safe Rust.
> >>
> >>  - Ergonomics: The API provides safe, idiomatic wrappers for other PWM
> >>    types (State, Args, Device, etc.) and uses standard kernel error
> >>    handling patterns.
> >>
> >> The series is structured as follows:
> >>  - Rust PWM Abstractions: The new safe abstraction layer.
> >>  - TH1520 PWM Driver: A new Rust driver for the TH1520 SoC, built on
> >>    top of the new abstractions.
> >>  - Clock Fix: A necessary fix to the TH1520 clock driver to ensure bus
> >>    clocks remain enabled.
> >>  - Device Tree Bindings & Nodes: The remaining patches add the necessary
> >>    DT bindings and nodes for the TH1520 PWM controller, a thermal
> >>    sensor, and the PWM fan configuration for the Lichee Pi 4A board.
> >>
> >> Testing:
> >> Tested on the TH1520 SoC. The fan works correctly. The duty/period
> >> calculaties are correct. Fan starts slow when the chip is not hot and
> >> gradually increases the speed when PVT reports higher temperatures.
> >>
> >> The patches are based on mainline, with some dependencies which are not
> >> merged yet - platform Io support [1] and math wrapper [2].
> >>
> >> Reference repository with all the patches together can be found on
> >> github [3].
> > 
> > I'm trying to build your rust-next-pwm-working-fan-for-sending-v4 branch
> > but I get this error:
> > 
> > $ make W=1 LLVM=1 ARCH=riscv -j16
> >   CALL    scripts/checksyscalls.sh
> > .pylintrc: warning: ignored by one of the .gitignore files
> >   UPD     include/generated/utsversion.h
> >   CC      init/version-timestamp.o
> >   KSYMS   .tmp_vmlinux0.kallsyms.S
> >   AS      .tmp_vmlinux0.kallsyms.o
> >   LD      .tmp_vmlinux1
> > ld.lld: error: undefined symbol: rust_build_error
> >     referenced by pwm_th1520.4789668fc0b4e501-cgu.0
> >                   drivers/pwm/pwm_th1520.o:(<pwm_th1520::Th1520PwmDriverData as kernel::pwm::PwmOps>::get_state) in archive vmlinux.a
> >     referenced by pwm_th1520.4789668fc0b4e501-cgu.0
> >                   drivers/pwm/pwm_th1520.o:(<pwm_th1520::Th1520PwmDriverData as kernel::pwm::PwmOps>::write_waveform) in archive vmlinux.a
> >     referenced by pwm_th1520.4789668fc0b4e501-cgu.0
> >                   drivers/pwm/pwm_th1520.o:(<pwm_th1520::Th1520PwmDriverData as kernel::pwm::PwmOps>::write_waveform) in archive vmlinux.a
> > make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
> > make[1]: *** [/home/pdp7/linux/Makefile:1241: vmlinux] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> 
> Hi,
> 
> Thanks for testing !
> I can reproduce the issue with your config.
> 
> The root of the problem was a failing compile time assertion
> (build_assert!) in the underlying Rust abstracions, I think IoMem since
> get_state and write_waveform functions are impacted. My development
> configuration was accidentally hiding this issue, but your configuration
> correctly exposed it.
> 
> The kernel config option that is different on my setup is:
> CONFIG_RUST_BUILD_ASSERT_ALLOW=y

Thanks for the explanation. I wanted to see how far I could get so I
also have set CONFIG_RUST_BUILD_ASSERT_ALLOW=y for now.

I also enabled the pwm fan driver. However, there is a probe failure:

[    1.250921] pwm-fan pwm-fan: Failed to configure PWM: -524
[    1.256546] pwm-fan pwm-fan: probe with driver pwm-fan failed with error -524

This seems to be the result `set_pwm(ctx, initial_pwm)` failing.

It seems like the TH1520 PWM driver loaded okay:

# cat /sys/class/pwm/pwmchip0/npwm 
6
# ls -l /sys/class/pwm/pwmchip0/device
lrwxrwxrwx 1 root root 0 Jun 12 07:37 /sys/class/pwm/pwmchip0/device -> ../../../ffec01c000.pwm
# ls -l /sys/class/pwm/pwmchip0/device/driver
lrwxrwxrwx 1 root root 0 Feb 28  2023 /sys/class/pwm/pwmchip0/device/driver -> ../../../../bus/platform/drivers/pwm-th1520

I'm using your mwilczy/rust-next-pwm-working-fan-for-sending-v4 branch:

7ec07c93dbac riscv: dts: thead: Add PWM fan and thermal control
c8a6138b2a13 riscv: dts: thead: Add PVT node
14e2f1bfd26b riscv: dts: thead: Add PWM controller node
afe06057030e dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM controller
fe75d1ab60c9 clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED
47dc6a551376 pwm: Add Rust driver for T-HEAD TH1520 SoC
9370bdd31cdc rust: Add basic PWM abstractions
f077d5bf0be8 Rust Abstractions for PWM subsystem with TH1520 PWM driver
f153d0d0221f rust: math: Add KernelMathExt trait with a mul_div helper
51c4a2e7d48a Fix for Device<Bound>
4847fa4f7ac8 rust: platform: allow ioremap of platform resources
929c56df82e5 rust: io: mem: add a generic iomem abstraction
09dfabb4677c rust: io: add resource abstraction

I uploaded the kconfig [1] and boot log [2]. Any ideas?

Thanks,
Drew

[1] https://gist.github.com/pdp7/58ca1f543898daeb281c013facb79aed
[2] https://gist.github.com/pdp7/e263b1b928a17d499f94fa5be7b3a7f8

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
