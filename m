Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1C8C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtqB9mezKTg+OQcXDBwUw9rJykKN1mXsuNTnnqkVgJw=; b=syZYWV+5J/j83w
	Xc2PrTqoPk+PQsgdv2eMdZF+nXwFgTj5t12hKv8KTzchz4bGmB+hetty1lnCHp9kQE6pcm8MD5aWh
	rOpaGlzSTJQVNiHewuyVep0pEdvRjCFPx1HEMq812DpxIWvyR0NmJQ/389w5LuAtb3ocK5G1FKFhq
	TLqIBEtU3nJQefoE4YlSze0+1iOcxSIzdeqfRE79twKsM1Zuzon2Tw2sLPIp79MeLY62nDIIpWeyG
	Aw/JutkBjayC6N2SWmzPTIZ4ZLUOoPPOHHqq8S/mrbIAYbE1yHgKe6gNk45/YLzg+Zgp0bBtaZXbs
	DFrKZX7JV9v0NZRqRbJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea14-0000000HKTV-0eTJ;
	Tue, 30 Jun 2026 15:04:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea10-0000000HKRw-3HCS
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 15:04:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c9e9a8af98so13181615ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831886; x=1783436686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/OCyHXptIZem7abs2ebHUlpV5sUt3WFWdltwFGFKKo=;
        b=VCO+/gdmrBFNMSbfxTYLWdo9y1P7uztcPI+J7I3eS/Om9nDNSw5CwEqWsstGEYMhea
         +lhxNMTHfZgwLwQqbNJ8NF7ihE4HtOwQ6byTj1A56npcWYWvwuyYuIILKn82sPpTLbSU
         vRQSqPMtdC7++oszjoVhy3x2wVD/y0iceCZgLxELvDXJg9a7axmVkw1kiD5+6B8EGUF8
         ZYg4okFKBuHyJLzRVThQ2TdLp1s/J9PEom64wgKzpaYwR3gr5pMjNYRHZTczZBOAoHkY
         pArbqGeh/uP7qwpUE5ddndflFMcRQk89kF80IRgMg7c7m88Z7R+ofGxYtf/AyBrSDoAq
         c+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831886; x=1783436686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a/OCyHXptIZem7abs2ebHUlpV5sUt3WFWdltwFGFKKo=;
        b=R/8tiUeqdbqZ6sqcC6OaZaPfQkQh1WLfuNcj5+P8mwHAyyNN3P8ajTpzfTMuDvciA2
         hw0Fuhe315o/tREQmSz2jzcTB9Hhd9vsuWCfDZ06X9hwWxN2OgINOv0YVZvNgFaDNBCD
         cTGKW6lNwycgi/6AhOB2w4ZL9QH+OAyCiInLs+Rg14joiPH60QrM2snM4Kfi3Ix/bI+s
         y5n3ZqVAVI5ofxkflqI060FrZSVJ1Sx3vTZOXSTrHwGgXfiP7sAeI+n0+iz9Gix7qSw7
         ExwffkPG8uzt4bbImDe2cFAEF6XZA3uOh80l7m5xIikFdSp1efRa8zYx59NnEMhSNWBj
         bZWA==
X-Forwarded-Encrypted: i=1; AHgh+RrA0Z803kYCopplopJueO4kLpEMFLjSuK5k0kLUZLHCjR8AZZKlkt64pMC5EEbBSjR+cgOWOrd1rBWDzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwnTwe0GjQXHXrvCnZxyGekirydJHkThvJRb/PZzZPvFy6tV1w
	45QA/E/5c3EHrWg90knSWc+g9/5MyYNZ+vcHqolWTFl+Y5ZpzYPG4dCK
X-Gm-Gg: AfdE7cknE/3/6GvsqCbT3w/fERKIkfFxiv/GhSwPgjU/mPg7yR3d6vLnigrYMiL37Vr
	T5Vli+Cc8wiMnOTG6pGcp1X1Lvbjk3RxfVZtWqiLoNdtB8RkBfnlSjYg5ZN0g0unZ/LfQokU7wT
	qu+Z8Z+n8QEkVn5nhvzlsEPjSLninLOUj4CjnrjvTfPB3UpV4YOOFP0o7JrMX/3FX2K18OxRAp0
	cxOWYflH3ydqlz58f3J5eqIvE8wTkGEDivZd29DOLuUcJtvRaIdMJ9oBmfGsK+meg5iI7o980Ki
	f2l9DRthXDXS8TcbmF6dmPYkCq/0Fbf7ycABZE0m+h922HguZeEuvH8MCc50CUZV4X5PVyCUDuz
	CCnzzjCqzKXOVqoj75ioue5d0Mt+ZcymOz38TkorwpKPBcFdp4JLmufn14iB4iICOLF5wiQVn33
	iQMV7Bh+Y=
X-Received: by 2002:a17:903:2b03:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2ca2e713ebcmr29887815ad.31.1782831885805;
        Tue, 30 Jun 2026 08:04:45 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70bc0sm16250465ad.10.2026.06.30.08.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:45 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v3 3/8] riscv: remove unreachable invalid range check in create_linear_mapping_page_table()
Date: Wed,  1 Jul 2026 00:04:08 +0900
Message-ID: <20260630150413.1718632-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630150413.1718632-1-ekffu200098@gmail.com>
References: <20260630150413.1718632-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080447_111894_3E433577 
X-CRM114-Status: UNSURE (   9.26  )
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

create_linear_mapping_page_table() iterates memblock regions with
for_each_mem_range() and breaks the loop when start >= end.
for_each_mem_range() never returns an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b4d1..eb93c2ac05a6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1229,8 +1229,6 @@ static void __init create_linear_mapping_page_table(void)
 
 	/* Map all memory banks in the linear mapping */
 	for_each_mem_range(i, &start, &end) {
-		if (start >= end)
-			break;
 		if (start <= __pa(PAGE_OFFSET) &&
 		    __pa(PAGE_OFFSET) < end)
 			start = __pa(PAGE_OFFSET);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
