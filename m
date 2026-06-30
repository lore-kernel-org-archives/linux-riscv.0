Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8A2C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAHer6y3FeJQyqovjfxoUfsJjwxmiPRQijx8Ul1AGvk=; b=3fqtVBfjGsTXXA
	ojrVTubtiKSY9Lk2Q0a6oyEIcQN/yEeRJ8Y4ViVy/cTRlPNppmT1jIchUj5S9vpPQNc8owtgnv831
	n0St96Efjp6DVyCs/omuYLeBJY+m0K9eFBjTHqzF2UPkWsuk/WSPXEMPPBuNB7jct07gNdueMxmr5
	/fDOkz5cxxYB6ZJXQCnLoqRxqwwZsTNbSeuXl6v0hk1I66L8TIhDhbXowAnU5ujZAUGqFOGO7i6NS
	GWc6Ky0w/Shxk54LKoupIHHbZajpSWdguca8r5EWS1Q3sB7Lid3aRJCpR00KReDDXrrNrvm2oFrtv
	ELA5aGDjNBa5ozGyaSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDG-0000000GAUi-3XCK;
	Tue, 30 Jun 2026 07:48:58 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDA-0000000GAJC-1Duh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:54 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2c825308c4cso1969955ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805731; x=1783410531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=;
        b=Lxa3SNLewfjO1XWJBqKFQQAD+AD3/E18whJvgN/xGrbdPwTASdXJwiXHSP35YSqv00
         pT5FLKLDQUEgygiJTtGJl9UvOuDnTz0Kgiux5x+E7lWwZU4tbjr3JHsOuC4wpJMVMBKX
         zAi9dHNOKWrM7Qa72WowRkzpSlcstIWrMXSLV0u/7TJAKhs0B8c5uBOa2DxoHoTq88tR
         +bmwdZaUew2XBwS8ZsTXlLF3wdjVjnilBKErPP2S2mmzXCGpW4aUH0thzsDRInhyvnRq
         XbEjTnqNGhNxhf0LbvnvmLlHPKNzRsxs1s/exgazcnSqMG1ewH6Fa4bZcnOHYPACGVJd
         vusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805731; x=1783410531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=;
        b=SdG12QYT1sj2hVGL0TE3C6sRwnKRflvF+oe1oO3tqwB6mF8Am4PZVqxmBWzn31YPMF
         BOgmpZ3U/jAeIpHQ0oVQ3ydPgz/rs/y/EuhRwus/SHbkM9enpBKW4aYXJ6FKbui5C6Ch
         JoJVfUn4Oeao7lOZqxfEWPQjE92iHY61tLY8abh7end22DLRH0pTI4O969haQ6JmGe15
         D50eQ7MzQ1HzFJ0d+GB63hfejVVyEHR+WoAizWNjqjWisbCWdVV9wqhnneVeeEU8dZJi
         /5c6qh1WLl709VzztCEY3i+iIwwvGq2vkLq17soUA0+cYA2/w0HEmNYlbmOIYD770rAT
         e7KA==
X-Forwarded-Encrypted: i=1; AHgh+Rrar2XArSktNrJ+BsPX3ZrzxTA8v0/s82U8vVgcz1C0imnlrmD+WBOaja1BgpuRa6HsoW3/1FUoSfPxBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnxxeNX7pH6m788FS8/wZwg+gMcNfEvUeVDJKud6KSqxAk+5+u
	toyGj2Q5q5Q0Ke29GrOjbE+L//aNSp5NhonWWiX3hdRrREL/52vvyBds
X-Gm-Gg: AfdE7clAYG0mcJxNQ0m/AGMtvRa5VgoOBQM3nvuaQYT+OBXGV8V/FhMUgxZcXZjmeM/
	DMV0afFcoqit0ILkTtzro3BwAnzWdTxMN1ljMoZJqjgYwK6yBtq3dPnfHmOHYgm1Hsyx8Fy6eEq
	+EiGacOg+vHFTNW5pbfpYhEHtJkCoIpu6g9VMTkU4/XZz615fnz7fcnnn1CGAmN3fQHloVliDzw
	n4f6+9ppVUqKdwxGrzBJ7fCJLs7GFrXph4UZWfgVtnluaCDe3FjKifQCHLxSbCSQgA2vDjYaJwY
	KU+0OKq4lbXybYaiNgSEWqTBKYBPWEP6rQ+CSMfAfdUHGGv+qy+ZBg9NA5W93c6K11P46mJoN/d
	oANgrUtkypUWAHtYiJY88tnlS/NIAhl9+KS2n8RsS/WdrHJ6uFAdy+FRHyqt+hP0ycvEW9Y+7M3
	0Tdf8ExGZM7JSSV570Qe6ZhaZzBQ==
X-Received: by 2002:a17:902:dad1:b0:2c9:d55d:2d3 with SMTP id d9443c01a7336-2ca2d55dedbmr19212325ad.15.1782805731371;
        Tue, 30 Jun 2026 00:48:51 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:50 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 08/10] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Tue, 30 Jun 2026 15:47:12 +0800
Message-ID: <20260630074715.4126796-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004852_382797_3CAADDE2 
X-CRM114-Status: GOOD (  10.34  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserved memory regions are excluded from vmcore by default unless
marked dumpable. Honor the dumpable flag to filter out device firmware
regions (e.g., GPU, DSP, modem) reserved via device tree, since they
typically contain data not useful for kernel crash analysis and can
significantly increase vmcore size.

Use of_reserved_mem_kdump_exclude() to perform the exclusion, and
pre-size the crash_mem array via of_reserved_mem_kdump_nr_ranges().

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..1d65320c6ba4 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -17,6 +17,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
