Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C342C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 17:11:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D07D920874
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 17:11:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kjrs2Adn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D07D920874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3M+fDnx6HE6t/9HaH0DLBqbs7hkpwdZB95RADYSXcNE=; b=Kjrs2AdnFBuIeQ
	tWXyEPYU8XzfWyjr9567vVGjYmwWIO4HFjQzfRu/h9FHehZDYR2VyGio9+sloCuWTf7cSsDLA0Dqw
	I2BzfqNGXokcjJ+aOecFcd9wfyNnW4nvJjD9uGckInfojrIsvDTbU4xPNMq0mY8RrCmyPkJI6XwkR
	+wT675RLX5elIlWej9n6FmxDau0+4TNJIY5q5h8Q3hUQi0cCalxhmKX0xCZ4I8gPXjE0G6SnJmrXh
	1yzSnWJM58JPIAs1rEp8HUFui6zLQTxghCODB2QE1t9WQAbvi2Gh2u11BDTEJzJx+CGzU5YXxzqu/
	yu7XZxRHZlPfPdD6uqyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghdry-0002xE-DJ; Thu, 10 Jan 2019 17:11:50 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghdrv-0002wa-Au
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 17:11:48 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7433AAFFD;
 Thu, 10 Jan 2019 17:11:45 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <anup@brainfault.org>
Subject: [PATCH] tty/serial: use uart_console_write in the RISC-V SBL early
 console
References: <20181204135507.3706-1-anup@brainfault.org>
 <20181204135507.3706-2-anup@brainfault.org>
 <mvmbm4oehd5.fsf_-_@suse.de>
 <CAAhSdy3-SaP7RBbgx7kZgkkxeN2W-Ue8QDFXkOgFG5GiAg52-g@mail.gmail.com>
 <mvm7efcedop.fsf@suse.de>
 <CAAhSdy0suSgKpdz+NUrXzS9Ozp75hMC6ovW4yLf5s0KYJwwocw@mail.gmail.com>
X-Yow: If I have enough money to buy 5,000 CANS of NOODLE-RONI, can I get a
 VAT of MARSHMALLOW FLUFF free??
Date: Thu, 10 Jan 2019 18:11:39 +0100
In-Reply-To: <CAAhSdy0suSgKpdz+NUrXzS9Ozp75hMC6ovW4yLf5s0KYJwwocw@mail.gmail.com>
 (Anup Patel's message of "Thu, 10 Jan 2019 21:47:07 +0530")
Message-ID: <mvmsgy0cu9g.fsf_-_@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_091147_517025_D4538CB6 
X-CRM114-Status: GOOD (  10.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This enables proper NLCR processing.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 drivers/tty/serial/earlycon-riscv-sbi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
index e1a551aae3..ce81523c31 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -10,13 +10,16 @@
 #include <linux/serial_core.h>
 #include <asm/sbi.h>
 
-static void sbi_console_write(struct console *con,
-			      const char *s, unsigned int n)
+static void sbi_putc(struct uart_port *port, int c)
 {
-	int i;
+	sbi_console_putchar(c);
+}
 
-	for (i = 0; i < n; ++i)
-		sbi_console_putchar(s[i]);
+static void sbi_console_write(struct console *con,
+			      const char *s, unsigned n)
+{
+	struct earlycon_device *dev = con->data;
+	uart_console_write(&dev->port, s, n, sbi_putc);
 }
 
 static int __init early_sbi_setup(struct earlycon_device *device,
-- 
2.20.1

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
