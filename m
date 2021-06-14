Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BBCC48BE8
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 02:25:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B970613AB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 02:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B970613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=doQaRUDrlLmES9LtnD1qF/w82C8SLoKHt8Ju/IkulDc=; b=pkLjfufoc94vKC
	2UDYQg0TCFYb8WGXR0TcxDzP2XSTfcvt/7zBkAsyy7JTw2Ckz0Vqael9KTGBgIE3H5F28yDT/xDiE
	VL3O75oo4Rz4cERaFL2tu0042speIDjiYUJeC/eJYj6hWL3sEtIEY5X3joJLp8dfOZNdD86xX/8WK
	6WjRKnMgR4M71ytDU7EVZeddlsPQ98mnR9YmCOXKJPBeLid6noWeRLAWNKnlfwqkAD1gJzdyOw2Yh
	nVWI+WtilEVSV3VafrKP8feThT1JRLlDPYpboFA6+ZcWmjY1i9Pa8h3b/cadvNYj4Gp5K56n/iR6u
	DLglx/lOlRNd0CcYAVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lscHt-00C4CK-SP; Mon, 14 Jun 2021 02:25:17 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lscHq-00C4BA-Hc
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 02:25:15 +0000
Received: by mail-ed1-f49.google.com with SMTP id dj8so44393966edb.6
 for <linux-riscv@lists.infradead.org>; Sun, 13 Jun 2021 19:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eYvGHjDCuADljb2rO2hqe2W6UV06jWEIjTXex3m2bhA=;
 b=QM1MafxmLt2vvFoo5eufeJJzub8Qtzec1UgdqoJq9hVsmkXtHOH5ZRpS4PzzL2q7vy
 e+IavqB1LcH9cx+L86i/v9qQ5S6JQaJGk2+b9uMVU2eV1edr6Si4RsJS16iCC8qHBQGE
 GkwvG7xxdN5bYVHbzgq0xf5rEYBDCq32x5ZplNjHiV8f/1zMagBIiBjznXdtfhzL1w0b
 0C7ZjOGIiObSV0YwNxHk+RPtwcawBkHq6BFnbRKVae4YOvILQjGnOYo9y7ZnjFwEZpY6
 ZlEL+sqjKHEA44j8rSK9+r3GfyP/rcukB9+nZNoIs9NPMo/QE0scTOc4VvkBTJG66u+e
 2/bQ==
X-Gm-Message-State: AOAM533hEN2YFucOD3SHxDODIXBi5JIi9nvq/Q54Yd+fRZkbImna2bYi
 jEd0ptCgi3+BXn0/uPCnsAKYQUySSw0=
X-Google-Smtp-Source: ABdhPJz5Qf30YVGRpepkKqj0PbwpcLmyuUi6u4xZAFZbFSFqAwbCycSGOGuaj9rxmuwf+p8ksRXqHw==
X-Received: by 2002:aa7:ce03:: with SMTP id d3mr14552830edv.360.1623637512333; 
 Sun, 13 Jun 2021 19:25:12 -0700 (PDT)
Received: from msft-t490s.teknoraver.net
 (net-37-119-128-179.cust.vodafonedsl.it. [37.119.128.179])
 by smtp.gmail.com with ESMTPSA id f18sm2768255edu.5.2021.06.13.19.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:25:11 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH net-next] stmmac: align RX buffers
Date: Mon, 14 Jun 2021 04:25:04 +0200
Message-Id: <20210614022504.24458-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_192514_623942_9FCA7455 
X-CRM114-Status: GOOD (  12.43  )
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

From: Matteo Croce <mcroce@microsoft.com>

On RX an SKB is allocated and the received buffer is copied into it.
But on some architectures, the memcpy() needs the source and destination
buffers to have the same alignment to be efficient.

This is not our case, because SKB data pointer is misaligned by two bytes
to compensate the ethernet header.

Align the RX buffer the same way as the SKB one, so the copy is faster.
An iperf3 RX test gives a decent improvement on a RISC-V machine:

before:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   733 MBytes   615 Mbits/sec   88             sender
[  5]   0.00-10.01  sec   730 MBytes   612 Mbits/sec                  receiver

after:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec    0             sender
[  5]   0.00-10.00  sec  1.09 GBytes   940 Mbits/sec                  receiver

And the memcpy() overhead during the RX drops dramatically.

before:
Overhead  Shared O  Symbol
  43.35%  [kernel]  [k] memcpy
  33.77%  [kernel]  [k] __asm_copy_to_user
   3.64%  [kernel]  [k] sifive_l2_flush64_range

after:
Overhead  Shared O  Symbol
  45.40%  [kernel]  [k] __asm_copy_to_user
  28.09%  [kernel]  [k] memcpy
   4.27%  [kernel]  [k] sifive_l2_flush64_range

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b6cd43eda7ac..04bdb3950d63 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -338,9 +338,9 @@ static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 {
 	if (stmmac_xdp_is_enabled(priv))
-		return XDP_PACKET_HEADROOM;
+		return XDP_PACKET_HEADROOM + NET_IP_ALIGN;
 
-	return 0;
+	return NET_SKB_PAD + NET_IP_ALIGN;
 }
 
 void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
