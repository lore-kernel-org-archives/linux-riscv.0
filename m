Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69034C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 22:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7K9vu1t1A51yv7Jf11Kh/tPiMJ/iptpg+rMakX3YNuo=; b=hR97s/2TkSuQb1
	Esid6TGOkJ3FDpK8/wew/gdS5olIAs1hVpS72K3EAmcOgPz3h2o3evhl+tHNZNXn2HeOt49jpx/qX
	3OL+DRPt49ID8Z1wrjsjTJ94vL/7NPuRHkpuTMP3KExYuNx75NaZVLqBCbzgYkiXrygZ5pVAR/r1d
	ZhXdIBla46mb6lbsvZOAOmB5wlEgHjc1rEVxGNg1P6LqVzHwRnzArbG94s/TklcRlY6chI9ue6YP2
	w1qANEkgSG4+fd/zEa4Km9mFcVDxukoNUtsA2rRr2rxYE0pU4v09NT9gI6T5p/I9V6FdzYlVWX0qk
	IjIZk6zCfUhW70qzmehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPA3i-00A4Jm-6N; Mon, 06 Feb 2023 22:33:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPA3e-00A4J7-I7
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 22:33:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBD5161059;
	Mon,  6 Feb 2023 22:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFCEC433D2;
	Mon,  6 Feb 2023 22:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675722833;
	bh=ZA9Xx8DGms3yzuK80v5ou07FlZ01ez04TS8bPZTxAME=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=NdIUTcxsYPskCQ2Yy5lKrRaQ0IA7bSuVGirD7ueo3QUjTxMTCyebwE67MBan0Va/p
	 YmVwDBFj3OC4D6K10etyu7IXq0SKoUZa8QUPQxpf47qq4/kAqunZ0yFmhcvjbiHz+z
	 tuuko9d4wphr3BTuPZEN046j9OiOkAsAuioHMQR+NGSe4XyVoX7qUQgNFXyHEoHCzR
	 HmT6LEvYy6GvRj43M1XgD0jYDWevOUEFT8+Qs0iZDVO1HwcES8hykWO1Zc5GBDpv8C
	 fYaCv8Rcv2sdVoHsMGw7VGQrCLyjUhmfEOdyOk2Fg7IwANunOIqAyXDjjeznMgj9ix
	 9N9rZUMD2Ke8A==
Date: Mon, 06 Feb 2023 22:32:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2 0/6] RISC-V Hardware Probing User Interface
User-Agent: K-9 Mail for Android
In-Reply-To: <20230206201455.1790329-1-evan@rivosinc.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
Message-ID: <9E71182A-BEE9-4A0D-9AF5-783F6689B90E@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_143354_722576_4AA01A54 
X-CRM114-Status: GOOD (  38.17  )
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
Cc: heiko@sntech.de, Jisheng Zhang <jszhang@kernel.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, Bagas Sanjaya <bagasdotme@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, linux-kselftest@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, slewis@rivosinc.com, dram <dramforever@live.com>, Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey Evan,
Having been talking to Palmer about this series at FOSDEM,
it was a very pleasant surprise to see this when I saw this in my inbox when I landed back home.
I do very much intend reviewing this, but... 

On 6 February 2023 20:14:49 GMT, Evan Green <evan@rivosinc.com> wrote:
>
>These are very much up for discussion, as it's a pretty big new user
>interface and it's quite a bit different from how we've historically
>done things: this isn't just providing an ISA string to userspace, this
>has its own format for providing information to userspace.
>
>There's been a bunch of off-list discussions about this, including at
>Plumbers.  The original plan was to do something involving providing an
>ISA string to userspace, but ISA strings just aren't sufficient for a
>stable ABI any more: in order to parse an ISA string users need the
>version of the specifications that the string is written to, the version
>of each extension (sometimes at a finer granularity than the RISC-V
>releases/versions encode), and the expected use case for the ISA string
>(ie, is it a U-mode or M-mode string).  That's a lot of complexity to
>try and keep ABI compatible and it's probably going to continue to grow,
>as even if there's no more complexity in the specifications we'll have
>to deal with the various ISA string parsing oddities that end up all
>over userspace.
>
>Instead this patch set takes a very different approach and provides a set
>of key/value pairs that encode various bits about the system.  The big
>advantage here is that we can clearly define what these mean so we can
>ensure ABI stability, but it also allows us to encode information that's
>unlikely to ever appear in an ISA string (see the misaligned access
>performance, for example).  The resulting interface looks a lot like
>what arm64 and x86 do, and will hopefully fit well into something like
>ACPI in the future.
>
>The actual user interface is a syscall.  I'm not really sure that's the
>right way to go about this, but it makes for flexible prototying.
>Various other approaches have been talked about like making HWCAP2 a
>pointer, having a VDSO routine, or exposing this via sysfs.  Those seem
>like generally reasonable approaches, but I've yet to figure out a way

This all looks to be the same cover message as Palmer submitted with the v1,
so, as I'd mentioned to him the other day, I'd like to do a bit
of an investigation into the sysfs approach drew suggested
on the v1.
So, if it's a little bit before you hear - I've certainly not forgotten about the series!

Thanks,
Conor.

>to get the general case working without a syscall as that's the only way
>I've come up with to deal with the heterogenous CPU case.  Happy to hear
>if someone has a better idea, though, as I don't really want to add a
>syscall if we can avoid it.
>
>An example series in glibc exposing this syscall and using it in an
>ifunc selector for memcpy can be found at [1].
>
>[1] https://public-inbox.org/libc-alpha/20230206194819.1679472-1-evan@rivosinc.com/T/#t
>
>Changes in v2:
> - Changed the interface to look more like poll(). Rather than supplying
>   key_offset and getting back an array of values with numerically
>   contiguous keys, have the user pre-fill the key members of the array,
>   and the kernel will fill in the corresponding values. For any key it
>   doesn't recognize, it will set the key of that element to -1. This
>   allows usermode to quickly ask for exactly the elements it cares
>   about, and not get bogged down in a back and forth about newer keys
>   that older kernels might not recognize. In other words, the kernel
>   can communicate that it doesn't recognize some of the keys while
>   still providing the data for the keys it does know.
> - Added a shortcut to the cpuset parameters that if a size of 0 and
>   NULL is provided for the CPU set, the kernel will use a cpu mask of
>   all online CPUs. This is convenient because I suspect most callers
>   will only want to act on a feature if it's supported on all CPUs, and
>   it's a headache to dynamically allocate an array of all 1s, not to
>   mention a waste to have the kernel loop over all of the offline bits.
> - Fixed logic error in if(of_property_read_string...) that caused crash
> - Include cpufeature.h in cpufeature.h to avoid undeclared variable
>   warning.
> - Added a _MASK define
> - Fix random checkpatch complaints
> - Updated the selftests to the new API and added some more.
> - Fixed indentation, comments in .S, and general checkpatch complaints.
>
>Evan Green (4):
>  RISC-V: Move struct riscv_cpuinfo to new header
>  RISC-V: Add a syscall for HW probing
>  RISC-V: hwprobe: Support probing of misaligned access performance
>  selftests: Test the new RISC-V hwprobe interface
>
>Palmer Dabbelt (2):
>  RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
>  dt-bindings: Add RISC-V misaligned access performance
>
> .../devicetree/bindings/riscv/cpus.yaml       |  15 ++
> Documentation/riscv/hwprobe.rst               |  66 ++++++
> Documentation/riscv/index.rst                 |   1 +
> arch/riscv/include/asm/cpufeature.h           |  23 +++
> arch/riscv/include/asm/hwprobe.h              |  13 ++
> arch/riscv/include/asm/smp.h                  |   9 +
> arch/riscv/include/asm/syscall.h              |   3 +
> arch/riscv/include/uapi/asm/hwprobe.h         |  35 ++++
> arch/riscv/include/uapi/asm/unistd.h          |   8 +
> arch/riscv/kernel/cpu.c                       |  11 +-
> arch/riscv/kernel/cpufeature.c                |  31 ++-
> arch/riscv/kernel/sys_riscv.c                 | 192 +++++++++++++++++-
> tools/testing/selftests/Makefile              |   1 +
> tools/testing/selftests/riscv/Makefile        |  58 ++++++
> .../testing/selftests/riscv/hwprobe/Makefile  |  10 +
> .../testing/selftests/riscv/hwprobe/hwprobe.c |  89 ++++++++
> .../selftests/riscv/hwprobe/sys_hwprobe.S     |  12 ++
> tools/testing/selftests/riscv/libc.S          |  46 +++++
> 18 files changed, 613 insertions(+), 10 deletions(-)
> create mode 100644 Documentation/riscv/hwprobe.rst
> create mode 100644 arch/riscv/include/asm/cpufeature.h
> create mode 100644 arch/riscv/include/asm/hwprobe.h
> create mode 100644 arch/riscv/include/uapi/asm/hwprobe.h
> create mode 100644 tools/testing/selftests/riscv/Makefile
> create mode 100644 tools/testing/selftests/riscv/hwprobe/Makefile
> create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.c
> create mode 100644 tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
> create mode 100644 tools/testing/selftests/riscv/libc.S
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
