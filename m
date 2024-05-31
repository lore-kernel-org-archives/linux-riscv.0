Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BDBC27C44
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OqoK9bqD0gyeSsln0kw2if1xfslMDS5gqr3HA2t81Xg=; b=kii4zr4vugEldM
	xCxrl9WJVJp2v2u+pZB9pBkYFYZLiEW+LIaMD6z99tp294WepBxhsnaOVYtU5tbVj9coMBEN9ixUe
	24XxfmjpRtFYUSy1+TgVNy1F7LISMRWeUyTreppIsbAjUAh5omqlpiVzk5QZIZqX7GrYnHOLN5uLN
	KCrTz1ek8nlhEHjRqCl/Ou7h2p2klIAiYILQ2+hgbhWLePyJBczofYuSYU4rvwkM/f3q0fatltzA2
	keCjGJfhEh/QjEyLFofRGgof+CV7Zd4xSSTk4BQy8J3qb0IjqON3zXKQ1gd4726Aly8DLWMFl6l2U
	C9Mf62Z2ytaPsPjvqOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwKl-00000009Sr6-3Mjt;
	Fri, 31 May 2024 07:05:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwKi-00000009Spw-1OV8
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 07:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1717139148; x=1748675148;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0XK0C55EsMsjaft8p7TPB4SKJqrAJ7KdyEueOggJfd4=;
  b=L0D3LzxHxqG9qnPGutLAMrti25wk6ecPQ+6MzcQxijApxlJHkShRCrNP
   ugt95Y4tKHFhFt/b3yvcuikyAHfb5xhlel79GV75xpm3qeKQfaDqRdSso
   86DP5Zg+0z13DHbzJrMnTSvF4rxcqg+eYYmqPVN+ssHuTT8A7ESA7N8mg
   5V3YKPznGH3kW2QrGMZM4w3LfVYfFiL5ftUDm2eCHt/kTYnoNJ/8AnryG
   2fCwHTxryaqgm/8EUIWD+cHYx40NYDNo1ZLIFgiQSIivoxyZSq8ulT3SN
   DXlwtCAa6PkbNnIBAR0fKhH+b5JnRZnt5meO+2n8KUn6nlk3otqeDOVbX
   w==;
X-CSE-ConnectionGUID: wTY4LIfiQwGiNFVRU5C2dQ==
X-CSE-MsgGUID: ktTwT2CdTAmqTCWLpjIYUg==
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="26795678"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 May 2024 00:05:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 31 May 2024 00:05:20 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 00:05:18 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-usb@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Bin Liu <b-liu@ti.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] external ulpi vbus control
Date: Fri, 31 May 2024 08:04:30 +0100
Message-ID: <20240531-citable-copier-188d32c108ff@wendy>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0XK0C55EsMsjaft8p7TPB4SKJqrAJ7KdyEueOggJfd4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmRZbVzm8UKLF4Whm/Y9qlBWsV5m9IJB+Ut66YYHZR8kHxP fgJnRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYi0svIMKl3WfyST9tOLQ5uuvhxiq 50sTRLWLt5+KeDvfH6dtnl1xgZ+gzecoold9/138Uo9byyJEE8pvTDacmMi+6zX6zwS13KDwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_000548_570049_2631444C 
X-CRM114-Status: GOOD (  13.01  )
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

A customer sent me a patch adding a dt property to enable external vbus
control as their phy didn't support it*. I was surprised to see that none
of the other musb drivers made any use of this, but there is handling
in the musb core for it - made me feel like I was missing something as
to why it was not used by other drivers.

I've vendor prefixed the property for now, but I figure there may well
be a bunch of other potential users since this isn't just an musb thing,
given that there's a snps,ulpi-ext-vbus-drv used by an xHCI IP.

This is my third attempt to send these patches. I cannot find them on
lore from either of my previous attempts, so I'm gonna treat this as
v1. I think must've tried to send it from my kernel.org account from
Microchip's corp network and that failed. Either way, apologies if this
is #3 you've got from me..

* they didn't want to be identified, but said it was okay to post.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Bin Liu <b-liu@ti.com>
CC: linux-riscv@lists.infradead.org
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  dt-bindings: musb: mpfs: add ULPI external vbus support
  usb: musb: mpfs: detect UPLI external vbus control requirement from DT

 .../devicetree/bindings/usb/microchip,mpfs-musb.yaml       | 7 +++++++
 drivers/usb/musb/mpfs.c                                    | 2 ++
 2 files changed, 9 insertions(+)

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
