Return-Path: <SRS0=QGbE=OP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9423BC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Sep 2021 22:47:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587C561051
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Sep 2021 22:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 587C561051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vslzFYB++dlN0LuPHsT/mGcPCAacDdNLDejNBLpjap4=; b=a9qwgE4iIMfFBP
	ET1UwhvQAu29MaohmYk3PUAFJw4uLUjJ3RaqVkO1Rd9ksFtLNzevFFDHxnY4MKKP4tKq4OwwRw7A5
	69Ppl6mW6wPmYYNgNA8D7jFGp3/NvmRjkLhOGEtqFN1M2s1EQZAd5bl82jNS9ZCpGcfAUxQgjR04c
	bWfLtBmODD14RQ7zdB+mHW6TCCvf8cO1iQILKJUR2+bmqnbgUHJLnCcNJuiwctMSrhDdZ8Lg2vZs2
	WMfjd6RvM7fUkEzmpHW29C1/LQJhiXQ3DPiz+lwVKKYZ7/nfWt32gA3ATccGxJmlAk/pan4FiNLzH
	L0PLD6cs+nQ+pwu+sqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUGSB-00HNGN-9F; Sat, 25 Sep 2021 22:47:31 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUGS9-00HNFQ-17
 for linux-riscv@lists.infradead.org; Sat, 25 Sep 2021 22:47:30 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2729540CE5; 
 Sat, 25 Sep 2021 22:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632610047;
 bh=3kqfyTB51XM71SI4JIl+mR30FIHSwMKG1CloF0Xq/fo=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=RKVV0cw9rvazB0Tiaa1gNr09xoedTFqYNlMvxJ7nIF1QLFEVoiXWZ9Y6J5qrCAplf
 +ZncFb8GK1c4l5gbLdcetLaphZP/715fFxFB1vGWwDE9kokwJUG41BbBHKSgBjPDec
 hRd1XIFvduPFh2n8mU9hibZt+k8XzQBYMOvKHr5BQXmm3BNAl/Pzvcrnpthxebo9ou
 xK20ShW8/JSIoOLT4uFuXpYIrGCBfAX7I1O0ZzfltR4XZBMvD1dFREZWisMTgKsE3A
 m1GSuEzl7p8MrHhDCA1hRY7z+vML1zi6fuS61POj16SJaJ1/zCjR91StooMLlUAlJr
 uxAkr6hWlHrjg==
From: Colin King <colin.king@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: sifive: set pointer to NULL rather than 0.
Date: Sat, 25 Sep 2021 23:47:26 +0100
Message-Id: <20210925224726.183360-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_154729_227604_4DDB4C4E 
X-CRM114-Status: GOOD (  12.56  )
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

From: Colin Ian King <colin.king@canonical.com>

Clean up the assignment of sifive_serial_console_ports[ssp->port.line],
this is a pointer to a struct sifive_serial_port so the assignment
should be a NULL rather than a integer 0.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/serial/sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 0ac0371f943b..b79900d0e91a 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -887,7 +887,7 @@ static void __ssp_add_console_port(struct sifive_serial_port *ssp)
 
 static void __ssp_remove_console_port(struct sifive_serial_port *ssp)
 {
-	sifive_serial_console_ports[ssp->port.line] = 0;
+	sifive_serial_console_ports[ssp->port.line] = NULL;
 }
 
 #define SIFIVE_SERIAL_CONSOLE	(&sifive_serial_console)
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
