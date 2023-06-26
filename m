Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4077DEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0JY3rH/7vfIEQJvkxNRp1pHZLLmQKNHaIUsGugpmyk=; b=NziyXTFQBOBJYl
	arY8K1XDd+b3YgJnqraiqdY/szOIbJIohxyfQk91s4BcNg5O04hxAAIpmihkt378xMEebuCTop9xy
	rinzWTPRiXBUHuUVlLltToQYK+HAypiQBtZl2d33oDZbW8A3x3kqc25Tat7wyOzg1QXQLsdefhsPL
	l/2CWlRFkjAZPIcIUAW++v7Jnu6drPkAyCvn1QDzuLAhX2M41JXVIETSHh0+hFZ7Tpm37Aa/qNCFW
	pmaELiup4nm277ELQYZSndUpONDpll7njOsOOBVrgqroT3WDQtX5/qBwmST2kbJOjkD77Cne7Q+FL
	fALr8t1TxFhsAzurQXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnMR-00APPd-0h;
	Mon, 26 Jun 2023 14:38:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnMO-00APOp-14
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 14:38:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fa96fd79feso12429685e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687790311; x=1690382311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pQzPxsmpV8ILmUDokZDt4x2j1OZGQdakvLzX04+Ejg=;
        b=uex3RA9qERfNnTukZWjHbvUoE92GRFB/vSd/56SJYlEKAAJOF2wGlzoyFo3yf4A7FF
         8ZBC9aYsVrrNL+HjSWxsFPpv7zb5e08DTroI6Woc8a03XoBhet2OAK6/2JlRryOIeOd3
         I8zI/yrigzMZuoa1Zlpi1pg/KbAe/zkTjZCzFYbA5MTv+E2k183GmHQwYbZH4d/8RKxM
         JYnOoOnOBhieWlLKxAQoXKiQiFFGGXVm8UL/CZsOzQLSSYXhOmr5G1NMtpRzsMCWp490
         AMw2oa2keFry57qcMCFzDn0xN53dGJAe57lsQnHdwyA3ycjoFgAKQdN2+0C18QPEehNu
         cxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687790311; x=1690382311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pQzPxsmpV8ILmUDokZDt4x2j1OZGQdakvLzX04+Ejg=;
        b=BmjUpMrE/UVtE8bjm3sTBv67brkodLrJGZ/kbzXk3iYq9aPYaHHtkRLxwSpVi3jW5D
         p7t9OEoSWj8dzCZ43Ev5RUedQF9ceOYQsP38fkuhNysrUMWnJeFJv8bmYpSnpK+dPnC+
         1dvW07qjKAA8W0yAL5R3k23R7aOzWn0nUIhX4fNDBvghv0beKvt+JuL6dSQO7ul1xLz8
         teXu+Hkhq48M/vnMrJGupDAd6UaPTAEnMf4DvGg+EXemUnrNDsLqb1dY3nReE5LKmkjO
         QYS3tryhygvpCclBPlmEQwOV+DDArwo0SS2Ym8srOJjvbH/Um47tx38S8OXQrD+RMhnM
         3Jgg==
X-Gm-Message-State: AC+VfDzR8x8VwFqG6Yd0R2n2gK51jeuVx+MXN9L6kKTHJLCM6+qFLA8k
	kz+cVf1R0hk6xJL/pZLMXk129w==
X-Google-Smtp-Source: ACHHUZ7/qbfak7GDtutZM70XhoxLKa1hwP1sqmQFIrzcjpha6OqsXY/O69sqJLYVDFnJ+mapPWzwAQ==
X-Received: by 2002:a7b:cd97:0:b0:3f9:a6f3:f23c with SMTP id y23-20020a7bcd97000000b003f9a6f3f23cmr18047670wmj.36.1687790311012;
        Mon, 26 Jun 2023 07:38:31 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6782000000b00313f5babb18sm1644944wru.9.2023.06.26.07.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:38:30 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date: Mon, 26 Jun 2023 16:36:26 +0200
Message-Id: <20230626143626.106584-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626143626.106584-1-alexghiti@rivosinc.com>
References: <20230626143626.106584-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_073832_369213_903EC4CC 
X-CRM114-Status: GOOD (  14.31  )
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
