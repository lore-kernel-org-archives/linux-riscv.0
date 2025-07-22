Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B4AC83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crbO0CI0CMmaLOIs2GJJq5TNOzAjmPMsLi06xH/DOYY=; b=taMysobt95ER/M
	uEFyzbOhFOcmymr+DCbTWiSZeylr9YIgGo4FIY9IEKGyoxyVU74j+ir/zd98b5SUJEEUShUkU466R
	+Szfaq/17R9+sWqO9fcd+MCDvhlJD/TFE4qISZghV/u5vqssSVXbAmQW+neFFiH6HBsxx0FYAQBLs
	3vKeixBMZ6Vmzsqnu306ZKE4RRUCMRRmK0qFRr7HNFz7KSuHGjQiXR8Cj2SZd+m5wuHeS2TvOwL1h
	AeQDzEm3dp4tYrHo0EHDaxuxlzDgpM1WwhmZzh+YRIQ5/CnGFxrdqN1MqJ8Vrl6aocjUqXepBn4NR
	/yIinIC2xOy1S1AZdfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwl-000000039XN-3Hop;
	Tue, 22 Jul 2025 17:38:35 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwj-000000039WU-1SX4
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 17:38:34 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ab5953f5dcso58293011cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753205912; x=1753810712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhoYjXYf0iMiladjWcP1otkdqstK1tSrtdf33PqhK5I=;
        b=cYNuwyg/ZfxYTv1Ll+ZeHDo3zYTGvtqSBY796OIx0DV5Hbw7SuusaKFOafN2a3erPR
         v++NpBecA33uHrz8bv04EJxhgTKzBQlLyPlkM9WEEWiwsP4x9Oml8+deai/7co6r1qOU
         aaoP8WPVhunSDrED7QAQe8F1GHnI75jbEOzt0L28vId46twdRhDdcexQMfxfmvsikF7d
         7YKAecd8VbRblROG03r5pj+SkCf+LM7yO00QdvyzeEWiqB/c22RhHiQ+oHYcDeiSBy2H
         Ez6bmNYYpoKM+OqeDMEg1m10xdqu6TEhI6/yE/iYE0fg4VRLzb036KYfr47+VccY1Udo
         lpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205912; x=1753810712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhoYjXYf0iMiladjWcP1otkdqstK1tSrtdf33PqhK5I=;
        b=vAGPD7cQVJavTNb48+cns2zwhK10xldoiSlXJJTLIvcekX91cDwirP9o45+26e0gMt
         xvAf4dVICtJUKTe/vTcopNOKbgwL7RHT1W6ApyiKWI2ROIX4c687qIp9AkhEQ86akIQn
         ucf2bciCFGsK4fI8TsL+0miFEglWJm3/B6vMdfh+ORL8hSjUONyMeX2YcnIB9K3uYkov
         B+mdsbAAQVuxBS8NRjG2H7OOrsZtcDbH880yD5NF41CzSWdvySsIzQoCbXFZjOhcNrxm
         f7yLpZOJVAXVlN3IpPYTywbPHLGHXVeDyrWrjeXm0hDh4kpgNaTWYnafFSMINYdqxV7k
         MsCw==
X-Gm-Message-State: AOJu0Yy2ny3LxX35FCsfXUZpVzH6M8k58vL2TNPJWB/ij/r8YLX91ueY
	CHCE2RUTajRAH43/buIBIBCpBy9MdIRPsDqoJlAuFEPv671LPBeEitv2oTo+Lg6wZzDAnY00GhH
	1YtME
X-Gm-Gg: ASbGnctU7uoshO75bE3GIwU5PmcQJyANhrk211bcpln2vO+IfHZW4vITZQ1WRtgqyeJ
	hbZ3cMvvPxnYRqlAkJc9qJJQ3aagUTsbKmn15e2SxkGZKectjEtqYJpndeo8NTWRPh3Tyf5P1Xc
	A4szAXL+3f8yO5ydKKFhgV5aU96qUOpfo+Mtie05LYauqTNVym0XTZcLkT8ofFhpnSutcgm0X01
	nKcQiMsGHMprrCge20UqX5OWJa+KHbaN9UtKgCOv8U4W1DNFlzgc7PEoEaO7L8/TEMU9wSyJYFl
	Q64a4Dwx+oz7NGSgNaeJDYA2CQ+rI8LVL+US81hB1mKvvK2ur//u6MPEalo9u6JsjkKWV50NgSO
	vCFwh/HEZmiHPCS3bj664OHbC7XkmN0hBss6MfTs5wI9is6vespufJt3yJ96Xuy3VIxJBPdL/2E
	FKf1UZSlObFbU=
X-Google-Smtp-Source: AGHT+IHb247+BK9soAtrcDng/vPgXXKCMuuenRPeYBN+V315g9KM5gGz27XtmWbtqKQII4y1fdhGTA==
X-Received: by 2002:a05:6214:f26:b0:6ea:d6e1:f3f8 with SMTP id 6a1803df08f44-704f6b37f26mr386502286d6.45.1753205911626;
        Tue, 22 Jul 2025 10:38:31 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b783sm54184536d6.73.2025.07.22.10.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:38:31 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Evan Green <evan@rivosinc.com>,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [RFC PATCH 0/6] riscv: add initial support for hardware breakpoints
Date: Tue, 22 Jul 2025 10:38:23 -0700
Message-ID: <20250722173829.984082-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_103833_472306_4980DD2B 
X-CRM114-Status: GOOD (  10.88  )
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

This patchset adds initial support for hardware breakpoints and
watchpoints to the  RISC-V architecture. The framework is built on
top of perf subsystem and SBI debug trigger extension.

Currently following features are not supported and are in works:
 - Ptrace regset support
 - Virtualization of debug triggers

The SBI debug trigger extension can be found at:
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-debug-triggers.adoc

The Sdtrig ISA is part of RISC-V debug specification which can be
found at:
https://github.com/riscv/riscv-debug-spec

based off the original RFC by Himanshu Chauhan here:
https://lore.kernel.org/lkml/20240222125059.13331-1-hchauhan@ventanamicro.com/

Himanshu Chauhan (2):
  riscv: Add SBI debug trigger extension and function ids
  riscv: Introduce support for hardware break/watchpoints

Jesse Taube (4):
  riscv: Add insn.c, consolidate instruction decoding
  riscv: insn: __read_insn use copy_from_X_nofault
  riscv: hw_breakpoint: Use icount for single stepping
  riscv: ptrace: Add hw breakpoint support

 arch/riscv/Kconfig                     |  12 +
 arch/riscv/include/asm/bug.h           |  12 -
 arch/riscv/include/asm/hw_breakpoint.h |  60 +++
 arch/riscv/include/asm/insn.h          | 131 ++++-
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/include/asm/processor.h     |   4 +
 arch/riscv/include/asm/sbi.h           |  33 +-
 arch/riscv/include/uapi/asm/ptrace.h   |   3 +-
 arch/riscv/kernel/Makefile             |   2 +
 arch/riscv/kernel/hw_breakpoint.c      | 681 +++++++++++++++++++++++++
 arch/riscv/kernel/insn.c               | 153 ++++++
 arch/riscv/kernel/kgdb.c               | 102 +---
 arch/riscv/kernel/probes/kprobes.c     |   1 +
 arch/riscv/kernel/process.c            |   4 +
 arch/riscv/kernel/ptrace.c             |  93 ++++
 arch/riscv/kernel/traps.c              |  11 +-
 arch/riscv/kernel/traps_misaligned.c   |  93 +---
 17 files changed, 1208 insertions(+), 190 deletions(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 arch/riscv/kernel/insn.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
