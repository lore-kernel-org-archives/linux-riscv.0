Return-Path: <SRS0=30mE=U7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93259C06510
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2019 18:41:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F7872184B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2019 18:41:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhzYsKRT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DtHMYn33"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F7872184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Km2i3bIqbiDowXvjb5NiUXepcMRpqSKzWs7AaZeUAFs=; b=nhzYsKRT4qjqDxKQK9glA3helW
	owVwRuuS4UqwS3q3hb8MQuGncYCAkyykuYiUi7v+Zj0PzIgxVwuKVfztFizWmHPDUQFMkWoqq1Ldf
	3Mmwg5zpmR8sxPwHj/xRMdnoMoSOAEsrqj9azwtl87K0LTGD3egRleLGjeBj783dOzYz68GQ/QaSS
	41wm3jwAbWFLgpHijg8v4nQUONT5P4N93wX2vWWVkJf0ON18BD6/SZprMrFj3+Tht11n+EPaMLnkj
	2CQP7KgcY73RxHEFnn4WnTOiU5US9TeVG3JrX2wlmWkdGVQcb0zqs51cqE6q3YG1u4uXsn2MhT3mE
	uHYF9M4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiNi7-0004Zn-Qj; Tue, 02 Jul 2019 18:41:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiNhS-0003nP-FJ
 for linux-riscv@lists.infradead.org; Tue, 02 Jul 2019 18:40:19 +0000
Received: by mail-pf1-x444.google.com with SMTP id d126so8694322pfd.2
 for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2019 11:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0sF1tajbszgBkWrij+qh2Snun7Hdtkh6IqSmd5cLEoI=;
 b=DtHMYn33VMItS9Mqb2A54QLPgAHX3jNXlN2eS6J91/O6uY1z5UrJtJLI0XK57V19bz
 ndWySJwRfhNNtwkOkV5slrphsfMsZDy9Ei8txwVJgxuU60vPZIrno2FdLdyFXDLNcE6E
 5N6i/WXXz/+a37iqGWmZFlMhdyuWuV43td52R4cIU2sNVxvvg35pGctcBOI6Vpu4nZRb
 c9QBstZskl4Uu34b8ec+cRPQod7wIw9rN5xvDbD6o13VJ1ssJBLUUelzdmj9qc0wOOK3
 f7SpWpXVUGyQuWX/0bw/cpN/xiuYaC0qTsm/sPgKvO0jueJtIhCE9W/pr28seC2qlEId
 kfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0sF1tajbszgBkWrij+qh2Snun7Hdtkh6IqSmd5cLEoI=;
 b=XvMrLr/0gjP8l1Dh5FDogpyVTGJ4sYYH6diT5hCMFFs4Lm063B0H9C7kYvktfQkUxJ
 WbOKL3nT+CjeTgE7ggcrp/bRtgZ48tZq14Xh8xHteaJU6YufEZD3NMMoFH1gbow2wFHW
 Mes3RsN7G+HqpXHr1IY1Lqp8gUx/GH634CHr4cQvey/iAMsuikWI+SosWF8tk5cyNlKe
 iyVvqQqM3NjUvBfmApa0LyJEjaBp2PkiMOxO9eIAdUA6CxVee40hVa/taNwMGLgz22fp
 +ni4JHc5+eCf6ZFMxWLVKY+F0OmDbwaZIEpvkPeZLZWPxO0NbKFDSUPR/hH1wQu45POE
 7aHQ==
X-Gm-Message-State: APjAAAUzxG+ML/sS2UFw5d8JXw2xxtaibUNTbeymHrom+UyKXZrenA+F
 5f3znZCWzF/9u7AFZVBGMHzzyA==
X-Google-Smtp-Source: APXvYqzBLTVQUac6Xd9mE/tyVVz8vJIhTDTtyInPwU1KgqLrBTp0CAZs3Cu/UvLMDc9hMl7J+7xLzQ==
X-Received: by 2002:a63:610e:: with SMTP id v14mr32174956pgb.221.1562092818008; 
 Tue, 02 Jul 2019 11:40:18 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 e10sm15065327pfi.173.2019.07.02.11.40.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 02 Jul 2019 11:40:17 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v7 2/4] mtd: spi-nor: fix nor->addr_width for is25wp256
Date: Wed,  3 Jul 2019 00:09:03 +0530
Message-Id: <1562092745-11541-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
References: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_114018_595779_BD4495E3 
X-CRM114-Status: GOOD (  11.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Use the post bfpt fixup hook for the is25wp256 device as done for
is25lp256 device to overwrite the address width advertised by BFPT.

For instance the standard devices eg: IS25WP256D-JMLE where J stands
for "standard" does not support SFDP.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 971f0f3..315eeec 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1860,7 +1860,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_4B_OPCODES)
-	},
+			.fixups = &is25lp256_fixups },
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
