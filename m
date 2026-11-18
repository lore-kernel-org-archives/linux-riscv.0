Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAE606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qLoEo+j2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=sTyGVX8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:From:References:
	In-Reply-To:Message-Id:Subject:Date:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=Bg5nftQ/sSQ884qvOPrka5i3uU1Waa68mFl1t0rUb7Q=; b=qLoEo+j26ZAM5Y6bG2pfBvBJGq
	KPCj8gw3LKSEsGjhiZXU2IH7ml8jwR2PcQU0HhddvhCE8dy3B8Ar9pgeehnYnDyjbvttEfPmdKxtE
	w1u4r/3gnemYdTcFRpuiJgNeWS5p2eJhqCiwrDUauP8ceIay1tgKYIgrEc27luaA4XxGRriBkoPhh
	L+GMEVDwQs3bs4I8uF3LmTH2iT+uC7yWorotgc/clUNTpbJ9lAvjf15bMJrZO46xuQMkoSTMq2+04
	YDOLsljc8r0xxCgX9TOmQIOr0PMPbnEqcr/xsEKz7YoxDf6wF+0XaXljnf8BFYwfM0WIbWsiWoNYJ
	MlzxZfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUi-00000008Fl6-0phS;
	Wed, 18 Nov 2026 08:58:20 +0000
Received: from va-2-56.ptr.blmpb.com ([209.127.231.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUf-00000008Fil-3OWL
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992293;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=D3l2PQch6BsluJL94AQiUY8vO2xjRk9xx637S8ppt6s=;
 b=sTyGVX8wF16lZWjgjpS/ah9Xty9Q6CPwVDeTxA33OM56iM0ZT94Y+hXCmFkI8CG+a7+D9l
 EJgKX4LioXEdMLqgk/eDNctYlFpcwyqRWHWRgBhSrfVQ8cQWTIll2++6QDWvt/OIGHl6zh
 OjREZER1Wec2ixEHjJNiJb2oH+pFWxE6LSgzt79N4dn3OKME2eiiDM+RJWLYsIK7zskxzv
 ZJyiGAgTcxjWTZBSFVQ4FlHA2kp4WR3yl9B3wLSqxR9wMk8PPTx765DCMjxwgcPF4Hqufo
 p3sSSPv9zwhihfgoqzXNIoDKy9j2vfE8m9GQcndnpSlZ2xVMtuHIFnlXcSf0bA==
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Date: Wed, 18 Nov 2026 16:57:39 +0800
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Subject: [PATCH 6/9] riscv: dts: spacemit: Add K3 eSPI pin group
Message-Id: <20261118085742.1817536-7-yang.wang@deepcomputing.io>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
From: "Wang Yang" <yang.wang@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26afd68a2+19b6ec+lists.infradead.org+yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:09 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005817_923479_4ABF2036 
X-CRM114-Status: UNSURE (   6.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the eSPI0 pin function on pads 91 through 98, including the
separate clock pull configuration. The group is only applied when a
board references it.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index cb4f4f4e3..5bae382fa 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,30 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	espi0_2_cfg: espi0-2-cfg {
+		espi0-0-pins {
+			pinmux = <K3_PADCONF(91, 4)>,	/* espi0 d0 */
+				 <K3_PADCONF(92, 4)>,	/* espi0 d1 */
+				 <K3_PADCONF(93, 4)>,	/* espi0 d2 */
+				 <K3_PADCONF(94, 4)>,	/* espi0 d3 */
+				 <K3_PADCONF(95, 4)>,	/* espi0 cs */
+				 <K3_PADCONF(97, 4)>,	/* espi0 reset */
+				 <K3_PADCONF(98, 4)>;	/* espi0 alert */
+
+			bias-pull-up;			/* normal pull-up */
+			drive-strength = <25>;		/* DS8 */
+			power-source = <1800>;
+		};
+
+		espi0-1-pins {
+			pinmux = <K3_PADCONF(96, 4)>;	/* espi0 clk */
+
+			bias-pull-down;			/* normal pull-down */
+			drive-strength = <25>;		/* DS8 */
+			power-source = <1800>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
