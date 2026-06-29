Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE85C43327
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pET2U8ht/Z5Y/tM5xu8xvsgu43pJmHt3P/wNJHdVjWU=; b=QPsg+HkNLBhc6f
	wZIC+vR1N3EhZu96LqYli0UYsfuzuh9XULIwokaABRn2gZ0YC3RhhD+4GA/DQ6wZggbOBK0A45Fz+
	jbRjGhoif0d9yI3E7KhqntRX51JZ0wWqy1MSm2LU4UolyZSMm3fAZIvfNl+SgZiHFsQ6/cGNqOF/3
	RYbRQ7RZg6+pk0t7/l1GLKRj53BvZchF3BUy1N5Ml2R0OVyfdGOk2AmaGkmL2BEYxsJwLKBBPZqQU
	O1vvSMG77DDT3kJzsEzvBFGTaiipFRph58XN1uqyLlgWd+zxxAaIQQfx+Jbxz9dkA7MhPdpVtps6/
	HNGGT741n0w7wrkeg98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzv-0000000FEEJ-3l9Y;
	Mon, 29 Jun 2026 16:38:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzt-0000000FECc-27M5
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 16:38:14 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8454160043aso2972325b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 09:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751093; x=1783355893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ+KouBHR2A5cU5ulbS52ssZaf2NlH3yq/de1XOWkF8=;
        b=D5TwW0xAUQC+6qOwKZgsSiCz6v7gYRb/r7wd0h6u/cRIKWjlkzubP9AU8ZWS+7AVg6
         1Fxitc59I71fDtwsXLGzyoO8ZK6xR5pvG2wzQ1iqU+gGCSdiiz48g6p7h3T/ShTsVjub
         i2n9afnYDkKdQn10U5IzWCzcOxOJ2j4JGHielO+U+qXfujxO7zz2cdOF6TYtePrXHQ6r
         zV9m/p672v7uVA9xokAYlkLh0A4W0M16gx3Q7YM9H2s4avl2KtjjDk0D40ZKBcBvEq00
         nRR6nQas+xa6QYN0Z0KtxNQuiHNiLdLpRUSDB4g/nr/c9x8j2CjRQxkga5ISmeKBt+1B
         N1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751093; x=1783355893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZ+KouBHR2A5cU5ulbS52ssZaf2NlH3yq/de1XOWkF8=;
        b=bbT6N1JqrsXprG7PGfl5B5fp45B2/b7qYgtWmCeKKlt8v0sK3sk2IMr6otnX79xrrE
         Pk8Mxx71eaLH8gY45O3teQMguZR/EH5W/OvjnURx7kLjf2/df97mg9Y5L8wXRnbdZQoH
         VvUQIGO8rASjma0uH0HwNE6pV+LRd43Syl9BEydJEEZAxlMUYVAayNNITzWO5Ux3D43v
         51LFru8g33laesbP+1PIytF1NWMBKTA1etr/njHP9VTPcgey0z/KGhWVJqH3A0VsBpYr
         Ri9UTSgOfARHGJsmQPQgmyJIgnrC5pO4PgoF6oLMv81Szfg5UAoPBuyiwvlHCWf5nStg
         w2qQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1v8J/N7cxL418yyFA1yOAJB5/TT8QwIu0LYYP/xvctZoOS7eUZHRtePirgVDFSXBvv0wIst4lKAPlTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXPACpg6yphFS3nF1qL9LfeQQKqjhECv11BzinzlK++TwQBKsU
	KOspDjLUzl6VRwC3YkouPm50U1bMPYHEy3AbhE7cPvaa4Bt2t9cPBBDd
X-Gm-Gg: AfdE7ckjZmhX2IRGiDrKTBFeyu+nCkc+/p5Ih05WOPA5O1RPscza5T5kkYmm8jNyk+T
	V16MZJDhfqM4SW5D+L1DlGdAdaQd5hxo+QYcEI/MUOdsooHWgikKwfl7NeLiGMho/XBpMneizwU
	nilrHCwSrNpMkKJaLjtS/jIF5o/C5sMJkVd/1O1/aCE/kXOvi4MjSUIjm6FqJhwITBom6wMuTFE
	cT3Vqr8ARVRJIESFSoBkeZZquhaSLiF9vpjpgP9J7cbOTLgVC6arzrI1FthvjeK0BVh9BvqzOew
	2xtjQc6cXKBHc6mkYvjtPxdDyiin7CvzHpey8AaOUAE7dNQT3vv3F0vF1I6FpG9dCfg5EUp7hjr
	mIi/LDnSXmq2cNQJzCMx3Q40w+vWadyRZN7j9KT83lC8amV/kk/svnNGqLVloLE8mr7zNAjU66a
	9r355a0oM=
X-Received: by 2002:a05:6a00:2c85:b0:845:d286:1fa2 with SMTP id d2e1a72fcca58-8479f294c12mr202789b3a.49.1782751092673;
        Mon, 29 Jun 2026 09:38:12 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm18474b3a.33.2026.06.29.09.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:38:12 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v2 4/8] riscv: remove unreachable invalid range check in kasan_init()
Date: Tue, 30 Jun 2026 01:37:32 +0900
Message-ID: <20260629163736.1606688-5-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629163736.1606688-1-ekffu200098@gmail.com>
References: <20260629163736.1606688-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_093813_544805_A3B46272 
X-CRM114-Status: UNSURE (   7.79  )
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

kasan_init() populates the linear mapping shadow with for_each_mem_range()
and breaks the loop when start >= end. for_each_mem_range() never returns
an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
---
 arch/riscv/mm/kasan_init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index c4a2a9e5586e..1f3aa9611187 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -512,9 +512,6 @@ void __init kasan_init(void)
 		void *start = (void *)__va(p_start);
 		void *end = (void *)__va(p_end);
 
-		if (start >= end)
-			break;
-
 		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
