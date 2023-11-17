Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447AFC072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgRwRKQmtO7ouddI6A2u6C69P9PWy2oeqpzMyxRq6Ug=; b=z982cXwUQ6mpsK
	BD1bAIXAxU6WmD7o6JUBIVcv04xunac9hivZGtPpkWFCrSDIb0BanZFFurpp1mxa+ZP9QaayPcTFf
	DtWAQWfC+ehgxUbEtaa7e1/VjJpHn2whgYrQfKnzjB/cv7Nk3UdME1Uur7kDjpdvoA2PWucQ3tar+
	1FKpTmvHYUC7hmvnZ2xL6jl5zEZvOsbJJg+9sovgF+lhBG6w8EVpVNCLIC19H1JJWH1+rqDLwJJYY
	rNWsnaVgj+NXZm0/d4Yg6jl/CWbyEkefffjtE4fhlYBSokvTC1OuvEAEeYZUbwgEBccHxh0gjXqPe
	NXG4stwYDZIl7QuNUOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r451k-007CMe-0Q;
	Fri, 17 Nov 2023 20:01:20 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r451f-007CJU-1g
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 20:01:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc329ce84cso21144415ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 12:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700251272; x=1700856072; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFY9yyw+/EAdIRUxdIlmPfWs3oHbG4Tu++kYGInr8MQ=;
        b=T7GaM1aBNkYs6QzPO8juY+DtzNv3ffu3kkSTcg2hjO9VZOvnawtPeshZJiWbAgPsRg
         hTV4rdzFU6UWWJrnqdPimsWoArMl0xUS7wlXw2w5Wt0UQrYoQSPcpgkn2xeuQujUTmDI
         /j5bPDsbsnMf007Zx+WFg82qaNieOGv9Ttn9dt/7LZrcDvBaesiNVBCeQZk6SXtfZcqD
         bJApNaarBAz88HDlbfU6AbcxygISogjKXgAe/66mErgPHwCUvwfo8qjJ6Rok3r4hTm6w
         /dmEnFWIHPK9xaGI0LC6lUU3Fc71ndK3NpJO9KXckQswlERgy4r3vgs9rIIstFulfZ4x
         VhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700251272; x=1700856072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFY9yyw+/EAdIRUxdIlmPfWs3oHbG4Tu++kYGInr8MQ=;
        b=GLQWWOCFu5UhMDBIlBHNizzPY1B6txwDlb9FJ/n2KIDujxARACDv9tREx5M3lMNdLI
         h0y7qx/2wxc2ILWUZe9GA+aN45IzZyr6JofK9hteTEMN/PJb9k4ZxVX9DwU18WoJLoQ0
         DUP/8Ym1r4vKiG2T9Ey/9iOz5V4o6ONZAM92tBtPXyBtg/51iQlbdBSu2M4/bYyTC65v
         7C4R53xApZHVXb2PGlIhHdeNaN33y4FhMqpQYB4Wrr1bnJtY7nHpHm9UUVuRgIJYTscj
         iVnOnCMrumg0Z9H1TatOrRp2jeSYmF7okBKOys+z5XdKtLcZ+cyX0yNQdDNX5tyRpwCh
         Gt2A==
X-Gm-Message-State: AOJu0Yyc9vbuBbMoRI9mBIK2pJYAj0wBc96Vwao5ZgSZVlT2D9o8lcaB
	dOEgEQ/kcszkeBFeNSCFhLYezFf9kJwAOv9DgO4=
X-Google-Smtp-Source: AGHT+IEZETbP2T/dkEnvQJyicMa++aA+ZLyZ7dyLJO2+XFAKGQHurPfaAZ0f+yK0ANeWCP6Zuh/+bQ==
X-Received: by 2002:a17:902:9687:b0:1cc:431f:55e6 with SMTP id n7-20020a170902968700b001cc431f55e6mr543932plp.63.1700251272659;
        Fri, 17 Nov 2023 12:01:12 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id bf1-20020a170902b90100b001b53953f306sm1749737plb.178.2023.11.17.12.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:01:11 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 17 Nov 2023 11:56:11 -0800
Subject: [PATCH 1/2] Support rv32 ULEB128 test
MIME-Version: 1.0
Message-Id: <20231117-module_fixup-v1-1-62bb777f6825@rivosinc.com>
References: <20231117-module_fixup-v1-0-62bb777f6825@rivosinc.com>
In-Reply-To: <20231117-module_fixup-v1-0-62bb777f6825@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_120115_558485_92BCC8FC 
X-CRM114-Status: UNSURE (   8.10  )
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

Use opcodes available to both rv32 and rv64 in uleb128 module linking
test.

Fixes: af71bc194916 ("riscv: Add tests for riscv module loading")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/tests/module_test/test_uleb128.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/tests/module_test/test_uleb128.S b/arch/riscv/kernel/tests/module_test/test_uleb128.S
index 90f22049d553..8515ed7cd8c1 100644
--- a/arch/riscv/kernel/tests/module_test/test_uleb128.S
+++ b/arch/riscv/kernel/tests/module_test/test_uleb128.S
@@ -6,13 +6,13 @@
 .text
 .global test_uleb_basic
 test_uleb_basic:
-	ld	a0, second
+	lw	a0, second
 	addi	a0, a0, -127
 	ret
 
 .global test_uleb_large
 test_uleb_large:
-	ld	a0, fourth
+	lw	a0, fourth
 	addi	a0, a0, -0x07e8
 	ret
 
@@ -22,10 +22,10 @@ first:
 second:
 	.reloc second, R_RISCV_SET_ULEB128, second
 	.reloc second, R_RISCV_SUB_ULEB128, first
-	.dword 0
+	.word 0
 third:
 	.space 1000
 fourth:
 	.reloc fourth, R_RISCV_SET_ULEB128, fourth
 	.reloc fourth, R_RISCV_SUB_ULEB128, third
-	.dword 0
+	.word 0

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
