Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EF4C43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4w+8pj8JDTxeE7iGgaeutqGZu8nCMB1dLUHsa9M+bs=; b=1SESjs6yA1nol5
	iE2KOhJuJ+XigmhACsfUD0bqVFzLbzwAYRW8wEhjPVD26rG1ldQ3n4QWl/wwajseUoVW53uUzuIkM
	EWb7gYbHY7VIknVCOVP8wzg6hOX/UDSIGzI353WYAkliXybL6maP96is/0dtL1CXff4DEffHoMrnR
	p5m1w3uUxv/SYwyzZUhQ5g2gzbYhxV7D+w9wts6QSA+Pnlryra109h6Ph4/h5vjOrUFwM1KlwnPCZ
	qQ1UqBnRbOUQcRYPBGaL3HPK9Zxs1DQc/67MY5AamQDS/Z4GAvZaLNUPWF1IhGTdHFB8JJnLQ8scI
	VKCkfb3ne0DMhbpJ5wFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDp-0000000GBTo-1BRa;
	Tue, 30 Jun 2026 07:49:33 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDU-0000000GAwj-0i0r
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:49:14 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2c821a50615so21160505ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805751; x=1783410551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcszoUDc7316A03Dx3QXGOd8FcU7DWvjuNUEWPnVcI4=;
        b=rPs549NUIaOK9IgZRYBxk54jGtXtcrUxfDczlc2YE+mbp8kn/nlC0iTiwYgKSYDuFP
         83GJ/m8phl6S1MQt/PmdOUjV5/KIXIUrDMm96vrkjm8Q52D8iEIfK+iz22yemckToPXs
         bQ5CBjv4yTz4VhpneP5J5vkPD68wYRAGEXqhH3Ly+q7LNhAiLDp3EypZLuxfhN0ydJhp
         CVbypyP/rqzpENRLlG+y15Dr5IxrZojpBE2gP4IIGRtvuRWbxvXx8y/KFM9TMA0P1T57
         nM7TsPHYWj+727QeYJdOgCum87J7vk2Q/q9/UIbElKvT/E6eSMuCRLPXD7GPHvvMB8K6
         3K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805751; x=1783410551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcszoUDc7316A03Dx3QXGOd8FcU7DWvjuNUEWPnVcI4=;
        b=GqO+2TAQ0lfbHDh3OZQJMpueYeXnRoP4NI3TRUHhJVGIJ7CshqtDOJdtjC70+dt1s1
         fzR4mNXUejDCOlB7tjSurzmDpVQaFAuWT3l7IcY1nBb/DwwcRnpPj6pnU7GGvV6UVdeP
         fdinqxXWVx+xp2yDsr4jmacFy+24Io48uKuhqQAG0i4Tcd99jR6bER4DDndvXYQcbQdh
         fXMZ7nC2zRAYPzQe8vg0w968RLyjG3HyjCLzH8pfqyOb8UCXRySG+WQVlnKxViuhljy8
         ZhXkFvkrHEIaxHG049xDCrOzfBYTLLbIjXOKJ5wQz6NSaPYeM6lHJDg9NHStziJ01HjS
         uwNA==
X-Forwarded-Encrypted: i=1; AHgh+RqnmRy9tcIAJ5lUv7wcQ9GsJTztflGw0NAVbbzLr+qOSPC9ppmYnO9hOZ1gP373oEkbnJ+4z7/nwx+qQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuZVwa8YBALDil2eKM0wpcjtKSb+4Oe6dp9yE6qI3HDTCLCYkt
	m6B9mvEcs8Bmp8Cv/9Y7G1Ochlc6L4FO1+QNLY1ekZ6CbqPipKTEEiQk
X-Gm-Gg: AfdE7ckd9W3dYunALQJ2TlIRVsp9DSH5LC/bRw3aQnKEYZ1ldUyZ2djjVZEzmtw/+0o
	FoHNdGR3Ja8o9r5SrTNhSKJqsyRCTHGWaZVb+hjGD5LXgpZIEMX57CtxKH7uFfvmb0JrsDwHlea
	YgsTqxxG9AsJA9Q8ihs3lyt1e2ASDnDYxS8F6jW98+26ouYDEnihaVAPEFmp9XRQGlOnrxKuwMz
	Z8PCME6wtiO+wTBh8wrVw/eEJ7Z8Dyb3rvI8O1Oec9Lg7hrqXrq/WuPXkiTSPYP+Ur6/afwjFeH
	jMz9SdE0ahmAw15dK7h4uqLOiYXTR/GgR9ekxJlvDLiESyfdp4hYLftfsX6iiXe6NDDFE2Xfz++
	uVBWNGQIJJSxG29qw5n7XMs/jEnQ/Eu1QBZkvc+D+PwXCJFJynC88qsqx6eUNFvdtjwysj+BJQ8
	dpJyioLKd38fZVZY4o4Kzk74zbqQ==
X-Received: by 2002:a17:902:c94c:b0:2c0:cb0e:ac3a with SMTP id d9443c01a7336-2ca2e71832cmr21250665ad.23.1782805751208;
        Tue, 30 Jun 2026 00:49:11 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:49:10 -0700 (PDT)
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
Subject: [PATCH v4 10/10] loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Tue, 30 Jun 2026 15:47:14 +0800
Message-ID: <20260630074715.4126796-11-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004912_235798_BEB397CE 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to LoongArch
kdump as was done for arm64. Use of_reserved_mem_kdump_exclude() to
drop flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..4b918c3d4a28 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
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
