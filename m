Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A9DC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kbn1y8Z8bpwJK9IZAnyvS+tu/PdBVjhChVSR5HDZh0o=; b=g+naGKCCuonpgV
	iJvtaSYeIfOWoOxc4302l/vvZEyzb5etivQSihhGgUCMuXF0i+lvpFpJJHz3ugc09d1qrUKhiZFn8
	I3ikiKNQLEkFgVR7foNRA+ZvG483e4X9cPLuwYPsYnodhhchHRXVteZhh7HNEY0w23jUThz6yzgV9
	DmO2SqQso1YrWyd8wCAjEulMIEvIUsqS6TqJYR/N8FG6JzYpaBS6STzkTOcpnbjkwA8pBLNkyywsa
	3aG6F7ktiKbQGgarRN/W5i8bWePCv6chvkJwFOU5kYfkpsbEgJBYVOH1P+LT4+VrQDCtExdfcPqhM
	wOdeCrcXeAEVeogmgZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWGe-00000007jKH-1S4E;
	Wed, 26 Jun 2024 17:17:12 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWGc-00000007jJp-01Vx
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 17:17:11 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-713fa1aea36so3453789a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719422228; x=1720027028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sfc+bItioWOLi2TuWFqieQ4WdP0MPgrB+J5zxVf671w=;
        b=1d0JvubzGSVr/NOiBrLHIzzmlQPS8GYiCQMq/cUhYr/NsAhD3QL2DJ7/iNztji4ywf
         EEH8drHgRbtgdYyKVKM8bgjcH6VkOW8wExsa92Bx3TUTkEq6+iqiDI/yEJALxao9skke
         KjOneVhnXwQBovqu/fXTNAyWYQuYJSH3gWiyAHOFMIUg5Yn/c9qjLBjSKZm/2PQblO5t
         t98YkbGJ6QcJG/zYtMwH8rR8mMkBz93p/PCs3DXgAUf3wCRhkuLkaqyFl3cgM6Efp8Bf
         l1RIGahACbQHNuch64j2TXsiAYJb7PcHw9Qj+jfDYbgctgeAoT8ac0M2Mbh5f2usfwlV
         5ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422228; x=1720027028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfc+bItioWOLi2TuWFqieQ4WdP0MPgrB+J5zxVf671w=;
        b=srmY3RCUEy4QqZot9vmjLtda1rmXp5XVF4hGKYM9cymbiFja6vaBaRyLyowT97u6o0
         alsoowQhI2Y7SxUsHxsmdmRsvEn0AWYVlmP7GZdPtcofOQgT9CCqKIocej/x9rJMt1qg
         kUDwNuuRO2Hw+jXpLlZgjoMrX4yw5QbfrgzNM3bIE5nbUsoDf8pWKOqJoo0qF1/ZwSN7
         bk/5hyeLugWlK2zE6mTyHUlw3E+SsEAmLjNEaEnRiJpLsateD3ifyn3S8gWUEmf8gAcO
         W7G20C9RjXwO7HcAmBORrTr27bYpE1OV/HDoRD+VAeam7hn8RGAPx21bQKXosYifsvAG
         6rrg==
X-Gm-Message-State: AOJu0YzbktEI8m9o6QKCbnp40Zxmv+Bc4ECMOvorugCi+I/qHrUeESs2
	KgQLFtZeO3ftA0BppwYBP/P9NPdC4Zm3VTt/JEfrvgu9U9XvAUcLd5Z5KFiGazGTSFRhtTlFUxp
	c
X-Google-Smtp-Source: AGHT+IFRRYAJqPRgI7bs8MXpEZG6vyONCJH7c7jAbKBR0F7SXl7y1eqCXlLYI6Wy4OsF9R8wyxyQng==
X-Received: by 2002:a17:90b:b0b:b0:2c8:53be:fa21 with SMTP id 98e67ed59e1d1-2c853befb16mr11452942a91.34.1719422227952;
        Wed, 26 Jun 2024 10:17:07 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8f3b5ad36sm83217a91.26.2024.06.26.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 10:17:07 -0700 (PDT)
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
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/3] RISC-V: pi: Force hidden visibility for all symbol references
Date: Wed, 26 Jun 2024 13:16:50 -0400
Message-ID: <20240626171652.366415-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_101710_090254_BB0EA3FB 
X-CRM114-Status: UNSURE (   8.13  )
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
