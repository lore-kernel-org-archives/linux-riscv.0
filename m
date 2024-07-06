Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02296C38150
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0SfM7reTUKh+SJkOFyUFVXWdQLhGz8Ebv/6KaXLg2LQ=; b=bSqXqgcnhjM6ou
	kCrq4iHUpan+tGDy81Y+3lXgUIRztreuBlfno9Piu/Dez0sRVLg6f0RvWslhhFtFFw/ZqgzYxqLvm
	E04RQga6eXv49lTd1J0T79n7fTORRCwUwQITzuEgNo7ook+KWljvhE9wVoQ9xy8vK5m/vZv7NlGkT
	YVptDzeU+HqYeDSE6QM53uALgOWhrwneg01xDQtkrxeu09sKURuSwC6lByx4UpRRcrKwXn49B9ZHf
	9cOs+Qi+LGLBR/QdSthBrjTXy8h4oWChkC+zRmeQMRpqk9miyQ8jPn/LF4Een5ldF9DBqC3CojB19
	aWxgclqCWiZlNWCVtiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ11D-0000000HZ9t-1Uba;
	Sat, 06 Jul 2024 08:43:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ11A-0000000HZ9X-3rlH
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 08:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45E7B61445;
	Sat,  6 Jul 2024 08:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED0FC2BD10;
	Sat,  6 Jul 2024 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720255420;
	bh=luJ5DLdUyXD8SFaZVQleUHpTlDnNDHd76QU1blhacnE=;
	h=From:To:Cc:Subject:Date:From;
	b=VomqK22i/Sp7tfddlIJ2CbgHTeJmj48WXxMdDLFyt8p7GebDHaWMb/ACS/ia5eJ2o
	 kOHqLJ/9JO5owU/jzTUaf5cmF532+Axm255G8FqE66ZMF0VNoMrbZtgOrsoH0pRADK
	 FBUvSI7/zD3AGEFRH2f+6KRgiWhQfDTiuRASp+PNDyjU4IHTi3avL54vAB7uRPE2pK
	 AXJbP0CH+gg2W9ulWYA/zAMnWIahripkd+azVouj6hOyhDvVOz1O5QBmxc37Tphe6R
	 QU+alL0oD45iwk4Lb8VLjPkQWpvJ4w6cJHYZLIZlwtz+naUyp3e5bR/JejAMcXdOpt
	 MFrBS/ZqVg5Gw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] serial: 8250: don't lost port's default capabilities
Date: Sat,  6 Jul 2024 16:29:28 +0800
Message-ID: <20240706082928.2238-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_014341_029498_FF9B7564 
X-CRM114-Status: UNSURE (   9.48  )
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

Commit b0b8c84cf58d ("serial: of_serial: Handle auto-flow-control
property") added support for fifo-size and hw-flow-control properties
to avoid adding new types to 8250.c for UARTs that are compatible with
the standard types but that have different size fifo or support 16750
compatible auto flow control. We avoided many new 8250 port types with
this nice feature, but there's a problem, if the code detects fifo-size
or auto-flow-control property, up->capabilities will be set
accordingly, then serial8250_set_defaults() will ignore the default
port's capabilities:

|if (!up->capabilities)
|	up->capabilities = uart_config[type].flags;

If the port's default capabilities contains other bits such as
UART_CAP_SLEEP, UART_CAP_EFR and so on, they are lost.

Fixes: b0b8c84cf58d ("serial: of_serial: Handle auto-flow-control property")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/tty/serial/8250/8250_port.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 893bc493f662..e20614241229 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3245,8 +3245,7 @@ void serial8250_set_defaults(struct uart_8250_port *up)
 			up->port.fifosize = uart_config[type].fifo_size;
 		if (!up->tx_loadsz)
 			up->tx_loadsz = uart_config[type].tx_loadsz;
-		if (!up->capabilities)
-			up->capabilities = uart_config[type].flags;
+		up->capabilities |= uart_config[type].flags;
 	}
 
 	set_io_from_upio(port);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
