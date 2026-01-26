Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE56D19503
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 17:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLIonPxjynDO/wxOjzep5iZDP6CtCNKjhDKW7cM1++I=; b=WyhlrS7Ctib/yI
	IccAtXSf2F+fM5wpGsLJ4Iaaqz/AKFbrKoQszYKWtRy9t86jV4/ih1Pvj61uudKUWcJl+EhxLq2uI
	jC3v614wXYh9KJy6PYVQj06cO92aeWr7dGYNG7LH8FGbVzbo+c3kXu8tlIJCG1o4GB4Xi2zf60F4t
	9Llv+f3uXxKHkQcyzfxjSzCNitSy5DmfmGO6I94LnNOF0I7xt0QH/tUXgei8ymm2lcrN1KlzgW6Nr
	NP032LeCSlQjUye/7Om+RDVEY2G0OGwGrRmXG8z4YROi+4PWjWkgC2VLZUZxl0kU8xGbMkrEzLNeZ
	uTAWAdtFeR246KUGVuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQB2-0000000Cwas-114U;
	Mon, 26 Jan 2026 17:15:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQB0-0000000CwZs-0JhJ
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 17:14:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso48090595e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769447696; x=1770052496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHXVzDDBmvnIJ3lzKbW0IxNth1KaCaSoyXj6yfLdil0=;
        b=iWMey817rhBzw23Y1RJ7b9N5vnwzOzGBJtY2rhRnJuOmXbY/6J+GPFkLgFeb0kI/85
         n40OGnQDB2yGLIn9m7xrvRPJPj3QR8pDvBEcTQNCK0qFdj1keHh9hwg+Ko53IjnM37b2
         Ku+0KpTCCKRXp7+NwBY0rgo9GLn7z/X7+okpm48LRQbJjNXmx3uCTabHQzGXYa9YLPId
         xo4yjCpzPT/FoMUvDi91g+8yDHv7ZAADLboCyj7XbjDbqXYv5AT92YlUqLHp9LWKLR9u
         sT8rHop4jbgW71L8rpQWXyHSp9hbwgGrCj0eGMv69YFTAeUMkp0t93AC6z1g/CVTEw07
         RHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769447696; x=1770052496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SHXVzDDBmvnIJ3lzKbW0IxNth1KaCaSoyXj6yfLdil0=;
        b=kV1JD6RcYtvR4XZEYvyXrq4JKbf3gN4L+YfI0ztRVHnvDf/k3TcossdbzXbvTUrGsv
         3YEftFovSM0eCBJoKLKRzxD52TIBSF3PzOQrLgtrDUY5roOnDRRGdCSkkwO2Fqhe9z7L
         DdZHfbAwlxg1KxGHo7A35FrFLvZ3iAdia+IjsUEaoaIXZ420xLClU8exZ/A+5GO6cDOZ
         KE2RHVjUl3X5rvZoJXLKpFUcAqo4OirRSQZQDkw/qBJE4WTZrVhQ7I7nXGJec9HdDY/T
         Q16aQyVnTRdCYuh7ellS3+AgtMU7YfJS7V6jJdl4pCDT+wgDERF1At7a5qOEUFlR232Q
         FpOQ==
X-Gm-Message-State: AOJu0YwW69Un3IRJzUZcKJiEtl2p91S51K8qH1Qc+0kFp3ibh/KDJiQt
	Et4Agcv5FiheJ2MWFRTfETY5iTqocafvy4UfvmWEWUu0Egz8qKWu+J8=
X-Gm-Gg: AZuq6aK3eqyzmZXTWQBQQ55cqi7xbinmjGMGeZZvQaodzlMIxBel5ZHDf31Y9P6B0xH
	NnggQBlAtN0f1A/BATvSLfdewuvbhcsDwUEoM8z8BQsXjtinFnX3qJ6WtEnj9yLCCNxSgqtVdtW
	6BzOHfpKsy+2il/U+oWfD61XJ0wtN3aDWZgsQcZujOkEqTa/kyeupezLPpabZa0k+olOrSAAq7f
	c61McufFCWJkksK+c+wSDPHRh0Ln8ug6Q54G24TapaaHTNmuBDytyG8LS7asR8czBweg3qfUJg9
	lkn7I2Pe7LjTFGZ4i2d1wBTnUGuCs3CnfTMyQNsec6D7uZBQU5LvR4umF27isFHbzH5lLKq7NDg
	57giaKJgdJQCOW/ufom6tgvmphU+CFUeHH8eCXYDX+r/tFXvodu8WtEWTV4LPj+bCcgqRG53SeU
	bdso6u
X-Received: by 2002:a05:600c:5395:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-4805cd40961mr78662845e9.7.1769447695886;
        Mon, 26 Jan 2026 09:14:55 -0800 (PST)
Received: from localhost ([2a02:169:c21a:1:5aa8:4ea4:a58b:fc48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066aaf30esm3136815e9.0.2026.01.26.09.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:14:55 -0800 (PST)
From: Tomas Hlavacek <tmshlvck@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Yixun Lan <dlan@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Tomas Hlavacek <tmshlvck@gmail.com>
Subject: [PATCH net v2] net: spacemit: k1-emac: program frame size registers for jumbo frames
Date: Mon, 26 Jan 2026 18:14:49 +0100
Message-ID: <20260126171449.83288-1-tmshlvck@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126135919.77168-1-tmshlvck@gmail.com>
References: <20260126135919.77168-1-tmshlvck@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_091458_148861_81C3475C 
X-CRM114-Status: UNSURE (   9.49  )
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

The driver allows changing MTU up to 4K via emac_change_mtu() and
allocates appropriately sized DMA buffers, but it never programs the
MAC_MAXIMUM_FRAME_SIZE and MAC_RECEIVE_JABBER_SIZE registers.

This causes the MAC hardware to reject frames larger than the default
1518 bytes, even when larger buffers are allocated. Frames exceeding
the default size trigger jabber errors and are discarded.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Cc: stable@vger.kernel.org
Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
---
v2: Added Fixes tag and Cc stable.

 drivers/net/ethernet/spacemit/k1_emac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 220eb5ce7583..31b1bdb2827e 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -228,6 +228,12 @@ static void emac_init_hw(struct emac_priv *priv)
 		DEFAULT_TX_THRESHOLD);
 	emac_wr(priv, MAC_RECEIVE_PACKET_START_THRESHOLD, DEFAULT_RX_THRESHOLD);
 
+	/* Set maximum frame size and jabber size based on configured buffer
+	 * size.
+	 */
+	emac_wr(priv, MAC_MAXIMUM_FRAME_SIZE, priv->dma_buf_sz);
+	emac_wr(priv, MAC_RECEIVE_JABBER_SIZE, priv->dma_buf_sz);
+
 	/* Configure flow control (enabled in emac_adjust_link() later) */
 	emac_set_mac_addr_reg(priv, fc_dest_addr, MAC_FC_SOURCE_ADDRESS_HIGH);
 	emac_wr(priv, MAC_FC_PAUSE_HIGH_THRESHOLD, DEFAULT_FC_FIFO_HIGH);
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
