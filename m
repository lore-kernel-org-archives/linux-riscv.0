Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D152EC27C7A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+6TWnHrjBLJvdHCHtUNWc/fl+pFPvIlNwMt52I5a8g=; b=ZD+Liq1xez44MX
	AKRp9fLyc0rzMxwHCdxtFJfmDK6dcTCIMWKIa8W+6iXXk27ofBUqQzgvuEBxIVwzLjOA/+hxqTN1y
	GQzoPnT8T605d42t9RGVjQxvFazydviUDomTHm+le5WQOIFPDnKyR3Km3kwnO51MDMNmAOrKKB04f
	SWI1q6dwNVHcCeUF7TAXD+jgRWZlWu8WvHgjg6QKm6aK6w4juFa8O/6yMpbRgcXJNUW06RGABAc1N
	4tQ7wRi9LuTg71AMXOi+LfrFfKbP2Q9dxnNaCyGv/1aAF4nwwoiG8t57w6nKuOCY3mbGbHiov0Onm
	4EG/bjWDRQDHSzvua5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcl3-006Qoe-1d;
	Thu, 17 Aug 2023 13:09:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcl1-006Qno-0f
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 13:09:48 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-523bf06f7f8so8445706a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692277782; x=1692882582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dia79abijhqNuyOI1X7cuUqq5ei10OSh1lyxFY8ZqEI=;
        b=3nb6Lx91hP38MJ3GLl8uaDcXhmdsFacX63aBoL59zCMgJncHjeenKLbguGHpu3TTET
         3CAawoe5G94N+Zlg0PjwH+2WnqRPe3YDrJPMrPzQHaT0FI6oiSgOYnaIM2iiSt7hMkx1
         JXe0yDUxjjCa67x2MTZagetgaYShcRqgjxGBDh6Al02vtsCsgSm4dXmSnDNPl9g4DdYU
         GDN9edqu/82jOUuqLQuz2DVd3EWcnUVWvVVvY8SygZZ/Hjs1bXVaRZDAEu0IKkSVW6DK
         hx7/Sl76DMH9q2ilOlpGLf4ueapRgEXDufjufHMeOcHsnUf/s+wgpSVFP2vUZAuwQBHt
         dwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692277782; x=1692882582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dia79abijhqNuyOI1X7cuUqq5ei10OSh1lyxFY8ZqEI=;
        b=YkWkFYkepG4Hpl29JwPcSMPlvrtihPYpwb6e7FyC3D76kVqZ8ZpayFC2u5ePIh5KUA
         pq0KnJlK1nHieObnthZVtrmI9MwHz0MvAtLDLWL2u8CqmujwB9VSCXsOKVtBUJui3O8v
         rS7U4N7ZFJdaimRNtUJ4bpmL0y2hNCUYxUQuGmHuQp6wZB2yRu6Y/r4/+Gr8nCkRaF+R
         pgrfB/3fhNeckAh6KLr44AodfW0+IcAbuZnOfjA7nY7Jz57poRCr2yb/EvGVbOXE6nbD
         o5zYeXOEgo6dfpFMRZxnftwstE0kL0PzEDBiKZOepmyUe/ELrFzc/MLYnC34r7+TFJBK
         8ywg==
X-Gm-Message-State: AOJu0YzGGfJqGGRpKhDcVN+OtmO9E5/yK+9GTBjJfLCxm0yyr+7qRDr+
	WvobylTYr3VrgCPzTFzdMFQg0Q==
X-Google-Smtp-Source: AGHT+IHPEG0Uf4bUW9nG0gFKJH77vR45Ar5vo3OmomUBR3HmWHPm8EAlptOc0vd76nvl6VVmMrqFKg==
X-Received: by 2002:aa7:db58:0:b0:522:3a37:a463 with SMTP id n24-20020aa7db58000000b005223a37a463mr4006086edt.20.1692277781929;
        Thu, 17 Aug 2023 06:09:41 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([77.205.22.0])
        by smtp.gmail.com with ESMTPSA id h2-20020aa7de02000000b005232e637c24sm9912829edv.84.2023.08.17.06.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:09:41 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v7 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date: Thu, 17 Aug 2023 15:07:34 +0200
Message-Id: <20230817130734.10387-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817130734.10387-1-alexghiti@rivosinc.com>
References: <20230817130734.10387-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_060947_246957_F592DF4A 
X-CRM114-Status: GOOD (  14.65  )
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

The EFI stub is supported on RISC-V so update the documentation that
explains how the boot image header was reused to support it.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
- Changes in v5:
  * Rebase on top of docs-next

 Documentation/riscv/boot-image-header.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/riscv/boot-image-header.rst
index a4a45310c4c4..df2ffc173e80 100644
--- a/Documentation/riscv/boot-image-header.rst
+++ b/Documentation/riscv/boot-image-header.rst
@@ -28,11 +28,11 @@ header in future.
 Notes
 =====
 
-- This header can also be reused to support EFI stub for RISC-V in future. EFI
-  specification needs PE/COFF image header in the beginning of the kernel image
-  in order to load it as an EFI application. In order to support EFI stub,
-  code0 should be replaced with "MZ" magic string and res3(at offset 0x3c) should
-  point to the rest of the PE/COFF header.
+- This header is also reused to support EFI stub for RISC-V. EFI specification
+  needs PE/COFF image header in the beginning of the kernel image in order to
+  load it as an EFI application. In order to support EFI stub, code0 is replaced
+  with "MZ" magic string and res3(at offset 0x3c) points to the rest of the
+  PE/COFF header.
 
 - version field indicate header version number
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
