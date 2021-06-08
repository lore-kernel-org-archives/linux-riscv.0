Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11295C47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 08:26:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C627F61042
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 08:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C627F61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IN7qYijGwM+S0vU3Bh2hUbdOJ/r31BTpTcxDPpTl2uA=; b=4b3CExyi8j5l97
	z2hSvvb7sw1ma9yRe70ASCUQ3AbQt5Hp6AgEvTECXYPpA/ze4/y42Itb4nRknzJCKU3ft5HtTFrhG
	JRpb/SfyYVfA6+F8AUYQqHdxzDzTLgZ4S7IRcfsTjq7qd48I+ywZNkNOHT77cN8V/QF6gwlaD4709
	Eu2fQzuDaxxk10Q1AfSKt1acO3czjXNWltOCBlCgdRRwfxkpwn3GLFwWKsWvZgHur0rX54kGp5Rrb
	3vs4p9tCsCpRCxa1jW1iD0kAp6mfYe0pfHYn2+irSLBE5N7vmMF0adpr8ws3Nfo7AbxAcHrjQrVwV
	eaf2TgdCdo9yYNH8l4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqX48-00773V-AB; Tue, 08 Jun 2021 08:26:28 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqX0h-0075Q4-KM
 for linux-riscv@lists.infradead.org; Tue, 08 Jun 2021 08:22:58 +0000
Received: by mail-lf1-f51.google.com with SMTP id m21so15038636lfg.13
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jun 2021 01:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HJVb2LGejPfh29t52+liEZXom3n5/JVcXqh1FdpJjsM=;
 b=dvHqDKwxoDkrENfDceDUn1bvB1mhchMxK59m2UJTUuXDIsgD7JqWue970DZGsObZ++
 Vp8lCC4b2Y/zVFAgNcHCIb2tnxpT9vuztHGac452B+qZZqYjJNOx1zDURU0Ul145av+k
 iE4EWM5fF3F4ucBxEsSWhJI74b1adoUYANrzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HJVb2LGejPfh29t52+liEZXom3n5/JVcXqh1FdpJjsM=;
 b=LcwKFwf+eR9p8VTqXO8TJcWTsDG1UKkBRGAuP1rsxIzHGyAFK/CLY8AGz3wHGnPt2N
 fHoKgJsNEjeOyKm2GpST7uEW2YswmY5SM93t+zHvdq6pI2qcKQyNTHS/fSjXR2ije11B
 LnUWM1e0sfyPmhVGTFpKnb8OAjkQJTrmT2yVJ0PHCESOB06giEUfy6lLb+ddMrgcN9yC
 U8OeBX6mLHIKKpVhSAL/ICnCgwl5uglDZZwBNK8J/6WGopzz/yzr5JmL4UBhaqEwtlJ7
 REncdGOJj+eomm8mVwg8puDGu2xuQBCyQDMGxPRAm8UcwuH1Fi3hSnZ2axq76eekl4F7
 o3GQ==
X-Gm-Message-State: AOAM531aZXVyfoyNxWyeQZxhGorfU8MjOi24zyjNubXiGrYiF1XesTYM
 H6+T152eHEY72duFz815cnD2uBsSZ3frAsKD
X-Google-Smtp-Source: ABdhPJy6yMOsKcRwtUflnyyqogvJgKMKfumwbHovw8yrSpPqrE5M3xXA8z3c9DxRirhNbU0G2AfQPg==
X-Received: by 2002:a05:6512:3090:: with SMTP id
 z16mr8892372lfd.388.1623140513246; 
 Tue, 08 Jun 2021 01:21:53 -0700 (PDT)
Received: from localhost.localdomain (m5-242-136-69.cust.tele2.se.
 [5.242.136.69])
 by smtp.gmail.com with ESMTPSA id g6sm992635lfv.134.2021.06.08.01.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 01:21:52 -0700 (PDT)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [PATCH v2] riscv: fix typo in init.c
Date: Tue,  8 Jun 2021 10:21:27 +0200
Message-Id: <20210608082126.3240733-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_012255_703551_5ED3A5CC 
X-CRM114-Status: UNSURE (   9.72  )
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

Commit 010623568222 introduced a typo in "__initdata" spelling
which led to build breakage for XIP. Fix that.

Fixes: 010623568222 ("riscv: mm: init: Consolidate vars, functions")
Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ae32f78207f0..e7b136abf90c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -451,7 +451,7 @@ static uintptr_t load_sz __initdata;
 #endif
 
 #ifdef CONFIG_XIP_KERNEL
-static uintptr_t xiprom __inidata;
+static uintptr_t xiprom __initdata;
 static uintptr_t xiprom_sz __initdata;
 #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
 #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
