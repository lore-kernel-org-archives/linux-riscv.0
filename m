Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837EACCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2fY0Uw+b5hZCixcTGNObpIofxBPl9LGVCXRajRhjcIg=; b=fR0Oeq/SLLH4K5
	+zOt405w1ywPLQyrvbMqJkC6SbkO9uD3VR44q4mZ3OyST51YdR1CoCoU9RLYmAZKOIOhBWmpgHemE
	ZJwQ5pizt65aU55pdxd02yvaOhvCtwlZqVBNtUHoUve1idUhXTg/BofN71t1eUX9jdGXAIqyZ+/q+
	yYCfhPjMAZEyFXUd86yfIpyxlxQAlR8KKbwFipfnaTS9kehiOgMn+xYg+m6D85Q3hJRym7rjcjtGn
	koBSnobCz9afLhVBRBDpppam4K8jQv1rED0AzQe31OcaUcrQ68FJrkgkwPnUdH2HK2EFOp9USUv+r
	DScc+7TUfrlmsgl9tqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAwj-0000000Gqg5-3Cyb;
	Tue, 21 Oct 2025 11:54:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAwh-0000000GqfY-3o9T
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 11:54:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DE6A623DD;
	Tue, 21 Oct 2025 11:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C460C4CEF1;
	Tue, 21 Oct 2025 11:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761047657;
	bh=uPZbpRtuUAGL7PXaUrKempyAjExOsq+OSZosdwkFDXc=;
	h=Date:From:To:Cc:Subject:From;
	b=fN7l/pOj403MC/dOkqseufxCFbACPUg2lwxHFfFY5q4H9hqfuUlOPralnu4qGlMMP
	 Yf8Y6gbDYv9gPMQoRJ+k9QtKGb8F1Zdy1ulks5cy7QOoLoCxpNKNSByBzSeWkrjs9s
	 nTo5xpLi2DVSdgNtHyuhWGX5dVw8ZIfxUBLhicyM40KnkflGnvoaF22dt91B67OW94
	 /PAeI2BPwTb971P1Xtu3W6F1BNiRBRMAnsyHk5Bt5ZWXBSLJguxpjl8giNlKonIKyw
	 JvlHTZIGU3TX0MZs4EwizUxBkS1y5D2s+fJdv91HHCuriJ9KAep61/OM30zoj4kEYf
	 vMOmklZ5sV+PA==
Date: Tue, 21 Oct 2025 12:54:10 +0100
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] net: spacemit: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <aPd0YjO-oP60Lgvj@kspp>
MIME-Version: 1.0
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use regular arrays instead of flexible-array members (they're not
really needed in this case) in a couple of unions, and fix the
following warnings:

      1 drivers/net/ethernet/spacemit/k1_emac.c:122:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      1 drivers/net/ethernet/spacemit/k1_emac.c:122:32: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      1 drivers/net/ethernet/spacemit/k1_emac.c:121:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      1 drivers/net/ethernet/spacemit/k1_emac.c:121:32: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/ethernet/spacemit/k1_emac.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.h b/drivers/net/ethernet/spacemit/k1_emac.h
index 5a09e946a276..577efe66573e 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.h
+++ b/drivers/net/ethernet/spacemit/k1_emac.h
@@ -363,7 +363,7 @@ struct emac_desc {
 /* Keep stats in this order, index used for accessing hardware */
 
 union emac_hw_tx_stats {
-	struct {
+	struct individual_tx_stats {
 		u64 tx_ok_pkts;
 		u64 tx_total_pkts;
 		u64 tx_ok_bytes;
@@ -378,11 +378,11 @@ union emac_hw_tx_stats {
 		u64 tx_pause_pkts;
 	} stats;
 
-	DECLARE_FLEX_ARRAY(u64, array);
+	u64 array[sizeof(struct individual_tx_stats) / sizeof(u64)];
 };
 
 union emac_hw_rx_stats {
-	struct {
+	struct individual_rx_stats {
 		u64 rx_ok_pkts;
 		u64 rx_total_pkts;
 		u64 rx_crc_err_pkts;
@@ -410,7 +410,7 @@ union emac_hw_rx_stats {
 		u64 rx_truncate_fifo_full_pkts;
 	} stats;
 
-	DECLARE_FLEX_ARRAY(u64, array);
+	u64 array[sizeof(struct individual_rx_stats) / sizeof(u64)];
 };
 
 #endif /* _K1_EMAC_H_ */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
