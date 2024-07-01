Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F79AC3065A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v254OPyN1AOb1q3c3eekDsrj4GGvhDXYeG093oQRcRY=; b=rZ4DMpPw4HxhOs
	Lj8nghDCc7Cg5zKlOSgThLSpQq8vM+LPZ3y+XLuNonIpYhegdsUNbSwta0u8Q38x/vkszTwXFlOmc
	X7uQZqAwPatzJ+CMb4aDaZFSorBzwKR9a9xNTqUFGiyerJfc9pTTqGuwqRFTz6CgOdovcJbk2uXJS
	PQgBvaYAq5yY+2uEUwmQnQNBJuDb3nLiru55xxRXsepHWsj3HYaqxqGCohvmdq0SQLQqjW+WtO0Is
	eVgHA0nGVkB3Qs2hGH22hLb+jEpwaW886jDgfiznzCZMoKQOc0VfqwzcTx6Nn9CP6BrQgW26nfWlY
	PPJ5xSz9k3do04z8484A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOM8M-00000004Wd3-0aqZ;
	Mon, 01 Jul 2024 18:52:14 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOM8H-00000004WaX-25wT
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 18:52:10 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-70670fb3860so2034641b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 11:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719859928; x=1720464728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS9GYxuXw7/qz6F0Huo3Gpz70QhA7niN6kxlAksoOL8=;
        b=rTkphKOelVM74iMjCVq3qZnsmranTxPqDuDdnbQxzimlhW59S/rTWF5a8O9I02IoJC
         QZPpN+SSmiVhf075aQoU0SjaQJRf7D23z3rq+FXe71bn4fxB5lNQcy+AZlqbPpFJ/hzc
         5jtqE80VtmlmMc7rD1F+C9FMe/Ir3wBK+9SXAr/5K7jVc3mSYF4N4MPVxlIni3VKNzc2
         tyeygEQAn9x1cybZD8H1qjZlX4gwsnMdkQTStAIrXAfKBv3AJUJTYv3XVGrf56QzLei8
         kVzDB5khoXzAG6oi/sQOdJrinQGwg9hS+In5KQNQJExO0ZgXIgDGJJka3tQtAANvSJdq
         aIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859928; x=1720464728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wS9GYxuXw7/qz6F0Huo3Gpz70QhA7niN6kxlAksoOL8=;
        b=mvx4ka17f4tbx95XY2Al30060m+D9AK/Wyo7tplpx3KCpB4s3PQzxf3jrZxKd3yfMo
         oAoeLCR/yLxU4VYbBqoJ0IYHoeZ/REoKucImXJWhwuWsInw8VRGR98ck3OkRArsWiOVG
         3/E6S579lgyaduhV24N6ZVIGxthykl4qmVtpW8P2AGYAgG7xzjducuDhR930zTh6/Qcf
         DTopv5NLFzOwstHMdDgEOv68Up5ssvsV5Wi+1FJLWPOXKo6ONftshVvR0p13bHPcfmHw
         Kz46aioDS+esiBKrlyXsAIBvTrYVFBaprWWhMajzu8Pz5GkQ1OzrpgVunw+jeHoz4scK
         h0Lw==
X-Gm-Message-State: AOJu0YxccG2TkdX2kePvKiK8sVt6UMO9bAWr3Er/vSquCbPr0lxvSuTD
	eDulY6fVywdB2VJfeaAUxkADDYW57QNrW3Rt9dOQqu0OoNw3zVJ8SejIVy9iMGzhVdXTfdEqyw4
	3
X-Google-Smtp-Source: AGHT+IG4RGDVsfQVAXbtDLxsNorbihdnFaeyKDYqlytZdtsd3sF4TSa+MDTMQVNkNGIHeIsWv6QxPQ==
X-Received: by 2002:a05:6a21:7885:b0:1be:e4dd:17a1 with SMTP id adf61e73a8af0-1bef611ba18mr5678163637.5.1719859928442;
        Mon, 01 Jul 2024 11:52:08 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ccesm69883375ad.20.2024.07.01.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:52:08 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 2/4] RISC-V: lib: Add pi aliases for string functions
Date: Mon,  1 Jul 2024 14:51:30 -0400
Message-ID: <20240701185132.319995-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701185132.319995-1-jesse@rivosinc.com>
References: <20240701185132.319995-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_115209_559446_B8BD5242 
X-CRM114-Status: GOOD (  10.12  )
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

memset, strcmp, and strncmp are all used in the the __pi_ section.
add SYM_FUNC_ALIAS for them.

When KASAN is enabled in <asm/string.h> __pi___memset is also needed.

Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V2 -> V3:
 - New patch
---
 arch/riscv/lib/memset.S  | 2 ++
 arch/riscv/lib/strcmp.S  | 1 +
 arch/riscv/lib/strncmp.S | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 35f358e70bdb..da23b8347e2d 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -111,3 +111,5 @@ SYM_FUNC_START(__memset)
 	ret
 SYM_FUNC_END(__memset)
 SYM_FUNC_ALIAS_WEAK(memset, __memset)
+SYM_FUNC_ALIAS(__pi_memset, __memset)
+SYM_FUNC_ALIAS(__pi___memset, __memset)
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 687b2bea5c43..bc73325b2fd1 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -120,3 +120,4 @@ strcmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strcmp)
+SYM_FUNC_ALIAS(__pi_strcmp, strcmp)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index aba5b3148621..b36325a57f6a 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -136,3 +136,4 @@ strncmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strncmp)
+SYM_FUNC_ALIAS(__pi_strncmp, strncmp)
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
