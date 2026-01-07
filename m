Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBE7CF6C1B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JxtLJUIMyoLVTPtUPMjIwNdC6Ieq9VjDd/iX5v/i8oQ=; b=SUmCc9243tqSUC
	MhuCTM+3+T6r1+pCi+0sbOKzPP5KRc1bvPd1Ri/FX2IuH+JGjjn699lYtuk50+l79FlyPbNCi8B4u
	TSpzZ8VlrIaPfvhiDckoufEc9XA+7FD1X8BC0MQIPNr1hcsngDb26S3ic/9CEtJPOStC+Y1JraKAI
	XmR3bWBwKfUx2+TL2NZ9WAvhyivAJg7M1G8vQvZJrAC/M6yzv50XHrJxGVGdiRz87TwO32kVJY9bM
	BUj3JIgCa7b3lV+V7Ufr1UyV+7MLtoqK8KvM0nc7GAk7m5Y1gHkw2NkZ9Ie+GTdaqT/M4tsCIqwwI
	ZVSZlaRYch6IzgHzh3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPmQ-0000000EWHQ-02WH;
	Wed, 07 Jan 2026 09:24:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPmM-0000000EWFp-3ctl
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 09:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767777872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xO4Hnna/PM65GX4N7VWVTxlOrs/0fZlHLbFN32qG7Vk=;
	b=ILWAJw+gCTLMqiw35Q7Gu1XGJORWmENN3K9uRufzwN2wfpnUOLTK1egxK25cussvBa5FbW
	j/omsrlmcswx8T905hRW0HBH9CvqW92PzJxC/WbBtkgKxjr6CQwaISUIAIop+2Ol3UMKNW
	Yb+375jSnw/k220GWukfUMmJrApmFxg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-sPP8pE9mNJ-1t9ea6xUC7A-1; Wed, 07 Jan 2026 04:24:30 -0500
X-MC-Unique: sPP8pE9mNJ-1t9ea6xUC7A-1
X-Mimecast-MFC-AGG-ID: sPP8pE9mNJ-1t9ea6xUC7A_1767777870
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47d3ffa98fcso13229715e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 01:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777869; x=1768382669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO4Hnna/PM65GX4N7VWVTxlOrs/0fZlHLbFN32qG7Vk=;
        b=Zf3O7TPDNjbOHOyqeYPmXo+c9yw1XIdMLvKKit7ofBUXxVxLGLN3BGN3NJnD/0ueu/
         lAAN3FUxTLJjY8kN/0ieeBhml4Jq/xbbIOP1mlWmCnmEmcRRvA+3BWhTMXuUI/cOdMxA
         /epLJyCOV3gnG8kHl0dKZ4/mlAbxBaQB4cVvbZh2FxkzZyWZN+1EscCXvIx2QwDR6687
         4LIVoAIthwtyauBNDlz691zimNppgBAdU3oXVQnsJbLHBigiHAYSYo5mly+y0KE7VNfa
         XJomkvQ88F7jqDisChw8HZWIyNX+T3IHo7sdDu6pvO7hgEaFDQdADivbFjOnjz+FJ4cc
         Vb+A==
X-Forwarded-Encrypted: i=1; AJvYcCVl0Rnc8wQeWXTAE0/z1qHjehPaWBUB4qzG3aAVOP4WlRSeUgFyMa6jc7wC8RN2u1+yWlUNUDyzvvm8Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMkyAJ3bcIPfhMe/TKZzsSdYcw3NcZAoJFA1r3nCqpXNmdtOV5
	AnyGj8hmw9bff5wD6YHN4s9BN3/0bv8TfWzG/9YdkN9u9ZegBuyTTr0ySiAdy5X5ozZQxnUAkdZ
	GPWDr2xr5ytOmaL4h0s1mdauNQlYin+Q5Y76M0ENXku8s8mGLXLV7k1BALspBYNpM6xoH9g==
X-Gm-Gg: AY/fxX4ouBuBHZ98Af1/4qwdljJhy4TI8XNHHn46uffNFWZGl6xDF3GJeQ+aZYJ7BL2
	lypcs4z3fG86r8mFWHw0s0Z4Joy4kGcTP0jiKoCl33QJL3ls8uM8HmKWiMSsQMt8TaCLQ8e7uPd
	hKLqbhtuYzLxfEk0JOPjX2VDSsnSoJF5zNnNsVntS4KY8CEXlg+DH88OCJ0u/HVOPtWf1Wh+Ek9
	/oRbuOiyd0ZQNBR4nsHmhBdpSFlk9pxZsLYd1tk9GMJ5nisiL/SvD8vMD5B5N93sRKszLEbFJLd
	D2dy4poJ5SxV+HT5EUHsfDCFHHcrBJCIkHBx/+HbI1hH3YJqMjMftVymowmotIxrl+CS+orWAzr
	fLVJbZeSCZ3ob3NxtxJLDfYS/7Ht3Dm6EjeyOwzIHujRZybvUqOSv3BPB79w=
X-Received: by 2002:a05:600c:1e24:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-47d84b36a1emr18071555e9.24.1767777869583;
        Wed, 07 Jan 2026 01:24:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXCgkl4Ya1xSJ5ALe1DMRuwSunKAcM/y/jWJ477IQirZy8oG5STSW34j4Qf5OxTgUw/DTIdg==
X-Received: by 2002:a05:600c:1e24:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-47d84b36a1emr18071215e9.24.1767777869186;
        Wed, 07 Jan 2026 01:24:29 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e17aasm9343669f8f.15.2026.01.07.01.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:24:28 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] riscv: configs: Clean up references to non-existing configs
Date: Wed,  7 Jan 2026 10:24:25 +0100
Message-ID: <20260107092425.24737-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VC3V49TcVQYCsHO53wdz4xvo_gGAvQhNrX5s0oMiVzc_1767777870
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_012434_978877_B26F67E9 
X-CRM114-Status: GOOD (  10.95  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

  - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
    ("i2c: Remove I2C_COMPAT config symbol and related code"))
  - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
    ("sched/debug: Remove CONFIG_SCHED_DEBUG"))

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/riscv/configs/nommu_k210_defconfig        | 2 --
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
 arch/riscv/configs/nommu_virt_defconfig        | 1 -
 3 files changed, 4 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index ee18d1e333f2..544c52067dc2 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -55,7 +55,6 @@ CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_DEVMEM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I2C_DESIGNWARE_CORE=y
@@ -89,7 +88,6 @@ CONFIG_PRINTK_TIME=y
 # CONFIG_FRAME_POINTER is not set
 # CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_RCU_TRACE is not set
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index e770d81b738e..4a826e30fa3e 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -86,7 +86,6 @@ CONFIG_PRINTK_TIME=y
 # CONFIG_FRAME_POINTER is not set
 # CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_RCU_TRACE is not set
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index 0da5069bfbef..4c38049633b7 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -66,7 +66,6 @@ CONFIG_EXT2_FS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_LSM="[]"
 CONFIG_PRINTK_TIME=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_RCU_TRACE is not set
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
