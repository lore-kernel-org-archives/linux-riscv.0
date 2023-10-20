Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38503C07480
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byMu+5VdWX5prqqhtV0TytE8fP/XXICsoZbRUnAuLiQ=; b=4LhFUEWTX+iRBF
	2IOF6oH/VWoUMk1w//iukEbaPDpm3aAk9w14opYmEX8bOlmhQsMguLIYtQUzT0acP52FMHgp5jALQ
	/qUOT9NTHhG49gwOhBkJJjUSEfp3YoPVfYsGtJovlri9nBdEywfu55KlrOyjMyZMkf6ngEr8ZLQY0
	e7HDVWs4KJ8/tyymzwxHSC6kMCg/RRkkc+gAkqmUmJpQLrF/PLJxfZD3OwHaHnBTrMJdBIjPxpiF6
	OFKhq9y9ljhKuw8eDkf2aIvtwmFR58OvS8OcnVN+YZqXJ/1RILRlDhgeOR46TUoCPD4nCCrlEu4VL
	Z1S8viR9iT2rA2lAaNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpPe-002M0P-1l;
	Fri, 20 Oct 2023 13:19:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpPa-002Lyy-2D
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 264B6B8322C;
	Fri, 20 Oct 2023 13:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7771DC433C8;
	Fri, 20 Oct 2023 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807972;
	bh=ZL13PrWw5K3xVCLgO+me6aIcFTm6lSJbzGmhVs6/ZiE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMlWGu237ManMtlJWnwlP0qpAkbhHWhU2AnDlm6+N8PLK5ULCZ1TI0dyacKHw+ceI
	 N1m9/nLUF/02XqZITqhVL+4gm0BqcTmU1kokvxQizpQff0iH4PCvtVOFNMg6pLFtK4
	 /BuOQ/abF7/yPmDK+rkPsVB6GJuukjHQSAqZBXBU5JdPjvEqr4vBoQ2gDaZgJA8mlX
	 H5fI1dJXtKEegK6qzdChoyEFKhmfK8vKT/f9WJ4c+/uRo0c9s06XQc5EwpJDk84N7X
	 n4PB0I5JWXqUk2uNzNf4+U2aSyFTAA6aGvYKNoiCzCMro5Jgufb8aII10mQVAsI8At
	 3nrQFS8Y/EecQ==
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Russ Weight <russell.h.weight@intel.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v3 3/6] soc: microchip: mpfs: print service status in warning message
Date: Fri, 20 Oct 2023 14:18:41 +0100
Message-Id: <20231020-algebra-marbling-eb4bc6cafe0b@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=rzntulbyy2as8lB0cjqZuWUxOpdX+a/pktMf8WEg89o=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdbo8X/pbQzjXlDurtV9UenixcHH0FeuSP4fDnkul/ vsdlV/YUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImsWcHwP6njJO+Kny9UbY57 Xy9ce6ri9JdfbRMtJs3Slr/n18hob8rIcI/dzMsjRPhiAd/8/w/d5Gs2frxwe37czbStj6Puz5b w5gAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_061934_856621_BFF25CFC 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Now that resp_status is set for failed services, print the status in the
error path's warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 829d6c511efc..f363f13567f0 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -66,7 +66,9 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 	 */
 	if (!wait_for_completion_timeout(&sys_controller->c, timeout)) {
 		ret = -EBADMSG;
-		dev_warn(sys_controller->client.dev, "MPFS sys controller service failed\n");
+		dev_warn(sys_controller->client.dev,
+			 "MPFS sys controller service failed with status: %d\n",
+			 msg->response->resp_status);
 	} else {
 		ret = 0;
 	}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
