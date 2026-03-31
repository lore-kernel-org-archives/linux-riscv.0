Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D381FF60EC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 08:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rnpfr/nyP5eulAP9HMM5BFOC1yMdJJQFrdvbg+NHIUE=; b=EnhtLngGPV2zBp
	E7yuKNA7EYrixBHCYVVXSdYmsputGN0zsDnjkSyeBvOeyYpEDVrqiSbw1tvoeTmrJD2TGG/Kivn4u
	Vcy+oniPeYGOzu7C4SFlCUeLq/ETqEOKLqqK87uqflHDFk17MVNAMrQRpNYlVnw7r1Nt/buF9nXcg
	9c/U5L+2c6bGjgrlbxOMrMVQNI8n4njw2TGDNcC+q4LFhhYGLYJ59ZZnxIvL78GlfTIIE8IcpfmqH
	gOEjIz9At6+kvP6IkyfJoeEVjzg0okcjEXIVqtuTjKJl8dBf4tKB7eHmjjTFNNQ8tjThcONIlsvsc
	4R2CDgCQKRHyxBWOQz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7USR-0000000Caxb-0N1u;
	Tue, 31 Mar 2026 08:28:19 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7USK-0000000CaoP-14pk
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774945662;
	bh=zQoYyY05/NN4DIdF/DF5E5EPkS4eUcGFX5Kh/T/X+gc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=AEbh4MeNy+4C/6KCzb6+K+Epe3SLhZtReIYde2zXKWOa8+3aBpKNMDcISVnszlBRf
	 IZIQBhwua9/rrAsykgUaloWzUSXLKdF53fkfQll8qQ6UawlVao2sahPHYIvxZQNuSp
	 YfSGwjEbI/8ozPHXilO+uehd8u4pPiFQyKFMmkWQ=
X-QQ-mid: esmtpsz21t1774945660ta7daa60d
X-QQ-Originating-IP: GjHiuxIfRSsNOn5618I7qlZiklEPnClLa0+OptB6tYM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 16:27:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6010631218431936232
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 31 Mar 2026 16:27:08 +0800
Subject: [PATCH v3 5/5] riscv: dts: spacemit: Add PDMA controller node for
 K3 SoC
MIME-Version: 1.0
Message-Id: <20260331-k3-pdma-v3-5-a4e60dd8b4b3@linux.spacemit.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
In-Reply-To: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774945629; l=1492;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=uCUNP+lKsd/WyoTYB/YeSCQQ3CkT+PW7MTsRUSfaj3s=;
 b=vApl4HNXczu6nf5zq/M4HL8n5ctkadC1V4pDcxt8t7XYKnGayBPG25Fh+Lf5VqiBqH72q4dsI
 hi7jJWIqYhuDxxS8/+kon6GXX9zlRLPTzJbeKEfOOSAwvQoZ7qtSt7H
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NeScTrMyTZw6e0LsQMX4R5C3bWyhZLYNGaljWSn4yuKsoP7cHyr9vYgK
	dW/o21vWoop+8GO8zeyQugf/WbUzZp9TROLEb+GQWSH9tpUNDYDi544ITBwCvWG9YnAKaqU
	6Gt9Z74IYeLk50ux5aejL8GV7ouIyLvH35V5iMM2ND7GYRvFHKQ6NeyGxtZNnS4ktFCWIZK
	5kUe8CgUplykbsiOjncfCGFTwq/xSmTYFNlycpRGtWEkxZdzq4C5iZJv4ZnIPzPwT+zBFXm
	JPl5jXwpwSNs2seA5lWybrUPCpDNC6Fr/OLZeTGnKnPyTB4B0IdWT08tKcfKA9c4FmGvCix
	V78SQ3TkMq/tTPEwHYqodBui1poyYKQ25PmexHa/Q5cFolSpOzjRMLw8+YxUCfjiqr+9beN
	beJ5xDArStzBudsOE84LBiJP2vbEk9hTdhnBzomUl8DqEIZwFyOIpt4rY+mf6OChrx7bcxc
	/yfvtU/oeDErUOo7mSrw1XicHbhdXuCPmoQwe1yHCh6mwY9L+iYaXbKej49q6F7g16ViXX7
	QFrrsSXuMb5KRgrtwUAge8a427b7gi57Pc2+I9PVVd6MPN/XKJm4423oRIVw7kV0JKpEy1Q
	e3gstbrZQMZ8q9wGrvDnZOZYFXxFbZp/CJkNd3XKq6y9x6GdtLStdRLTouij0/i/oACObHQ
	WODL7UVDip5atnIXGkvt+/n3v08UGYvhaUDAphGdpTz+Qbe8BSJAaTtOSnENTNdJFdJSsQT
	6oSfiQDSDCkpEpQZbxJlSBAIfZifObr+IQt0l/5Y53cd/rWr/pLUD2lNxEG0ewaBpipcpbL
	JaAME5ip0LvK+pnKzJlkyziBWoGaiRbyDQB01fknoSb3yS3SKnDtGLB3pzee6oWayMuyQCw
	9MbxELxNPIqvSsyg0/AMZSAdcDdbbcBjM6MzWFHJ7AAg6tjtkhYELDYuWkowofuMatcXq/T
	A0AlfzzyOF1/hWiAqfrjuijumIuH59fH6h4+1+PYrpTaPklaKFGMW4B72qNjzuyOjSmEcom
	S3AMSwJpdyal1mhZTtmZcqUMjkFESoCn7Z4F1yRo4fu98Y2TqEbO2S63RE62mgICZzMbnLa
	a06Cvu92GlSAbvIqcgt6pQEXkWJc8OOCzUrZylRNec3Y0v/n2GTIObqM6gkUZo1VQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012812_789045_CF24DCE9 
X-CRM114-Status: UNSURE (   7.98  )
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

Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
The PDMA controller provides general-purpose DMA capabilities for various
peripheral devices across the system to offload CPU data transfers.

Unlike the previous K1 SoC, where some DMA masters had memory addressing
limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
with dma-ranges to restrict memory allocations, the K3 DMA masters have
full memory addressing capabilities. Therefore, the PDMA node is now
instantiated directly under the main soc bus.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..cd321975fc18 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,17 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		pdma: dma-controller@d4000000 {
+			compatible = "spacemit,k3-pdma";
+			reg = <0x0 0xd4000000 0x0 0x4000>;
+			clocks = <&syscon_apmu CLK_APMU_DMA>;
+			resets = <&syscon_apmu RESET_APMU_DMA>;
+			interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <16>;
+			#dma-cells = <1>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
