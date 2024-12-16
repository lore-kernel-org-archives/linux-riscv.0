Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE4BE7716A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 00:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=78UQhu/vEehHt1u4uYqv5wFQlOZjVE0lYQl1aMOsjpw=; b=Wg+pv8lVCh5Hap
	UQv9DnU0wDSjv2NxekR3P6ABLcMvbZHZRXVOF+SAHrScMbLbfaDsOUIoX+Eo6mH3ymelYFChgcvQ2
	DlhLWaFuBTF3gc1d6Inp/GLDw5zkeafYxkk13JQTJDNg/Mja77keFwsRX9VExH6wFNv78FW2onGj9
	U8Ig6dytNXNv84hk78LVpb8B3dQwMtWAB6xs0w8blvmSX0M7fbdXSnSK2pxkw6jCqHiyanXGAUA7J
	yPzvjTxUt8DdPnqYZRnCFDyvUG5uAJ0gslxnOx93EynXuwFYbso2CJ4S3ZhpeimZ1lxhGlG+zYDB/
	+Or4CGQk0Nap/IMACe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMz1U-00000008gwP-1ucb;
	Mon, 16 Dec 2024 00:31:44 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMz1R-00000008gvw-3xxD
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 00:31:43 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ea8de14848so1664158a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Dec 2024 16:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1734309100; x=1734913900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wjgf63X56bGGjXplIZClf8v63m4wUGZdNsKWrwYGmwQ=;
        b=Hfr250m6M3TN0Zv67PUN6yQIdVG8LhKxqZXGysSRTFPqbt3ugwvL/ohNBJq1MwxYbA
         aiPJ4tGDpixL0x8xgWQSWjFBjbzLgcdcyjW+bLaALhltyNdbenBtLGaYqZHeUKTUB62q
         hx58VZFOJAh8UYYqf9GFO1HTacXlrYxyu+myFFt3wFK3NJnt7latliLuaVCGMKEwOLLK
         yRqxAfZDno5BVSvt91Z9Yab09m7qrs+/6xC/qtPZxRT3O1CcNCYxAJvJoniw4PtHuJie
         78BUub+vkI1P828OqS/5MUjiHH3YBitztp+dlaGcoMEhtfKYs09INuNVW8fwbm9jeouo
         8aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734309100; x=1734913900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wjgf63X56bGGjXplIZClf8v63m4wUGZdNsKWrwYGmwQ=;
        b=WbV2z8tLN8DlXxEGbb2V+2aJXt4JZUmpqgxt14GBiFeuuKx7IqjwLzrVmmjaXfaBQY
         jYdi17nXDojIlIQaMul8EtKEszUaMI4qTia2KwX2MJu5gQuxgh+DaBCkt0FMfRR3xmG5
         vuFY7HO6IZsh/p4KSSOo68N5JSqIVwfHrvF8xPf6KXTmb8NFS2jozoSXBsBuZUUX9lNn
         VQ0V+rhyyeGCzSCwOyMCZ+/MQEg2DhbwVIPbtCkFLqQnCdMykYJLXUJLADn/fiR4iusc
         OSqMxuqnQPHAMPaV6p6mQjW/76oBwSU5qadNet71GPSrIbl5zern6ourLVI7XDaadX5s
         lhMA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0bmrr7WVfjbJaru9W7s4G7V8w5gxcA0Gz89uviexIOwvOHcWmLOo1AgJVQBArQ/ym1kQktwAReoOSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWHivpevxG28mRLjCKAhdWzS8FRghYH4AM7sMkodQJnXs4n1zu
	6VmUiTmaM0HkqSxiw7vcsWj+uB/6RQ6SgxztYCJzkcAlB7Jz94jfHSEt6rY1jBI=
X-Gm-Gg: ASbGncuVsPtKwVJBUCkbjjstEgrXSsvgOUeAUj4uGcMv4RJn4IU+YaeV3wuBVJUI5l7
	iqheIePbiHqktJ6bALgUBs9ChP015USEVVJ9gXYFz2E4VCv+13+clOt1QYyU74KNkoTtJaoKJ8N
	0qvLy/gWHDGQp69FXGvu8E7J/acti2HT7d+8NjIZA9rjfYFOjHPzb8Buqpi0SI8h/sn5bKfLdWs
	dBTMV4C/zxahwJHfN+7X5B2zDlRU1q+kI2GovgCLYwqhZPdcFcSxZI2oPR6FYs2j7/D27JDh+z0
	9gKDWrPHAG+M
X-Google-Smtp-Source: AGHT+IE6hWu/AiGUMcCIzE+Djl5ZsvZivICvhS5bLKVYfQP3DTp8yAD9VUpIONRzJAvAK5ShHk2dUQ==
X-Received: by 2002:a17:90b:51d0:b0:2ee:3fa7:ef4d with SMTP id 98e67ed59e1d1-2f28ffa7db3mr16665936a91.24.1734309100191;
        Sun, 15 Dec 2024 16:31:40 -0800 (PST)
Received: from x1.tailc1103.ts.net (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142de3403sm6826614a91.26.2024.12.15.16.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 16:31:39 -0800 (PST)
From: Drew Fustini <drew@pdp7.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Drew Fustini <drew@pdp7.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Yangyu Chen <cyy@cyyself.name>,
	Anup Patel <apatel@ventanamicro.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [RESEND][PATCH] riscv: defconfig: enable pinctrl and dwmac support for TH1520
Date: Sun, 15 Dec 2024 16:31:15 -0800
Message-Id: <20241216003114.326129-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_163142_287844_6AEBABA7 
X-CRM114-Status: UNSURE (   9.15  )
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

Enable pinctrl and ethernet dwmac driver for the TH1520 SoC boards like
the BeagleV Ahead and the Sipeed LicheePi 4A.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <drew@pdp7.com>
---
I am resending this patch since it has been about a month. It is still
listed in patchwork in the "new" state:
https://patchwork.kernel.org/project/linux-riscv/patch/20241113184333.829716-1-drew@pdp7.com/

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703e..d26e670404b6 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -167,6 +167,7 @@ CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_PINCTRL_SOPHGO_SG2002=y
+CONFIG_PINCTRL_TH1520=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
@@ -242,6 +243,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_DWMAC_THEAD=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
