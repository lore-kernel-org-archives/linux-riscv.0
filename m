Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02621C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 22:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VVHpovufvuPJntdV30T4pfuH1PnZLRrgIqD2l21H1s=; b=FW9wvXbhM9umQb
	TBt43Fo7t7of5VlYfBUXw/qUaEvjqFiEfCT2zjrSGbwhF5N3G7uAMthGII0TrksFoEBYVCAmVGVeY
	zsLffgSSwB1yCy7rWP76lzao5GMqKRk4a98TMoEpfgTdhC03GXVNMQvtYZSY42/HzaMAW8a4T6knP
	6HgUuNvwfAGJxoXgJWyk2wRNqr5SWnqtkSW5Ixbky5Oxx1xFDr4XE7aVkU9K7Gnqm2zJHW21Xf/hR
	vZxjDpGh8Vzlq+9gdKcQbqqut2gUx7pM8QbSQmJ9omBHmbjBXJrFL/NGcRTc5Tdc0k7i/88VxqUh5
	+ZGsmaBIXLkxzJTY9xgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9jX-008kkV-1o; Fri, 18 Nov 2022 22:21:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9jT-008kir-Vr
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 22:21:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A929EB82566;
	Fri, 18 Nov 2022 22:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2F7C433D6;
	Fri, 18 Nov 2022 22:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668810068;
	bh=E9ca8QoCrIeSP5fRU5kfdctSssLXX9ouXkKzqOBNjD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RifEh9b/d10HRwrBCx6g393UiIXtOcsAjsOlWfzmYu2iNwN2VuhW2aQqyWMhp0R1t
	 ceKq7ZUUcKR/IzGWAGqh/VRoeEi1pTgpSDBi5fqY1iMGNZyHcNjqDfbWuHK8u38zOw
	 VwAXmC4x9igXN/1CrbD9uc7A6CnVL9B/2Zly8E48NsfeiY+iNsvktPbaiLjnlhD16f
	 rMSEYdSDvZmjaZW1+hywyW5kTwPLG+fj/SMd1c80lSS63qwCY4gFURKonF0EigCyJU
	 8suUaTx9TrCQj2hxoUlbvbHRhjK1tScv0OalgK6XDQee3G6feAbwkwQyeQsjatNjLh
	 dn+hUA/R1bdQQ==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] soc: microchip: mpfs: handle failed system service requests
Date: Fri, 18 Nov 2022 22:20:43 +0000
Message-Id: <20221118222043.1214776-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118222043.1214776-1-conor@kernel.org>
References: <20221118222043.1214776-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_142112_175423_7C8FC64C 
X-CRM114-Status: GOOD (  11.05  )
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
