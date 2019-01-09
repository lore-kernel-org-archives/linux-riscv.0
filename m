Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49322C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 20:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15AD9206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 20:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dnIGgaw0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15AD9206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApUnzE5/LYrOf1OqzKNxD4Z9NI4suyqXqK3hA9HW/F0=; b=dnIGgaw0hpR1Oz
	pZ1En/649aB4i19N18oON7bDgN9BLbT/hPO//5h3ZjFc2TrenEOEYvbh3kkKa1qe3A9LPQuONBJ7K
	pkRhh6+47DxkEqD6vAw/aqLcd97SVTO0QiC05g+w2v+e+pwAQuFkRm4D85ObrDKbD9SOEDT04Vhuw
	K53+TIjCYxrHuAOVYuVIVQM/FLcZSbI9GRhsPs1MK3sYCe2x7wD4EdTSy8048wO64tfGjC7VEVtkc
	lN9wPU9l0fv4CffBJBgE9iqNGwNkV6xFeyjlv7nQTrYu3NPIU/lw/JHO4J4WeNinUYBGbi1+epISG
	QwCFBR9nbFHENFAcwsAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghKdG-0000m7-W4; Wed, 09 Jan 2019 20:39:23 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghKdE-0000lI-0h
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 20:39:21 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1ghKdC-0005yh-7d; Wed, 09 Jan 2019 13:39:19 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1ghKd9-00023z-Dx; Wed, 09 Jan 2019 13:39:15 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Wed,  9 Jan 2019 13:39:10 -0700
Message-Id: <20190109203911.7887-2-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20190109203911.7887-1-logang@deltatee.com>
References: <20190109203911.7887-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sbates@raithlin.com, palmer@sifive.com,
 hch@lst.de, logang@deltatee.com, ysato@users.sourceforge.jp, dalias@libc.org,
 dan.j.williams@intel.com, robh@kernel.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v4 1/2] sh: mm: make use of new memblocks_present() helper
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_123920_105492_C837EEA1 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: Rob Herring <robh@kernel.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@sifive.com>, Stephen Bates <sbates@raithlin.com>,
 Dan Williams <dan.j.williams@intel.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Cleanup the open coded for_each_memblock() loop that is equivalent
to the new memblocks_present() helper.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Rob Herring <robh@kernel.org>
---
 arch/sh/mm/init.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index a8e5c0e00fca..dc0ff41d602d 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -234,12 +234,7 @@ static void __init do_init_bootmem(void)
 
 	plat_mem_setup();
 
-	for_each_memblock(memory, reg) {
-		int nid = memblock_get_region_node(reg);
-
-		memory_present(nid, memblock_region_memory_base_pfn(reg),
-			memblock_region_memory_end_pfn(reg));
-	}
+	memblocks_present();
 	sparse_init();
 }
 
-- 
2.19.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
