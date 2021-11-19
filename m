Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53724C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 262FB61B43
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 262FB61B43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wzlSMWubQs9cJpIGe5X6eMyxW4bHesHzTLq5lOmwnI=; b=DhOLf0Fm9j/cj8
	9EBKhyZWVobOb6JPcfpYxbl81hz7DZRAcP6N9OJGAdrcKoJSSikgcAt/6HCuo7sDztqXQvLXPzoR6
	II40BR2KjACvebv813+Dn0mrbrTk/WFpgHngZbgmzgPehUI2ey0rRY2jWhkl1ODOo32oAFOfViGEf
	VeVf7USgJjnWxnuYpo0tdgsP6gBB3Dfneb5nuEQ9KGMDsoZHFH8d6r2D/xUfvFfUgEli+k5ymt6Tx
	sVYHELPHcmmNiiXCV5QogaWuoj8httbuP8RkgBOfKfuBltXc5NgjXDyGCvucsRrxYW0619F67wEPA
	7OAqsPzSqBI5LBdmoC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70W-00B5k4-9V; Fri, 19 Nov 2021 16:45:00 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70S-00B5gb-M0
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:44:58 +0000
Received: by mail-pg1-x533.google.com with SMTP id g28so9133226pgg.3
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ah5lr8SoLo+6+fPsQpE+n96JZomp2g2I5RmGsEvEAmU=;
 b=pOJQtnsqxtFlWChG6PkVngOnfkyHnERrgKRjNTlYPB/YBSnuMwPlFghMuhCkXeoplH
 BMJu4/s7M9Za6VPNKuZceUae7/SnCq4u5ldTdPyVcKvS+AaqptyJKbjlnF2zYyTCKi4Z
 bGvNwq5YQD+ptHK3qkOhbmqVFujgNPiz8fAZif0wD9OAgjOI9txOT/na0QJjjlJAIrE7
 WrDW356fvVFf/jW3LC+EQQ+sLvQo66Iimpa6fglWx51wCdqRklJDRqzdDYzWAh3EttNz
 unyy3aIqQyaj43LKMo24DbylFzOw23ut154TojTySwrPTP6tDgiznq4jKWQRQremCD3C
 pYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ah5lr8SoLo+6+fPsQpE+n96JZomp2g2I5RmGsEvEAmU=;
 b=AngyuE6RhHb1VLeiw13orf3Rz0wfBFaejdoVdswah6luwwfjkvjGjgowwh3DVRDmLZ
 6q4yH5ifENv7w3VF022nVudoDAAn9G3doaauz1+Pzj54gHAMOoP0q3gN9OYGy7ZKQYsS
 UstcfJC/lRAynSwbS0JmyT90B0IofOyvZNRJDNfU3Ik3cCJv7MYtn1uaPEyqRRv1/tX8
 gYBtk/P0wBhujjET+jqA3G+/TJlb0+mQ+6IOdq3hD6bpEtGWnWyj0+a+mCDpWPM+NEIx
 fZhX3GYu9m5uUnXEr0jY3wfEAA8viiK1csvXwGcqxVUCqQr0FAlIXhMhzwXOYtdhaWVQ
 Tf0g==
X-Gm-Message-State: AOAM5333mBmYnXRJSeMg7mePlshELkI3q7uDy9vuqEt76VW6vMnL6TQi
 rTP8TPGkOPUSjtY3193CCmKZZw==
X-Google-Smtp-Source: ABdhPJw6Rk0SaD1ydLEFj1AC3ZiqOl6ymHlDrc8KuQWuuILh5CwIVLyIgXMGI0rf3H5bD5vi3o9dEg==
X-Received: by 2002:a63:f95b:: with SMTP id q27mr18665923pgk.202.1637340289537; 
 Fri, 19 Nov 2021 08:44:49 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f4sm214917pfj.61.2021.11.19.08.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:44:48 -0800 (PST)
Subject: [PATCH 03/12] RISC-V: defconfigs: Sort CONFIG_BPF_SYSCALL
Date: Fri, 19 Nov 2021 08:44:04 -0800
Message-Id: <20211119164413.29052-4-palmer@rivosinc.com>
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
X-CRM114-CacheID: sfid-20211119_084456_771640_5BA723CD 
X-CRM114-Status: GOOD (  10.52  )
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

This should have no functional change, it just sorts CONFIG_BPF_SYSCALL
the same way savedefconfig does.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig      | 2 +-
 arch/riscv/configs/rv32_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 11de2ab9ed6e..a6cb99cf4d3c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
@@ -13,7 +14,6 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_BPF_SYSCALL=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 05b6f17adbc1..8a57c940d5ef 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
@@ -13,7 +14,6 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_BPF_SYSCALL=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
