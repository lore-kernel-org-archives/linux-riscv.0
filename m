Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADEE606A32E
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 00:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oEAbFkcd;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2ugghJJp023puIpDOxbPym+064kX4DUVGYCseIwnY1k=; b=oEAbFkcdKVV46QbA1E1z98HylB
	XIt85j/Mihv7RWfoPFyO2r773gQO/Cr3Ame3U3Y5lOSP8zf5l/cRHYxA4PgWhK06PcdIOVvfoiKAB
	pa0zrcY0akKLvDh48m3T0fXYM6qKjhVw5Z62Tqq3T8XSOmYfEKTUp2fkGOimFGThnWwDMjkj4JG/E
	a3lzqbD4Z0A6rlPfsjQcFsUQV9qFemhBprsTVIw86HJ+6y2c8RcLX8ZUgvScDKp9rXlkWczglJS1M
	1GB2vA7Ua859qtwhD+aQrwozhFRng04B6FCK6Apb+aUTQsU8AJN16GYwWwmSyK9oTLByABSj/Yxx7
	Q+d4EJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxO-0000000DtVD-32ec;
	Sat, 07 Nov 2026 00:06:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxF-0000000DtQ2-0lss
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 00:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=eRwlbATGuePqRoUfDSZ9qs0RrDdYZ+KAJ7W8YOSwyruxWr6QSwtuhfpmSEKbs0RkuvS3tq
	nDRF7ibxDb2QRowCIcx4fyeXiTxtwfid4l4jQyVnUyDmgMfNi5M3QTGt59FIsuMAveEHIT
	gklSeZm9ZhWhFE3Jsw4LD7nznNwoFKE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-wp1JMBEYOXK9zlhUZD4HOA-1; Fri, 06 Nov 2026 19:06:43 -0500
X-MC-Unique: wp1JMBEYOXK9zlhUZD4HOA-1
X-Mimecast-MFC-AGG-ID: wp1JMBEYOXK9zlhUZD4HOA_1794010002
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ebc622dc8so7627946d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 16:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010002; x=1794614802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=n7u9SFaA9CunosfNhAxzbCwJD0bncFmIZ3JGsdXzgHp90dHu8vI+AXjcSv0RV5mJ6J
         Pc75ysw7jfa+qfUArtu5pJmjlWekgmBeASV8gR+pDPjaZ4x7zjq06iIvYweyDl3GR5pL
         PFwCnzkyh+GDqu64fIcpXEeA/M98EM40YE/Mhank6BXGD3GR27QzfwrjcZ8Q9TiJp0cp
         WN6YqBx7TVQ7wdkmpcvnmeaD16D/f7Ge7qs9tYS+Pm0Gifiw0+3Q88cYAgpj3PSVj7ko
         BGMXTAXo2yRgY9BeeFgWuYPRxEVP7wORb5OSf6mwYmADS6WHyVT169v4Ha5a22ECSozd
         BLIw==
X-Forwarded-Encrypted: i=1; AKwUvBzca6e8ebsmcvnsudsXsU/ppUjEVa3QLIMgtPeOxHEOcw+I/97HvEncwM9lkAR/C7Klo5xRJNT/FN2vHg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8SZFF3f2XXpuovI30OTDQKPHg4VSiVZytQ0jxAc0lqiPjDq0sj
	2AWjBtROeSOi1xE5mA+ioOZnGsjwYfNir/+Qt0ar30Hs3Q2BsHnX/TJsaolCE5zvDZOC5ZL1+Tc
	pUcDOT4VdnMiXFe7H4GKDDEvZ4zsnhJXcIeo19ZmbgeYsRQZULrh+/jZ+2qb68D+Hk9T2ZQ==
X-Gm-Gg: AYBFou1ejYcaVKTXd/aIvLNRb6EaE11P2ph64wS/w0y5lrYet5Am62jlvc/yTyrx/RO
	kK+uq9hTvM/laW/VzFzMgPJPkpaFjLVOXgu711a+osFXLiczSeo6HVisBl+tMUKwyiGPMxPgAKr
	0zs7R28Psv28SYjLD7+O9e5EGjvlqdmyaKAQwA9wARhyLVQ1zANr/X29H4EeAwO2exC5RKHKq1X
	cl3vZ3+xKrdpKO98G8q39HDO//qwjjpM0/nlWm3V6dPAIh1NGrpnszC/OB0Wrd/MplzdPmko9E+
	J7+o2DjFi/WCM5tyGqK8sKA/i5FJL9K5umiJT2NEyxDNsMAw39InxgJXp33emqcHhbU3JWgA0JN
	a1nG3RlX6QjsbqpF5ivPVatpzbI+bWod4gMZAT+aqkSvy4E1pUURglje9lF4xyONiElPBFn5A1L
	W/wVE0GPoOaIhqvb15
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704446385a.40.1794010002591;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704441785a.40.1794010002132;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:09 -0500
Subject: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FjTOp1M8Xy8WBCnxDwFzONX6zQMkkI1R2AYzFx+nwrU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbdoi/pLp60VjjwvcUxslVrirb5DV/utktpvPDq5W
 Wn/wb71HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykdQkjw6JqyU0+3VVfSzWl
 u41X9l86OG0B89PfCwV8v3te0lN3YmD4K1PKxrDgtUqx6oLWQ+/ii6VYfpw6XSt0c6OA5Me1z50
 zWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sn3W6yx1KakSlIz01pJNMWNH54Sn52wEwDGeuU5qwVc_1794010002
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_160645_308350_4750EABC 
X-CRM114-Status: UNSURE (   8.89  )
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

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/imx-dma.c   | 6 +-----
 drivers/dma/ste_dma40.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..8e0e82df8c5b 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -1238,11 +1238,7 @@ static struct platform_driver imxdma_driver = {
 	.remove		= imxdma_remove,
 };
 
-static int __init imxdma_module_init(void)
-{
-	return platform_driver_probe(&imxdma_driver, imxdma_probe);
-}
-subsys_initcall(imxdma_module_init);
+subsys_platform_driver_probe(imxdma_driver, imxdma_probe);
 
 MODULE_AUTHOR("Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>");
 MODULE_DESCRIPTION("i.MX dma driver");
diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 2e83503f71d1..4fb54c8f2d23 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3990,8 +3990,4 @@ static struct platform_driver d40_driver = {
 	},
 };
 
-static int __init stedma40_init(void)
-{
-	return platform_driver_probe(&d40_driver, d40_probe);
-}
-subsys_initcall(stedma40_init);
+subsys_platform_driver_probe(d40_driver, d40_probe);

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
