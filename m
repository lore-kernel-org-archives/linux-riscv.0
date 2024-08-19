Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEAC52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 21:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eaKL6sdVW2+3jo4Mip4YZrpPuDPtvHqASk4I93DFn7Y=; b=I5kL9tZTf7T1nd
	x3cQQeVnNON3tj/0DSC+v48nlMm6swUsed7kb2Um0jshGSM5DccKwxA4cHQYYlXUfSoNhSpoHx4zp
	ZmBVzLhLgfCJlB3sol1DGQq7fenx2KJGeGphrAPWlcmJs6NWo2kS1MJ+Bk3vgN7vRtZtq96CO9Vss
	6U1UHwLvKV7SaL3S/XAF+wUzYLmt0HUKMMvkkbrHauUSuV2TXb/btTk3LnzSDUVxZ6nLwXDEws0wX
	cYmVPLnN1BVF5og/gaC2HHcAgLb9x8pkLw64N5tWs82xvqM7FJ8MSGqBPjUHThOJHZ+x5n6WyJS7r
	y9NXuUKMwnzTQcKBd3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg9tH-00000002ymg-0EzX;
	Mon, 19 Aug 2024 21:26:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg9tE-00000002ylp-2grP
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 21:26:14 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20202df1c2fso23152865ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 14:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724102771; x=1724707571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9OfmERMsrZNq8P77Fjit70ippOj9+Ox6UHTCVXlfO8=;
        b=IjIkeVAUfnmCldvM3mXdvS6cpU7y0R5E4mvj4dhE2vwnNO3GE4BNZWmzoRI8xr3z1c
         WD+EUYAixnqRoerz+N+BqfFg52y+6ugrvZmThuGCMyzINpoMRw5CLj1rlbkXCvQqArrK
         6c4koVlfZpZNSdovrf0TTikehkaY3w6IvAGHsqTwDMrVwB6sFqn9fAEaHkhhV5g+eOku
         Mr9+QMt6Wd+fyhx97Y/GdLyOqHLpOnwMf/o9pjl0EQh3Cj6zQMmhsEMCbVrE8niwiOEk
         05CbMz7QW9OPYC/5oZWkVjgLG/5ByYxp5IriTs9Hvlst8r5yNOzWbVCYlnQ08WaJ57yU
         fIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102771; x=1724707571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9OfmERMsrZNq8P77Fjit70ippOj9+Ox6UHTCVXlfO8=;
        b=l+WB9ALI40XlQRjcma3xieln0Osiptf1pP5gp6CRArE8M+d07wdc3rzjPZMjr5dkiw
         pR99q6I8Zrx/RZNaIqJBGUF/H2T0ctip5bxyNqsIgxeEheps3eeHiFCNoGBJ8matSHR5
         TAhI7xC9Y0TapLtiAS9fRKSD3MfOrjbOT/IcaB+MlX3w6GmbNeJw4kWDUDinRH+2y9+j
         Fq3CaxSAQ/xwhUVbHghDwZG9ffP342FL46Oj/5kGNeFhjMnacLUeCbQQWaOfKJaBmtzH
         nTlejxWDmeTLlJvK0oIyTV4xIwU6ty9aPpbeR4prmr7rL4KmZUnYh6jwpNcpTrYV28R3
         3xeQ==
X-Gm-Message-State: AOJu0YyNfAEPYo8t7Kc+RTt3kkTbvbaBF00ud9FESv3gCNDf4xLZXCEh
	hSWXEoHaltqhVD9RIoIuVD02CE7Pad3LI+JAWpt3kqD8sAI42eu1/uXryqsCAr/UCT3IjWQcbfp
	S
X-Google-Smtp-Source: AGHT+IFWdnJy6AnvrDBgMG+5m5iERxX/4Mb0i6suVZLV9/Qrn/VsQrVH+R+ghxL/IzVHWzB07ePziQ==
X-Received: by 2002:a17:902:cecb:b0:202:562c:f3dd with SMTP id d9443c01a7336-2025ef684d9mr12058455ad.3.1724102771442;
        Mon, 19 Aug 2024 14:26:11 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e7bd1sm7004694a12.53.2024.08.19.14.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:26:11 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v8 0/6] RISC-V: Detect and report speed of unaligned vector accesses
Date: Mon, 19 Aug 2024 17:25:59 -0400
Message-ID: <20240819212605.1837175-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_142612_952213_BAD601EF 
X-CRM114-Status: GOOD (  11.63  )
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

Adds support for detecting and reporting the speed of unaligned vector
accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
adds Zicclsm to cpufeature and fixes the check for scalar unaligned
emulated all CPUs. The vec_misaligned_speed key keeps the same format
as the scalar unaligned access speed key.

This set does not emulate unaligned vector accesses on CPUs that do not
support them. Only reports if userspace can run them and speed of
unaligned vector accesses if supported.

The Zicclsm is patches are no longer related to this set.

Changes in v6:
 Added ("RISC-V: Scalar unaligned access emulated on hotplug CPUs")

Changes in V8:
 Dropped Zicclsm
 s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
  to match RISCV_HWPROBE_MISALIGNED_SCALAR_*
 Rebased onto palmer/fixes (32d5f7add080a936e28ab4142bfeea6b06999789)

Jesse Taube (6):
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Scalar unaligned access emulated on hotplug CPUs
  RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
  RISC-V: Detect unaligned vector accesses supported
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst       |  16 +++
 arch/riscv/Kconfig                         |  57 +++++++-
 arch/riscv/include/asm/cpufeature.h        |  10 +-
 arch/riscv/include/asm/entry-common.h      |  11 --
 arch/riscv/include/asm/hwprobe.h           |   2 +-
 arch/riscv/include/asm/vector.h            |   2 +
 arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
 arch/riscv/kernel/Makefile                 |   3 +-
 arch/riscv/kernel/copy-unaligned.h         |   5 +
 arch/riscv/kernel/fpu.S                    |   4 +-
 arch/riscv/kernel/sys_hwprobe.c            |  41 ++++++
 arch/riscv/kernel/traps_misaligned.c       | 131 +++++++++++++++--
 arch/riscv/kernel/unaligned_access_speed.c | 156 +++++++++++++++++++--
 arch/riscv/kernel/vec-copy-unaligned.S     |  58 ++++++++
 arch/riscv/kernel/vector.c                 |   2 +-
 15 files changed, 465 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

base-commit: 32d5f7add080a936e28ab4142bfeea6b06999789
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
