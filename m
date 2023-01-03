Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA49C5479D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 20:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9z66314SImNJUalrMX85oL/OWgvGKazpSAdJFQFuSw=; b=zUnyKU43r7rBSH
	w0VM9jBTY1gEJ8ykVZXrYGwlODFwPe8k64QGhmNKW/4HRbSJwneS9s0HJvP++CLjW6wmdeeCPVK7p
	9wnn30wzd5hG0pmOfyJWM9ZQn7lCVWF64BBNEzkhDPYSfWtSXagIZtoIw+UwFCpwfM5B8SfIJjWeJ
	Ulvr5+mMUCrxDoIeOSMQgXb9mpArbmDp86o0TtLxQ97TU3qkk8AEz0COsIqtT8SwtO3MZNnESz3h9
	fvz8nFtYhbqITnpvRA5yao5TqRQd2fVihKcJl8rhSDUkNWiV1s+DtyXfcRWRPxIv9JDpiEQItNjHx
	4xOE48b9tw34gka2Y4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCoLN-004vJT-78; Tue, 03 Jan 2023 20:57:09 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCoHN-004tqo-2p; Tue, 03 Jan 2023 20:53:07 +0000
Received: by mail-il1-f170.google.com with SMTP id u8so11061561ilg.0;
        Tue, 03 Jan 2023 12:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcjxuWhsew0S4JMMZ0LVIr9mYr0ZItiOrBsIyKBjzxA=;
        b=z7Cvu0u6TNlvLWjhb1P9Nswzdcd8hk2JQE2NKV2auwmIhgZarrhqjG+iaBrqP6017R
         3PW1kVDv5Fe0u658BAI2aTPxRjaxn6AAl/rfr4cADXOfZuicGSmJPI27fbthIfdMGT9V
         CIxr1gWnMmWaC2A+6p6S/xNcDM+QAHKClhfimLYbB1P7+fWcnVpDbPxtJ5iWLOCL2r8l
         UJQYsr2yhgkBiy4EfZwW+jc/B6GsnWMCjfOP1OxRyoVQxLQDYraeMvQlt1ypdorBWEi+
         AcqBb2zQUgK7NLJU2dvqk/Xt8x1sKwAsUDec+sN2uNsgjFvVab+sY2RRMdmBC9RsWxNj
         ehKA==
X-Gm-Message-State: AFqh2koschwPshpAQKBrcLYyBuq6jZhtcWVIM+EC40BbFlAswo7oiVyG
	XpPp+OLn6w5e1dEDXYuNYg==
X-Google-Smtp-Source: AMrXdXs7CLCkBhA2bAs8+otIJJ87HLmOu2iBxk7dmL/ZdUhdNLgBmJbpCAkIQKJL5QLEGLa5kGxn6A==
X-Received: by 2002:a05:6e02:549:b0:306:d1b4:f3c7 with SMTP id i9-20020a056e02054900b00306d1b4f3c7mr25689876ils.20.1672779176867;
        Tue, 03 Jan 2023 12:52:56 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c24-20020a023b18000000b00388b6508ec8sm9836486jaa.115.2023.01.03.12.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 12:52:56 -0800 (PST)
Received: (nullmailer pid 3961459 invoked by uid 1000);
	Tue, 03 Jan 2023 20:52:50 -0000
Date: Tue, 3 Jan 2023 14:52:50 -0600
From: Rob Herring <robh@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	bpf@vger.kernel.org, Christian Brauner <brauner@kernel.org>, devicetree@vger.kernel.org, 
	Eric Biederman <ebiederm@xmission.com>, Eric Paris <eparis@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Jason Baron <jbaron@akamai.com>, Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Kieran Bingham <kbingham@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-audit@redhat.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nick Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Moore <paul@paul-moore.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sebastian Reichel <sre@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	Alex Michon <amichon@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, 
	Benjamin Mugnier <mugnier.benjamin@gmail.com>, Clement Leger <clement.leger@bootlin.com>, 
	Guillaume Missonnier <gmissonnier@kalray.eu>, Guillaume Thouvenin <gthouvenin@kalray.eu>, 
	Jean-Christophe Pince <jcpince@gmail.com>, Jonathan Borne <jborne@kalray.eu>, 
	Jules Maselbas <jmaselbas@kalray.eu>, Julian Vetter <jvetter@kalray.eu>, 
	Julien Hascoet <jhascoet@kalray.eu>, Julien Villette <jvillette@kalray.eu>, 
	Louis Morhet <lmorhet@kalray.eu>, Luc Michel <lmichel@kalray.eu>, =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>, 
	Marius Gligor <mgligor@kalray.eu>, Samuel Jones <sjones@kalray.eu>, Thomas Costis <tcostis@kalray.eu>, 
	Vincent Chardon <vincent.chardon@elsys-design.com>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
Message-ID: <20230103205250.GB3942221-robh@kernel.org>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103164359.24347-1-ysionneau@kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_125301_254556_769876AF 
X-CRM114-Status: GOOD (  28.57  )
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

On Tue, Jan 03, 2023 at 05:43:34PM +0100, Yann Sionneau wrote:
> This patch series adds support for the kv3-1 CPU architecture of the kvx family
> found in the Coolidge (aka MPPA3-80) SoC of Kalray.
> 
> This is an RFC, since kvx support is not yet upstreamed into gcc/binutils,
> therefore this patch series cannot be merged into Linux for now.
> 
> The goal is to have preliminary reviews and to fix problems early.
> 
> The Kalray VLIW processor family (kvx) has the following features:
> * 32/64 bits execution mode
> * 6-issue VLIW architecture
> * 64 x 64bits general purpose registers
> * SIMD instructions
> * little-endian
> * deep learning co-processor
> 
> Kalray kv3-1 core which is the third of the kvx family is embedded in Kalray
> Coolidge SoC currently used on K200 and K200-LP boards.
> 
> The Coolidge SoC contains 5 clusters each of which is made of:
> * 4MiB of on-chip memory (SMEM)
> * 1 dedicated safety/security core (kv3-1 core).
> * 16 PEs (Processing Elements) (kv3-1 cores).
> * 16 Co-processors (one per PE)
> * 2 Crypto accelerators
> 
> The Coolidge SoC contains the following features:
> * 5 Clusters
> * 2 100G Ethernet controllers
> * 8 PCIe GEN4 controllers (Root Complex and Endpoint capable)
> * 2 USB 2.0 controllers
> * 1 Octal SPI-NOR flash controller
> * 1 eMMC controller
> * 3 Quad SPI controllers
> * 6 UART
> * 5 I2C controllers (3 of which are SMBus capable)
> * 4 CAN controllers
> * 1 OTP memory
> 
> A kvx toolchain can be built using:
> # install dependencies: texinfo bison flex libgmp-dev libmpc-dev libmpfr-dev
> $ git clone https://github.com/kalray/build-scripts
> $ cd build-scripts
> $ source last.refs
> $ ./build-kvx-xgcc.sh output
> 
> The kvx toolchain will be installed in the "output" directory.
> 
> A buildroot image (kernel+rootfs) and toolchain can be built using:
> $ git clone -b coolidge-for-upstream https://github.com/kalray/buildroot
> $ cd buildroot
> $ make O=build_kvx kvx_defconfig
> $ make O=build_kvx
> 
> The vmlinux image can be found in buildroot/build_kvx/images/vmlinux.
> 
> If you are just interested in building the Linux kernel with no rootfs you can
> just do this with the kvx-elf- toolchain:
> $ make ARCH=kvx O=build_kvx CROSS_COMPILE=kvx-elf- default_defconfig
> $ make ARCH=kvx O=build_kvx CROSS_COMPILE=kvx-elf- -j$(($(nproc) + 1))
> 
> The vmlinux ELF can be run with qemu by doing:
> # install dependencies: ninja pkg-config libglib-2.0-dev cmake libfdt-dev libpixman-1-dev zlib1g-dev
> $ git clone https://github.com/kalray/qemu-builder
> $ cd qemu-builder
> $ git submodule update --init
> $ make -j$(($(nproc) + 1))
> $ ./qemu-system-kvx -m 1024 -nographic -kernel <path/to/vmlinux>
> 
> Yann Sionneau (25):
>   Documentation: kvx: Add basic documentation
>   kvx: Add ELF-related definitions
>   kvx: Add build infrastructure
>   kvx: Add CPU definition headers
>   kvx: Add atomic/locking headers
>   kvx: Add other common headers
>   kvx: Add boot and setup routines
>   kvx: Add exception/interrupt handling
>   kvx: irqchip: Add support for irq controllers
>   kvx: Add process management
>   kvx: Add memory management
>   kvx: Add system call support
>   kvx: Add signal handling support
>   kvx: Add ELF relocations and module support
>   kvx: Add misc common routines
>   kvx: Add some library functions
>   kvx: Add multi-processor (SMP) support
>   kvx: Add kvx default config file
>   kvx: power: scall poweroff driver
>   kvx: gdb: add kvx related gdb helpers
>   kvx: Add support for ftrace
>   kvx: Add support for jump labels
>   kvx: Add debugging related support
>   kvx: Add support for CPU Perf Monitors
>   kvx: Add support for cpuinfo

You should strip this series down to just what's needed to boot. You 
don't need the last 7 patches at least.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
