Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF39BC3601A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fOxK0Wg/lvLexDL0fFaWdF/iWw1VSxUIxFTanGIGESc=; b=Ketw5ey/rQWMZ4
	DJM4s5187ANzrl6W3s554UAQ52whFbem6GJnOYYJ198wWYNRNTOfILmvuzKfwj/5v5g0B7xw1QlJ6
	Wgt1einaKOuPhSDomDkL3Fz4rI2+1jgQDYSsjDwsYJkCmthWMlwKqjnvTxIQ7Qu8rO4eJTcP6DccN
	OFq33cbTOi5V2/U1HeUWS+7JLnGSmApu8sBJu/VX2pHM4pVSe52NbT6moe9ocgkRaQCdTkbJMd1zl
	dmSGghEF2KSF9D2K0EBjQXi4gBjrc8YiblvoTUtvUoFnm3H+yqq5SKdupaF6L6tZuup0Wf+8R+1di
	x0TQzqaYNjSY+i+TGmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYg5-00000006Gc5-0Eu6;
	Tue, 17 Sep 2024 13:55:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYg1-00000006GbE-0628
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:55:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20570b42f24so59430175ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726581332; x=1727186132; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Nh/rsC7LqGAVVxcM7ZCP9b/FJZsDLVjGN4Nx3v0DXQI=;
        b=Bt0flpODuWj1Tsoh2K7m3LTQOop+irdRsH2cztHa29Fin3opmJ7EVP43QHBjeo/32i
         J7qIQ6YXZli1TCyHPWFjU5zoFRKIubM2Q8VTKCGUiyevV0W/B04T70FkEMqKaq0z8iAx
         IJVBqqthJxVfzkILrHjSA+e2LM3IN62QQoU56Q7xt6NnMxF1hdOmWw99rbHE83ualMJV
         8uOJyt5FCbd3oht6POk6PINvW3njUSWzkoCV9lR129pWUFEgUHAD85S3CT1tOJGcmJPG
         MRbky4hUB57V38fy6DyT8Me+q/LTVhQN1/BPEI6IDNVL3Q6gkisAtb7/S5QjvOd7QeZX
         D6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726581332; x=1727186132;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh/rsC7LqGAVVxcM7ZCP9b/FJZsDLVjGN4Nx3v0DXQI=;
        b=kXwuPmgwA9NR/EeG3MJLEqTNf2W5NW+2KNtWU3PC3r2OLqpAKW2gHZqu1mGv2C4MTE
         KqtolISEvSYBC6SM39mxuUDz/ACh+FhAdIG7aZf22ISVk0FStRhaoNTNQ8pvH27LZlOS
         XPR/NUPGJlxYQtpujIBDcH0jgCKjv31rptw4QCBx+iJ8BGCp9OoAzOBd0Q0+5XMijwgO
         tcEz06dLSPWrEz1CWQDiwz8gCFOItYtELSdNyw3ciQgz4YqTg1J03g4oorIKENIjOBOV
         WRX5jh+9nn1usG63YpP2v2DqVqNeULmcURXOXeEcqvtI8fJ1CEbuvVo0932cyfTVhcRX
         oVCg==
X-Gm-Message-State: AOJu0YzSRJNjvQHaR0lYlaQuzWPc7hg6PfXZ8Jx8eEUy3qSCz4QhAu48
	UEe/Ugx8NtgGPQdGX5+CclXGGzNAL0z9Rjq4Cvm0M5cIWu0iplwpmzKc6HNCRy8=
X-Google-Smtp-Source: AGHT+IHMnuMzFMjsuZuSooVhsOrb2v5b2GZiEnFMBEDTaYts88ymlygFJ0qO/YtO93Xl/hPGJpUHzA==
X-Received: by 2002:a17:903:234b:b0:206:b8b7:85f with SMTP id d9443c01a7336-2076e315600mr116673185ad.3.1726581331765;
        Tue, 17 Sep 2024 06:55:31 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079473634esm50586615ad.262.2024.09.17.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:55:31 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Schedule SBI-0.1 for removal
Date: Tue, 17 Sep 2024 06:53:08 -0700
Message-ID: <20240917135308.24997-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, ajones@ventanamicro.com, schwab@suse.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_065533_088652_9CC9E685 
X-CRM114-Status: GOOD (  13.65  )
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
