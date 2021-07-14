Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626E6C07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:55:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF57613BF
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF57613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4HBv9othgVIa95ywyoASJ6wWn9jEgC862FWDX03AGM=; b=EaMnrBzLc5rmI4
	0M94g/LJQ/KetiT9HvTAGsfI8CNF+gQCoFAxgByuUIL+yeczYlpN88JIgGlxstHgJcYrYPdGmip5Y
	6X7nlqHznoZEG8jpoPEQk4Q8tFxmA/cjj//CZ3bdu9rJ09rIh/cpyDJ567yv1Poo99dGxkvJNuG3b
	MRfN/5ZiMXrFNKcOwBuf1W15qFweoK+NOv2cP+ceEWLh1SJL3mRJF5yYBxZ5kPg1IVfp2SB9mYRZI
	6tUk32VGtwHWSX+IX5zi4pi6bz+Z3+HakUTa2YdZ/YTjtxsq6YYCH201EDTJ+5/++fqXDql3Rtmut
	mYtpoNZp33+m4l6QN3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fMF-00Djpc-IR; Wed, 14 Jul 2021 13:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fM1-00Djks-Qv
 for linux-riscv@bombadil.infradead.org; Wed, 14 Jul 2021 13:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HZzub4bLqt+xciTADssazs5cYmHlEMtTJEt3uTS+UpE=; b=Cbp0mlbhOqcPTPEUMDNlPKUgD6
 1FdaqzmFZgq63LNPRnujAbgCds5RurUMhsqg8d4F3Ajh5Ot1+dG7jIejiazy88NqNfFiAjBFSDk3u
 cmYETIIdzhVgxUs/jXDvTjFNe7QXRuZN4Do9JdtEG35nAGtvetcjcQpoLwaoT/MsKZYsv3iX6JQ+2
 YH/yw6qLL3XBPMIpcJwgbeGC3gBCDRdd93dZCp+WO4QGdqHdK1D2B0PAWR3unw/FfxTfw96+bYyId
 J/a/P2XohJJGVTDWscQXkTDsLZs1VsT0KkyRCTR5TrEKJVco/dNe0paXd8HVkfRpK32HDJiiTumsO
 DX+WR/ww==;
Received: from leibniz.telenet-ops.be ([2a02:1800:110:4::f00:d])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eLs-00HUEW-LA
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 12:51:05 +0000
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4GPy6M5ZLMzMqfh0
 for <linux-riscv@lists.infradead.org>; Wed, 14 Jul 2021 14:50:51 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by andre.telenet-ops.be with bizsmtp
 id V0qW2500F1ccfby010qWp0; Wed, 14 Jul 2021 14:50:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLO-0018dN-8G; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLN-00AaDx-Nr; Wed, 14 Jul 2021 14:50:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 02/10] memblock: Add variables for usable memory limitation
Date: Wed, 14 Jul 2021 14:50:12 +0200
Message-Id: <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_135100_786381_4B35E3F9 
X-CRM114-Status: GOOD (  14.24  )
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

Add two global variables (cap_mem_addr and cap_mem_size) for storing a
base address and size, describing a limited region in which memory may
be considered available for use by the kernel.  If enabled, memory
outside of this range is not available for use.

These variables can by filled by firmware-specific code, and used in
calls to memblock_cap_memory_range() by architecture-specific code.
An example user is the parser of the "linux,usable-memory-range"
property in the DT "/chosen" node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is similar to how the initial ramdisk (phys_initrd_{start,size})
and ELF core headers (elfcorehdr_{addr,size})) are handled.

Does there exist a suitable place in the common memblock code to call
"memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
have to be done in architecture-specific code?

v4:
  - New.
---
 include/linux/memblock.h | 6 ++++++
 mm/memblock.c            | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index cbf46f56d1053b68..07e2474c4c3901e9 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -25,6 +25,12 @@ extern unsigned long max_pfn;
  */
 extern unsigned long long max_possible_pfn;
 
+/*
+ * limited region in which memory may be considered usable by the kernel
+ */
+extern phys_addr_t cap_mem_addr;
+extern phys_addr_t cap_mem_size;
+
 /**
  * enum memblock_flags - definition of memory region attributes
  * @MEMBLOCK_NONE: no special request
diff --git a/mm/memblock.c b/mm/memblock.c
index 0041ff62c584e7e1..66659f2b10ed40ff 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -101,6 +101,8 @@ unsigned long max_low_pfn;
 unsigned long min_low_pfn;
 unsigned long max_pfn;
 unsigned long long max_possible_pfn;
+phys_addr_t cap_mem_addr;
+phys_addr_t cap_mem_size;
 
 static struct memblock_region memblock_memory_init_regions[INIT_MEMBLOCK_REGIONS] __initdata_memblock;
 static struct memblock_region memblock_reserved_init_regions[INIT_MEMBLOCK_RESERVED_REGIONS] __initdata_memblock;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
