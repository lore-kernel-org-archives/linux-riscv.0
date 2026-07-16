Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58913C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 03:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQJi5ijYhTdy8wRBWRz1n+PE05HFbcPmArcSEsyPkMM=; b=U6UKWoNEZ3nuAW
	9Sk3cNNvvdD07s9BU1+Prv0xyef/ze3ednaBUlpDChx6RSriysQrKFRzGahuj0pi5NOkOGAEGEUHb
	RKiYIGY0lyaM9Som+53Rn44R7GATLuHwgVyTYzyHubI9zjKSYLiLZ9KTENrQY/JNZ/VLm7xEVhNrC
	eCta4gZEsNOFNJAlhXSQG00gs1WjgS/P11KKIYynzHXSj0Ixd/eB2D08NLwGEua4fc+qNo1foD+DU
	cYx0xjZOILeC7QZ2rYH4dO35nB/K8zfCbYyIczwgW50dSV7JlB3I30yeU7fGAW529eI/SZh6d9Aa6
	/NxXGFthHPiZOwIYy4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCg2-0000000GKym-0tgH;
	Thu, 16 Jul 2026 03:22:22 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCfz-0000000GKxk-3ETB
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 03:22:20 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-81ee2c048acso1910627b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 20:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784172139; x=1784776939; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmLTscAEY1O1j8tiZ/+N1t1kAFbbT11AKs1SQQgixyU=;
        b=Mj0wnsCwjDPIigKz+rBR/hcE01bZKPb/A3ZVgReF/5cwdWAP+Mu2S+XiiYVw+dnkP/
         WsFFJ2aErCOcyx4YraydYPQy+Ug2m5Ez0i9S4fy9DIPERW9//6Irxt7cvmzO46OTlHos
         EyU64nO4EBo1zFLFGXbOPn4FDKuRlRnuLQqrZOa2rWHQTlCfRHIFlDnLw+6iza2pYOVn
         22Kjb7LoWvJdawq1ytllZl+B3g/vGzqLaTeS5VJd5cX6qaRkryDZYEe5EQYLhEjMta9f
         XbCiXSc4Ad9wsHqOxj4iItV2sKMlIsUj4KfKlgjDTGJG4Bv7Kw2ciyQODTUgm7JR/td6
         Dbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784172139; x=1784776939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmLTscAEY1O1j8tiZ/+N1t1kAFbbT11AKs1SQQgixyU=;
        b=CS+sMon+1MHItSYLeqc1uKDzOvwh6c1V9qbJT+O1gWYde1S5gkwqmxt0yxfr7s6o6e
         KfM7/feBCadHKy+/anD2yvgSeXu8DopBUaNDBiQsV9Bhr9z64aMO88plwPICLxxAdT7z
         2dBD40rIgx7q+ftrzPMt6/72Swszf97vGFx5FFgmFlccjBO96wlFluRudAeiUfbhsU0C
         Hvxb1ngRY6CLYwBy8T8AC9NZoj84Ub48omoGVkQqCZQtn/ZERt5v068ewYMmocRFHLNF
         TRiht92hrQsTVb5CKZWxJfcrZHP+tBxnZ7u1eHkdEogUFAt8vDXzjxsdThRx46xKuXw2
         Vmxw==
X-Forwarded-Encrypted: i=1; AHgh+RoWvz/DlE2VyBrC0ha6KFg9UnCOOd37h1Z+qGgj4FJogP7v7PVo8aAlDwhofRdT5a01Tl+5IJj20vZubA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb8fISBk3fk1j7h/zWt4RTzL6JTNOvCmW7ywQKjTw6pM/jLcJZ
	86n6t8NbKTqrSRWP9BbIkILYktwK4mp3eK/NH1VvpVhfxmUdsmDTpnhmGFXQXc3SlRo=
X-Gm-Gg: AfdE7clIr5KWPHsBAqAXKjtFwR7u2Pt6j95DIwIwR1uXYuieoNVLP4bvyIpKtP8EIrE
	zb7sAAvUoNSWWScE0gwIVIlKusR9AiBNMssyw3ZutiGV5bvbn7Nmi5pUIcIprb/PCpSTBpLc7IM
	BoB1VwhgaeruQw31cz5k+zlEhZq12vJfmpt0SPvjVnirUDsAj3g9Uor5YWUV101P0CsXVlpTqsb
	cAfhhHmQqWflKUih1YX97GXh5Npr8LCBCgI6eKDSjdKep8nFlTSSgCc3C7NtNzHHccAqjnnN9Nw
	ew/vsN/LxMbOsOX5hBdI1pUBTodP5m/btwMPpLfLWM2I1Ac/XVC9w9NhoygoVkDOeP8vf1t2B/f
	6KlFvaiCbbwcwD9QnfVwQKp2r4EcxIxuce0d03I8kUIv/gFF3mULyZAzgOIviOP+i5D7yrX3wCa
	6mA+6zQSrF6P/KxJpijZSXYILUCOg9MY7I54HQVKEgnGNGvxXYMgept1sAhg==
X-Received: by 2002:a05:690c:c86:b0:7f5:87d3:c38c with SMTP id 00721157ae682-81ebb136b12mr83075437b3.21.1784172138727;
        Wed, 15 Jul 2026 20:22:18 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:56e1:f9cd:8869:2218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm185039127b3.14.2026.07.15.20.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 20:22:18 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 15 Jul 2026 22:21:54 -0500
Subject: [PATCH 1/2] PCI: Move Spacemit vendor and device ID to
 linux/pci_Ids.h
MIME-Version: 1.0
Message-Id: <20260715-rtw89-spacemit-k3-v1-1-e577bc63706b@oss.tenstorrent.com>
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
In-Reply-To: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
 Ping-Ke Shih <pkshih@realtek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-wireless@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_202219_822261_01965FD0 
X-CRM114-Status: UNSURE (   8.93  )
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

Move the vendor and device IDs for Spacemit PCIe Root Complexes to
include/linux/pci_ids.h so that they can be referenced elsewhere.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 4 ----
 include/linux/pci_ids.h                       | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 680acc93f5395..7b0bc1802954a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -21,10 +21,6 @@
 
 #include "pcie-designware.h"
 
-#define PCI_VENDOR_ID_SPACEMIT		0x201f
-#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
-#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
-
 /* Offsets and field definitions for link management registers */
 #define K1_PHY_AHB_IRQ_EN			0x0000
 #define PCIE_INTERRUPT_EN		BIT(0)
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 1c9d40e09107d..d6f26cacc8e35 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2640,6 +2640,10 @@
 #define PCI_VENDOR_ID_SUNIX		0x1fd4
 #define PCI_DEVICE_ID_SUNIX_1999	0x1999
 
+#define PCI_VENDOR_ID_SPACEMIT		0x201f
+#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
+#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
+
 #define PCI_VENDOR_ID_HINT             0x3388
 #define PCI_DEVICE_ID_HINT_VXPROII_IDE 0x8013
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
