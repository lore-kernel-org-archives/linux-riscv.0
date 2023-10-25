Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEE7C25B6F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N8Q8aOMGu9kU7l2M6RvZR2zdYv8jqL0/4cs46haN+tU=; b=aeWax6DnyoH0av
	OWhndILwDUJ+k5XnQS3Aj/+oaRYTnxsK7QUz68BlGy50E/K6X3fbaUDc8Qj3ZMpV0/0SC7RLEK6Gv
	313ZqypMymwbKjEa4Az3EdsryVDG+554BccUqHR6NLSyJwjkDQUt6kJoEo8ZfNo3ObAIMJXymLQLE
	QDSE3M+Bop5FTL78wYWzyfje5hP2MDlP4fOqrgBkWtH1ARA+28XQGLbP/XbeITYdoEcsrdphEcyBP
	8VO6hRJK8y9ug26IUcFkLFcmAZKKNPnrW9C2iGam6hmhLhN0kWZ8KEKAqxSkflopdZAsbykN31pQP
	PwtbbgZK3KSvvgvjPZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3g-00CuUL-2K;
	Wed, 25 Oct 2023 18:56:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3e-00CuSf-0F
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:56:47 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 312CC3FD3A
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 18:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698260204;
	bh=8ZSwQnx25XWx6H9WHSt+QTyzglk67NwsJMp2gzIlTF8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=oRXQvxGFWV+36DVVfwcqEhGl1Xhmyd/NxGQSoAHu7trykUzSe4dR06Bu/BKP9fMRU
	 ZDP69C01hJwKDoSbtRH0xmRQ4NpWCjEFEDMA5eFkW1nvZdPbxDphCivbGdW6WbRgld
	 6Qtd9qhW8Iadt88OZ0UmBq7UI1T8H8vfQOdYpV3bPjLVv3BSyeY8zYFhlHbVYDvrMY
	 zwTqPgZ4UeYtemPIoTFo/wSG5yU/H6HLPSI7x4U/TCaY6FpZSP/rRQzihx27CoTdjt
	 ncthGM88eIqznmrhQa0c/WLbxaN+hWm+B8mTG/jTipPMo7w4yDJP+PFlnwnIoleJ2c
	 SkQ4r5XXLdDJQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cb6df5c7bso1682431cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260200; x=1698865000;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ZSwQnx25XWx6H9WHSt+QTyzglk67NwsJMp2gzIlTF8=;
        b=XwEnal4A5P9x5zpVS7FcRTiQwYKAHO9y1UTD4IGApPdJh9jTpb1/SPriNl5X8tOtFI
         qyeosJ2T9FyPR6aKfhZXX9U+IofU+Nhi1fDOaq7cx/EgYAeTtgiRLatt4cXcwKKaJCwG
         eyKG9WLmuZjiu4m3GeczGHemUgiV0nhlgDE20d2/Vix8/d/HQB81Pt/eE+Zloh5ADnbY
         0O9HA2XdxJlDltOiVmFFqCjZHpTkhoWvGrb7s0RzDA9CdiOxaNIXLEcon8hvkREepnPa
         famrnE9pXyLsnCFZhJVbmFcrGPkYaODvJZvHNB7wpj9K9Kbc8MjeB5koLtkSUUl6fTlo
         /bdg==
X-Gm-Message-State: AOJu0YwFrd7YtvSQ5k1zDPPRlViagaw4reZuHTD+e1C9UwoilaqEZLt6
	TGUjGj1Sacv8K9EBfpKVdf2QlkqssBc7MwmJHZlbX6RppEkhhnQc49fOp/T6rHN3RCGEPjbEbaH
	6+lxkox4KsXnm4I0P9v0tfKw372xk+9Ow/pEawqBvzoVgGeFA6+eJSAQnxFz+FkoywGItSA==
X-Received: by 2002:a05:622a:1b9f:b0:417:bd2c:2683 with SMTP id bp31-20020a05622a1b9f00b00417bd2c2683mr17944699qtb.19.1698260200208;
        Wed, 25 Oct 2023 11:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJTkG3zv5DTeWRvY1y/BasKIXcM7hXfHiMkDTcbRf8mjI+q0VqgB+zstaBrwJ9z4uKKWXR3bFMed8oDTtI7W0=
MIME-Version: 1.0
X-Received: by 2002:a05:622a:1b9f:b0:417:bd2c:2683 with SMTP id
 bp31-20020a05622a1b9f00b00417bd2c2683mr17944683qtb.19.1698260199921; Wed, 25
 Oct 2023 11:56:39 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 11:56:39 -0700
From: emil.renner.berthing@canonical.com
Date: Wed, 25 Oct 2023 11:56:39 -0700
Message-ID: <CAJM55Z_U9R6R_t1g5KANV5hQwP91TcHYKGwbnHxXXs5fm0y7Yw@mail.gmail.com>
Subject: [PATCH 2/4] soc: sifive: ccache: Add StarFive JH7100 support
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_115646_244715_F0FC84B4 
X-CRM114-Status: GOOD (  13.46  )
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

This adds support for the StarFive JH7100 SoC which also features this
SiFive cache controller.

Unfortunately the interrupt for uncorrected data is broken on the JH7100
and fires continuously, so add a quirk to not register a handler for it.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/soc/sifive/sifive_ccache.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c
b/drivers/soc/sifive/sifive_ccache.c
index 3684f5b40a80..676468c35859 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -106,6 +106,7 @@ static void ccache_config_read(void)
 static const struct of_device_id sifive_ccache_ids[] = {
 	{ .compatible = "sifive,fu540-c000-ccache" },
 	{ .compatible = "sifive,fu740-c000-ccache" },
+	{ .compatible = "starfive,jh7100-ccache", .data = (void *)BIT(DATA_UNCORR) },
 	{ .compatible = "sifive,ccache0" },
 	{ /* end of table */ }
 };
@@ -210,11 +211,15 @@ static int __init sifive_ccache_init(void)
 	struct device_node *np;
 	struct resource res;
 	int i, rc, intr_num;
+	const struct of_device_id *match;
+	unsigned long broken_irqs;

-	np = of_find_matching_node(NULL, sifive_ccache_ids);
+	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
 	if (!np)
 		return -ENODEV;

+	broken_irqs = (uintptr_t)match->data;
+
 	if (of_address_to_resource(np, 0, &res)) {
 		rc = -ENODEV;
 		goto err_node_put;
@@ -240,6 +245,10 @@ static int __init sifive_ccache_init(void)

 	for (i = 0; i < intr_num; i++) {
 		g_irq[i] = irq_of_parse_and_map(np, i);
+
+		if (broken_irqs & BIT(i))
+			continue;
+
 		rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc",
 				 NULL);
 		if (rc) {
-- 
2.40.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
