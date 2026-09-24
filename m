Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EAEC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uNmmpdOvH85WQa4/Utq4EzW1+ZA9j1g9PExv/MA2ejc=; b=f6asMpq08w5y9K
	G/7qqSoe3PTuyxNopM7Fuia5E7XbIBwH5yfMbUIgmuTGlfkI5dbyb3O7pHs1oPorqITUqWjtrdPkB
	yTFoakmuUn2WL4J8z8hZfOqubLJzwt5BsPgGWCJRpoBr5OOsozvsexLOcrR6z/HEb7Mf/Ai//+bA6
	DjJszVIG5EPFjhsLzv2HfAiRDjmDY/UrWP6hNgjHurgPQo6kr09PvsikrOWHYsH1ZBLDBxdaqCd7F
	C9p4/I2hlaV/NipMW4PtcNlIO8eC3+mzAAzHEGZJMpWnfPWqjldd4QBHjCU/zGMTx3FleKuOFg5y1
	PjEfY26UhFWk156y1mFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hCI-0000000Anrf-36Mw;
	Thu, 24 Sep 2026 11:01:02 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hCG-0000000Anqs-3ItS
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 11:01:01 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db18fe433fso9265595ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247659; x=1790852459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mi16B44Uqe6HxoSqb3EL6zUoH29MNyPdPj0rfXYWp/M=;
        b=AQb+FdGqPWjOkW2O+t4YPMlT/FZFrkWMeFvZVzLTfqfxNL/Y9ebaCL0FUhRBEElpSX
         oEkD9F8z5n8T2T3tFvFjygitxK1BooeG3nvf2RljR25QZlTz3p6ygcRRQRSrFggU374p
         gHmZ1hb1h8P3NoqwkOBCkhdCaycBh9kqvW8MEYMVn3SVcA2KemDZvmf+6ioGpjgrfIUZ
         Jp4BWoedHC2YgnjD51EXED+EAyUeqfQ7dDvqzP3pmvnZyFUYQGAe92XgLJJfKRXlOaoM
         y78xovmgIiLE7psxiKUW2XM5wGg8EFZ7hok9xRgl6cb5GIJp5O4rLA6lO5IcfoDkVIIr
         SHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247659; x=1790852459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mi16B44Uqe6HxoSqb3EL6zUoH29MNyPdPj0rfXYWp/M=;
        b=btDjpyoJn4yNzrG1iJG5r8FZ1KBOemrW8M5lwJqqSXnumZ13KHwInkE3N2MlAegouJ
         L5hg3kEY2B9oZ4mpn70KgSYIGCRsg2wNmhxOGojEZ3URIojBcnfngdamj30yFlQCQosa
         jIOs9pYSCnDNqRipzWRoRrgylHLt9MGxurk3WYZyJ/frDm/FvquESFmXVym2/qisq0zx
         UVAJiRu336x/jC+n8KoHfdMSG4ZapdRyPGcxBets8eMoOhFOlexyjiuV6SgIHBTbLoA0
         cl1A99OjVQazg/OGFgA9LFZHR2A2Zw/8oVuoJYARoAt4s3q3wTgkSOPNrq9cRfsWZqF+
         10Iw==
X-Gm-Message-State: AFuF++kQw9tKWGeYN/+uacSzNSt+C86oS4+DIXvcc/i8LPVM+K9Nlq5d
	h38Ddi74UL7OG8k5wLV3mq5YV377JhCbFW/OdnjhQJCipMjj3IrTu6xN
X-Gm-Gg: AYBFou3NDBcYqtBHluf8AV1SPcT/3IHNROzmSnHHrmis81TwenZwoWPqUlquvovcKJk
	4ttE/FbTh6gyv8x7pVgEUwnQR3HckKqAdF6IhJXh8DNbkFlklkQTTaCn4oeUCtG6fiZSUpfxGt/
	HyhDvRj2al/dIT6Jtwe//aaq29O+IpQ2Fzq4VdzLGKeqV8b/nbybWaIXC7QfSVb0tXOE54mw06G
	0dsL2X3AoCbzJdv5PmybAwldhZcWQRqppITyWn6CYKWZG5qprSBupHoe/EuB/EDrLCaoX42ae4B
	CLslY7aQWaiM6amUxPdbhiz5iU3zMG/TyX33R98tVUCExJCjJVdcIcy1efrk/XkD8XZW8RfW2+4
	c2R9Y1LfjW05di8CrKRJjVQwcthlTiWvKfdWh7a5fDvh8Bb20r6VhXv8UyGpBxoCg/85f7fA+sX
	4Syl3r+uuGBgYOAd1tOCQaMouDnciPFkqpoRm9TYVwdDK5dHQ8kwUIn2Ntyfs=
X-Received: by 2002:a17:903:b86:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2df7da426d3mr18456005ad.3.1790247659200;
        Thu, 24 Sep 2026 04:00:59 -0700 (PDT)
Received: from lgs.. ([47.82.67.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d96sm24397225ad.2.2026.09.24.04.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:00:58 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ustc.gu@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH] soc: mpfs: use kref cleanup on probe failure
Date: Thu, 24 Sep 2026 19:00:54 +0800
Message-ID: <20260924110054.1553880-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_040100_827554_0CA94602 
X-CRM114-Status: UNSURE (   9.90  )
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

After kref_init(), the device_get_match_data() failure path jumps to
out_free_channel. That path frees the mailbox channel and then falls
through to kfree(), bypassing mpfs_sys_controller_put() for the initial
reference.

Call mpfs_sys_controller_put() on that path and return immediately. The
existing kref release callback then performs the matching cleanup, and
the return prevents a second free through out_free. This is the minimal
change needed to keep the initialized lifetime balanced.

Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource leak on probe error")
---
 drivers/soc/microchip/mpfs-sys-controller.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 0400a01b2338..379e4f649faa 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -174,7 +174,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	return 0;
 
 out_free_channel:
-	mbox_free_channel(sys_controller->chan);
+	mpfs_sys_controller_put(sys_controller);
+	return ret;
 out_free:
 	kfree(sys_controller);
 	return ret;

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
