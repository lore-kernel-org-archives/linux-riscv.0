Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339D4C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 17:19:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC3961184
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 17:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFC3961184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov15d8tTNmaeufN8Bij3BLTmP10+3Xn/SLrhgs0MLoQ=; b=EPnx6eA4FB9MRXR5tcuNg7JvHb
	/7eBr0nIOmTjmHMkm7o6fW2fqn+dSgmgWI88etCtQrIlVROnBzSF7lxuq7gPNwABKS98BCxN7glLE
	G1sIOAEtulDZSc+kz+XzRn2a7FxnwOdwQSQUCMhrG0cxPCIz6ejYyF11A5VMXqToIHhqwTlmvgCxY
	Hk0XvGTLJ6LENaHUkkN1qs9QLXOxjwxOnGwvC9Otrjv1gb9P3sO7iFPbl0olazSifudOUbuBU8QLd
	zr6jLQZfvWvd7HLICA0l62vVI2ehzG/0Q43VBHnDqHpdE79MsvQ0etoSuv1DCNnwkIIApgFQf9M/f
	ZHDiVabQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX5eX-00GqaP-Dc; Thu, 15 Apr 2021 17:19:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX5dG-00GqBu-Cy; Thu, 15 Apr 2021 17:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fh+2ixoLTPew6SeovzvmzT1cMZnLdSwFOwmbVP8LXs4=; b=sCL7yoo/L+7ZfpHpiLXJ02c2dD
 3P2wJXLeMeUXY8OYR2YHTOopicll7Ttg2DrlG0YqbuZAJaH06YI/5wvVAnn0l5ikRPfSwmaOAuf+M
 mE5hCghENlfp3mqksZaMzc/Ipx0aoroeakmBHrvh+6O+wWNue8kYPp1JFBaxuGKdSISBE5eQnz/XR
 dncIR835jNcb/zTGh9kXlvKInr9RNTx7QeBsplGBAke3zIhMke48j4Y6PI94g3ZT6CIZUgyDr0uqN
 VuHHw7NtMljOZNCLoPXR6SHntqSnTbHiAJ3Ty3jeSHPxNSuUJet5MfMVsQ4nngDPM0kV6UDUyFOXm
 3OtWzCeg==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX5dD-008lmw-Lb; Thu, 15 Apr 2021 17:18:21 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FLmJV2HD4z9twp2;
 Thu, 15 Apr 2021 19:18:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sbTtLwb0wT4h; Thu, 15 Apr 2021 19:18:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FLmJV1TDDz9twp0;
 Thu, 15 Apr 2021 19:18:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 080EE8B805;
 Thu, 15 Apr 2021 19:18:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0MknObgQkv_3; Thu, 15 Apr 2021 19:18:17 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B838C8B7F6;
 Thu, 15 Apr 2021 19:18:17 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 96B23679F6; Thu, 15 Apr 2021 17:18:17 +0000 (UTC)
Message-Id: <f41a177a0fd5a71db616e586a9ec5c51102c6656.1618506910.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1618506910.git.christophe.leroy@csgroup.eu>
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 4/5] mm: ptdump: Support hugepd table entries
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org
Date: Thu, 15 Apr 2021 17:18:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_101819_895594_94BF6D98 
X-CRM114-Status: UNSURE (   8.65  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Which hugepd, page table entries can be at any level
and can be of any size.

Add support for them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 mm/ptdump.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/mm/ptdump.c b/mm/ptdump.c
index 61cd16afb1c8..6efdb8c15a7d 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -112,11 +112,24 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
 {
 	struct ptdump_state *st = walk->private;
 	pte_t val = ptep_get(pte);
+	unsigned long page_size = next - addr;
+	int level;
+
+	if (page_size >= PGDIR_SIZE)
+		level = 0;
+	else if (page_size >= P4D_SIZE)
+		level = 1;
+	else if (page_size >= PUD_SIZE)
+		level = 2;
+	else if (page_size >= PMD_SIZE)
+		level = 3;
+	else
+		level = 4;
 
 	if (st->effective_prot)
-		st->effective_prot(st, 4, pte_val(val));
+		st->effective_prot(st, level, pte_val(val));
 
-	st->note_page(st, addr, 4, pte_val(val), PAGE_SIZE);
+	st->note_page(st, addr, level, pte_val(val), page_size);
 
 	return 0;
 }
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
