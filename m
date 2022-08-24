Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09043C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AP3BM4/eqycjNs+AQFUrxImSM30UGfIl4Eynpe1jmTA=; b=3Vc5gW9Pe3S9mt
	/q4ZVLC0Kcsbr2QreT9FiTGOYhq76rizv14Z3h59Yl9P3Zq267fsflmM+Dj4YwZJOLb2jDz1Ao8a2
	EVIDGdpFWRx/MiWTLV+srOvJDhkiSjlGloHLwyaKZ6OQKW/dgAa4Rf5JwpCDB2o500NRqKaKlLzcx
	gTMGZcKu+VhHTqvZMC4U9sz9DQ07pzYVBqupH1iUl1Q6C5PkjoQv8OvvoRuCn4qrYW2Zry+DQwDMf
	tbTe+zVvbjqLKKJGA+6WyjXEahi4joegPBIpmxWDDVHNyltf1zNmuf+q7Y255O+WfTQRW3oz71EhL
	vusPddqmNNmFfGRzHh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkVB-00B3rA-HG; Wed, 24 Aug 2022 07:08:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkV9-00B3pk-Mm
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 07:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661324915; x=1692860915;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E7dBTFLuHmlRMo3zzffCQ2u+pMWgaHQ/XvLs2QO7rXE=;
  b=Idj1xkmqztOhUxG/xHK+MaUVUt2XL397lkw9q93ZBrLn+MEFjp3b5cAP
   MxgHOHSUry+n4OgTY8aomxQt6kuEKG1AWstt8/RS/ty9tXWFEP0gJtfVk
   PFla7n9tYTfMnme256yM41AnJuKc9xCvBFZO7eRtqLVYtVkdHkSFg8SQP
   pEeqO3vtQx9qhC0ZdRW75CQtsipAKcdoYRVNhyUecdIz5kpbQeWQ47Y9j
   5/3MN3sr+JTzZK4O04WAXWPXGMZF0BtxeaOqcpg1xE6IgdnxsNOm5eui3
   fpFNANfXVuJyy+a4C5V40lBC+XLez2tiexNa0FAg93EBF3lTfEeDy0Rc5
   g==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="170677304"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 00:08:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 00:08:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 00:08:33 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/3] MPFS mailbox fixes
Date: Wed, 24 Aug 2022 08:08:08 +0100
Message-ID: <20220824070810.52219-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_000835_824307_79F9CC99 
X-CRM114-Status: UNSURE (   6.85  )
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

Hey all,

I spotted a couple of bugs in my mailbox driver while developing some
new features. None of the features these bugs relate to were in use so
they've gone unnoticed until now. The binding screwup is unfortunate
and I don't really know how I misread the register map so badly.

Thanks,
Conor.

Changes since v1:
- add the extra fixes tag & Krzysztof's R-b for patch 1

Conor Dooley (3):
  dt-bindings: mailbox: fix the mpfs' reg property
  mailbox: mpfs: fix handling of the reg property
  mailbox: mpfs: account for mbox offsets while sending

 .../mailbox/microchip,mpfs-mailbox.yaml       | 15 ++++++++---
 drivers/mailbox/mailbox-mpfs.c                | 25 +++++++++++--------
 2 files changed, 25 insertions(+), 15 deletions(-)


base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
