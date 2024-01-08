Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BA0C4707B
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DB3/T/t0FM/jPoLM60N26bZS+7GupNpWMkbWoDfAez4=; b=AAiIJZ8XDZIbHf
	tCSAyjXO23jT9IQFqUeY8RcQw2KX2RtxWjgT27RPxBVy/azm89vMpkB/H4hD8VFy4xSO6EHSwGxu7
	ETLanhzNMhumxWFImvYL8OvB/Hv9FH6PpIZuAYp/oh7Mztwwrym083kTy0JoWcXXWjFTR1k8/890t
	p1B34mlfJHsP2V+6/WQPQr1u6IQh4ltJ1Tui94X+SJT4r0/mx3FYzfUZx8OKS9s84aI8VXR7+7BD+
	h2ld7T6jov9ZwNmd1U3SntxdsICP4egjTXyU/1FCmaB3IMenANYqkUTqrEgI8dfjuZS7G4vTe0xft
	mw6umVTbvzTf8z9rToIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMzUt-006U9r-31;
	Mon, 08 Jan 2024 23:57:35 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMzUq-006U8K-13
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 23:57:33 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6dc035ee106so1567424a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 15:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704758248; x=1705363048; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjqGV1Kb/P5zbkrU4HZj42U242Y4ucdb6cKzFhJu16E=;
        b=RNTNOQB9Eq00z2c0NEaQzGd4cO+/fBsogT9zppWLjDrPcu8TtALRQOum3wO51NEkv/
         LZeGxnS0KAaxbL6IakxaYf5TmzEH29KHN9YV1O9zYRwFf4B2ci364FLRnkBOVETkCWAl
         CXIqM2QfvTCzRvRv0UNt3w49k7+iV5oUqgGXxst2InaRwLuTt8bUT4zg7nnYEosK/QqX
         sewqJuRN0btOpvzSFnGUPKMZtRHfYkl0P9PbAzMyxHVg9ihmqC0fxeHQIVbOYNYCQk47
         MafCX2xtASiYGDnPTPqyPfKiSQqsxa1Oe6X+jXQHylC/c6IcYd9kz/Cga4PLlJORQacq
         vd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704758248; x=1705363048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjqGV1Kb/P5zbkrU4HZj42U242Y4ucdb6cKzFhJu16E=;
        b=nS/H6QyxoB23f5fnCDtvpSp5ITkLkX/GH0+omR+3TMZzQTarr0fK+fknvPnwG1eiIj
         WtZ7a+ml5cFfurdAipDyonJ9fJZpteIUwmqM6fkSxzNCvgEpNBs1ZXK1NCfLHXZ9t70X
         D/Q79xRfPh+beqhh2v8MKqqi/me/1APBWLF9/u/Uc9yy+bHMQ5SOhPRP6j3CvQQZinBP
         YohNugQQxcktLCCt3iFhRopsraGHHy9XBg4/w8FNQTN0yHM4hUrIcjfOnYwZw5QoopyK
         dhQqGC8d+gUBP4C4rsQYKnfEHgQUPEJSVdY51eOnEyWyiXx5Gtb6FB2PEMW0ogtai48j
         SBsQ==
X-Gm-Message-State: AOJu0Yx1Sa1pVZ19g4iGp2DrGOABPD7cJcqidhy+W7NILtVtVhQPcSwR
	7hUbtVBfrQnnLxCtsaBReR6+Vjkaoxqe1g==
X-Google-Smtp-Source: AGHT+IGQry5FngBouHtCJlB73roFuMMiD2RmGNpHEaUJeqIk9NLJxd+uUJJ8u9/3lO4n4mix6w/Mtg==
X-Received: by 2002:a05:6870:a693:b0:203:f6d7:56ac with SMTP id i19-20020a056870a69300b00203f6d756acmr3820090oam.41.1704758248550;
        Mon, 08 Jan 2024 15:57:28 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ti5-20020a056871890500b002043b415eaasm206961oab.29.2024.01.08.15.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 15:57:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 08 Jan 2024 15:57:02 -0800
Subject: [PATCH v15 1/5] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20240108-optimize_checksum-v15-1-1c50de5f2167@rivosinc.com>
References: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
In-Reply-To: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 David Laight <david.laight@aculab.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704758245; l=1517;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FtbING0Tg9V1myoJvDDTr8ph0mEbsa+4mbxe/ijBRBI=;
 b=7r6kXj0tvZ3nmSEETfM1OlN4zd7puktubukkDWBtnhShCRSbOxjwiowPmVGaKKYKRLlM376Yq
 ZqHkuglS4CMDfUYCDRQMLWt+N1kY6Y8vCWegUTOjouX59Y0U3WlA5rI
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_155732_360516_DA60509F 
X-CRM114-Status: GOOD (  10.88  )
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

This csum_fold implementation introduced into arch/arc by Vineet Gupta
is better than the default implementation on at least arc, x86, and
riscv. Using GCC trunk and compiling non-inlined version, this
implementation has 41.6667%, 25% fewer instructions on riscv64, x86-64
respectively with -O3 optimization. Most implmentations override this
default in asm, but this should be more performant than all of those
other implementations except for arm which has barrel shifting and
sparc32 which has a carry flag.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: David Laight <david.laight@aculab.com>
---
 include/asm-generic/checksum.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/checksum.h b/include/asm-generic/checksum.h
index 43e18db89c14..ad928cce268b 100644
--- a/include/asm-generic/checksum.h
+++ b/include/asm-generic/checksum.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_GENERIC_CHECKSUM_H
 #define __ASM_GENERIC_CHECKSUM_H
 
+#include <linux/bitops.h>
+
 /*
  * computes the checksum of a memory block at buff, length len,
  * and adds in "sum" (32-bit)
@@ -31,9 +33,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
 static inline __sum16 csum_fold(__wsum csum)
 {
 	u32 sum = (__force u32)csum;
-	sum = (sum & 0xffff) + (sum >> 16);
-	sum = (sum & 0xffff) + (sum >> 16);
-	return (__force __sum16)~sum;
+	return (__force __sum16)((~sum - ror32(sum, 16)) >> 16);
 }
 #endif
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
