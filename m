Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D459C742A7
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Vzzx9Tp74CL/wvcJEU+IHfirHMfQbD6zO9Mi2CSkaE=; b=gCMxL/vG/iSmEQ
	DSbuK02nqq3flUz4i0PYyv8+COwYLH2+Jkj++0ddxpsD/xfFEWyasCIxZwyHTaFBZJFK8FjKX7oFe
	P/hhfZQMAQWe0jELx1XiPJSVX6qGIOjrfpRoDqUH1O49fqSKpEpAbUoDnGLkzp3W0iUXUysbE0bPP
	sShnPsY0hYQJktW+qNuIQPSXvo+0K+tvptM8/DRdhfzq2f74MUlF8RTnD2TmR63koJBS8CbPEV9sR
	IQBlpd0pJLhElLmWVGOsrZkQE805lzmWepY0XEBn8kHUK0kzvRe8eYIgY7zJX96jG8EEos7RPjNat
	eXn0BefZC4skL10iT5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqU-002MQV-5X; Tue, 07 Mar 2023 20:23:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqR-002MOg-GO
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 298ADB81A1D;
	Tue,  7 Mar 2023 20:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9B4C433EF;
	Tue,  7 Mar 2023 20:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220612;
	bh=zr/RXQEP9kEo+EnwwW4EkZXzcH8/Cm+sddrH4zbpuOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2kReW2u9cd8hgfPUoK1mj5efaFk+oe+RpaNULZCMGcXQaXB8pAT2R0JGpv7ybRSh
	 shh8tERapttCn/eBkpt7KrPwQACDKAuXbbb1WwBhbmmQMXQwYgQ7Pl9pdsZKG+oyiJ
	 utdctq3VAWgEuEf0oyuHHsAAxW/oUIR3Tdz0+dYT79CDUKJQkg8S8VYn3OaOmZa8Dm
	 AwZl9dvRI+1X87y5D/vQTvbSoW8qqIOjXmb9wphwdaTPW2DZSHYj7565oLl7UsBYu6
	 Q4TKNJKLoiWHsZUbva1Bk13dhHLVbyhDU755sGz70xQ6LnbOqQoxi5ASnsCMI9WkzQ
	 hQ+gj5XGk5fzg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] soc: microchip: mpfs: fix some horrible alignment
Date: Tue,  7 Mar 2023 20:22:55 +0000
Message-Id: <20230307202257.1762151-6-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=conor.dooley@microchip.com; h=from:subject; bh=MwKJyVjv8Jbuiia0A7TcpOXo3jezcv525pOH2lez0W8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4XYHMSvishN+y87ZUlG/srobd+OFpfOUS+fEKEsP kn97q+jHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI6n6Gf+a6tm1cCZtzF2/Z X/tDcaVIYGaJzdcAj39HonZl8R0ULWH4n2i66/HXZzYnlpW5ikszPrp8SkmV8dHxhVlNOu6HI4v zOAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122335_714937_3515103B 
X-CRM114-Status: GOOD (  11.74  )
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

mpfs_sys_controller_delete() has some horrible alignment that upsets my
OCD... Move the RHS of the assignment to a new line for greater
satifaction.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 6e20207b5756..12039cb38b33 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -66,8 +66,8 @@ static void rx_callback(struct mbox_client *client, void *msg)
 
 static void mpfs_sys_controller_delete(struct kref *kref)
 {
-	struct mpfs_sys_controller *sys_controller = container_of(kref, struct mpfs_sys_controller,
-					       consumers);
+	struct mpfs_sys_controller *sys_controller =
+		container_of(kref, struct mpfs_sys_controller, consumers);
 
 	mbox_free_channel(sys_controller->chan);
 	kfree(sys_controller);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
