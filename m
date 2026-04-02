Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47A7D6AAEC
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xUk2nbZJm+5fcym/bjOOkjfVN++ER3cFSP7m+TtSyb4=; b=tLTQl0yKaE6CYP
	NrtccROuSvkJAU9r7plswhdkb/zejGffvNT/6RE92MyJZrNoVm0xsdTBtv9PJK1DbdVIvktaxvNB2
	rO9XkS7PuCO6FmgBshOo93gAGBrIwAvpmxlXPWPVFvzeoC9GpsIw19ZCDzanSBdJYGfC6+oonbU+2
	1tD1ju2UIALYPtYZ8IMnEUSsw5OoFCoYdUuN6zfhr9GRhqAblYbjiJUVZF276g/njrqdKcV0W7c+D
	OYKJ0aH+V3TLTHk4Oxrr/aPjrCJj7478uk8uL+o+CfbguI9BsA7fjNtepPu0WmUEGxZItcuzlsxQ4
	6wT354FBP1+GQJ1Bn4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LJK-00000000YMf-29wY;
	Thu, 02 Apr 2026 16:54:26 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LJF-00000000YKU-2feA
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 16:54:24 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-05 (Coremail) with SMTP id zQCowADndwszn85p_LBMDA--.15885S2;
	Fri, 03 Apr 2026 00:54:13 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v5 0/3] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Fri,  3 Apr 2026 00:54:04 +0800
Message-ID: <cover.1775148159.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: zQCowADndwszn85p_LBMDA--.15885S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy5Cr1Utw1UAF4xtFW5Jrb_yoW8tFyrpF
	y2vr45Zw45Xw12y393uwsrJryYkFnYyr9xWr1UKw48ArnFgay7Za1xtr42yF98ur45tFnr
	trs7Ar4xuw4xXFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAgFDGnOhdYw6QAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095422_039649_E57A1139 
X-CRM114-Status: UNSURE (   3.89  )
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

Changes in v5:
 - Add Chukun Pan as co-author
 - patch 2:
   Rename regulator using Chukun version
   Restore vcc_5v0
   Restore vin-supply in vcc4v0
 - patch 3:
   Restore usb3_hub_5v and use the Chukun version, now called vcc5v0_usb30
   Restore vdd-supply from USB hub nodes
 - Link to v4: https://lore.kernel.org/linux-riscv/cover.1774974017.git.gaohan@iscas.ac.cn/

Han Gao (3):
  riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
  riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
  riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
prerequisite-patch-id: ef6e9c7b5854d0c08066b72f9a7868db8c2140eb
prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
prerequisite-patch-id: b76493e625ae257c8adcd67874178458420e4d47
prerequisite-patch-id: 88e01dc92c83bd88ddeb78891d3088209fed8d6b
prerequisite-patch-id: 60336d10ab8322c70596d0f046b6b5c54bb24b54
prerequisite-patch-id: 68c4d869548687dc115dd91e2ffb8f4c11482d86
prerequisite-patch-id: fdadcf964c2cb3406160edb579d99a8d5695f8e6
prerequisite-patch-id: 73b9e745338b0499b849fa4f7f9508987ab39a59
prerequisite-patch-id: cd26770c2160c3c31a406bd8a6b01ab666180ae0
prerequisite-patch-id: e5dfddc32cefae195692da8b80e19adf086e4ad7
prerequisite-patch-id: 7fd53cbe4977598f26148a4bb1cf692bbdb79a09
prerequisite-patch-id: 96ebac57bb29619b97fe95422206a685825618e9
prerequisite-patch-id: 00fac16b52f60383db3140e2885f3f7f8d14dd1a
prerequisite-patch-id: 3b7a60047b922c48e93599f621cb738856f42354
prerequisite-patch-id: 275c030b963be05dd1041451f539a130ce614277
prerequisite-patch-id: 93963424b0871e64276af0e0b2199b52e29b4603
prerequisite-patch-id: 8383188b1c01ed6280629faaa29c37d699ade241
prerequisite-patch-id: 5f8126b912b924d63d4a1e0c5eb42d212eb0d369
prerequisite-patch-id: e80af628a2e0b5f2eeb3cb1b5e7133d08bdd2c4e
prerequisite-patch-id: 0234a6dca15eb91f98a45a46604ce5b4935048a5
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
