Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1072BD6A230
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mcI58KA2fx/PeEeeVsj5Erp18133N4UA0xo9zCda/Qs=; b=uGWtmutttSzRyV
	YgZaSmbo2UjWh1IMp7YeY/voUZwDbss2ZwC899Xak7ghbgULwOKhvPdd9CecrBOpr8syOxQLLhCCO
	CtUMV2NPqrP02b53OfUjWL4xiRFeGr1+3ci335vm0EKCt2Shn4XLvYoaAC0O9Vle2dkUG4auE+j1X
	F1R0ErXKQ8w3iP6TmFyRfCmZqjASGFEm2GmVUzYSKinmbJ1tr70NUcawxOqHwwjNMyaSVv0NquanX
	rRxScsDwHet2JQ3FWfclRtX9pgjQ6g9lNMjQbfoJjhkRswn33+r6+CCRNMCT7nckmOP5DpEWjwWOa
	JF8iHynGhTqfdSzsIXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBhP3-00000000skn-1WaJ;
	Thu, 14 Nov 2024 21:29:25 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBhP1-00000000skN-1Abr
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 21:29:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20caccadbeeso171575ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 13:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731619762; x=1732224562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EuHFw6q03XCp7lup6jLddcHFjKtqe3X8eorkDm7w/hA=;
        b=N195HkiNQZReQyM59XQef5DnqGq1Ba2IKVb3pmrDkwPZOeujqnstB3nbAEK6972htv
         7ViRpCEWD4hqJu2UVspHhYWnctrQGJ9IxsnM46HJIAYNrMCSKA9HUORhcrUm3KAgP0OI
         c9V3eUf1Yx+u/xgtRTlY/XP+ghbpZc0vep6vZ+LiOfxAGE7UNqQPp0XMMITPZlvzYSWp
         H6HzcjueDGRi2eJHxnSGY6028BbBbfMAVnSY63VERlGK7qSlr9tepkkK9fRFRMjp+yW9
         CP6rUKnHcakRLoZad1ZE+ChP/9sk+PVd+6n1RVy5IYa8cqCkyiIo5ew00Sgqsvthr+Cx
         5GFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731619762; x=1732224562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuHFw6q03XCp7lup6jLddcHFjKtqe3X8eorkDm7w/hA=;
        b=XZ2p7iL/7IzVFA81dvrW0nML7eI0zB+E9kAQyKTRSleyC3VsYrWG6SeDs9HVG+qaaO
         RUdTdRuIIJ0b5QyTSdQBdLwTlV58q6c4/DwHDWB7blcMhOJUJh8vtQqAF6cYcfE2v3jg
         8AtGoDTdwA55h9shikeuMZVP3EdnbCtFf5We1IEi3i0NbBpJX5IYxf1GPkkFIazNJwSB
         xx6V+VyhV00mlyDz1SYRIfrE7Ia2xwX7tvxQHB1kY22aIO4Z1uoqtnEdLVzCxeIyB9fp
         aLxgwltSQx6fEVB6wG3K8F0j9YYiiKfvRGnO4D1wljKnCVErlHP6niu8Y3JCQYLRABBG
         RWwg==
X-Forwarded-Encrypted: i=1; AJvYcCUaD4tQae4Xq5z15TxAwLjX6bSjQdlMLmhIGLa2hMQQsq+vRaSSnF//yK/3GcBDh2Eu2ZIdYrAMbFKGVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpJtCFQ3sLc3VHEioyG+R9oBs3mABRCZLgx4aSnmEeQNUcqxmo
	jaxXRBkyCHTdBUlRPfU4/+uqF+Q/o421qGUBqF+DnYBj519GZrD0
X-Google-Smtp-Source: AGHT+IFyJEUxPZNPdrNl3tzCmtz/Zc9PrJDCThXArRtOM55/LgUVKGi1XczAzWCBjI9vkEB7+knyCw==
X-Received: by 2002:a17:903:2a8e:b0:20c:bbac:2013 with SMTP id d9443c01a7336-211d0ecead8mr5050745ad.48.1731619761915;
        Thu, 14 Nov 2024 13:29:21 -0800 (PST)
Received: from newslab-Z390-AORUS-ELITE.. (pc51.csie.ntu.edu.tw. [140.112.31.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f45641sm832945ad.177.2024.11.14.13.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 13:29:21 -0800 (PST)
From: Chin Yik Ming <yikming2222@gmail.com>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	atishp@rivosinc.com,
	charlie@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chin Yik Ming <yikming2222@gmail.com>
Subject: [PATCH] riscv: Fix a comment typo in set_mm_asid()
Date: Fri, 15 Nov 2024 05:27:25 +0800
Message-Id: <20241114212725.4172401-1-yikming2222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_132923_318105_A5E29729 
X-CRM114-Status: UNSURE (   9.91  )
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

s/verion/version

Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
---
 arch/riscv/mm/context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 4abe3de23225..55c20ad1f744 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -158,7 +158,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 	 *
 	 * - We get a zero back from the cmpxchg and end up waiting on the
 	 *   lock. Taking the lock synchronises with the rollover and so
-	 *   we are forced to see the updated verion.
+	 *   we are forced to see the updated version.
 	 *
 	 * - We get a valid context back from the cmpxchg then we continue
 	 *   using old ASID because __flush_context() would have marked ASID
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
