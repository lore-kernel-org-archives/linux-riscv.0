Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F9CC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IBVIjFyeJROjDJvUfCBCiizQJeiasWdz6KCluaWwzFQ=; b=qOvmBwP3A+cFSv
	HthUWZFsxdWsCTc7lis7suBqze4LSvDXU9f70wf/5cZCK6NPcSLzLwvgB9+ilBNKdn5qk9VBIOnsl
	X+j0l6Jj5pYTVxRzBi8mV/sGz0h1r1PuFbG8SQkk4ZStBv/okwwIrEM6BZGSmigkqJsduu9BY33ZM
	GNr4vY6qjA+Ork0tpcS6GyqCUPCdCRBH1RZJj+eMNiitpEy/qFrvPnrtPBmwjdGFF9Dnb860Lq9aC
	c7ghRrp3OebHIIVJJwZ2SYSZkK1E2cYNG1AXMtyj+utHeZwwjLK9B973euk+vN7MI/RxSq04+z5ck
	zLlZ5kH6jhlOTQ5qEyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOM80-00000004WTL-33nU;
	Mon, 01 Jul 2024 18:51:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOM7y-00000004WSh-0Vby
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 18:51:51 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f9b364faddso19275415ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 11:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719859907; x=1720464707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BR+n8cp6lBjZjGDk+mYOf3wt+diD2m02XG7xJApEuY=;
        b=yxEYMEZmsUBDoQ/db1bxEE2gbs1veMp9JoISoc0hwqw5anPLKxjHKtpaMsBXxZVN6K
         7lE5jwMJglyzXHm5iUEjNToAvNoinJHj/7L/8tPTqdNfJ0ZUBaQeDhgP1L+qRYY02bPr
         hGEE5xwPYFdAu4XKeiOvGKSaMTtkpGZz4KQakxaFrUbLVJRFfipYxeVBUB4mhXoSu6EY
         Hs4qvRcsvuW2mQOCEIRsQJMySZd6C25qE9H94W2lihrX1Lg+ALUjWEslP4/Je+ETi1dB
         DowquIY8ngqSTuEjdNJK2uxOhkEeiyrQ8AqCV+pGCenxzH4LbMpssbVG3xgpEa03yYAo
         8bNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859907; x=1720464707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BR+n8cp6lBjZjGDk+mYOf3wt+diD2m02XG7xJApEuY=;
        b=VTnzn9pikjF6Kq8XW4moKYCPgHSLTYDWr2939i0RxfcL145uJDceetL36HTWo/z0TY
         SqUGm1z5x3zIW16cAFOjHEub4T/vK6dm5LuZJTOroH3e8Tk5W0Fgff750lDawJ6Tz1bt
         TGFSrAAUCXOSwInadX/wdLzpmtLIU84MZdkMGrFWdRHZWl4d2LhkExmotn8+EarJc23y
         iORpVs4Gm22ZUoN8i6K0KqSJsVIK9uZKNgYjNB3XAeOHw2bjrOE8/vKu2N8dUAdiicoC
         ldNZff6dP56hxyBQvp5k3CGNUz3lHte2Cl1GlI80Xa3Acm+cS4hJHo4z3AoiljDuNIin
         Y58g==
X-Gm-Message-State: AOJu0YyleXQ4LWsjUcYxDyLqTnlNV0IWVFJzra7WzUTTHk1MaK7Utvq1
	WLJoB8LuuQLl0BrfZ6JiAIpevafa0ggthUgpOO+jmaX9Z+gOnnK613G4EBi9K/JjnALhqMoFyu5
	G
X-Google-Smtp-Source: AGHT+IGIhR4q2ffdDOA70LUc/qAQrNnvQG1rQn60lll7aXKMs5f7a9ja1/d5Jnpik/LL3vg+/X9cqg==
X-Received: by 2002:a17:902:ccd2:b0:1f6:1780:f7b1 with SMTP id d9443c01a7336-1fadbc73cdfmr44672915ad.17.1719859907340;
        Mon, 01 Jul 2024 11:51:47 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ccesm69883375ad.20.2024.07.01.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:51:47 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/4] RISC-V: Parse DT for Zkr to seed KASLR
Date: Mon,  1 Jul 2024 14:51:28 -0400
Message-ID: <20240701185132.319995-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_115150_183255_DEC5A94B 
X-CRM114-Status: GOOD (  11.15  )
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

Add functions to pi/fdt_early.c to help parse the FDT to check if
the isa string has the Zkr extension. Then use the Zkr extension to
seed the KASLR base address.

The first two patches fix the visibility of symbols.

V1 -> V2:
 - Add RISC-V: pi: Force hidden visibility for all symbol references
 - Add RISC-V: pi: Add kernel/pi/pi.h
 - Rewrite archrandom_early.c to parse DT over checking the csr
V2 -> V3:
 - Add RISC-V: lib: Add pi aliases for string functions
 - Rewrite isa_string_contains in third patch

Jesse Taube (4):
  RISC-V: pi: Force hidden visibility for all symbol references
  RISC-V: lib: Add pi aliases for string functions
  RISC-V: pi: Add kernel/pi/pi.h
  RISC-V: Use Zkr to seed KASLR base address

 arch/riscv/kernel/pi/Makefile           |   3 +-
 arch/riscv/kernel/pi/archrandom_early.c |  30 +++++
 arch/riscv/kernel/pi/cmdline_early.c    |  10 +-
 arch/riscv/kernel/pi/fdt_early.c        | 167 +++++++++++++++++++++++-
 arch/riscv/kernel/pi/pi.h               |  20 +++
 arch/riscv/lib/memset.S                 |   2 +
 arch/riscv/lib/strcmp.S                 |   1 +
 arch/riscv/lib/strncmp.S                |   1 +
 arch/riscv/mm/init.c                    |   5 +-
 9 files changed, 223 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c
 create mode 100644 arch/riscv/kernel/pi/pi.h

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
