Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00D4C48292
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiX/NfDWrDPwLbViewwCqvdHSH5GgvwXDRiTFzmutC0=; b=ZVPWR7xZIiTrXM
	4dYIcWL1/whjRQ3zLgDYNHZ7RTGypNn3V6obxjdkgknUmvIsn8MayC4U8f8LtYfjryF0Pgf6EVW7R
	6b2VZUktl5L9nIqasae+3vrBXYUxD2tDLCKN4mKhbhzPmvfJTGzio8jMoBxo0Avk3/NXqhcGPK9KZ
	ab9WPFaJPJRP1vjAGj7VmRljVTzpZFROAUXCUjUe6vm/ITGV9tc3m38IpO3ZclvaVod8joxFaieIX
	6H8UT7VfiU9Zn1FPDj5JDgOyxnYi9OwIj6AUZoUB5f8kqucEatZdlyNrcg+cOHC81f4d/SkNjCVmn
	6i/eULT1hJQhRW9juQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxwc-0000000CmLt-4BGy;
	Fri, 02 Feb 2024 18:07:19 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxwa-0000000CmKL-2XJ0
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 18:07:17 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6daf694b439so1833497b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 10:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706897235; x=1707502035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDme6jlnfxJTWCG7qW4Qy8DGvSmakPXAl9L2egvk9Cw=;
        b=yJ+cJT9PQ4ulz1T7bGqG0cRTUOBiw5aR7MWehMyf0pkKFh1zaXAK8aEBtJlUIOad/f
         B+8yskDS1jOJvcVX8L3Yz9MrcKr45k2F2mrhLNKdFSMOqVVQTMLTzuFg81hbHM8Xl3KK
         8ZU4OK9RPakldTh9IS+KDkgWtqlYeH7z9F/pCMmN8DS9rVDEAPxiwkPvtVyBy6ZsVlkc
         Wa6XqRnwGPryixxa5Tl0NqWZW73GU8H6bOvesztsFTzNQLSJoPpdeF+ti9GWC3MpYJ46
         40JZHRmqdp/ylbuA/ulG64xUHQ5qH/2lpIvnngLdkkdrTex8/KoHqC0JcrAQzCX4qRTK
         ybWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897235; x=1707502035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDme6jlnfxJTWCG7qW4Qy8DGvSmakPXAl9L2egvk9Cw=;
        b=jJhLumVQbtGCGAJceO2thattL3f64Etm0tpIa2/XmBvktbAz116JPP91dux6C/UYxK
         zISKzgm3jMIXCOEBdZZROvsVhx0DDuC5J9xQ+qRurx5oMw/A0ht/NszHW+oRMndjvour
         rZ2ombSg9tzK8A0+uU6Tz1AUc76+y8KeSls5i/nFzde/g4C53NDFlll1TijUjgdTF91c
         iRx7qQR8p59Uo4LpL39/afUVQGEXAq+e5DtlSZbp+7162Worx2nlkHVv0G+YQADGDgQn
         qNd9JetaIbjEBrJC4FjFm96+WaeZShWBcnjGeDpLIIffn4UmfT8y3fKkhQzvsTZ9Qla8
         k3lw==
X-Gm-Message-State: AOJu0YxXbimA4/79a5OLkE7m4WcIo6KQE6v1+jCEfOKzBrn8rF5qQtJ6
	RKOEVEOwjQkUswS73LuqnZtpErz0AqkhbWEjh8hjsPIqAln2h7FSt5UOYXrx6nA=
X-Google-Smtp-Source: AGHT+IGApjy1ny5FjS4Gq04ep4ZGH47dxEianIZwB0z+YLgCGzepTGWlWVGFhBvj0Leq9dER0TovMw==
X-Received: by 2002:a05:6a00:2d0b:b0:6de:2f30:9aa5 with SMTP id fa11-20020a056a002d0b00b006de2f309aa5mr10452219pfb.23.1706897235504;
        Fri, 02 Feb 2024 10:07:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUwNs/zU8/SXHjEg5qUkWY+fJgs2JKC5h3bIMxiFY66H4USskIUSM3fOxkdHpyh6sQ4e2yYOdz45C57EARz86REEZiCOCXWbA5Gm0Sypq6v9RBEWN+/mx4GuYvD6I1trxf3wKO1ukvU3hoffX9eTbINn/OcE3cSok4CavXG2l66S+no2C6S9fhUfvsxLFKbFDXcy3TWbq5Aq6sHseHObZF/cMmyc0nLCh8CIDSfRN4magWGtl7jSipLlkKKq5yv2ltHVt83sqeCYfeM
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b006ddd31a701esm1989267pfe.19.2024.02.02.10.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:07:15 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH v2 2/2] efi: Don't add memblocks for soft-reserved memory
Date: Fri,  2 Feb 2024 10:07:04 -0800
Message-Id: <20240202180704.808766-3-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202180704.808766-1-abrestic@rivosinc.com>
References: <20240202180704.808766-1-abrestic@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_100716_664616_05333AAE 
X-CRM114-Status: GOOD (  12.46  )
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

Adding memblocks for soft-reserved regions prevents them from later being
hotplugged in by dax_kmem.

Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
v2: only skip adding memblocks for soft-reserved mem
---
 drivers/firmware/efi/efi-init.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
index d4987d013080..a00e07b853f2 100644
--- a/drivers/firmware/efi/efi-init.c
+++ b/drivers/firmware/efi/efi-init.c
@@ -143,15 +143,6 @@ static __init int is_usable_memory(efi_memory_desc_t *md)
 	case EFI_BOOT_SERVICES_DATA:
 	case EFI_CONVENTIONAL_MEMORY:
 	case EFI_PERSISTENT_MEMORY:
-		/*
-		 * Special purpose memory is 'soft reserved', which means it
-		 * is set aside initially, but can be hotplugged back in or
-		 * be assigned to the dax driver after boot.
-		 */
-		if (efi_soft_reserve_enabled() &&
-		    (md->attribute & EFI_MEMORY_SP))
-			return false;
-
 		/*
 		 * According to the spec, these regions are no longer reserved
 		 * after calling ExitBootServices(). However, we can only use
@@ -196,6 +187,16 @@ static __init void reserve_regions(void)
 		size = npages << PAGE_SHIFT;
 
 		if (is_memory(md)) {
+			/*
+			 * Special purpose memory is 'soft reserved', which
+			 * means it is set aside initially. Don't add a memblock
+			 * for it now so that it can be hotplugged back in or
+			 * be assigned to the dax driver after boot.
+			 */
+			if (efi_soft_reserve_enabled() &&
+			    (md->attribute & EFI_MEMORY_SP))
+				continue;
+
 			early_init_dt_add_memory_arch(paddr, size);
 
 			if (!is_usable_memory(md))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
