Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06087C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F7D61545
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8F7D61545
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6ZnwbGvLyfK4lqf4HyeX3y2fSOVIJ5JcUroroQfm9g=; b=1wW91KwpFTYrPK
	Q7SAr+ib1zXqi7RaJtEB/DhUbL6pnoYb27ofD3y4GjoHS91cxoimR6LbVGRGzT3V0p0eG/HkB+44f
	12UyGaJ8655WYGQ6us3RLHO35PDG/eJFvyqTIGUGCIS+g2YQtHF+Mk1b5TNrnFvgMMzTQisQHgIj1
	fw1FPC/21m2RePNiuyc/LwN/6fdL/S38QULhEWwqppOcKXY9FQDKQQCn9rtw7w7PavvhAzAJdcrhP
	TxaM5aZga6oLV3hFvzUtC24l19mv/4ISWeaUf2X0DBjSOxqB5c42q166RWbeM0d7CF+caQ0tRTm2A
	H6ab5GmarK7a0m5orv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70z-00B66e-KJ; Fri, 19 Nov 2021 16:45:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70a-00B5ms-JR
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:45:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id n8so8556363plf.4
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=WBBqDu36GT0JmGkU/ix/DWRv5G47jkaRFbPjNqt5g+8=;
 b=is3hPnILMqFCjPu2rtKJai3o/GJ+um6H++RpkLkoy6HEWDtThboP3DhdXOORLxy5T6
 zwqLTAXHjNLUKwJvw65aKtayVRueYPTmdBR3qYYTJqDAouWwIetysr+6CyyKX+lAUeYl
 LTmN/Ibiuc0d5BZYsbKxECSDHcr1RTrDDOEIPyPUuUepKDYDseHUPUpCxuhgLKZ3WPLB
 gDn8SWLsnnOAt/FfKHOJgGYqM+17WrzQ1XM3Ia2MUVcEvO61prxIj03gJ8t6+VYtuAwM
 zf/AVgrX0BPMn5S6h4XbpwdE60ZxxU2AqJPlIVu+8tXg2BrXPdokAWFHOIL7+g7fde6C
 P96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=WBBqDu36GT0JmGkU/ix/DWRv5G47jkaRFbPjNqt5g+8=;
 b=dX970f8cvOOpHlDIMQQ1W9OdX91A0BybxcAejms+zbFIYxYbkKiuHjrUMeN/ehgzks
 wn5pYvEdIlVRMRvFTc/wKC7oUJIJboWmAdfHbHNYX0M3fybx/5FTSqTA/Hdx623lbGyK
 tM2CGOARNDRCTID9YWb46ERjw2Mn8fXbdTc5BrT939R95YmcjXjn985Hn34DbW02o79V
 YGSrdgQ88CMjs2eTf61+lJaOXdFxscB3U1l6QfEMIcH5qb9iOX0w4a/SDBG95Ltkqywa
 xsJfW2lnn6qrbLnqDj8vjDjsLLCNRd8IZdoxMLojOj4sLP+dDN5h1cuKCExEHPz0oeLR
 rDOA==
X-Gm-Message-State: AOAM532kp3JnRseYgXc6o6O/wJc2OTkwLEQaRF+sd28TiIhgt9Gl2DPE
 8ZhIhD3tdoo+IK3CU44rNM4SZm5/soqIlwsq
X-Google-Smtp-Source: ABdhPJx/PUbNTC9xq8gA8W1e3jjgfz5qeZ7WKQQBmQ/Je45Uq+DWa9RXtYzBY43oewapB86jzdnZBA==
X-Received: by 2002:a17:902:8f94:b0:143:8e81:3ec1 with SMTP id
 z20-20020a1709028f9400b001438e813ec1mr77412614plo.52.1637340302699; 
 Fri, 19 Nov 2021 08:45:02 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id np1sm11899019pjb.22.2021.11.19.08.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:45:02 -0800 (PST)
Subject: [PATCH 09/12] RISC-V: defconfigs: Sort CONFIG_BLK_DEV_BSG
Date: Fri, 19 Nov 2021 08:44:10 -0800
Message-Id: <20211119164413.29052-10-palmer@rivosinc.com>
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
X-CRM114-CacheID: sfid-20211119_084504_697472_086B4604 
X-CRM114-Status: GOOD (  10.04  )
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

This should have no functional change, it just sorts CONFIG_BLK_DEV_BSG
the same way savedefconfig does.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
 arch/riscv/configs/nommu_virt_defconfig        | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 690460f79925..84b87f8bfc8f 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -30,7 +30,6 @@ CONFIG_CMDLINE_FORCE=y
 # CONFIG_SECCOMP is not set
 # CONFIG_STACKPROTECTOR is not set
 # CONFIG_GCC_PLUGINS is not set
-# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_MQ_IOSCHED_DEADLINE is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
 CONFIG_BINFMT_FLAT=y
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index e046a0babde4..385cca741b01 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -32,7 +32,6 @@ CONFIG_SMP=y
 CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_JUMP_LABEL=y
-# CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_MSDOS_PARTITION is not set
 # CONFIG_EFI_PARTITION is not set
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
