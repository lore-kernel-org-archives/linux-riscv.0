Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E361C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIy4kYVxRdi8bK8jOvkCSA6Rpd+90p+Lkk5PH2QoKnw=; b=0CtgB4kKXsp5OU
	Tn3FBvJpABwefMLAy0lBskEvBf3qTPWFJLTSIP18S50ISDiNx0Lvibl9jSeCl08aDQErqT3leUo+o
	KeNi5cBP7BFeZLJc2lfhrOcLN/YZi0w15BFaScHxi1WaOCwP9sEQH9BpOc7Hu2kHuSbzGz9GIWbkk
	hoClQDPgzcii51RdEf4RdLWdA+QsuCgX5MWNwOoLgesV02Rr4k92UlNLYkpKn0IgOurCLPc2ZC+IY
	S74TVoPTUHF++uaIpUzPj4djEKfPZFSMWjwPl1GVnpmO+f7qKjV5dt03hhyl0lRJARJrYlv71pdv1
	DKt9Q63pDVFa2pUPcPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeqj-00000002SGt-291a;
	Mon, 23 Jun 2025 10:56:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe2k-00000002HkM-39gh
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 10:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=grsJQMIfOf/s+6+bLqfpJ0QJW7bGqk6ra3yTTcAY88s=; b=qJiNdb+aSGjOqwsE601mqmFPWK
	typGREy4FsnYBLRZPT4euvJDedoxKcYZCU0uTdYK3NkAUcmkVL9iLTR98/U1/y5JWYJwimkSnIxP9
	grS69N2W/1OgDOX2yr6iE8Vis56X07XUQCtmwl/xWIW+dl9tjzmkYnnZSArdCPojvDkLVW4/nabEX
	AwVM561XR6h8eAuB3foilnQ8EphUusTp/Q8gUXVrtYTs9kry/wc/wS6cUf/cpQ5kGaoDG8xwDKPFK
	tij8y7y5Jm+UnXkYTXpsUtVJIGGNjxrOf9Cd3UWuQziTFSaQ5+u1GRqV1QlbdHqI97U92ByCySlTv
	da9SNv3g==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe2g-00000005BC3-09eU
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:04:49 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3ptWtJlloxg+rCA--.29805S5;
	Mon, 23 Jun 2025 18:04:30 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 23 Jun 2025 18:04:18 +0800
Subject: [PATCH 3/3] riscv: dts: spacemit: Move eMMC under storage-bus for
 K1
MIME-Version: 1.0
Message-Id: <20250623-k1-dma-buses-rfc-wip-v1-3-c0144082061f@iscas.ac.cn>
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>, 
 Ze Huang <huangze@whut.edu.cn>, Alex Elder <elder@riscstar.com>, 
 spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAD3ptWtJlloxg+rCA--.29805S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tw48Ar48Xw1ruF18Ar1kXwb_yoW8XryUp3
	9rCrZ3CrWIvF4Fkw4aqrZrWr4kGFZYkFs5Jw1DCryrJws8XFWjqr48Jw1fJFyUXryfA3sF
	gF1kXr1UKr1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUUXdbUUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_110446_842560_D5936325 
X-CRM114-Status: UNSURE (   7.19  )
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

SDHCI devices in Spacemit K1 use storage-bus translations. Move the node
emmc under storage-bus to reflect this fact.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 0d41694699851e672a833601b62c2b2ad3daae79..2d40360994d87edfbdaefc364ae706712022ba09 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -403,15 +403,6 @@ pll: clock-controller@d4090000 {
 			#clock-cells = <1>;
 		};
 
-		emmc: mmc@d4281000 {
-			compatible = "spacemit,k1-sdhci";
-			reg = <0x0 0xd4281000 0x0 0x200>;
-			clocks = <&syscon_apmu CLK_SDH_AXI>, <&syscon_apmu CLK_SDH2>;
-			clock-names = "core", "io";
-			interrupts = <101>;
-			status = "disabled";
-		};
-
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
@@ -633,6 +624,16 @@ storage-bus {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
+
+			emmc: mmc@d4281000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4281000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH2>;
+				clock-names = "core", "io";
+				interrupts = <101>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
