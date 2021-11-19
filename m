Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8061BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5219661B1E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5219661B1E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=io8zA4R6mtgliJfIUb9puu9J75/HA6iqW7qhyf+io/k=; b=YuaIbnPIunYFEK
	qyruVTwcUjMvkJJTifn2BdpZ3Dtjf4cK8jqG6yoL0jEWfyuiFS+A90YNSRo8hh6AcbXka2NP/pimi
	ofcgC0NyWSynibBVAzcLRcKXanY6dAGo54DIcNx+M12yg7XZxWVpBFhjhQAWJ9UdeNdiyZExMmtu/
	fYjjV8Ga7pWcQKpJGQSPCytrU1Aw0tfBSuv3zhje/QI/A4H75NU/HhGAoY5qSLg4n6Yx8sQj/XgLa
	AbejXAhksjmvyaf4IQa7Hf8qC2ja22ZyPfQK+MF2HyhUU4pCd/3j+TVIuZZGqcnKMOENUcmYMpfTJ
	fWqwLlcfuuRNu1lCvUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70f-00B5sM-PH; Fri, 19 Nov 2021 16:45:09 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70U-00B5ic-Tk
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:45:00 +0000
Received: by mail-pg1-x532.google.com with SMTP id q12so9117997pgh.5
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=WImAJJVVV8ZgGF59Y6Sx47rmH1oD9rXqn7A8Z+idAIs=;
 b=wlYyLzgts1gwjmOaIa5kyKYhHq15ZIXkOGQsAjLIKlvBtlnvrAwHzTuQyksqdfQwNL
 aRlJ67mEDDghlu72xwYXPl/dhhlmKjB9kmaJydHAPyTT2celbRdIEAVMfekKPlwpsYr4
 pzk90gBJxvkEDcJGYKyPFe2llZ4U964sWAAH48R6hq+vw3I7YzRbCfNETFBw/yLfcT2+
 +MUGajcOcuZEwoVTLtmIskt9GboqyJJyJk4Ig+AJiJQIfmB/IZqLzy6+8jzDmWOqpLQQ
 F5sjy05+XE1+xXFiN/ktINtBXmDo5JyWADkGH9VHFPUdRFWkHjKx+oxFgsfJGOv6Lbs6
 Wm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=WImAJJVVV8ZgGF59Y6Sx47rmH1oD9rXqn7A8Z+idAIs=;
 b=alI19QvHYNDvN4wZZy+wekxOBC4ap+kjau9QXTDWF8pL7N/fQ1+owLPgani3Gtwbac
 QvCR292/TaDcquJ+aHOqvV+sOfzGBb3qhGOZhyyGE/S6C3xAN7QTYCG4raTD7KroNq0w
 zP0chGacRhZH6YminEBNxEZ/ivWIy10MHjWSpfVcHyEVN8LZk5WVjDxN/v5+XazDwB2e
 23pCQu4zPol+L6ONxm+8sQ2R5LCXdbjTTNaH2TJBdT5l7sgCxPIg6gUC4xaip/a4qeHr
 rFBytyLygMvz8yGWVTgzQmkkBgaQJr9YPjljkgcNuYKx7iEE16etJdw8eOMNKH+gXsaX
 Z11A==
X-Gm-Message-State: AOAM532xWvab7wUMUnadHdP9OjvjTZmCnqpXczSGmGkr5T07olKjb7cO
 TH0NjM+bt2L25LEpLBivc3Rxxw==
X-Google-Smtp-Source: ABdhPJzt2WvKizh2kBYa7g3K+Fk3f7u7YeoZpgNqJX9bVrif3hlfLVR3zLqx59eLwQFyQFhFeWlYsA==
X-Received: by 2002:a05:6a00:99b:b0:49f:eab4:4e7e with SMTP id
 u27-20020a056a00099b00b0049feab44e7emr24191675pfg.63.1637340297859; 
 Fri, 19 Nov 2021 08:44:57 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e10sm187273pfv.140.2021.11.19.08.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:44:57 -0800 (PST)
Subject: [PATCH 05/12] RISC-V: defconfigs: Sort CONFIG_SOC_POLARFIRE
Date: Fri, 19 Nov 2021 08:44:06 -0800
Message-Id: <20211119164413.29052-6-palmer@rivosinc.com>
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
X-CRM114-CacheID: sfid-20211119_084458_984628_1CD97E77 
X-CRM114-Status: GOOD (  10.65  )
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

This should have no functional change, it just sorts
CONFIG_SOC_POLARFIRE the same way savedefconfig does.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 96c2a3615bcd..0f4fe5790fb5 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -15,9 +15,9 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
+CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
-CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_VIRTUALIZATION=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
