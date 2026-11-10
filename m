Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173426071E79
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=slvaKnPJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qt8Vt/uA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ful+ZSw7OH+uAXFABjEjk/ARDga3w1kNse9GUas75VU=; b=slvaKnPJMdMi6NgG+28nvRPAYA
	XVz1R1WYyp43fmZ3Qadm2syGaYf2YbKuDac/dun3UKiqjD7hJKfGHJWyB0y0jY3eoFip6qKJCofwA
	28gQfqRMkZXhJUcGJEty5eUYiJopuuwqENCmUHsIBQUEbxbdf6X9uy8anpEaufHUH/AWgEoZHGgIm
	zadBp5J5akgquzVVAA0SmOw4Y2NThBv0Lte09FM1jAY/K8MCHHaNwSh0O3xjc6nWychFBmBHCmKA2
	M8057f/ix9377SlZaJyemzBLxG6KnKlP25ZOmpO5zfB8ceJ+zSUB+uyRr3ijKZN1EUVkwCDpR/P65
	K0piagHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlj2-0000000415N-3Gw7;
	Tue, 10 Nov 2026 13:17:24 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlj0-0000000414A-3cyM
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:17:24 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so812616a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 05:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316642; x=1794921442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml3zJxxV6zteBKfYjRhx0ricvuNkb6CeX/qUwgIXjIs=;
        b=qt8Vt/uA9ehOamxhnyRL2Ji6D0hMfAKyK1jWPu19UepqlRrsFLUAejCeloc5XIMamc
         O/9aWOMUobclNoTvCQzqKPR44u1d39p7bahAHFrnqncndt16X9h67mbnrN64FCuKdpVc
         3WmHXUWxwmRth5Xb3qC1tYjnaMajc8GeTGqSNxR9WiQ/R0hItfRv2bwa99RPsiHztSZK
         tMig8flUTx9+pQk0bTU4irpi1yk6PzyXAqKR197b08fnWzdwIvb01Equ5aYzI8zpKR+3
         LyhCa+axfqEKpYaRd20Ql/Jr1Pqd7dGd2JikEKrO+cnC3GHfVZNvdeU8srRmUkvchoD0
         bZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316642; x=1794921442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ml3zJxxV6zteBKfYjRhx0ricvuNkb6CeX/qUwgIXjIs=;
        b=q7EY7Q5r/R+qtVBQoe58IU3FC8B8mtAjc2rKyKzngBtG8MS8PQ54na489bvS4043BE
         YOmB0IHXXKTKGZgd3eo2LObdrbEjeYQSyH1Elb3sRBbQnuFxNht5PJ7AIyNNEEqPCyIe
         ULNGlJtbP89X5Ut9kfnZ75I6qpEvsyufUT53AjH7vFLsAJEy6vMFcMronL2DFy53GvfR
         FzOgqc2R0/FuOPaWgbvPlWb98Mg5/+Q4Gqkt0ITQhE7cL3lu4xa+TH7Dq/UgqhoxixUe
         +uYvRz+ttvgBa2xKiJ10OBwK6ZIMzh54q538SzCkEQ3m+PWfNEz+cYjFWRFD+3Nst/3+
         KWdQ==
X-Forwarded-Encrypted: i=1; AL+hErGAEnBSk6dQwn6Oz/YzvECP6vqvLzJVmqpe1JBSXDoBS4ip4oxMsCfDpmo7E2yXLXrM8+CURMgw5w/Luw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8y95dGO7qEFcjoXu7AY/JDHkIyAlp6KT+hz97Ai7ErnmoXJzRf
	sdO5Plk54IE+0rTQwZB5NK65ddnh2upH3/oaa9OIO6XbOhSMAVmjlkb2
X-Gm-Gg: AYBFou0+ko3nOTiCr/Gk8t2WZFah5bLgxgBlUyegT2r7nOzYqB+QHfzO6+SJGvIOXMG
	JtIdElJieiW6qcg//5IH3YfgVbelM2aJwcLZDkn8MmICn29/JS8+CThcoFEwk8F8qQOwJDHgXPH
	H/Hz6vuOc9kTiRM+YDqII13UQbtzNrjikkyAbvhHv/T8AuvvP23J8j3Sz73gZp526dnf1cZqCaK
	x0DmDJJyJfNNQIekVAM2WY2R35gQx0bS5ReQJN7SqoK4nHKvlQMBNapCybBbmK3siTBKTIBRsWl
	gbS85yZQDiyzFm8iIR5H91N4oJ7PP8Q4zSNEzO+Xh7eZly0yu51YsY2lms03h8Bl8gXTcHyd/zc
	CZzrgiJOiRmZUbFUp8jX/qNHn3eY43vScSKysxDudRbYL7nZFHCwOZ5HuB5AEuYbSHvHZ0uITQX
	kyV1I1pXecebsbmd9znWrZfNO2Isg5bmA6pGs6mX6DK18kARY0eAnigEdGYQZ9x4YTU1LPUyotP
	rmFakT04peJ0RyzV5Pk72b4Y6EX2eouGdvfeMiFetwlxyz45zZVV0E41JLUPBDPvT1v0ukOP8Wh
	N4kOq9LTptpw/1k8VTlwrPDWIrnAn0I=
X-Received: by 2002:a17:90b:4a50:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3b166d30739mr2698856a91.52.1794316641976;
        Tue, 10 Nov 2026 05:17:21 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:21 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Frank Li <Frank.Li@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 28/33] dmaengine: sf-pdma: route error callbacks through channel BH
Date: Tue, 10 Nov 2026 05:13:28 -0800
Message-ID: <25d7826e0e6738356657f523e6f6cf3450e4b26c.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051722_912700_04D3728A 
X-CRM114-Status: GOOD (  14.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

virt-dma now dispatches completion callbacks through per-channel BH work,
but SF-PDMA invokes the client callback directly from its error tasklet
after exhausting its retries. That descriptor is never actually
completed: it stays on the issued list and in chan->desc, the cookie is
never advanced, and the channel does not move on to the next transfer.

Complete the failed descriptor through virt-dma instead, mirroring what
the done tasklet does for a successful transfer: unlink it from the
issued list, mark it DMA_TRANS_ABORTED with the untransferred size as
residue, hand it to vchan_cookie_complete() so the client callback runs
from the channel BH, and start the next issued descriptor if there is
one. Reset the retry budget at the same point, as the done tasklet does
after a successful retry, so the next descriptor does not inherit an
exhausted retry count.

During removal, kill the producer tasklets before the channel BH so they
cannot enqueue callback work after it has been drained.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index ca60fb46ade0..992f9f103702 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -326,9 +326,21 @@ static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 
 	spin_lock_irqsave(&chan->lock, flags);
 	if (chan->retries <= 0) {
-		/* fail to recover */
+		/* fail to recover: abort this descriptor and move on */
+		chan->retries = MAX_RETRY;
+		chan->xfer_err = false;
 		spin_unlock_irqrestore(&chan->lock, flags);
-		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
+
+		spin_lock_irqsave(&chan->vchan.lock, flags);
+		list_del(&desc->vdesc.node);
+		desc->vdesc.tx_result.result = DMA_TRANS_ABORTED;
+		desc->vdesc.tx_result.residue = desc->xfer_size;
+		vchan_cookie_complete(&desc->vdesc);
+
+		chan->desc = sf_pdma_get_first_pending_desc(chan);
+		if (chan->desc)
+			sf_pdma_xfer_desc(chan);
+		spin_unlock_irqrestore(&chan->vchan.lock, flags);
 	} else {
 		/* retry */
 		chan->retries--;
@@ -601,9 +613,9 @@ static void sf_pdma_remove(struct platform_device *pdev)
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
 		devm_free_irq(&pdev->dev, ch->errirq, ch);
 		list_del(&ch->vchan.chan.device_node);
-		dmaengine_kill_bh(&ch->vchan.chan);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
+		dmaengine_kill_bh(&ch->vchan.chan);
 	}
 
 	if (pdev->dev.of_node)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
