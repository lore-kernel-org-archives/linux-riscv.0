Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D616CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kF/iZl3DfJuorc+MrJ5UGyAOrEYI+v9+dAvDA2Z3eik=; b=RPE+rcylmUY2zP
	jGfowJWYolvCXv3v9Mx2G7p1uEIWKpKn9etTbRzYtMr3KYnFsS3BJPMDqKCJgfIkqQbKZJAv00Lrn
	Xvddc5KN/hLK9onxDmOxEyNlKqrNXEIVP12VFETVmgfCKbQKWrdbnYs68n2h44XvP5r0n2AyXRNWG
	NAkI9R2cVD0jb24xRrIMocltZuiddsMttFebDz3FqFbSyVWHx+vCMhnaHbcWxxyf0iCaSNbXCeM7x
	tG1MQvK6nCClb14tMfBVzBSjqHP2+L9f5AssWuVPlft9K3jYXKUVx4dHwkn6ygdqt/1LIFocu5T/a
	IdgtwKbHU2BZeK7UhUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtsJ-00000006cSi-31cB;
	Fri, 31 Oct 2025 18:29:23 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtsG-00000006cRY-2aI2
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 18:29:23 +0000
Received: from [127.0.0.2] (unknown [114.241.85.109])
	by APP-05 (Coremail) with SMTP id zQCowADnU_Lg_wRp2u3JAA--.5659S2;
	Sat, 01 Nov 2025 02:28:48 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Sat, 01 Nov 2025 02:28:04 +0800
Subject: [PATCH net v2] net: spacemit: Check IFF_UP in
 emac_set_pauseparam()
MIME-Version: 1.0
Message-Id: <20251101-k1-ethernet-remove-fc-v2-1-014ac3bc280e@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIALP/BGkC/4VOSw7CIBC9SjNrpyk0RezKe5iaIJ1aYloUkGga7
 i5B92ZWb953A0/OkIe+2sBRNN7YNQO+q0DPar0SmjFj4A3vWNMyvDGkMJNbKaCjxUbCSaPk0yj
 2o5QHJSB7744m8yq5J8hSGL5PR49n7gg/5qI8obbLYkJfRVEziU6z85aKfjY+WPcu2yIrhj8zI
 sN8itqJjaJrpD4ar5Wvla71CkNK6QOcZYIg8QAAAA==
X-Change-ID: 20251031-k1-ethernet-remove-fc-82fd67d889a6
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@gentoo.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowADnU_Lg_wRp2u3JAA--.5659S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fArWkAryxAF4xtF18Xwb_yoW8Gw4rpF
	WUZasruw47JF45KFs7Aa1xZFy5JayxtryUuF1ayw4rZasFyw4UAF9YkFW3Cr1UZFWrCrya
	gw45Z3WfCF1DArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_112921_030666_E36006A8 
X-CRM114-Status: GOOD (  10.13  )
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

Currently, emac_set_pauseparam() will oops if userspace calls it while
the interface is not up, because phydev is NULL, but it is still
accessed in emac_set_fc() and emac_set_fc_autoneg().

Check for IFF_UP in emac_set_pauseparam() before proceeding.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Changes in v2:
- Reduced patch to only contain checking IFF_UP to avoid the oops. More
  invasive changes will be sent to net-next in the future. (Andrew)
- Link to v1: https://lore.kernel.org/r/20251031-k1-ethernet-remove-fc-v1-1-1ae3f1d6508c@iscas.ac.cn
---
 drivers/net/ethernet/spacemit/k1_emac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index e1c5faff3b71..a3fc17d2ca10 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1441,6 +1441,9 @@ static int emac_set_pauseparam(struct net_device *dev,
 	struct emac_priv *priv = netdev_priv(dev);
 	u8 fc = 0;
 
+	if (!(dev->flags & IFF_UP))
+		return -ENETDOWN;
+
 	priv->flow_control_autoneg = pause->autoneg;
 
 	if (pause->autoneg) {

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251031-k1-ethernet-remove-fc-82fd67d889a6

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
