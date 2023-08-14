Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5345C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 04:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcCXwbFh49vK0J7djcPu/aVbeZtdt/g2PWtyhzmPkjU=; b=RdG+4vtZjfe6RD
	vIoKgeAAjN0NQ4z/C4uyQsRl1MYiXR1VHVqqmYscnznYpIAoUCW0bUPfwWCj65IADJm9cSakndPUD
	atZJfXndyzhDp3/6cEGRhbVzDZS8RobK3/zvmXHnN1bueGzaV/Xu49Dc9c+ZQ1NRC8E8Sd3BLSbJz
	DGSNihBmMEixi/pnBjyGXUN/8urk5x+VCc+3idYbFM4B/dlktUxN8wUIR4hk6SVyWwDRi64JgN8YG
	BbC3fLf5R3f1/D6VcW6ixijdvq2x+YkvHnvn+XBG6od9GFTLR3STcS0mYKcAIXgYz2U20Y97Mu2Qj
	Kp37b8980gYlCPhvJoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPad-00G9nZ-1O;
	Mon, 14 Aug 2023 04:54:03 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPaa-00G9m4-1r
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 04:54:02 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d684d7a2a67so2011106276.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Aug 2023 21:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691988839; x=1692593639;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ogJuvI0Lkf+Yuih+DurfR+W3+Xn1MA7RZzUQYmHA7YU=;
        b=0RKzIn6koDHsmNKD3vUTVlfy+gCsC8Zdom9GW3R9G4boB+i1A4mdfR/DviuW1MzfJI
         iBrHJtyqYWeO4rOjXtB0Z2aNlE9OOvtV6k27K8Ge5Fn5TzMRMzDi/r6+eBbX2mG7wCwD
         jH7Mx6iAvmDJdH4gltsCakJoZrTdKq2w3lHeW8ZSX0nw1E25+43Mek7tspDJmoMkE4VT
         H97s1SL2MAzHbsQ8Pux27ezOy/4hhf14nAW2W2YgYvTx9+p0ZDrHJvMUT4wJi75UIeAI
         f6TfQdqDrAILsoH9d4kQkrFxg8KhPsIvkz4XrSsFB6rc3hMbNrx1B9ZlAA2W3qYww8Ic
         T5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691988839; x=1692593639;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogJuvI0Lkf+Yuih+DurfR+W3+Xn1MA7RZzUQYmHA7YU=;
        b=RhhlGhggNC0bpChaIVgfVsnL9dCWb3mNonZmzjdSdkk66SqaPCdRRGKuCUVMpXxiC8
         4G/uGNfa+ziAvYRJqisv7lCI3WxKH50695jkg/BXr0rygq/WwetdG9v3DCUiYotZclqh
         tHktAHRgtB2AdvNJwDcDaF9f/74UFerhxFJ3O99KszsPeD6Xc1oZq+/bK0LYzyEU/TaY
         AnUTuiyI6OV613GswswKtW/wazgZ9KLgRa+hctMNH3znxu93A4vKiOR+7yBDgxOHP2jm
         dH0JnSf7XoJiRJeaOaqLAfHGKYDvaK09ZnJ6k63Zt1ulYZv0tappCxOtBPfFVxYWe8fv
         JAdg==
X-Gm-Message-State: AOJu0Yy+Xje9n3kW7ZJbE5Ntkbo5wDoS7/1XBHFS5QaRYHX3GwCG154n
	W9jzoH9gR7Q8QGcqLJhMGjTwkpQOhS/DeM/q/vm+uw==
X-Google-Smtp-Source: AGHT+IFplfKuoRRn6Epo2m0elbmr5ruqZVLwUt9AiRMx3Fs4tCTDJsrnYMhza9hSiTIGD/lg4DaPxA==
X-Received: by 2002:a5b:88b:0:b0:d32:b6c5:d5a2 with SMTP id e11-20020a5b088b000000b00d32b6c5d5a2mr8728372ybq.17.1691988839274;
        Sun, 13 Aug 2023 21:53:59 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id e203-20020a2569d4000000b00d682d2d1d62sm1286312ybc.51.2023.08.13.21.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:53:58 -0700 (PDT)
Date: Sun, 13 Aug 2023 21:53:57 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: [PATCH 3/3] riscv: include asm/cacheflush.h in asm/hugetlb.h
In-Reply-To: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
Message-ID: <84bd3b96-8dbe-51b1-d7d1-6e4f9d8937d8@google.com>
References: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_215400_635977_417A7833 
X-CRM114-Status: UNSURE (   9.45  )
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

PG_dcache_clean is used in asm/hugetlb.h but defined in asm/cacheflush.h:
builds rely on an accident of that being included via linux/mempolicy.h,
but better include it directly (like arch/sh/include/asm/hugetlb.h does).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/riscv/include/asm/hugetlb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index ce1ebda1a49a..34e24f078cc1 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_RISCV_HUGETLB_H
 #define _ASM_RISCV_HUGETLB_H
 
+#include <asm/cacheflush.h>
 #include <asm/page.h>
 
 static inline void arch_clear_hugepage_flags(struct page *page)
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
