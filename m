Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DC3C00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 03:58:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D8ED20786
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 03:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASLsoWgG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R56Wfw3l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Z1yjpyzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D8ED20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wi7Sk0TC3uyIjxlPkZVRsnUTscl7Rgrx8fE6fNk8jA8=; b=ASLsoWgGpD4cUEGIDPSOg3DY8
	8d5YIHL52mZQERNORuSK0B9x0OZJo/10qNPB0YDUKyNAkmIFmHheY2zUtNKIQlzLupCqWaKEpuf8D
	b6Jff12UjOZ5mWomNts4p8w3sQPtBbJATp+SngXK/2/oqS8W2VJhYunzj+XluTxLZfTM5ri3qpfy5
	R126ekUxYlUpbAbX8OP3B03frfh62xLtecwBeQqMZu3psGsHVA4tppwe6e/IV6bYjjHIbFRAVnhPV
	4iOPmR/wCKbaQNfeZSJItOCkhfkKHbe7UBhr7RtTCt1T5CZWVUClsRQkJ4j8IT5xgViPa0QbrKlQy
	wVIKMKv9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaWQ8-00019y-LG; Thu, 05 Nov 2020 03:58:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW3j-000145-GL
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lH2y92oqtZnppQRWSLWkTShvADPUOTeRp5I71/HZKts=; b=R56Wfw3lIBk5y/Sp0k9oIOB1FF
 CdMuHgZ6+Q5+kGGv8Xdwx/5cIOTYEnUdPqo6XjDkQXRvgBjWrEqGqI5hEGGyW075Acqg/VDlqwOlP
 0jQ0O7WqbyqL3mDyuoACtAxT6rEwRwLcvhNiX26NHm99Tzc0rkHJ14HrlGeCfbkjUCLYzXqOgGfLa
 +Pn5i4tvMPZ1boeOXK2TXHgd05wCWVjLHdV7VHCvrl+QXyTMziQ7kSNZLsSWu1KlmLPgU3B+kynyr
 fpANr2/+C1+/MDW86ar++ON0F6FYVR0C9zI6q5UXvs9R6lUkFrdE1jEUyeJbE3vx2ET4mU3T6WOnq
 8T42U1Pg==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaSmn-00012o-3r
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 00:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604535648; x=1636071648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2o/pSqwZIsTAsEbERDtmvi4jQRx0V2hQUyDY+mRsz0s=;
 b=Z1yjpyzniAQDR2m2NYW1ZykQLgiFI/g40/zHe3PcJLAU4JjtK6JSgO/5
 Ovofon6zmAU5qnA8QjIdbT6YAPe3mb704rPmbqcMPNJEXI2KqzQJcCZh2
 YHCUk46Vau0pRWKQwr1qzYBjIOT7fGH1U+UsGI1qBByH2F+d/IDUVCzzR
 oVN7L6XTVIHib33Wvh1xnop52PdDAhWXnzfPwt2n+31H0hEO8C9xW1s4r
 CINSVeyF3s8Mk5bVexK2zwXPeDBg8a90w5AXFolYF2k/zOx7smZztTAhs
 AsLhE5g7/Sch6MSX7yFzhUKPz4xwTNuCOUf7lT3guwz41kYdG5fHBlWJc Q==;
IronPort-SDR: /jVRjafvrUnu0Ued5xR918WwgdBK2zAPVzI37jEpmBTvkksT5RAlYjiCrRre+f7Wclo/WFaOxS
 N5QavusCQ67EbsxjWdN20Xz9P5vqKym+hHl2T5MpmHm7T708UPDbh58BsJQaUKmtPyosb+STYz
 OjLeo6IvSr8CqO2ShNzFUyjZzXmiDLBD6XzRgiCN4RMTCOc591hB86TkRmtZWkSx+KxaVIAQd8
 svYnbq2Sp9/wZ5ubZHuHgJbvWp+rT32+ODrFISaOzvYVlcwWUYDpLFgOWuxFfiZfuHaXv0M8Zu
 KjI=
X-IronPort-AV: E=Sophos;i="5.77,451,1596470400"; d="scan'208";a="255394927"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Nov 2020 08:19:28 +0800
IronPort-SDR: kY6Sb2CJrBSGn0yOCmRwYuUieOkgE6Mr+x3iAQMuTh2VCtxtJu1juaHKEjJ8wYJ2mMrxjdk+hG
 6zGWn56otKrAeZ0q9WHeMpq94Km53QQIRiOLgEgC0wm4QK1UxXxymdH4r2jq/drHxjZfIdpJ/v
 Pd80DWxPlFgQ2msap2LaLPRGakZ7tNv+adyCIPL8Hv37uELg9J7s4mMvCIUXNMRtsbbw5bRK6P
 ZEqF4/3QosjvWlUX1qIAiAID36D/wCOwxxTrYtyRuE5UFj1Miy9VM+f5coOLyHqJz07ByAw7jK
 P2GMq+ZPLZFwZvT9JfjjEj5I
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 15:51:07 -0800
IronPort-SDR: CtPiSoKUeSrgYaq6D8avvUoNBth1SV31qkH08edSmw/qTywf6d2WcIna1XWhLHD8+R/7DaMQZ/
 ETOVXtFpxLKPetK+qushwOtnkHBtD+XkJUFZD8Ns+1hSSyfpKf05rbG7b4WR1JV61U1Wc7fn7h
 cfdTHuA1bzwDNReFgqgBlp7D1jb/ItXwtfyy25i5RJh6e1hI4wLnqggQc8QpdYVxIk4lcVJazD
 VyCuRnB4CN+6EJwnyLZoRgSiQ15DYdXaZRJVDbVX5ae86tlphk9bNEF5roGpH43z+FnpKhPSPj
 pto=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.117])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Nov 2020 16:05:00 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] RISC-V: Initialize SBI early
Date: Wed,  4 Nov 2020 16:04:36 -0800
Message-Id: <20201105000439.1491243-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105000439.1491243-1-atish.patra@wdc.com>
References: <20201105000439.1491243-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_000553_566592_28E955EB 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <ren_guo@c-sky.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, SBI is initialized towards the end of arch setup. This prevents
the set memory operations to be invoked earlier as it requires a full tlb
flush.

Initialize SBI as early as possible.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c424cc6dd833..b916f4a904c4 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -89,6 +89,9 @@ void __init setup_arch(char **cmdline_p)
 		pr_err("No DTB found in kernel mappings\n");
 #endif
 
+	if (IS_ENABLED(CONFIG_RISCV_SBI))
+		sbi_init();
+
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
 #endif
@@ -97,10 +100,6 @@ void __init setup_arch(char **cmdline_p)
 	kasan_init();
 #endif
 
-#if IS_ENABLED(CONFIG_RISCV_SBI)
-	sbi_init();
-#endif
-
 #ifdef CONFIG_SMP
 	setup_smp();
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
