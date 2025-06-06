Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CB1C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+Wo+xuZ7XxKWy8wSSsWt46DBB8Y6o5l6dOn2WTpfJs=; b=gpJ74K3VuIk6W6
	9MGWFv6wB6vGXpZDelQ6Gbvq9Jwq1RH+AO9FH/wD+DUj7Km0Jgww6UeeZka1WNOdeUAwRoGSsKesV
	Wn4vKFteQ4UOZNnRmyHvqaiob+bsINbv5iEhQH4pKX362W4plQERw+OY8ZXPAlRTiX4d5SSdU8ujr
	9G+Q5RyzE0F7Z06dYNGJiC8r14yCyvyyuG3B+7Uj6QvhSOlXqK2eTR/+Quw0UkH4EBm7R/jGtlmeL
	+zOww4GRXMxR71cznPfMYNSWuoV3dM420euRhAtdHHcCWojmjwmXd45szpQcz87vgyjnyCfu4nank
	i7XWB2SpePgI2Qwn/uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXQa-00000000Mwn-3rXH;
	Fri, 06 Jun 2025 13:48:12 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXQZ-00000000Mw4-0VVJ
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 13:48:12 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-742c7a52e97so1880289b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217690; x=1749822490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FT74bOydnUw1XVZ+DksJusFTfOc0V0/ESQZbybugO8=;
        b=OkY7YmPykguptarEB6eaW3Dz4O6iR/g/ra24/jCD8PDKDlAnmb4Ulfo2UVho4/2QLA
         aZT0Vj5gNJJI3qnyz0KRgBlphvTONNZa8ttJ9lvTVSxGjWgbf/83assken3cK+Muz70K
         Yw5uPPTrwILSj3F/azHY43oSb1cB6w9KQswHN0tFTKTCrS7QdJIeJwhVoy17NdJKvQ7X
         e4YjqZi9rphASaxii+QNZhK/EmSjEIzLXhcZkI0qpU/+z7ksvzcupmpuIgHtzbsX+oYg
         HG9CuKjokno4DHqSp0CY1R7YfBdovWQPvn/+cnWOINXFhVkyiwQuB+PiE34K/6gUbYPT
         EjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217690; x=1749822490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FT74bOydnUw1XVZ+DksJusFTfOc0V0/ESQZbybugO8=;
        b=d8d7q12v4DpRN6inZmIn3gRi00TWdZalp0apovDCIAtJAjtUOF5Fc0xMz6mwPKmlg1
         ts1TZ3/l4+kmpjCzG4z29qAanHsE1OyEh9ASUSSLOvipd0Y5p6o6XtpcDErKZ97kx5Oj
         VrruWjkfhPHhSresj2eN79cF8DqBcQCaD36pdJE6b37NiIg60ZDvdfkPkZtYegDEzIYw
         r4FRvksRuNw5PTT9+B/KYxuQ9DjPkA+BCuFBm5Fje/DfuQ/x8Zib+7XYZXM5frddLcjm
         cIzWex/ly42Rgr44SSwlUmRelSP9gWdrBQHhEsOwAfgFqQi528NRaSiKP/N/98NGY5j2
         Y0VA==
X-Gm-Message-State: AOJu0YwoQXA6mum+LLzOOt1ytBl8tSEl1YHqr8t+lIChZB5QcgQbUql/
	bZLLlhNE2+GDrQG1vALcTzBkr8Gjs1OcB4w7Iq3bIJzjrMNE/cc6tFEC
X-Gm-Gg: ASbGncvRpyR744q9uxCkM+RO2XP7kUh1JdLHrtFcNDk8CxPfo/FP1TtEXMLS6GNsUL2
	gBr/dpr/ujPR9g3DhclZ9rjEkduHLKPXJMMskpiSmT6pAAmroGiSROr/tT3zR9PzXJf1L81cDrw
	tFySdD4AR4CgV95RaTkccO13ohGocss/14eSL4oX0ldVZDChOSYHEgy5l34tW2YIaRWoMFzE2ba
	/smjkBCx2R1f8JXT0NJ8XXn0SM8hkWvCL1lvSS31E76VCNQNcxMpaLhL4QNT7TlVYVL9WL+Tdgx
	KRKFtK7hWu5Ocef4bP72jZpTBD6Yb0YG8swSlG0rcmd2x6KHnzUyON88HLts6qWuAbPUzK6Sr3H
	gX1D1Ug==
X-Google-Smtp-Source: AGHT+IG3Kv6F9aF4jSJA62zhy/5qbGz+kSKhCfE+F4DJ3V6XCScYluGiO1lVGNxqP0lX0yuL5Q9aAg==
X-Received: by 2002:aa7:8891:0:b0:748:33ab:aa3b with SMTP id d2e1a72fcca58-74833abbae5mr823623b3a.4.1749217690203;
        Fri, 06 Jun 2025 06:48:10 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c1168sm1296798b3a.136.2025.06.06.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:48:09 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 2/3] riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
Date: Fri,  6 Jun 2025 21:47:57 +0800
Message-Id: <20250606134758.1308400-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_064811_159773_7933D6A0 
X-CRM114-Status: UNSURE (   9.10  )
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

The binary GCD implementation depends on efficient ffs(), which on
RISC-V requires hardware support for the Zbb extension. When
CONFIG_RISCV_ISA_ZBB is not enabled, the kernel will never use binary
GCD, as runtime logic will always fall back to the odd-even
implementation.

To avoid compiling unused code and reduce code size, select
CONFIG_CPU_NO_EFFICIENT_FFS when CONFIG_RISCV_ISA_ZBB is not set.

$ ./scripts/bloat-o-meter ./lib/math/gcd.o.old ./lib/math/gcd.o.new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-274 (-274)
Function                                     old     new   delta
gcd                                          360      86    -274
Total: Before=384, After=110, chg -71.35%

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..f085adc6f573 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -95,6 +95,7 @@ config RISCV
 	select CLINT_TIMER if RISCV_M_MODE
 	select CLONE_BACKWARDS
 	select COMMON_CLK
+	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
 	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
 	select EDAC_SUPPORT
 	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
