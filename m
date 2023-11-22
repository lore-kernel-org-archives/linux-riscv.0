Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B49C61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 23:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WMgMONsgJ/SUCyXSSjoOVDFkdL2cGorIkG4fVMXre+A=; b=1MlANrhkN0WRfx
	B4a61TTwyUWhWrPF4XhYGOT4DpJ3ePSs0X9q8yCDpWadZ/HfrhQRNRDORv0Pmjn6kOM0ig3P+1Db+
	jmu6UC3YxDmb14wHEypJZPnKm1/MaOaFvgw/fOv8RjI7D9bQ+pPLihSfbltxYo2EghimOO0npsjIY
	tcAx1ZtTi5GDZ+UM9n3TuG/ybVUzCKqYuu0Omwikfo/qsq4hL3fXIZt8ClmJum15RQBuxV5s98JeY
	bBe2lzfLSUO/sXsMFhLyz8l7igKs6pCGHnSJX+LeeVsYz9JgVndobPqPgQrZymGIfmFU5CX+nhNOf
	QE7j+YLnpECIFZwkZODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5wlH-003KKy-1N;
	Wed, 22 Nov 2023 23:36:03 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5wlE-003KIW-1J
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 23:36:01 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso221135fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700696156; x=1701300956; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBUVU5XWyhJgsqywEt/NScpi8dSEdT8JwJyYl8rlEbk=;
        b=reRovdXKxvJHS5+LkavcIyCBeXVekRW/vlKiKPvtc/ltQpYYJ7eIbFyhi2Mk9x3gng
         eaplJsc4feYzjfJwHjN0bWbniR8RWe39acO5LV1uP22djZnu6wc3IN10vyu58maQGYWK
         UAc/sKfEcc3X1hJG0YkWnum9g3MeNvkpt0emS+RoM/9nX+uL7Ef9nn7OrPgcu2P8674t
         hl4XvoKGfGTBaMfI2lISKXbBXA4H0aHpWWgo1ja6tzQosbc5zgLSU4lSiwAH8fCfw0NN
         FgZBhPvQLvu4wMBcy4pOwAbSguxuhU5f9rJlW0LHk4SwgE9DXFCeOKNYk/bgDYt9ma2n
         YQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700696156; x=1701300956;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBUVU5XWyhJgsqywEt/NScpi8dSEdT8JwJyYl8rlEbk=;
        b=c+dVZQo1gnU+Td+G3s976/7Q+fRZTD2v7757rgLT9ZoGe/cLtQkwFjF1i6bYj570Pc
         P0X6nbGtvlK+3h462zzrx3D7S875RycL+bG3q5eYMMUtJOe5SjfjoTyms24S6Vw141UJ
         ZoIP8RF8isvQFNig08dKDY2+mGS4g7G6wEqfOxMVr8NCMvC2j4yX3HXRbLyPyu10T7rG
         nb45aYt/7U1Sme42+/HzKNw3d8jz+iQ4AFr5dkeZs+JwTEa5vV0Y5cRLWsai1x/Izt5d
         wTY4lmYP21TVE4ay5Qw/NJmw812xuGf+XLJJuP9sZiQVTF7g+tdShGVRGUL8xDo0YB/R
         9eUA==
X-Gm-Message-State: AOJu0YySNeFY9Vhi1nQH1ZanlwhQIYfha37+xUXtyghf9c8F1b0YV7OI
	BQfWuvr304QcgleftvXrneCaNA==
X-Google-Smtp-Source: AGHT+IFb8+2tfGIKWFBEvLHG4ZBjLMO4zV3X5f7hGXM1QeplzX7heJsGc7DXVMSbcHGvQcHSTSy2iA==
X-Received: by 2002:a05:6871:e49b:b0:1f9:5536:4125 with SMTP id pz27-20020a056871e49b00b001f955364125mr5139525oac.25.1700696156690;
        Wed, 22 Nov 2023 15:35:56 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 23-20020aca1017000000b003af732a2054sm7476oiq.57.2023.11.22.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 15:35:56 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Nov 2023 15:35:54 -0800
Subject: [PATCH v2] Support rv32 ULEB128 test
MIME-Version: 1.0
Message-Id: <20231122-module_fixup-v2-1-dfb9565e9ea5@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAFmQXmUC/3WMQQ6CMBBFr0JmbQ2toUNdeQ9DjJRBJpGWtNJoS
 O9uZe/y/Z/3NogUmCKcqw0CJY7sXQF1qMBOd/cgwUNhULU6SSlRzH5Yn3Qb+b0uQhuDLQ7GNhq
 hKEugcuy5a1d44vjy4bPXk/ytf0JJilpo1feIOOpWNZfAyUd29mj9DF3O+Qu7atE6qwAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Randy Dunlap <rdunlap@infradead.org>, Ron Economos <re@w6rz.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700696155; l=1713;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=WzToCDP5Qw2xTrkNy2aM0wX/cM3k+sRc5gs0EqwGACQ=;
 b=/QBxu58uLtm84zLX3i6W3znwC4jhHOymQSKuIMPwMBboSBZZwItrbTXHjhD9bSPu6MnY6a9DR
 BCKUS7SU7tSBFWE3YZPTqox+oc8IG1crFtsLJgwyocTeOUApIvURJaT
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_153600_445384_79DE72D7 
X-CRM114-Status: UNSURE (   7.74  )
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
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/lkml/1d7c71ee-5742-4df4-b8ef-a2aea0a624eb@infradead.org/
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
---
Support module linking tests on rv32 toolchains with uleb128 support.
---
Changes in v2:
- Drop patch covered in different series
- Link to v1: https://lore.kernel.org/r/20231117-module_fixup-v1-0-62bb777f6825@rivosinc.com
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

---
base-commit: 9bacdd8996c77c42ca004440be610692275ff9d0
change-id: 20231117-module_fixup-699787d9c567
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
