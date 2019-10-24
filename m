Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFD6CA9EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 16:12:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C2F205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 16:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OeGC205h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="R+5n4yKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C2F205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=aGS4CO2vrelN4pjeX7zlQp2qAUFxR2zptftKjViQ24I=; b=OeG
	C205hElQQfgBFxvjHDof5uONG7GUVA/OhGYm6CGU/5r0A64yFV/3NHwShjsoIbjYxorErYOsOOtYO
	/LOzjPwTChJHfChJpd2JkZRj/SncfWm63LDlsmWsTC6JoVQPeXXCSxubOnPtyfjBf4dXtD+nC5Q9g
	FZAm5jEhZt7YZogel1yCT30UwZmqwfmPX6as0tfLZj2t+u6o+pliHVd/Plly+TMV7T1GCIdyCC88N
	K/RlAkR6pD/jDYTNXNpXtf8G3fWnL9aNdcTUqHIoHz0Ah5m6jsoQ0OcQcTdtgEDluHskcIsL3zJAw
	IGfwpHhuH46FjBkxLo+w8/hQ6r30K8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNfiW-0002Ph-Mw; Thu, 24 Oct 2019 16:12:04 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNfiT-0002PA-Rx
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 16:12:03 +0000
Received: by mail-pf1-x443.google.com with SMTP id b128so15467091pfa.1
 for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2019 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Kvxk5KC3Dqb5lgTjDo57yr/xEDMjrRE7fLEnQ6dQl70=;
 b=R+5n4yKD3e2J1JdxbZIFeCJu8Bhn6q+m2pYrFkHj1HmxX9k5ZHHjupwuHdUMQ1tnHe
 0HTHUX1LvXUci5ClcRuPF3YsXWvr+zTUrHCYElaUBEcSPRdzlspjYuyPum5WkMq+SQEI
 13pYAPoFz7dZJ6YdrFj5hdAX0fuveeYVxVwf7eFWyjuEvdXSBUZEYsalLJo26jfGDr+r
 QCww8r4AhRTIyM5ZUyS7k584o3UnS9nkkgOjrPVTsu8TnDc713JXuP98tCV75flQhTX9
 gwVJU9pWsIXGU0vmgKmwM+0iDk27g9YYDqvkX5MV9+hFnAjKTkDaeuPTxThjk9+/2u8m
 vVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Kvxk5KC3Dqb5lgTjDo57yr/xEDMjrRE7fLEnQ6dQl70=;
 b=ohTWQiiGcIhEIiIfEno82uNrk+P08Crmtgc8SZzhNeop19kjY4dY32RkRhQXpv34H8
 chUkdrLAku7j8sqqHaRw6MKhUeOeHJ5PpC+A8wG+vo8iZz1p8FY/hJrAe9SKbkAE5nUH
 nPLtEYuadfs7X8OrDd40TroRarIubZTUhuAP0nCylnOretjMQ9oF0coX1sPcdOd2wpRm
 qFxfou8BPADI0wJBmT2veA73FTtBNuelMBN894UjJRTzzmtnNVBrr9nBIWn4ts0u9B5C
 p87mq/N1HWnIHeouaeNwY74mtF6Ns2GoVH8A7pCuvYBk1S74gGxGVBoO0BTfXfSml6Is
 XbgQ==
X-Gm-Message-State: APjAAAUUT62VSwJsZSofHg+6neTDjudLrB9nSRTm7lT5W2NcCYKS7SzK
 MDJzVpg7sY/BCUgXIqYvXrND/g==
X-Google-Smtp-Source: APXvYqyabEVgqyZVi9GTMZTnXIr9e0eUAxWS3LAwL+rvLuLkD5+o4Mr6MQSz/KGne8tWHS4GNZnf3A==
X-Received: by 2002:a17:90a:25aa:: with SMTP id
 k39mr8077780pje.123.1571933521310; 
 Thu, 24 Oct 2019 09:12:01 -0700 (PDT)
Received: from nuc7.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i187sm32061251pfc.177.2019.10.24.09.12.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Oct 2019 09:12:00 -0700 (PDT)
From: Alan Mikhak <alan.mikhak@sifive.com>
X-Google-Original-From: Alan Mikhak < alan.mikhak@sifive.com >
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
 palmer@sifive.com, paul.walmsley@sifive.com
Subject: [PATCH v2] irqchip: Skip contexts except supervisor in plic_init()
Date: Thu, 24 Oct 2019 09:11:43 -0700
Message-Id: <1571933503-21504-1-git-send-email-alan.mikhak@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_091201_928863_A78F83F4 
X-CRM114-Status: GOOD (  13.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alan Mikhak <alan.mikhak@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Alan Mikhak <alan.mikhak@sifive.com>

Modify plic_init() to skip .dts interrupt contexts other
than supervisor external interrupt.

The .dts entry for plic may specify multiple interrupt contexts.
For example, it may assign two entries IRQ_M_EXT and IRQ_S_EXT,
in that order, to the same interrupt controller. This patch
modifies plic_init() to skip the IRQ_M_EXT context since
IRQ_S_EXT is currently the only supported context.

If IRQ_M_EXT is not skipped, plic_init() will report "handler
already present for context" when it comes across the IRQ_S_EXT
context in the next iteration of its loop.

Without this patch, .dts would have to be edited to replace the
value of IRQ_M_EXT with -1 for it to be skipped.

Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/irqchip/irq-sifive-plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index c72c036aea76..5f2a773d5669 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -251,8 +251,8 @@ static int __init plic_init(struct device_node *node,
 			continue;
 		}
 
-		/* skip context holes */
-		if (parent.args[0] == -1)
+		/* skip contexts other than supervisor external interrupt */
+		if (parent.args[0] != IRQ_S_EXT)
 			continue;
 
 		hartid = plic_find_hart_id(parent.np);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
