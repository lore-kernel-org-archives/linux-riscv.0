Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DBEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5HTzvyb2P6RcXduMVFcRmJE1rkUfTjHZOfYVeLYF8A=; b=Ty+HkO/9uqRo9y
	OEGjf74TDw1pgdqhMeEa9NAB8BdVvzNhxFqMLRyHrKkReNZ3e6B2GBfLkuUUeIgibAAdovyWJk6I/
	lTpPnfjhct1BXH2O1qWCy7DWq2oREb4KFsczpb93PSZkqhi5vQJ96SwTJHK+7qIHJqMZva3WCQGGP
	BirFJc7Wf4rjJv5Un4QXDoqQlFDG7qO3mjQPj909t0ylKHsiJWZHVRAkmbLZj0hZaijgiZ/x5p7gD
	/cbBEiO3XZxxWpamYOiE4abgvH1OJEQAzhBIqEavko175vDojo+QWWTF/fhv7iPAwgQetliXkc2qA
	ZH8IXmwQg321vvlb5jSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VZ8-00FmzD-Vm; Mon, 17 Jan 2022 17:13:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VPf-00FhcD-Gv
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 17:03:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F72AB81131;
 Mon, 17 Jan 2022 17:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117ADC36AEC;
 Mon, 17 Jan 2022 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642439000;
 bh=AGVkdtvLj/AXz77WxRuV1yF6BCr8p0lcB/5+6NNM0k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YlNfIeLjVNbGJYH5/FGbsN2lhgXFNEvrhijjIWJNFvkfJy2WncP3DhvdiU3SNwEta
 Vv4550Hg1mbnNPw/WOnwEyKMlOpzJTrDMwJgeWw9DHrW3l+e/h0v2uJW0+Irqgg9YE
 a/gEHF6zfn0FcW96Mn6USyVIZqclaNbHHK7ryPrsrAMkMg9wGW4M7wD1boHyEtCWua
 E3na078FFoaSNQ5m0Ko/egcyCvcSxKkwyeBAgy+PzBWRm15UV2Aq9Bu5Mh2PukSDR+
 wq6Opd3Ja3ZCgXnftE+8TpcXRMVq3eBgycpHc9WqBt0WrB9ET8dnUDYPH7vMRNVO73
 QKY3h+e8Cb6pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Sasha Levin <sashal@kernel.org>,
 lewis.hanly@microchip.com, jassisinghbrar@gmail.com,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 43/44] mailbox: change mailbox-mpfs compatible
 string
Date: Mon, 17 Jan 2022 12:01:26 -0500
Message-Id: <20220117170127.1471115-43-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_090323_747203_4967D939 
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
