Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1CDC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gJC5PJrJtZCRtRLKYBIjhLnGoszkVqegTix53l9+7tk=; b=KTUWXgUTtLhuHd
	PJqd5gWybtCY4hr0BmAAQTeKIr8lmqqEsdZhdNm18RPo3v3ww+kTpSOy79rUjEAajuV44w7p/pRph
	FT1eiqLF3i2JyFOcrodA+kpm32kYezkc89QXwg3lMabuQKFeF7eelyovQXZic6+f18Z7xQjJxao+r
	BXPm/oMjMN4pvCi0D7qxiDsLKjDlKPTD9KeH0doYY/O8ILCEvQEZU9RU4A41rGkU7HszitEngLLBZ
	xm1u/mLtYVGO6AM1TKDx8r4Lv+iIhYxowYHaw63uChOcAjBRPyjRnrLtOqMQ+EW79i1Exop9YPs7W
	cWtNgJCZPgE2Yg+0FQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwz49-0000000EteI-2I2B;
	Wed, 17 Apr 2024 06:46:45 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwz46-0000000Etcz-2EdD
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 06:46:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21721C0006;
	Wed, 17 Apr 2024 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713336398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bDyiZdrwSjRaCu96u0BrTQPpOjIEQf/Tsad+LBEh6YA=;
	b=mY11MLX1w0EcZ13rqsTGDoqnyEkpSrSl8cjVOBpCjEdwEAHIz1axUp6bbMxfFLNNZwIgeL
	7mkQPh1SqLk/c/j8k8HLfKQz4yJks6HoMhPeLzfcDfI8KzCgaVo7jJ2sJ+GfQHkoWahagE
	BjPVGv5A/VNEh2kllkGwnov/uZC3TMaxx+OdPuJu5vQepCogvjxQ42w5L5lVnlggwmXE4X
	IXsD40DFAYwv7Gqol1Ti4Dmj+r70Z/L0FgZ6f9J/bp2OJ9LtcOFb2OvaVWiWUuM3dpHbTQ
	f6j24yORNbfti4VC5pmQRDKjTCxhKFTZ/X8FgM7st3aG8TZku+W/z3B/dioGnA==
From: michael.opdenacker@bootlin.com
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/2] add initial Milk-V Duo S board support
Date: Wed, 17 Apr 2024 08:46:24 +0200
Message-Id: <20240417064626.3880187-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_234642_744498_DA7C8036 
X-CRM114-Status: UNSURE (   9.86  )
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
Last tested on linux-next on April 17, 2024.

- Changes in V4
  - Remove mmc device (&sdhci0) as not working yet with linux-next
  - Use "sophgo,cv1812h" compatible as on the Huashan Pi board.
    Should I call the DTS cv1812h-milkv-duos.dts instead
    of sg2000-milkv-duos.dts?

- Changes in V3
  - Fix enum in devicetree/bindings/riscv/sophgo.yaml

- Changes in V2:
  - Add a first patch to register the new compatible string
    for this board.
  - Use a correct SoC compatible string
  - Add "disable-wp" (disable write protect) property
    to enable write access to the external SD card.

Michael Opdenacker (2):
  dt-bindings: riscv: add Milk-V Duo S board compatibles
  riscv: dts: sophgo: add initial Milk-V Duo S board support

 .../devicetree/bindings/riscv/sophgo.yaml     |  1 +
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 34 +++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
