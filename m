Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE780C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5HTzvyb2P6RcXduMVFcRmJE1rkUfTjHZOfYVeLYF8A=; b=Ol+qJyZKU61oRw
	vBFY0bWu9klRAZmPkMedr+9/Z98NB+e0JVH7xUreyzQQzCeAaAHk5qgKOlsdc7ze5rrpeKulMDpWx
	jWQhaYeDuUSRNeFxDznlMdUYpy0VNgmpprQTNFXNS2tH7J5c+ee3ZRQGIYOY2xYhFYqSa2GL9X8y6
	Nlilrhnr7ocI496iDilLyc5ToEmkg+eFRY8RSycgT7KiXb+xfbY1Mv7FPg1e2hrPLPEWdQV8Lth5s
	T8W8gojJs2BEGKgKS142RxT/P7F3dDBG7duTgoiy1sjWZNe1gTrBEKih/gHfWGgykTSJTMsCKFHML
	Fj+cPbLJPpBF+WAjWAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VPx-00Fhn6-IR; Mon, 17 Jan 2022 17:03:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VNj-00FgJ7-H6
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 17:01:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 112D2611CA;
 Mon, 17 Jan 2022 17:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9951FC36AE7;
 Mon, 17 Jan 2022 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438882;
 bh=AGVkdtvLj/AXz77WxRuV1yF6BCr8p0lcB/5+6NNM0k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rjEPrQK2JMNrTRAyao7NJSk50a/L1ePVPKgpNCIYLf3MpYO9BJcNLm5H2cG+cxurw
 KQiEzkEJCPy3XMQJZG83mRwFt4caOMLfv+6YxtSzvyKATXpq8eIzTYyIqm1TLMpvBj
 ynQDxpAqxnsopn8onKq/qUr2r0L4LaC+D0JEWaWEXVzbIHXIdXCs2NfdCYVXAoFP2P
 SXJbq+/fYwE2z6ujtCVSvO6b41KpJCstRPnHOTxa0Tf5hV+1T4nTVkTnLfB4BOgDtc
 M+GP1+0iAxeyGeSKjMVb9a7ND0xtzJCoC2ujwanQYYlhS1na5uYuq/pK0Z/m1UbZrE
 sx7LsFcnknrLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Sasha Levin <sashal@kernel.org>,
 lewis.hanly@microchip.com, jassisinghbrar@gmail.com,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 51/52] mailbox: change mailbox-mpfs compatible
 string
Date: Mon, 17 Jan 2022 11:58:52 -0500
Message-Id: <20220117165853.1470420-51-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_090123_659876_363A1B05 
X-CRM114-Status: GOOD (  13.91  )
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

[ Upstream commit f10b1fc0161cd99e54c5687fcc63368aa255e05e ]

The Polarfire SoC is currently using two different compatible string
prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
its system controller in order to match the compatible string used in
the soc binding and device tree.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mailbox/mailbox-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 0d6e2231a2c75..4e34854d12389 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -232,7 +232,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mpfs_mbox_of_match[] = {
-	{.compatible = "microchip,polarfire-soc-mailbox", },
+	{.compatible = "microchip,mpfs-mailbox", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
