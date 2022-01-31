Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3216C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBNFwGuH7IiwBkdZTVIcn2QeuJP9+q8d1N33Y8b2eZY=; b=k1Lvknf3DjrIKX
	rPyKnD/EwyyeuTQTFr9fMEABo6VwziF2l0jqaVY2I/61rsnpK32UXzzwC4CF5zl4tVp6T8fc5ub4n
	slmu5B7Z8WUImKrRC0a0Zz2QQ9CQHaTVfdFIth3TtqwNkWnQq7Hi6cU8S/RD+STYZXpgG+sfZm2Ao
	keLVnnzJ9Zf4BMeGst5VXK7xXe6Euf47XvW6fal/8010FYU0bYttYF7x+eRyWHymJ+4b/FrJj25pb
	Z65MKucPlf0ps2aYfNxUpC2pGTi7OECK/WutHf3EiVcJpWwdXiiIQQc2Pvw3EmeiJQUDv5bDTlRfj
	WPn964HvLGbHasV80cEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV9I-009CUL-RI; Mon, 31 Jan 2022 11:47:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV8o-009C9x-A2
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629598; x=1675165598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+uRMhA1+KXMC9lDrbzc/2dceALsFfl6ymRO67+ImIZ8=;
 b=F179MNUPZM2fsMy5wjNEUABHHyk8l1i7vZOkKZP4N2dv46T4fWPPGkZu
 m07rVP01/Fge5zDNHM/xXev3pNGRX2fxSU+21/wgutxOd167eCq4lGG8c
 MYVQaFJ9WF50K6gpK2yG3LXMYBdbsMexa9eLE9TSDOLzRT4AnO6n+//K7
 7tW4Dq/8lT9Wjc+DksQ1k5QIl7ZO/hy+gGGE3gROsmeQZ1MP6F3X9Mgvr
 Qvm3kHtggkj97RRF/HgSokb5K4LFoRqXajNLtD03chdBOhAmqb4Y+PPPB
 cMdJmyEyRsmoILDMyQGCiJ/xMV4zo5oYAUtUOq2L8wl/jhUREFMPbg7UN A==;
IronPort-SDR: eajPSZH4pSMNBX4KdOiq8o1PyCBQHxIJ2eFvu6iAjHVHssM7If3nsVEHy5O4csYUG1ycv9gwsu
 3GjRxfWiQGnALyTTWJk2Kt1TKcVE9qKOxuC4UiDqeOelPKvogG53n01YMBIvBX5ZyXfCoB0jBi
 d93t6wVH4MHczqlfJwi+Hxpk/6/XjjhJ9Z/vEuqMob0IbGRKrkhXqjiYmFmtGfjxUBvuzBWiDJ
 vDN8nS8rTTkRY4+DMYVdRRqGRSMf0Elvg1AxO+XG0T9zqlGoas/D2641PfwOJGRrMbEs5sA1Ch
 TJEJVYB8u1pm/qg/7CPC0k5U
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="151966756"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:46:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:46:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:46:31 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
 <heiko@sntech.de>, <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>, 
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: [PATCH v5 12/12] MAINTAINERS: update riscv/microchip entry
Date: Mon, 31 Jan 2022 11:47:27 +0000
Message-ID: <20220131114726.973690-13-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034638_421267_6F231874 
X-CRM114-Status: UNSURE (   7.03  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Update the RISC-V/Microchip entry by adding the microchip dts
directory and myself as maintainer

Reviewed-by: Lewis Hanly <lewis.hanly@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..779a550dc95b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16575,8 +16575,10 @@ K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
 M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
