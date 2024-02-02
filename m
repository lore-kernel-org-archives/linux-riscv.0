Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C39EC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVuxg+pTcgGTiJUinnJ8/3INWpgxZBOwGA9xgcZPKjA=; b=cNVp8dc9ruFf14
	evw/t2sftmakVyejuFC8ezO/WkSsXvpmTtLWJQq6ARp3r3FUlbyT6glv5EXdFmqpdMSvBEuIc1nvq
	fp+5/cVXeXf7ltOtka9yPKWKLJYCxUC1E02pTY4INRgDAdgVxJJkDVZ+gFQgUWVW6YNLapL9OLJv/
	Gbd7l2/O435SddZgG9fajezp+xtRITXADsdJGs8emjMpcpSi6WU+PNmjVvVO/wYL5BQiqn/FhQ+VU
	Qkc+6hkWz7t3RgDDNQtT1ACDfQWN8QW2MEmIOHRnVgavdXxD2naPen6j5zie//CCrkY4TlChQMrpQ
	qQyEckPhP7mEFjjcBV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwVD-0000000CL77-1LIw;
	Fri, 02 Feb 2024 16:34:55 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwVA-0000000CL43-0KAh
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 16:34:53 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5ceb3fe708eso1759486a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706891690; x=1707496490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bqv6IbT5YBrkVHXBtAcPOljl6IyXNltBMTpBEU5EmMk=;
        b=MgLshdPapf5TqQlZYzYoZem3f61VEpCYiscQX3PrVpMyNnGB8ApsWazeM3W1gw843G
         AKYfoAjQTO0kqVSHDvYLH4KMkQYMKcJlcSx8B5LbqY0GiSfX85wzKBtX3TIwWiUuDcDl
         CvEQHvz9a8NcYaV1bdvMqZdAAv1T8UuqMtFu9SLL/dyx0/i/YderhHhpAM27UZo6PvdE
         kEygdpb9HvYPe+261epDy4BQUFB5BROICZoNp+CsaxeXyZ6vHb2zrDuiqELfzhKMdAeC
         W04z7/Jb2pEQ3CbNID7q82GJecin8+OqrhXnSfl5rQR/pp3tnKIYNTehmHwOOiYwpF0K
         Od8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706891690; x=1707496490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bqv6IbT5YBrkVHXBtAcPOljl6IyXNltBMTpBEU5EmMk=;
        b=NVFDfaGpW8JikRRDTlh8VNtbPQBPaFZkFxS8NTYZypO3Cl7hcqOZznUOzZrRv3LCHo
         jqlhiIK6EMnB+GFlff9vNPLGK+fQgx06k/W2PPE/iFL8ForYpPNbqaI1Y0xqOBFG+hv6
         0Rblr/Q220NA8lU8TX9li5Q5zi3KARUIcRruWKLHEQKHfXfeGvLP3rH9wNRlSi/TOPgr
         qk5g/fa96Fmr8I80/pVr2DaIP1hmF/PKns7xhh/bj1qIzPIcyqhZwcWo/XAOtSNjkgJn
         I6N/NfASfi7B5qPW8eMVQV0FbHfY6M4wA32QHTwrRqQFGjDfWxnqN6Xu4E2k23aM2K34
         25AQ==
X-Gm-Message-State: AOJu0YxTbuHMqM1EyLMYdEnRnHtXC/KmRF2z2ygoFSU1WKDPc4lsf7zk
	svZtdVgVNzS0OWo/Dq2whQlApI7r2lzXlCWAd1YbM2NDmgFdyIBhR+OcWvW/La4=
X-Google-Smtp-Source: AGHT+IGqHgU6dK6aj/33iDUN8jETVP+XvIewbJ5TV+sTPM+PPxaI5s4OR+NQbwDplcZetb8cpjDR5g==
X-Received: by 2002:a17:902:848b:b0:1d8:fcac:eff0 with SMTP id c11-20020a170902848b00b001d8fcaceff0mr7497653plo.9.1706891690057;
        Fri, 02 Feb 2024 08:34:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXMrpNV1ur1ZaUXyBREl/idQhnbrCLLbzfYUB6Yw5ZhB75G4Q5ZLpVuL60eFiSgHyQig+jkiOD/tHdIOzF+cK9nOkO9xQbFvFlf2pFBL/0ugpZBj5vBMrmBZNP44ch2ldgxCpOPavoC0ailhrqy3fOjDKBt9FTts48VbvXKCAdPTJ2pfBz1eKjn44ykacO+n6SixsVEAeA8I8Gcqw0pDXijksNLSVozgSD3J5gq9FQKAb4MDVqjy3mHagVLPo+ZjqteleNjFQnu52Zh
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ju15-20020a170903428f00b001d75c26e857sm1784870plb.288.2024.02.02.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 08:34:49 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH 2/2] efi: Don't add memblocks for unusable memory
Date: Fri,  2 Feb 2024 08:34:33 -0800
Message-Id: <20240202163433.786581-3-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202163433.786581-1-abrestic@rivosinc.com>
References: <20240202163433.786581-1-abrestic@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_083452_170115_7BA9CC49 
X-CRM114-Status: GOOD (  12.39  )
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

Adding memblocks (even if nomap) for such regions unnecessarily consumes
resources by creating struct pages for memory that may never be used or,
in the case of soft-reserved regions, prevents the memory from later
being hotplugged in by dax_kmem. This is also consistent with how x86
handles unusable memory found in the EFI memory map.

Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 drivers/firmware/efi/efi-init.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
index d4987d013080..f05bacac89b7 100644
--- a/drivers/firmware/efi/efi-init.c
+++ b/drivers/firmware/efi/efi-init.c
@@ -24,13 +24,6 @@
 
 unsigned long __initdata screen_info_table = EFI_INVALID_TABLE_ADDR;
 
-static int __init is_memory(efi_memory_desc_t *md)
-{
-	if (md->attribute & (EFI_MEMORY_WB|EFI_MEMORY_WT|EFI_MEMORY_WC))
-		return 1;
-	return 0;
-}
-
 /*
  * Translate a EFI virtual address into a physical address: this is necessary,
  * as some data members of the EFI system table are virtually remapped after
@@ -195,12 +188,9 @@ static __init void reserve_regions(void)
 		memrange_efi_to_native(&paddr, &npages);
 		size = npages << PAGE_SHIFT;
 
-		if (is_memory(md)) {
+		if (is_usable_memory(md)) {
 			early_init_dt_add_memory_arch(paddr, size);
 
-			if (!is_usable_memory(md))
-				memblock_mark_nomap(paddr, size);
-
 			/* keep ACPI reclaim memory intact for kexec etc. */
 			if (md->type == EFI_ACPI_RECLAIM_MEMORY)
 				memblock_reserve(paddr, size);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
