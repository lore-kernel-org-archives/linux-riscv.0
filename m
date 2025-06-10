Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66455C677C4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0E5m8CxmlSr+OdvsPgDXDlrv5XPYgcvRzgRyI7amRw=; b=vLWtrYu5euyyU+
	QyKLQxuPpXsvQZIvbN7gbVImOP3XAeZfc8naPyrngmMSoea2kJZefZ/uShP8yyckI8iHL2oymvpUs
	5iMTqP22fddcvKvr8+jr6ViviQSMB+gkdNzUDbIP4N4KlU+VtT8wtRWENeaKvkFd11PG12YSaqVQD
	Rmuq9K3TfpYl3WBdypRolBqAaWpI99fKI026o5Urxtmt2nJ/8J9A/8xjjbY7Ec4Euw7Fcxb0rl6Q3
	zH8+c8mcF+PRgZDQcvjNaT+pD7Ec4CnIUqVTndsu08lSeobwAGUY70iXCa08HAImr+0LELFMCY6Z7
	69H9OOxW5slO9OnonKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nd-00000008Isu-3BOz;
	Tue, 10 Jun 2025 22:50:33 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6FE-000000085Rb-2vYQ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 21:10:57 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7486ca9d396so263728b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 14:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749589856; x=1750194656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6z/2eKNf3fRnG2uPVmiQPHVorfwCzVQ+3VGe9Xlb1rw=;
        b=XoGLCTbArGw6bt9EqslAeEdgT3wnm9H9UAmc0jOdWzmuLNazyu938PJrqmiynS+NeW
         nYtDBKJ1uUQ9g5qt2yxud6s37ip5bfoT4rbX7hhjqOlNr8mtu269DGTdpWj2M6WjItC4
         bTfKsIzFKNNJyMupWPpcH7BGKIU/e4jDRkEjuXawsfTAi8tl1FpR1Ryk/5SqdHz5oBra
         O6gwtdztBfkeT5h8ie9wdmBe3LVST3vsZbcLm14untN2V0d7YVS4jy2H5joG9fgq7hc5
         0k6SdBHheGyBoIbaa/DIc2jgdguXZl9SLmu1qzM+AA3FDo96oo8U7J9N0I/wl5RzfSKc
         p1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749589856; x=1750194656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6z/2eKNf3fRnG2uPVmiQPHVorfwCzVQ+3VGe9Xlb1rw=;
        b=tdl5exVWj2c0DgbmUaEDFEWoYfP0q3pPx+Vw2quFUEPfzgCvLTGEm2DuUkmvHYtbKV
         /w8SeiNPmXIanilJCXw2BHenCAtN42rvyJ61LseVzD6bj5g1LWfMryCnlWQC9WmMuJv7
         aW39C1btUrfIXena8FsHLtT67LLe178B7N8j9s9QsaBn4SFSCl08XuYgSnsCWVIO+W1S
         6XeY5itldsaTOUj0oX0MDAKH8/5r0BnVtDXuLzwbfKYC6EnYxlR7oHnHgG99r2gzxd5z
         9XXtJTZCU6UbG6GINilxVAFThFa8fRXKnT0ClPxcTn0uPE8tj3tGZVcb2215Sbn/epHV
         xoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOCbryoITd5IHuymEj2NFN1dAxFitd7tj4b15i67vGuj+8aQQSNxmBLfUjlNFol2/mMOPqkyayDZl25w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhqC7A/s1P6fCXVjIhm+fiXMeMLT/NduFwaAGJ7ak4zxjbooba
	GZhhUCAH9EpVYKKdgfefXaduTYpFZlpEQ179N06BXjPNSRpDyKTTh3MQN821ml9UYEg=
X-Gm-Gg: ASbGncvtR7CRQJ+jQXmOqHThZJ2O8bZuh1cves/AX/LWxkVeWagvfKvdCQ4y2LzLqbD
	tNo3S6FsPMuoLGDo+eibFcmyLONqAKzgWwt7M9IPtVZdn3FVpq44+6h1F0vl2qEk39vGSypYewL
	ddEkHlGumHEjPkypg/WN4mAo7mCha+KlvjcgxrBUzQInV+3uuLCiP0XKM3lfjVjERYdLVg9nzKp
	YA2asqA15mwPar0ZlQOew+dyZSGa5GEcxcb25MBZ+/sIWhcUOt9wSxi8pOX0Zk66ZJOz5nc6Qgv
	9vY7jvkRZUpu0eAgWn1Khl6FRg0riG0xV233yWxWfGHN0PN9LuxNOpMM0mW/v8XL0b1hneR5Sw=
	=
X-Google-Smtp-Source: AGHT+IEwLiXrZcnfbq3Tv7L10VDTAaWuwBouaxEsiIQvsla3HLyJ0NW+H5r5c64jx5IdZukdlDUpIQ==
X-Received: by 2002:a05:6a00:23c8:b0:742:a334:466a with SMTP id d2e1a72fcca58-7486cbd86f3mr1332331b3a.12.1749589855939;
        Tue, 10 Jun 2025 14:10:55 -0700 (PDT)
Received: from x1 (97-120-245-201.ptld.qwest.net. [97.120.245.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083ac7sm7858957b3a.82.2025.06.10.14.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:10:55 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:10:53 -0700
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
Message-ID: <aEifXZnLxKd2wa0w@x1>
References: <CGME20250610125330eucas1p2a573627ca8f124fe11e725c2d75bdcc9@eucas1p2.samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_141056_740863_4FEEB924 
X-CRM114-Status: GOOD (  26.94  )
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

On Tue, Jun 10, 2025 at 02:52:48PM +0200, Michal Wilczynski wrote:
> This patch series introduces Rust support for the T-HEAD TH1520 PWM
> controller and demonstrates its use for fan control on the Sipeed Lichee
> Pi 4A board.
> 
> The primary goal of this patch series is to introduce a basic set of
> Rust abstractions for the Linux PWM subsystem. As a first user and
> practical demonstration of these abstractions, the series also provides
> a functional PWM driver for the T-HEAD TH1520 SoC. This allows control
> of its PWM channels and ultimately enables temperature controlled fan
> support for the Lichee Pi 4A board. This work aims to explore the use of
> Rust for PWM drivers and lay a foundation for potential future
> Rust based PWM drivers.
> 
> The core of this series is a new rust/kernel/pwm.rs module that provides
> abstractions for writing PWM chip provider drivers in Rust. This has
> been significantly reworked from v1 based on extensive feedback. The key
> features of the new abstraction layer include:
> 
>  - Ownership and Lifetime Management: The pwm::Chip wrapper is managed
>    by ARef, correctly tying its lifetime to its embedded struct device
>    reference counter. Chip registration is handled by a pwm::Registration
>    RAII guard, which guarantees that pwmchip_add is always paired with
>    pwmchip_remove, preventing resource leaks.
> 
>  - Modern and Safe API: The PwmOps trait is now based on the modern
>    waveform API (round_waveform_tohw, write_waveform, etc.) as recommended
>    by the subsystem maintainer. It is generic over a driver's
>    hardware specific data structure, moving all unsafe serialization logic
>    into the abstraction layer and allowing drivers to be written in 100%
>    safe Rust.
> 
>  - Ergonomics: The API provides safe, idiomatic wrappers for other PWM
>    types (State, Args, Device, etc.) and uses standard kernel error
>    handling patterns.
> 
> The series is structured as follows:
>  - Rust PWM Abstractions: The new safe abstraction layer.
>  - TH1520 PWM Driver: A new Rust driver for the TH1520 SoC, built on
>    top of the new abstractions.
>  - Clock Fix: A necessary fix to the TH1520 clock driver to ensure bus
>    clocks remain enabled.
>  - Device Tree Bindings & Nodes: The remaining patches add the necessary
>    DT bindings and nodes for the TH1520 PWM controller, a thermal
>    sensor, and the PWM fan configuration for the Lichee Pi 4A board.
> 
> Testing:
> Tested on the TH1520 SoC. The fan works correctly. The duty/period
> calculaties are correct. Fan starts slow when the chip is not hot and
> gradually increases the speed when PVT reports higher temperatures.
> 
> The patches are based on mainline, with some dependencies which are not
> merged yet - platform Io support [1] and math wrapper [2].
> 
> Reference repository with all the patches together can be found on
> github [3].

I'm trying to build your rust-next-pwm-working-fan-for-sending-v4 branch
but I get this error:

$ make W=1 LLVM=1 ARCH=riscv -j16
  CALL    scripts/checksyscalls.sh
.pylintrc: warning: ignored by one of the .gitignore files
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  KSYMS   .tmp_vmlinux0.kallsyms.S
  AS      .tmp_vmlinux0.kallsyms.o
  LD      .tmp_vmlinux1
ld.lld: error: undefined symbol: rust_build_error
    referenced by pwm_th1520.4789668fc0b4e501-cgu.0
                  drivers/pwm/pwm_th1520.o:(<pwm_th1520::Th1520PwmDriverData as kernel::pwm::PwmOps>::get_state) in archive vmlinux.a
    referenced by pwm_th1520.4789668fc0b4e501-cgu.0
                  drivers/pwm/pwm_th1520.o:(<pwm_th1520::Th1520PwmDriverData as kernel::pwm::PwmOps>::write_waveform) in archive vmlinux.a
    referenced by pwm_th1520.4789668fc0b4e501-cgu.0
                  drivers/pwm/pwm_th1520.o:(<pwm_th1520::Th1520PwmDriverData as kernel::pwm::PwmOps>::write_waveform) in archive vmlinux.a
make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
make[1]: *** [/home/pdp7/linux/Makefile:1241: vmlinux] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I've uploaded the config to:
https://gist.github.com/pdp7/e2c34dd7e4349a54bd67b53254bd3a22

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
