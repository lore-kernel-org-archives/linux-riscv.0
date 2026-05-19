Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C0ECD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7miW4rD8vHYyK/kRvFfZtoe+YA3JCxxOVaWgw6yVzdk=; b=1t/wFFyqtJRfn8
	aq2FWIPeNZHLZgWkO3GN9xyNg5bhATcQlxzFhNk8TJWV0CUZJUm+JnrTN/NVocp9YUJv1YUWVPW72
	0i9ksWcSHoaLLJ23rkmsjOEs7nN+Moj0VWrpqdtGSDsvZA2G2bEZHMR2zqgD0HA/CkHJVQ+/P1K1l
	lCVokaF6vqkRcoil3XpVIN58yqm1ka8n++PQbSzOuhd0btXNxo6s3kJZmiyaS1p302UiJOHVg1qfn
	/GJeC7VSEEEB+4k6mmicDqu5ra7P0u6uBV19cK2YBvRcoqGbXI+YUoMbeOig0s81ewM7MwxfnhHCu
	7qi8pckeBaE14FPpP9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNUZ-00000002GY1-2a54;
	Tue, 19 May 2026 16:40:27 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNUV-00000002GWr-2gA7
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 16:40:26 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-03 (Coremail) with SMTP id rQCowAB3W+Jvkgxq+lqQEQ--.18430S2;
	Wed, 20 May 2026 00:40:17 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Han Gao <gaohan@iscas.ac.cn>,
	Anand Moon <linux.amoon@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH] pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
Date: Wed, 20 May 2026 00:40:07 +0800
Message-ID: <20260519164007.122574-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: rQCowAB3W+Jvkgxq+lqQEQ--.18430S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4fJr17uw4UWF1Utr45trb_yoW8XrW3pF
	43Zrnak345tw48KF4vq3929FyFkan7XryUCa1a9r9rZan5CFy5GryUKFWYqrZ7CrWrJr1F
	qws8ta4Yg3WUAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAYLDGoLKuDdZgACsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_094024_051723_F3975FDD 
X-CRM114-Status: GOOD (  11.27  )
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

spacemit_pin_set_config() looks up the per-pin descriptor with
spacemit_get_pin() then checks the wrong variable for failure:

	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
	...
	if (!pin)
		return -EINVAL;

	reg = spacemit_pin_to_reg(pctrl, spin->pin);

pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
valid pin, so rejecting it here drops the PAD config write for the first
pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
its first entry, so its drive-strength / bias configuration was silently
ignored.

The intended guard is against spacemit_get_pin() returning NULL when the
pin id isn't in the SoC's pin table. Check spin instead, which both
restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.

Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index b0be62b1c816..95024e2bb5a5 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -795,7 +795,7 @@ static int spacemit_pin_set_config(struct spacemit_pinctrl *pctrl,
 	void __iomem *reg;
 	unsigned int mux;
 
-	if (!pin)
+	if (!spin)
 		return -EINVAL;
 
 	reg = spacemit_pin_to_reg(pctrl, spin->pin);
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
