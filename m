Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3980FC54ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 22:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j68By6inwFdwLZV6uBMVVXDQFCYQhcBiD6dTDfD+8I0=; b=VQTeEhhgMjoR/U
	uk3+nEVRulDEeFNvLCssRJE6YAG436gjCyi+38dzm18V65w/F4uElBQbZx3pKGtfKRm+SBDgjXBPT
	BathiFPdBDuPHgNyQwWqnb6ufEtyGFlD9jd0sHZgFk5fsX8YONSrnxPschDlZYwhQUwOf8Ege2/za
	VoctVDSkU0fIf5kOcWiSIVQ7vRG2QteYoojVZjw/5knpQx8XStbCEd2cfwHfSR88alIV88FH36D3A
	afavjlkxOR83vQqGeHbiBgk9H6fjOk8P3eogoSZoBNHgmBFdqm5QEVDmqkOgHZYIeyIydL/4VJqq/
	Zwguk4NS8R29il1HjIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIxFf-00000006Kev-2xNs;
	Sat, 24 May 2025 22:21:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIxFd-00000006KeY-0w7B
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 22:21:58 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74019695377so704768b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 15:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748125316; x=1748730116; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/gfY91nGDE+0RHxKKLvxKyOlcgQwxa07VE2VttyjsQ=;
        b=TWvxW5QsTCsMrOv+hKs9eqEMybtesICo7vZFtr7qL5YbrHQZXaANx0Ioza87k7i83h
         uytD4KKEcogu0bQ8aGOh3pvsnGOxQi/lZCPEmK11UnGTDgcd5Cz7obCHHeow4sUw1N0o
         6C89/Bpco12/u36mbKDpSwKGK7XLhNewCVehbRtXj40gwC30g9dNyI9EPT3Jcxu2j3iT
         mpXPOptc1mEd+ZhXbWPOs+DJe1TwjceUAOO4/WT1lnLMnlo83nwh1qbZ9hzWQr66Yu3s
         lYtg/yGmO4/TcaF3+xCisiFbYX+oIQRXdBD0f+WNd+j+LwlSr6zLNWTKdlkPs0autr+U
         /w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748125316; x=1748730116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/gfY91nGDE+0RHxKKLvxKyOlcgQwxa07VE2VttyjsQ=;
        b=lFLD5VD6S7P32heotPVTt1Z7VOeCvmM9uQirhEk+7WEIUPBdLX2jzJQ9H8bbbPPDRH
         wmBDiVbALxnyQmrKSnJpPjfgE5Nzx/BVyYdnpHMmGU7aN7fFcLtoaMGcecnFzYz2sGOG
         PNn68MJWq5pKr8HwaheLDbkbdgQQm1PComcpwGYj0mWMNh5ThjCe4DYp9ZqRMm79R4lS
         ojztzyI+Gl8PsXylaQ5sEkWQSCcP6dsDh3ywgf6VyK2e0IFulboX3kbGFsSln+s4YQKl
         lXGE6dWkFlzTBf/yDrscQnXwyUw8qWL9UoLub1tvW9J/MOmbAR+rtZyYpVMfCFiB6qyt
         L33g==
X-Forwarded-Encrypted: i=1; AJvYcCWgcxif6o2yGJVePVxFs0EsxGrfmlpadiatbBiXaWK6F/z3VZEsCXojxHGQ/PbJYUQpbayC16eIwsoEsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuwXnK73DLthyKWaGxkS3VuJWKaEUWkLF5LtlwHx5bb/jG+Vpe
	aEC60LMxhAAz35h53gXOT1g2hRhvTZpH8lW3fMKGizrIBD86D5YkXaUiESWRshBZ
X-Gm-Gg: ASbGncsTA9EihUxvc/wiUxEUlhJdSzSj3WINl8yx0gJ44BPA3kG+YKU1Vx+du02rSh3
	q6vV8oZ79dYKs5JPRKFha4uYAJ+70ctMuvGRf24VW31h1uhDvxL9uR5VDh0W7MTpZeT02psC5Ai
	smq24K6EK/GgRhgxzTB6OXIaVATkNvA3LRP5XkucV9KpJ44TNtkIAd1NhSzeKDfhL0iGxWNBWBo
	jVx7tYFxTWfOMIFsMpZjnZyY3yiiQ6/bQRrYHg6mN771Qlo4nbC9AeILJr0hGGFhW/yFNR4dZHZ
	FXJ+7+Lhyq5nXV/jAbLhBOQ7DnVTtDvKVhTj3ac4Jm6dWoyRF1b0agCu6xdXAvy70bmrXw==
X-Google-Smtp-Source: AGHT+IHEUxETV0pocM5atEPYdJlqffDPIUlgr2gOFmaZoXDKfwNisfSk+PUUDevzM5Z0StSlaes5OQ==
X-Received: by 2002:a05:6a00:3d15:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-745fe083538mr7389041b3a.18.1748125315849;
        Sat, 24 May 2025 15:21:55 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829b9dsm14653654b3a.88.2025.05.24.15.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 15:21:54 -0700 (PDT)
Date: Sat, 24 May 2025 15:21:52 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aDJGgLZ9tITwGBxq@x1>
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_152157_266023_79DC1361 
X-CRM114-Status: GOOD (  24.97  )
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

On Sat, May 24, 2025 at 11:14:54PM +0200, Michal Wilczynski wrote:
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
> The series is structured as follows:
> 
> Patch 1/6: Introduce basic PWM abstractions
> This patch lays the groundwork by adding a Kconfig option for Rust PWM
> abstractions, necessary C helper functions, and a new Rust module
> (rust/kernel/pwm.rs). This module provides initial safe wrappers for
> core PWM data structures (Chip, Device, State, Args, Polarity) and
> functions (devm_chip_alloc, devm_chip_add), along with a basic PwmOps
> trait focusing on the .apply callback needed by PWM chip providers.
> 
> Patch 2/6: Add PWM driver for TH1520 SoC
> This introduces the Rust based PWM driver for the T-HEAD TH1520 SoC.
> It implements the PwmOps trait using the abstractions from the first
> patch and handles the specifics of the TH1520 hardware for configuring
> period, duty cycle, and polarity. Resource management leverages devm
> for the PWM chip and Rust DevRes for I/O memory, and RAII for clock
> handling.
> 
> Patch 3/6: dt-bindings: Add PWM T-HEAD controller dt-binding
> This patch adds the Device Tree binding documentation for the T-HEAD
> TH1520 PWM controller.
> 
> Patch 4/6: riscv: dts: thead:: Add PWM controller node
> This patch adds the actual Device Tree node for the TH1520 PWM controller.
> 
> Patch 5/6: riscv: dts: thead: Add PVT node
> Add pvt node for thermal sensor.
> 
> Patch 6/6: riscv: dts: thead: Add PWM fan and thermal control
> This final patch adds the Device Tree configuration for a PWM controlled
> fan to the Sipeed Lichee Pi 4A board DTS file. 
> 
> Testing:
> Tested on the TH1520 SoC. The fan works correctly.
> 
> Points for Discussion:
> The rust/kernel/pwm.rs abstraction layer is currently minimal,
> focusing on the immediate needs of this driver. Feedback on its design,
> scope, and potential for generalization would be highly appreciated.
> General feedback on the Rust implementation, FFI wrapping patterns, and
> adherence to kernel development practices is very welcome.
> 
> The patches are based on rust-next, with some dependencies which are not
> merged yet - platform Io support [1] and clk abstractions [2]. 
> 
> Reference repository with all the patches together can be found on
> github [3].
> 
> [1] - https://lore.kernel.org/rust-for-linux/20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com/
> [2] - https://lore.kernel.org/rust-for-linux/0ec0250c1170a8a6efb2db7a6cb49ae974d7ce05.1747634382.git.viresh.kumar@linaro.org/ 
> [3] - https://github.com/mwilczy/linux/commits/rust-next-pwm-working-fan-for-sending/

Thanks for the patch series. It will be great to have PWM working
upstream.

I've not built Linux with Rust before, so I'm going through the quick
start [1]. I've also never built Linux with LLVM before but clang seems
like the best compiler to use for Rust. Are you using LLVM?

Drew

[1] https://docs.kernel.org/rust/quick-start.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
