Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813B5C3601E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fOxK0Wg/lvLexDL0fFaWdF/iWw1VSxUIxFTanGIGESc=; b=FRtwJLVoN1OUTH
	sK5Ntn8StbNvxJ10fSWIzqceO1Sgh84TRoD6WELoc2UEfHRX1xGBQHIBmHBYpWKNJtE+wbDy7k+OV
	vruLZi65AfZ0vbwuSEAz3UuU+CrdE/yErnI5dAdDAeaCCxGNgxRZM96sSoXgkaBOVlyP1ib3KsD3u
	Amxlt71c9kdqEe6JcVRcVQggxMpoA03BN37vm3Z0zBe++4NqBNOSToU7jPAFZtLqYVYttfGwFtRIO
	zAVK6VXbinOffIGtA+DzO48OWNu8c2OUAUtr9DTi7xPnRrkB4K2EcifqtMWH9FLPvXxrQM576Rh3g
	RvIkDcl5IIHnTr3U+/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYg2-00000006Gbe-1Eg2;
	Tue, 17 Sep 2024 13:55:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYg1-00000006GbF-1PvJ
	for linux-riscv@bombadil.infradead.org;
	Tue, 17 Sep 2024 13:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Nh/rsC7LqGAVVxcM7ZCP9b/FJZsDLVjGN4Nx3v0DXQI=; b=LPnUTQVqj4u1pE0Ii4+uPjymsq
	EFmYs8+guMQ+ez0TOIjDL83pQxEPaEYCMNuNOsgZcpyuTKrdwVVnmUaNx8FEi9azaYx8XWzk0d8DQ
	ZdFPmJeYxWpC4S6QrRSw6TZqxJYKnPXAfBZQ3l0Nb+DGXneVDxoF4nXcnOJcpoiKKS4vZY3SzsOrl
	Fo/Jtk3U4QTgPh0TAZPskeRoCBefNaSARjNHlxMaCjWiwKUFa7XSrFEUYyaz0LsRdmVYD16hjU+Jz
	gatrOl78oYUC8bnegiSPicgjfqkq3u81Koz5zT/AwVpOv044WwPq+5etmKUh+osoXjxV+Vv6WbVq9
	5MDMJbuw==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYfx-00000000ayK-3bSH
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:55:31 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71798a15ce5so4556782b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726581326; x=1727186126; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Nh/rsC7LqGAVVxcM7ZCP9b/FJZsDLVjGN4Nx3v0DXQI=;
        b=dxLCeVmJbVaM0fCCMO4lZEUhE1psIEVd85om68KUdvn6JMDnbatW2PORVnD3CId7eR
         mkW2pFkbatN+1WezPuCLT77aChIgw8fyZe9mY0fqjBRN4MRrkv8xcZJ0KbTZ7LAj73Cu
         M2FTXmC9y4BYrLIvCWPDNyP4ZqFxtXPNsyEbH+EGEmUhpbJYoKq6TO+Kv5T428H+6DvX
         Ptx1VJf8PUC1LTjizuEiP2KAF8KFqIyNqdRF73KNS4Oe3fnJ2H9oNKNdMwtEJ5mLX8XI
         dD45pXoSiHO4ZfAOYGDTIU12GrNRbzbDGVU34ZLUE5QbBUgO7aNFvhICm9Y2hazj3bHU
         XGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726581326; x=1727186126;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh/rsC7LqGAVVxcM7ZCP9b/FJZsDLVjGN4Nx3v0DXQI=;
        b=kN4PG5fWFkPnn8gqeUqiC+EIkfUCBTr9qJfPg1Qvq2seQgK1MRAFYd4ylhM9U6/xjY
         8oZusLBqATquFW14hva2dUZQFH2LzsyeWn61FwxWlE9WqzeD7mQdHKHxiXT2ozt89eUd
         O05d8IaIID24XrM7FmsJbDmf7EbpfAnNO6qD5svmQQgxoyrJ192qvL4xA7I2htpOshzp
         cYiSluq0WwcbSvkY001NZFGZ0io5MnMNFFJ5dKx4qAhpnHpQ14cWeW9rF5kkjCLT1vmg
         fYfdlzF5DDKkME1YdWcKAU/6NQAGoFtgMNqLQflHQCO/IGAJ2nT58Gyz0MbQuxS8HEsv
         oNtg==
X-Gm-Message-State: AOJu0YxWYCSffzG+uQhdHJ3WF/nNqxVy2CJu93d5TgCOuLqpdgrWR1b/
	dufmD/SPvD90qTKiyhDTn3kfb+eSPPgZyIeEyjHe0e5JNna+N5foPk+pNV4pxo8=
X-Google-Smtp-Source: AGHT+IGViv1YjvHPxsiBn1Hiz5rY1Sk1TAoz88/mggU4TPls67KU0YgAUHx3pkjgyLY+oHE9RCqVsQ==
X-Received: by 2002:a05:6a20:43a5:b0:1d2:e458:404b with SMTP id adf61e73a8af0-1d2e4584705mr4657738637.14.1726581326396;
        Tue, 17 Sep 2024 06:55:26 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a97e6fsm5216941b3a.26.2024.09.17.06.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:55:26 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Schedule SBI-0.1 for removal
Date: Tue, 17 Sep 2024 06:50:39 -0700
Message-ID: <20240917135039.23816-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, ajones@ventanamicro.com, schwab@suse.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_145530_133608_CAA6FBDA 
X-CRM114-Status: GOOD (  13.60  )
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

We've said we're going to deprecate SBI-0.1 for a while now, but I
didn't find that written down anywhere.  So mark SBI-0.1 as deprecated
and print a timeline for that deprecation on systems that probe it.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig      | 17 +++++++++++++----
 arch/riscv/kernel/sbi.c |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f00d474e13d0..fad197d5e122 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -838,12 +838,21 @@ menu "Kernel features"
 
 source "kernel/Kconfig.hz"
 
-config RISCV_SBI_V01
-	bool "SBI v0.1 support"
+config RISCV_SBI_V01_DEPRECATED
+	bool "SBI v0.1 support (DEPRECATED)"
 	depends on RISCV_SBI
 	help
-	  This config allows kernel to use SBI v0.1 APIs. This will be
-	  deprecated in future once legacy M-mode software are no longer in use.
+	  This config allows kernel to use SBI v0.1 APIs.
+
+	  SBI v0.1 support has been deprecated and will be removed after the
+	  2025 LTS.
+
+	  If unsure what to do here, say N.
+
+config RISCV_SBI_V01
+	bool
+	default y
+	depends on RISCV_SBI_V01_DEPRECATED
 
 config RISCV_BOOT_SPINWAIT
 	bool "Spinwait booting method"
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 837bdab2601b..1209a4e53ed1 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -686,6 +686,7 @@ void __init sbi_init(void)
 			sbi_debug_console_available = true;
 		}
 	} else {
+		pr_warn("SBI-0.1 is deprecated and scheduled for removal after the 2025 LTS");
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
 		__sbi_rfence	= __sbi_rfence_v01;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
