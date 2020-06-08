Return-Path: <SRS0=Hhyj=7V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D90C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2020 23:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA8620775
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2020 23:30:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iVnG4miI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDJ0ANxC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CA8620775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DUz7SV1euiAHI2QAlQHLiH3F80TDiT/OWFpKTsIwtc=; b=iVnG4miIKE63WY
	DGUwwBUi/4SxhSPCeH8dNbtBq+9+Xi2gMvnpj3hyXquOnQ9qv1nn7o7alcV0Zm6Sv+UK/nolTfyE3
	sPlN7SEX4WdEUqvGuZo6nEs5sQfOkfp2ZX31T33piP0gBaZ6YI8FPIZuQlu/ZRUdtqB3Xrs21m2vD
	oYXOkfDooExkSJ8H0VhK9zcM/0PCOUGhVSBGk7SJ1Am/fQ4sUvICjETrWhd2v1J1JNcRBPBGLB0r0
	WL5O/RRa8bKgnPmxFr7xBllbfaZVLgquMHqFUPUbTK3MOmLoWmLhquO5A+PZlLRhaMJuq8O5Mhfrw
	HY8eLDTrvgtMRYFNyQbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiRDi-0004g3-HK; Mon, 08 Jun 2020 23:30:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQzd-0002m7-BB
 for linux-riscv@lists.infradead.org; Mon, 08 Jun 2020 23:15:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D55612068D;
 Mon,  8 Jun 2020 23:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658148;
 bh=UC/hJa4X7QpfVijofanUa1kALbeXhRnw1dF4T3sBwyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDJ0ANxCBfx9sk1d3mSPj/eAFgpg/jj7QF+h0IaeL2aK3t3DYF9JTEy15q5w9tLks
 RPfVebBfMXwPzWCGH8O1zvbc3yfM0IXwEEIcenzGs2Ka9slI+xHBatVvg6Q1bH9l3m
 OQhAtwEvj4dQxZLsVYPL7zYh4xhV0QqG9sgXV7xc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 181/606] tty: serial: add missing spin_lock_init
 for SiFive serial console
Date: Mon,  8 Jun 2020 19:05:06 -0400
Message-Id: <20200608231211.3363633-181-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161549_453600_E3D6E617 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra <Atish.Patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

commit 17b4efdf4e4867079012a48ca10d965fe9d68822 upstream.

An uninitialised spin lock for sifive serial console raises a bad
magic spin_lock error as reported and discussed here [1].
Initialising the spin lock resolves the issue.

The fix is tested on HiFive Unleashed A00 board with Linux 5.7-rc4
and OpenSBI v0.7

[1] https://lore.kernel.org/linux-riscv/b9fe49483a903f404e7acc15a6efbef756db28ae.camel@wdc.com

Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
Reported-by: Atish Patra <Atish.Patra@wdc.com>
Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: stable <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/1589019852-21505-2-git-send-email-sagar.kadam@sifive.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index d5f81b98e4d7..38133eba83a8 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -840,6 +840,7 @@ console_initcall(sifive_console_init);
 
 static void __ssp_add_console_port(struct sifive_serial_port *ssp)
 {
+	spin_lock_init(&ssp->port.lock);
 	sifive_serial_console_ports[ssp->port.line] = ssp;
 }
 
-- 
2.25.1


