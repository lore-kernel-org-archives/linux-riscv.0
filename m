Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E372CD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 05:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dkuJm97frQfHWj+Rms49/nXlGARSI7t4lD6ZceWlatI=; b=FqS1MA5dreUT4e
	u7StNfwD4hvzn3QeAneZDIzHqfrk1+gU9SP7WPSWMpnvuBw0vkm1+hg+9yBrcZgmlN/9FvCeLole5
	YShfM5YG70g0/EqfBY/zPEvlmu8bWvJ3MBuMS6b834tDerJeq1fo+3QS2iKCAmtxwTFwPHg3XlAto
	Fz7c5uo/N5Z5HCK3wWy3UKr3bMxoZ+xG1sJrqtIfLk8x4sQs90Go0CPG5oZbw5hl0rFhzj1PuCEef
	cYNBdtLsGQiKku5r5BbzaNDPTU/OuoOhDREbhdCGm0hykk4oJvDf0Sdmrrrte2eZpuURRqWPicgQw
	8LhzBPngbChQSfviYd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruQSs-00000005Bby-10Tj;
	Wed, 10 Apr 2024 05:25:42 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruQSo-00000005Bav-3TZA
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 05:25:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0071FF802;
	Wed, 10 Apr 2024 05:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712726735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P9nRh52y0oGbBcN/jNuKQU3mIGgFXRg4vffbB3ZdURU=;
	b=e0aoYqpSB0ih/ZEsG16D6RC2SxYp1YBQH6U22rNg+Vnh/+wouPK+IVfnqtv9qvQKO2U7Bm
	2ZDwWAlova3hkVcMcYCSB7WntyxYfvBJma2HEomCFUmgPj98E9CitC/cdAa1SzEGwPfFrx
	9dOSH92TDnVC4MdKckoEc++cCzGV14ve2A6OInzYgYXJ1KpDxfq78ZCTTklmvjyFGgUZuv
	XY6tgs1Hv8RwzVoSD7ygEVBh47WbMunn+MRGRm73B6Kl4Reh6AT10JG/LugaCI1q1CFxTz
	qZUe2v+5QtqZdK5iwubRUlD8Hlgj8KXs8csSK0LgdU91LJ44Egp8QzoyuZUtmQ==
From: michael.opdenacker@bootlin.com
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] add initial Milk-V Duo S board support
Date: Wed, 10 Apr 2024 07:25:16 +0200
Message-Id: <20240410052518.2945789-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_222539_185274_278497D2 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This adds an initial device tree for the Milk-V Duo S board.
Last tested on linux-next as a May 9, 2024.

- Changes in V2:
  - Add a first patch to register the new compatible string
    for this board.
  - Use a correct SoC compatible string
  - Add "disable-wp" (disable write protect) property
    to enable write access to the external SD card.

Many thanks to reviewers!

Michael Opdenacker (2):
  dt-bindings: riscv: add Milk-V Duo S board compatibles
  riscv: dts: sophgo: add initial Milk-V Duo S board support

 .../devicetree/bindings/riscv/sophgo.yaml     |  4 ++
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 39 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
