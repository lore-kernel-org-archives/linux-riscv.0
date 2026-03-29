Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD73FC97EE
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=brM1FGP+ftTiYl3GDtA2goDOw/yEGbtu+powEFEbLY8=; b=kpT1alsVrLYfgV
	G7CtBpFMSd9J+A59WcjW8g5GeNJVBgrDcf1m3fZR+18p11L2Hx/Sh3lGaagBSKh3qZ16XprCaGh35
	MqiATN4qPyLeDmtA4r1k8MYEwuVM0QWmz+sJPKmSuCDXEL/D9unqYQs5bLz0WLkHMAF2jNa7ac18L
	0kckWHdTjxVMKb0D5dqNuTQfx/wZ/toruvrJImjEn9IukoVPLPMnSnvtQzO4wnu4UoOL+WFjPLny1
	RILfXlnoOpdRAnfYW9alntwlbTyyFYBon0X0NP4H4LztGTv4NDEn9VkTpEyHzrj93hM9aPlbgH5ez
	kgYr/ufJzj8X97CFW7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6wob-0000000AJPr-1ayN;
	Sun, 29 Mar 2026 20:32:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6woZ-0000000AJPW-13jC
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 20:32:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so36679275e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774816373; x=1775421173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+b2y5ZbKBYPAjv+L8XhgxuSswLZTcKZ7nB2tv1qr8QI=;
        b=KWlRKKhvNaK3cnbCuH234AJ0U+pBr4PxixsMqcAQVn8cE9O36Yu72syqHFF25BWon9
         9J6MZfPeoJRrE4394ZQZ5vir80OG4g4G8pXQk+LsB7hsdTSMr1VJZCTd2OTYYGOlvy0K
         C2kyf40fMpXoOk/ztLZWvTpNJYq+OB4SceT//uk9Qpcoep9Q7PpgMZ+56dNqFRvIUwoV
         X/czkOPB++mq3gdqiT9ohtpQ9odQ4I5vgxEVcTu6QP21b8Wl5WWbvpDgx28m3nyE0TJY
         qD0A+FsdQOJT0g/NcK+OTj1TBAR9obLQgMQZAQNptCUxL55oHdfMHHC/N5NU5Go9++SY
         GNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774816373; x=1775421173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b2y5ZbKBYPAjv+L8XhgxuSswLZTcKZ7nB2tv1qr8QI=;
        b=ku1XBb8ENEhr8aJd6uxFAN/sHTqOPRd0ZelrVDT2Favm6rwkfAykHRJrqEJTazuDwG
         O7T0tovKWujsPOVQtgDJ1nYGTYlYVAHOaThbtS7qA7/ik5HJSnmCgeMRCq0bZDkXvMQT
         ibFv7dHgWc7EEZt3LwnlIQO24NuyyQ14CSX/Zz55hOlrvo8Z8cmsJhnmj1nbfXCo4zd7
         QdqRpj/Qc6/wylx/F456IVa3Sgmc/9F7RbLXg3MNdeYDg0CBJ9DRS7sFP34eqF1cYPgk
         P+goI9lA/0boCFmesZusB7s1ivH2dmeoyly6p+OpUbO1Do84ictKNtzkfT5tjvuyfIrr
         eK3w==
X-Forwarded-Encrypted: i=1; AJvYcCUO8vouo8lAOB8a8D/CFxzg8qWhm7sM2rSYY7u9hTAl0T0QGPAG/rOp/jeVSn7owZeZ2wnkGImhhuO+zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys+X/K7swKdPhM/X3AUrbONIgw+7Paq1J/BI/uZe76f0KcMu6F
	nWiOjZ7O5bwFRcAPcpa+XuWXITeYOm5xtJGoANYNQb1E3RmrXH/1cT+W
X-Gm-Gg: ATEYQzyz5daeC1aSGIsUgO7BzZvmQiJyOHC0Zi1roPdpJKGO/Gn225Z1bH/6bV3BvJd
	4u4pMOO/DPFfaClGtItMPt8bxmCd3cO9PK8kP61//GCesmC3lV1i+Bk3J1BA1sHfFPXb6DZP9py
	pbcsUQBiJWTGNYXCYkKLm00cE9McrpytwDxCKT+MBnvY2tsrphIO+qc/p5s5skyUVCcA+yP1wNz
	Pj4OgWRLH+G1PSRCnKL2CMNz9TV0fpJu/cnF1YSiUc/0JN6lTlQVoVoaNDR0OPA6XpzBAfRqgyY
	X+XSwzmjPmvULVjK00CFOt8bejY6ZpuVy7OJeT1kcyzDbMI/8uuPv3Hl6rmb22aML4iMtYqcHbD
	2QST40XQlt0YF074QIBnC+dEQOUTCH1Gtn8g+TOAiNH0xCSkSiCDl62bjS39+ovHRAozSgICgsG
	dc6HRaj+Bevc1AqPG4h/XCqCA83+plBzLuBHYoG28r4YIbiutA/EVXdis=
X-Received: by 2002:a05:600c:4744:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-48727d5a2c7mr167241435e9.3.1774816372655;
        Sun, 29 Mar 2026 13:32:52 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4f5sm13949645f8f.19.2026.03.29.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 13:32:52 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: charlie@rivosinc.com,
	mr.bossman075@gmail.com,
	palmer@rivosinc.com,
	alexghiti@rivosinc.com
Cc: pjw@kernel.org,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] riscv: dead code cleanup in kconfig for RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
Date: Sun, 29 Mar 2026 21:32:49 +0100
Message-ID: <20260329203249.563434-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_133255_301471_FF7B8730 
X-CRM114-Status: UNSURE (   9.28  )
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

The same Kconfig statement 'depends on RISCV_ISA_V' appears twice for
RISCV_PROBE_VECTOR_UNALIGNED_ACCESS. The first instance is in its choice
menu, "Vector unaligned Accesses Support", making the second instance in
its specific Kconfig definition dead code. I propose removing this second
instance.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 61a9d8d3ea64..35a2926494e1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1004,7 +1004,6 @@ choice
 config RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	bool "Probe speed of vector unaligned accesses"
 	select RISCV_VECTOR_MISALIGNED
-	depends on RISCV_ISA_V
 	help
 	  During boot, the kernel will run a series of tests to determine the
 	  speed of vector unaligned accesses if they are supported. This probing
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
