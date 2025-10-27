Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73100CCF9EC
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4ENchC67sR5/Yr4yGGl6gpnk8UBjWVzbUg2mkU/r8g=; b=IcTBdULPDdhorX
	iGsVNPd3KrQNItLKi11OS4CpYHK5tv02IRRx13OU4hdsH2zAXXcX/3D2KKTGMo+G0kg5Wh7fC7jTM
	J1J51y9gr3eHCfXm1ygAuGcz5BcGI+DzSXuFpKJ6d+mtRn+hgFHElHjdIPhf5U2JZ+6VHuIbl4rDG
	VDs/xhlv20VtPmsxG2IoUqisGMN4NhY8mHZG3buXstEgbEULm55XbyDza/VbmJcrHm0/Rnhualymm
	HZfnwm9jUZ1QF6TIzZvbCwURJpdXXLt7FM0NSipzazWFSEPk7I0BX2viSfaudagbGR42bbFZj6VYh
	CDqgTLhe7QunrU2wM5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIv-0000000E2CM-3oFt;
	Mon, 27 Oct 2025 13:30:33 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIs-0000000E27z-44w7
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:32 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-430e6ac6bccso29809085ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571830; x=1762176630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM+v0dmpFWaYbb7BtTqQgtL0zt31yeqvCe7/rJYcYhc=;
        b=x8b2Yx+jcvwikN283zgK3L561b4d0jey4wrDfabfTdyA5J4CoTp7CBu+ijdMuODcYh
         Am0ogSiVDsibwF9ssXtxEtGRDtKJm6RC+NWdpniJTjcERb8ROgxjP/DyGkXaMHpWo878
         nqyEvnVrA39FPjOgAhKyEOlE6tpG7jyf9cFIiExH44MwsrgpnFAmriejm5+jwapaIOSZ
         +r5U0JsAnzleqfFsbuaUfFav3dUVQ376qAHpQqTPUTLUksMfMu7nXgsEkQxMo7UkCHe5
         /JcERsHu6xgDiUUKmHF/grb6N7PytmLvvMzzDtORzfbUSe4nqkMorx+Tq0Tux47STHfz
         UHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571830; x=1762176630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rM+v0dmpFWaYbb7BtTqQgtL0zt31yeqvCe7/rJYcYhc=;
        b=GUmL9qlQLY0NjGKCOXQJkJYzx2dsR09LAwMz7i6iWGUEc5fot/QjUyJaXmkoeCYh4X
         uFl0E1Gul+ai9TkykwlgTJjHYL19oRRsMOZ1//UyfL90FIPnIJGEtRmZ5weUZd2TUzPN
         TRqVAv5EGCYym8oaiaSr2Gavdakan4wNdS9LAA65HXIoJBsYhecAOxqAeI5OI2srAftE
         COggmL+ONF0ILu9Zi4CAJGgFoTn/xGK1UXjIDdhF9uULuv0HnmzOhd055NlqTt0HObfk
         /xhmxFbfs2WFhn7eqU+FQnADfoXUOjdLCzsYvdOujxZ5n43uqNizIqL+hWn/5g71Nize
         v9zA==
X-Forwarded-Encrypted: i=1; AJvYcCU9N5gVv5Wrx7VklbfBIp+z6KcEAJ/5FKZMsU0SazrSgdW3TjEw7x3qcwP2jv2ylGkQUi+vAZimQgHKyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQsuJ6uOpVDYeVtvXnYRF6YEapXYbgRo3o7GB7sh8HX0iwqjbJ
	Kc/X+Oam3s0d5km1fqRlsoTAnGxKwcJvrcnxUMreLMDozzbgbE4mqM8oD/uJkxyFA8k=
X-Gm-Gg: ASbGncuZxshkE3umlFdiN18kGQqBrOhz8iC+7fGXDF/fcDEphM2EJRGzr2i+2B1Fxj4
	dHe1LKgcRt8SqszCblS+aMobXgraOCl5YBvTYz8yoO24RnoNiSwQQA5ugwBwPWPc1Wkt9uCcURm
	S5yFnFsgaQdVXkq6fKPyzQUZsh4mahk5hM/SJ9ve8a1t5m0kYNEwRlLn++fPbx+fLXIuNjy7Stu
	Atq1Flf9aZKQxaY1YZK8CxrSQ4lrRtNj8nfsIS2s39czbGWlATjoNNRXUcxodvo7+aF09wQZNem
	tQjqOBUurMWm/iLlOFKBjYlab+LOflwudDl+10j2LkJxEbRNzfCcMFCRfZe6qPRrrB7XlkgBF56
	3aIKpxAaNHvA2T6DLgXpQg6TfEVtzbdzpMImUkfLvPsOPacoc+sqA8fuDmaBEMkcc41IeRdBINx
	rEqm+28Mx/h6M0IxkjFf+94bCjPXkEBXZQmxaZoS0wB5F/XGnsTFd6+Q==
X-Google-Smtp-Source: AGHT+IEI0FEaFBYedF5aHL03pfHWLVmNoFWC+ao4vByuZRBexVAwImaGLjB2RwJa8efRgO5ykDumOw==
X-Received: by 2002:a05:6e02:260f:b0:430:cafc:df6a with SMTP id e9e14a558f8ab-431eb6a12e8mr145266905ab.15.1761571829935;
        Mon, 27 Oct 2025 06:30:29 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:29 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	dlan@gentoo.org
Cc: Frank.li@nxp.com,
	guodong@riscstar.com,
	fustini@kernel.org,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 9/9] riscv: defconfig: enable SPI_FSL_QUADSPI as a module
Date: Mon, 27 Oct 2025 08:30:07 -0500
Message-ID: <20251027133008.360237-10-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063031_029420_88C4FA64 
X-CRM114-Status: UNSURE (   8.41  )
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

The SpacemiT K1 SoC QSPI IP uses the Freescale driver.  Enable it as a
module in the default kernel configuration for RISC-V.

Acked-by: Paul Walmsley <pjw@kernel.org>  # for arch/riscv
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Added Paul Walmsley's Acked-by on patch 9

 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbca187..48afe30d42e88 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -158,6 +158,7 @@ CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
+CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
