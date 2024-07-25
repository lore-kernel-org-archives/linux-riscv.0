Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD55C3DA70
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 04:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/tiIiEC4QCorjlgM9L9OnmYBm/lngZolq/pj1DaQfOE=; b=oh0m+z7kr/JxbV
	nZF7IKZv8tFw4VjxVeYHu1hA86zayWTZTfrufPYWoG//UWwgh+kQ3O8JEQWE+sMQxsD+Qnj8GQoXl
	2sPcl22Cit5pGkjneEZSNJMgh2B68hS4VthEv3VAA62yK9kD8VkmJkBiv37h0+esnWHekB7ISRMWH
	UKtV3rn8HM/r8dYtYGMvGeMR+Y92qrnK2eUA9O8Xn7s82D+BWkkcE9PpnV1yW456KBQ0u7etaIt6h
	v6wOqZkVq6q0LNqE2HSNvGCD4hcNV/AS9i2XTjCQALBDRQn+KzenFVhKhUqnCUMBnYWVKEn8NQA7d
	4rEPaFCUXFCOE3aLTcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuC-0000000HIId-0baw;
	Thu, 25 Jul 2024 04:16:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpu8-0000000HIHo-1HBk
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 04:16:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fc587361b6so4195855ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 21:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721880995; x=1722485795; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1i8qC0mayqC1yqcznUs2mkBBz6lfrr8bxLew1EEe+Q=;
        b=aEpfASWcs/Y2b0X74XjYK87TKR4IU0d2NzL+8+iZFkpOIqHlZKktWCgozQGEl5mDkQ
         dV/FHYNkfYwjF+k5ArfziFOe7JRWrD5vy8flw16n4IV9mUumWLyYZJA8T1twgNRF22Gi
         Hx9GbNsFNCUHCSV6QCOr22Mtv64nVhHWJ3xqAMeXusv87WrSwzNIWEerr61uWIfp/Sfw
         CMvPsM8mJjKW/Lrauw7jqpji94QANsZRdP3yODGMZx40p/wN81UHwZ5SCtjpmQuVvcmV
         y4ht+4ysJy69s4a521Ci6nvv6b0XS6aoKC+4IpMNxojGA8n+xPDYASeKkxcjWNvP0x2y
         n4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721880995; x=1722485795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1i8qC0mayqC1yqcznUs2mkBBz6lfrr8bxLew1EEe+Q=;
        b=vJg4kqJhunfSkQNf5PnfgYmPnsC+PdUNK+jKEODUS4IKbSCqjyIN7bXENXmOsMh3Hu
         yRWzb3Ifrj2JbQQ7fUo1LUjRCKUhS7UYAXEKMolwYUYSAq9mENT9xe06jv23d2kERxOZ
         LlQWzyz1OVsG9a+0y+KijxuXpjn/3xgUimy+aFm38o2tUXBh7dpMRMey3gw3VyXciIsn
         odBsRTO76xZLe+YhGvsNKauQH6Krzk+yzMp2yfK3LBla9qrfITxNl8t1LEGY713iSFx0
         FEsuubXoiHdXa8oNW76qRJMal8bsJRKVFjnnWQv7n0CYkuqzQljqogPmJeoCA88yNzQq
         etDQ==
X-Gm-Message-State: AOJu0YxAgWKifYtdvScHlGLDdgkD8/hZzCXQqErH/EMm/ZIcFKSSFJ/3
	DPJnba7QxCrPOv+yYjtOG2lGgzDCH2C/uvTq8I8hyZ4FiD/AmbRtv+NpYKWTtkc=
X-Google-Smtp-Source: AGHT+IHQQwGtN3V6m7udKQJfWovjhFh+WsMd4nS8yOku8QMqqpgheAoO7I4lp6Y3JkCLkky/+JRUFg==
X-Received: by 2002:a17:902:ce88:b0:1fd:d7a7:f581 with SMTP id d9443c01a7336-1fed920a5cfmr8874005ad.7.1721880995364;
        Wed, 24 Jul 2024 21:16:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 00/13] riscv: Add support for xtheadvector
Date: Wed, 24 Jul 2024 21:16:17 -0700
Message-Id: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJLRoWYC/23Py07DMBAF0F+pvCZoxuMnK/4DsfCTeEFTJZVVV
 OXfccqCYLKckc+9njtb0lzSwl5OdzanWpYyndtgnk4sjO78kYYS28w4cAGSYLhdx+RiTeE6zYM
 hihRRe8GJNXKZUy63R9zbe5vHsrRnX4/0itv2J0iB/RtUcYCBcpIWo84I9nUudVrKOTyH6ZNtW
 ZXvPHYfqbx5q50wCslFJQ487X3fT837nMkmb5Uy6cCLX6+Bd140z31rNhyiRzzwcuf/9cvmhRd
 G5qCjlPnAq53nfb9qPliXAQmyAzjweu9F5/V2vxZoEVx01N+/rus3rm+NRysCAAA=
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880992; l=7240;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=T1A/xzjOdzMebMAhfB5tB/qBaP4Zwe8nRO3rs3/2hFE=;
 b=HGkBQt91U96rNq4WmrGLQyOKVIZhQ5fpqkdUEbk0D5Ih5XfPk0h9qH6viC52o31Dla7IyQTLK
 GUVpI4N7d9+Az9Gtk7dWFUxQNh29yqQMOcU/yN/sx2amIACbkscXpUh
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_211636_642635_D6CFCE5A 
X-CRM114-Status: GOOD (  22.53  )
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
[4] https://lore.kernel.org/lkml/20240719-support_vendor_extensions-v3-4-0af7587bbec0@rivosinc.com/T/

---
Changes in v8:
- Rebase onto palmer's for-next
- Link to v7: https://lore.kernel.org/r/20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com

Changes in v7:
- Add defs for has_xtheadvector_no_alternatives() and has_xtheadvector()
  when vector disabled. (Palmer)
- Link to v6: https://lore.kernel.org/r/20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com

Changes in v6:
- Fix return type of is_vector_supported()/is_xthead_supported() to be bool
- Link to v5: https://lore.kernel.org/r/20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com

Changes in v5:
- Rebase on for-next
- Link to v4: https://lore.kernel.org/r/20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com

Changes in v4:
- Replace inline asm with C (Samuel)
- Rename VCSRs to CSRs (Samuel)
- Replace .insn directives with .4byte directives
- Link to v3: https://lore.kernel.org/r/20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com

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
      riscv: csr: Add CSR encodings for CSR_VXRM/CSR_VXSAT
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
 arch/riscv/include/asm/csr.h                       |  15 ++
 arch/riscv/include/asm/hwprobe.h                   |   3 +-
 arch/riscv/include/asm/switch_to.h                 |   2 +-
 arch/riscv/include/asm/vector.h                    | 225 ++++++++++++----
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
 arch/riscv/kernel/vector.c                         |  24 +-
 arch/riscv/kernel/vendor_extensions.c              |  10 +
 arch/riscv/kernel/vendor_extensions/Makefile       |   2 +
 arch/riscv/kernel/vendor_extensions/thead.c        |  18 ++
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c |  19 ++
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  93 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  68 +++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   8 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 295 ++++++++++++---------
 34 files changed, 890 insertions(+), 269 deletions(-)
---
base-commit: 2709e400c2e06ddae9ad120f301a5254f629cf3e
change-id: 20240530-xtheadvector-833d3d17b423
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
