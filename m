Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145E2CA5FED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 04:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6oeJrke13fkDgFyrBopADwVNrfORDmQ+N0EKb9PTzK4=; b=m03hd4dzIDPU5N
	JgZwiWjMyg4SV+KLuMcrl6I0KqmzlCX5LsPyprk42XLO5RMkgZqX8tharYJKNyG3UO9DdpfLb9FMM
	Q2HQIbead6xS+iQJ/OBPaEVr1J/PzLmWGpYx47Bii9WFA4kgqCRIY+8CFN7M+iFTPD7Qj7WPD2OEy
	ahjrkWlx2dqtN8XRBS6TbcKgEajdmPe2ynuwCZVuHCjGUNVyTqivbFGaVK72lOWgvBfEExs1Kzm+Z
	C9LXAcMs+iQyvpdPp3LqrO/DD19XM3faIlMM0pthPa54RB7bLVpurXlw8Cb0Uv3OAvzYKOYmGsLgZ
	UwnCDUIxajcjlzI5nzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF29K-00000005TJo-1LN7;
	Fri, 09 Oct 2026 04:24:02 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF29G-00000005TJG-2eqt
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 04:24:00 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADXo0FbbMhqibUbCg--.10115S2;
	Fri, 09 Oct 2026 12:23:56 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Green Wan <green.wan@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: sf-pdma: fix double-free of the in-flight descriptor
Date: Fri,  9 Oct 2026 12:23:58 +0800
Message-Id: <20261009042358.3102885-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowADXo0FbbMhqibUbCg--.10115S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4UJFyDJFW3Cw13Ww1rWFg_yoW8Cw4fp3
	y3Ja13KFW3tr15XF98Gr4rt3Wjya1Sy3y29rWqkwnxCr43Jrs2k3WxA34YgFyDArs7AFn0
	kws8J34fuFWrCrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07b8nQbUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQPA2rIJHz+tgACs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_212359_049334_A7086C18 
X-CRM114-Status: UNSURE (   9.06  )
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

The descriptors handed to sf_pdma_issue_pending() and
sf_pdma_donebh_tasklet() come from the virt-dma desc_issued list
(sf_pdma_get_first_pending_desc() returns list_first_entry() of that
list), so chan->desc always refers to a descriptor that is still linked
on a virt-dma list while a transfer is in flight.

sf_pdma_free_chan_resources() and sf_pdma_terminate_all() free that
descriptor with kfree(chan->desc) and then call
vchan_get_all_descriptors(), which splices desc_issued into the local
head list, so vchan_dma_desc_free_list() frees the very same object
again through sf_pdma_free_desc(), causing a double-free (and a
use-after-free for the pending tasklets).

Drop the direct kfree(chan->desc) calls so the in-flight descriptor is
freed only once by vchan_dma_desc_free_list().

Fixes: 6973886ad58e ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/dma/sf-pdma/sf-pdma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6f79cc28703e..40f556e198b4 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -144,7 +144,6 @@ static void sf_pdma_free_chan_resources(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	sf_pdma_disable_request(chan);
-	kfree(chan->desc);
 	chan->desc = NULL;
 	vchan_get_all_descriptors(&chan->vchan, &head);
 	sf_pdma_disclaim_chan(chan);
@@ -214,7 +213,6 @@ static int sf_pdma_terminate_all(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	sf_pdma_disable_request(chan);
-	kfree(chan->desc);
 	chan->desc = NULL;
 	chan->xfer_err = false;
 	vchan_get_all_descriptors(&chan->vchan, &head);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
