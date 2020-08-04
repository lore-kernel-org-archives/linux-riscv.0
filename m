Return-Path: <SRS0=zqIG=BO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29689C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 03:02:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C5620738
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 03:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXEFqdjF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="U2lpAylM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21C5620738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rkCWSzEJ4bOafcKrX4KWwYWf8G14pI4HiS8xUFhRu3k=; b=jXEFqdjFEXHFlnGqTE77HUiTTS
	LeyAOQ+eyo1kYhh7oWyzIsTyQwPA+ORhB79qWv5i2NOubR66b1Rs86x0PO51vpBaInjDzL3etMsuI
	rPMaOgCE6LDtLbLQChDMYP2i+qVVLkZlhM2BfWsUyXkomvyUAkyFYMhOUWNdR2zmVaCV9Ahbf8+ay
	ickiYNFVHXOj6/dPNKwnqW6NpMhT/cdno6uKrX1PW4+sW5tB3/Hl688/Rgn9ezMnwybjuspDsuf+6
	WPF5VQFq4m4VJ/KXjIFcb8K9kg5S0CKvQ/RD/TlMR5H6DlxmTMxP4RBT0TTmNdbRBdvetUs4kjsMq
	PqI6+mJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2nDW-0002Qj-7r; Tue, 04 Aug 2020 03:02:18 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nDU-0002Py-4i
 for linux-riscv@lists.infradead.org; Tue, 04 Aug 2020 03:02:16 +0000
Received: by mail-pl1-x641.google.com with SMTP id z20so1331667plo.6
 for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2020 20:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZTAatZWZ0GlXiEm9GiJYu4NMJeGV2u8v2fu1nTAIzio=;
 b=U2lpAylM/0OnEjFRijGhvgd7ONcjlUmJbYh5pUB+FDETfYHPB8eimJYKMUKD+Lsqss
 ix+CXbFa6SfmC9EveDxMv681ft3f5TLU2GkaZpvt0BBfHck3GY6NdW0wlhEmE09o+eOc
 4RXSAPG5oB/jVZnHiiXPM2IrEnMozx43zdc0q5Wz2zmKj8EYMltIY29U/mzxACvtqoRr
 CXQGHcyZB8a0SBIZfzuEQ92TwFlo4SgQgzjiPINYN/0HIw1LPMpfbVZx2eNPh+YLEFpB
 tngNAO8tbcvxNgmxiUpxaOgFX+y+HByISIOYZx4P+vsRYj9vTcObM2mJTM584VGnd162
 rpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZTAatZWZ0GlXiEm9GiJYu4NMJeGV2u8v2fu1nTAIzio=;
 b=f5diyEraRQIblkX4J3cgcuCiKfHBftIMp/Q3EISy0X3oQijOEwhs1J4IdBwkL/j1Us
 w/V+bghrop/5v3cBbUmcRTJ1+Akj6uetz1DDDwwwEhdMBL/mhji7dba1oJoBX7L8XoZj
 khqKghVcig23W2zzv8EVOklLuufZ6kI8tnwWEWK/TG6hydK27+xEPQxXFMz5NS0rTMXN
 P7BjEHvD/jpsCt4LkwgPSokelpN1AoGnHFk1kUqpk7dGAbRhC7/qf96aM6Rj+La9Y9Ok
 MTxS4klCzj13pBsT+y5XPI9uUZcAId6OQjMDuZKPP5KCbUFkweRgc/e+dISPpgm/JISs
 /SCg==
X-Gm-Message-State: AOAM533xahKEIlBy2CwMWnH9IBjz+oC/FbG01LQrrhtunW7hsuNWMeWb
 fnxX5GXrEbV0iuvAe76J9Iny2A==
X-Google-Smtp-Source: ABdhPJw7mixIQ1U1MltIEHSHX8Kz3GsNmNG6C8BEexFvbJ/XQ+lPmZYZ3/wP/fjYNU1s8cIbpcgtMQ==
X-Received: by 2002:a17:90a:ff07:: with SMTP id
 ce7mr2303816pjb.192.1596510132416; 
 Mon, 03 Aug 2020 20:02:12 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x15sm20396240pfr.208.2020.08.03.20.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 20:02:11 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, syven.wang@sifive.com
Subject: [PATCH] riscv: Add sfence.vma after page table changed
Date: Tue,  4 Aug 2020 11:02:05 +0800
Message-Id: <20200804030205.91656-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_230216_191690_78DFD47D 
X-CRM114-Status: GOOD (  10.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch addes local_flush_tlb_page(addr) to use sfence.vma after the
page table changed. That address will be used immediately in
memset(nextp, 0, PAGE_SIZE) to cause this issue so we should add the
sfence.vma before we use it.

Fixes: f2c17aabc917 ("RISC-V: Implement compile-time fixed mappings")

Reported-by: Syven Wang <syven.wang@sifive.com>
Signed-off-by: Syven Wang <syven.wang@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/mm/init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f4adb3684f3d..29b0f7108054 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -202,12 +202,11 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 
 	ptep = &fixmap_pte[pte_index(addr)];
 
-	if (pgprot_val(prot)) {
+	if (pgprot_val(prot))
 		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
-	} else {
+	else
 		pte_clear(&init_mm, addr, ptep);
-		local_flush_tlb_page(addr);
-	}
+	local_flush_tlb_page(addr);
 }
 
 static pte_t *__init get_pte_virt(phys_addr_t pa)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
