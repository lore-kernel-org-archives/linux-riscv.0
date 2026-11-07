Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0624A606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 00:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yaON82yY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blHW9Stq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/nJXp7ndu2OSY48yMBtB9uxcnx9NfzsSVxJpne9dg6A=; b=yaON82yYi3lmg2SG+u6vew46lA
	IGpozjdHZAXXH3G7nVQKWN/51zS0srWh/xgpkI3fq39NugRNBUh29s8FT06hYykt6qQt/BPEwza1k
	hBXw1lRCPQINkCWpiZUbsNSyRO/f9O9h82/OwG/eT695JqJ20prOq7ahF4WEb7CMli9utan2Sdi1p
	19LnJp3Tts8KoGKtVuCzLmGHu+kn2OJcHZ8ID0CKcKIM8p8rJZ6AcbPzOJVeeepLB7d+SV9gByXbQ
	yEUEB/0IItqeuPKvi4gUzu3JrbMq0R254sPh+W5PjGsf8qK60LbUoV4s16qLwqonPUFFc6r2wi5Bp
	1JQrtoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxG-0000000DtRD-2tRI;
	Sat, 07 Nov 2026 00:06:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxD-0000000DtOm-0KUP
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 00:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=blHW9Stq16HlAMW+Vr+8IoDMnu52jDSd2rEOgXK9puAM4vY1kvrUpGmPiMIn87/ruDmznp
	hgQ/enWjtHj7lkF7QAUROy9j3ELAcwmrF9FAjQCRWwBaua7VFfoudEaeEWnyj50HkRMUxm
	poCuvRfRON9asuFtdnmNJxF0//2u+xE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-eOei7vEbMkCQzRoiPJi2fg-1; Fri, 06 Nov 2026 19:06:40 -0500
X-MC-Unique: eOei7vEbMkCQzRoiPJi2fg-1
X-Mimecast-MFC-AGG-ID: eOei7vEbMkCQzRoiPJi2fg_1794009999
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so316037585a.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 16:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009999; x=1794614799;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
        b=yOYGtzat7mJn6BfDw2NVd/MDKsLyQrKYfDbMYb/I61NiovSaTw4D4AxPMPtgXfNry0
         ZPhSUGIVdSjwHjvLub5G72Y9gO5LsezXHqtby9xjNL2NUYyQzEvuFEw/yddrKjRK/+HV
         J18a15+Jfe0y9ca83jssWX/sDwG0prYsj+v5LbZzgIcFfv1P8q9917zJYRV23FLEVTPt
         hhb/U0x5zBRsHu/B0y7rIdd+a2fWkbnL2DS93CLBEl8RxBXHA/CxiTCgFXIG+0LdXMin
         dxBzuuosKJ6VDuN3utr7q3XWK4fL3FxeCFxbM3POqoXp2GdPkvE0R6ag9BTWtndZSpEO
         889g==
X-Forwarded-Encrypted: i=1; AKwUvBxyxSJnTTs6RGHnKTkB4pfWFrkMWfcI8t4UFg35aT3PxJWUnmhQ4aJv3BDzTlNavYqvWf1EeucYwIehgQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9lt4yPLJfotE717aFn+W/JPBZ+fnry+5rT58YVW8nSAn7QYnXf
	2jz7gdWTQJsgexik6PXH7YRBZPVW3LS3Qx59GAryWHkb1j0oKeZPFcnIMRPlyDRdmU08nnTPv0t
	Fp3rVxvgDIVRAnWD/IcVpE4duWIXyKMXIouVt17XpS+bzGkmGgxWKqANsHiJWDwlhSsWoNg==
X-Gm-Gg: AYBFou2XxTjfcOk0L0DjWeOBAXj/wdrS5dBbfv5mQK6IBiSjkUudNqPVGhnyMde1utX
	t6VEF2FNpNS8tHj7jUfy6HsSmZj0ypG9bQk+602Vu/bWCdjUluUlW224nDu902jOnqV1nbnftQj
	rvIkG3Vf2YQHAF1QOJoY0jj7+V6Ujdpjjkd9OnKG4MFpZWIhJWVVtiSaeQqE5aUzT1uVCD0f9Ux
	gVD6UGfPIWjC5ILlGPYgM0YwlvkhYHcca9DRNhBnfv0iA4k6i28dddCFJ9d2XysX+1A1qwMawx9
	Gc+j9BksHuRR/xb6rx/zGxOkA++5JvcdeHG28RSalhKd5SmlLox8BjbYnFVn9QMa6syFNZa+WZr
	MddTYmSA1dBeU6fSnwh62dwbvPXdt3i+Js3frdfPTjUce29in4nzSXc7j8Lc/CslsJzzs1Zj7l8
	7yHInskLwvuerfiPVq
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656685185a.76.1794009999347;
        Fri, 06 Nov 2026 16:06:39 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656679385a.76.1794009998935;
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] dmaengine: convert to subsys_platform_driver() and
 subsys_platform_driver_probe()
Date: Fri, 06 Nov 2026 19:06:07 -0500
Message-Id: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auEWRvItDaCVxEXMZnEEYySaYsl5
 O5Gu/zgvb+CUGESOKsKhVYWfuUOPCjwd5cTaQ7dMJjBIppJh6ejnDiTluUmm2gM/oQWRxPxCP3
 2LhT5809errv78kF+/nWgtS91cMYmdAAAAA==
X-Change-ID: 20261105-dmaengine-subsys-1dc716130f14
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oVVsVvvwfxfCApVHL620mY2qW7PKDgCvH3JDOSlJNIU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZdcF1fMUmH+rXipql15WdnT/1AeSXHt/1r/5ue1r9
 M+H33PedJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR/hkM/8zit2odZXRSqNV5
 sVO+W9Z/z9Uvm+4UuU33k+g7uHdzqgojQ8N5ObsWa4OmxOCDrNu7b3qnL/RZuSGFoz3q0Oawy6H
 sjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HY3lwSKqkW7tRsar-AQhzTUilFWNoxm0Lo5SUPE4kTI_1794009999
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_160643_229401_A983A424 
X-CRM114-Status: UNSURE (   5.06  )
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce boilerplate code in these drivers and convert them over to use
the macros subsys_platform_driver() and subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      dmaengine: convert to subsys_platform_driver()
      dmaengine: convert to subsys_platform_driver_probe()
      dmaengine: fsldma: convert to subsys_platform_driver()

 drivers/dma/at_xdmac.c          | 12 +-----------
 drivers/dma/bestcomm/bestcomm.c | 18 +-----------------
 drivers/dma/dma-jz4780.c        | 12 +-----------
 drivers/dma/dw/platform.c       | 12 +-----------
 drivers/dma/fsl-edma-main.c     | 12 +-----------
 drivers/dma/fsldma.c            | 14 +-------------
 drivers/dma/imx-dma.c           |  6 +-----
 drivers/dma/mcf-edma-main.c     | 12 +-----------
 drivers/dma/moxart-dma.c        | 12 +-----------
 drivers/dma/owl-dma.c           | 12 +-----------
 drivers/dma/sa11x0-dma.c        | 12 +-----------
 drivers/dma/sf-pdma/sf-pdma.c   | 14 +-------------
 drivers/dma/ste_dma40.c         |  6 +-----
 drivers/dma/ti/omap-dma.c       | 12 +-----------
 14 files changed, 14 insertions(+), 152 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-dmaengine-subsys-1dc716130f14

Best regards,
--  
Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
