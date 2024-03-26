Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E1C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 11:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qYD+mZXrWTYI87ApPwntvSC/7TbaB6B61EEDoU25klM=; b=bF1G9NLMrVk8n8
	T/itaBAt1l/mnAHexsCvLIE/rONWv4eMrrrCX9QdGqJa1o0w8FvtIVVNWBHQr5HxxFKEmCV6q/na0
	Nfwm+wAzvt1HzDjisEm0HDDbhppdtJ8r1qWSuPGaL5zxxeByZ0+EfudRXTuZQm48jHL/xWZgVBmH+
	5XbamlrO+oFXA7B+ezh1/px9AT9xBWK5PjSf1fCMaonHgpdDzLYJfhrU0PSHw3TQS4gkPJK3uj8wd
	B/IXEBEGQnXYIjyEVWj/ZtNWPfhMPYDq/wh8n7PJbSF2u31L9oxZh/bwh72ksf1rwcc9Nu29nkKGS
	Saz2sS8Q2vLsK9dHL2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp58c-00000004I1a-1aPp;
	Tue, 26 Mar 2024 11:38:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp58Y-00000004I0H-3Ttk
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 11:38:41 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-41485fcb8ccso15409515e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711453113; x=1712057913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4DQoBiWf/BkzkccPmSjgU6K6Hqbqo4RwUCXEAIRgf4=;
        b=pOcZOcD7NZ+/mKh6xfpc+ppS814gU0IKHaG8V0GUQ3zjeGYBoembuzSvmkTamT2J/N
         DX8r5HsgoeLnDklwpS6SAIElnNemUiqbsZYNfcGdkPczYMKd6yNJCYVBNA6M+7UZbS2/
         FEw4QvxA2eFGFQyRavhXSYvGWQyp/sJ1XPQXQ/qLfZ9Y08uhKLu/QkRMU+gWK6B4UZW2
         5CL2ujAXTa+uIQM6QVwHALjkxR/bAS9Dc3ppZ4E3n6wWDBlCbLQhSwhjZSnVelARftuK
         j19i6RcfX6N9zfjcBiiNp3V4BBLm5TRqdbEzfiFRh5Nx5elwQaz/c7U1M+GSIow0N0XW
         dk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711453113; x=1712057913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4DQoBiWf/BkzkccPmSjgU6K6Hqbqo4RwUCXEAIRgf4=;
        b=OizXRxP3Qtwx2nHM+E5g05gC9LPTNj4YZ+QONwyd4DXYQ7HTmkYNgZOlgSkFWw8b5f
         FdunyLmMXhpYkggs/2pi7Mrm2mAH0cdZj0dK7E7PWdp/rdDQhGRV934nKLEQo8zp8oHb
         iaY3i5U+qBNOWp8pxm5mWCsh1N++/Rr0mpWRnKNG+UVAv3SdMzNB8tFecEPv4n8LXF4H
         86Jn4fjMKcseLs12wu+EjQtYREosYmGKeE8MLMc3Ij3Ig4vlLkM1aDhtPXQBBHWP+dt5
         1v+QVahfOqicmVHZWxeM15x96JIhScXV10VOjdAoESU4yeLVGvhLpELv7BiohQahkAk6
         N8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVotRNsq50/DXJRbyzi2poqQwczo5tDO2jh9KEIp2kILp3+A32R1bl7tWOd66pLqk7nixIqUeuwLti7o9vd77hVP+VqwST9HPA8KdJypIcY
X-Gm-Message-State: AOJu0YyasZ8RpeVxYAxio1SfJE2SfQrjc86bCmBb15dOZY26+OH6C1un
	1zxKX2g1OrvWs/Aq4MIWhzmke14T91kDdaT0KSYRBxDRbj6eK5MQCf2MhU2NPdc=
X-Google-Smtp-Source: AGHT+IHIA4FG4O7jwVP+ONy4VLO/b2zyf1K6Fncbj3wE/pKbtfVJFeYSYeSda8MGMT9Kbbyf0H9Y3Q==
X-Received: by 2002:a05:600c:1987:b0:414:8675:513a with SMTP id t7-20020a05600c198700b004148675513amr4673999wmq.16.1711453113422;
        Tue, 26 Mar 2024 04:38:33 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b00414688af147sm11319966wmb.20.2024.03.26.04.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 04:38:33 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>,
	Roman Artemev <roman.artemev@syntacore.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Check that vdso does not contain any dynamic relocations
Date: Tue, 26 Mar 2024 12:38:31 +0100
Message-Id: <20240326113831.283025-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_043839_015183_A715A5E0 
X-CRM114-Status: UNSURE (   8.34  )
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

Like other architectures, use the common cmd_vdso_check to make sure of
that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vdso/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 9b517fe1b8a8..dd4877f25928 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -49,7 +49,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
-	$(call if_changed,vdsold)
+	$(call if_changed,vdsold_and_check)
 LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
 	--build-id=sha1 --hash-style=both --eh-frame-hdr
 
@@ -69,7 +69,8 @@ include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
 # actual build commands
 # The DSO images are built using a special linker script
 # Make sure only to export the intended __vdso_xxx symbol offsets.
-quiet_cmd_vdsold = VDSOLD  $@
-      cmd_vdsold = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
+quiet_cmd_vdsold_and_check = VDSOLD  $@
+      cmd_vdsold_and_check = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
                    $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
-                   rm $@.tmp
+                   rm $@.tmp && \
+                   $(cmd_vdso_check)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
