Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC8AC369D7
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o042RJZgKGs1N2/LJ0pJVhrYub7so27fVQXEckIPei0=; b=nD9DLD65U2zzWL
	djqP0C0kz37YLA2MYCG0IECGD5eNqA+1YFhMGqZE72p90g9ghrMlXaYyapNu9AGD61P7hhitJl6gj
	PlARFBkmQoL6EFdovqohlkQybT4sjmIaPBAxeCNRCvjhKSFF1Fz29nTcPhJnN7sPkEGFaswlJJSg4
	lJd1AldUcNlfI6ydNngNdBe4MqxloaJU3WqV1yJue3alkgJM7NGynH0fx/ggFV+yK5v2hye21+1aB
	Th4R+V6B2zrh+PrO52EG6202hVjUXl2kH8id6lN+paR+8WOZykB9T/U2Ax0WmiG3KSttLFsNU4UHD
	N8JUxqo3dGS6+XOnExWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rKG-0000000DFAG-2FWS;
	Thu, 24 Apr 2025 07:48:52 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rKE-0000000DF9V-06le
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:48:51 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6C78C343030;
	Thu, 24 Apr 2025 07:48:42 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 15:48:08 +0800
Subject: [PATCH v2 1/2] riscv: dts: spacemit: Acquire clocks for pinctrl
MIME-Version: 1.0
Message-Id: <20250424-05-dts-clock-v2-1-17d83a705c4c@gentoo.org>
References: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
In-Reply-To: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=855; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=h8qyXCPlBe/4wFwBbCk4SfrjsMZ6UKaZRbul5coxB50=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCezOOopeiC4gA5F1SvxOgpKStOhuUDoFDQZj2
 h02c1imA/qJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAnszl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UajD/9tfu0OAGMk9gZtFA
 vLMX70/AkgG7K/hM2PQMjy6cVgXuWgCn4MI7sLenRfvNQCLitfvxAGfQnHodP71fjON2lr/Pu+s
 cAfsfAk/L7583BiUSpUflYbtsyalAaR2cQWdHqLIhPkt5EASMBgBawtW2a45tPieggoj3f/res7
 tK0ZyTMgHaAUithRz8FtVjhQChKw80JGgDslqFW5aBzEZn5gTiMExbJZFPpRD8wp9x6X5fWzm0F
 Lt3azzqVn50DWkAqtNivUWCMA45Sy6f3Y88p0swJocX7OFmY5WIsouwvSsjbml9tmwnlnUm1U1e
 zd36My3Bc3xQDciGWF7RHKq/Gqz3R8DlOlrpMbLtwOKE2aDWIsE3akQ7S5Tzm4MiEwQb3MBVJOc
 RYvkYID9R4CNkemyb/bVC7AtYFTvwQayxXTs/do6BWC6jZx4/an41grvqTWqPiHAmtwXg1UGwgl
 /rDMzltm7i14kQ6hls0u7pyfzFNVOYsD0mZ5Qb4RdIgW0f6FanJygQBDLCDamnpbHTpbCgYCWNn
 nGtf7vodnh3pyNL0E0BjqpihQknSIfN8zJ+qmxjAvoVDANGCyGI2QOa2JvyVbIIkH6QJKzdX/Cr
 0ZJECD/PozLC/BT7vf369rCp1sgdZCjO4b/UNCn/qrMrKUyP7+cOvx9hqZRQDEdwnJzA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_004850_100889_9820CC63 
X-CRM114-Status: UNSURE (   6.13  )
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

Pinctrl of K1 SoC need two clocks, so explicitly acquire them.

Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b0d078c7127cc4021ad6022cb182..153fd1160182b42fe1a2f7f042c9c1da90f63b0c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -450,6 +450,9 @@ uart9: serial@d4017800 {
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
+			clocks = <&syscon_apbc CLK_AIB>,
+				 <&syscon_apbc CLK_AIB_BUS>;
+			clock-names = "func", "bus";
 		};
 
 		syscon_mpmu: system-controller@d4050000 {

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
