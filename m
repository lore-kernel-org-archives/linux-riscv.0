Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB131C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 01:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pFEoR8N/xRZa9pPsifFdp4LR4bJAHtLhMuc0d8JslPs=; b=qwWZOAIqNlzMtt
	FIvAPMP1NipYAUTM+HH3XNBrM9fwQXU9rUPKAiquhpikwzHTf8EtDJF7JXFcfDCoW1U94+kiaOJi7
	hCK2qcVqQn9YFbq8jrnqxRSbiMgx89iK4qmjoXtvu+l/A8QRfCJ4qCiRbMs0QJHXKe7ktcRAKqKbF
	QCKJ9RRupLaxgMl7AecwB71919DnnySP9y5ms6upQ+KhZFePJrRc8M0Cah4YyHnS+1zcmB53HW9EE
	iI0384RYrKbE14D+N5PerwxWLQv2ioizBtxnuXvS3H8bmohNKN6qaQxZp50YCz2+UUZbc4fRDGZsc
	RtoxL/zD7DZnkZiIpuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdU-00000009VlV-12fE;
	Sun, 21 Apr 2024 01:04:52 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdP-00000009ViL-2bNN
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:04:49 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6f0aeee172dso1567237b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661484; x=1714266284; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Upik3DOmqgCV0g2RZiBc7+wA1R8hXqbRoYtStXV2EQ=;
        b=Uy+ajYt5c/youk9iu/wMQmLnc46hWJksmlcp90G+6+85E9p5bahg3xQhN3uhaxk117
         OJSXnnDiGvdLoyQs8O1XG/TNvI87UpojOIDiLxXjqt+1Dit6c4arzTGkCrvyKo/fTWne
         QdI3OMoSEeq1VV1zdt9nls3SkvRvXA4mOMxUuke+9OcYa9cdxW9OibB9I53C09G9zA8V
         4DCtot0agKv86QPsdjLS88waYi7ier9kBIHx8Fceie0Y7ZieujIEtjUzFjqMl7+s7Qjx
         NvK3LtLwc02gt46Fn4F0MIM13KrsGuCReV/l9iVrWsE4NW+YT9JqE6YciSILuPAh0H5M
         8QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661484; x=1714266284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Upik3DOmqgCV0g2RZiBc7+wA1R8hXqbRoYtStXV2EQ=;
        b=hE655Mxn7t5muKNWS8/J8VQO5MsBuGQSSnt5uImMvaGPC36PNhDqU40YYrjOBPWVRW
         ADM2kpykXLEq4ghVzSC9g7BHY8jdLHy1awqmiKsmFpX2eWpet4vE1nDmn24a3TH1qszL
         T0Sfp4X1CpJKJ/slyITFPOFsQXxzRLNnSZQJZ2eSvx6JIKvE92Da3cNEqTLDmJiY9Sjc
         KJmciGgOirorhbZmwzyzeYqYuU23Pwj2/szjBsn8PFZoEjf9oo4U5In8b6fBn5DEMtZX
         aediP1QoftYk+75kS+eA/FNWowhqJAxRPqFtzTVFpla2hJ08jZ1Ir2XtrnPI7ZIWy6N2
         NZHA==
X-Gm-Message-State: AOJu0YzWbwQLrbjDKP2PZTRPyQXP9QW69anYk8oNlUmEsSRC1KSkpEOJ
	WDPfaCamC/PKC9RlR6Tf/cnv1UH1CA1u/ryDkaMmOmxSAMjjNsNZsRMVPJ6Uc6o=
X-Google-Smtp-Source: AGHT+IFp16UcT7hc8CV33N22/OwIeh1LGlJ+289qN5tEz3H0Mrd0SvARorkT9oA5JUQzTvfW8kS6cQ==
X-Received: by 2002:a05:6a00:189b:b0:6ea:f05c:5c16 with SMTP id x27-20020a056a00189b00b006eaf05c5c16mr9608809pfh.5.1713661484094;
        Sat, 20 Apr 2024 18:04:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 00/17] riscv: Support vendor extensions and xtheadvector
Date: Sat, 20 Apr 2024 18:04:32 -0700
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACBmJGYC/5WNQQ6CMBBFr2K6toaWUsCV9zCmaaaDTKKUtNhoC
 He3sDKudPlmft6bWcRAGNlxN7OAiSL5IUO53zHo7XBFTi4zk4VUhRKCO0w8f8KNkMfHOPowmal
 H60xCmHww2rRcVK3oQFpVCseyagzY0XPLnC+Ze4p5+tqqSazXPwNJ8IIr27WNqBBqpU+Bko80w
 AH8na2NJD+91Y9emb1QO92ALkqpmy/vsixvpCfByTMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=7479;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=4r72hPtqCnQ2OBKF0h6s+thj4Yk8ClIWBoDHP7/BMnI=;
 b=FnjBRE9uGiMYlgt5VfR73mBNRHYkKWfThMDMtxTD3bapbzbzr1XgvphDUly3XfPcAojElsGmf
 G7GysNzEDccAFfM991f4D5M8oqo9ppGowF9x4RfsHjTBVbBIdTEL4oO
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180447_674727_EB4E53EF 
X-CRM114-Status: GOOD (  26.58  )
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
      riscv: cpufeature: Fix thead vector hwcap removal
      dt-bindings: riscv: Add xtheadvector ISA extension description
      riscv: vector: Use vlenb from DT
      riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
      riscv: Fix extension subset checking
      riscv: Extend cpufeature.c to detect vendor extensions
      riscv: Introduce vendor variants of extension helpers
      riscv: drivers: Convert xandespmu to use the vendor extension framework
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
 arch/riscv/Kconfig.vendor                          |  32 +++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   3 +-
 arch/riscv/errata/sifive/errata.c                  |   3 +
 arch/riscv/errata/thead/errata.c                   |   3 +
 arch/riscv/include/asm/cpufeature.h                | 106 +++++---
 arch/riscv/include/asm/csr.h                       |  13 +
 arch/riscv/include/asm/hwcap.h                     |   1 -
 arch/riscv/include/asm/hwprobe.h                   |   4 +-
 arch/riscv/include/asm/sbi.h                       |   2 +
 arch/riscv/include/asm/switch_to.h                 |   2 +-
 arch/riscv/include/asm/vector.h                    | 247 +++++++++++++----
 arch/riscv/include/asm/vendor_extensions.h         |  82 ++++++
 arch/riscv/include/asm/vendor_extensions/andes.h   |  19 ++
 arch/riscv/include/asm/vendor_extensions/thead.h   |  45 ++++
 .../include/asm/vendor_extensions/thead_hwprobe.h  |  11 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |   3 +
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/cpu.c                            |  40 ++-
 arch/riscv/kernel/cpufeature.c                     | 138 +++++++---
 arch/riscv/kernel/kernel_mode_vector.c             |   8 +-
 arch/riscv/kernel/process.c                        |   4 +-
 arch/riscv/kernel/signal.c                         |   6 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   9 +
 arch/riscv/kernel/vector.c                         |  26 +-
 arch/riscv/kernel/vendor_extensions.c              |  69 +++++
 arch/riscv/kernel/vendor_extensions/Makefile       |   5 +
 arch/riscv/kernel/vendor_extensions/andes.c        |  35 +++
 arch/riscv/kernel/vendor_extensions/thead.c        |  36 +++
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c |  42 +++
 drivers/perf/riscv_pmu_sbi.c                       |   8 +-
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  93 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  67 +++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   7 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 295 ++++++++++++---------
 44 files changed, 1277 insertions(+), 350 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240411-dev-charlie-support_thead_vector_6_9-1591fc2a431d
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
