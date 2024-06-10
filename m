Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEB5C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C5dtYYuvH20hwpfUR8hBp0S2hvwHnX75N1WhOTq6BIo=; b=4kbtO86HQYBPcc
	rChjzj9zXYAr+tZ+vCtHsMEJuRZ/08ZjCZ/zLoP0WFTkR641zZNIfLHp/oXxjNee60VkV3dKS4uZI
	Xn/w3uYG4zCZgrxfptEq/KfF6cidouyWbaE+H4N38Z9QfJyKwA+4rzn0E6tLxJG/4zv3EoQ0CiBlR
	aOy0gpNuc1aE40sq29QOJzGMbhMBWaNHvwrn0QtdBbMKNELTIahTHJv+ebYyKDysVytUpaIyCjOxr
	IKSPlISeoOG76VmKueYm2a8pA0rf0ceD43DYztutLPKaYqijQVEK+ismv6o+b/NJ1QgD87RXqycwO
	N9BwBTNehdOyYnXOR8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwc-00000006jSg-3k8I;
	Mon, 10 Jun 2024 22:56:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwW-00000006jP5-1aea
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:56:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f717b3f2d8so9477855ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060206; x=1718665006; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xaAL6mDzc8Ua7Uil1eoXhoziP2pbU1z9G+JbW0VWGQ=;
        b=a409AneH3rTi0MdrUkr8M1HJd4lQXOV4bdP7ut32C6bbBwl42ZFGdSV5+Wv8viDYTQ
         XooRjOiZ2uEWAEpBnofz7Minw1dcOGGavn3k8jVT9CPqJ1y9nhypoikLzg4Di0NY6e0e
         bPwVzjO9R+5IAy5aHrPNkhuxm0CVY5EhsAtmti76EOWxH1C4zbBsKVtOAkCFT3L8rwJE
         /09ndh8KVI8ABKRIfF3Lxen3wKg1m9HOU6WBErAiwynIxoknbaH1f4G4yNFt3jdSQdnQ
         PAeFnbK3dCl+kVobnZheFNjz0HJVHTeA1hM0Tmx4x/458QUuCYbmpagLgMzOkGBOp728
         KIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060206; x=1718665006;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xaAL6mDzc8Ua7Uil1eoXhoziP2pbU1z9G+JbW0VWGQ=;
        b=eXvCrePB/N+xUY+WLUOmI4Wf+Ng5Nl5/CwoAe+MThH37LXGpjgCHss4/u48bcscPwi
         hOGCO9vDYMG1AgeX17Dt4Jxb0RQHZp9Q1rgcWzeVwW5/Tp2cF0Q16Bqx+RYr+LslJejt
         5BoS5AGA/QjY/wwctZOimWx9PjmM37i7rQeOY5fpRaRD4oQ6kdz3Uef0I7EVg1Gq6I8p
         fnZUHcWucB//y91sWsBREII87f5mf5ehxd5wn2irPWBOC/a6FpZ3i7+YpH8RKqL64gj/
         JGELt+HKInP59idXBNIaCH2m4MeCT6OZu+J2Bg9BX17OqI/cKlx5K+VOdE8BkHQmNxWT
         LRNQ==
X-Gm-Message-State: AOJu0YzxDcgyytDoOK2eKbJaMmmyIrMUnLS1oRwZOqaux9sDIqQje+Oy
	MDir+yoD6ryCNtb7N+lPiPMpxJYgtkgZA4jWjGi0yxTfxG59Z+oCmoPVtWjgD7F2kh5GxN9tpI4
	X
X-Google-Smtp-Source: AGHT+IH0EtEGHbX5ApyZIVdES36LP0XGBvM2hKDhoUpKqZn5ftRptugylvf3HeNdb58ZBATZntKZIQ==
X-Received: by 2002:a17:902:e846:b0:1f6:fa4a:5083 with SMTP id d9443c01a7336-1f72879254emr14893265ad.2.1718060205922;
        Mon, 10 Jun 2024 15:56:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 00/13] riscv: Add support for xtheadvector
Date: Mon, 10 Jun 2024 15:56:37 -0700
Message-Id: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKWEZ2YC/1XMTQ7CIBCG4as0sxbDT2vFlfcwXVQYZBaCgYbUN
 NxdrCuX72S+Z4OMiTDDpdsgYaFMMbSQhw6Mn8MDGdnWILns+aA4WxePsy1olpjYWSmrrBjvvVT
 QJq+Ejtadu02tPeX29t71Ir7XH3Ti+h8qgnGmHA5a2NEJrq+JSswUzNHEJ0y11g/mg9GXqwAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=6113;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=7yn3BGahmO2D4NAvhm94NVTCl/ESTkKkPcznWJjCw7E=;
 b=bGYgH0YrXsBKhxUzHQhY3NWmhuQ8kA3B68ceJaHQqhB6G+LSu+9z38fXG0VaXeVEmLY0r3VRP
 Tlnuuq0dCezAU12s96C58bPw+1oMF0syF6ZOIWkp7SAmOIDCZvDuUiZ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_155648_580902_AAA65170 
X-CRM114-Status: GOOD (  22.33  )
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
 arch/riscv/include/asm/hwprobe.h                   |   4 +-
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
 34 files changed, 910 insertions(+), 271 deletions(-)
---
base-commit: 11cc01d4d2af304b7288251aad7e03315db8dffc
change-id: 20240530-xtheadvector-833d3d17b423
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
