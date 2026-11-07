Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5340606A32C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 00:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vMJTeZRF;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/m5lrQzFUiV/4mKjrXb6tqCN7ajT+fwfFzCT3rhNqn8=; b=vMJTeZRFqGzf9K5YWKBBkKic87
	4Uta22wrTKUmqvOYpFMtH/sZYEVWcMvuFvjBfCHhG5uU2kPB8R2C702SWnq4pV2v+o9oLTB9cBWHS
	DToYb0vbUPyfiaX0opUfH9363w3MvTSILEMQNVo+et1W+HG09n3pZrFvS9Q4QPg/c/aqqjYSNFUda
	dnE8bmsbmqWQUfgchXP4q1cpV92J8NgncsPf74/crRbSSmtUBlysJuQH3HcdV9OMuszJX0YNCY5qf
	orYX+106Mz/UeMVqIODqWsxuMvmKPSSnRceFIy//w8K7Fo+4LiQgRz6KwhoXTTk12srzSXR3ir/2J
	ioWBX3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxV-0000000DtZJ-3pek;
	Sat, 07 Nov 2026 00:07:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxK-0000000DtSN-06fE
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 00:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=Jb8hBDAm0JHwIBcBnEGlrMskZWWKmo3T1uWoWwLPtamxQnUjgLaqjJ0ghTUuxc7gsa8MMH
	iVkA80ZQJ9NbPAtUI2BxGHXs4CetkfrCBKt4AxYhEbjJwG0mOrRw0Ok4s0Xx8GB5s4nT//
	rGZy12dhZ6eWXSZD7sQiaYIdUBWinDQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-w4ptVu2aOMKxXDdn6xUPjQ-1; Fri, 06 Nov 2026 19:06:47 -0500
X-MC-Unique: w4ptVu2aOMKxXDdn6xUPjQ-1
X-Mimecast-MFC-AGG-ID: w4ptVu2aOMKxXDdn6xUPjQ_1794010007
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53661e036a2so23583491cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 16:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010007; x=1794614807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=lsLafaA2PJMuTT/zizQiKZFxouFrX/e1vj2wVDdYqf+hEC6Iv7TidEmIuGH9V9+KED
         uPbjTxsatpYJlqfwofnPZPqyloWmb05k/+2lWN5BGE2mZf6zE0Rpxvkgyxf5d4/7KLPx
         nGU9BBbFJI5LRN/ir49HsxS5oZpXyr5U/v2Udk4XsaD3vEZpgWhbx7+DtHhy/Eu/n/lP
         Aq9zIegvwdVrW6hyfAg5Ccv5IAralSFVaH3d7GCUKPoZVSZ6B4FBIFGi6LDegnMYhrH/
         +zBzZyTkXArbEJA60pDdGcSkT9I20QjLE6Jo7uNe8xvTtZnZCX/NeCoRBbrJvpzD6BOX
         9fYA==
X-Forwarded-Encrypted: i=1; AKwUvBwUdQnTeUWi+KlFZDdU0U0sbJJHpNzaCeOa+sAc0bA7K0mZbKHU3LctZq0jvL/F+DgChpnwOnWTCku00Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/zj4m9b+qz0IEC7hu01Rg+oTZ2K/WNNN2seybEjwErH9cLMaJG
	vC6qP4darmeVLRcz16JZ136MlR1xmtyuyqrQteU4ND2qG2QNsQ7wlzOMPUQiwLugaYpU0M08U33
	LS7CFr7iTOqV6KYO7ad5Rcx2zv+1EAzTpmmKVIwHGoNcu04s6MJjWXnihuh8UXIxSo5Lh6w==
X-Gm-Gg: AYBFou0HKxQnBcxpyBgQaezox6zxjFO5husacFnl0C+8H3YkPihQaCKwGb5pO93HYY9
	YW2+43RDZXFuFTO7QpHtszCFnPxZdIdXyOrse10+5slC5howINq71Vohbpf4O4z9Bik+exluqlP
	1w3roy/HDOpwfkeuqrFl27Q/atYLakhPTc5Nh4UAq1JQiBMZ7xXnoVisuSoM+XmkCEJkn2JozKn
	qXnKWNre/IaGLwuYlnEQMcjS1dAUGq9zHFiNj8zlLCwvlCIqOLUgYbWHKrvsfkDOInHsZDhAcqu
	aPxkOlAnNRtnRzcki2I9dmc7t+ksuSUCXEwzPUjOwbZB0tf1hRNtMtWXMVoLBYadeQPJKc08C2E
	OGXzFTTjaf1+7DDo+s4yuBLNwncXxRkxxiJDQkmv+Kmmgc1UE9yya/Jbhy0cIJ0S7RttAFXe6iM
	W0Lv+bu8QkmDzmLv0v
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751641cf.12.1794010007241;
        Fri, 06 Nov 2026 16:06:47 -0800 (PST)
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751141cf.12.1794010006668;
        Fri, 06 Nov 2026 16:06:46 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:10 -0500
Subject: [PATCH 3/3] dmaengine: fsldma: convert to subsys_platform_driver()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-dmaengine-subsys-v1-3-780eeddbf3ef@redhat.com>
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=hy3g6mWddGYLX6Myo7kSoYtQp+hY5Hbo/vUsysOb4zQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbeeNxabtVqgmXFuKMOEE2yy/Scinn4R5Zj7TWhOt
 atoruLqjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbiOouR4cR1jkNqh68wrEm/
 stlDUKbx8PxggVfG0h+OhJx8eL8//yQjw16uPZumb/y3PVJc7N7WsJVuGVcamc2sSnpsTuX05Pi
 UMQAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8bk5OtmeMlLnuQqWECjioOGAltSlfN8OJpUFXoGmAa4_1794010007
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_160650_335619_C593FF02 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver previously displayed a log message during init
time, and this change drops that message.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/fsldma.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 99a878ed1444..fd3dca7616a8 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1431,19 +1431,7 @@ static struct platform_driver fsldma_of_driver = {
 /* Module Init / Exit                                                         */
 /*----------------------------------------------------------------------------*/
 
-static __init int fsldma_init(void)
-{
-	pr_info("Freescale Elo series DMA driver\n");
-	return platform_driver_register(&fsldma_of_driver);
-}
-
-static void __exit fsldma_exit(void)
-{
-	platform_driver_unregister(&fsldma_of_driver);
-}
-
-subsys_initcall(fsldma_init);
-module_exit(fsldma_exit);
+subsys_platform_driver(fsldma_of_driver);
 
 MODULE_DESCRIPTION("Freescale Elo series DMA driver");
 MODULE_LICENSE("GPL");

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
