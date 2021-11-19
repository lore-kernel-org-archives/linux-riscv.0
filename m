Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6EBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4C161B30
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E4C161B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYquakTnae7uTbLtcOCS+qsCuqGPqwEyibsfVF8Wqco=; b=4TCtVO0TysEXig
	0ctJMdl34hGvD1DX8koJr6Dw0SLHTH4tP+jUNnTlMIG//fA8iem96kL461GEhN+iRl7rWXILEA36g
	oBAJhWBwZdkG0W3vaFu/cOCSDv3yPYggHT6u82sor2r4FJ35vDMBGKb8AhYX7S4QPyRbHfjm+7TsU
	TO5ygJvxLtrqjHGzM++g70wEwbMlSb8AIkmUPtPDo4jCt7Lg/EVQlEjVtD/KxZFagaQqF3AMBO5Qu
	4Pv4Dqb917vAK33n2aBU1Z5oTI7ohfAs84q/74xVZaSg/9bYM3xyRB/BWiHKPcmKjJakzqjOfjzNq
	lfp17O4IOXfRLkH5c3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70a-00B5nt-Mx; Fri, 19 Nov 2021 16:45:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70T-00B5hm-On
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:44:59 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso11459130pji.0
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=X7kafgaMfQc5QAZ1oOLiQg/P0i4Kp4ckcP/YfJYFTgA=;
 b=nqSaQrxphluRvJfW72RovSHjHtv8hv1h1+zSS81MpD1MYhlSOYBK+5Q/aIYVqEk4d6
 9DaJwNs/jGtkecf3luGhmnf+/kDtBimhaW5DR4T3WuH9x2N2Qj9ipbOFvRQ6tU5sf4iq
 y0dsnBCZv0zE/kKDMZAsOz+BWLfgbxrkAlL3/v25A393xwzOGYChL6HLnQt4U64crR1l
 RER3VW50FXIv0Rv6F8QZXySxr/nwvfWR+TbkaGbW1LzOtQ3k++ExpjSrAdVRR0mBHdI7
 QWtC0UU3J+i6bqNIFnWDvA9c+aJXJHXH9sbFykfYUhSmRNwp2QuYzM/tD1cRyU3ODHoH
 N4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=X7kafgaMfQc5QAZ1oOLiQg/P0i4Kp4ckcP/YfJYFTgA=;
 b=44yKi+Q4rA+QT5iw8J+QokcNKxxLJAeVVYYI2ZqmGSdwaQN5TgSAvdfbgbKI2u6zp1
 dGLmM86dExpXQEvrFIrDFR7jVT9C2czQbPLr9WYJtABIVpP+hKC9fhl8ELZJ/wSAhkEo
 efWKJBZU7qmr3L9NiHLF947UZPGGyMOsn3qOyZYXSZXRI9UQN7ZEyH/ZMovtEO6zxuPl
 nyJG0A12tiajUgGeTiTeSkQzkebMQpzVqYKZykDGHbIWIrISEoU3bodCcEVZJvYldh2H
 5sUxp2lxubdvlnvw2ze2MtQgJFviTKnPHuimXrLOxh8gMtrws5m2dE1VV7jQ43/tlvAd
 ocmw==
X-Gm-Message-State: AOAM531jcJgfWC052o3eBUKN65husF0twpDtwpnXmvfAoIjG5As/NuaU
 7FFe/ar5O7LshfbsnhR85+rH7A==
X-Google-Smtp-Source: ABdhPJxpsWopDuK5MHxRdfVLXuUpMWPCM6xPemZUxztvFdN1CMDp0pkjul40RUcUgoBTLG7+Ba2VIg==
X-Received: by 2002:a17:902:d505:b0:142:175d:1d4 with SMTP id
 b5-20020a170902d50500b00142175d01d4mr78063536plg.50.1637340296664; 
 Fri, 19 Nov 2021 08:44:56 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c4sm213874pfl.53.2021.11.19.08.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:44:56 -0800 (PST)
Subject: [PATCH 04/12] RISC-V: defconfigs: Sort CONFIG_SYSFS_SYSCALL
Date: Fri, 19 Nov 2021 08:44:05 -0800
Message-Id: <20211119164413.29052-5-palmer@rivosinc.com>
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
X-CRM114-CacheID: sfid-20211119_084457_847075_975B4612 
X-CRM114-Status: GOOD (  11.61  )
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
CONFIG_SYSFS_SYSCALL the same way savedefconfig does.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig      | 2 +-
 arch/riscv/configs/rv32_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index a6cb99cf4d3c..96c2a3615bcd 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -14,6 +14,7 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
+# CONFIG_SYSFS_SYSCALL is not set
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
@@ -143,5 +144,4 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
-# CONFIG_SYSFS_SYSCALL is not set
 CONFIG_EFI=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 8a57c940d5ef..1f6808aa1261 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -14,6 +14,7 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
+# CONFIG_SYSFS_SYSCALL is not set
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
@@ -133,4 +134,3 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
-# CONFIG_SYSFS_SYSCALL is not set
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
