Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFC8C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EHfjwXioH59tFVBsMjwe8OPcJh4TVQKHiKtkRsMzpY8=; b=KcNuEq1n0uislu
	PG9UjJSpyxq46clu8jEVohghGOQ9JX7xMUV1/3GoVfoijh06/TW6uu7yIGuYtVrehiH3vGBjd7b83
	FOfcYWVh+0QzIFM6RZUbRzPI5Aqi0rpm5f6GjREV3xpOm2EITpI6DIyB+TcI+WSohP61QilqlfRJe
	TxLwoZ2IhKyA5YrCfTb48lOFN+jhnebxzyRnVlGMj/Rqs1LdganVUhHB42pfDqc9wSWtvWaowRppl
	SXkFwttHTWKkxAxqA3xH8Ju8byqPXhdCNQ1/gz8A/tSjVdLWef442O9UMerT1JBWUpkreAgF2jEhw
	znlVktHjpwCpcQ8d+oFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBH-0000000AkdK-0tRw;
	Tue, 16 Apr 2024 04:12:27 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaB1-0000000AkMn-2kmD
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:15 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3c61486d3fcso2327986b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240721; x=1713845521; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYNBDXKfp2miao3VTddr2+Gj1R+sdvV0F9vIMyZhsVI=;
        b=o410+xiQcxSYoMNr0usmSN4myu5UC2mu416vp2Yb/a2QOEtLbSPd5LehKNAEfDbn9f
         GAjxzzvTjMhPFHrmuI2T0ApJ+/w4ObW8IcFV+s/USFNsZ9vE0MPbEEqvH/Gwl5Imkjjy
         JgGkUGlR5o6JAKGpQQQluZXk69URheNU/1hv1X1Wei52fiOdyOeBEsP+rmJNRWMiB3h/
         vJU6aytvxCCuET9uw+C+8fF3HePRN95FXvkNvGAexNNTvMsuBG0xTW4cucQULwrGhzZL
         j/wdMbvexrwPkj2AW9ImQpJXI7Eea5iexLZ3hzaJpuVSP09SSlfxpaaZqf8wJOPMqnOf
         qzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240721; x=1713845521;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYNBDXKfp2miao3VTddr2+Gj1R+sdvV0F9vIMyZhsVI=;
        b=vOmd54jXWAHdF5OMS1EHclvwyn3YBIBaNeNfsszrF6HFLyGJIA9eHaNfsHu/9jvYP6
         g93n4FkA1OhKxQibHYDCu2/ScpsY9EvfTz0915GKTi/zW2c5stcyWjkrqHz05LDvRIWI
         BMNJVK8lk3oa5uMrjxlRQb1jqHeAmxbFX5FGq6Z5VQYDYCd7zwZMDzBWq4UbutOMivLf
         ke/D9bpI67kLu5P4jSqg2uZAXbY0zc0zYmhU004XDKwbh4gF1/g3yopxOpUW/Os3IIDI
         umvI52lZbtxeOyKAua0bu60opnxLyJEHpjImn6zqVPUWZ5hqlm96AfgO3Ui4Z9A4Wb6V
         p2fQ==
X-Gm-Message-State: AOJu0YynzZT4ioMt8PUDp5788Nsa86ul2AEHI83CxfVarD7FpEu+OHAx
	5fcY9MRHc7IEu1T5udERLy0UzOhcN28C9YPchJ5+Xpb7VidCpe54Bc8QnU5xOWaSNvTFDC9sIua
	t
X-Google-Smtp-Source: AGHT+IF1lkpczyO5VkMu98cjWQ0XXr1YHQ2GghLC4lfyscz2a22P5OOgtrDeQ+hPsV03LeZpLe9hOA==
X-Received: by 2002:a05:6808:4342:b0:3c3:e0a3:8042 with SMTP id dx2-20020a056808434200b003c3e0a38042mr9969896oib.40.1713240721217;
        Mon, 15 Apr 2024 21:12:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 00/17] riscv: Support vendor extensions and xtheadvector
Date: Mon, 15 Apr 2024 21:11:57 -0700
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI76HWYC/5WNUQrCMBBEryL7baQb02r98h5SQki2dkGbsqlBK
 b27sTfw880M8xZIJEwJLrsFhDInjmMBvd+BH9x4J8WhMOhKm8ogqkBZlUYeTCq9pinKbOeBXLC
 Z/BzFNrZVWLfYe+3MEQOUq0mo5/emuXWFB05l+tmsGX/pn4KMqlLG9e0Za/In01yFc0w8+oOPT
 +jWdf0CTbNLBtsAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=7271;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=J091ek3uYY0JPMkva6Z8nuyIiEJaaeRVIOz/yElPLPM=;
 b=jtNo9ylE6NCi1ESGRX+iW4qFY7sF9opfbctd6v6yYuE34H2fkm0PVdSrEHaxUNwBKi6/L2LkU
 vqyO4t48+HyA6DYlW4YyZpSs2X5qNoxxiVl5BD5L7R9Dh0YT36WBHLD
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211213_406023_1DA8F9E0 
X-CRM114-Status: GOOD (  25.74  )
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
Charlie Jenkins (16):
      riscv: cpufeature: Fix thead vector hwcap removal
      dt-bindings: riscv: Add xtheadvector ISA extension description
      dt-bindings: riscv: Add vendorid
      riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
      riscv: Fix extension subset checking
      riscv: Extend cpufeature.c to detect vendor extensions
      riscv: Introduce vendor variants of extension helpers
      riscv: drivers: Convert xandespmu to use the vendor extension framework
      riscv: uaccess: Add alternative for xtheadvector uaccess
      riscv: csr: Add CSR encodings for VCSR_VXRM/VCSR_VXSAT
      riscv: Create xtheadvector file
      riscv: vector: Support xtheadvector save/restore
      riscv: hwprobe: Add vendor extension probing
      riscv: hwprobe: Document vendor extensions and xtheadvector extension
      selftests: riscv: Fix vector tests
      selftests: riscv: Support xtheadvector in vector tests

Heiko Stuebner (1):
      RISC-V: define the elements of the VCSR vector CSR

 Documentation/arch/riscv/hwprobe.rst               |  12 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   5 +
 .../devicetree/bindings/riscv/extensions.yaml      |  10 +
 arch/riscv/Kconfig                                 |   2 +
 arch/riscv/Kconfig.vendor                          |  11 +
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   3 +-
 arch/riscv/errata/sifive/errata.c                  |   2 +
 arch/riscv/errata/thead/errata.c                   |   2 +
 arch/riscv/include/asm/cpufeature.h                | 170 +++++++++---
 arch/riscv/include/asm/csr.h                       |  13 +
 arch/riscv/include/asm/hwcap.h                     |  27 +-
 arch/riscv/include/asm/hwprobe.h                   |   7 +-
 arch/riscv/include/asm/sbi.h                       |   2 +
 arch/riscv/include/asm/switch_to.h                 |   2 +-
 arch/riscv/include/asm/vector.h                    | 246 +++++++++++++----
 arch/riscv/include/asm/vendor_extensions.h         |  18 ++
 arch/riscv/include/asm/xtheadvector.h              |  25 ++
 arch/riscv/include/uapi/asm/hwprobe.h              |  11 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |   3 +
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/cpu.c                            |  36 ++-
 arch/riscv/kernel/cpufeature.c                     | 204 ++++++++++----
 arch/riscv/kernel/kernel_mode_vector.c             |   8 +-
 arch/riscv/kernel/process.c                        |   4 +-
 arch/riscv/kernel/signal.c                         |   6 +-
 arch/riscv/kernel/sys_hwprobe.c                    |  54 +++-
 arch/riscv/kernel/vector.c                         |  35 ++-
 arch/riscv/kernel/vendor_extensions.c              |  36 +++
 arch/riscv/kernel/vendor_extensions/Makefile       |   4 +
 .../kernel/vendor_extensions/andes_extensions.c    |  13 +
 .../kernel/vendor_extensions/thead_extensions.c    |  13 +
 arch/riscv/lib/uaccess.S                           |   2 +
 drivers/perf/riscv_pmu_sbi.c                       |   7 +-
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  93 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  74 ++++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   7 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 295 ++++++++++++---------
 42 files changed, 1226 insertions(+), 368 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240411-dev-charlie-support_thead_vector_6_9-1591fc2a431d
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
