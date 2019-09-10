Return-Path: <SRS0=VX3L=XF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C450C3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2019 05:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6CD2171F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2019 05:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fzVto5iz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6CD2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ywK7uGn6/aOHqkVYeae4XQ+uY7L5n1yj4k++5eO+JEY=; b=fzVto5izcz5vmT
	eAfhCI0tol5WhRzkQrUUsobnIipCJzpM2EudRbbgDhYCbEs93N0eh6ffr1Wj0jxwJUy9JTJid4FkS
	j8iwF1COsnytKYlEoqORDRyPgT2m6MA419/nLMvbjtrz7CL7lgGJVbX3tkjmTM7sy9yAvwjhKMBlF
	4m8RFq4wmTtor/OfBuBLqNQZNwpfdMb14qpEF7jLRMTHKKmbHRUCF4deEuqoEeSNkfCmYcCKI84oD
	/wLBDLmRDhazuOpHrUATAMxkSEmY0r6aSOxRruCOGaU+Y/WMUgmRHVoO4qBumQMx3h+i9QQN4unpd
	gnfh4nZRAind4RvRwP+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7ZBX-0001W9-LN; Tue, 10 Sep 2019 05:59:27 +0000
Received: from [2001:4bb8:180:57ff:412:4333:4bf9:9db2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i7ZBV-0001Vn-4L; Tue, 10 Sep 2019 05:59:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: gregkh@linuxfoundation.org,
	jslaby@suse.com
Subject: [PATCH] serial/sifive: select SERIAL_EARLYCON
Date: Tue, 10 Sep 2019 07:59:23 +0200
Message-Id: <20190910055923.28384-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The sifive serial driver implements earlycon support, but unless
another driver is built in that supports earlycon support it won't
be usable.  Explicitly select SERIAL_EARLYCON instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/tty/serial/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 530cb966092f..6b77a72278e3 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1075,6 +1075,7 @@ config SERIAL_SIFIVE_CONSOLE
 	bool "Console on SiFive UART"
 	depends on SERIAL_SIFIVE=y
 	select SERIAL_CORE_CONSOLE
+	select SERIAL_EARLYCON
 	help
 	  Select this option if you would like to use a SiFive UART as the
 	  system console.
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
