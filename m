Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF200C0218F
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 01:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M+zEuJ01Wz+VISfuH1N4KYdtjBR6UDNh/+0g/tNchWU=; b=cJ5B7xVatSwUOx
	z2B5bCCL/PCdAeZLylcvQrfEzfXSn2g5s89NUjzgFZnSPxMeHlarYKvE4akslKcZ23wWoXrfzfWzk
	u4q+47eARD4ka2puUPPKxGHhUQLwh6rnq4FTF5QiKsnJ1OVjoJLKZyefnawvBtoek7EKplL5LgT1D
	CsKBQr0PK+oqxTsa96L7sRZCLTiXUdwOGmyM3e8/b5D5UxMwBiuJsG0Pt/0h9hq/ZVlmcFiTvucVo
	iDFIoKEEyVtJVTR9v36F2JAtpFIYRBDIKY1NHHuO2me7g6gvFdlCVN4xwoALu+imhsVRt8k6ZOOno
	yjpkmAjBwYrEyzLjyVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1telT8-0000000EOds-32YA;
	Mon, 03 Feb 2025 01:41:46 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1telT6-0000000EOd6-15SS
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 01:41:45 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B841EB2232DD;
	Mon,  3 Feb 2025 02:41:35 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 0/5] riscv: dts: starfive: jh7110-common: Sync downstream U-Boot changes
Date: Sun,  2 Feb 2025 17:37:06 -0800
Message-ID: <20250203013730.269558-1-e@freeshell.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_174144_468436_CFD69C7D 
X-CRM114-Status: UNSURE (   3.96  )
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

U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
with StarFive VisionFive2 board target (and related JH7110 common boards).
Sync the minimum changes from jh7110-common.dtsi needed for boot so these
can be dropped from U-Boot.

Changes since v1:
  Do not set unused eeprom label.
  Do not set no-op zero-value assigned-clock-rates, adjust commit message.

E Shattow (5):
  riscv: dts: starfive: jh7110-common: replace syscrg clock assignments
  riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2
    cycles max 100MHz
  riscv: dts: starfive: jh7110-common: assign 24MHz clock-frequency to
    uart0
  riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
  riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by
    boot  loader

 .../boot/dts/starfive/jh7110-common.dtsi      | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)


base-commit: 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
