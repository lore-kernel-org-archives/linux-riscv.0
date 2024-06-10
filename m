Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A55DC27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0NdqzIMgKMd7fbaNoyJLlqfs2qaxj9u/OH4XEkU4kLM=; b=gkjhVNOQBLETC9
	3DPciEcVCdbw3U2Zsl8Wt9l7zGLZ06dvZ8twC/aP/B1H8DNEt4kqbK4L9PVupLZuSUKyZJYWu/rG1
	D5phN1rFhsDc+zIBsb5vshVl7Aj2M0jsEZw1ykOH69MhzbyyWgg4rtSAUqRv/zcUhptNMS5H59gNV
	hkJ36wZSTVluSJaxhZJ73/U8QzqbeKYfQZkp33M68VkopzTKZNiAaoA4O1sTCmgIEZ0/YLEqERRVZ
	oMHLG1+uK3EgGyGN+I4bk6KPdlf7mYudcJc2ZJ8Up83jIevTMOzmvoWmXXyNWpvQrf/fiLagkyaas
	loWNl9Ng7zazfN7Dy5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWub-00000003mPM-1cjs;
	Mon, 10 Jun 2024 04:45:41 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWuY-00000003mOL-0DJ3
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:45:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f70131063cso7183885ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994735; x=1718599535; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dN55AJF0PHuFpfwbQ/DJHVULjunoR3y3+KEw1Zkzgt0=;
        b=Mh4PKStkwMoUuz3HAwDSz4YnZzFlXCpv47eSh2JwarEQkKFT6fWjzUMau7CwygB5or
         vhXDa0Wnc79m1J/AgQW8BbiLI2fKLNrQp9k+4A6tTMARVfM4LyjuwDVPQqgMS9fDHj7x
         sX/TJOTLwjOT9n3Td/UJsiGaL/n4dVkrUxMNBd3cgFb0ueTbQA/gPy0CUv4OQfdT4olt
         qnuHwU9TCcXcIlzukPysA9cHYbabC3BeJL6tQL/ygRKnJtrPLWV2NvsQB2TdJFYqmWbo
         W9erGzX9HC2NpgizJtmjslxUSrxDzBomxVDoO0M3ZwcesCKtEV0kpCB8F878+PJlIdmo
         I0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994735; x=1718599535;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN55AJF0PHuFpfwbQ/DJHVULjunoR3y3+KEw1Zkzgt0=;
        b=BFlfTtuHixclSYRDFVxFiNQiZ4hSEKrqvQmosk4BDZ5wi4UgRpNBPmmVd+fOCjXuXo
         8erI1Az4/u9C/a40STCT5t/HUpRLGYYJAQUA+QdO4ADN/Cmk1qhy0FqCJmPLKuaUgz+p
         wMUOTWzYGd06cW0gD3QlRLfWjQegmH78Ll5S+NYbCERb0zskhkmsa8NfKwgPyrHlnjA4
         CFpAD1A7dra9ZFRyVDDnr7iuhRFyQ0jDWiZnxPirrHNwcFBTgYpzsxdxXRAY3A/iy8pG
         Rynv72ap+Q6+WlNBnWXJ2HVnNkg4G90W8UlE4DI7T1tbPYeNyyDs7TTku+xxX1Aykyzw
         cg6g==
X-Gm-Message-State: AOJu0Yx4u1kppYsU8EhX2ODAj3kMmYJARAd7hqFEpQzZWwgTuzCsAADc
	1JtIOrzHSrnpsMbKqM0kx6NKsw1eZlQzWzRp62Mr9uo9d+8vNEqCy6nqeTEBriQ=
X-Google-Smtp-Source: AGHT+IG9ZML7kOKf0moW7WjG6bvAFzHf7/IU/wowJpUgrFMvTbXgWuSVm5Gfggt/Rs9gPxYhtiFXlQ==
X-Received: by 2002:a17:902:e811:b0:1f7:1821:77ad with SMTP id d9443c01a7336-1f718217cbemr8801395ad.14.1717994735007;
        Sun, 09 Jun 2024 21:45:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 00/13] riscv: Add support for xtheadvector
Date: Sun, 09 Jun 2024 21:45:05 -0700
Message-Id: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANGEZmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDU2MD3YqSjNTElLLU5JL8Il0LY+MU4xRD8yQTI2MloJaCotS0zAqwcdG
 xtbUAHd9+x14AAAA=
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=5669;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=vkSpLdTOCKmV5IhZYXnWR8/RElz7fkjEtj2s36qYkjY=;
 b=F8iBE/qU+gWHTYOUzgJ49eC5lJBiserczetPXroe2jYge4JeZOhpyar3pRnFA6RzDVYnQPUxO
 91UulT4jaLZCLDyQtCbwIv10SEdkoX15vesDG1F1IZMrDbhIKYXPJyh
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214538_280798_9EEE6455 
X-CRM114-Status: GOOD (  21.04  )
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
Charlie Jenkins (12):
      dt-bindings: riscv: Add xtheadvector ISA extension description
      dt-bindings: thead: add a vlen register length property
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
 .../devicetree/bindings/riscv/extensions.yaml      |  10 +
 Documentation/devicetree/bindings/riscv/thead.yaml |   7 +
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
 34 files changed, 898 insertions(+), 271 deletions(-)
---
base-commit: 11cc01d4d2af304b7288251aad7e03315db8dffc
change-id: 20240530-xtheadvector-833d3d17b423
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
