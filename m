Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22630C07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:56:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DB1613BF
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0DB1613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1GV6FskNXh1QRYjN8e+TzD4KJkaAft8E6qgBjTAeEc=; b=b0x9TiMbxjsMNk
	Bhe7wUfxNuodmeXXP/wIQABt+L1e8NFUA3gM+AGSl19c2iLlODC+wNJFTtXGUqAltJqthINmo1X7x
	jF76MM7VW3N/0xOnFN0BZ9bFv/BHvJbdumoiYcn4UTBHH60coVq752H5j1NDuN/rJtl7KqcGJB0up
	XycpxJ7tHtUOLZaRcqlB+z+IA276jeO6ZFExFQTy/HY130jFVrHGrnubuw/cQ39dpFReub0RWvCmA
	y9K95t91+QDLdZ/MMqVjJBLa0melkQ2jlqVYmdtK4C41mJfZK2uuQ4spSFgneFwQ/9Dy+nNHn7+n4
	DISBtDcIht5LfZ/KgkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fN1-00DkEH-Bm; Wed, 14 Jul 2021 13:56:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fM8-00Djks-Rb
 for linux-riscv@bombadil.infradead.org; Wed, 14 Jul 2021 13:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=97zbw6uGL01nn5majAvjJCS0auKktlIcGWzo/dNcVLg=; b=DMQS/UX+muiG5abGCsaK4VRGK8
 B7Y7CGrKorebyDOOr9hoFVYXfOCGFKYg+10sAHbMVGcvm5S9v/Fk1WHTofCjkfsyjxrgx+qHBzUQG
 YiAZyBeuHaiz8mSI/wcNI740V2fsBB6Y32mtcYnr2Qn37onZOwPwyrpnDOqc2SooCqZh2QPUZHvsH
 Yd6Nj6CIG0c3hlTbjgcJqQo5IQ6+s6a7lJq3mrxE7wSlifdMz9RCNFX0rc4FxjcQ4KPIEUeM/uoAy
 XGgPvcZn3VLLcCu8iiasvCZEjUYZ0/jXr6DyXXRLEfGaGcC287d+5pnQoPw+15z6ZSi912/4sK3sb
 QXZU4+Ug==;
Received: from newton.telenet-ops.be ([195.130.132.45])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eLm-00HUAW-D7
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 12:50:56 +0000
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4GPy6M5RMczMr9kn
 for <linux-riscv@lists.infradead.org>; Wed, 14 Jul 2021 14:50:51 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by andre.telenet-ops.be with bizsmtp
 id V0qX250061ccfby010qXp6; Wed, 14 Jul 2021 14:50:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLO-0018dR-TJ; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLN-00AaEQ-Qk; Wed, 14 Jul 2021 14:50:29 +0200
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
Subject: [PATCH v4 06/10] riscv: Remove non-standard linux, elfcorehdr handling
Date: Wed, 14 Jul 2021 14:50:16 +0200
Message-Id: <170e7daa55aced148b8e57827f7c8fc65a0a8c7a.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_135054_593539_89647C06 
X-CRM114-Status: GOOD (  13.91  )
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

RISC-V uses platform-specific code to locate the elf core header in
memory.  However, this does not conform to the standard
"linux,elfcorehdr" DT bindings, as it relies on a reserved memory node
with the "linux,elfcorehdr" compatible value, instead of on a
"linux,elfcorehdr" property under the "/chosen" node.

The non-compliant code can just be removed, as the standard behavior is
already implemented by platform-agnostic handling in the FDT core code.

Fixes: 5640975003d0234d ("RISC-V: Add crash kernel support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - No changes.
---
 arch/riscv/mm/init.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 269fc648ef3d84b2..4aa4b6a034086df6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -829,26 +829,6 @@ static void __init reserve_crashkernel(void)
 }
 #endif /* CONFIG_KEXEC_CORE */
 
-#ifdef CONFIG_CRASH_DUMP
-/*
- * We keep track of the ELF core header of the crashed
- * kernel with a reserved-memory region with compatible
- * string "linux,elfcorehdr". Here we register a callback
- * to populate elfcorehdr_addr/size when this region is
- * present. Note that this region will be marked as
- * reserved once we call early_init_fdt_scan_reserved_mem()
- * later on.
- */
-static int __init elfcore_hdr_setup(struct reserved_mem *rmem)
-{
-	elfcorehdr_addr = rmem->base;
-	elfcorehdr_size = rmem->size;
-	return 0;
-}
-
-RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
-#endif
-
 void __init paging_init(void)
 {
 	setup_bootmem();
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
