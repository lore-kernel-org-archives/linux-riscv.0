Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EC3D73094
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ayN0ISO7zbkKfBB6k80uo1I9Q+gRnrwJrvHfouDc4K0=; b=RsU/hPMFeWdg97
	8d0Spyy/2hWhKZqGTVuCpXZ/TfOiKVEMzV+QJUyME4qvXSg3Iyy70zfD4N24GiyF+naoYUzU6n0rl
	rfIFPtwtZSVONfbajua4Nb9FwFCJ+tvzhrhJTz/Rif1KGrHlfMwq6mXa7f5ynGYZTWi7qU6dl6NZR
	KnrO9lSHedVasYtuPSvguqbGP8kCprPBPxuOLWdJV3ddbMqaERKbDC3K4l3d4zQ7YX3Mfrhy9fqQQ
	wurOwP13pKjRQn9Eur07RnESzrYbveSpb9W43vWBZrnIaKKuGoe/WP42772U+PVdahvDTXsIZUuO2
	CNFng1WPNOindfIoxxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dmL-000000020uA-30Sg;
	Fri, 03 Apr 2026 12:37:37 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dmI-000000020t6-1MQB
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 12:37:36 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-01 (Coremail) with SMTP id qwCowACXPWmHtM9pCsgRDA--.1349S2;
	Fri, 03 Apr 2026 20:37:28 +0800 (CST)
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
Subject: [PATCH v7 0/3] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Fri,  3 Apr 2026 20:37:22 +0800
Message-ID: <cover.1775219669.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXPWmHtM9pCsgRDA--.1349S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur15XFW8Zry3Xw17Jr4kXrb_yoW8uw17pr
	y29r43uw4rXw42y393uws8Jr15KFn5Ar9Igr1UKw18ArnFgay7Za1xtr42vF9xur45tFsr
	trs7Aw4xur4xZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBg0GDGnPrIkRQgAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_053734_729918_056DA1B1 
X-CRM114-Status: UNSURE (   3.77  )
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

Changes in v6:
 - patch 1:
   reorder i2c8
 - patch 3:
   restore vcc5v0_usb30
   remove vin-supply from pcie_vcc3v3
   restore vpcie3v3-supply from pcie2
   update hub vdd-supply
 - Link to v6: https://lore.kernel.org/linux-riscv/cover.1775214644.git.gaohan@iscas.ac.cn/

Han Gao (3):
  riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
  riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
  riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 218 ++++++++++++++++++
 1 file changed, 218 insertions(+)


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
