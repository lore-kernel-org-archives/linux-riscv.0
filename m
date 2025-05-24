Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982D0C54ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+Wo+xuZ7XxKWy8wSSsWt46DBB8Y6o5l6dOn2WTpfJs=; b=InPcAoHHggkzE3
	t6lsBsitbcw2vS33I6oUI0/0m0IdPKcFAamKGaDru+tHfrNxO0mOon7Z5nbALEGIn7Dn66WwoyM28
	yTa4CshlkojRBtkeGXRKy2mJFDbSovWMaX9M0pjzxmkQGeG2mRY+p9NVlNXIE9UT1qVutVfTyF4Qf
	4JgFIbs3gIJ+jW30ulpDEf5iXhEpwL7SIeAtj6iWgMOT6jQeVGYuTRNEtMgvoW5ocaclBkZ1fwsUH
	4VWkjlJJInWESi8MYenfGOArVT+4vq1M3f8beFY84ydCpNqStMEt9qVrYjXyMIMN7ieNfDJ5totE0
	LKIkKg+5Mjbq88sGMYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrDv-00000005yGu-3BiF;
	Sat, 24 May 2025 15:55:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrDs-00000005yFf-3dyH
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 15:55:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b26f01c638fso689885a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102144; x=1748706944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FT74bOydnUw1XVZ+DksJusFTfOc0V0/ESQZbybugO8=;
        b=Czw0syeCf6RZR2GljJdh2ZwzIZKylhY3uMMwpBKxieMKc44nVDhX3Qng1dEgMRITmN
         soZq5e/jXTawvO5MM0O9MjgJrvzfvyT4fHuBABlWe3LD71BUigfGuwmPNsiU0Y2eTf1c
         UZyVAnpfccligwSMG970+lSHh2aZziLma6qRO2AB11JWAefVH27IVCohDH0rIY8QR113
         UzmlxotMPhW/nPL2cVm3WW6eFBDhuoDoeGSdEOO9dLjTwLgKga5xdDe6ulpJMjO7hB6U
         T+6JsIKL2lzxAS1k80trP9PtopHyt9Et3uRkgwxSOi8saByEh2c8yRX9sLkpL87S609x
         MTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102144; x=1748706944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FT74bOydnUw1XVZ+DksJusFTfOc0V0/ESQZbybugO8=;
        b=Wgu5rrH3qVc+VH8eZ+0Z+r11uqNe5T6FfhdYN19XJaD3ergmQ08Q1NsmuglcDSCd7h
         yfJnqQx4ba7A7Wo69FsfHpKKyDJ9xKkNZhx+51Xk0xIrfcBxlfxivVnmm4AfoVcrtjuQ
         VKvf/WD4Tgy5d5F6oS2d0ornJXgVD9tgyYzG+xoQaLIKU0C1JWLcV2q6yVdHAaG+qgA1
         Uo3jS06VeGWCVyg31ZxNWpKrfE1SgaNC8MzuHUfHhYz9AEPjXQNEs8s9sGjMgT29B0bi
         tdLPXk07Bz4f0GQo7qHLIZsmVaRpRrMDsouc2lIsW4aZ/3ZNOb90UZy0KjTroX+v7mUX
         yXLA==
X-Gm-Message-State: AOJu0YzZazbXlrjdDGXxxuAYqf5rt0y+j1W4sruOenwpxv/FWjPwldkR
	0leJZTtmZX9//4DWfP4UO/lnAol6OEndGj5wB+Y0ZwJ+UpJIpGNOkCnJ
X-Gm-Gg: ASbGncvZgCoKIawXx/e7gnXuQsQ8RPxvpcbMKA2vbXk0mQro4whoE3DyrU9w+FALEvE
	lXQIYfZPEeKpiY3NN7kInLWRbiyhZsasYm18fjqku1mlf5x7ulCxdSJgT12UKUa3QFFElDcryUf
	/1+7y14Fe/FcEJvHi/KFpHz/qL0aDD2tGWMD3PYsZaJruVRYCvFelLLlWPGIU5Zpyob4wfYybgU
	WQPqKaOHFNvGl+jfFYWeZutlmOtX5npwhA3MrYrIaJQXngmmI9aLSCDC8YET9Kt7/Fdb6BYsGku
	J+/tEo1OgqsQ2j9uvZphvKWWx/Pp3ErmjYaLLWW02HQthw/G0StrpqkEnuFuFql2uu3uoefQeSI
	cIy3PZQ==
X-Google-Smtp-Source: AGHT+IEMc+IyJuKkp4oh/MfbC7nxhyOBDtktmANYUsWS5HqqsjVoXbsdcZhXdFZe8Q2T0aebh8oAAA==
X-Received: by 2002:a17:902:ef43:b0:231:c99b:9fd7 with SMTP id d9443c01a7336-23414f6e667mr51686015ad.19.1748102143957;
        Sat, 24 May 2025 08:55:43 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234396eaf62sm1200745ad.9.2025.05.24.08.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:43 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 2/3] riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
Date: Sat, 24 May 2025 23:55:18 +0800
Message-Id: <20250524155519.1142570-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250524155519.1142570-1-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_085544_908976_684F4CAD 
X-CRM114-Status: UNSURE (   8.65  )
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

The binary GCD implementation depends on efficient ffs(), which on
RISC-V requires hardware support for the Zbb extension. When
CONFIG_RISCV_ISA_ZBB is not enabled, the kernel will never use binary
GCD, as runtime logic will always fall back to the odd-even
implementation.

To avoid compiling unused code and reduce code size, select
CONFIG_CPU_NO_EFFICIENT_FFS when CONFIG_RISCV_ISA_ZBB is not set.

$ ./scripts/bloat-o-meter ./lib/math/gcd.o.old ./lib/math/gcd.o.new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-274 (-274)
Function                                     old     new   delta
gcd                                          360      86    -274
Total: Before=384, After=110, chg -71.35%

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..f085adc6f573 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -95,6 +95,7 @@ config RISCV
 	select CLINT_TIMER if RISCV_M_MODE
 	select CLONE_BACKWARDS
 	select COMMON_CLK
+	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
 	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
 	select EDAC_SUPPORT
 	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
