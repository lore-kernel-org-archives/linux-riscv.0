Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAAAC3DA42
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UR0mrCQApjwaRds63cd02q3NmHbgz0mhP1iQU9nZwW8=; b=04keZ3XdbQiwXI
	0Iegg9o4fYvZKjfPffoYyewVeoejSO2utk3UZ60c/EDpDiBymDcQdDN9ct6iRKblas7LiMg2XWq81
	4mEmcB0L+seLB1jskK59xxIoOaV3rOHsDYOxQI0IkiBvu9jahN+mXRyMMoAsQttbqhx6kHBVfFGK9
	YbYZmRFseNdZXKQBYTJMtEKDkx8tEcCnBgssgfFENMwmciVP+im3FSs1Ww1cF2TCfhva8ojmAWqP4
	WL74uJzdXWkkjb87FvMCcw4ewHxAupWMFQqNqibYu6PI1ww+DzGyUezpsvVI0vgNsYFXUcpeI0+HN
	xNTD/Oreo28QUiVPGRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREoa-00000008CHa-3VvF;
	Tue, 09 Jul 2024 17:39:44 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREoX-00000008CF1-1rsw
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 17:39:43 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-79ef8e0c294so275824085a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546779; x=1721151579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4MkRq9pJZdtUmCqu5iT1gqMbhpvrDb9DS4nLumIGatQ=;
        b=sBRXomARvoFPg/LvmEaouZYKYrJw+sU0oTyYUhC2vUyJYsgyBlYpLAHD/cO8K9F57L
         HjIlB4d4BbdgdTDl+gc9PEERaGMZUQHsmATSx3Ul1eOQQRWak82x1KNuO4Wt4IaeMHZW
         tHqlxZNkLxtz7d4izdMUqccyahnzY3EsxYm2YWeUnF/pY4aLpgr2IFHqtb4lTwtiqYJn
         mNZMeJWmhEdHJU7z/Vq7K4E5POO/+IAXESGDCmtXzJhlwpDX9nSugaSyoSQGnq5O9Xaf
         7tPFpERQX46gGvtmL4HNIF4m97eZioacFT3kxFXHTCvH+Un0yQwmJzQuo0GCegL252c0
         kXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546779; x=1721151579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MkRq9pJZdtUmCqu5iT1gqMbhpvrDb9DS4nLumIGatQ=;
        b=N7IBeRXEnW7jLKQF2PWYcNbZJQDT9R8t1zJM6dH61EAR6i6NZ0V0c3ArcHGIPjCwkq
         YOmrBlJGQIFh3tfrLgcrVvGSdjwS4knFAbV2LhFcqS+2+/pXhTV8GXmmN6HGF5J4f2iC
         tmMca/ZQPLQVotVUsyR04KYhDeUfulq5z8Pwsff2PXzxyHhPEjO35SPtdm4Kr/Tft9n5
         jfl3bnO1M0uCkxzuNfG1DWh14+G6zpPkMg9YPmqXCgh+N8esDCpVQC9aIX9oHuAXoqE3
         9vpCEWltCsQKN6s7jAh515mbbI84eMaZX3CntMqXAAeSrw9DZhqeL/zlbZwKKgzIV5nK
         YFQg==
X-Gm-Message-State: AOJu0Yxzw6n+lj4nbeNCS3n02Cwj9p3OBcs3WI5gpFDUk0jJH+gWVguh
	y4GNrkd4ZxG8ziyVJbloQimzvzY2V7kM+pCG6tMmbiDjHj8FidC9bEsO8RwzDxaP2de4bpcUP0c
	h
X-Google-Smtp-Source: AGHT+IGVttz6ocCRARNPeKFY4qZPLhSqhYKVAK3N9nGYjiO1emaTxC7eUVnojkoDW25ZMQuH4lzesw==
X-Received: by 2002:a05:620a:816:b0:79e:fec7:d6e9 with SMTP id af79cd13be357-79f1b5da34amr487803585a.32.1720546778885;
        Tue, 09 Jul 2024 10:39:38 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:38 -0700 (PDT)
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
Subject: [PATCH v4 0/4] RISC-V: Parse DT for Zkr to seed KASLR
Date: Tue,  9 Jul 2024 13:39:33 -0400
Message-ID: <20240709173937.510084-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_103941_735485_015FFD4F 
X-CRM114-Status: GOOD (  10.97  )
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

 arch/riscv/kernel/pi/Makefile           |   4 +-
 arch/riscv/kernel/pi/archrandom_early.c |  30 +++++
 arch/riscv/kernel/pi/cmdline_early.c    |  10 +-
 arch/riscv/kernel/pi/fdt_early.c        | 167 +++++++++++++++++++++++-
 arch/riscv/kernel/pi/pi.h               |  20 +++
 arch/riscv/lib/memset.S                 |   2 +
 arch/riscv/lib/strcmp.S                 |   1 +
 arch/riscv/lib/strncmp.S                |   1 +
 arch/riscv/mm/init.c                    |   5 +-
 9 files changed, 224 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c
 create mode 100644 arch/riscv/kernel/pi/pi.h

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
