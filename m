Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D950C83F03
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N+3g8qGThEf2Lx9nWny44A6EGJowPIgDF+HSHVTkoCc=; b=ODZfwL6QBbhhS+
	BqBbSU4WCXAfyMcFAO1u283jEp4xlGovZ0EBNI//pXowEFJ1SpzhlIgyFGpGwvYaGRXniPRIOkcZ+
	1W6xrVCdj2nlxcIY7pt/Qtbyf3keCE5Ce1CRPsqlDAsCBJaEZ/rnJncUCflq2K5v8HSK7C+LYhrb9
	LzF0llfQBn0lZsYxuaEmP0Oa1UXG03bnv7b9QoOdxceDJ2L5kyMAiRrgIbTezhpfOUzh67/51RfgT
	2DqQozi5mlfNWoUdEMyqopl1JN2NTDVDqStxyfAGJ/YS3ZjMGJxmjOapRJFHiZfYqVyRIFyjqJwtY
	wwj4gaI1o80+qGwJErxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMD8-000000006AG-1WZn;
	Sun, 06 Jul 2025 10:03:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYM8m-000000005hB-3udo
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 09:58:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-453066fad06so14515455e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751795911; x=1752400711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6xlWZG3q339ZhjZezaZxN0+SbBnE2IfVSlIzuvRhdw=;
        b=Nc0+fpbZelc7Maf/VdSXuYg326/+G7XUdDtlf4okO36Rn/xu2GbUc3ok0nU69TNfBE
         RI4JL3ORGGuHZ2tpk9nBAgNgPIkD5tz2HVMOoCvgw3DGeyCXLuyj6VCNeRHDXQjXqeou
         M416ZBYB3DDRYu8t4+c38uv5kQdFqUoxenYgsWTDW80zetD9+FMnfrCR/i2Y7cKZN9Le
         XET+nAi1F9fX4nmXnCoiJJ+kKWDyLRvXJR/LShLvpLmMRJDd013r4M/+qIUsXGRcU8dA
         WIWsdNBBm2Kk0FMI6mc8pNkY94fg2iRfVCXcileLpNuOZvTNyFjYPNXG2KLnTu7mhTY3
         xDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751795911; x=1752400711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6xlWZG3q339ZhjZezaZxN0+SbBnE2IfVSlIzuvRhdw=;
        b=Nvaj+YkRBB/0/ziZLBntyFqYJmnfF8REp6yIqMYGVCJWCZCNCYJLnnJn9FtW/6nhNu
         RFvujC70skikOcetfORi7JNIKY41wZ3LY536q72SK4+95BCbDYhKz08cyq7tA/J/nOAL
         M6UutzEzBoTFUoG3AJ52QFCT77+py5BiidJBxUyjI4b13MZz1pbHaKzeJ0binIK7T62c
         yLsKVLkTovY4qW8ztaRpBVTPYhWH9acfTT1b7j6pw88ihu1DqjoiwlL+1qNs+/OnX42O
         oRtxEKheKJbwi09kTkyIvYpHqMUejFwWlyhO4eXTmQ9GLfTxA25YMbwHgc9AbLnr+VIs
         yUbw==
X-Forwarded-Encrypted: i=1; AJvYcCXa2djK0Pf7eBKa8f2T4zp2GgZdHt1TwqoKYXAWce0bijlXVnEBRCWJhkVhQl3sfjKNLXv7E4E9MvG2pA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwQoJxWJ58+f+2CdPN8L6T+E34vM806CMUl3xunLiTd3vRXPOC
	sthkUXGaIU0Y8AL6kchWTb/HzCjcEv/pODify+ZIYVIQvnQebQFyJMeB
X-Gm-Gg: ASbGncs1Kz2l59KeBamztqxgIrnRhdhKpFYWnZahBFhkVCz0P0kIdulkOBbWsl37ds8
	FT2XendUxa+MTdgcCfRz+g3pCS3wNs5OuVojy2RTikui7ET/8ntGtHBXemgP7xeyyiK5DSkJADH
	kFlOFMYh8FhAcrLyRj9JqBnr3gAk3zL0y81yzRNlMzTOWfDwNvFNfgSdQqyO4Vz4pTznJ644Twm
	o0uDjuZDOaspc4dzsN3S61B+cF15iI5afpePbqtOerfqHaZij1s09NJV9AdAwauRQfPpBg7Uhdu
	p2lfz906vrYktV2RAwSc/ppuBqtNecO4KnKbMNtpomsTc6dczXeaS1cyjeMLdzmCSyfG0njiZZq
	t0XgIMkcAP76g
X-Google-Smtp-Source: AGHT+IHZdVWOTtzoX+RsBOk9tza7IjFpr/bV5xAEd4ydpEvwXI75CZ/v/no7rHxxswCEr+A3+AJ6XQ==
X-Received: by 2002:a05:600c:a06:b0:450:cac5:45e7 with SMTP id 5b1f17b1804b1-454bb7e777emr38245405e9.1.1751795911027;
        Sun, 06 Jul 2025 02:58:31 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969a8bsm107598805e9.2.2025.07.06.02.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 02:58:30 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: ardb@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: gargaditya08@live.com,
	jonathan@marek.ca,
	kees@kernel.org,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lukas@wunner.de,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v2 1/2] efi/libstub: Print error message if efi_allocate_bootparams() fails
Date: Sun,  6 Jul 2025 09:57:00 +0000
Message-ID: <20250706095705.1386-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_025832_986797_98D05836 
X-CRM114-Status: GOOD (  10.55  )
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

From: Khalid Ali <khaliidcaliy@gmail.com>

Print error message in case efi_allocate_bootparams() fails before exit.

Change the direct call of efi_exit() to "goto fail". This allows the
general error message in "fail" label to get printed.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cafc90d4caaf..13d8eba06e4b 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -824,7 +824,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 	if (!IS_ENABLED(CONFIG_EFI_HANDOVER_PROTOCOL) || !boot_params) {
 		status = efi_allocate_bootparams(handle, &boot_params);
 		if (status != EFI_SUCCESS)
-			efi_exit(handle, status);
+			goto fail;
 	}
 
 	hdr = &boot_params->hdr;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
