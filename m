Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD88CC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJckCouiw5HLiBLTcms55h6HdW1fHcOxBOtvosyAsdA=; b=rsR6uYvsZvjyet
	Z8D7GQY6Wh3UX8WuuJfZIaSWIvZG7pF+2e8Q7BudJMhKigJcabbPY9tg8bZdqBiqLD0ALSKhI3cOO
	AYVZRyjQuLPHKX+vZkLTA+LhJUKZpKCfDswFucdp/CvN68lgorTu1gNa+M3mWaslNnawE97kpMUcJ
	4XNn4FMb+XrteRI6VfUfZlQxUTotmHRllksbMQRrrHBtBrtndh986GaJA+r0dKv0pp8jA9Y3ifTYY
	UeVTswOqu6EnmcbZI7STgSep3cnuRW2m94APZ1HRvit6po1i9LMJG9ZWYsyVdk9thlMr1j8rq3Z+f
	/RqnAbAfm56WykrwtB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxwb-0000000CmL0-0wfo;
	Fri, 02 Feb 2024 18:07:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxwY-0000000CmJc-1cVK
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 18:07:15 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e02597a0afso106677b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 10:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706897233; x=1707502033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Yyrip3T2gRBwGLvYCLpLjUFISir/avz/b+c2luLHGY=;
        b=ETpc2oaJAbtqb1RPkxXv3S7VcgFQn2cFzWnRwuTx/sVKzG4Jlz/Mdurp/s+PWB5gS8
         TS1pAI7U0LS0ElqTvq7T920rJaOk4KIygko+G4fDP5qYv+ZZMFY2z0nafSar8zlI/geY
         5GMhl+QcbuUNBQJl7U1icyTCMBuOYvQcfkKDD7KYhn/qbn/AxIjc3FbrVVJPDkIqL3ri
         eFdyf9jGdgvvWFi2UxmMG2dUuJXqjlW91wNHKUEdB+b1ZbCHH2oRisr95p0y21dwo2SV
         g4o20ikhVwRoFLyoAZYHYn+8XmVkGHlc3bRhZQCjru6/A7rOgA/nPHZCia+CPeQUxG8f
         PKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897233; x=1707502033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Yyrip3T2gRBwGLvYCLpLjUFISir/avz/b+c2luLHGY=;
        b=LjZX7TYBm2DxV2NoH6UVt7XiFqBoV1E52uW9CLe2drAwDVGRJ8SSnlcPLvIbA/c6sQ
         gj1ixWwQc5OWf42l+dXOUQGVdZP09JXZ8QoaKZjQZ1M9dCiJDmrDh8PXXACBmXDxcYyu
         IFv7YaY90RdztuR3o9EGzNxB044+p6e6BlfJmyxbYI84J9nGwpw8VDHqesKNXg5zRrEx
         q9erPZZdsiUUSqrW1PBlvQJSpQ+ZduiavLHb+Knw2zdlNe2utFiSE7/biQ8HK/e8vcrR
         6I+ExHIyG4az5nWQfySYhbvaAoF6s1pzRjAcOi9FaAM6YNvuIkEAf31KEqORqxANoKTf
         Pauw==
X-Gm-Message-State: AOJu0YxArdRjTW46ucWpCX2bZVWrzYqEQwnv7Wj+b4ljL7YW8COnjV4k
	q+65oar3iWoiUYW0bwZe5GX9TqKFSfCJIdGnse94OmG2chRX21nwU3X1ysh+lII=
X-Google-Smtp-Source: AGHT+IG+xYxv+LwajPk4C5nz4DY2qxbK7PqAKE+WcH5FBlppsmmhxviIkgQ4jI0JLjaR+O7wz2Jigg==
X-Received: by 2002:aa7:9e11:0:b0:6ce:751b:81d9 with SMTP id y17-20020aa79e11000000b006ce751b81d9mr3346175pfq.9.1706897233322;
        Fri, 02 Feb 2024 10:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU5uQRhhNr4F5Tr/eDx4VZKGJkZm2fFKhzvmErVJFdhN1keJw/2/IIbPia/PAaM3mkVII16Nt5yvabl0M3Zh8DUWKa04jN+PvoVj8IbhmJzrBJJb9Arr0kaYy98U+F3QdLE5FXpj6PMaQqSExRB9qZR4DdEU4G0klU6A2Yo5YCioE6HI4Uq69jHHuQmm1KAoMudrIvnpqJDFjQ+aG90RJGeKLQrNFSBnP1dKqm3fulhCWqUkrdAXfbWK+vNySD4eg8DV/zQ0+5yqh++
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b006ddd31a701esm1989267pfe.19.2024.02.02.10.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:07:12 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH v2 1/2] efi: runtime: Fix potential overflow of soft-reserved region size
Date: Fri,  2 Feb 2024 10:07:03 -0800
Message-Id: <20240202180704.808766-2-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202180704.808766-1-abrestic@rivosinc.com>
References: <20240202180704.808766-1-abrestic@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_100714_449797_EDEBE5E5 
X-CRM114-Status: GOOD (  10.86  )
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

md_size will have been narrowed if we have >= 4GB worth of pages in a
soft-reserved region.

Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
v2: use u64 instead of unsigned long
---
 drivers/firmware/efi/arm-runtime.c   | 2 +-
 drivers/firmware/efi/riscv-runtime.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 83f5bb57fa4c..83092d93f36a 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -107,7 +107,7 @@ static int __init arm_enable_runtime_services(void)
 		efi_memory_desc_t *md;
 
 		for_each_efi_memory_desc(md) {
-			int md_size = md->num_pages << EFI_PAGE_SHIFT;
+			u64 md_size = md->num_pages << EFI_PAGE_SHIFT;
 			struct resource *res;
 
 			if (!(md->attribute & EFI_MEMORY_SP))
diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
index 09525fb5c240..01f0f90ea418 100644
--- a/drivers/firmware/efi/riscv-runtime.c
+++ b/drivers/firmware/efi/riscv-runtime.c
@@ -85,7 +85,7 @@ static int __init riscv_enable_runtime_services(void)
 		efi_memory_desc_t *md;
 
 		for_each_efi_memory_desc(md) {
-			int md_size = md->num_pages << EFI_PAGE_SHIFT;
+			u64 md_size = md->num_pages << EFI_PAGE_SHIFT;
 			struct resource *res;
 
 			if (!(md->attribute & EFI_MEMORY_SP))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
