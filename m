Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B069BC44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 02:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NOSr4/kdKOaN2mx9+Bc0qymLQmt2UKWC86FhC9tD0q0=; b=mRAAJz86mSpvrf
	8yCkzwpXnSlWBjEwJV8ENScZkGb9W9ie1BWq8WJZ+fw6qroEHwY1qBm0Xb5c15LyjoDjPT8HWxtLW
	mv/8dTPCTrsxeGFTAQyV01vOr4A2nMfkClZqbpQMkvv2CjRbv4eaIYBZKnXDt1CBBJa7g7+4VJlA4
	RUQk5B1Ta2302D5NlccidtL/gmzQMSrbjkaLK5jt8IfUlJdZ8msrFZVpywfSsgTJNWk28yTdb55DH
	QyxKFt8dximvsMEolWCpKE1tLjQ1qhaLfVZ0un1slRAbHeE5B6NWFQezRf3xMK9xFoBomlWwZMv5z
	xZbmjSqhGZlItvI47rvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikbB-00000006KrI-2yN1;
	Thu, 22 Jan 2026 02:39:05 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikb8-00000006Kqz-2OAl
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 02:39:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so309441a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 18:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769049541; x=1769654341; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v084SR4XwOmmqxRC5THZforzHquboYBfTr+cYOzRODw=;
        b=ScxzfdeGW4MnfDaYsc51ZEmUNbAb7gPTibvGeTyq1uy9jgVZiMWvO7P/4S3Ei8pUIU
         4ybYwoPJkzLi/hZH4Z3SjHcpmcYJTBjX3fFTRct4J/c9UrAZkrfnvba6x9gsNcTMiuRB
         pvws8ZFKD9Kukc1W53PckecNTo+cfsBmJQi9FrsUQDqyWLiry20IPeqarcqygojhwvEA
         6NDPwCtRd1VjEprd1JemzzxzaVAh358Fc/AobHD6SLnfqxv4+94ohNguY4/IhBOPNbx/
         04lfDHUO6Zt0dNCZdKA6S+R4+gfjU5V34NUEhccJhQusNuXIEuOdmz737oiJPNexrhu1
         m9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769049541; x=1769654341;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v084SR4XwOmmqxRC5THZforzHquboYBfTr+cYOzRODw=;
        b=qyJvdPKURpp8umrOPU2Fw5IOrCoyxbxZ5v9PJSm0XDl97iwAY6kgiN6gtIJjY9T3n8
         sViO3cPBCMkAWQzjniHzFsYi7iEWmep5SPzYZMMDCQwau1/OuH59GiFREp75i965BJmM
         3nQWgsmkDDWSdEHGTfM2nPU4MUWiiPcWh+BHTDjdAYSfAh7Eo9SeOs0yGkw+2WXYbdoW
         JBZzmJ6M3rCFXAYTOI6ZJ35Z0+vDZIyBeBf6plgSbbTr8DNrFUCAkwaEznJ+qO0rhb3Y
         JJGgjmhq8FyZGx3XTF7UbVF8/kPWX4ZKyzppqG0UgDI67spB4h9xvqTuWah+2bFzlBgj
         lYwg==
X-Forwarded-Encrypted: i=1; AJvYcCV4JEIBQGmo/KYqpz/fY8hXjKL30a5h1lQkbdmq1qhTZ/350ZWhZW/5aCVYIG9hNORYSQvWVFehfnjimA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ZkFDP6f2zhcyvNKzcAO1VRZoEBxg9xHdoRxUmrDrgcoVAGRu
	o1zLZRTnuoiBqF5RM6jZFbzzGZlTsqkt1RSGfb1oQq/AVd3xQViempGz
X-Gm-Gg: AZuq6aKrrr93ywpe6WCqonClaWFTFR+4togTWAacRHwq3w2pT7c6i3r4g/2IE+2RinW
	csgiYXeKx4r9cwewTRqQOym40Ubu7DP/pB1O8OcxZKgiJktIZyEuXafFyaj1+Z5EFe56yh+xWra
	udFdp8fsqzttEYiSlgt67CECtKmJ+Qzr32tNqoW5VzehamyGQGXwHg188vuif8+eyukqUCF5H+L
	bpmjaNRXL9wVYNoXInDDe4XCaf8KfAzjtil9hNH+VB5sxSewk9uYPeguFqIMnJogo6d1KwxN4tI
	iCHEvgItRmgeNDTjjHMcU6D/jz5Jocz1OwwKfbMuxfEUOQuPUSJZ7Pn1MX1R5NpCnG7hLp+Z8ks
	g5LRojvFUTLckjHvdvAbNRID3ICvjzjD/AI6Zp4S9SWYkd0QMQEhm15E33k4hVyXLM+V23QeXG4
	9qt7Cal9o5b3TnHnKFIXeBYEce/XI=
X-Received: by 2002:a17:90b:2b4d:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-352c3e56b82mr6006512a91.6.1769049541212;
        Wed, 21 Jan 2026 18:39:01 -0800 (PST)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf130f1csm15841091a12.0.2026.01.21.18.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:39:00 -0800 (PST)
Date: Thu, 22 Jan 2026 11:38:56 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	austindh.kim@gmail.com
Subject: [PATCH] riscv: Add macros for software check and hardware error
 exception codes
Message-ID: <aXGNwBk79yMuvysm@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_183902_611889_0729D140 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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

The latest RISC-V Privileged specification defines new synchronous
exception codes in the scause register:

   18: Software check
   19: Hardware error

Link: https://docs.riscv.org/reference/isa/priv/supervisor.html
- 12.1.8. Supervisor Cause (scause) Register

Add these macros for future use.

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 4a37a9839..5ea875813 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -108,6 +108,8 @@
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
+#define EXC_SOFTWARE_CHECK	18
+#define EXC_HARDWARE_ERROR      19
 #define EXC_INST_GUEST_PAGE_FAULT	20
 #define EXC_LOAD_GUEST_PAGE_FAULT	21
 #define EXC_VIRTUAL_INST_FAULT		22
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
