Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6EFC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 17:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0EWT28UwL20ReG2G6dW9Z9LESsS2ODka7v6TDEzwUXc=; b=jXX9ggE2Udaqdx
	koebTOqXO4i3zfw/asZJRHwl+PRHsaVJT8UwEalyJ7e4G61HjngmAGMQc2Ud5ztR5s50VXcCN3Gtq
	IZR3RF165BVGCHZGjYs4OwxrTpkmqCMV3DgxIZxu+BDZNPVYYbeL6MHSdHfRRTzoynGKtiBjhhqsI
	4XlGPrgl7mpktC3X3MJaIH58Kc2h9rrwrWq5Oo3fQeHaBOZRkfXfx+PsHh3oh+90+bOWzrrJbS0qI
	cNkqkVOE/ZPl9YzhCFaz8V8P0moE1nP1mH1PPkdsiO4hZsZak7KBthDDvo9DL8V0WYwIJuDIdzWHc
	Byqf1hLqQncxEpXzxh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQaL-0000000E4cv-1og1;
	Thu, 04 Jul 2024 17:49:33 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQaH-0000000E4cR-422C
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 17:49:31 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3d55f198f1eso450331b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720115368; x=1720720168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DvhJcUGw5mSDBm9HbHfggA/39XLYnhdmnTEhZw5rXs=;
        b=0lURz1UbEYOcXr2oFhFSifndbpw8oR7UKZU2FdQ8Fy6TIaWiN+WWWvdTCLeJdR5Tlc
         dLXkTE9ByDepvuDQUPe5YwKXlQGUdI1l1Yz1uSRvD06gB5+nsd60G5683PN56azyh/Y0
         3qL0B217LH57oIoR0XXB40pK0fxpnwcE+MAYpwBirIxMvwTf3sHsAmvUrdtOz9egLLo4
         x39DJFRFBmmvOq2fANfUZ2rW3RdCERAxd7aeR8lvyIccIbxzEotIbSqZZF+Sz2pQO0TS
         BnI3iPo7JeRPSJbUyQdQV1UtoaBxbPllULelVHgKrQ4lQ1cUV7S0CpNUDSrQsGEu0DpG
         d2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720115368; x=1720720168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DvhJcUGw5mSDBm9HbHfggA/39XLYnhdmnTEhZw5rXs=;
        b=DkCzzu6VeHmQQZvPskssBUXE7zxwW0SOMG6vVPOYBC/vIB2v79lMsrW32ZGzdWtdGo
         F5xKJpFKV1hmzqnHSVo1w1LvomJ8JUn14Ag5Nw7/Rqlx5QQLLtyGhInq5A1o8GRkAbQK
         LfCDE8O2fXaPNL9+Ev/wOnbC0LR6WearrjZYczQ1iOIaJzHzlRjGbapmBRcGY75MWY2R
         UxmHbZ/Keqn2fHR6tAzx7jUp03eSI6p+bvIekonb+sRYFgtgBWgys5gdQIgI5sy3DsH5
         5RKIYVL9oRUqXj3SQqF63GPM6UeOdAtP8at0QHkJBWHIV0QhJ/BZxbQyJ0cCrh2HIVZt
         I1uw==
X-Gm-Message-State: AOJu0YzvuU4zWJozQzd5/UgYYuN/P+eHvfOvo5E/9An0BXaDJ3+jDerQ
	Zj8ksZTumJciH4SRh0Ki+sQ+cpR/hSefJ3zhvjMjrts9VsJrpjGBfIJQo8zpf4eqK8puDmfjmnl
	7
X-Google-Smtp-Source: AGHT+IFRKfWFPHYOQNNsDxONsyfHFn5PWuz2aud4gnlOxL74K1BKCKd+mNILE8YgXYiSSjdmvpxcmQ==
X-Received: by 2002:a05:6808:3090:b0:3d5:6306:97af with SMTP id 5614622812f47-3d914eae92dmr2516155b6e.46.1720115368421;
        Thu, 04 Jul 2024 10:49:28 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1802:170:8756:5e46:4951:e2d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080205ebbcsm12505399b3a.40.2024.07.04.10.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:49:28 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org,
	Drew Fustini <drew@pdp7.com>
Subject: [PATCH] MAINTAINERS: thead: add git tree
Date: Thu,  4 Jul 2024 10:49:21 -0700
Message-Id: <20240704174921.2514921-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_104930_181768_2B0998B1 
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

Add git tree for T-Head device tree files and, in the future, drivers for
the T-Head TH1520 SoC.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 120351e41ef7..d60b066d5880 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19322,6 +19322,7 @@ M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+T:	git https://github.com/pdp7/linux.git
 F:	arch/riscv/boot/dts/thead/
 
 RNBD BLOCK DRIVERS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
