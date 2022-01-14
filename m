Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F308C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0k7QeIWbagG6CuE79SthAaNs0b2/4m1hBhftdx+s2rs=; b=LngUtSWIiAgrRM
	OBGYcsbpzC6PZgo3XQay0Dj7v+jAjw34DBDCPa6fTkH8v8RENAlaqLU/0FJcBqoPAXfedA0TiqIJ8
	lYwbhnU/72yMvGuh0FJhVASZA7AWMhY7kCBfflMOv6qATf69GAmC84RBiyRu41cTRduAHsfmHjd2A
	qXmsBepBY717Y+xTCklair7zDf8Cf59GU3WJYJQxcva1f3xf3ks3zOvoHdueKhzxBgdI4llXXtgtV
	fJua4VuM28dWZH/GjtADdBOf1QCuap6TlrY9kCKSzOksj5te/oa0mKcg78yCJ+R21oBBDU4REhBKF
	vzQLsKyQD5fIpYj4Q1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8IiV-008RUv-Vy; Fri, 14 Jan 2022 09:17:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8IiT-008RUN-Sx
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 09:17:51 +0000
Received: by mail-pl1-x630.google.com with SMTP id z3so12779651plg.8
 for <linux-riscv@lists.infradead.org>; Fri, 14 Jan 2022 01:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJ9jWVX1cVZCB+AdFkPwR6feqDBzuwKx9n9aDB+L7eU=;
 b=I2yvcth0kmZOxW74KiHSV0WxKJxUyNqtsCVuC3+JWwo9CpTjnYKAhYjNx+JMQR2X6O
 zmb4ao5EvvaOvpoyaFAHNSWRRjyx3SgRX6Q6aQ6OWC/BiiHQBmJkXWjjlXlLF87LtJae
 vvSEtbNxr4E1hLssV3cz822trWugBc6hG1XiT81y9V/9gw5O99sLMFJ/PQbou4w9hMYm
 8caGnt1+98lhATlKi0v8eHzTWn9rY9KfvCCCNA7H4MwFsOMsBV+xvGJb02CL5qpvfiT+
 F5v53Ja4zmjWIZRLGGwxmh9oI8lnrhKnxcjtU0evKie/DiVDH69Ik/RzhRkA5/CtV0WW
 TbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJ9jWVX1cVZCB+AdFkPwR6feqDBzuwKx9n9aDB+L7eU=;
 b=u3Txb0l8zAHFp0aqMGWykxIm+h5bRGRdavyBTzUd7jdAqyF7U4AlpKAnjgTBtF3JXn
 d5u9n8nPzgFLDUi2y7J1CxIQVvKIU3kmO5/3Lmun32vc9GqRthio60UPC2y2O8mjqa/5
 Al9BIPu30F/PzmjXUWKMrpqR42w7iIpC8akLSZsGTP3L+8FLdu4kELcTmPbBjolB1VHr
 2lwm0n6bslN0pzzFr4hjABFhOBDQ2yotcHS95s3f1Mg2kCVBsvTz8RV5hgQNYGKXHsnb
 pWkhpDjSYB8V9w3mb8fSEnJMUi84gE3JuJAIdH4E64LTvY7FEoS8RDvGcW68jVFtSx8j
 +XSg==
X-Gm-Message-State: AOAM533vUxMKaQ1IQU3fl7kSXy6273Yg5tRuRYjygZQ5thojHnHWAK5p
 G/pam7QR+ElGrDHizH1VYs9q/Q==
X-Google-Smtp-Source: ABdhPJx75BSifsQTkjSXcEqinHM6jB1Blts8AJKZqvpt94lFvVTRer5DSG20FM2kQzE3HdQKFYRzWA==
X-Received: by 2002:a17:902:c10c:b0:14a:922d:39d5 with SMTP id
 12-20020a170902c10c00b0014a922d39d5mr457595pli.66.1642151868162; 
 Fri, 14 Jan 2022 01:17:48 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id z3sm4237179pgc.45.2022.01.14.01.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 01:17:47 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 0/3] Determine the number of DMA channels by 'dma-channels'
 property
Date: Fri, 14 Jan 2022 17:17:38 +0800
Message-Id: <cover.1642151791.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_011749_991213_97275834 
X-CRM114-Status: UNSURE (   9.12  )
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

The PDMA driver currently assumes there are four channels by default, it
might cause the error if there is actually less than four channels.
Change that by getting number of channel dynamically from device tree.
For backwards-compatible, it uses the default value (i.e. 4) when there
is no 'dma-channels' information in dts.

This patch set contains the dts and dt-bindings change.

Changed in v3:
 - Fix allocating wrong size
 - Return error if 'dma-channels' is larger than maximum

Changed in v2:
 - Rebase on tag v5.16
 - Use 4 as default value of dma-channels

Zong Li (3):
  riscv: dts: Add dma-channels property in dma node
  dt-bindings: Add dma-channels for pdma device node
  dmaengine: sf-pdma: Get number of channel by device tree

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  |  7 +++++++
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  1 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  1 +
 drivers/dma/sf-pdma/Makefile                  |  2 ++
 drivers/dma/sf-pdma/sf-pdma.c                 | 20 ++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++------
 6 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
