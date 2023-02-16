Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB5AC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiOXHA+ZL7Cca5lBpTSiGOpxOjg69KUYZYJzEyofr0Y=; b=Kr7sWuXvoveO+P
	G0Eo4teNezsvlC6l9sLoNUh3R6aYtaUe3obNHRAMY9l6FpWXDUdFPR4jWhbT9xBwctekzcxl+uDvR
	s0BynCEjuxixR2ozBoa40nEoU/fjN/ofFJazCZ6mPtKO0fyeSfP75HM5O3DwYp7GauXosrDdwiTRa
	WgqTKWEGemSz43DxzGkBQwyjhlMIw9DD0jT+xb+FiY40mzcqeQsUfR0xiMIHylVjLf5HlvPk0qPJ+
	mpmHIxDFYtfyWoO0DmzmbewfdKrLBDq6/o/1QQwXG6GS83C38RBHu+ETlvIIyQFZvxyIJSRZCESUY
	0uVCf4+cbMM2p1DOeKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSiuH-00BUn9-P4; Thu, 16 Feb 2023 18:22:57 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitm-00BUOb-Lf
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:22:28 +0000
Received: by mail-pj1-x1034.google.com with SMTP id bg2so2711239pjb.4
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6w2bEiZ6pur5iCJunBAbzO2Rizq6VDyDF+3QNnzo8W4=;
        b=l+Os/mGF5YrQc2akg1w1/Es5B6/JyAn8aMu4QNlpR0eLtL5rBvzBv3N+L4c4RAn3e2
         NWNQNJpm0yKXy2rpw8YXGRC9gfaABRTsrNzT+6q9AHftHO6EqPvXXlSHVqvE8MtnkG85
         bkEslI8Ab9s0kLn040AFK2BWrECBEs0qEbPrv3vIrmvB5unRFZw2u0Xmp3oQ1YiYuy6l
         QKR0UKd+kZ/ZLd2MHjaHuhKZOfw+RDFIMRDmKg0/OU6e4Fd/uRFx6uWrpRekjAgwbbyv
         S89p0dZYt/HbQdps6oczHvziFLZv8Bt1VvD3m/LjDuwwTgBZm5zAel2igXlkA6trDU69
         cioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w2bEiZ6pur5iCJunBAbzO2Rizq6VDyDF+3QNnzo8W4=;
        b=nowpdFoTV18FIAZ5BdcfW2zZc4mqbe9xSzMNOW8Xvxu6aK9va9M9ECH3g/n99GAtdO
         90wkgzDsEylskEgwTxNxvtlpIoXRd3Sg7K06clvSQCzszMbjMSh6jHay1UvaR9OLh4XI
         k5lnffqyUEV8ANwt2Jj6FKvWnGnpBwuhpI6aFsYxpLriiAXYBXfLRBRV4FMHMLW5moyq
         kJqS+i14aELcZeoNRXMIHUyht83KYnQDS8Z2Td5QsWDOglgv4siGPrbHHadIbjInrSiQ
         pmFAXqwS9mkiy5W/i7qzx/K0y9utBf7w7iJJWx8yegmh2d0SlTk2iL0cGvt//9lJBO+5
         N1uQ==
X-Gm-Message-State: AO0yUKWYUlKEDPhMQhtr0/t778WsCFManVUDzq6mH5NYCbx8wvt3u2x5
	FQ4BJjNom7GljtSqtg4wcX48/A==
X-Google-Smtp-Source: AK7set90jL8Ub99U8TFOUkAjXVqJvu8GPAP0Rn8q+1zVd+74L+TSkgpW2/7HHEruLJohOXin4327bQ==
X-Received: by 2002:a05:6a20:c5a9:b0:c6:d84a:ce1c with SMTP id gn41-20020a056a20c5a900b000c6d84ace1cmr4929180pzb.35.1676571743596;
        Thu, 16 Feb 2023 10:22:23 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:23 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 19/21] RISC-V: Enable ACPI in defconfig
Date: Thu, 16 Feb 2023 23:50:41 +0530
Message-Id: <20230216182043.1946553-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102226_750604_91B222BB 
X-CRM114-Status: UNSURE (   8.36  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 128dcf4c0814..f89f79294b34 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -218,3 +218,5 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ACPI=y
+# CONFIG_PCI_QUIRKS is not set
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
