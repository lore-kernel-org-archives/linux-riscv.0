Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F79AE7C6F0
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 21:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oZUI8von4qlsBMXWkuQ8KApbrs/updSlZK5MTBW9O3o=; b=NNXXIrOIkmRheh
	nHSBPuVI+FOl6mOvW7qH3OQBvAvjVjSXSiDxCEsnj9jCSQuS3TGCt5/3nBR3bKfBzpe7Kc8IhCEJy
	NmoRHAru+V45wOiQUWN3yh1D3UC/zv/thMNB8t+/cZww3hraRKO4HOY4RyEkwrScTewMhOBy386nv
	TDm5ZFsSvRYXQhF/HHbXKYaNFLc804ms6kJxWxqCJL295dNMew1mhCSVk0YM9zG5vqBBpVIY81Tio
	fJQ4LgUHCxlkKSCAf+Bfaaz1IS4+SkTOu5dKMW6cxEhhri3Kk0+R0bGxXyGEQecAJZntJnbHtjscV
	4or2JxtW5a+mSZfGg9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmIfz-0000000318H-2SOy;
	Sat, 31 Jan 2026 21:38:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmIfn-0000000313O-1hdE
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 21:38:37 +0000
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-03 (Coremail) with SMTP id rQCowABXadBIdn5pRJhjBw--.18091S2;
	Sun, 01 Feb 2026 05:38:17 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 0/7] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Sun,  1 Feb 2026 05:38:07 +0800
Message-ID: <cover.1769895215.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXadBIdn5pRJhjBw--.18091S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1fWF1xuFWrWFyftFW5Jrb_yoW8tF43pF
	y7Zws09w1rXw1Iy3y3uwsrJF9YvFnYvrWa9r4UKr48ArnFga17ZFsxtr42yF9xZr4rK3W7
	trs7Aw4xur47XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [223.166.92.103]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwwEDGl+GlBjgwAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_133831_860767_E78B946B 
X-CRM114-Status: UNSURE (   4.38  )
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

This patch series enables the PMIC, voltage regulators, usb and pcie
for the OrangePi rv2 board.

Han Gao (7):
  riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
  riscv: dts: spacemit: Define fixed regulators for OrangePi RV2
  riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
  riscv: dts: spacemit: Enable USB3.0 on OrangePi RV2
  riscv: dts: spacemit: Update PMIC supply properties for OrangePi RV2
  riscv: dts: spacemit: Add a PCIe regulator for OrangePi RV2
  riscv: dts: spacemit: PCIe and PHY-related updates for OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 235 ++++++++++++++++++
 1 file changed, 235 insertions(+)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
prerequisite-patch-id: 32d6acfcb4801407e38510b391407943e9a8ec82
prerequisite-patch-id: ae644485e1a8ead3fa7a087c8db9062c7acc14ff
prerequisite-patch-id: 605d537aa0f8387b3523786a875c76b9edfbcbb4
prerequisite-patch-id: faab9c820ac67de42c40f2c4578bb5b8753fcb71
prerequisite-patch-id: f9c4643cc99e5b9f1acc9daf1e679b95f81cee73
prerequisite-patch-id: 50138c8918218ea3b8650999bd558ed6350ed2f2
prerequisite-patch-id: f8f91e32361cc99c531170c39ed54cd1b3c5997d
prerequisite-patch-id: 475d1968c0c41895578809410c9bd8fe24997de4
prerequisite-patch-id: c40f1562f712f04578ef58472840d257a19919fe
prerequisite-patch-id: e9ef3af6c80187e6f05444704d13212d3beaf40a
prerequisite-patch-id: 7076909bb4103588b4761d175eca40bce470230f
prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
prerequisite-patch-id: ba6a7df5c7a2fa9ce0b8a72a9177e42a4dcdab01
prerequisite-patch-id: 33fd23112b55b5e6b1e276594826ee454afc1c7e
prerequisite-patch-id: 009a5aaff0768d90d148eb9d5d999c5098fd6d93
prerequisite-patch-id: 7e41df07cbce163a689f5dca246b98a0122d1610
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
