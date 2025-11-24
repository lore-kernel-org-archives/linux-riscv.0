Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1095CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hVBycFS8LhhmWdjDWTpj1mu2ZAuMun/0aKsrCuUwoVc=; b=MD8IDUo++Miw1j
	TiXX5FbfkR5lh802fiICZ5ZeDxv7hiim4BaW5aUPkTB3iU6PodKiugrNDHEaBVgdicc2CnBlBpcfy
	5ymaGvjYYPABCgXEVkHbKkP3JJ64qfGyOBtmIghPKsjNncziEseBCR/g1H3EKFiEzG1b7qq0d8p0Y
	VpkV6X3Ya2WDm/akMba9VtEFMTud4g+5+5jcsiC4P0AGeG3N2J0q9A3ZOV0vcGxGV9KYqUkLIQOmv
	0eytQp8lbTHNnrBlboG2HY8B4v9vx2vq0Ppja42egc0UYJOqwrtNOgDC48yjtAtsotWrQw6CQYj0m
	lDZ9cKb9nA3T69IJfgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUch-0000000BXvm-2Vab;
	Mon, 24 Nov 2025 11:20:47 +0000
Received: from mail-dl1-x1243.google.com ([2607:f8b0:4864:20::1243])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUcf-0000000BXvJ-1Dmo
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 11:20:46 +0000
Received: by mail-dl1-x1243.google.com with SMTP id a92af1059eb24-11beb0a7bd6so4835367c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Nov 2025 03:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763983244; x=1764588044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoFjh8MsYFC/IcjaiafYFUcjS29Eup0Axlu8vHGDo8g=;
        b=mSgF1k58MPADDbMk6YkpHjnrp4GCjfJbleUYfLLb0q5oTcwVpWjPEjxjbxKKcOcZRK
         7aA/MF6SemlNygFg1GZROB64g5kuFe+Q8lLjiqBD5bdzwCIavr/ercoi5nzgmtF0k8cz
         zXn2LuQWKAkwgFE9CXGlAPZxddDC8ubHBfeRAukn5c7PAQAeo7dTfWJfe1jSgUoDGs2R
         ycKgfPswiC5ekyZSNmwzFt5ledL9mciEvuCLShzvq6cDj+EPLtfphskZpCKgd6P+S9jX
         gxCtBvIj4PcKRzqndQPhK829+5v9VqssZyxcsgtY1Lvgf8/nukZxLbD123nz1n3kuHVm
         V8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983244; x=1764588044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoFjh8MsYFC/IcjaiafYFUcjS29Eup0Axlu8vHGDo8g=;
        b=X9O9QfWtY/KiStO486gB/GakMGgWfbcfwkQ36ZoGnXrZjpOIa8Bqdhn/QvxGlDVjd2
         hLvkbF+6PE5N7CCuX4WP/pY5lCPBNmONjivMYHuQsUsarcrA8AmOE/5OwBIDcgvz2keM
         mDlQFVjnMMTSk5I7su6zF8QSJL4njSFDtVG6pW9Vm0p7g2Wk85+OBqm9NwRKP/KIUm5h
         YY6s6afIrC7LvGTM3bxsaEaDj/gRpa92X6scGe8SVUz+iVUOIB/nS3Nv+7w5lCl/pERM
         RhfaeY3cCvzLSEthp6d+FO/YuRR+bLkEQn/FTWcPr/+2CJll2WToiDkXqSJaPV34L4rc
         dRgg==
X-Forwarded-Encrypted: i=1; AJvYcCXNFCP1O21Zg+/pC2xxwQwHVsB4sSbX6OExsBSnI4Ml36ncedKw6fNsadtaBT2mKMlfwq0j8wpkG/EFVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8HiYYVPzdSJSGdL+BUDjtbBj+Xb7oRtJKVVxpHg5tbRhqySGJ
	TiHkQBQj7g5qIf78VZ6aa5tWcejCjAvAzwSto5Yvi/WX/3IKwoOgrKfA/6Ua/r3s2YM=
X-Gm-Gg: ASbGncsKvCz1G8lbId/v6laU6fuiTBQEzMbtEaDI3M+br40D4/Gxa10/huCXnI7Rme2
	nRqHUsQlRwpS4+bS6bFqXSar/5+qee6wqD/rgnycAydVauy7afgaf9SaW0x5LOSMQ+2kDljsHuu
	9HvF8Vc1Df/0TjROAG8JQ0ZPVnxRae5/1ouSEvxPyRb4XOPaDlCQvaXNLar9yqJyfeZEZZPymdK
	vjEFWiixr1pWutH4xLFavBGw+0BXe79K0JjaZOFgoDwRLvohn5MfRrCf8onXP9hc4DRoXA1DtGW
	h1C0zGATJGPZcHt/Dz4RV/Qi3SPYwtULDv3ruv5ZeKyjeRuymc6Epdc9Jv4tgoC9wzDVjV/nn+C
	iwha9A3RT3vVa87BZiVDTGMpIfm5gO2R8YM8xCnBBQSTj2UF5y6afvRw0sbkr/PAqns/bqlCAeq
	Yjoam+QVPMTkohxCTUCDCIq4uTcU7CsvvXrOU0/6YYy3KfhPdaPQ==
X-Google-Smtp-Source: AGHT+IFRe5OFRcOIRvFt0difRXHFsxQbs1YTDnqVqZ5YmfXA4RNED/Ts3TyJDZwvJQ+Jv8lGcxehkg==
X-Received: by 2002:a05:7022:fb0b:b0:119:e569:f85d with SMTP id a92af1059eb24-11c94b90cb3mr7567332c88.20.1763983244166;
        Mon, 24 Nov 2025 03:20:44 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e5674csm68207847c88.8.2025.11.24.03.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 03:20:43 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 0/1] Common csr_read_num() and csr_write_num() for RISC-V
Date: Mon, 24 Nov 2025 16:50:30 +0530
Message-ID: <20251124112031.170350-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_032045_340693_14C836B9 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

Some of the RISC-V drivers (such as RISC-V PMU and ACPI CPPC) need to
access CSR based on CSR number discovered from somewhere. Add common
RISC-V csr_read_num() and csr_write_num() functions under arch/riscv
for such drivers.

These patches can be found in the riscv_csr_read_num_v4 branch at:
https://github.com/avpatel/linux.git

Changes since v3:
 - Rebased on Linux-6.18-rc7
 - Updated commit decription of PATCH1 to reflect the fact that
   we are removing sanity checks on CSR number which are already
   taken care by csr_read_num() and csr_write_num().

Changes since v2:
 - Rebased on Linux-6.18-rc1
 - Added reviewed-by tags

Changes since v1:
 - Make "out_err" mandatory for csr_read_num() and csr_write_num()
   in PATCH2 as suggested by Sunil and Drew. This also helps further
   simplify csr_read_num() and csr_write_num().

Anup Patel (1):
  RISC-V: Add common csr_read_num() and csr_write_num() functions

 arch/riscv/include/asm/csr.h |   3 +
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
 drivers/acpi/riscv/cppc.c    |  17 ++--
 drivers/perf/riscv_pmu.c     |  54 ++----------
 5 files changed, 184 insertions(+), 56 deletions(-)
 create mode 100644 arch/riscv/kernel/csr.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
