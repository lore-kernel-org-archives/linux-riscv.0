Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21965C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lhJm3qHMFCmB9VZ4HzH9M8nwA/ruHCG0HyoiCjEm8JU=; b=ujTI8oxigp+rBX
	ExotfHF/emZwtOa/RGbzAPxLk1JbxKeRFaWh6Wbskiia/t8H2AYTvNceJ3OSzDOPsrBLSovkPyda3
	RhZvhhztR3WGgwr7dzEvQu+ZSSNQYCti746H5wyHlV4egpuCxjQB0r+bhWvgQ/Azdw6pstyggJI+J
	8HlMnbGhVxUyGSLurnpLSJUgNg9a3N/H5vqaxpsAkfCUZGmYm7t30qR4eFCPr14XYDr0ddIsbC+lf
	XnluRaQTPB/dWoOaw9GJbqrcfeeIOvWTgdm3KAADSaVLvmObpsmaW7fAiOUZ3MRXg2ylYAIzVUC0s
	yHT/fn5yHW/BP752LjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVR30-00000006qdB-1jff;
	Thu, 01 Feb 2024 06:59:42 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVR2x-00000006qcG-2zM3
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 06:59:40 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-295d22bd625so405168a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 22:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706770778; x=1707375578; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlIN8EUE48rC5uTTPPIhaWbjEtaHOruLs++XqNgVM0c=;
        b=lA+i2i9GkmFTM/Me/SkE7aPp4zd1jA4OyOHt//NKdqT8WooPSzCJ6EYKS120OPTVS6
         O69N482m9sdxX7MtFakhXuPcbJ0z4dg/sP2cdLl55qCWCmVI+QUmsnRQAd4rpgDcPOTp
         e8WW4SF78cfK7kOgePIARr1Am2x95vRJDzXxs1dOHmvPLAwg9UYH3xm1W5p7S0qyy8yR
         e5Lc9ggOfJ4UIa6pgV/dcImVi7sv+yYD8srUpINLPO/Qarzxe7HrsVaYiVV/NSt0P5Om
         pxKD6uMc3PQKrn2h8tAiMkAM60QKJkzdFzA7IF2OHNZne39CTZ0Kt+t20+ifCJcyrlM+
         l6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706770778; x=1707375578;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlIN8EUE48rC5uTTPPIhaWbjEtaHOruLs++XqNgVM0c=;
        b=j9GhYlcrOurgOeWnRKB8c379pkNj4Nw2lrF/qH/Tid/wBWSBxFj9l037Fwr3Umfw67
         jc4jUMv29Vc1cT2NkR8Bl7MLZh7CC3NHAm/pbOBW0v2jYAJZp8XDAeFb8SxZS7t2Aev+
         WZu5bvRq0YK3nUDQS3w4oCtQtvdiKLQp3vhWFRqUKjT7E/P4YehxtSehiYgyAHTRPt5t
         IrLDE2YKHzcbHsIWywanstdsGkEeW5HvtMMpXdQ9j2TczLXz+PV95+hVhunAErhiOeH9
         VfVFOBj4Z88DkON5U3q1uU/7MOuioh6rx2fgcoiH3Y/mUFVRTTPjQP+ypTuVNLq7Gtmh
         KcPA==
X-Gm-Message-State: AOJu0YwIxJJ1WydPkz8bGQuV61MfkrrvrsNmWPXRyaLIi7gbif9Xu2SA
	/6QdTqWN4ezWezj3WnAxlJ820A0rvFR6Ww550oonm3Muo/NxS+0YUBmHZCD/zMo=
X-Google-Smtp-Source: AGHT+IH/o/5JqeOA/x2iMwoniYizhXmfdnxdnTcGm27O4QdQUCPpzI7Y7LqIdMK6wYPdO68ohRayTw==
X-Received: by 2002:a17:90b:19c9:b0:296:1dcf:c296 with SMTP id nm9-20020a17090b19c900b002961dcfc296mr211546pjb.18.1706770778294;
        Wed, 31 Jan 2024 22:59:38 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id pq9-20020a17090b3d8900b0029051dad730sm2787838pjb.26.2024.01.31.22.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 22:59:37 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	gregkh@linuxfoundation.org
Cc: paul.walmsley@sifive.com,
	jirislaby@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH] tty: serial: manage irq with spin_lock_irqsave in SiFive console
Date: Thu,  1 Feb 2024 06:59:32 +0000
Message-Id: <20240201065932.19899-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_225939_801587_5E4E3B07 
X-CRM114-Status: UNSURE (   9.40  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

It is not safe to call spin_lock() with irq disabled on RT-linux.
Instead, transfer the code segment to spin_lock_irqsave to make it work
on both RT and non-RT linux.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 drivers/tty/serial/sifive.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index fa4c9336924f..3f0ddf8bfa7b 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -788,13 +788,12 @@ static void sifive_serial_console_write(struct console *co, const char *s,
 	if (!ssp)
 		return;
 
-	local_irq_save(flags);
 	if (ssp->port.sysrq)
 		locked = 0;
 	else if (oops_in_progress)
-		locked = spin_trylock(&ssp->port.lock);
+		locked = spin_trylock_irqsave(&ssp->port.lock, flags);
 	else
-		spin_lock(&ssp->port.lock);
+		spin_lock_irqsave(&ssp->port.lock, flags);
 
 	ier = __ssp_readl(ssp, SIFIVE_SERIAL_IE_OFFS);
 	__ssp_writel(0, SIFIVE_SERIAL_IE_OFFS, ssp);
@@ -804,8 +803,7 @@ static void sifive_serial_console_write(struct console *co, const char *s,
 	__ssp_writel(ier, SIFIVE_SERIAL_IE_OFFS, ssp);
 
 	if (locked)
-		spin_unlock(&ssp->port.lock);
-	local_irq_restore(flags);
+		spin_unlock_irqrestore(&ssp->port.lock, flags);
 }
 
 static int __init sifive_serial_console_setup(struct console *co, char *options)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
