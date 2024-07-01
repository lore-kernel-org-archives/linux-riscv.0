Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A76C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 18:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgUEeQ1Uc4077ZxJbR5uHAQ52NnHDmEesNwXi/23SOk=; b=236KrojQul46PU
	PasJMNhW2PcLUH60F4PjaN8S6cyMxWckfny3WJShszbGUVTRVZYtm6ZpInY5zBYI1Gew5ziUJ5GsR
	WlH81TN8uOZe/J1DVpPwh874q/1fBomkhzeFeTunO5MEx5SWxJeP7UIzoIdyCWYjzjHh36+yGj0zJ
	4YvOGL9DKcfOBlcqewfRswHVVlBQjPAWCk5VAR3fP4wqXP9//UcxvLKCosY/MkjO/RA6H+kT8eWke
	FYT5cwLcZ4UaNKnJ4IChC0Ew9Jp+Kb1HZeiBywslDWwXtKmsV/yJ4DroRsWkSUJBxHHxToMDZ9Y8A
	XTIHMCiqhpW/1bnSjG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOM89-00000004WVh-25VB;
	Mon, 01 Jul 2024 18:52:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOM86-00000004WUX-3WoB
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 18:52:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f4a5344ec7so23981585ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719859918; x=1720464718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anHX1DM3URGCkXrGn4JIrBeC+s/73VzKMiEIav89N4M=;
        b=0D73/lJSfSOH6c2pmJmx20z68jN5ysisuUzTrRh0oLQFT8bnvSrOTZ0149K25U0Dkm
         zxyqGuoCWqK4OZH5tVlxlFnkzSf78Cfc9dqW4zh8X7dVu/SU2uxhBhXptPBmR9kBDpPf
         VFFHr28S/Xes6zuU6qzz/etDS6rZP+hNIKaUOc3xRsuNkXzxkt/AIhAHTehI93TSSLbW
         p5d77SWlf4gRdRZoiYSCsJYVYVBB5P34RHqgrNvJdLbxYRLHK2aGxV17MWA5qoQZMUMr
         EWJNTSXvMkLaHooXz7l5i5M3OsMP824zS51tnoZWMCTRcxlxG+udhoedNdhSbCfmFs2A
         PPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859918; x=1720464718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anHX1DM3URGCkXrGn4JIrBeC+s/73VzKMiEIav89N4M=;
        b=bp+FoufCsI6j/Q5pYdOtyFoAAv5FM1GZA9ZjUfAwY1SZDreZt8FPvlqbWx1k+FLQJs
         XbO3zYvpcScOS2kU6AnPUrVHopAAnDIIygntLG1TWN5nc1qhfHRjJ5jIOO0/ZlGRyHL1
         LvsC57cJ443eSBC7kxKbI/n1iV5nUuDnlV0/Gs6zAiJWhbyy9v8TAdsCM0Zm3L9Bx/rl
         8VlJXDGmND5XVyaR2NqGhN6BN3BOI2t5Q+xwVnRVqwQG99GO3ASXbbifFF0/V4VQCVYD
         ynqq5GARgkn0zEcXtkp9T3tQOf2jeu5u5D28v1ngPFTCsel07/85QQ5LZju78Dtxs2FW
         +Baw==
X-Gm-Message-State: AOJu0Yxqz7AetU/LlA2scY2kcKaa2u9mq+fmiyxKCPWXyO+wpSMWcohi
	2wW66eo4hye+MKON3OLQXJPsnnV3dZ62jqMVsaLgTI3ugT0x5YjGIH+flMCT+CydsktZV88JUvB
	Z
X-Google-Smtp-Source: AGHT+IENBUzEg6ya4sq7aW1QaFBBcsao6oM/eWof/SzwO+QqO8+WPKu4MnxkOTanbSTh10xlJQnXDA==
X-Received: by 2002:a17:902:d4cd:b0:1f7:1d71:25aa with SMTP id d9443c01a7336-1fadb42d78bmr110124205ad.6.1719859917674;
        Mon, 01 Jul 2024 11:51:57 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ccesm69883375ad.20.2024.07.01.11.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:51:57 -0700 (PDT)
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
Subject: [PATCH v3 1/4] RISC-V: pi: Force hidden visibility for all symbol references
Date: Mon,  1 Jul 2024 14:51:29 -0400
Message-ID: <20240701185132.319995-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701185132.319995-1-jesse@rivosinc.com>
References: <20240701185132.319995-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_115158_907904_01E7A3BF 
X-CRM114-Status: UNSURE (   9.27  )
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

Eliminate all GOT entries in the .pi section, by forcing hidden
visibility for all symbol references, which informs the compiler that
such references will be resolved at link time without the need for
allocating GOT entries.

Include linux/hidden.h in Makefile, like arm64, for the
hidden visibility attribute.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
---
 arch/riscv/kernel/pi/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 50bc5ef7dd2f..1ef7584be0c3 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -5,6 +5,7 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
 		   $(call cc-option,-mbranch-protection=none) \
 		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
+		   -include $(srctree)/include/linux/hidden.h \
 		   -D__DISABLE_EXPORTS -ffreestanding \
 		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
 		   $(call cc-option,-fno-addrsig)
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
