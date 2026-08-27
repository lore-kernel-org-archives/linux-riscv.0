Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A3EC61DBE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 01:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FoU565uqWHk0zjsvkQjVc22unT/BK2paxLIaHAaUIBM=; b=OxbtXmmdCkmKh3
	yp6+UKxzcw29crzqshTuAwa3eegmkFJaqvJwL1aq7aIcEMimSojDVgsgw8ml+IyYty0TPntFao6dl
	2PQqEPRkH4XdNdpMpJpK3nIAACKKtRARLrm6SZVFiCcq7OJsTE4akveT7hzclpPdoo6lsic0Icq/f
	K8GrIzHxRdB2anVAXK43jVJG4YTgg1k3SbvbbNsO6sgKvaKdjftYLCBAWbkRM+qlOgcYy8X1aEGis
	Z/i+Z7pvi7sfI3Vc3b2GzlpxyfsPjlYzBGnwZ6stxMgxlqNcSW/I/BHR2PbTa2qjoLqrxWmWi8DK9
	wp0OvVlb97Fu9hCuxzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzPC4-00000003HcB-1zKn;
	Thu, 27 Aug 2026 01:46:16 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzPC1-00000003Hbg-2i0F
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 01:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1Q
	c/idtSr7BuSqFdXfOifykOQFjgd44HOZpCOEjG5kk=; b=Xl2pn9G0BL0ToiX8XP
	1wESuo+tWDjGcyLVJfO7qXIAFf3gbn66xLNK+uwJY8V9LIAVACpf8E9+CRxVzmOO
	Gtd4hSG3raH0EdnoyUnGjWM/Aq3HoGkQzAZL/NpmtMj17IrnRVGg08EPG7MWMV5h
	6Wc/y9H7Bi2KvD55wsJ0qASs0=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBHHpa3lo9qyKQXDw--.51271S2;
	Thu, 27 Aug 2026 09:45:27 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] serial: sifive: fix off-by-one in console port bounds check
Date: Thu, 27 Aug 2026 09:45:24 +0800
Message-Id: <20260827014524.19375-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wBHHpa3lo9qyKQXDw--.51271S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Gw17GFy7uFy8GrW8CFy3Jwb_yoW8JryfpF
	WqkFs0vr18Ga47Z34j9a15ZFWY9an3tFZ2gFW7X34fZws5tr9Y9r1Sya1qka1xAr4kCrWU
	Xr1DArZxCFnrA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYeHDUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8xdR-GqPlrfoNwAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_184614_238393_539F67CC 
X-CRM114-Status: GOOD (  11.30  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

sifive_serial_console_ports[] is sized SIFIVE_SERIAL_MAX_PORTS (8), so
valid indices are 0..7. The bounds check in sifive_serial_probe() uses
"id > SIFIVE_SERIAL_MAX_PORTS", which lets id == 8 pass and causes an
out-of-bounds write in __ssp_add_console_port() through
sifive_serial_console_ports[ssp->port.line].

Fix the check to use >= instead, matching the check already used in
sifive_serial_console_setup().

Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 drivers/tty/serial/sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 110d676..5d76f04 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -999,7 +999,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_SERIAL_SIFIVE_CONSOLE
-	if (id > SIFIVE_SERIAL_MAX_PORTS) {
+	if (id >= SIFIVE_SERIAL_MAX_PORTS) {
 		dev_err(&pdev->dev, "too many UARTs (%d)\n", id);
 		return -EINVAL;
 	}
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
