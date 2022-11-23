Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2561C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XAtFUMr1V+3eD1xwRPB4LYg5XiwH6tgLq1evmrk9i8=; b=wikr9l/5LhZ5kc
	7tSXjZCFfFY4RrspRJy/iBoDxihAdufiOjx0bnN1/nTwDEBgSWgWk0tCHWovpW2dokbGMcXcALgBO
	YM/oBRxkkhykXjEPLDalX/IWM+5FbwNMF+ofiWPZ7NYyGTiglOyZBqKJ2Q4pEWl+LRV+VPyCBgjcV
	Pkf/HFETIi3aXMmwZcelwzORA/QyJ2Qfnxb0nhcB3/2ZAKIZe/OGI97tl4UjNW2u2fzythdZp186d
	qmfQX7gUlF35H48qJoiwXKX4Z/8NePKggtM2rjbG/nvQvzDmKyzctV4Vrb1IMEGNujylygAuaOHHa
	Y2+HWIJW22f8zrU9AJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtzk-001MEn-NF; Wed, 23 Nov 2022 17:57:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtzf-001MB8-3H
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 17:57:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 938B1B82208;
	Wed, 23 Nov 2022 17:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE2DC433D7;
	Wed, 23 Nov 2022 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669226224;
	bh=wxKRNQqmydSopaq3yHKk8toN/2zOQmC1pkaLy1+Ehkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CSSGDzQiXa2ILS4WGGBSKvACOhV6QvQI9xRgiwSxlGfkV2yyeixoS4SdtPoL7s7bf
	 8TNDr2zLF14QRyI88mOpNJ6huU5kny68Y06DWco4M2iFrnoj6jpTfmdFybwo2nKNWE
	 f2aotYGVayYV7QAkW/uHhH97x+fDPIzVGm9NDGyzV7+66P0TXPJ68+bshMVPVj5sc1
	 fd3SN6HOzG4ir2BQsfuMa2WrVKl7k/r8JBOYCJc4Jd+MPZcBeG3IDcoa6p/0DOJz6b
	 Bcvf8za3qfB52rQWxtOumI6d4ykEtiT5MZMpfM54MBvrE1zTlrPw4N0SmpJmdMrOMd
	 QjbBln1SVarEA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] soc: microchip: mpfs: handle failed system service requests
Date: Wed, 23 Nov 2022 17:56:51 +0000
Message-Id: <20221123175652.327859-2-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123175652.327859-1-conor@kernel.org>
References: <20221123175652.327859-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_095707_331170_9A92A9CE 
X-CRM114-Status: GOOD (  11.11  )
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
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
