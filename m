Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC73C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 19:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sadEjf4LeDQ+ZDVZ7s8xhNplZBUK5HggAK5Mmirx+HI=; b=zVgrtr+EKmweMP
	dr6vzCmMwLDjGyjemOvaQNt8YL/tmOHCPjrKFiLbC+B6GpqajOU3r/QVRxDfO9UXo+IPqy8tXlRH7
	71BV59tW9YGEOgahCNZ+mQL9CEQ9GCEgTcSfurQi4+SvZzHp9Fv98DsxA5pNigYSVqmD8rwQg4wwy
	ibqkAMFAnRZnGq7vSsJi1Zqnba5C/pOWaU/yVKhkzPmrHHhN+3OXDslp9Onw5Sw34v3kdjFafjrfT
	h9yCDBeHyzpcdofAz+UdiuKIFeABSNZjDeK7TGCTAn1bcy18Rwo6dpCtumYyehcnV4TcYWHMVpjSX
	QiXJJjcN8bSsJvxBFQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpw8-00000000E4X-2T3g;
	Thu, 13 Jun 2024 19:16:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpw6-00000000E3V-10sG
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 19:16:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f862f7c7edso1445395ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718306195; x=1718910995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpOwinj0W1yetvQNtkELpr5Kiud2ruzeFCMoj01VdbY=;
        b=Tn4kyIKoi3dIA2SPTvE/mQhwfvfrR/Kdph1Vv1VdhFAZkHITJuYT6LIF2nEb+JhpWC
         EYEqLMdWV97hhRS60YL6HOUdK0rJWwTnU2FImlkVPIOT0v/lNm2enua9e6qJzmjtghi1
         JpUFalh0uMQRIZnVNcKVHOTpcGX+qRLQP556JGk9KKrsA3R9aLAMzG4XP1WcCNOTj7Kt
         QD38Dr8I53TbCpunwy5M15EPzFNTszpvS+/WyIGZXdaMMrDbulIgat3qtwsIWHOhLTZk
         L+NZPSYuMhpMjbXmbD68yxiv04HdkXggka2Lx1MAGhGr5XE6Uo1j2B9REdPu6zxqPHjw
         BTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306195; x=1718910995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpOwinj0W1yetvQNtkELpr5Kiud2ruzeFCMoj01VdbY=;
        b=K3fb9Wxg3hSu2CCcfyZm5xgkhCLi13Tn8v//mci7CbOzljsh6ckt9DeBjCyFRl0DlB
         3VEZ9mRVTLEvvGeSamf6hf3eqV3Oif2RVnKbYmyJU7Xjtu9ZZ9+VkiLP+KvKcAO4uI1r
         zHvKsy564hpDM9NQLLVYheB0cygobiZbEtLVA16wRJ7iNCLWFdjTrVNiKyE8ETSv3o9N
         um7yuOe/L63fdbDf2O0ocDApAkQZ7rgF1/h1niBBdIvFWCGaNJSPeiO/P8lnJhLD6urP
         o/xys+IKxFHgx9ajd8KCaJRn1qQ5WaopwSXBLXJOcVeaA54LUFZhyLd4/HwfeFEmwKV/
         7xYQ==
X-Gm-Message-State: AOJu0YxTLnaFwwOnm2WHZBlK8H+Nm8IGrrToXWTM5gLirAkwmZ/TF1HU
	OpVhU8szNCxK5bT+hwajoutg85Oee1Ij5gxBMm0hdB/6pTIZzRoae8D8YapgOEWyFdUkfevLmpW
	ySFo=
X-Google-Smtp-Source: AGHT+IHHy8Y/gbuqVUoKIBAHl3Kik8dEPGS63zG9zTuBzI8FXFYH9pTlmfj7DD0pHAJEd7bxMGtqFw==
X-Received: by 2002:a17:903:1249:b0:1f7:393c:fcdf with SMTP id d9443c01a7336-1f8625c0537mr7044225ad.6.1718306195179;
        Thu, 13 Jun 2024 12:16:35 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7ca78sm17471015ad.106.2024.06.13.12.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:16:34 -0700 (PDT)
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
Subject: [PATCH v2 0/6] RISC-V: Detect and report speed of unaligned vector accesses
Date: Thu, 13 Jun 2024 15:16:09 -0400
Message-ID: <20240613191616.2101821-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_121638_413195_A8ADD3A3 
X-CRM114-Status: GOOD (  11.10  )
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

Jesse Taube (6):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.
  RISC-V: Check scalar unaligned access on all CPUs
  RISC-V: Detect unaligned vector accesses supported.
  RISC-V: Report vector unaligned access speed hwprobe
  RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst          |  19 +++
 .../devicetree/bindings/riscv/extensions.yaml |   7 +
 arch/riscv/Kconfig                            |  59 +++++++
 arch/riscv/include/asm/cpufeature.h           |   7 +-
 arch/riscv/include/asm/entry-common.h         |  11 --
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/asm/vector.h               |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
 arch/riscv/kernel/Makefile                    |   7 +-
 arch/riscv/kernel/copy-unaligned.h            |   5 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/sys_hwprobe.c               |  48 ++++++
 arch/riscv/kernel/traps_misaligned.c          | 142 +++++++++++++---
 arch/riscv/kernel/unaligned_access_speed.c    | 154 +++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
 arch/riscv/kernel/vector.c                    |   2 +-
 17 files changed, 484 insertions(+), 46 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
