Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F946C04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:03:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2CF2064A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+epA5ZK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ktljj6fz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D2CF2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3RGU5INwezcxFuZa6BRF33l03siMPjCi7s/fmjheJ8=; b=K+epA5ZKAo/vqG
	NtUB/1L82la4RfJ/Afq0WvcJFz/edClkLLb3L+BfIfgPHLzsdBgECTiq/yt2hLfFTByHSAF+4B8zW
	mzd9IG0D8QXZPqFhiFsQPzDRIwlsXyPg8H9uLox4OqS9myeF4cRTFaJXNxn1GXlSf65ytYJy01Oek
	cYWr2k5/BTPZ1OsDnn3Etg5WANXx03yyvY6wUZ/kqyWn/1AIRWci1zthnaZ1nLtcmtXBOysO85TPS
	ejIBhMeHZIEDKUyMUWkwaPEI3VquA5bZGb1wOZygeOzkbBQx6h2zdpn3VZQRGyteMk8ockf7PgHlR
	v0xNlK27x1Dgi+vzLDHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC7Cz-0003TN-GH; Mon, 15 Oct 2018 18:03:13 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC77d-0008TO-O4; Mon, 15 Oct 2018 17:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Subject:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NTcJ226Q2+0NWWI9l8S5fVLhXXyyUbvC1ipsiSvc4qQ=; b=ktljj6fzzrdObY68xfhP0xuRx/
 pd0ezA7APdasFHCnNGTxQRTfFBz12FTzMP3B/vJlA4/k1f1TbBTowmIFXK7SU5ru8ZTtn67SyCR4f
 oIPj1JFUghulWRyytQdJ/oQFZul+EUE3YI8uFsZOekzf+q9FO9ixy8U4d6I7cqQBP05M+3yW12a6h
 qMyNqRvhV6LDWhwNp2T1mZCGxxf9ZPm/oxvxZgV5le6G7PonolYeXhISM1ii2KVYsm8FJb552f7h2
 RkqjAVYqy/VHWCfXhU3ztkxVa6+pPCcpMaRDVHXeEP1vCM30mfHqyGa1SlmHnzbBCu4jupOH0aE4U
 TRKpenRA==;
Received: from ale.deltatee.com ([207.54.116.67])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC77a-00028K-2A; Mon, 15 Oct 2018 17:57:39 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1gC77C-0002IM-K6; Mon, 15 Oct 2018 11:57:17 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1gC779-0002Mm-IN; Mon, 15 Oct 2018 11:57:11 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
Date: Mon, 15 Oct 2018 11:57:01 -0600
Message-Id: <20181015175702.9036-6-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181015175702.9036-1-logang@deltatee.com>
References: <20181015175702.9036-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, akpm@linux-foundation.org, arnd@arndb.de,
 logang@deltatee.com, ysato@users.sourceforge.jp, dalias@libc.org,
 dan.j.williams@intel.com, robh@kernel.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v2 5/6] sh: mm: make use of new memblocks_present() helper
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_135738_227677_881053D2 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmer@sifive.com>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>, Rich Felker <dalias@libc.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015175701.GJ_THgEdh3W4iqr2D9zNkBi6g4qcKBTslUBEGRP4TmE@z>

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
index 7713c084d040..f601f96408ee 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -235,12 +235,7 @@ static void __init do_init_bootmem(void)
 
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
