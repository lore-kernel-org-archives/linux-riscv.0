Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224EBC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA60661B1E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA60661B1E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37RxjW97hgX7zWBHlF3gnvn+h28RZlnDtwJOAwAEzhk=; b=WvMSbF9/JtvFKb
	Xo3/ZuoD0ZDWhBBKEGFlBx+4SvHRWX9URzjO5MhVqNVB9E9qRl5kqQFZDZU44HGmhY9jcVn5bMiN5
	eZnokPX1I6pQfopn1ljQYsIqEbhFqeWsZahuUfaTvY2A3vz+ig3BRxlXZuiuUUT0Z7Slhb03cvbjT
	sah6mhebf4389hXygsli9MMTds/+5EK83tOPCgySL9pOhsuod5S8qGJs4293zTWkYchBK4LAMRFaI
	WYAq5zmWGppiRz+Gc9bSwz+NCgMbtFzDNfgFOn0cGbu3eIaJvfajc3+OKZxdcvCSKaJP7usDMWJDN
	pwUjfSG/xQ/PqLhwoN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70p-00B5y5-6g; Fri, 19 Nov 2021 16:45:19 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70X-00B5ks-GC
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:45:02 +0000
Received: by mail-pg1-x52d.google.com with SMTP id q132so117575pgq.0
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=FwXbFXmgWnoAKIPPMw3+meN78T1AYlQPW6JO5KlmOFc=;
 b=GwHEWvJxDcaPkR1go7iczosqR2vwQdwLUkLHhDcSqLvzfLnIKDRN5b0/1dZsjz1cgG
 jDelFqQOkpoMOlq036X1xblRXXbEVVuUtiSw6dJ8moZJpzK3xuTmVEnOqH/dMEe2tPcy
 kv/maoq5A5u99d67Mrm4mFwFab2JomdEFQJ7HbxFlnf1qfnFA5ds8BS/t4gDkLRQ3lpm
 ZW/2iH9AIYSFiuGN6oiLlYb0WGNzn9u8H7/74YbwOS1a5MEQX5YXwn+OvoFPCBV3aDzT
 JYrEJHOrTdUvTRcXcOjQD/XAVdjUvhfAfrMbFVAzrWUgT/Zx3++x4zKtEsKzDlwx1Njn
 QXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=FwXbFXmgWnoAKIPPMw3+meN78T1AYlQPW6JO5KlmOFc=;
 b=16pPliyTvYMo5JF654CX20vh+nhXE01iECkxZHY/w0cV5lAWKpNRonR8fa76F58Vgt
 izd/tLPOHkk8ralmBjK07bmlsQuYsSGUZwJYO7LMVbzPQqon3oVGdbd7indXdLBr/Yxl
 XQhhWA1kWz8pGmA5DVSrjVDlxgIaXVoBkJZMw37jevX5IoOLQmdKo7zFJMGBFZqv7W7Q
 tfUBGtpduM5uHpHLm3NUxO7TwFbdKQmj4AedTpimSvH+wz4vTwe/oHM0JPQCnwsnvVOv
 KbkEgw88yMDeAYJLahyTfl9rnghblm7935z93sgtlE3nI4UZ0hZmUloBnopK4zV6mz7W
 0QxA==
X-Gm-Message-State: AOAM533Vr7bW2YIF8YREsWpoIqd8z85Lv5HIBJ1YjJaFvBUq4sftyVL3
 ZiQ8yu6615KzRZ/OCkYEpA6gxA==
X-Google-Smtp-Source: ABdhPJyFACTPphRa6klhxLhx0DCYZ9m6lKenXggXBtQoELuXEFp4/QL7G/1/q93b8AsTV1Re2tHcDw==
X-Received: by 2002:a65:408c:: with SMTP id t12mr18370615pgp.262.1637340300380; 
 Fri, 19 Nov 2021 08:45:00 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t13sm193989pfl.98.2021.11.19.08.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:44:59 -0800 (PST)
Subject: [PATCH 07/12] RISC-V: defconfigs: Sort CONFIG_MMC
Date: Fri, 19 Nov 2021 08:44:08 -0800
Message-Id: <20211119164413.29052-8-palmer@rivosinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119164413.29052-1-palmer@rivosinc.com>
References: <20211119164413.29052-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup.patel@wdc.com, heinrich.schuchardt@canonical.com,
 atish.patra@wdc.com, 
 bin.meng@windriver.com, sagar.kadam@sifive.com, damien.lemoal@wdc.com,
 axboe@kernel.dk, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_084501_577158_D73B3F6F 
X-CRM114-Status: GOOD (  10.20  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This should have no functional change, it just sorts CONFIG_MMC the same
way savedefconfig does.  This only touches the rv64 defconfig because
rv32_defconfig was already sorted correctly.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fa9017c60b3d..ec9540392df7 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -90,10 +90,10 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
-CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
 CONFIG_VIRTIO_PCI=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
