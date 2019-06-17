Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F64C31E57
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 10:32:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A026D20863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 10:32:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eUJC+05D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CXjiCRQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A026D20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIhcyZyUf+SxdBRmy3ujV3ijBEsarkqEqYHcJUS/4ik=; b=eUJC+05DqWYAbn
	e5UIwk+h6djerBy5T33ugPHsgfC0NzVybISC550kdS1j+c7xLEDzZdlnJVnrRL/Ak6aIBEgA4XqlO
	jWahHxUN/CJhba1QGkMi9tpQW8OqZr/cbXZRfQYiIMg4YqR3TnF/HqgL4F1DzUUAh05r9xsu3JSME
	hrSwqY3TD+QizWvaVkPsNK/W+YtwAgz6T7QqB9LOm2P1Xme4TtCesPV35JguFQaDFMnAhWzAkRc5v
	shTNsX19wPTv26wWnYxEb+aWU/XvZgT1Zjaz8dMruOzwRgfjJmJM0IZEllM9ZS2mZVQgmYVierOXU
	8K0fR1cm1Lyi+4JAr8pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcowZ-0003lj-Bm; Mon, 17 Jun 2019 10:32:55 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcowV-0003lH-Sc
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 10:32:53 +0000
Received: by mail-ed1-x544.google.com with SMTP id p15so15404672eds.8
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=+IsA7g8VrQi1p6+0rUAfrYHbZxeNW1x5cdILWDPWHeM=;
 b=CXjiCRQZbi5X8btQTrOIGbRQXdZX3a8516roFkgeXdsCioqn/JwMFSuGg2Ey5MbZ+O
 5DhR02+EU919lh2z1jxpjoUPE67XvKqzxK2aJjiQFhp4NJAlkF/3S1GTkzmV+ClxXvYt
 iISU9Omk8RM9Y44LEGHLrFDKScsh6qZwSRjith6zHSKhN/u0H02S8HlmiVfUSa5NdXI+
 nCXNb2oGzOspj8ri4JiC67txEYRkq3j2a2zE3mZ7C8J03QbaCg7S/VGRVCRS7ykTOLfH
 JL1hBaAL++VxYzI4BSL1Ssr/8l2/P4BwsaMuICH0qqUo75MYmy6GfUiNd6/VpYRbAp8E
 U2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=+IsA7g8VrQi1p6+0rUAfrYHbZxeNW1x5cdILWDPWHeM=;
 b=cup6Rr4IVL6OU07WXQlMk5EEOgrsMkxP+t24FV9wCxEJZUd+FSZmpYRR3oQbELTZMh
 gXSPDZmHXMwgqkvKvdByaogKbjrhdsw1tagqzdsKkK7L7wVxNGdgAgLWrwZ7btQXi+xL
 0k1kCVGM2Wubn1sqzFSVmYuaZV3Wy2lDbyptzaZ3Crq3ChgdsBUNE1JaarNcaKcumib8
 C7mRnJK9TI8UhWhcHAsbua1Q2/05t+2DxG7Xq1dwOqJywO5g3fdDqD4bIVURf+yHNSxx
 7eAT7RMmc7eXXpMApwB8G7KeqVLwC8DHI+o9pgGmH+SKsHfvWhGPBjjmUyTUluMKhOg+
 fxCA==
X-Gm-Message-State: APjAAAXf3pIp51wJqlQYt9ASlE11p+Q6kDDXJwPGheVGf79/Whx3HB43
 nkM+9EU5ncAl5FTTGGEjdhUp/Q==
X-Google-Smtp-Source: APXvYqwnU3Jslq6jxVegXAsmGj8PvJyDKbQzfvMcZlBL0H3PtYK1yRgW/NRELzzJ/8NU2HNPYZcqnw==
X-Received: by 2002:a50:b566:: with SMTP id z35mr84088733edd.129.1560767570383; 
 Mon, 17 Jun 2019 03:32:50 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id z3sm3637022edd.72.2019.06.17.03.32.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 03:32:49 -0700 (PDT)
Date: Mon, 17 Jun 2019 03:32:49 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: ShihPo Hung <shihpo.hung@sifive.com>
Subject: Re: [PATCH v2] riscv: mm: synchronize MMU after pte change
In-Reply-To: <CALoQrwdLANaOaYiGvFxt23PBdHcgcc_LWVFORNwrAXWBhOyJsA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1906170328330.19994@viisi.sifive.com>
References: <CALoQrwdLANaOaYiGvFxt23PBdHcgcc_LWVFORNwrAXWBhOyJsA@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_033251_925174_2F955114 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi ShihPo,

On Mon, 17 Jun 2019, ShihPo Hung wrote:

> Because RISC-V compliant implementations can cache invalid entries
> in TLB, an SFENCE.VMA is necessary after changes to the page table.
> This patch adds an SFENCE.vma for the vmalloc_fault path.
> 
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: linux-riscv@lists.infradead.org
> Cc: stable@vger.kernel.org

Looks like something in your patch flow converted tabs to whitespace, so 
the patch doesn't apply.  Then, with the tabs fixed, the comment text 
exceeds 80 columns.

I've fixed those issues by hand for this patch (revised patch below, as 
queued for v5.2-rc), but could you please fix these issues for future 
patches?  Running checkpatch.pl --strict should help identify these issues 
before posting.


thanks,

- Paul


From: ShihPo Hung <shihpo.hung@sifive.com>
Date: Mon, 17 Jun 2019 12:26:17 +0800
Subject: [PATCH] [PATCH v2] riscv: mm: synchronize MMU after pte change

Because RISC-V compliant implementations can cache invalid entries
in TLB, an SFENCE.VMA is necessary after changes to the page table.
This patch adds an SFENCE.vma for the vmalloc_fault path.

Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
[paul.walmsley@sifive.com: reversed tab->whitespace conversion,
 wrapped comment lines]
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-riscv@lists.infradead.org
Cc: stable@vger.kernel.org
---
 arch/riscv/mm/fault.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index cec8be9e2d6a..5b72e60c5a6b 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -29,6 +29,7 @@
 
 #include <asm/pgalloc.h>
 #include <asm/ptrace.h>
+#include <asm/tlbflush.h>
 
 /*
  * This routine handles page faults.  It determines the address and the
@@ -278,6 +279,18 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		pte_k = pte_offset_kernel(pmd_k, addr);
 		if (!pte_present(*pte_k))
 			goto no_context;
+
+		/*
+		 * The kernel assumes that TLBs don't cache invalid
+		 * entries, but in RISC-V, SFENCE.VMA specifies an
+		 * ordering constraint, not a cache flush; it is
+		 * necessary even after writing invalid entries.
+		 * Relying on flush_tlb_fix_spurious_fault would
+		 * suffice, but the extra traps reduce
+		 * performance. So, eagerly SFENCE.VMA.
+		 */
+		local_flush_tlb_page(addr);
+
 		return;
 	}
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
