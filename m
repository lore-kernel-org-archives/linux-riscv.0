Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E3DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Dec 2021 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xih2ARFHb3nby6I8V7qTdITlYfk9D7fGdx39Op7J+eo=; b=U4JhVWFJiyJQvM
	mxfd+mcVbZfKk/n+u5UV0/DLaZ/ldLud8SCru+RHbI+Anr90Av3EoxnRztVN3Ltyho0tYMQjszULn
	8EajYAyZmP4sv/dvWMVo8zWEMxcgLma6BmieX6LhpFiYauYKlIML+rPD4Cap+L0U7Tzj4t3qnmAKU
	Qo3yoaVbof0o27sGT//E3xA94kIC9BUUueYgB/3YfI1SVPGmXPYpPwThLQxoxmrKMe21idbPQyeF1
	bNE0QhjTXBz0hSgh4r5iBJ9TrcsdgQZhjCOFF31cI15gmGj8KKtvX+QrV3PgePtCP5TQBCsIJvXOG
	VCsAM+IGxdvallqjqPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3BC2-005jqK-Hs; Fri, 31 Dec 2021 06:15:10 +0000
Received: from resqmta-a1p-077724.sys.comcast.net ([2001:558:fd01:2bb4::5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3BC0-005jpt-GH
 for linux-riscv@lists.infradead.org; Fri, 31 Dec 2021 06:15:09 +0000
Received: from resomta-a1p-077059.sys.comcast.net ([96.103.145.240])
 by resqmta-a1p-077724.sys.comcast.net with ESMTP
 id 3BAPnbExuaNgs3BBpndrxH; Fri, 31 Dec 2021 06:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1640931297;
 bh=B8RJ34LocrDqPDwZMnx/NOtlAthCdFGYGjocIeA+vIk=;
 h=Received:Received:From:To:Subject:Date:Message-Id:MIME-Version;
 b=cuEvwyxfet1tSFhlThUWp+5YvhjmsGNCS5u0X00QSCNM3QcC20vezYsp4ZPv/GdeF
 /onysaPVDX5/+4yd98QuOIP6gnjehgyog/tcr7TQgC5J4obrOmQ97hr7dwB0zkFWNH
 +ZAnBQKxfQSfUkcTmg5SLsS8rOm9l1X7y7Mw1YKUPIffen+WH2HkXAqFNgdteHhni6
 K7UkvWYwKxnZ96v9GWD2kGU+QRgGplshRrAuqgd25SjITuKfMhxTfGf/1XReYct8J4
 PTLfi3N3lwnRC8Msj3Ju0HMVmGjZ9JYT20rqzWKYaBWVq9zbNhcDMsvZgsrIQ5uIQn
 lML771UGXBAeg==
Received: from w6rz.silicon ([IPv6:2601:647:4700:284:9d56:573c:4e75:fa6c])
 by resomta-a1p-077059.sys.comcast.net with ESMTPA
 id 3BBFnSy4GhrTt3BBNnq2cX; Fri, 31 Dec 2021 06:14:32 +0000
X-Xfinity-VMeta: sc=-100.00;st=legit
From: Ron Economos <w6rz@comcast.net>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: Ron Economos <w6rz@comcast.net>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sifive unmatched: Add gpio poweroff
Date: Thu, 30 Dec 2021 22:11:06 -0800
Message-Id: <20211231061110.89403-1-w6rz@comcast.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_221508_659741_69F3D556 
X-CRM114-Status: UNSURE (   6.75  )
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

This patch is required for the following commit to work.

commit f2928e224d85 ("riscv: set default pm_power_off to NULL")

Signed-off-by: Ron Economos <w6rz@comcast.net>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 6bfa1f24d3de..c4ed9efdff03 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -39,6 +39,11 @@ rtcclk: rtcclk {
 		clock-frequency = <RTCCLK_FREQ>;
 		clock-output-names = "rtcclk";
 	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &uart0 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
