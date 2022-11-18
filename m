Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A34C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 22:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VVHpovufvuPJntdV30T4pfuH1PnZLRrgIqD2l21H1s=; b=3iqUnvHnPF1xTb
	poMBmsMiscB3dPR1slq0nC2k93Nfh5HrBl4CMy3mc51XoWVOGPPOvWTm4IgH2GirjPPKXHrIycWqC
	EOOzc+3NxetOcllcSiErf4XM9NFBmPNMdb6KtVHggMHnb5wFfpXz6awe9h1jdjNcGpzoi2SorEkPm
	axxHl+mnHt6yLVVEtvVJaH7i4iDI3kHGzrwdnD62gLzQfGoOH20joKL25YnBZVLMS1W8BDOOMsj9K
	OybJgM7wZGzVWbSD21U7yJi3EAavN9sRhMgQ5aWi2r5B287zai7st8SeaZq4/h3ay0n0E3R4D6SQw
	invTFMgBZtj2JMwqTAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9XC-008irH-9Q; Fri, 18 Nov 2022 22:08:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9X7-008ipY-Om
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 22:08:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 237716279B;
	Fri, 18 Nov 2022 22:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61230C433D7;
	Fri, 18 Nov 2022 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668809304;
	bh=E9ca8QoCrIeSP5fRU5kfdctSssLXX9ouXkKzqOBNjD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kmJDD/fw94wmDBhtRUGESqVnEtg2VtA92zVS22hNG2x5zrRKg12JdbzWzxmWB5Ett
	 Yv/n+XyUdoOf1P1varf4f0awdReaA9XGTywBt8H1XPKafY+yrCu7QlWDr8NL4Q912F
	 oDQBNacyKoxCYtK5bzrAFHg500CIlru4fLj/y8X8t7ppzKE2ny43FbGr4GUDZoA7CO
	 +ibAqueuLJpX4V+r3GXdMOBw3apua5h1MYE4GZgOrPBYln8YMC5tTFliyLYxn2hgRA
	 DPbHf0Yz70GNl6y77jTngZbXfmJf6PyZOnn4Ees4M+I9GzQtbFjKwAv/4byQ1wjZLT
	 BZKDfYCttyuAA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: microchip: mpfs: handle failed system service requests
Date: Fri, 18 Nov 2022 22:07:58 +0000
Message-Id: <20221118220758.1101409-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118220758.1101409-1-conor@kernel.org>
References: <20221118220758.1101409-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_140825_864624_B5F879A8 
X-CRM114-Status: GOOD (  10.84  )
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

If a service request fails, a non-zero, per-service error code will be
set. Since the individual service drivers may wish to handle things
differently, there's little point trying to do anything intelligent in
the system controller driver. Let the caller know that things went wrong
& leave the details of handling the error to it.

Fixes: d0054a470c33 ("soc: add microchip polarfire soc system controller")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 6e20207b5756..539fc24b397d 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -52,6 +52,12 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 
 	mutex_unlock(&transaction_lock);
 
+	if (ret)
+		return ret;
+
+	if (msg->response->resp_status)
+		ret = -EIO;
+
 	return ret;
 }
 EXPORT_SYMBOL(mpfs_blocking_transaction);
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
