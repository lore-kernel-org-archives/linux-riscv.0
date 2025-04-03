Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E4FC3600C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gbEIw32Y1voStGXTPkSpCTmwWIeqae1XhPjm6ejyXL8=; b=ZFojMfBRHs35qG
	sOq10OZR0Joec4/yZ5q2uWitnK4G4A7UnLh94FiOJxY6tZqkXpfEMkSXWyJotr7+MEDgxs9QK2GF/
	ZFayW6HIFf6n8voVye4cZF9eJOZ/NrdEiIcGJn11TzsK2ysxp8mCOyVenLp0QDzdZEWkopUKmUYCJ
	GCNyde/7tNQHC7fPSU6FxfselETT+xbTY4ySHtbNkmMlIDVdTG/kO4+uL1HT/rIF0HHDPfA5myp5l
	QcKIv/5mP5cSyZWpMWxFegvcMqAKr2WadQlf2qD28WDJFIE5SLtxmKfGXkcFdxxzD1wm/AXd8hxWq
	zwSV2bSEux2FlfkFeRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Kpl-00000008wep-3lfE;
	Thu, 03 Apr 2025 13:42:17 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Kpi-00000008weL-3G5q
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 13:42:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3996af42857so1410623f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Apr 2025 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743687733; x=1744292533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KzSv22Tlh8b0C2DIJrcJuTRBaLWunIy9hBuJEBnkWz4=;
        b=vYFJZFxUYtuO278oLrTUSAT4hwQMXXTAUINoiaRxJdwFe1LAhhF5Etf3B70qqYJqLR
         HaiMIN7Pd8xbxwuyTzqb+tzZIakTEB4isRBkt+8RJWbwYYkU91cjZmtRggBDjYQICvlX
         I2EhYGN+urkaQRN4QADCmNU43zzDW9kS9TB4a8KA9LFRykKL1gvNegzEYuU4xpNKZbgC
         wKrl17tGCEIJsHk8ads1TXT31lHGlGEzZAe5BwyY/I1cggozE/Rd7W9sAOndp7Hv6m43
         ciIKnT3PlfFkDCEYSK2d3iqpXT24COeKff9sigJa6UKKxBIjjBzAOac01wnjLD3XZads
         U6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687733; x=1744292533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzSv22Tlh8b0C2DIJrcJuTRBaLWunIy9hBuJEBnkWz4=;
        b=XdCW1vWZMhj6LrLN5Xd1bMOvdE4oGrHNW3wue6sYqwJKL9mR0IagDoXAgZkfLVqTCE
         pcWaDriEsMo9dWqneBBxjuQUdj8SsF7qdzLYpe29n/mR2Y0FhW/0QV1U/0JiJoalU/jO
         Z/e+Hj23xdSmo7HJr/Z+96vlVLByCr6GO84BEhYCqq0ONX+PFdoAiZBxqA/TBe0wo3wN
         imLe7+S+AJWACVZ5bKc03NS5vQhzMl0XLIzK4toBCuIVCVYbSdoMfUltKjfzdVJNvnJC
         qm8lfV29IttJXoqpQf0Dl5VsVAwd1KjDzWgjlYaGhGJ12xpv9GiWT50Z52fe66oQJ7gp
         BuNA==
X-Forwarded-Encrypted: i=1; AJvYcCUBfu8FbG57e7ib2UPzrQzMtqfjuuYaeqUmg1XgoaO30yPN5mqRi3gvnYt1EWR2nfZo9t+CQSvjTcGVNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRpTGtWkFA+oT+/G7To0yuYW6ut9kdQCEPhmT37NGK535Vc6Ze
	XyxUwhbTO3TlYcmitQHK9GNIKZJCU415MbZFoVxohsClBG7PS6C5b6ah35Z+b60=
X-Gm-Gg: ASbGnctn951Z3FgLe0VL2Kw9eq3vH7cy28/YJVbZaZOHhJeBL+8hROWfiYAAVxWYYNT
	69e/M8eoQca6H+W402u9IgwWvjHMcq/rHUXxkLqk4drWxA/hKsSMsps3Jy4xbrP0DlaP0BUsWck
	+hHeuwTD3CR1PNNkHzgPqdFzNWMw8rRdlI7dJoLTVIp/t4uF12xBXWH3fLp4dQLzQ4PM2m80nHs
	/u5n9twG6QFnQit4GHRTUgFfkbL0EITkF87Ox0pb348EtagY/hB3IHsymQeBHhgjKQmcpZ+vKRO
	D6WhDUoEZru8a6vfQlQJ8oYnh2Keqz2R+9ULOMdSEbBQxgpwURQ4BjzIGTBGi6uyTNETzKLc56M
	=
X-Google-Smtp-Source: AGHT+IGq/wOsMPKFUCVYs7nL4AsOHO70+LxMIkYWJmXF6+zZV/6eUJ+XSIteFv/WFh6+yfsrGoEdgg==
X-Received: by 2002:a05:6000:1786:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-39c2e617779mr3043553f8f.10.1743687733190;
        Thu, 03 Apr 2025 06:42:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:7c12:ff06:d34a:d3e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm1854884f8f.53.2025.04.03.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:42:12 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] scripts: Do not strip .rela.dyn section
Date: Thu,  3 Apr 2025 15:42:00 +0200
Message-Id: <20250403134200.385077-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_064215_170274_DC12A563 
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

riscv uses the .rela.dyn section to relocate the kernel at runtime but
that section is stripped from vmlinux. That prevents kexec to
successfully load vmlinux since it does not contain the relocations info
needed.

Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cad20f0e66ee..0a1f1e67a0ed 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -377,7 +377,7 @@ quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
 quiet_cmd_strip_relocs = RSTRIP  $@
-cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
+cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!.rela.dyn $@
 
 # Gzip
 # ---------------------------------------------------------------------------
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
