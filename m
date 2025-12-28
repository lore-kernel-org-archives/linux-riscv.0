Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FEED3B7E5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rDdkhpx+u+CXEVWZn2S/11udFeDavwQMhMrtWPTeuCc=; b=LHx+Jdsos9YLAd
	OEHf2WYuSLi4/cJNq2mg11sALgL1qcOpef5k6GzzLVSFSmwNIHiMRNRJfXgdwwuoVWmq4ECk98lAv
	KxbBWYmDMYCDalnWtIcwwAwPhhTI9u4XWu0exGYjFpG4RozZ0KS2cFzmxL5z9WNyHvhZn3DsYWxro
	88+V0LVUwbVh5E4JzoXjifMvvX7nupWjcTEbOEhdWst0mCMvcZxPw5GFgMEpC3MqAf4R8Sg/I95ke
	jKcoTvKJsZBQWZa2aL6JRmwL+FUUJVHRkSwBsUW7WKaMyGk3JNKjqq+VwZiytwvrp+7+y91Z3fD15
	f212Z8hZdfGMlOJO64XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZt4t-00000002rFn-39n8;
	Sun, 28 Dec 2025 15:53:07 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZt4q-00000002rEV-3TEV
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 15:53:07 +0000
Received: from duge-virtual-machine (unknown [183.192.221.253])
	by APP-03 (Coremail) with SMTP id rQCowACnv9ZWUlFp5XFXAg--.16949S2;
	Sun, 28 Dec 2025 23:52:55 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: linusw@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc,
	Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Subject: [PATCH v2] pinctrl: canaan: k230: Fix NULL pointer dereference when parsing devicetree
Date: Sun, 28 Dec 2025 23:49:47 +0800
Message-ID: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: rQCowACnv9ZWUlFp5XFXAg--.16949S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zry8XrWUGFWruF4ruF1xKrg_yoW8uFy7pF
	43Ga98Kr47Jr4kWw1rAayDZFyak3Z7A34fCw17t34Fgwn8tryDX3W5WFWUZws8CFZxCF15
	tr4YyFyj9w1UJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [183.192.221.253]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_075305_272946_8D3DC17E 
X-CRM114-Status: GOOD (  11.17  )
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

When probing the k230 pinctrl driver, the kernel triggers a NULL pointer
dereference. The crash trace showed:
[    0.732084] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000068
[    0.740737] ...
[    0.776296] epc : k230_pinctrl_probe+0x1be/0x4fc

In k230_pinctrl_parse_functions(), we attempt to retrieve the device
pointer via info->pctl_dev->dev, but info->pctl_dev is only initialized
after k230_pinctrl_parse_dt() completes.

At the time of DT parsing, info->pctl_dev is still NULL, leading to
the invalid dereference of info->pctl_dev->dev.

Use the already available device pointer from platform_device
instead of accessing through uninitialized pctl_dev.

Fixes: d94a32ac688f ("pinctrl: canaan: k230: Fix order of DT parse and pinctrl register")
Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 drivers/pinctrl/pinctrl-k230.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k230.c b/drivers/pinctrl/pinctrl-k230.c
index d716f23d837f..20f7c0f70eb7 100644
--- a/drivers/pinctrl/pinctrl-k230.c
+++ b/drivers/pinctrl/pinctrl-k230.c
@@ -65,6 +65,7 @@ struct k230_pmx_func {
 };
 
 struct k230_pinctrl {
+	struct device		*dev;
 	struct pinctrl_desc	pctl;
 	struct pinctrl_dev	*pctl_dev;
 	struct regmap		*regmap_base;
@@ -470,7 +471,7 @@ static int k230_pinctrl_parse_groups(struct device_node *np,
 				     struct k230_pinctrl *info,
 				     unsigned int index)
 {
-	struct device *dev = info->pctl_dev->dev;
+	struct device *dev = info->dev;
 	const __be32 *list;
 	int size, i, ret;
 
@@ -511,7 +512,7 @@ static int k230_pinctrl_parse_functions(struct device_node *np,
 					struct k230_pinctrl *info,
 					unsigned int index)
 {
-	struct device *dev = info->pctl_dev->dev;
+	struct device *dev = info->dev;
 	struct k230_pmx_func *func;
 	struct k230_pin_group *grp;
 	static unsigned int idx, i;
@@ -596,6 +597,8 @@ static int k230_pinctrl_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
+	info->dev = dev;
+
 	pctl = &info->pctl;
 
 	pctl->name	= "k230-pinctrl";
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
