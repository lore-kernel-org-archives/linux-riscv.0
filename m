Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC7CCA5FC4
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDZCzeui17wJTeZtVq8gq2P/MxuQFe8opbPrePYeDu4=; b=3UTCXR+XJ+fZUT
	Zk22LkNL2lpW/gIE6QBsrqIBeYO0xRp9lo2P2vpDdYY6tk6qjdQDARocb4lKDyZJXIli4oWz+R/UD
	cLnV4Ti6a85+wBwZqEBstLwBU/hSkbvl9uTMmfD8CmFVMV6MqT9YFCgY29vcUlSEeoKLRl1N9nWQE
	zE0R/DfVHOud+FvajTXQciBTr3tPi+8huBA5hh/f5NfiOV/2d8cmf0rEmq4UMrFQug7LM0D1/wYiQ
	3X7F/Yr8QpPzL8yl4q+L1FYViGhd+JjHrsaeYXulBZgaBFGaJtJ50zITvOGNOqSULAnGEGUahoFE2
	2cSwRNli/y/r0al2jucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByxh-00000006xev-3zQ5;
	Wed, 30 Sep 2026 18:23:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByxh-00000006xeY-08rP
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 18:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jzFEwFhNEEl2QweEnFUgmbuXT1hIaNrPA0h4pJRAEBg=; b=Aq2klcz4ztRbJTsDgehB7QjReJ
	iw6IrWCULtX1I28OkUe0giKtUnZVtaqMeQRSOoAo0SUzUylbhtfbBCBkJb+h7/w6vvbSLEDehgH/M
	Nm7K3gifwRmMdHtotDAfgf+hu1fW7gZjtPgEiElEImzU5koJUDs6eHQttU33tb26p0QnyyYrEjspZ
	KKmU4vYwBtbTlq45dIJrssEdvrBBBp5INdABMkh6/AkbUNu7aewH/D1TPx4peGEURLp7fKTAgtnB8
	CWeqdsINh2bCINMZ4999gmxWyYgk7K9L9BcBkybHxRYb0RsPZZ3Wzj/1stLw6GJ3e7A3d4zSIGTGP
	j9UiRT/Q==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xByxb-00000004BwX-2fBD
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 18:23:23 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-01 (Coremail) with SMTP id qwCowAAHofR9U71q8y58CQ--.14027S6;
	Thu, 01 Oct 2026 02:23:05 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 01 Oct 2026 02:22:53 +0800
Subject: [PATCH v2 4/4] riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5
 MHz
MIME-Version: 1.0
Message-Id: <20261001-fix-sg204xspi-v2-4-014dbaf22b5e@iscas.ac.cn>
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
In-Reply-To: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, Hangfan Li <lihangfan@iscas.ac.cn>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAAHofR9U71q8y58CQ--.14027S6
X-Coremail-Antispam: 1UD129KBjvJXoWxZF48XrWkWw4UArykZF4fZrb_yoW5GF48pa
	n5urW3CaySgrnYyay3tFyFgr43JrW8u3W7Kr1rC34UJw4kZayDt3y7Xw13Jr17Za1Yq393
	Wrn5G3s5Gr1aqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
	JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
	A2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7sRiHUDtUUUUU==
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRIGDGq9GDh3AgAAsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_192320_427024_91D04978 
X-CRM114-Status: GOOD (  11.65  )
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

Use 12.5 MHz on the SG2042 EVBs and Milk-V Pioneer to match the vendor
kernel. The existing 50 MHz limit raises SCK once the driver starts
honoring spi-max-frequency.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts        | 4 ++--
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts        | 2 +-
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index b116dfa904cd982dc41c8cffdc770d4d0f81e0a7..9f403e564694eae14913f6ab23080a6333df15ae 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -256,7 +256,7 @@ &spifmc0 {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <50000000>;
+		spi-max-frequency = <12500000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <1>;
 	};
@@ -268,7 +268,7 @@ &spifmc1 {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <50000000>;
+		spi-max-frequency = <12500000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <1>;
 	};
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index b2ceae2d8829ec16c99c2ea2b040c433b819093e..d8c5814f22581076e6b5114f762d4fd090681b80 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -244,7 +244,7 @@ &spifmc1 {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <50000000>;
+		spi-max-frequency = <12500000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <1>;
 	};
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ecf8c1e290792c3a27651040eae3c603741cd0c7..4f39eb56b364894f17b97d482b6d9d867a32ad2e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -177,7 +177,7 @@ &spifmc0 {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <50000000>;
+		spi-max-frequency = <12500000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <1>;
 	};
@@ -189,7 +189,7 @@ &spifmc1 {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <50000000>;
+		spi-max-frequency = <12500000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <1>;
 	};

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
