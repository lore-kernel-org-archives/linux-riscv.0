Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFE2D46C16
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 02:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Dx7nXTb9tcI2gg5vEN4vrtML72DL5p/R/5b0shL05Q=; b=LFv2X8bboDVyJA
	Of+i7F49gqx0NAIegYcvB1r4Au6x4oiuZei0TWf5z8Vg2OaD6ikNDLYybx8lg2HE3l5ejJUMj9TX2
	zT6Vqo1sFOH+Fj/MdKmzXQQHquTY1AeMNkgbxQ1+IyUYQVb9I84wnVGHO1YJWoOktytV1iA8RV5XU
	Wp7EvHBRAue8v6nd3sk4haMvnJY21dHnxoHT1QcrNIW/+QcvxFKwT9gYc7ahnM0pU9yyMzZXipWZV
	8SukDkAkN7cEbBh7kUEl4miXe1SsbSLubqZo/NsnpcBwO9b+7FBrXvUiyhsf+MESKEcduBWkuRCtz
	th77OxPqhWnHmd7FNlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHx4-0000000H8kT-0ReX;
	Thu, 29 Jan 2026 02:40:10 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHx1-0000000H8iP-3kZt
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 02:40:09 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.235])
	by APP-03 (Coremail) with SMTP id rQCowADX9t1byHppMtQpBw--.56353S10;
	Thu, 29 Jan 2026 10:39:46 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Subject: [PATCH v7 8/8] mailmap: map all Icenowy Zheng's mail addresses
Date: Thu, 29 Jan 2026 10:39:22 +0800
Message-ID: <20260129023922.1527729-9-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADX9t1byHppMtQpBw--.56353S10
X-Coremail-Antispam: 1UD129KBjvJXoWrKryDWr4ktryDKw4fCFWDXFb_yoW8JrWkpr
	4xGF4UKFykAwn29r1qgry5XF18Xa95WF4DGw4Yvw18urZ3JF1kWrsxtayDXr1UJrWS93y3
	JFnFvr93W3Z7A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
	CTnIWIevJa73UjIFyTuYvjTRNdb1DUUUU
X-Originating-IP: [112.94.102.235]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_184008_299884_2CADEFF7 
X-CRM114-Status: UNSURE (   6.54  )
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
Cc: devicetree@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

Map all mail addresses Icenowy Zheng had used to the personal mailbox
prefixed "uwu".

All these mailboxes, except the one of Sipeed (which was only used
during a summer vacation internship), can accept mails now.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
No changes since v4.

New patch in v3.

 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index 428d721ffbb16..ade2883f1c056 100644
--- a/.mailmap
+++ b/.mailmap
@@ -319,6 +319,10 @@ Henrik Rydberg <rydberg@bitmath.org>
 Herbert Xu <herbert@gondor.apana.org.au>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
+Icenowy Zheng <uwu@icenowy.me> <zhengxingda@iscas.ac.cn>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@aosc.io>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@aosc.xyz>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@sipeed.com>
 Ike Panhc <ikepanhc@gmail.com> <ike.pan@canonical.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@redhat.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@citi.umich.edu>
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
