Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE263C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 23:58:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA8F61878
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 23:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BA8F61878
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lSuHW77Cc1eJsVXtoJwrI+gS1rU9GahDW/ijNRzcvTk=; b=GNNCMDXSl9W5RPPYpf/jdCYan6
	oABHDtN1ym+zm++TctJUoDst8Rbc/cQAcqvzi7jWJgOftLTSaD+Z5Arzv8IHI6vYVUu7wW2V1LFIL
	PXDJDsn1snEvkQg2F7W0W98/QNb5gXfbz0nZwHWP5ak6Kr70iTfTYMJwiv6b/eg84Q6zHadoRmTDg
	FUtkijmQUJ8S19odXujklSNOVPop+cl7KIoKQ+dQZkyghzNMRjkf3iWIxTsKSa6OJf8zWeBzjh7Eb
	Yy0QFgfB4agqsjXyEAszRQ54z8MYqhfRAmGp4Rq/LIRSyQyCpDTH84V7AytvwO5qByM9i8DG7qPIC
	4augx4rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1mK-002574-Nw; Mon, 29 Mar 2021 23:58:40 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQwOz-0010Xl-1D
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 18:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=V7QWJ+YGHy2yIE7nOobdxM7F3R9Lizg99THkUvNIUEQ=; b=G9iyx5pXiqdM9
 To3b4o2QUiHkH3Gu8RnOzyjU787gd8syjAU74b+84DW0qvuUU56SICqeFU7Elmnk
 s8U9+VZZ8ur0Rph89ZaiWqNlPSu2JGKoqHttyPhQBLpzRJWz5RQ9/dmvDyIrYEG2
 7UeP5NjSHePiORgSWOJHnR8V4et7mY=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygB3fKTvGGJgC+JpAA--.13100S2; 
 Tue, 30 Mar 2021 02:14:07 +0800 (CST)
Date: Tue, 30 Mar 2021 02:09:11 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] irqchip/sifive-plic: Mark two global variables 
 __ro_after_init
Message-ID: <20210330020911.26423e9e@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygB3fKTvGGJgC+JpAA--.13100S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy3CF48Ar43GFy5Zr1UKFg_yoWfurb_uw
 1ruF9xCayxAr1fuw1UAr13ZrySyayv9Fnru3ZYqFWayr9xGw18Ar1fXFnxGFWkWrWfCFn2
 kayDA343Kry7CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFxYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
 0_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
 Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOVyxUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_191413_770552_AA0E40ED 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Jisheng Zhang <jszhang@kernel.org>

All of these two are never modified after init, so they can be
 __ro_after_init.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/irqchip/irq-sifive-plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 6f432d2a5ceb..97d4d04b0a80 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -77,8 +77,8 @@ struct plic_handler {
 	void __iomem		*enable_base;
 	struct plic_priv	*priv;
 };
-static int plic_parent_irq;
-static bool plic_cpuhp_setup_done;
+static int plic_parent_irq __ro_after_init;
+static bool plic_cpuhp_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
 static inline void plic_toggle(struct plic_handler *handler,
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
