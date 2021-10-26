Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3BFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 21:29:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B897060EC0
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 21:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B897060EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mSKa/j9cZfG8Zqh/iygE/z53ZcrDJssa7ZRWeDr1xC0=; b=Q1Fg46vajNLhrA
	8cRdpNMS++JSdLAcppsWgag4yqtYHrzwU4JyvWCwN2y94nS9L0awfg0/GYF3psl0EKfEx/FRDn7gu
	nQIqlMKurXKAIoq8QSgr7I9scYnpxMjbtfmMc0mJICJWSeoZmW6LcpLdUq/hm7Mr1xq3Ve/JaXmsX
	D0js08tE/IN0ff8J3D5X2WA/OEg1zFgCYIfa0K6YgcFaF3cVCMQvHyKVvHPp187egEuy0N6kOYCHa
	bcZgcw1hdX1vSrNZf5iKuE6rb2R+QZlODqCZl5lnoP9h0pOP0ez9moVi+efmw03e7CZDutqlVAUmg
	8HCPgRCjdmlAD9trJqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfU0a-0038Jf-IF; Tue, 26 Oct 2021 21:29:24 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfU0X-0038Hx-KP
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 21:29:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so491485pjb.4
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=/rggbZqE5Rg53L9CWqTqFtP/omYvr2W+TYTAvnb1AJ8=;
 b=YYG5EFToI18HDvmKWoho9CXqxrIukv1G1OFNYY7ppapxl2/8Qo6w76wNNlYQDtC+PH
 TZOAyFHdjelYBkK6ckpXQQWWCZz+dDOnjlTyW/a/7Cgn5ZeD4Wo9EnQ4wYbrTM+TwZGt
 VdchOWOBKXov5bGwJoJYJj1RdL2T6CTIL4+qcO/Zugr18t/cSkHeutn/SgbFOov4y/ke
 kyrSvrGNgK9tdLyVrSPBvVaQKliTli0ymqtDxN6yRXPQIdeU92fndygK/utjZ/S6Mowi
 6RMVeobFGLbDeGUzBo4oeEaEdxULO5U3Y7J1wNDAphiHC/x8scm8cR5FW4oiI2Y2maHf
 zdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=/rggbZqE5Rg53L9CWqTqFtP/omYvr2W+TYTAvnb1AJ8=;
 b=cw8k7rkU1wQ1hK/4aI71kIP9Ke/cRbSvmn78DjnBloZqHNqlqQRXSGxsgjGxAiL0uN
 o/bFMRkS+HcJn5zZNE1mxtEr9HrVy3J+kKrWi/LxgiD5hz+6nHX4yIGWhJr6lTNFpPtO
 9RQfDktXkQ8C9itsQCCQtj0bm8laRKMoAJmH0XR4Nv7+ySVAnzyRIDKy3ZQ0FxN7L3Lx
 f60DJdkV1v3A18g+xniOkg1buyTMOBeiUc1O5e5fbRZHPPGMVenehjz/J9ACmOvtQgAY
 R93jW3Q3yLjd7h6Fqn3L7+x9ratpIFzYIA2ijoRf2TW98wF2T+mD+/6yVdwN7A8e3Fgl
 7urQ==
X-Gm-Message-State: AOAM5320jVaDYO5lXXjrp+nwXQrs0HqiF/n7tazPTzDk6lzaoQvCMgZ6
 MDhuENXoPaRD1I4JSEqDAkl4bA==
X-Google-Smtp-Source: ABdhPJyqrIYUJF2En9mUPq6NoFdbkk/mublkErVsHXvtRUfBsqo2RFhZff/2wn1BzxkEVGWFKkx+mA==
X-Received: by 2002:a17:902:8b81:b0:13f:3d30:f624 with SMTP id
 ay1-20020a1709028b8100b0013f3d30f624mr24709007plb.51.1635283758910; 
 Tue, 26 Oct 2021 14:29:18 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:676c:ab93:f48d:23ae])
 by smtp.gmail.com with ESMTPSA id mp14sm1706539pjb.17.2021.10.26.14.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 14:29:18 -0700 (PDT)
Subject: [PATCH] RISC-V: Make CONFIG_RELOCATABLE user selectable
Date: Tue, 26 Oct 2021 14:28:47 -0700
Message-Id: <20211026212847.43108-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_142921_748665_18E811ED 
X-CRM114-Status: GOOD (  12.81  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

This should really be up to the user, as it trades off portability for
performance.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5dea03549493..f8a36034d54b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -212,18 +212,6 @@ config PGTABLE_LEVELS
 config LOCKDEP_SUPPORT
 	def_bool y
 
-config RELOCATABLE
-	bool
-	depends on MMU && 64BIT && !XIP_KERNEL
-	help
-          This builds a kernel as a Position Independent Executable (PIE),
-          which retains all relocation metadata required to relocate the
-          kernel binary at runtime to a different virtual address than the
-          address it was linked at.
-          Since RISCV uses the RELA relocation format, this requires a
-          relocation pass at runtime even if the kernel is loaded at the
-          same address it was linked at.
-
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.erratas"
 
@@ -433,6 +421,18 @@ config CRASH_DUMP
 
 	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
+config RELOCATABLE
+	bool "Build a relocatable kernel"
+	depends on MMU && 64BIT && !XIP_KERNEL
+	help
+          This builds a kernel as a Position Independent Executable (PIE),
+          which retains all relocation metadata required to relocate the
+          kernel binary at runtime to a different virtual address than the
+          address it was linked at.
+          Since RISCV uses the RELA relocation format, this requires a
+          relocation pass at runtime even if the kernel is loaded at the
+          same address it was linked at.
+
 endmenu
 
 menu "Boot options"
-- 
2.33.0.1079.g6e70778dc9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
