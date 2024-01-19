Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1902C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 22:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bVXR1eBFj4koTQIal3eRoS1M2pDqeJrdcHRH2g7S74=; b=cvk2aGO2ZXY5e1
	fLqNV8eOqXfrmDmfFhwBiRVyI+t4ZnE1oWIK+q7rImygEwCMUMNhJcGTrvtKtAIkqAjBmOVyf8LuM
	y/7g4bkvEY5fTMMquJyJvGtWsq4ejKXooUpIYiQHNwWPFc0lwQN+bPtxt2NnsqY+ofcP+Y4s6pucT
	SXnHybtgJ/4KqWvU2A2U+hIQRspXrQp/Ys2CLGcZUxwBUY1eyLLCoeHDCv3P3OZK3go3nWcZWc3Zs
	qrGmI7Tt9o0NxOJ0UvbLqPNbrW2wbfVzsuAeii1zMDpu5Z1eDNzB/ZFRfzZEfeLPNaTo8jLS3P91u
	RF1uAkkFyMwdBuLKHscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQxce-006o0v-3D;
	Fri, 19 Jan 2024 22:46:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQxca-006nzC-22
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 22:45:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d3eb299e2eso9262745ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 14:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705704354; x=1706309154; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=2m1XhtygbnQtWGP2mbVBYdagXNcPKgbqxOJjRe6fvag=;
        b=TUkjKXkQibH9+ad/8FTw4AVMlKk+RiTBJCJoUrZ9RAnZlrLY3gcuVHA3tRrJuMImyQ
         fz+0k1OQrVFDFdhKlhj2y1mj/bKjeHOjc7JER5G+mjg2momEUU9TV8IZn1auNUIDwOxp
         F8TLnBRbr9Y9vw3k8ljggQnCaE6k/dYG4B1nTYGAhmh0ixQLnp3UoI+sQnf27kikYo7l
         dImT9BoAER+iCqJhH18JKI0SBynDH+LKrr81g6J4SlKKZqGJxN//vqtFdSPyL7ycq2fD
         yturG4GlkFRUwVFsvnKtvdkZxhH4t5TUPNSOT73NqZs9nXlEYP/89LhgZPD0rhd1kL6/
         eN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705704354; x=1706309154;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2m1XhtygbnQtWGP2mbVBYdagXNcPKgbqxOJjRe6fvag=;
        b=d87Myg7yC9jH7QwqdLCc08MG4phpcUP942BpyaTLdZ/8wRUEdo8A3vW1v3HqvB9APR
         tIHl6hPx7MWfN751nIONs3bBTPSWEYMuuQOq1im/tdUONOOHVZ1anmcSp9EhIzQ7Zo8h
         MmF4SYez6J6gvbF8SwJvO0EUMTbSzen9ebYjX90qFduWiR4gUA99hh4dCUddPjqoCB3H
         E+TIEKlaPBSUPbZTEoOQT6yj8yeN5KLJ8ILxHAZ08nWnlTdhoR+7hQYN6EbHEiqgfrkQ
         5dKUjPvgjYWh3Z9Mxk1cjsbIJAaHsy+2ivGKL/vi+WnCp5HT6ZcjWaxFeN49it1cJmpe
         ksHg==
X-Gm-Message-State: AOJu0Yx3RTWggAi+OHrQPZ+h0RM8S7JAbmat4M2aUgqoXNPk3KEQpfTE
	NwsSf5bht64FJ0b7qA0e168r3skxpyXZWfA41fBqp8PZdQva9bCS/lZlKXKnCVM=
X-Google-Smtp-Source: AGHT+IGDYcz91ZsFkrsdeetEFLWkVDikcqnEMGNi7rrUqJxNwbVFtPK97ae9vNTPyqHIMS90uGoxFA==
X-Received: by 2002:a17:902:6b02:b0:1d4:e2bc:88f1 with SMTP id o2-20020a1709026b0200b001d4e2bc88f1mr582016plk.110.1705704353758;
        Fri, 19 Jan 2024 14:45:53 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id p20-20020a170902c71400b001d5e2127632sm3525800plp.9.2024.01.19.14.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 14:45:53 -0800 (PST)
Subject: [PATCH v2] tty: hvc: Fix the RISC-V SBI driver for a refactoring
Date: Fri, 19 Jan 2024 14:44:05 -0800
Message-ID: <20240119224404.26695-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
  ajones@ventanamicro.com, apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
  linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
  linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_144556_671564_2F056A65 
X-CRM114-Status: GOOD (  12.17  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

I missed the int->size_t refactoring in f32fcbedbe92 ("tty: hvc: convert
to u8 and size_t"), which causes the newly used ops in 88ead68e764c
("tty: Add SBI debug console support to HVC SBI driver") to fail to
build due to a

linux/drivers/tty/hvc/hvc_riscv_sbi.c:59:15: error: incompatible function pointer types initializing 'ssize_t (*)(uint32_t, const u8 *, size_t)' (aka 'long (*)(unsigned int, const unsigned char *, unsigned long)') with an expression of type 'int (uint32_t, const char *, int)' (aka 'int (unsigned int, const char *, int)') [-Wincompatible-function-pointer-types]
        .put_chars = hvc_sbi_dbcn_tty_put,

Fixes: f32fcbedbe92 ("tty: hvc: convert to u8 and size_t")
Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
Link: https://lore.kernel.org/r/20240119215612.20529-2-palmer@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changes since v1 <20240119215612.20529-2-palmer@rivosinc.com>:
* Fix the return and arguments correctly.
* Also fix the hvc_sbi_dbcn_tty_{get,put}().
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 2f3571f17ecd..f8cd3310ef35 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -15,7 +15,7 @@
 
 #include "hvc_console.h"
 
-static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvc_sbi_tty_put(uint32_t vtermno, const u8 *buf, size_t count)
 {
 	int i;
 
@@ -25,7 +25,7 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 	return i;
 }
 
-static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_sbi_tty_get(uint32_t vtermno, u8 *buf, size_t count)
 {
 	int i, c;
 
@@ -44,12 +44,12 @@ static const struct hv_ops hvc_sbi_v01_ops = {
 	.put_chars = hvc_sbi_tty_put,
 };
 
-static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvc_sbi_dbcn_tty_put(uint32_t vtermno, const u8 *buf, size_t count)
 {
 	return sbi_debug_console_write(buf, count);
 }
 
-static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_sbi_dbcn_tty_get(uint32_t vtermno, u8 *buf, size_t count)
 {
 	return sbi_debug_console_read(buf, count);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
