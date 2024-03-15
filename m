Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9BEC54E6E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00qIi9f0zsVHBkFPDbUZzqxhUARgknFSztdnkwyhSHc=; b=Y1MQq36/06h/FD
	616qPaK4UVx6FdguBGJTzgO03DQRuh1ECW1OwynpgPGNBNleg703b/Gj+63cPsswm2RxG4HfnWWwc
	Xyr4aT3gC+88Qa/8EIWugjzfFl9ELSuq6NG1P+4p4O1lSzDuUVHcX41gAhmPFYaDnAIKrr+JPvoCj
	3hL4M1FJzZIxGQ0+jx9U77VOusf/2V0jRYsLsSAZQb0Pq8yrqXux5pBtXpnQEPNpHXqLRlW9mmaUh
	ziclmY28pnGRYwUwJd5fhZd6z1KRrp1cMgJUQKBwU3ooJCn47hXYt3ZxRZ5jUSO8HYVi5FFwQJzRX
	+QgoWRKR53A+ueFoe0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nJ-00000000M6T-0y52;
	Fri, 15 Mar 2024 13:40:21 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nD-00000000M1V-3ESd
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 13:40:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a28a6cef709so292177666b.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 06:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710510014; x=1711114814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYJVjR6PcAXuAiyCEsUFGgrHT1hRDFocm4X9/miniY4=;
        b=fr+yXDqw/z6stfufhg8FB2GsHtfIUlCxUxellF3Tn4DQek7pwTJD7+AWsP2e7xOsty
         N1zB0lEfrSDJQGwbD3pezrqe2eWc0gIZ7jYE5O7cMHEfj8f8bd6KzpXZEgYSJlSZiFEe
         50HYPuEbGt4Yut9tLMFhSzD/0T98lNVVGCHylaX9Tt776n1ZsDHaTZ+Sn79TRHWjSZ+K
         8tjs8MEinmsaXSuUQEEFx/nS+z25zInEKm7G7ClKvUUKmojgNtoWTJVvLvnYISQStkEP
         zYO61IhAw3Y7bU3wAJ2M+nj4XXMUBtFY6Q9ieTI26rfpbhnNA0ST7khRF5Jcgz0kjEic
         h6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710510014; x=1711114814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYJVjR6PcAXuAiyCEsUFGgrHT1hRDFocm4X9/miniY4=;
        b=DhQuOwxEKlZGSOF4wJzAQRhv7NOM6aX37ZvBBL2/AfOS20DXY8A5nF6ryiqR2PH41g
         5a7Xzyr3A03SEqkAhxo/LCuIsT48yx4zUJ5dP5NqEbTW7aJvQMYvGbTTueNzQgaZ2pL7
         NyFb3kx1Y2Crrvpm/HuXHR0p88zUixguN/RdxTq1yImu4Ycma9WF9hhX8mxo2M6aXZbm
         n7sdZsvRago/TfL7BalY7R93YRjzxP/Wr6shFaVnQ3+dLeQBk7hbviBAkd46egEbdP3l
         Af4e8aFNDCMmmDWp5VDGMn0ZarP6RkoVLTbBNLeVQv7fX0CpomYk3iaBSG9ZME0DjEfR
         fYxg==
X-Gm-Message-State: AOJu0Yz5o2q6/XBmeqGv3gPl4a+gpL1xsa+SAgB4zvY9/uFDbdQCwa2a
	rnp+8Y8QW9ktIq78D5XuygTacdtTVars01l9vboJjOgwmS6Lv3xqgZSYxBnnBgtUOvuQM91xwvv
	s
X-Google-Smtp-Source: AGHT+IG8aqa+xgGJQVQl4LL+mRDsKQ7yvCAs0yadHZq2Y6J6N7NXHOHUNOUvJPSAjLYil2NMl8CEeA==
X-Received: by 2002:a17:906:81d1:b0:a46:651a:724e with SMTP id e17-20020a17090681d100b00a46651a724emr2177406ejx.54.1710510014097;
        Fri, 15 Mar 2024 06:40:14 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b19-20020a170906039300b00a442e2940fdsm1735575eja.179.2024.03.15.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 06:40:13 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM
Subject: [PATCH 2/5] riscv: Prefer wrs.nto over wrs.sto
Date: Fri, 15 Mar 2024 14:40:12 +0100
Message-ID: <20240315134009.580167-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315134009.580167-7-ajones@ventanamicro.com>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_064015_883759_320FCA82 
X-CRM114-Status: GOOD (  10.35  )
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

When running as a guest we'd like to trap to the host while waiting
in order to give the hypervisor a chance to schedule the lock holding
VCPU. Unlike wrs.sto, wrs.nto may be configured to raise an exception
when its duration expires, so use it instead. Protect ourselves from
unhandled exceptions with _ASM_EXTABLE in case the higher privileged
level configures wrs.nto to raise exceptions, but then doesn't handle
them.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/barrier.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 93b3f572d643..441b9eb4b0ef 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/compiler.h>
 #include <asm/alternative-macros.h>
+#include <asm/asm-extable.h>
 #include <asm/hwcap.h>
 #include <asm/rwonce.h>
 
@@ -22,10 +23,14 @@
 
 #define ZAWRS_WRS_NTO	".long 0x00d00073"
 #define ZAWRS_WRS_STO	".long 0x01d00073"
+#define __ALT_WRS_NTO							\
+	ALTERNATIVE("nop\n", ZAWRS_WRS_NTO "\n",			\
+		    0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS)
 #define ALT_WRS_NTO()							\
-	__asm__ __volatile__ (ALTERNATIVE(				\
-		"nop\n", ZAWRS_WRS_NTO "\n",				\
-		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
+	__asm__ __volatile__ (						\
+		"1: " __ALT_WRS_NTO "\n"				\
+		"2:\n"							\
+		_ASM_EXTABLE(1b, 2b))
 #define ALT_WRS_STO()							\
 	__asm__ __volatile__ (ALTERNATIVE(				\
 		"nop\n", ZAWRS_WRS_STO "\n",				\
@@ -130,7 +135,7 @@ do {									\
 			VAL = __smp_load_reserved_relaxed(__PTR);	\
 			if (cond_expr)					\
 				break;					\
-			ALT_WRS_STO();					\
+			ALT_WRS_NTO();					\
 		}							\
 	}								\
 	(typeof(*ptr))VAL;						\
@@ -147,7 +152,7 @@ do {									\
 			VAL = __smp_load_reserved_acquire(__PTR);	\
 			if (cond_expr)					\
 				break;					\
-			ALT_WRS_STO();					\
+			ALT_WRS_NTO();					\
 		}							\
 	}								\
 	(typeof(*ptr))VAL;						\
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
