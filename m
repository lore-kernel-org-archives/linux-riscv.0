Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87924C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0JY3rH/7vfIEQJvkxNRp1pHZLLmQKNHaIUsGugpmyk=; b=oxQMg43fWdeWsw
	45eeSS9UpAD9vyf+DUOVWca2NBleVMbcinP7Uinb3sNfmtQYELnNxoKGYddVw1SIcbGSH7Ne87jaA
	c1kRdCtqeNPmz7l24yrVjyZG6PdenhHPLrI6iXpNadKbUDY/elLPBcCSTMjdQW/fYVnNjlbTYLyXB
	2oz9O2wjvUhvHfUpYsAgX876qVLwClSlF89prl70RsagZ9YIinRAT0wdJ2xbmJUZlzEmK5PHWfPjn
	Pofs037QF/LJpCwBL08qQUhfgXHC8yIKtlkIgwOrV1mNmBNLyVi0T6ch/sF60oJswKF3jJL3onZRp
	iAQ4OO2bUbHDcWUZMCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCdYC-0035Mr-1X;
	Fri, 23 Jun 2023 09:57:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCdY9-0035MS-1o
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 09:57:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f9bdb01ec0so5824085e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687514272; x=1690106272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pQzPxsmpV8ILmUDokZDt4x2j1OZGQdakvLzX04+Ejg=;
        b=DRlPNLsK/mZ3irMEYdZmnmDdlPds7DvI5au6/NXLEmObZ0q2j+riTTvnF4pnaba5Eb
         DH2TXjFL5OFBSrzNE1j4a5aGqGz48UHjYrVhZd3wVtPnW2C22JGEuGjsrq+JpfMRJV2k
         MkWPC6wPxJC27j2xRo0NYQY4kjlkcSDEwr9JRvSSwtmlCEF3IowczoAHbtWW345VGYQr
         DLQu/ZwtBg6Q81ga1VMS7w7OdSttnxx7sF4T278R3LjJ8THYdUsFWjekXwF9VxCxViVY
         kF8/QayqIlynx9XhIUmUIXrLU/LQ5y0rz+dMU2qOPVvjSn5y1zTvusx3LzoxEB2uMWUr
         2K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687514272; x=1690106272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pQzPxsmpV8ILmUDokZDt4x2j1OZGQdakvLzX04+Ejg=;
        b=Ak5C74tBoK8u+Z9zOsWNvVd3r/fodiX9H/Oo7gOcywwRBXgR/mv8FH8zrK580TSqMm
         6OV4Y/QW9YbTmLnfn/SMs4uBFe7mqMi9rlLexHWE5I70OtOOHN9qNtaLpMKQXBvWkeDk
         +pCE9wdZL/AF3xDjFAMPTLoMJ7FdoFk1fR7m8lbE31VU6Rx4mt3Jz4ZpBDxwzE/UbHOT
         is27ljkON1dr3FVguDzJ9CuYyzEY5wg2yb0jQd8DAWPqEr2I1eqBVgmaWX2LqZfJflp+
         Lb72qYIvQy2nJB70exAXmDzd4O0R7TGPio89liL+9SuIBeo/jCRdbYpCEq3YJEg+ivNg
         bRfQ==
X-Gm-Message-State: AC+VfDwB+97tfgB/TvrKC+xE1Z4/g1xLnaYA/+92woUOa8OkndiR31TZ
	2Nr5u6ByJAEvHEKa4GNTdEmJEQ==
X-Google-Smtp-Source: ACHHUZ7JjYmbOrvMcpUGZTC3uEGAoLXqDRseSay3/vHcvG0f5A9N3KF1iNgjt3GTjbTfRCaqYSCqCQ==
X-Received: by 2002:a05:600c:230b:b0:3f1:6fb3:ffcc with SMTP id 11-20020a05600c230b00b003f16fb3ffccmr17377352wmo.22.1687514272211;
        Fri, 23 Jun 2023 02:57:52 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003fa745f3264sm1824671wmj.43.2023.06.23.02.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 02:57:52 -0700 (PDT)
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
Subject: [PATCH v3 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date: Fri, 23 Jun 2023 11:55:47 +0200
Message-Id: <20230623095547.51881-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623095547.51881-1-alexghiti@rivosinc.com>
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_025753_602780_2C5FCCEE 
X-CRM114-Status: GOOD (  14.03  )
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
