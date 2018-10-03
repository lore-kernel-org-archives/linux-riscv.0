Return-Path: <SRS0=xmLI=MP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57624C64EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F153720878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvPJAlQO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ89ErE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F153720878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hEVVVhg7sNpP+EdKlIRAMO69HTQ/gRkhFJ3WKMXb1To=; b=rvPJAlQO91ux5jDNRdtl1NpV/y
	at8JDbP3Vaq18/9i14QMK0wXEbMeoP5q8xSmUKVauLpcs9QfZGXHMocZpzUev5/T19m8JrGfJwfan
	NMRyV8t5nTbqdxNF2ReYS2L6jYb7uBk4HqyRyY9k6G6wLhIybkwNKVD6H35f10xHiXUD+QBoB9JVs
	JFYzeAoUkhyNhMH0qxVlcr7AIuQZ66CnwZZXEyqy8DZWWfVbE6bC5iKhooSa7MsdScK3cULE0giUZ
	jCwPVHnSQK0qnnmcx2VFq9FLQk9caRT1ewjL+OGVok730kXMvabHHPC09T/Iak7sftSMz3EOEWe3i
	j2yHoj4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Xaw-0005DT-DC; Wed, 03 Oct 2018 03:13:02 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Xan-00057Y-NN
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 03:12:55 +0000
Received: by mail-pl1-x641.google.com with SMTP id 30-v6so2708695plb.10
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 20:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h3yrkxkzYRPf3zuwQSSl32LhNKBguaWeQ5y7qsxFEp8=;
 b=QQ89ErE4hX1xUN0ZWyZC1rrS5Kk2TQ4a73ZVltUM4BJ8pl++EX2scjJ1rzJ7UZ/X2V
 YkyFcTva6XZdHsmOabVllxJjdrB0gjOryi0rK5gjqknU1fkyfum3DiTszioyhjC5ezne
 Pw0bFsFZM+YCBQ41eu7R2zN9ZXsWRjdcmYwWDSvRr1Ctd8XmEn9OuKbJ3AAyz+sf8NjV
 5/1HPXl9RlFRG1QFmTZONdjUUBq3X4t/tGp/Y7QxWVEhyEgLVFsZGhSnoJmWmjQ7uZ9T
 QQ/zklQ2jUGbGI7CqMaTy1hwlDfBzkpFSYakrY5YuipDwwrICz135aMst2DlWQLU2l3R
 rxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h3yrkxkzYRPf3zuwQSSl32LhNKBguaWeQ5y7qsxFEp8=;
 b=h6j+G8uRwjBm9wvmWVqm3ioc4yGxNlsJgXSFdBl5GxHL2ocvY/tkTtocmvB+yraELL
 LE04Cc34GXA/3ZUFybfsBwgTNJxlVfWUhO8YPMF7d+YI3M/KzkPuIPvmOotHN1MEGRkm
 sB5lrGVZ3K6VJJBCTUmSIyyzzcF4Ctb5HIjgQJX6Siw1CkMXyZil8VaJdaGLh+orqOjF
 8liZupgdSgxEiYanj2tdCClt6QmU/hx9sRfalg7ckZq8aqk8qsaAqhCTLisDpRPxgWGz
 3/XWq9hkBCfcX7nq9QnlyiSjwd3o16gyuue5vDx3kkH7WwpEvfqS93KkJhO8iIPWZKx4
 xnxQ==
X-Gm-Message-State: ABuFfog9fltTB02b/DGoR7w4mLNzk9tto+4/i+M7KrXXwwN3/4Dnt/aw
 vTTsMVZuYSLCsfRHK8NJAgw7x0Iq2po=
X-Google-Smtp-Source: ACcGV60ehEqJtUwqbBZnRB0HjzEuAKa4R+UAHFYp605vsz8pMNJ2QchRRpazqmQfMb9CDCy4aQBH3A==
X-Received: by 2002:a17:902:be14:: with SMTP id
 r20-v6mr17912375pls.293.1538536363194; 
 Tue, 02 Oct 2018 20:12:43 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id v23-v6sm21777747pfm.80.2018.10.02.20.12.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 20:12:42 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v4 2/5] RISC-V: Add preprocessor directive for swiotlb
Date: Wed,  3 Oct 2018 11:09:59 +0800
Message-Id:
 <0aaabb05426a360f71cbc7a910e2c613d3a3891c.1538535528.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
References: <cover.1538535527.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_201253_783538_A92F3774 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181003030959.QX_LLU023DqWmoWao3cmQvPmJmmdCP5N3Z2g4gNufPU@z>

On RV32, it doesn't select the SWIOTLB, only RV64 support swiotlb now.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index aee6031..6de6584 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -227,7 +227,10 @@ void __init setup_arch(char **cmdline_p)
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
+
+#ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
+#endif
 
 #ifdef CONFIG_SMP
 	setup_smp();
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
