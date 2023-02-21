Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0352EC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 18:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sngBO/qBs29BZynl8osA6785Cgix3Sm5WOK6ndXYgtk=; b=PlpVJBZobvz+b6
	YizvT6PGRK7B7dsCuwztC/Ct1KTiCvwxxEmkeMjrAtVUnLR/n9zfUvF5FD/tq+qTGZh1zeNKAZ5oK
	Xl07GE/po2+xSDkbWHGIZGfkJczoB1AgN8iclntjiTME4lvSLHTa2sF+lc5jlkpTxgeHamsXNyuOU
	8M0JQi24hNTanKYxCaubuN+KBbwByuoAOanxesJOOAeBgODOVVyONpscvbzHgKC6vHIBWU5NjsmfD
	SmXfB0Tk/1krE3OMSc3mC33S59D99RhpqXbSWUx0n3BeS0lGkEjmhyP5bfIpIDlnwRPF8hs0K3yYI
	Tq8696lKQklM3Y6Rh9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoL-009Rn5-1k; Tue, 21 Feb 2023 18:56:21 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXo9-009RiK-Hq
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 18:56:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id ec43so20726545edb.8
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TltiuwpZqYUNrkoSwtmCGojBAiTWTBNMLzWk+hCRaCQ=;
        b=cn01rrsBn68vq3gy0L/4ZadelRbPKmQGMfJp5K52r+ScOPSzM5HUVYzFKzAA4Mfm0D
         0e0r7hMTrjYu9aY8JTgDdyPHUpkTgtXObivWL4lL01+Mzw/qeGVeaI8MRWfo7tp866Ez
         AZuPMyw6FlbWr1GFZ3nZRmXjjCkkv6eHCt/oJpMYUQhsL4pHZ5mfGF15h2rMfV8ZB+E3
         Vtu7+5BcYP1BGJ5f/LxMgPp1zlIDyBqwLDTT2Gvr7jt6PGpXNtjZgEmINHDWVk9SC/vi
         X/4r7GhBcSiN5vKqF0shEeXecxpB4bEbQ8H4QOH99Kak7IPvcBGBJ/gk3PdeWRRp44AU
         Cs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TltiuwpZqYUNrkoSwtmCGojBAiTWTBNMLzWk+hCRaCQ=;
        b=ICIG9Fs3IEjhlPRkZJsncXUWdz8ghHnjUkg0p+Zgt1TQR9l42jEN1nL9y+KabHwTt6
         zkpRE40rQmlBHWg+Vdl3aqFKMK2bOEves89GRR9SrnA9TZL3wnV5jy+hvAQV2jfoOVHF
         bzigIsg68VFd00+Epbx2uIBLdoMiHuo4m8YuE1GQ7uA6SYT6lUp7vOq7V/06IfWXIUr4
         EogJ17/seeBr+8sTgXOHYGsNq0uuP466rCIN+sNKZJWQHzdScSL4N2D+cuz8zoty8ShX
         Gd96kSuMcGA+ThdUJoPIDIeCTQ/H7aN2rJz5lkLMlKQHTkpftenc0iiHMJgm0Np/3rp1
         iWpg==
X-Gm-Message-State: AO0yUKUMqvDPq125bKKOWvt7UhaivoqAfZ3xv0yE4yCF3WbaJkWZKflG
	+9/MCGUC2Bb7Asn1DUbAofvsLCKrITnMPaQP
X-Google-Smtp-Source: AK7set8r68GojFoFklKZBnS8kTMYnc1wrkxoezhHL9297kY810Q88EFu2XcyOxJVJAXgIq99pb2o4g==
X-Received: by 2002:a17:906:c309:b0:88a:888b:c8b with SMTP id s9-20020a170906c30900b0088a888b0c8bmr13430552ejz.35.1677005767869;
        Tue, 21 Feb 2023 10:56:07 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id m18-20020a17090607d200b008d044ede804sm3241640ejc.163.2023.02.21.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:56:07 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 2/5] riscv: alternatives: Remove unnecessary define and unused struct
Date: Tue, 21 Feb 2023 19:56:00 +0100
Message-Id: <20230221185603.570882-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221185603.570882-1-ajones@ventanamicro.com>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_105609_612552_DD5062D1 
X-CRM114-Status: UNSURE (   9.36  )
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

A define and a struct were introduced with commit 6f4eea90465a
("riscv: Introduce alternative mechanism to apply errata solution"),
which introduced alternatives to RISC-V. The define is used for
an arbitrary string length, specific to sifive errata, so just use
the number directly there instead. The struct has never been used,
so remove it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/errata/sifive/errata.c    | 2 +-
 arch/riscv/include/asm/alternative.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index ef9a4eec0dba..9e7dffa800f2 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -13,7 +13,7 @@
 #include <asm/errata_list.h>
 
 struct errata_info_t {
-	char name[ERRATA_STRING_LENGTH_MAX];
+	char name[32];
 	bool (*check_func)(unsigned long  arch_id, unsigned long impid);
 };
 
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index b8648d4f2ac1..3beef400a971 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -6,8 +6,6 @@
 #ifndef __ASM_ALTERNATIVE_H
 #define __ASM_ALTERNATIVE_H
 
-#define ERRATA_STRING_LENGTH_MAX 32
-
 #include <asm/alternative-macros.h>
 
 #ifndef __ASSEMBLY__
@@ -43,11 +41,6 @@ struct alt_entry {
 	u32 errata_id;		/* The errata id */
 };
 
-struct errata_checkfunc_id {
-	unsigned long vendor_id;
-	bool (*func)(struct alt_entry *alt);
-};
-
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid,
 			      unsigned int stage);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
