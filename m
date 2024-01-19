Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF0C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 21:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MYt5m/LcLnYLpw2mikktg+qot9CNt0gxAFxPxBnbh0w=; b=vUH2uiFXqTlsSy
	VueUMzLC5g0xm0WLj5cL33v0jJDdR+dk4dJzHS9QbvheaRpfMA1ns0FnFDjYe8/2D8OMLNOawcI9r
	UIUTbr6ud6wD0V7fujRb5qJsCTfhzvQs0nu6Shn5C0rJ2cGScIMsdAl0IwFBvrlszXQt3utJdvQgd
	VMXUqfDwli8uCMJ8sPWCwZh4qTydyt/bRO3yRYyifAU4/O+vZFWAGJ6XjUsmuR1M9aDuU6Ot/YU8W
	JvryZEsUKe0UOI31jnyK74SQuNlc5PB212dd0l/cvHBOpTN3oone8ihr6SiqBw5hysr+1UCsVe7Ug
	WcDKbZao/GBfqx8VjRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQwrs-006j4d-2J;
	Fri, 19 Jan 2024 21:57:40 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQwrp-006j48-12
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 21:57:39 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2903cd158f8so1015249a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 13:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705701455; x=1706306255; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=VVF/DXNkQrk84cprN3UAoU1BvvHEzT7JQOwOJshC+cA=;
        b=Qt2hB0UHi7mA9DRosrnn93XO0LYi4Xj1e67B1lzzFl6dd5GyaOhXNkAzRzpnMZVipL
         AH9e1z46QICMHHU6ILawDoLn2wCHBQV4qaP0ID5dFzYrO5da/WML1hz/JOIsXSLOFzZW
         Js3zSMYFwvkmeXwAY+w0cgJjO8+xp7oBVthXP4gFfz7Sec1X0D/NKHHqFVBGv9WYCDmf
         xN4XH09oOy1U60/QKGl3xBsNCGMq3gDTf8+niaOZibMG/hMZJ7dnMudYX0WmWFvFqhlh
         5ZRf+Bjq2/Tqsc3A1ihsUkb6ROh+nclhKp78JCK5l/w/mPQDp7h7Q23zCEpps55MK4jv
         3hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705701455; x=1706306255;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVF/DXNkQrk84cprN3UAoU1BvvHEzT7JQOwOJshC+cA=;
        b=A1ZAaofOKmzIKqrDYIVD1iWs4ClQ2l0lZfInCpzm/wBAmjpOd/sb2XnjE27CCFibSw
         hmHaMr3t87Xg19/yMqdV3aOUypocN7RNUK6VaHGHdIWj9C9PWTqQx3h54LJ5v29SMkMM
         ZO4nP/tio6W1MAPbM9uau0AbOj/7ggN9/cp52Cm9bSpmhvZC5fiuNDaXwDCKsYevGE0B
         1LT2BGgGtjcwjeHh9EWs+w5aBXdnpimZ5ldQBVKvUo83yEV8RkFoqL5IcRr9RI8miDm4
         fXbSJx7zL5klHguDDHHo/CxmtZgDQL6QCHlQwXq5InEeqWIjMWDExWaZAyvJhYB96y5T
         BWOw==
X-Gm-Message-State: AOJu0Yzg/WuNEmyCxorogvfVgefUx+nIWE3qXtCf0qMXq+8SUJGyId46
	WosbcySqKPEVZ5MdTOdZr9TCnELQM0tVp43q1nYiFu1/u8BHz0LK6P44+y/Y2RAhsFG7Z68w3bG
	Z
X-Google-Smtp-Source: AGHT+IGEZk6VnUzExADUhpg7c3wGkhyF5/eA70sllfT+Dl5sV1z44WbDQY05CVT8DUCcI4SCpe6SuA==
X-Received: by 2002:a17:90a:e547:b0:290:4140:1e43 with SMTP id ei7-20020a17090ae54700b0029041401e43mr396975pjb.80.1705701455437;
        Fri, 19 Jan 2024 13:57:35 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id db11-20020a17090ad64b00b002900eeada1asm4592473pjb.43.2024.01.19.13.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:57:35 -0800 (PST)
Subject: [PATCH] tty: hvc: Fix the RISC-V SBI driver for a refactoring
Date: Fri, 19 Jan 2024 13:56:13 -0800
Message-ID: <20240119215612.20529-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
  ajones@ventanamicro.com, Atish Patra <atishp@rivosinc.com>, apatel@ventanamicro.com,
  linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
  linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_135737_586106_DD0FCB21 
X-CRM114-Status: GOOD (  12.92  )
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
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I now remember Anup pointing this one out, but looks like I forgot about
it.
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 2f3571f17ecd..c08718be8e73 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -15,7 +15,7 @@
 
 #include "hvc_console.h"
 
-static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
+static size_t hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 {
 	int i;
 
@@ -25,7 +25,7 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 	return i;
 }
 
-static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
+static size_t hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
 {
 	int i, c;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
