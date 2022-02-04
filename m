Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A17C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yhSvTMAPSaqPIE/Df4QS6PH+2Xa6YwHebZhlTMpGMUo=; b=wcaXOu76Fw8CR7
	sFWBmDjsZvv1EXABwqWVDNTdAtmQyPIYBN1kegURfkHOUtlNXQGnE07dGmSg6SSYovWPBHwgoNPd4
	xCSv4h31rzPhEWz+PmT6iYMEP/ZWqv0gB5lrYKs9nxoKSSvTu+ZQv+YEHtIj7Jyz9z8KBiC+XGdJI
	5R2hIPfLrDPOL6uhyadQwgWhAk1kJuVu64pSQSJeAECU2/EiRN+0vu15VFh3tnpFvMnHALlCfL1/3
	WKoFo+SIAcSL8pg4oJhCxP/JCMYRnHuvQhkY/5TH9sQZxrwhj6YzQDXetLaqq+ytDrUUoeteW1Jl/
	MbeJUgumK3PB0hLCqdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG0S7-004itm-SZ; Fri, 04 Feb 2022 15:24:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG0Rq-004ilw-6M
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 15:24:31 +0000
Received: by mail-wr1-x431.google.com with SMTP id f17so12046964wrx.1
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=soKnjeHrvb0Vn/OrIQZL5gTE/wserCdzPoCpnB6dAOs=;
 b=Ar8+AUuL8+EV8Mbyakvk8rCdb8vBDQDZ0wK2uKlNwCV4jYN1AmNrP7NQ/EtuZTXoFi
 2Yl81ipRjLBcXR78jI/zCI2QoAIkax35S/dR7zFrq1cryNK6OJIafzz0FsnFLgWRNLS/
 rtR7tbqD7yOc+CZT7zjZq7agDOH9YvZ1JwjusMRyGL7XoeC7QFxMXgZ3zAtOdQ6K0KMb
 l+5TL2qdMvcjIlRLDbVG/4/o1aAA/zYvFPHaEr9GmVfV10y87G+k390OMXgussyLZYVM
 p8HsfwGIiS4dL1L6reUg95UjmSbCvGdRb1AFC5wdwxZkUYEs1PC14El5mF3kzXHj4VuN
 VZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=soKnjeHrvb0Vn/OrIQZL5gTE/wserCdzPoCpnB6dAOs=;
 b=s51g8wNowEo2QJvaijg9CRiZaI8LBwn660AMXj+4IUVgVrjAnPw+fs5v2OLggyJaT9
 nTBTycFI/6G03EHVqOdS4TT6B+AJu11wVZpEGjfLQlx8GxWXmuOdihrDADI6Kp5mDt6H
 uzI2vbrP5fujcAyhWxlmRRbdYoXI+sduv+azb78PCqGx/0M3INcLIMCguDhoyADX4HPM
 qG8bIoHnqvJjyIGkDVG85Jsi1CyRTfywNtPusK9hBf3IWtQhlL4d3QfTQOXS7SWxmESV
 VZn/9NxoDb2EPZXcBYLVhW2bputmi0BAJaTGmGxUjfhakEym/ji5dT3eKZZLDE3hTYXx
 ZiXg==
X-Gm-Message-State: AOAM533/LO8kTn+atDgMHrQikHCL8ODESGUiL9re14M/riq3faSwBSSg
 VEbKGJDUfNrxi+PLLuQOQPdVqw==
X-Google-Smtp-Source: ABdhPJytgNIcIY/cFifvamLPbFAHPBPy/UinGTRpUk8W4zOMycVr4o/kvzlEcGBwwGXyDG5/VdTm5w==
X-Received: by 2002:adf:9790:: with SMTP id s16mr2834645wrb.658.1643988267772; 
 Fri, 04 Feb 2022 07:24:27 -0800 (PST)
Received: from platform-PowerEdge-T440.dc1.ventanamicro.com ([117.248.109.221])
 by smtp.gmail.com with ESMTPSA id t1sm2599477wre.45.2022.02.04.07.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 07:24:27 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: anup@brainfault.org, atishp@atishpatra.org,
 linux-riscv@lists.infradead.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH] riscv: defconfig: enable hugetlbfs option
Date: Fri,  4 Feb 2022 20:53:47 +0530
Message-Id: <20220204152347.1469380-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_072430_260148_14AD8A2D 
X-CRM114-Status: UNSURE (   6.65  )
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

Enabling hugetlbfs in the defconfigs to allow tuning KVM
guest performance using huge pages.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f120fcc43d0a..7cd10ded7bf8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -108,6 +108,7 @@ CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 8b56a7f1eb06..e0e5c7c09ab8 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -100,6 +100,7 @@ CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
