Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CE5EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rQZNVMUjQrubfXOcZtLswfyU54oV6g6SFdhoRGkEfo=; b=RTJsors61meGMJ
	VhZTIp09NRwJUV57J2tic/6/PBZuouKLVTFYsGdSw9Ti8Myq7ANYU2aimWg3xh73A0jwt7oojEOqr
	SVIB2nsnnuDo8jupvJ2NyXVJuCxB3M9deXaR/kw7JZ3bDFG7riRS6k3NU7Wf1V8mAgQzMDTrN+umy
	mWYE7zWmI/q8qFH0TjQk7bgjI2jbC+z0B7KWl1mYQoD83bx3sntEaGS3wEDT4kwsG43aPa5qygtSN
	RcQcCet16ybRZYfXmhfYIrWMr8R33JzoSri/o5VCcy1JNG0XUUIy6iW7dvCp/EaFnrTtR/mxpRFC+
	upESybIcC3lnQwIeyb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBUi-0084W1-0W;
	Mon, 19 Jun 2023 09:48:20 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBUf-0084Ui-2X
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 09:48:19 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b479d53d48so8828861fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687168095; x=1689760095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7SPByKyVPiwN/2FqCBqpnqbBRCuyopKfDoQFMlp0Pg=;
        b=bmSQnUrSqleWQxuOOJHziLNGlBJwx1UmYKUBfklFbIAeB8U5h+81cjA0KCNl57VTYO
         rZvlBcOFaUUyFHTEG+yRnEw07mP9+WfL/4Txb116IzGJsUz1ELXUrtn10GHImlG5DJBe
         eBxc6JULv/EB+xxGYnt3+yQ59Zv/vaIxQX2maQOtsQ65MzCZuLdm8K54vr6jp/JNEdcV
         1sgOSt40aD6vKH7ZCysoB8p2tM69MNOZMA7uPedLmtiX4ZHN7gmptkIUHDxb7KmDak2u
         OnUFoPuH+P9Dz6cXFGLciHGUarCskCtl9DMguvm4L443Qw9ECl4f6S75avXowA7wsNye
         +e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168095; x=1689760095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7SPByKyVPiwN/2FqCBqpnqbBRCuyopKfDoQFMlp0Pg=;
        b=F5i9sHuhXnWvFWWCSKYqb5ZLTX4R/bJOO+Pq32JFTBaX9vYJ8FlrPak2Lxq2lGMWvB
         CiO4wXhqaEQf4+yBHB97M52k0Sz0BmU/hHwAU7uZnM5gaZ6FxBASAca5UNOEowjE6sa4
         NlfK4gVPPtiLu8MNWisSP0BIn6q/gRJ4SWF8NI+35IU9dQVa1pKQrx2RVFPqpQiuLz0g
         rcrkQUXVl/M6FDkQ5DvvGsNecck5gB8aHvOLSzauUd9B33SWEeN/szqN5ppup6EfjZPD
         W6P5cfG1I8oGiFs8CyFL6eatiAfRQslCTbBI3phg3SfbmcsRnPHhs/HNteImkXM+RKoh
         qDoA==
X-Gm-Message-State: AC+VfDxQ5jWgLz9bRoQMGtebUkE0fdMwU5qkeh0BGV9+b2syZqwT4yay
	zBMJCCyN5hPiqup9CK/LU8Kftg==
X-Google-Smtp-Source: ACHHUZ6DUJj3ieHmVMQb0BYF1rpy+Y5YBvOqhmgE2Rm97iwaM6H/IWbHWp57ylDtA+4wY/TOIqW+Sg==
X-Received: by 2002:a2e:9c03:0:b0:2b4:6bc2:a540 with SMTP id s3-20020a2e9c03000000b002b46bc2a540mr1989324lji.15.1687168095301;
        Mon, 19 Jun 2023 02:48:15 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c25-20020a05600c0ad900b003f18b942338sm10217564wmr.3.2023.06.19.02.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:48:15 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 2/2] Documentation: riscv: Update boot image header since EFI stub is supported
Date: Mon, 19 Jun 2023 11:47:05 +0200
Message-Id: <20230619094705.51337-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619094705.51337-1-alexghiti@rivosinc.com>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_024817_821173_6F025A5E 
X-CRM114-Status: GOOD (  14.56  )
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
