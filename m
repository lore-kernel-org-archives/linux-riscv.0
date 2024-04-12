Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45CEC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ngKMzJMEdV/SmXSoYo2lTqA/d7jEe8HE/AbSsFh/oYw=; b=fRNM9c3H0Q18cl
	Xc7adENaVVeld8oRkhh+vfl94TxeqhKvefPivZ8Pa46tfeZtq5xes0WQ1GzXBsNatvQjQsNFzBuha
	wodckVET79PAz+l5ZIvyi54xdVV0VZhBvocA18aBJUVAvmuV6vslvzxdTwpSLFQRJI4dnJ5+xP3CA
	7FrmMiv+tFjRKkAde4q9OGkdSt5y4P4klcJkKYsiYHweAKhqoaBs0eydiJqTLewMrk72TrCtqeHld
	YnmPe3RMCPhp98JkEg8BRrWg4Xq39lE3viiJR3goWm3cvaxB51ygRCx28QNnZP1zvAGcgfKZFvF7h
	lUKjkLfbBSf9xlpQa3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GM-0000000FAB7-23VX;
	Fri, 12 Apr 2024 04:11:42 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GH-0000000FA6x-1Hxz
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:39 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6ea2f917c02so280650a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895094; x=1713499894; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4vFuc+KZXLr0HPAAI1Y3TxTNAhGubXRyuAzsTo1eCs=;
        b=Xmtg2Kz+LD7/3nAroblfhVBLsgXptuFPftVJ/ru8ToDa4kkJ2WVvqpV8kMlD8C/dhh
         ++PM7xKC7bROEqSrYcnzFo4HGrIPEzGq2knsdb8BUT6csVLyLKG7PJDjNi3P/b9Fd3lF
         fFsBLmJQJAshM50Ml2Jow6u0dLIXGc5FY25QR387DkQNPPIWkG/dis2SUJMTc3KTTZQu
         GhRAQsVQjysXoIFJ4UbYHPZcBPF5Bx5iI2Cyk6n+JUHMyhMygdq4/C/dEir5cchV0BdU
         79ByMsnXBDU94b8AY0Mn+9/EppoJPJvXpjzXMLwJjvxCZuMHwkCL5ja30xLatZ8ndDRx
         yg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895094; x=1713499894;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4vFuc+KZXLr0HPAAI1Y3TxTNAhGubXRyuAzsTo1eCs=;
        b=RB9/yYKbPiMYBte/7sUEkVDxT1Kwr6bHHiclXkjoePRiXdjOGfd6hY7gljJR4CEuAq
         37vt9l5QjgLGSwnnvtc39++DPfmL0yFHMDmq/ox6+sN2N39l5mdwQH4vnFd1kQbexLK7
         EyQ4PBFp6L5LzrZ/Yqicw03zL3JBjx2we4+kkuEwDFEL/Hbx+IVIOVwafQhLF/dxIyXn
         OW0zwkxzr6dRwYLEBGjg8Ve0v/Z0xNUk+79RG/iNTdKYYPsC/22Jfd+QVgEth99LRryT
         xvmd07ZXdBepI/GwlaKtNS2myLd7i0huUKlb2hrHyEN2eXmRl77FnXNtBaK/Ig++ahMd
         jvfQ==
X-Gm-Message-State: AOJu0YwY16eNJ8kDz5DwvIaB1mO2geUQBTlbvPzuVQ+DTVXe+XZBkcIv
	r8TpxVlrNLmUkiQDJTK9l/IN+9RGlwTREf5EllMb5tJI7pGq/OWXF1Zz1DralqM=
X-Google-Smtp-Source: AGHT+IFXcRrLjz2BzICl9U4RnOlnbIB1p9qCDuofL5zEbRRd7RbQN9I5ujZpsBrF05T5OBKkX8okrQ==
X-Received: by 2002:a05:6808:a83:b0:3c5:ffa6:eaad with SMTP id q3-20020a0568080a8300b003c5ffa6eaadmr1623898oij.40.1712895093790;
        Thu, 11 Apr 2024 21:11:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 00/19] riscv: Support vendor extensions and xtheadvector
Date: Thu, 11 Apr 2024 21:11:06 -0700
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFq0GGYC/x2N0QrDIAwAf6XkeYHG2UH3K2OIaNoGRpVoZVD67
 5M9Hgd3JxRW4QLP4QTlJkXS3oFuA4TN7yujxM5gRmNHS4SRG3ajH2EsR85Jq6sb++gah5rUPdy
 MNM20BOPtnSL0VFZe5PvfvN7X9QPk2l6XdgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=5676;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=194g6ODbPi6DXCUbZzbcQ+OHHq9FcyCjGD2rlljMNLM=;
 b=EhvZyYlJsQ3OvMXR9LRZNS0MNw+nCAiK2mU2Dzq2c9vBmPTSMtx9J5TU7CI3jKWv6Pv6x4pnE
 PfLzDO9FtxmCmOPXd/ITlf11zybMZFjoUZT9yABJ32RPul/JV1y5wzH
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211137_504930_957683A6 
X-CRM114-Status: GOOD (  20.54  )
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
a new struct "hart_isa_vendor" which is a counterpart to "hart_isa".

Each vendor will have their own list of extensions they support. Each
vendor will have a "namespace" to themselves which is set at the key
values of 0x8000 - 0x8080. It is up to the vendor's disgression how they
wish to allocate keys in the range for their vendor extensions.

Reporting to userspace follows a similar story, leveraging the hwprobe
syscall. There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_0 that
is used to request supported vendor extensions. The vendor extension
keys are disambiguated by the vendor associated with the cpumask passed
into hwprobe. The entire 64-bit key space is available to each vendor.

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
Charlie Jenkins (18):
      dt-bindings: riscv: Add vendorid and archid
      riscv: cpufeature: Fix thead vector hwcap removal
      dt-bindings: riscv: Add xtheadvector ISA extension description
      riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
      riscv: Fix extension subset checking
      riscv: Extend cpufeature.c to detect vendor extensions
      riscv: Optimize riscv_cpu_isa_extension_(un)likely()
      riscv: Introduce vendor variants of extension helpers
      riscv: uaccess: Add alternative for xtheadvector uaccess
      riscv: csr: Add CSR encodings for VCSR_VXRM/VCSR_VXSAT
      riscv: Create xtheadvector file
      riscv: vector: Support xtheadvector save/restore
      riscv: hwprobe: Disambiguate vector and xtheadvector in hwprobe
      riscv: hwcap: Add v to hwcap if xtheadvector enabled
      riscv: hwprobe: Add vendor extension probing
      riscv: hwprobe: Document vendor extensions and xtheadvector extension
      selftests: riscv: Fix vector tests
      selftests: riscv: Support xtheadvector in vector tests

Heiko Stuebner (1):
      RISC-V: define the elements of the VCSR vector CSR

 Documentation/arch/riscv/hwprobe.rst               |  12 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |  11 +
 .../devicetree/bindings/riscv/extensions.yaml      |   9 +
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   4 +-
 arch/riscv/include/asm/cpufeature.h                | 143 +++++++---
 arch/riscv/include/asm/csr.h                       |  13 +
 arch/riscv/include/asm/hwcap.h                     |  23 ++
 arch/riscv/include/asm/hwprobe.h                   |   4 +-
 arch/riscv/include/asm/sbi.h                       |   2 +
 arch/riscv/include/asm/vector.h                    | 228 ++++++++++++----
 arch/riscv/include/asm/xtheadvector.h              |  25 ++
 arch/riscv/include/uapi/asm/hwprobe.h              |  10 +-
 arch/riscv/kernel/cpu.c                            |  20 ++
 arch/riscv/kernel/cpufeature.c                     | 264 +++++++++++++++---
 arch/riscv/kernel/kernel_mode_vector.c             |   4 +-
 arch/riscv/kernel/sys_hwprobe.c                    |  59 ++++-
 arch/riscv/kernel/vector.c                         |  22 +-
 arch/riscv/lib/uaccess.S                           |   1 +
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  93 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  66 +++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   7 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 295 ++++++++++++---------
 27 files changed, 1114 insertions(+), 331 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240411-dev-charlie-support_thead_vector_6_9-1591fc2a431d
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
