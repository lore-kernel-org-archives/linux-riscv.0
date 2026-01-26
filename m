Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051E8D13C11
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B1zdVq/TBZhdJO3sWNjAe9+07mV/OAYbR+A3E8VHml0=; b=xGShmSJ9vwu4Sy
	8zRjepvjpB3KMf1GUXTGf7nm9RyejrYcKByoXafE8NmWuWaxqNKsX9P80sHLvuy/aLfH7zJwv3K3I
	iBgv9PzwNaDhP2L1spVtQy7C489Hga0PsJ+vhtjf0ELHlJjR3oowCzB7J+XFjpp/b1ZCic5IKvKIi
	UfNPtSzki9rzJPi9nTyCStzSliOkgy42epFsFKwbn3zqf2wEv/gpRCaBD51lPpG99MNYsW9M5CiDl
	iBSErQsASAiscu75WDM/GOkh/wvyJaMaCUieZjZgufFwJbKFXi1OCFpize+DUqVXsAjm3plc7KF4M
	cOebjPihV4N6bcUvyDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN7n-0000000CfTS-2BWO;
	Mon, 26 Jan 2026 13:59:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN7l-0000000CfT9-2TGK
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 13:59:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so34523545e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435963; x=1770040763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVJ9Z68aHKVQR5TvJwQMXLNoEmAsqHmqBFFlgBpron8=;
        b=Br8Yw74gLFMMx59F+weH1UVbOVZTepFulg9VEwzUltE35KgN6RCpZ2TDIeQBlD5Rrw
         5NtEj8PtA2My6OfiWsvjURFpqJUquqTUoiJCa6uniu1JGo8AR1TWgrBx2MndwDMs4MNg
         4o3EQp/uaLuTt7OFvw1Hykglp4G68sHxk94KdwkP9lUfhS9E4Du2S69tIP9CHS6fEWjc
         xvNVYAvHcRkJUa07w0yjzNjT5bXGSqXcd0TS3ZzYw2skJ6p3RVKpVw0b75FlzErcik6n
         Gc2AQNmttz8t8e7u6d9YxalzqPLVhfDbH4+E2SITs8auZAP7da25cUbnyMZUitnYR7qO
         OYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435963; x=1770040763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVJ9Z68aHKVQR5TvJwQMXLNoEmAsqHmqBFFlgBpron8=;
        b=H4nRv/qiGpp6IPcMrEpf7OJbwaCYLXKIjdeaawpVVTea+CYrfJ8er+zex01iZX2M0W
         pyqd1XVb80hpzTLKjj1J9Wx+6QM/MumbLJH+pbF1IRGu5D/y9O1yj9QqrrPn8+r3d0Yp
         NoXXnxtUrYdStpmpfOYyt7bFrETdIWwF7FN7MduM2AAcfs+z3b3a7m8n5G7SY1TR6IsL
         X/UtPEWZGJiWNkeJ6LsmW1sjQJEKIePPWLR44vy2RYgVIJT8U7CmVGTaKwgZmNhOQIgG
         GsD2BvgNhleF0Yn/lbQPFlbfT0ZtGkyo7qWDsvoSMvw+YCt9fzzsOpbptocrftEMtzaP
         3+wg==
X-Gm-Message-State: AOJu0YwtMRfWqu4cic0+vxD82+zZUFRubFgQP9hZahHjxNdEgPtSLCvX
	mH+gmHh8HXHxiCbw68cBknBIh+sKPMxrKzfkpNBCwn1UYcIGqQeOPv8=
X-Gm-Gg: AZuq6aJ1dICGP4l2KqBY7B0f3cL37MYfbuvOlNOUvvZubb5q8oM8uPGF27iGnJr5XhK
	lkjJcIRR9LUupPpwdo7MaMHva6rUv3w1nIUZRP9KqMo7xHVwd+9/u+VLHYDeHtPJMIT+lrcE9Gc
	vh8z3BJxFCmrNxK12up6e+PYGwd5WQvEX/+mUgZ4dFVCDWBE2qTeBNyDGxAdDgdSpp2S4zJRZsg
	O18WlSbum60mcNo3AN4nsq/PRm+P8gQoN0zRzFNT8JzkNc2WFMRJLW67484QISDFnjQwt+UClD7
	Vq5F3PWq1EfGlgrAVxR0ZKJaR6nlBWVUbRt/sgVKGMST+WBUcf2pWbHHtOqclwHSgLswTQktqUF
	okqaOA6QC3DpdA/a0GaU99YRmydvbj1CPdPbQUC3dVj8sfvC87CSLO65CidbpD4IZ6LY3AfxOKC
	chQPgYnIvKhByIjqQ=
X-Received: by 2002:a05:600c:828c:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-4805ce4e740mr82914185e9.16.1769435962638;
        Mon, 26 Jan 2026 05:59:22 -0800 (PST)
Received: from localhost ([2a02:169:c21a:1:5aa8:4ea4:a58b:fc48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d5f422csm109898745e9.2.2026.01.26.05.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:59:22 -0800 (PST)
From: Tomas Hlavacek <tmshlvck@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Yixun Lan <dlan@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Tomas Hlavacek <tmshlvck@gmail.com>
Subject: [PATCH] net: spacemit: k1-emac: program frame size registers for jumbo frames
Date: Mon, 26 Jan 2026 14:59:19 +0100
Message-ID: <20260126135919.77168-1-tmshlvck@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055925_661468_4C98B409 
X-CRM114-Status: UNSURE (   9.21  )
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

Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
---
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
