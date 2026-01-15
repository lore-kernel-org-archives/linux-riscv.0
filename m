Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F8D44C5F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2/Pp8KN0hRs4QdsCWn8hfCixWkoyVPvcDdnDhORFUA4=; b=2lBqyBa6VuExoG
	qmt+uJXgsgR6V1Nr93QHGUU1M2tTWq+UJBOT8WMp/mB5D7f0CUg1Ghbiqt4+k59pCqOPzKO8odSFB
	ZGt4jZI3pI86T9hDdmMVDfc3A6qXjoBbYOZHVUeEKGlHbCwK5APKIV3LAavjjZbB1OmFbBO9litOz
	tddDeU1Ok1oPVBOuX7wuE775kDF+QJkVbx7qGBFkoSopasf6mDP1vlF5k2xZCy5Vr5igA40PGzeGM
	AYUtOpt1EhqIgTgGCpfa6GZj9Zfqs2h5TPlbIj3/LSg1svx0zKhj070mbmU15t0FYdd7jZKcYzKm+
	awTyaGTfoBfbzo/dQQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOkC-0000000CXhy-2Vg0;
	Thu, 15 Jan 2026 14:54:40 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOk2-0000000CXbT-0ODQ
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 14:54:39 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 60FEqk0v039366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 22:52:46 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 15 Jan 2026
 22:52:46 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        Ben Zong-You Xie
	<ben717@andestech.com>
Subject: [PATCH 0/4] Add I2C support for QiLai SoC
Date: Thu, 15 Jan 2026 22:52:40 +0800
Message-ID: <20260115145244.435890-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 60FEqk0v039366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_065430_496054_1D0552CE 
X-CRM114-Status: UNSURE (   8.55  )
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

This patch set adds I2C support for QiLai SoC.

Ben Zong-You Xie (4):
  dt-bindings: i2c: add support for Andes I2C controller
  drivers: i2c: add the driver for Andes I2C controller
  MAINTAINERS: add an entry for Andes I2C driver
  riscv: dts: andes: qilai: add I2C controller

 .../bindings/i2c/andestech,atciic100.yaml     |  44 +++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/andes/qilai.dtsi          |   6 +
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-atciic100.c            | 353 ++++++++++++++++++
 6 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
 create mode 100644 drivers/i2c/busses/i2c-atciic100.c

--
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
