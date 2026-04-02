Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3ACD3940B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gxQab2DLLHetYLretYD+5YEUvLAyaNL4zJIYvcB8xJY=; b=fBp3m2Z93vwyAB
	k/Tvf3r5eGBwCgptIU1zCF9FfSTGc4nuasceRcbkl7lazl0lxdLrO89u2e+0xQbPqL1Kl/xvZTrof
	WdPaSjWU+MeUjTMbWFdwkPCMyXOHZGiqczZh7BfrdhJIw1NCS/d3UD0OX/I5OYQmoSfH3/x9FyBd9
	9DmbxF0G+8y1qEF4S29Hkdt4M7qoI9H0R5vTl5KnwqCLC99po+NYtBbs8drvDGWr3OBX+vcLmrYPg
	2PSGkFmQVCmIn3hgfrhr8pAV8L83I7FRghFrKwXeDfIooeiZIPQdSZTN0q8CLgsYH+SnL3SORGPm5
	ykKHHl1FkmdEkf/Yx1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Eqp-0000000HKhf-2xdH;
	Thu, 02 Apr 2026 10:00:35 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Eql-0000000HKg8-2JaF
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 10:00:32 +0000
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 394e0eafe;
	Thu, 2 Apr 2026 18:00:18 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 0/3] riscv: dts: spacemit: enable USB3 on OrangePi
Date: Thu,  2 Apr 2026 18:00:04 +0800
Message-Id: <20260402100007.110201-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9d4da2f36c03a2kunmcba6113b55c18d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkodVkoeH05DGR4YTENPH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_030031_794024_AC011FF8 
X-CRM114-Status: UNSURE (   4.59  )
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

Changes in v2:
- Drop common board dtsi and PCIe regulator
- Enable USB3 on OrangePi R2S and RV2 boards
- Link to v1: https://lore.kernel.org/lkml/20260116100001.208334-2-amadeus@jmu.edu.cn/

There is no publicly available schematic for the OrangePi R2S.
The schematic of OrangePi RV2 is available at:
https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR

Chukun Pan (3):
  riscv: dts: spacemit: add fixed regulators for OrangePi
  riscv: dts: spacemit: enable USB3 on OrangePi R2S
  riscv: dts: spacemit: enable USB3 on OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 43 +++++++++++++++++++
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 43 +++++++++++++++++++
 2 files changed, 86 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
