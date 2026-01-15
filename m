Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C046AD3CCAF
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jofPEdjkQ8Wt+BAhmmer9kZiMK6bgtN0hVgYxYXxHJ8=; b=zqL3DXmOWCrGLN
	QYWx/qioifxrhgMRUVYTKN/kyxpv1/Q2ml8IxAy24BI1CM3mSq8GmPYqyxro7EMiUu0nlYqXBDeqX
	gdUyf4vC19u5xfMZq6oxjymAn8wabYbLuqSxsz1B8FuFndYqle4QZzVKHK3jma5CTr7uwOYb+5bOG
	fhIo06I6u6kWo5Bacuex8m/75e8jcu82u7ylHXKi2MgKNb2Q/BqlVDyWVAgkFWubRr0YObEgAA8zf
	2kCT3/6R6HkL61BMljYxj4AgPFvK2VMohxrZ3JiJa/dDWq5+zo8D6f9SMskB93YmXTH5Rgqn9NuWK
	3hTyZv0pzg1Ic2GvDIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH4w-0000000Bs0g-0JCi;
	Thu, 15 Jan 2026 06:43:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH4q-0000000Brz8-315q;
	Thu, 15 Jan 2026 06:43:30 +0000
Received: from duge-virtual-machine (unknown [223.160.207.69])
	by APP-01 (Coremail) with SMTP id qwCowAAn0GtWjGhpw5fDBA--.30809S3;
	Thu, 15 Jan 2026 14:42:42 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	18771902331@163.com,
	cyy@cyyself.name,
	TroyMitchell988@gmail.com,
	kingxukai@zohomail.com,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	gaohan@iscas.ac.cn
Subject: [PATCH v2 1/4] dt-bindings: phy: Add Canaan K230 USB PHY
Date: Thu, 15 Jan 2026 14:42:19 +0800
Message-ID: <20260115064223.21926-2-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAn0GtWjGhpw5fDBA--.30809S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWrJw4fCr18KrWUtryrZwb_yoW8GF48pa
	s7uF92grsagF4ayws3KF18Ca43ArWkCFyfKr13t34UKF1DW3WYy3yakry5Zw1UJFs7CFWj
	vFZa9Fy7Kr1qyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7sRRFks3UUUUU==
X-Originating-IP: [223.160.207.69]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_224329_125162_C814F2B8 
X-CRM114-Status: UNSURE (   8.80  )
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

K230 SoC USB PHY requires configuring registers for control and
configuration. Add USB phy bindings for K230 SoC.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 .../bindings/phy/canaan,k230-usb-phy.yaml     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml b/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
new file mode 100644
index 000000000000..be54efd612ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/canaan,k230-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan K230 USB2.0 PHY
+
+maintainers:
+  - Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
+
+properties:
+  compatible:
+    const: canaan,k230-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usbphy: usb-phy@91585000 {
+        compatible = "canaan,k230-usb-phy";
+        reg = <0x0 0x91585000 0x0 0x400>;
+        #phy-cells = <1>;
+    };
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
