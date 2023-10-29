Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE7DC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L4CebHBrp2HCkUdYqpcW7KiKTw8Uu/qBiLfOAoyS19U=; b=uH/bWacLwxdoUU
	gSGqWfHjgPs+ID6twe6z9OxXONYYlKgJBB+I+5zsOcglGhHZRJzzS0hZiEKccPbEG1aGwVjsM2tZA
	sFQhh0HpFAVnOlX6a179wdEZc1xrJ+UHnuplq+gu8UMxvkYmv2YuevJD/MbHoaWRxgooQR6n20QBy
	GfuaQ0shSpciAtShbcRsOmUkpSAXKfgxkb5ds2WOykFum8pwzw7l9FVlP79+tqM8hyrgaPwOUcIzi
	2o1Pg6yBX9kNjPBdfJZRNgWTCL7+yOp/yRxo0mtURZGZybSttzJamCdsmn517HYE/48tz1+TNM8rd
	Jt6V+txrW/7YPHd+obhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx06U-001Ihc-2f;
	Sun, 29 Oct 2023 07:20:58 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx06R-001Ig3-03
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 07:20:57 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id x06DqqqBCvx99x06Dqyxs3; Sun, 29 Oct 2023 08:20:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698564046;
	bh=MDsDuhCr9olbw0nTq2ub5nqlO4/+Skgqu55qCR4cVX0=;
	h=From:To:Cc:Subject:Date;
	b=t3VEn56IA1ozmNuyAqXus1ROpaXMxRPzyaxwLbtPDKkv1rCqfILUjVpGwY5GimzS+
	 semo9phsAuSxLBztVY1VPDi+iRtmwM+VSBCqXn3Z0O4eyA8k//AMqKexA5uvtMGszG
	 VtVjtZTvQrjcb9W6KDxwn4aZ+xdjXwlIjPJijmhXYwr+PoFcLLohHJonM6JG6OVFmd
	 jCU009uZPxDSWkgnGLA8QJAlhbEw6ELCo/bgLkAgorOtMOFT5csSclgdPGFQTmUwEq
	 audeq/OkxTsFvQkCLer/LqyznHYzAWWfMVPJUWCa8MEen4vNoGXKJ79nZIBNKQXvqz
	 3DltTAecjWGeA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Oct 2023 08:20:46 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Fix an off-by-one in get_early_cmdline()
Date: Sun, 29 Oct 2023 08:20:40 +0100
Message-Id: <9f66d2b58c8052d4055e90b8477ee55d9a0914f9.1698564026.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_002055_483343_8A850D7B 
X-CRM114-Status: UNSURE (   8.35  )
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

The ending NULL is not taken into account by strncat(), so switch to
strlcat() to correctly compute the size of the available memory when
appending CONFIG_CMDLINE to 'early_cmdline'.

Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/riscv/kernel/pi/cmdline_early.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
index 68e786c84c94..f6d4dedffb84 100644
--- a/arch/riscv/kernel/pi/cmdline_early.c
+++ b/arch/riscv/kernel/pi/cmdline_early.c
@@ -38,8 +38,7 @@ static char *get_early_cmdline(uintptr_t dtb_pa)
 	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
 	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
 	    fdt_cmdline_size == 0 /* CONFIG_CMDLINE_FALLBACK */) {
-		strncat(early_cmdline, CONFIG_CMDLINE,
-			COMMAND_LINE_SIZE - fdt_cmdline_size);
+		strlcat(early_cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 	}
 
 	return early_cmdline;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
