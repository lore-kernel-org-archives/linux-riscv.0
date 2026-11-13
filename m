Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C409606B57C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qCx4VPbY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZfJeOk79
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b8QSzDeeF+kF15ouqKmQxcG1Bxb6e0n6utYCtVyPdDI=; b=qCx4VPbYNr3DTNjGtga4QgBjvI
	2y7rPJn8ss9iIb+mdjZWAjpsWRUMKqMmSfu3p89ibE2qrqBq372zzLcfevxzpBOd4azo7jUAJwCsk
	tsZOm5UoBeqh0/hy8Npwci9Pw9RivL6Xwc3felP//QM97IUonaLjJP7pgxjwYYKSY+yETqxDY2kUz
	CbMdeyisfYc3WDBOg+CebblF/3aWSYZ7aGUa973ViMaJzcxp/OLfUJXgUXhm6lv+RX6vNapiXlR1e
	iuI+f6vIchxnqvEDOBeNwMYlg7lCokkgOlR+85cYXox74rXXcBsOhPPfJ4wGEJYvB2HgudVyV226P
	yJtVXBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrKd-0000000Cwux-2MpK;
	Fri, 13 Nov 2026 13:28:43 +0000
Received: from mail-wr2-x01.google.com ([2a00:1450:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrKb-0000000CwsX-1ONK
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:28:42 +0000
Received: by mail-wr2-x01.google.com with SMTP id ffacd0b85a97d-490dad2342fso346565f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576519; x=1795181319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFUlowHkykBA07bzno9+ZZz7Tclr3AiMw/Mxprm1brE=;
        b=ZfJeOk7983OAz9IKzTZwxJjCuSmHwriGfxKM01bwRzZZoD25ojxbiZnPbsBNULRA1p
         o1yhYbUzb4u8VH3WUDF7DKwAV4EbSHKfIn96j+ZPerjXKAF6Oi+1jPN64A6tzEfHfuo2
         ZlLJTBaIWs2FWfEPq5hyjDrA0DBCNAgG6lhqrVF7d26cnBsHx1nLfacTpv40Vr/D2maG
         GbOju4AabWPfBpOK+jh2gDOiUnvMZTPcm2RWxquRTBN2HIWnZGDy14me+txXFyfNb5ps
         LuS/8pwyDEPZQw25qxYz4KwgGWO3B7DaPThTjD0g/bDFU/bBxShRjfyXMPEu1WrSvRdH
         x5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576519; x=1795181319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFUlowHkykBA07bzno9+ZZz7Tclr3AiMw/Mxprm1brE=;
        b=03hGoTm7IEEUB33w1F6WOumcbO0nyKdEoK7G/H9gEqoLxptKweMXTXQBPG78RLq/S7
         rrfOpVCMjLzpyC+rwg722e+N939wUelFAFF37RzfVp4RIT92fnPFcq3pAXY6WwGTf+V0
         1K+6gwWE6yIDecGYFBnrW7Gu7QMi9TKtjQc5ywesu+f7eJo+LCBW6WTfoQnXG2hkkIH0
         vJbBwvYgH1bQYOjWwVGOdQLK53S7IYdQoOGshIYt2xeFkQU8GgXNxYNrgFFxqwkYBbF6
         shAgJ7rhizRyoTAXsP/lUkd3SIMQE4+g21Bf19Vd77bHlcIqDEo7n+zBgZFZDiH/4zBL
         IFpQ==
X-Forwarded-Encrypted: i=1; AL+hErEfuror9KFv1bjOIG57r+4o0DXI86doZbhdxBEqoIx90/kpJq1r7QjM01dXPtZNmJApRQsYBN0ZrUSS4g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+qFvkXqfIrKvhOYg8dxnJtJKGrgG0R/GFDISlhvK3BRAbdyGgh
	r4bCIjOCXgYkxMw038uTyiolSTx6pO8LILZGUMa01ZV1j7mKl7O/qTzDUOyMtl1BDmk=
X-Gm-Gg: AYBFou1LVckl1lxzn9ogOFfTnWW0aIhBf4ZUD6R2crBwsVMnZC8jsr50oiPRI6t6B2G
	rmig5YCFFdbJ4yNfAKS5nAHX+imoyxuomlll6wGj5b707kxV7R9YIH2M73xlnNB/NPpdqfEY7EC
	idAHyo5sntfw2k+wABDA6v8Hu+Iv6kTxLLSVXghLUGiQi4nb8LpUrcfKA7oEram5qDpr9TFKeRG
	58+NksdPQwjefq7z4W3Ck1eO5nlCXWW+RwzcZV8mBD+M8NA9WSjiXAC5PBBv9xEWwMIg1F/jxAL
	ZeBaF8GJ8/RKjODkuGzbKn9QbErXCyCEMg93jpYWOpBzp2B8/ob5YlcM2xyqO5c2/4y8gXbSjOd
	+qNpANeTmiEzDDmC0xIMGs+UscRbZa+bgi1svxSTc9T8bgftVo0FLY21OWtq5Vp02MUJWDCwaT8
	llKw7bCEiJ/U3hxuzDrgDCJs7XLTBhvSTFz2D12UpfLVpqa8JoxRkpcv+4eqe7tSaK/zAdmPtCo
	afgNeROSEy7xW47zS5DBWFdmNpfXCK2afM6NC4zy6MyQIghZuLzYslGGdRvUrZs5ZSJBhGZumR3
	BWYhopvFRq0jKRzPI1cgRL/MyaDa8mE8TtCX4h6RXmO/UbqtGy0dOdw=
X-Received: by 2002:adf:e18f:0:b0:491:895b:4c02 with SMTP id ffacd0b85a97d-49c713ae4d2mr5232726f8f.23.1794576519158;
        Fri, 13 Nov 2026 05:28:39 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4802673f8f.27.2026.11.13.05.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:28:36 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Ali Tariq <alitariq45892@gmail.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	leitao@debian.org
Subject: [PATCH net v2 1/2] net: spacemit: Fix TX timeout work deadlocking on itself
Date: Fri, 13 Nov 2026 18:24:34 +0500
Message-Id: <20261113132435.434615-2-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
References: <20261113132435.434615-1-alitariq45892@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052841_391352_C6172926 
X-CRM114-Status: GOOD (  12.46  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

emac_tx_timeout_task() takes RTNL and calls dev_close(), which ends up
waiting for the work itself. The function call hierarchy is as follows

emac_tx_timeout_task()
    dev_close()
      emac_stop()
        emac_down()
          cancel_work_sync(&priv->tx_timeout_task)

The work never finishes and keeps RTNL held, so after a TX timeout
everything that needs RTNL hangs.

Remove cancel_work_sync() from emac_down(). Disable the work in
emac_suspend() instead, and enable it again in emac_resume(). emac_remove()
runs before the devm-managed unregister_netdev(), so use
disable_work_sync() there to stop the work from being queued again.

Found by code inspection. Not reproduced on hardware. Tested on Orange
Pi RV2 (SpacemiT K1) with suspend/resume cycles and kselftest, with
lockdep enabled.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Reported-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Closes: https://lore.kernel.org/all/DMO74K2MG3D7.15UUOU1O66K6N@linux.spacemit.com/
Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 71a80838bffd..51edc95f54c8 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1732,7 +1732,6 @@ static int emac_down(struct emac_priv *priv)
 	napi_disable(&priv->napi);
 
 	timer_delete_sync(&priv->txtimer);
-	cancel_work_sync(&priv->tx_timeout_task);
 
 	timer_delete_sync(&priv->stats_timer);
 
@@ -2010,8 +2009,9 @@ static void emac_remove(struct platform_device *pdev)
 {
 	struct emac_priv *priv = platform_get_drvdata(pdev);
 
+	disable_work_sync(&priv->tx_timeout_task);
+
 	timer_shutdown_sync(&priv->txtimer);
-	cancel_work_sync(&priv->tx_timeout_task);
 
 	timer_shutdown_sync(&priv->stats_timer);
 
@@ -2024,6 +2024,8 @@ static int emac_resume(struct device *dev)
 	struct net_device *ndev = priv->ndev;
 	int ret;
 
+	enable_work(&priv->tx_timeout_task);
+
 	ret = clk_prepare_enable(priv->bus_clk);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable bus clock: %d\n", ret);
@@ -2051,6 +2053,8 @@ static int emac_suspend(struct device *dev)
 	struct emac_priv *priv = dev_get_drvdata(dev);
 	struct net_device *ndev = priv->ndev;
 
+	disable_work_sync(&priv->tx_timeout_task);
+
 	if (!ndev || !netif_running(ndev)) {
 		clk_disable_unprepare(priv->bus_clk);
 		return 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
