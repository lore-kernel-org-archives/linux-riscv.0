Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D03C83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kP9m+Az7OUaVPvuR+kTpaMIhKbjIxOaYHbb+iBm5VWU=; b=jxeev1F22th4mA
	It2b7BKwE1ChwR0Dfe/0Hwqw3n+bOtp3DoPdblQskWC7BVBbG/XEFNzJFqIFuhGcw16lT+YHwkQ45
	qgUzta0uFtdLMh5s+ns2MIejBozxEHXlSIZ3HwPTHAcvElr+Vke1sR8F+QcvIBOXUyEPgFXMjddcD
	vCkLrKUYDo49Yv9PDLF3nLRK1Ia7oDWaCDxD6aorw6BUW8SCF8fTDhym8dEl90fwdKPF3/XycfVNy
	mY2n8dU0QSVer1gVpvXO5RO32rgvrUxH/KKanIR2zUQCGPeZYUSUeezkLJC+RxGVDLvh2gb56R551
	q7M4PrbBPNUsHJ9v7yKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaZK1-009LLa-1v;
	Mon, 28 Aug 2023 10:18:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaZJz-009LH8-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 10:18:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so25952535e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693217886; x=1693822686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CeZBtWQaJUN6ZOGBoOnH558TFF2EUag60T17Wp9Kg4M=;
        b=Vs8QHefx/RWpAkKrxleoTCuMbFc/uAGM+iQu5RyJo7hteyEQolfGpUZsZJQ+fQD/sk
         IVi5kqxICnYYpKflJyeC6VwO6Pdp1+seovJbejJ6ME6vv48YEDnxgfruXCr4S9Gv3E9j
         0wwu0BX60HriSq/ShMnqgWG27zes2bNgtURPYo0nfXnDuKugv/9GOO71BpIcl/L0/NSV
         K50TH0gJhoqfZLnOBzmVlCwN6p/1yyH+ZB/t812TJhals2Dcq38DqIhj4OaCcm/Vwtd1
         4TbJyp9cuqC+WT7tgpMkJpSuzpr+EDZqcxuYCg32BwBUFM1BJqh2cWXg0haWlVAbw1bh
         QrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693217886; x=1693822686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeZBtWQaJUN6ZOGBoOnH558TFF2EUag60T17Wp9Kg4M=;
        b=PBQsUtqVKPuld/NkepBEv2VMzH4S15FBnMMokZmtDXuyJrrfvGKAevYSu4rsTYyeT4
         xQLRQnxYOiuN87X6zvfZl23Z/Lt/RMSJPPHLKvxLFljx2LNvAs8jvXGqF04php2pTO14
         tipqML7aZMpFbFRqpqBUhyJ311ePVpX7Dq7nLPDI/6nFDwXOJ0MJ1SuELlQtxMoUM966
         nVzJEcliQdihK4ml40e3LFgKY/hs2zYjAXD7ht6fooAeZHgN3A/G1waKARw7Qcr6YePF
         RN7AYE8x+1QIg35cPHnI1ebMlqJnrxHkNLpC20W6mHFrLCB00R2f9bKP7td2R49QETQi
         z7QA==
X-Gm-Message-State: AOJu0YwxpwpcyymMvE+BTKsvzQLmr/y/Bfcv8hQj3NKnhZ/4KKKGZ8HB
	9OmrdSbGPtGTkpgNNhGlsZ7Ylc44nSg=
X-Google-Smtp-Source: AGHT+IHlR7naiZ50D4GZfiqE7+hS4xiSzN++QiIM+EM1E63Np0zIERMFSvy1wgM39uNwGoEott1LWw==
X-Received: by 2002:a1c:771a:0:b0:401:bdf9:c336 with SMTP id t26-20020a1c771a000000b00401bdf9c336mr4871176wmi.27.1693217885966;
        Mon, 28 Aug 2023 03:18:05 -0700 (PDT)
Received: from localhost.localdomain ([92.85.190.61])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c224d00b003fefca26c72sm10374554wmm.23.2023.08.28.03.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 03:18:05 -0700 (PDT)
From: Andrei Coardos <aboutphysycs@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: alex@shruggie.ro,
	herbert@gondor.apana.org.au,
	olivia@selenic.com,
	daire.mcnamara@microchip.com,
	conor.dooley@microchip.com,
	Andrei Coardos <aboutphysycs@gmail.com>
Subject: [PATCH] char: hw_random: mpfs-rng: removed unneeded call to platform_set_drvdata()
Date: Mon, 28 Aug 2023 13:17:57 +0300
Message-Id: <20230828101757.9724-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_031811_209923_4176DDA6 
X-CRM114-Status: GOOD (  10.97  )
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

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---
 drivers/char/hw_random/mpfs-rng.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/hw_random/mpfs-rng.c b/drivers/char/hw_random/mpfs-rng.c
index c6972734ae62..0994024daa70 100644
--- a/drivers/char/hw_random/mpfs-rng.c
+++ b/drivers/char/hw_random/mpfs-rng.c
@@ -79,8 +79,6 @@ static int mpfs_rng_probe(struct platform_device *pdev)
 	rng_priv->rng.read = mpfs_rng_read;
 	rng_priv->rng.name = pdev->name;
 
-	platform_set_drvdata(pdev, rng_priv);
-
 	ret = devm_hwrng_register(&pdev->dev, &rng_priv->rng);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register MPFS hwrng\n");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
