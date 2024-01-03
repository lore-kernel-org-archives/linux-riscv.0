Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDACDC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryXD7mVBKIfcqytTfQfk9G/spvNCutjKxZkf2NwBGlY=; b=1Yum77OaJQcKO3
	vpEFAhuUQJ8H9XikOv4rc7JWF7jr7F1F6tLo6S4zwCQRBf1PZshCplfLNt6OO1J/8FFeOOCBxk5QN
	d696+s9/g0rtRtzra2aohEKBt4wQNxtxYI6fr0uiHC5mj7QxChHbHqyRnUOKHqXDf1gkA/Ehi9cBO
	8Uw32o1nt5bw7tdV2RMZ23Q7K3MoBxDc9A59/n8K1gtEVIDly/RQDVC+Zky/kwKgvYNHRwycB5mjq
	LDwZD+ixHCVgRLjFVUnv9HfM7BBV25VsBVrMqysv1qa47V1MecdYTHJEcaOdvYFsK1QiY0J738opA
	Sf5rKC1zraD2raPMWQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7km-00C1ei-2y;
	Wed, 03 Jan 2024 20:22:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7ke-00C1at-3A
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 20:22:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d4c27cd502so12369415ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 12:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704313325; x=1704918125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+J/P1s8879Vp+fzlyGqr2WWOHGZX3A10V1/imIkjd0=;
        b=ZZ+jH+PcSVgcrEVQjLoDGg6bAruGiStPJS9dIoyrDQYWkb7WXMRt8EQlnayc4nlgdb
         +dAGDsmDkvsDrXgJ9k5IRnciSRVdv0T95hkOh7JLjUSy5+skmmAH809M2IqysUyJlTOh
         uQajF2mzbDL+2HwcBNm3odyiL92oztJo+1K0yDEPZtSwwO2Clepm0lnplUiOhN8DiZ/4
         FFC2Gr1QfR0iob/J+8iL+SzQMRzuP9OuKKV11y3JumLogV+bqWGxlQfypznOQQvGlhlN
         /W25nncuI27wKMyQSQc8KSGLkRq9vs1BFdCLvyTnX97VLJtJ2xW8z6rds6xFFTWNXJhe
         ajWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704313325; x=1704918125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+J/P1s8879Vp+fzlyGqr2WWOHGZX3A10V1/imIkjd0=;
        b=mK1uzW6oW26EEJJ0DOJU9MQcIcSv2gcXqT13yqHrwatAeSsjjYDBoTz7Qc1IrCxVTf
         SmssFqzFBh2bCxkFtAOoOFuoHkuQtjCu6MMDZwkjQzHDi/68zLRa5Fdc6iKi5A5WOy8j
         y94NREqU+wnCKZW57KrwMjL6Di/+H4PcgATZUz/5YW36zdV4zYcIpG+tv5xlyzRCqyy4
         Nux5IlnKiSMqYOhpfiACg8wl5QLtvRNaXGrnSuj8QgsHf3YdoDsvzjNxTYzyICsOtRCn
         Lh3qLXAUEphDWUOn5YJYlF9YtbZWYjXct7Ga2Os1oEGB66qNZ6L+PFmBOgaLH9hgXBFz
         VRxQ==
X-Gm-Message-State: AOJu0YzD2+JqrdA9ulvgUFXJ0ejMjXa+wd9NmpbUCDIhvMqcRMiHjTil
	77+5dxhwP6jFpML3YxHKTVSlQlPJRmDvAQ==
X-Google-Smtp-Source: AGHT+IEDrbgjgNBUvvv9hWVeThqI6ijQ3EA3FWsa0h7uYxJIJYCUwnKf8WIXdqpmv94uscNsjpViJw==
X-Received: by 2002:a17:902:da81:b0:1d4:c2ad:8ff8 with SMTP id j1-20020a170902da8100b001d4c2ad8ff8mr2710218plx.34.1704313325161;
        Wed, 03 Jan 2024 12:22:05 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d13-20020a170903230d00b001d3fa5acf71sm24278739plh.12.2024.01.03.12.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:22:04 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 03 Jan 2024 12:22:01 -0800
Subject: [PATCH v2 2/4] riscv: Correctly free relocation hashtable on error
MIME-Version: 1.0
Message-Id: <20240103-module_loading_fix-v2-2-292b160552c9@rivosinc.com>
References: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
In-Reply-To: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704313322; l=2207;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=9/Y3gMnmhvp1aRf3YmkeyxHlGtG/ubuu7urxufGjwTE=;
 b=oEe24hSZfsF4mLEENjvlrgBmLszzS6CujSYHcb5xYW5WEK65TSlLI3Drvqi0xuE88wUYf0yle
 tAaS12iJPF5DN1hbXifh/mprzWl2DKH2wdFUJ5myCBMAR510KON/qKu
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_122209_015742_B6C80E57 
X-CRM114-Status: GOOD (  12.37  )
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

When there is not enough allocatable memory for the relocation
hashtable, module loading should exit gracefully. Previously, this was
attempted to be accomplished by checking if an unsigned number is less
than zero which does not work. Instead have the caller check if the
hashtable was correctly allocated and add a comment explaining that
hashtable_bits that is 0 is valid.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202312132019.iYGTwW0L-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202312120044.wTI1Uyaa-lkp@intel.com/
---
 arch/riscv/kernel/module.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 21c7a773a8ef..32743180e8ef 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -747,6 +747,10 @@ initialize_relocation_hashtable(unsigned int num_relocations,
 {
 	/* Can safely assume that bits is not greater than sizeof(long) */
 	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
+	/*
+	 * When hashtable_size == 1, hashtable_bits == 0.
+	 * This is valid because the hashing algorithm returns 0 in this case.
+	 */
 	unsigned int hashtable_bits = ilog2(hashtable_size);
 
 	/*
@@ -763,7 +767,7 @@ initialize_relocation_hashtable(unsigned int num_relocations,
 					      sizeof(*relocation_hashtable),
 					      GFP_KERNEL);
 	if (!*relocation_hashtable)
-		return -ENOMEM;
+		return 0;
 
 	__hash_init(*relocation_hashtable, hashtable_size);
 
@@ -789,8 +793,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	hashtable_bits = initialize_relocation_hashtable(num_relocations,
 							 &relocation_hashtable);
 
-	if (hashtable_bits < 0)
-		return hashtable_bits;
+	if (!relocation_hashtable)
+		return -ENOMEM;
 
 	INIT_LIST_HEAD(&used_buckets_list);
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
