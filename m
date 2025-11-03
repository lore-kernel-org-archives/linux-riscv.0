Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBF4CCFA00
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 02:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V5vx0MSPlLHlGpq+MQcAcQCfT0Cd4y9pm0UvIHS1J1s=; b=Th+MK1JegIz3Uj
	iMAh8SxMijexi5Apb7QK9TzqGDwMrYOd/VPjHcSLb+qlleEOz6CwD/gQjT0pFJuuvyI0LU55lDnSg
	DiNwoBdxqqPuDkc01Uc9q8SqNv0ouWWg4R1LFB1GHpMBFVn0EVgcUwpjJk3pAr8UUJdHU7Rxm8bHW
	1XU2VijeURFT9qapBntvlwq78OjhaZviqWjUHODkLJggSGN/+kgRbQ73VkVa5fdG2ZmsH3r+CTaxw
	JON0vqLcoryOYZCAp8EF6xHvcL4eHI6EayQc6AHSA6pVaTIJl136xaQoMVgZNJIHwLcDR5ZMT++c1
	dFB/lESLN3F+BneN31ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFjud-000000092dR-2jym;
	Mon, 03 Nov 2025 02:03:16 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFjuZ-000000092cv-1G4v
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 02:03:14 +0000
Received: from [127.0.0.2] (unknown [114.241.85.109])
	by APP-05 (Coremail) with SMTP id zQCowAD3oO9JDQhpJTImAQ--.23894S2;
	Mon, 03 Nov 2025 10:02:50 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 03 Nov 2025 10:02:49 +0800
Subject: [PATCH net v3] net: spacemit: Check netif_running() in
 emac_set_pauseparam()
MIME-Version: 1.0
Message-Id: <20251103-k1-ethernet-remove-fc-v3-1-2083770cd282@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAEgNCGkC/4WOwWrDMBBEf8Xo3DVaOVbVnPIfIQV5ta5FsZ1Ii
 mgw/vcKtVB6KGVPszvzdjYROXiO4thsInD20a9LEd1TI2iyyxuDd0ULJVWPskN4R+A0cVg4QeB
 5zQwjgVGj08/OmBerRcleA4/+o3LPoljF5WsZ+HYvP9L3ZbCRgdZ59unYZN2igUD4uu3VP/mY1
 vCo3TLWwD81MkIZy92ITvfS0MlHsrG11NJSmVn9cFD+yVGFI/FgqRtIGcm/Ofu+fwIVhXGVOQE
 AAA==
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
X-CM-TRANSID: zQCowAD3oO9JDQhpJTImAQ--.23894S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur13Zr1rKw1DJFy5Ar15CFg_yoW8uw1fpF
	WUZa93Ww17Jr4rKFs7tw4xZFy5Jayftr1Uua1akw4rZa4aya4UCFyFkFW3Cr18ZFW5CrWa
	gw4jv3WfCF1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_180311_734772_9A9F0B8D 
X-CRM114-Status: GOOD (  12.59  )
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

Check for netif_running(dev) in emac_set_pauseparam() before proceeding.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
This more urgent problem was discovered while trying to fix
emac_set_pauseparam() (v1 of that has already been sent to the mailing
lists [1], but it was still bad), so I decided to send this patch for
the net tree now so that this oops will not happen on 6.18. A future
version of the proper flow control implementation will be sent to
net-next.

[1]: https://lore.kernel.org/spacemit/20251030-k1-ethernet-fix-autoneg-v1-1-baa572607ccc@iscas.ac.cn
---
Changes in v3:
- Check netif_running() instead (Andrew)
- Add back blurb about the attempt to fix flow control for context
- Link to v2: https://lore.kernel.org/r/20251101-k1-ethernet-remove-fc-v2-1-014ac3bc280e@iscas.ac.cn

Changes in v2:
- Reduced patch to only contain checking IFF_UP to avoid the oops. More
  invasive changes will be sent to net-next in the future. (Andrew)
- Link to v1: https://lore.kernel.org/r/20251031-k1-ethernet-remove-fc-v1-1-1ae3f1d6508c@iscas.ac.cn
---
 drivers/net/ethernet/spacemit/k1_emac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index e1c5faff3b71..220eb5ce7583 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1441,6 +1441,9 @@ static int emac_set_pauseparam(struct net_device *dev,
 	struct emac_priv *priv = netdev_priv(dev);
 	u8 fc = 0;
 
+	if (!netif_running(dev))
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
