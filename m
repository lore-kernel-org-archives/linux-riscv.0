Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5555AC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vheurkuHrJivqSl29YEA+byeFXUosHqC0Lj6Joq/Gxg=; b=09IG4OJyp0a6s4
	fyVhe2j0FnUSmD8taprW+wlMSFVQDVUaJ884fuqwxMzvjzQTTF+tMfmE2NydkhkgibjDPSSpkN/fe
	59LcRKC65C+g6zBNWID4C/Tntl+TFx1WIpGvOXkn6tV1ZS111bFs61gf9VxYZrT/BFFPzFXi11oPn
	AG/5EOWyIcnN+FNyLg3iH7ikdPx4+tfYY+aOPyRM3fDXD0i6RTd5ZDQ8DX1B/nt8fkogF5Jon3/gd
	F8lsYci9j97MMRkXhc4pMzxCBsstjHVQTf4RR+YVA1WUZGTcnSaHXETJjj77Ey0gCspc9TvKr0m7O
	17TpfZmLHDYDLEI+p6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqK2-00000003EUe-21fm;
	Fri, 19 Jul 2024 16:19:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqJz-00000003ETi-1uvr
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:19:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fbe6f83957so18518565ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405942; x=1722010742; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvTcywAcHnE3ccrA5W/X7F37iDdF0a7QIeZ/ZzqpasE=;
        b=N4m0ir8prAKRcN63ebO9nxdfCnXfwtbX6bORt4RjOxLpyuZ0CbPi6Xa8xszKhY1j81
         6T4nMx+iAfPWjy06Jzj5y2jKPWJ1h2HMzcgLTMShwIGKdcw12+Gxr81UzyXy1peJAODL
         harnzZb7SzsAW0Q884LtiZPjoJqlSrsYXsc9LWOc8U8rts2gAWlutB2C24hPt5zCP/hv
         IYGFH5LIBgyY/6etqF5igNCRlSBFWTsQN7RLz9XiyCyFpEhCWm+pupcXcrMp2jjJbZyS
         SXrk/o4AahlzdCfPc3SyhBAQ94K0nSdTcXqoYbz6MAOXR69QH9evQsOacsASUezWp5/b
         L9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405942; x=1722010742;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvTcywAcHnE3ccrA5W/X7F37iDdF0a7QIeZ/ZzqpasE=;
        b=rGYxwiLyPbBBJSk6Hmi2mv4IL3kD1exGTEpkNNaSXZAl0feTPrFExURpllB1fbuSdX
         i6mieWMkiR28am4uB4SQMk8gEfFYkpylLqaiqawCBntVr/rzL1C7LUlPCHSsj8Hpl33T
         o7gskhM2mGpUyTov73A9QKomZDko/RZw20iwPaxiotEJ6RRvj/uWwuvvft+TzLqQ68IL
         ndMMy/W6jDl3skhpmAOxtY1bMqLyQwJZ7ezzhidt5M55OFikptTj6cPTLim09hPuMLAn
         OsjGQZngndJztO+NOhIS5Ndly4GFI3qDP3SZla8L5M2rSD3HE93omQTIxdZ8d7EHjQBW
         ATYw==
X-Gm-Message-State: AOJu0Yypj2LDVZ8kp7X4RDepppU8l86l85NP0qcpzunUS78StXoq0flc
	sg/5DGutBw99m3A7wYjkXmrpbgN+oc9Qeh+Z5g404pjWD3lB/dwreUvmi2COURs=
X-Google-Smtp-Source: AGHT+IEnztRVjDBl/VXuUX5KyPM/Lh6IXEquqgPtuInDBAH8YRCYZbo+qv61JPxdW0gms+3mX11OPQ==
X-Received: by 2002:a17:902:e547:b0:1fc:5879:1d08 with SMTP id d9443c01a7336-1fd7457cd31mr2957215ad.32.1721405942583;
        Fri, 19 Jul 2024 09:19:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v5 00/13] riscv: Add support for xtheadvector
Date: Fri, 19 Jul 2024 09:18:55 -0700
Message-Id: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO+RmmYC/23OwW7DIAwG4FeJOI8JY0LCTn2PqocQzMJhyQQVa
 lXl3eu2h3VRjr/l77dvolBOVMRXcxOZaippmTm0H40Yp2H+JpkCZ6GVNqpFJS/niYZQaTwvWfa
 IAQN03mgUTH4zxXR51h1PnKdUeO36bK/wmL6KrHL/iypIJTFS6yB0EZQ75FSXkubxc1x+xKOr6
 jcPm0eqZu+6wfQWcAjW7Hh899v7yN7HiI68s7anHW/+fKf0xhv22vPlXqvgATZ+Xdc7YF6gAGs
 BAAA=
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=6768;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=frqJw9BdGab/eG7UEYqHiUqCd0SF6PEuYJeaQAL1EDI=;
 b=wJC99mGy7X3igQnBeFpXFDvIqTXJxBPFlXD2BrRsvp/Iv3yJbl8wHAh7Rt5pxK1hlXo5Fo+Id
 xqMR0LZ9ohADW4pyJV0PHcP6v0pxl1sGig3xjMsxn8lXhw8/Qq1SsPQ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091903_539531_7F941AC1 
X-CRM114-Status: GOOD (  23.33  )
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
 arch/riscv/include/asm/hwprobe.h                   |   5 +-
 arch/riscv/include/asm/switch_to.h                 |   2 +-
 arch/riscv/include/asm/vector.h                    | 223 ++++++++++++----
 arch/riscv/include/asm/vendor_extensions/thead.h   |  42 +++
 .../include/asm/vendor_extensions/thead_hwprobe.h  |  18 ++
 .../include/asm/vendor_extensions/vendor_hwprobe.h |  37 +++
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |   3 +
 arch/riscv/kernel/cpufeature.c                     |  54 +++-
 arch/riscv/kernel/kernel_mode_vector.c             |   8 +-
 arch/riscv/kernel/process.c                        |   4 +-
 arch/riscv/kernel/signal.c                         |   6 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   5 +
 arch/riscv/kernel/vector.c                         |  24 +-
 arch/riscv/kernel/vendor_extensions.c              |  10 +
 arch/riscv/kernel/vendor_extensions/Makefile       |   2 +
 arch/riscv/kernel/vendor_extensions/thead.c        |  18 ++
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c |  19 ++
 tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  93 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  67 +++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   7 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 295 ++++++++++++---------
 35 files changed, 887 insertions(+), 273 deletions(-)
---
base-commit: 554462ced9ac97487c8f725fe466a9c20ed87521
change-id: 20240530-xtheadvector-833d3d17b423
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
