Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24782C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCChtC/UHQsNCEqi9tRyFZ1iWJ1OhyuDKAPBxKzRntM=; b=f1FqcvOd9/XbEF
	RWKVNWz0cW3CEvts+ODH+eT4Ttq5ygGMKEwVjFh6N+po/IKWOR65B8monRI058mIl7e4ORRi/BXy9
	LdN3YNafY0AC3DcIo6v4G5naRfthNKM9QQ6blnUyVVurpK5ei91B9xcyEStQMsG/RGM6IFaxbasdl
	xSdcGTodqJKWgrOzkgxtEDoQUoCAdbKpDuxkgnsH6MTff4BRVYDaQoXoCzRKY02oL0C6tVXkfVSSC
	ji8NPWagoFybWWtQ1Z+dJFJMT+R1LyRI6Qd8iHHeYjldLaPNLRFIOCK8tWI+ZqSz85uPvYczE9sYv
	dQMaN0PoSVEDe66hxgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDruw-00EVOh-RO; Fri, 06 Jan 2023 18:58:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrut-00EVKx-W6
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:58:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so4195385wmk.4
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 10:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k528IELIXTS1zkKswkp21dC+h35tpXB2itDfqYYLy1k=;
        b=LROitF8jx4/M/Vkxg+QMTTkNFGTgnlIBIrA7IpU9FxetFA1RKTibJgltFXQd9kTS5U
         f+kQOb2EEkxlbBc3JnpxlN+9yWOj7vl6Rm6RNx83/reT6pf7U3xHF8HYGN9mh2/wfeLr
         35tefnK85dHNOE5VFdvGX4NVcjm94Ma5woN2c2oxak9mo1EaFClIatsTbEBAJru8eGBJ
         qfUxZZ8XwiSxtxLEOWcj8GBxK+6eUCoCOjA8MPNhHzH/V7LNlzfbulHNFjyS3EG+UDqZ
         +vPmwL6KiiGGZdaUU4+zkjLVUEDCo8S4trCpkyUckye5Ynqz6Sj+MVyFymhzAJYd9ojU
         6gDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k528IELIXTS1zkKswkp21dC+h35tpXB2itDfqYYLy1k=;
        b=viCSq4NL5fyvM3njPXv3fBFYNVINcKxBsNaEjdp8JqeqLCcK8Y+Eh7AJdX442noeJK
         nOmzCpjwmq16uX8mysQCrIaNaz3KxNCg4Iy7iSFKMsX2HBjNZp5JtM/qmccHek/vLF+f
         k17mcWJVCsnHMS98FGkzuzPdamzo9hlCcQMN1mwhzoJ/BPUCDIRYdK3XF24NzmKG82+m
         z1z/btLv5JKNbf/KiLu41lCFrdogS+9zybiSIEtGeJAyOIbVxdQ1V0yjcgsiH6bKMRtg
         MHl8PE8nedRMZz4AxIO9+spW6IYNGzCvThEF6AXTwmFPQVKsabhUqjmd3B6ZTB9l2iGI
         oWbQ==
X-Gm-Message-State: AFqh2koD58IaGHvRtgPd7462wFUmn3Tib9D56VWOLGQwDE9VpW+xneH7
	NQct/iE6JdXjilJSO/MQSB8=
X-Google-Smtp-Source: AMrXdXsatcmSQQUNmXGj79RbRnO+X2B5VntDftI61gKjB4eh5QmXCplrKdVt9YwZp/CVFCNHHoaDFA==
X-Received: by 2002:a05:600c:3b82:b0:3cf:900c:de6b with SMTP id n2-20020a05600c3b8200b003cf900cde6bmr40252998wms.15.1673031487884;
        Fri, 06 Jan 2023 10:58:07 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:79e8:5b4e:615a:91cd])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c34c800b003c5571c27a1sm3162773wmq.32.2023.01.06.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:58:07 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org (open list:ARM/RISC-V/RENESAS ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 6/6] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
Date: Fri,  6 Jan 2023 18:55:26 +0000
Message-Id: <20230106185526.260163-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_105812_052675_1041E80A 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Explicitly select the required Cache management and Errata configs
required for the RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6
* New patch
---
 drivers/soc/renesas/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 660498252ec5..c3475c084685 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -340,6 +340,10 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	select ARCH_RZG2L
+	select AX45MP_L2_CACHE
+	select DMA_GLOBAL_POOL
+	select ERRATA_ANDES
+	select ERRATA_ANDES_CMO
 	help
 	  This enables support for the Renesas RZ/Five SoC.
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
