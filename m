Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA7CC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 19:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JbNjtPHNgiyZrYEm3irbEPpSPpjJR6395VHKfy3k2CU=; b=dWWS0y/5nePYcr
	lCli+LTueVFduaor9shrwt/1mGCo1bF/A7lYrwcCQ4Bb8d9tvkz0//m4Ixv1mOkfF1kWNeKcafPA0
	wpfzYsROJaXeQQlF0d4Lw2BBae1O6NgcpbOBarW/+lAphe6MqfXs9jO4AQxoni7Z831nOs6UjDAXT
	uVF53KSOck/nFIA4EqU8R1hHHcWLcpkjJjkqAOYSUC++VgOXYJ0MKimsplC2BUG04sCF4bX6Fu/qL
	jYybA8YRE75hQf+Jut/DMOGaI/VqhE9IGh7tLsxwRoCtnGP1cMlZ7D5IA6VVN2oq3Vs/Ow/GUTsGn
	mI712Z560FATlwGT0jug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2yd0-00000000AhK-0pUY;
	Fri, 03 May 2024 19:31:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUe-0000000HWr8-0Xgn
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 18:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ChcKLFzPe2eQn/pwaNx0shjH861FBoRdOTFTkIbkbG0=; b=K8P5XZJBzh5O1Wp4mZNOh38RCc
	dfP6sCbhfn4YmL0w1oLkC0cqBF6JJNhEfc+D2rjrDDroXnAFQIme9dfX1tlFWU41IjQKOEQeQPPhc
	yYutEcgi1eiFSTlyuqdSx9F2gewqXIjDQc4AztL/9gXIKZVcPt0TsGoPFlZditIZ4kB4kCLoyCfcQ
	edmcinSeF0FRzK432LmWq54GpaDiXRgZxwjZuRJ+7ZNtvcSSHkHlil1AlCvkuyEx5bK/JsGpEEqWm
	QHfi9iqGucxZASd+O6szyHsVR1XJ/eCQ4ZjNMTXtvtebW0Azv5MKVoFyKQo9uJOXvov8qrG7dUVV8
	1KJO8BvQ==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUa-00000000dlv-1n3K
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:18:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f4496af4cdso18753b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760321; x=1715365121; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ChcKLFzPe2eQn/pwaNx0shjH861FBoRdOTFTkIbkbG0=;
        b=zCohAcCvRyzp6bWSLTHdO0dNEUbeqAJ77EpZegCqLk2KfAjfIKqV5e/L4vT6dnImo8
         96BIygVQ/sJMcpTh0xNc8dBOxDskoNfIH1rWKQ4gA/awGij5Sf91NGNbqC1/heUpimB4
         WhzslkbTRXn7ejGb4lzmEhZ38M4gyVihel2uyer9qXdKfR6p2HThClUQtU91iH7jh52n
         k+CsgX1Pd6KwlwFBItDOcWJ1CMyWyqs4EoDdqL4G7SUB0WaaDhh7B3ffJAZ1AqnJ/P1K
         rUZ/4Sa4fYyXLyxPeevXYInWcXWYzBwdhckugQbNiAsRAfvrgDcffQQDepUxhqUpkw0h
         kDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760321; x=1715365121;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChcKLFzPe2eQn/pwaNx0shjH861FBoRdOTFTkIbkbG0=;
        b=oxmD3xeS/vMW/jRlpmG+vwAN1j9W0DF+z7cS7HK/uuRYRTMgkmONXTDpf6Y2LVYjEo
         gA9HVdwBwI2I2R/paYIP2QtVXwJODWlqxEEtgHw/iqoCUWsWFizHM6r7n2QIM981VPxS
         8LemUULniRv5/sP9J5UQarldhrMHj5x/2GgwgJhNaxxeQeidl5+2rahyjj2f/ZGjoTbe
         mmrnxtS6WiLrSLJzHDZItooqVEulb5juLvX02k84k2t/t0VeXF8GGNH17yGljrz2nxcU
         QdBFloNeuQzKtdjIofG8K+e7PrII0jV+0arrAKWvYbh4zNCVRQacEbRllY5mKVvTgHKB
         FElA==
X-Gm-Message-State: AOJu0YwzWIeEuLuyQYmTmKVYkDWS1j0ABZnU6lbU9VFG0rAGmoE4uffe
	7v7/uw1BAa1lAmbPrWPSF/Gn6G2DqeCviqnuha9RU2qWD1xnSc8Xd/BgHkJ6qtg=
X-Google-Smtp-Source: AGHT+IGI2dGJ0NIoMKX8oUxPlZVNjsAo20iUsO3+gNq4qBhznQ5MIiDUtuKMThvEHpuPWqgQINkz2A==
X-Received: by 2002:a05:6a00:9a3:b0:6ed:de6f:d72f with SMTP id u35-20020a056a0009a300b006edde6fd72fmr3985766pfg.20.1714760321217;
        Fri, 03 May 2024 11:18:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 00/17] riscv: Support vendor extensions and xtheadvector
Date: Fri, 03 May 2024 11:18:15 -0700
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGgqNWYC/5XQzUrFMBAF4Fe5ZG0kk782rnwPkZJOEhvQpiQ1K
 Je+u7l3Y5Eu6vLMDN+BuZLic/SFPF2uJPsaS0xzC/rhQnCy85un0bVMOOOSSQDqfKVtk9+jp+V
 zWVJeh3Xy1g3V45ryoAdDQRkIyK0U4EijluxD/LrXvLy2PMXSTr/vrRVu038WVKCMShtMD8pjJ
 /VzjjWVOOMjpg9y66h876qTLm8udk73qJnguj9wxc7l7KQrmqs7DEHyDhy4A1fuXX3Slc1VGJQ
 Y1YjS8ANX/bqK8ZOuaq6DUSEDYY3++99t234ADqm4rjsCAAA=
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=8914;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=r/6gY2+LXNqc0EJoEqcqRGtQ40Iamm6JOA9ZUPtJzps=;
 b=ph6fqG1mkKm/tc4k031UnxPL8X8GQY0Ex28RFoSgD78qWqiPQUbgoqbG/iD7cytowXJbwa4EN
 EujXp5tfYLYBgbrbLRnHsXm0nqol507hiC8zBipfHHLaq6NpR+lqSPL
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_191844_745746_309E9C38 
X-CRM114-Status: GOOD (  31.26  )
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

This patch series ended up much larger than expected, please bear with
me! The goal here is to support vendor extensions, starting at probing
the device tree and ending with reporting to userspace.

The main design objective was to allow vendors to operate independently
of each other. This has been achieved by delegating vendor extensions to
a their own files and then accumulating the extensions in
arch/riscv/kernel/vendor_extensions.c.

Each vendor will have their own list of extensions they support.

There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 that is
used to request which thead vendor extensions are supported on the
current platform. This allows future vendors to allocate hwprobe keys
for their vendor.

On to the xtheadvector specific code. xtheadvector is a custom extension
that is based upon riscv vector version 0.7.1 [1]. All of the vector
routines have been modified to support this alternative vector version
based upon whether xtheadvector was determined to be supported at boot.
I have tested this with an Allwinner Nezha board. I ran into issues
booting the board on 6.9-rc1 so I applied these patches to 6.8. There
are a couple of minor merge conflicts that do arrise when doing that, so
please let me know if you have been able to boot this board with a 6.9
kernel. I used SkiffOS [2] to manage building the image, but upgraded
the U-Boot version to Samuel Holland's more up-to-date version [3] and
changed out the device tree used by U-Boot with the device trees that
are present in upstream linux and this series. Thank you Samuel for all
of the work you did to make this task possible.

To test the integration, I used the riscv vector kselftests. I modified
the test cases to be able to more easily extend them, and then added a
xtheadvector target that works by calling hwprobe and swapping out the
vector asm if needed.

[1] https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc
[2] https://github.com/skiffos/SkiffOS/tree/master/configs/allwinner/nezha
[3] https://github.com/smaeul/u-boot/commit/2e89b706f5c956a70c989cd31665f1429e9a0b48

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v6:
- Only check vlenb from of if vector enabled in kernel (Conor)
- No need for variadic args in VENDOR_EXTENSION_SUPPORTED so just use a
  standard argument
- Make 'first' variable in riscv_fill_vendor_ext_list() static so that
  the variable value remains across calls to the function (Evan)
- Link to v5: https://lore.kernel.org/r/20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com

Changes in v5:
- Make all vendors have the same size bitmap
- Extract vendor hwprobe code into helper macro
- Fix bug related to the handling of vendor extensions in the parsing of
  the isa string (Conor)
- Fix bug with the vendor bitmap being incorrectly populated (Evan)
- Add vendor extensions to /proc/cpuinfo
- Link to v4: https://lore.kernel.org/r/20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com

Changes in v4:
- Disable vector immediately if vlenb from the device tree is not
  homogeneous
- Hide vendor extension code behind a hidden config that vendor
  extensions select to eliminate the code when kernel is compiled
  without vendor extensions
- Clear up naming conventions and introduce some defines to make the
  vendor extension code clearer
- Link to v3: https://lore.kernel.org/r/20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com

Changes in v3:
- Allow any hardware to support any vendor extension, rather than
  restricting the vendor extensions to the same vendor as the hardware
- Introduce config options to enable/disable a vendor's extensions
- Link to v2: https://lore.kernel.org/r/20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com

Changes in v2:
- Added commit hash to xtheadvector
- Simplified riscv,isa vector removal fix to not mess with the DT
  riscv,vendorid
- Moved riscv,vendorid parsing into a different patch and cache the
  value to be used by alternative patching
- Reduce riscv,vendorid missing severity to "info"
- Separate vendor extension list to vendor files
- xtheadvector no longer puts v in the elf_hwcap
- Only patch vendor extension if all harts are associated with the same
  vendor. This is the best chance the kernel has for working properly if
  there are multiple vendors.
- Split hwprobe vendor keys out into vendor file
- Add attribution for Heiko's patches
- Link to v1: https://lore.kernel.org/r/20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com

---
Charlie Jenkins (15):
      dt-bindings: riscv: Add xtheadvector ISA extension description
      riscv: vector: Use vlenb from DT
      riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
      riscv: Extend cpufeature.c to detect vendor extensions
      riscv: Add vendor extensions to /proc/cpuinfo
      riscv: Introduce vendor variants of extension helpers
      riscv: cpufeature: Extract common elements from extension checking
      riscv: Convert xandespmu to use the vendor extension framework
      riscv: csr: Add CSR encodings for VCSR_VXRM/VCSR_VXSAT
      riscv: Add xtheadvector instruction definitions
      riscv: vector: Support xtheadvector save/restore
      riscv: hwprobe: Add thead vendor extension probing
      riscv: hwprobe: Document thead vendor extensions and xtheadvector extension
      selftests: riscv: Fix vector tests
      selftests: riscv: Support xtheadvector in vector tests

Conor Dooley (1):
      dt-bindings: riscv: cpus: add a vlen register length property

Heiko Stuebner (1):
      RISC-V: define the elements of the VCSR vector CSR

 Documentation/arch/riscv/hwprobe.rst               |  10 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
 .../devicetree/bindings/riscv/extensions.yaml      |  10 +
 arch/riscv/Kconfig                                 |   2 +
 arch/riscv/Kconfig.vendor                          |  44 +++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   3 +-
 arch/riscv/errata/andes/errata.c                   |   2 +
 arch/riscv/errata/sifive/errata.c                  |   3 +
 arch/riscv/errata/thead/errata.c                   |   3 +
 arch/riscv/include/asm/cpufeature.h                |  98 ++++---
 arch/riscv/include/asm/csr.h                       |  13 +
 arch/riscv/include/asm/hwcap.h                     |   1 -
 arch/riscv/include/asm/hwprobe.h                   |   4 +-
 arch/riscv/include/asm/switch_to.h                 |   2 +-
 arch/riscv/include/asm/vector.h                    | 247 +++++++++++++----
 arch/riscv/include/asm/vendor_extensions.h         | 103 +++++++
 arch/riscv/include/asm/vendor_extensions/andes.h   |  19 ++
 arch/riscv/include/asm/vendor_extensions/thead.h   |  42 +++
 .../include/asm/vendor_extensions/thead_hwprobe.h  |  18 ++
 .../include/asm/vendor_extensions/vendor_hwprobe.h |  37 +++
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |   3 +
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/cpu.c                            |  35 ++-
 arch/riscv/kernel/cpufeature.c                     | 175 +++++++++---
 arch/riscv/kernel/kernel_mode_vector.c             |   8 +-
 arch/riscv/kernel/process.c                        |   4 +-
 arch/riscv/kernel/signal.c                         |   6 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   5 +
 arch/riscv/kernel/vector.c                         |  25 +-
 arch/riscv/kernel/vendor_extensions.c              |  66 +++++
 arch/riscv/kernel/vendor_extensions/Makefile       |   5 +
 arch/riscv/kernel/vendor_extensions/andes.c        |  18 ++
 arch/riscv/kernel/vendor_extensions/thead.c        |  18 ++
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c |  19 ++
 drivers/perf/riscv_pmu_sbi.c                       |   9 +-
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  93 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  67 +++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   7 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 295 ++++++++++++---------
 45 files changed, 1319 insertions(+), 341 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240411-dev-charlie-support_thead_vector_6_9-1591fc2a431d
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
