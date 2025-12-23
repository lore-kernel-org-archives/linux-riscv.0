Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79FBE6B261
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 02:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EXsipxFcgumnOuxUqldubMnbicLX/t83m2mUee+aOI=; b=YxbT9gq5pS6/Kt
	29gVfse2w4gM/4foU8MjzhmZrOPbyVUIu94xXU9qKH5bz/zEmf34JRidUTcxBv63kRc2Rw/rAA2+6
	7qb+tnY5nuSkJGw3v/Pr4Hvz20nzuMEkhV2PY7z2HMGVC+hvlkS+Evu2LrEkqeq97SIoT0xkgAdgQ
	aoNicX69KlB/gP+UUO9k6eBRDTUMQAUeqGULNKWqqB66Sr7RTq6yL2fcsZhbCNXC0nxVfembWsaiU
	HvS48MTUa3fb2Zi/lC6ILjNF6hnKziwxttQTrKHGHbNqGZUPKVbDc5/mnjpG2gRmarnMo+q/ynfWM
	creMAQ03Jzy+dAaH0LPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXs6V-0000000EQeI-3J9H;
	Tue, 23 Dec 2025 02:26:27 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXs6S-0000000EQd2-2IC5
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 02:26:25 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3ACE13415DD;
	Tue, 23 Dec 2025 02:26:08 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 23 Dec 2025 10:24:51 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: sdhci: add reset support
MIME-Version: 1.0
Message-Id: <20251223-07-k1-sdhci-reset-v2-3-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=WfOYufxvp5VMhrnMCPsjsrXQPRkHTzjLxnD+Xz6ivlk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpSf2Uucl1qr5TmUawQcdzR4PIfSp9kyxzSv/yz
 PhahUxU5BuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUn9lBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3XNQ//eYdMzOQ0oNwD8UAs4I2h2FebWTvA52uAR5X/c4zETbSMw43ghGjSi
 W37ngE/k3didWdZtkpkP1ddewJHTwjVWOgtXZ4GbqQ892SgNS3UShz9P8KzcEj3Ip1KIMl01jAf
 CdzreJN/Im3YzRv/+E8gRp0FZ5qy3dXs33gmBm9Ts94T43DFuMqQsUUyxv6kG6y1zwKD3OXY5Ix
 Tt1vfS7WR2/dS9rd6bD5FjU5EzKm5ol/4qoe6Ugr8KD+pc6zjJUBZpgIoifqE5NMv/HZT6KEgMH
 eWEhmwgb1VOoW4BvgA0LzQ9a04IgQcFQ9uNI94/iFW3O5KW5nrGQMbTbzMu5INLOkv+xqY0RIvv
 tqfhG63qLUbVEz/vl5LF7nUUS+2/2Ew3CUuDQn+Y0zdCBD0xMrD6e4sfYaBgWa2Q/qL0aoN/STc
 Y534dyH+YrtUiuxX//I3HtZIsXbyV6F2riQrD6P6sYPSm9BGruACul2uo9/06aoiMSIB5sTlJnV
 geR8EhEb95iELSRA9hNKoFuh35d353FtyF6RFX6dPGD55M3URtJl6TLvlVZ4O5KVsHumUgBM7MD
 XG6sCnocTCuU9jol+SlnyeYxqVHWGpwniXwlGmgabt2sTdBq9OdzlBiLula9myjbbsbr+ilx7Lk
 hXQhyoFwp7osS//19zV9oSMphyj/mI=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_182624_611114_25E4E943 
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

Request two reset line explicitly for SDHCI controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6..7dd41d6dcb85 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -984,6 +984,9 @@ emmc: mmc@d4281000 {
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH2>;
+				reset-names = "axi", "sdh";
 				interrupts = <101>;
 				status = "disabled";
 			};

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
