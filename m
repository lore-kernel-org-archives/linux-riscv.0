Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D795C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w/TytwEKC0yBPZD2IR9LJ2YdKTJeMUSNLZPGH9vxK2g=; b=DwBrg8PdyZ6h7U
	U82d62s3GNcRsTTREurqw2P46KkaNqTb56i/gxAW6CMxolMkvkPBwKL0L/XxAdjJsmRUJ7HVys/Tm
	8ziUVloc18xtNtTOQjZlDD+BD87tLDXXxxUUVQ8YUjHr576PE2n1+2VRsCHzdi3VKkoYiE1aE03Se
	8JsQYYzZvgBG8xiUl4wmr4fgl72VQMJn41llSv+iNPWuR3imdwOS9M2+JXHXXqlREN53p61n+K3O1
	vNYllVePYVNzdNVD/gEPWHLn3F7kyS/XcaZa1mUYctFLEE29yNQJDYr4sfW3p+CwjTCgdqbYAK1r+
	fe1Vn3AYHoPG0JSoArMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuO9-000000018A3-2pN3;
	Tue, 25 Jun 2024 00:50:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuO5-0000000189K-457R
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 00:50:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f480624d10so40957905ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719276620; x=1719881420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnSgK6fY+iLtRTDSAhrszcxAOUvzG0XuSCnjEWrisjQ=;
        b=jkBYIfo+UZLj019PPy/a73YcS7RB0w4UnEsz4ECZPVRsiIJQ2S7BDmFdyG0r3REQUi
         Ss/X3UDEKl85oSQFEDeFYeMHp5kYLdY6BE4V2IvnX2QDQHtR86sMX91saoesGpzAm0AZ
         Q0b8yZax9A++NjRXL1jGFCqV1Q5telBY6QQMxN0UH+h36tH2f0/RMAgoaIMduX/JWlnq
         qoqXZYhPnm1URShKiL5dniFikLdJYJSednHXleOr1hdvEbCtr+pF3f4UcV831uv8mjsV
         oV43pSP4H2KqvAf5GFJUc0Nn/8oPLpfgJXEEPceuOKQ1njepepNElHx9YMylWn1ZWsdR
         xFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719276620; x=1719881420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnSgK6fY+iLtRTDSAhrszcxAOUvzG0XuSCnjEWrisjQ=;
        b=QrSt9OYHJw5BR+p71H7oogkRwuaL48270BTqLrCELef0DZlj1/RVCFEluHm23ei8Oa
         4K+ct1nqnmzQFKuFid0zb+e61oMZJryrS4ZOOInhdfSQ5iSRNlws59l9fmaKJVQiV2iy
         VH2lnBoJc79ixEoL0IL0UgAHdiN4rWf8BZ1i3wV8qDPVZbjQ2HKpGDeyonwe8zeh9kEP
         IgmZQ5X4MboaWt/RwZoMMLSitHU3VTptox3W7LnHl4hTmLqZ2QC32U1jOsss8PZ5nQLc
         oQuN9BC82PyAsAvdlmpiCuX0L4yQ7RyPEeq0MWtQhxWKh3B2gohkdnjlecuLB6AtNjIL
         QtSA==
X-Gm-Message-State: AOJu0Yyf+Z4dmJn61VouB1v+SitJzkWyXAX0i74eMsz7ofcB0SWNZZ1n
	3nQG7ayCESepjezIg0slEmf/BXOm6xTNb6jzn2b0wd5eT18uhLbsQWXATpvLYBRW5Jk7E7Nc9db
	9
X-Google-Smtp-Source: AGHT+IHApu4tSWv9QAY/GKACS90i6vXuL/EeTsIFIOOg7FuFkA0Ybzt8e0yLcPcwfLJUGW/EmQK7pQ==
X-Received: by 2002:a17:902:dac7:b0:1f8:6bae:28f with SMTP id d9443c01a7336-1fa1d3e00bdmr81145035ad.9.1719276619768;
        Mon, 24 Jun 2024 17:50:19 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a7csm68150235ad.256.2024.06.24.17.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 17:50:19 -0700 (PDT)
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
Subject: [PATCH v3 0/8] RISC-V: Detect and report speed of unaligned vector accesses
Date: Mon, 24 Jun 2024 20:49:53 -0400
Message-ID: <20240625005001.37901-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_175022_139317_830E2E8C 
X-CRM114-Status: GOOD (  11.81  )
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

If Zicclsm is present, the kernel will set both scalar and vector unaligned access speed to FAST.

This patch requires the following patche to be applied first:
RISC-V: fix vector insn load/store width mask
https://lore.kernel.org/all/20240606182800.415831-1-jesse@rivosinc.com/

Jesse Taube (8):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Check Zicclsm to set unaligned access speed
  RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
  RISC-V: Detect unaligned vector accesses supported
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst          |  19 +++
 .../devicetree/bindings/riscv/extensions.yaml |   7 +
 arch/riscv/Kconfig                            |  57 ++++++-
 arch/riscv/include/asm/cpufeature.h           |   7 +-
 arch/riscv/include/asm/entry-common.h         |  11 --
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/asm/vector.h               |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
 arch/riscv/kernel/Makefile                    |   3 +-
 arch/riscv/kernel/copy-unaligned.h            |   5 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/fpu.S                       |   4 +-
 arch/riscv/kernel/sys_hwprobe.c               |  42 +++++
 arch/riscv/kernel/traps_misaligned.c          | 143 +++++++++++++---
 arch/riscv/kernel/unaligned_access_speed.c    | 159 +++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
 arch/riscv/kernel/vector.c                    |   2 +-
 18 files changed, 480 insertions(+), 48 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
