Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84C5C2BBCA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nrxkbHOyDTWfUOVh5+kUorjPnYMnTWXRiwlYJAdtiLg=; b=B8Scm2BtNdPmKk
	1XSzA3TsWuiZkjQPyHbvJbSNxjFBT3+7K2wZA1WsCQtB7Gk+J+eh51F3UxQG7wespIpAstpArHplE
	9GCNRh9v+54I3IDCV/KgvTDrTgCyANBV8Kfy0tbntEwviV7YTBZF/n2rvtkmac297icbqb3ry35z4
	4HejgsJJf/jSNtngFkVOOGLQVRAnZs8hqMhS24IfG7xckGmZgKcTmYde5epp5rajxvsAOXQsHsirk
	JK5H2p+9TE7i73JynwpDh2x0IwHKP322HLA6QFL7D9HWAUwhwCMk04Ek8nsX5D4McxBcop1j2hI+F
	mr6s6A3sgeDqBr0AiOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BI-000000033hJ-3LOo;
	Wed, 19 Jun 2024 23:57:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BB-000000033dc-0EGz
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:57:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-704313fa830so303408b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841446; x=1719446246; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MY9gNtYxIY7P55WK3l92dSyii7grPULlgAdQCTwrkwM=;
        b=T3RAiBJz1/nqToMLs1rwbJjJ5yaoFDbG0wLzKGRa9KiZPwkfaQj2IAbebFt7Y0qRQM
         fe98DH3841fkcf5lGpLumegoyUpWJinEhqPYQsbBnp+LTST6CmZqLvrL4D93ixEVu5H9
         T94TJZSRm2yAjVKpXNoLnmhdpfCQGQAJ/8kDBv7lZH1rPcWof2nlVCbGDZQ/LoIjL4ME
         +oww5ije0wC+Y4LuxwKm2CX/dqMfFIng9KD+WDjvME0Gm69829/2fF4i/8hor/vZOmnv
         PdATX/FUoD5HHloikfzkZscdMKpSSVR3bcpAQDcU4WQGYcGO81t5DGY3cuMlmAXtYJJw
         g2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841446; x=1719446246;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MY9gNtYxIY7P55WK3l92dSyii7grPULlgAdQCTwrkwM=;
        b=EjRn+6R1cPYyiIXv1u/tK8OpCzW7+DH/2trZX2s17akJ5gK0AvEelDG6BXbG/G1c02
         Qqyl6DmgX3i93cPrH2gm4zLAeiZYjvjSwrKFIc6U87eXn0VP+BLZXcA9LkEaaSQwnYD8
         Jlke316XgJx1oFspjSWoTaePjob3pknNFf6cywASt0tE6p4LXYXx9dca+Zcl4djq5nvu
         YQ8D5lIdXQ5/Cwq3iFEb65/SUfPk0KWpkBq2mYw6pQpDBNx8O+S7/M9PGEnJ1s72OGlG
         /KW4tgP1RdBOIFzGdPgeXV9rnyEogwbOM/oZlrwJQuPzUw3TwZE8Sjuju07yHbdhcXNL
         o0Rg==
X-Gm-Message-State: AOJu0YwjmTzJtNTCrBsMGtD89ghwC6hCUgKCQIc6mOJPOKnYCML9Yjb4
	TW9vV8Gliaqwk95NY9+KKLl8a9zNNKNMPGqZ59N/dajMTp/vj5gV2/ltREL5pJY=
X-Google-Smtp-Source: AGHT+IGbUoAHmp9L8GOOQzzT1+2vkfoDoVr/n3oI76ok2wfPdsYHdImgZafKQcKFXAxghbhbD+3Plg==
X-Received: by 2002:a05:6a20:a992:b0:1b2:3998:404 with SMTP id adf61e73a8af0-1bcbb421d05mr3401223637.4.1718841446346;
        Wed, 19 Jun 2024 16:57:26 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:25 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 00/13] riscv: Add support for xtheadvector
Date: Wed, 19 Jun 2024 16:57:13 -0700
Message-Id: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFlwc2YC/12OzQ7CIBAGX8VwFgMs/cGT72E8IGztHiwGGlLT9
 N2l9aI9zpedyc4sYSRM7HyYWcRMicJQAI4H5no7PJCTL8yUUFpUIPg09mh9RjeGyFsAD142d62
 AFeUVsaNpy11vhXtK5ey91bNc12+oFuY/lCUXHDqsjPRNJ4W5RMoh0eBOLjzZ2srqx5e7R7Iqv
 mmsbmsJ1td65y/L8gFE8XcF6wAAAA==
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=6325;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=SQ74wkUYiydiV4kKCgWwaFdmfmpGnTrvzoti3qC9ofs=;
 b=KgHCREa5GKguJPmSCNpSuG7+xp+IBGDhrMjH0sTJkp2zmQxlPYGDADJvJkEkfs7A1i5IVDj3W
 g3b93uhuYWWD7oMxWTko3IuKLdNMeTsCokouiED8IGOXGzhG3ggMuPZ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_165729_866040_16C3B1BD 
X-CRM114-Status: GOOD (  22.30  )
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

xtheadvector is a custom extension that is based upon riscv vector
version 0.7.1 [1]. All of the vector routines have been modified to
support this alternative vector version based upon whether xtheadvector
was determined to be supported at boot.

vlenb is not supported on the existing xtheadvector hardware, so a
devicetree property thead,vlenb is added to provide the vlenb to Linux.

There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 that is
used to request which thead vendor extensions are supported on the
current platform. This allows future vendors to allocate hwprobe keys
for their vendor.

Support for xtheadvector is also added to the vector kselftests.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

[1] https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc

---
This series is a continuation of a different series that was fragmented
into two other series in an attempt to get part of it merged in the 6.10
merge window. The split-off series did not get merged due to a NAK on
the series that added the generic riscv,vlenb devicetree entry. This
series has converted riscv,vlenb to thead,vlenb to remedy this issue.

The original series is titled "riscv: Support vendor extensions and
xtheadvector" [3].

The series titled "riscv: Extend cpufeature.c to detect vendor
extensions" is still under development and this series is based on that
series! [4]

I have tested this with an Allwinner Nezha board. I ran into issues
booting the board after 6.9-rc1 so I applied these patches to 6.8. There
are a couple of minor merge conflicts that do arrise when doing that, so
please let me know if you have been able to boot this board with a 6.9
kernel. I used SkiffOS [1] to manage building the image, but upgraded
the U-Boot version to Samuel Holland's more up-to-date version [2] and
changed out the device tree used by U-Boot with the device trees that
are present in upstream linux and this series. Thank you Samuel for all
of the work you did to make this task possible.

[1] https://github.com/skiffos/SkiffOS/tree/master/configs/allwinner/nezha
[2] https://github.com/smaeul/u-boot/commit/2e89b706f5c956a70c989cd31665f1429e9a0b48
[3] https://lore.kernel.org/all/20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com/
[4] https://lore.kernel.org/linux-riscv/20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com/

---
Changes in v3:
- Add back Heiko's signed-off-by (Conor)
- Mark RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 as a bitmask
- Link to v2: https://lore.kernel.org/r/20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com

Changes in v2:
- Removed extraneous references to "riscv,vlenb" (Jess)
- Moved declaration of "thead,vlenb" into cpus.yaml and added
  restriction that it's only applicable to thead cores (Conor)
- Check CONFIG_RISCV_ISA_XTHEADVECTOR instead of CONFIG_RISCV_ISA_V for
  thead,vlenb (Jess)
- Fix naming of hwprobe variables (Evan)
- Link to v1: https://lore.kernel.org/r/20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com

---
Charlie Jenkins (12):
      dt-bindings: riscv: Add xtheadvector ISA extension description
      dt-bindings: cpus: add a thead vlen register length property
      riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
      riscv: Add thead and xtheadvector as a vendor extension
      riscv: vector: Use vlenb from DT for thead
      riscv: csr: Add CSR encodings for VCSR_VXRM/VCSR_VXSAT
      riscv: Add xtheadvector instruction definitions
      riscv: vector: Support xtheadvector save/restore
      riscv: hwprobe: Add thead vendor extension probing
      riscv: hwprobe: Document thead vendor extensions and xtheadvector extension
      selftests: riscv: Fix vector tests
      selftests: riscv: Support xtheadvector in vector tests

Heiko Stuebner (1):
      RISC-V: define the elements of the VCSR vector CSR

 Documentation/arch/riscv/hwprobe.rst               |  10 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |  19 ++
 .../devicetree/bindings/riscv/extensions.yaml      |  10 +
 arch/riscv/Kconfig.vendor                          |  26 ++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   3 +-
 arch/riscv/include/asm/cpufeature.h                |   2 +
 arch/riscv/include/asm/csr.h                       |  13 +
 arch/riscv/include/asm/hwprobe.h                   |   5 +-
 arch/riscv/include/asm/switch_to.h                 |   2 +-
 arch/riscv/include/asm/vector.h                    | 249 +++++++++++++----
 arch/riscv/include/asm/vendor_extensions/thead.h   |  42 +++
 .../include/asm/vendor_extensions/thead_hwprobe.h  |  18 ++
 .../include/asm/vendor_extensions/vendor_hwprobe.h |  37 +++
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |   3 +
 arch/riscv/kernel/cpufeature.c                     |  51 +++-
 arch/riscv/kernel/kernel_mode_vector.c             |   8 +-
 arch/riscv/kernel/process.c                        |   4 +-
 arch/riscv/kernel/signal.c                         |   6 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   5 +
 arch/riscv/kernel/vector.c                         |  25 +-
 arch/riscv/kernel/vendor_extensions.c              |  10 +
 arch/riscv/kernel/vendor_extensions/Makefile       |   2 +
 arch/riscv/kernel/vendor_extensions/thead.c        |  18 ++
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c |  19 ++
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  93 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  67 +++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   7 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 295 ++++++++++++---------
 34 files changed, 911 insertions(+), 271 deletions(-)
---
base-commit: 11cc01d4d2af304b7288251aad7e03315db8dffc
change-id: 20240530-xtheadvector-833d3d17b423
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
