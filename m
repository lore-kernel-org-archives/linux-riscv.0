Return-Path: <SRS0=q3DZ=MR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1B0C00449
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Oct 2018 16:17:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE339208E7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Oct 2018 16:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WGbDI/36";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b1hdFdWE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE339208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Z7IBtqeLNj/0863z4y5ZrHWmt3QzigTi/+Lp1NHgms=; b=WGbDI/36K7H2EN
	kR3nMIrcTbxU/O5fVD2k3YNmBFsks0iOxalgZYQz+xgUkWeJE9NsWhDdm2hmctkwU9O96K3PSzmhk
	Gr3j/EF+0VH4BiOXT9hUEFmaHDpQExF8whTqp7wmLMf+VGUbIZe2UdS1iLGudAMgyiJOC8h1/+l5d
	3GhHkRT0T36+8qvPHf3SLOYnLM30ZDN8dNnD+p+EXl6LpnSc4Sw6joyVm3v3jvYLRVfamEMryJNEi
	UAUl1NKqVWoPTcbuvRx4aXvVOt3N91SePUK1pC04sp+lnwo5JbKvqarR8FHj/vBWlOJZ1p7OgR6WM
	PX5epnUTSdnHr6rJgCGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g8Smq-0005i2-1b; Fri, 05 Oct 2018 16:17:08 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8Smn-0005hf-FI; Fri, 05 Oct 2018 16:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Subject:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pjn2SKMH8bI3Nc5MBoKr+9lA/vWqKzACQOBqjOPOq7Y=; b=b1hdFdWENdYV71z1h4rYYboTLN
 B5IIwo2DDczkY8hFqBb7bRE+rS6w630CI5YRD/kgsXiqSssb+83yRc1fHE+xfEJMp09CZpcgEeMUE
 AzxaFYL5GenhwmTkJva3479I/5YpMGMHNZGa/9MZOWg9+699NfarKMATihBMOd8lCALhIFXxQIbQv
 zTUoU6pS2WpZSp/aVO8Iq8vNS/Ete22ARJ4ggvzZTDXPtqZUitDO1/07wsj4TFrAotUQONTuX2EO5
 RlBWNa56JZ9LxIWwUqDl8NgbNAOqVgPqwpsLPtvxR9BnG7ajjDkEP4Qjrz2IS2hEvblP8x/rvDrDP
 mfaV8vUQ==;
Received: from ale.deltatee.com ([207.54.116.67])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8Smj-0005HG-Km; Fri, 05 Oct 2018 16:17:03 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1g8SmU-0008D3-Sl; Fri, 05 Oct 2018 10:16:49 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1g8SmS-0000ea-2I; Fri, 05 Oct 2018 10:16:44 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
Date: Fri,  5 Oct 2018 10:16:39 -0600
Message-Id: <20181005161642.2462-3-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181005161642.2462-1-logang@deltatee.com>
References: <20181005161642.2462-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, logang@deltatee.com, linux@armlinux.org.uk,
 keescook@chromium.org, philip@cog.systems, rostedt@goodmis.org,
 nicolas.pitre@linaro.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 2/5] ARM: mm: make use of new memblocks_present() helper
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181005_121702_192485_F9B60086 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Palmer Dabbelt <palmer@sifive.com>,
 Russell King <linux@armlinux.org.uk>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Stephen Bates <sbates@raithlin.com>, Philip Derrin <philip@cog.systems>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181005161639.GacDyYg0-6FCTUbch2MZXODu9zxzhByNsr9QnvHzwGI@z>

Cleanup the arm_memory_present() function seeing it's very
similar to other arches.

The new memblocks_present() helper checks for node ids which the
arm version did not. However, this is equivalent seeing
HAVE_MEMBLOCK_NODE_MAP should be false in this arch and therefore
memblock_get_region_node() should return 0.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Kees Cook <keescook@chromium.org>
Cc: Philip Derrin <philip@cog.systems>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
---
 arch/arm/mm/init.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 0cc8e04295a4..e2710dd7446f 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -201,21 +201,6 @@ int pfn_valid(unsigned long pfn)
 EXPORT_SYMBOL(pfn_valid);
 #endif
 
-#ifndef CONFIG_SPARSEMEM
-static void __init arm_memory_present(void)
-{
-}
-#else
-static void __init arm_memory_present(void)
-{
-	struct memblock_region *reg;
-
-	for_each_memblock(memory, reg)
-		memory_present(0, memblock_region_memory_base_pfn(reg),
-			       memblock_region_memory_end_pfn(reg));
-}
-#endif
-
 static bool arm_memblock_steal_permitted = true;
 
 phys_addr_t __init arm_memblock_steal(phys_addr_t size, phys_addr_t align)
@@ -317,7 +302,7 @@ void __init bootmem_init(void)
 	 * Sparsemem tries to allocate bootmem in memory_present(),
 	 * so must be done after the fixed reservations
 	 */
-	arm_memory_present();
+	memblocks_present();
 
 	/*
 	 * sparse_init() needs the bootmem allocator up and running.
-- 
2.19.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
