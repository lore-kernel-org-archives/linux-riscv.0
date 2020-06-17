Return-Path: <SRS0=u9L5=76=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1772FC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2020 20:38:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB658212CC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2020 20:38:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rEx+WWPS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EJO/cn7D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB658212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lb2EzuXHb6VzccEj1ycn7TsJzd2ezkjzV+s6RMyTS6M=; b=rEx+WWPS+gZ8w+
	QJNazXTiwipOAZoS5T+RAcnzfm/tjqk9pR0oV/FHaRPfMayltrc5BaS6r9lxzQjOAChN8teUj0JNx
	gBcOaZHqRjrOm076jQkgPtowH0Ch7qynC/q6ahchYugys5yFdhL5GwNigLTH69KEel3yKJs5rLU5g
	6Pv9AEhXC0uhYkTv1ufBfioMfXc/9wttjYYoZhAfccle/vZzG5CClcKY3v4+Z3/kvXdLGTk/Iipbf
	6ckz/2WTwtGHtpT3AO35c+1wjr3feqoobAiEkOKO7oZkZjiOw+UE/MP5a6TxfE+1L7pAWhGAoTrrE
	wDWBu7sOuDamf+AFbiBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jleox-0006Ij-Qs; Wed, 17 Jun 2020 20:38:07 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jleos-0006Hp-TB
 for linux-riscv@lists.infradead.org; Wed, 17 Jun 2020 20:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592426282; x=1623962282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=obXSQxEjICW+Yt8ftMsGWA6aehYecXRDu+nvKJxbC/w=;
 b=EJO/cn7DUCGgJ+YvgYJU3Hy3goKPCxrhYN4gtcPP2paULdDDlQbDBHZX
 qBkC6i4cZURzAjozPh88iJBNva4Xqo2WnlQC4cwYKSLa1yHJXrN6DOPR+
 JGjHLtQCjGPnvvdFvteRHOlgXqXtXtiMgumodFFiOKSC0Grx9U1yzBEiO
 gNh+ASV8VlwVt4EPvTSXVobmvJ8xiwBZRihvN3Bs/rQjMvJhLVLZh2qU4
 J92HifLLy8s3WGDjXGKDiLoByWioKH9DwQg1TGns4g3YKCFMALS2sw4MH
 ypXEZPvb6INT9qF9lf+y+YrPK5/AYR2rsasFKHgljW9SXhy9EmmSyZRQO Q==;
IronPort-SDR: iLiuYrud3UaVxlfXFRArWxO1xcf3W3xAl3FHWF5cHUHzA6L8n/wGH02Xm3vd8ew//+YAzVKHZt
 MlYvRl3LWC386PLord782wVIlmJOQhN/yEPI6m8zYXExtPyn1HHZCZOeTnlLydCWH6g2qq0RBM
 s8uAbXFSG5xlEctnArKtgDvrd39t6Gmz+Gzr/0xCMV1cskVLCwHuCdMztDkB+L2yn41Pv2DUVB
 MKwBNBFDhHkw2RgBfgHoneghH2i/hQe/tRx2v5DdLalY51vRaSs5p1V7z+Rs7v9J1LuBei6oaB
 7Jk=
X-IronPort-AV: E=Sophos;i="5.73,523,1583164800"; d="scan'208";a="249436297"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2020 04:37:58 +0800
IronPort-SDR: GCyYciZH2O72tUDJanwvVZRn6NM9HmyrsuPWWqPAljt4D5c+BkX1HzDVTa4UUI+HKKRf/hNFHe
 kRb1Vri7ZaKDdDae0zH+l7ZwolFlgJ9P4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 13:27:12 -0700
IronPort-SDR: zhUy0TZrnbjXxnnsfrT0zttZ0ocHgV32WRoVPnh+Xsp3azyEDgqpotxGdu7x6cjHL7aX3S004I
 Fk5DgEo8B6iA==
WDCIronportException: Internal
Received: from usa003792.ad.shared (HELO yoda.hgst.com) ([10.86.58.133])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jun 2020 13:37:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Acquire mmap lock before invoking walk_page_range
Date: Wed, 17 Jun 2020 13:37:32 -0700
Message-Id: <20200617203732.2076611-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_133804_709948_147F3B62 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Mike Rapoport <rppt@linux.ibm.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

As per walk_page_range documentation, mmap lock should be acquired by the
caller before invoking walk_page_range. mmap_assert_locked gets triggered
without that. The details can be found here.

http://lists.infradead.org/pipermail/linux-riscv/2020-June/010335.html

Fixes: 395a21ff859c(riscv: add ARCH_HAS_SET_DIRECT_MAP support)
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/pageattr.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index ec2c70f84994..289a9a5ea5b5 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -151,6 +151,7 @@ int set_memory_nx(unsigned long addr, int numpages)
 
 int set_direct_map_invalid_noflush(struct page *page)
 {
+	int ret;
 	unsigned long start = (unsigned long)page_address(page);
 	unsigned long end = start + PAGE_SIZE;
 	struct pageattr_masks masks = {
@@ -158,11 +159,16 @@ int set_direct_map_invalid_noflush(struct page *page)
 		.clear_mask = __pgprot(_PAGE_PRESENT)
 	};
 
-	return walk_page_range(&init_mm, start, end, &pageattr_ops, &masks);
+	mmap_read_lock(&init_mm);
+	ret = walk_page_range(&init_mm, start, end, &pageattr_ops, &masks);
+	mmap_read_unlock(&init_mm);
+
+	return ret;
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
+	int ret;
 	unsigned long start = (unsigned long)page_address(page);
 	unsigned long end = start + PAGE_SIZE;
 	struct pageattr_masks masks = {
@@ -170,7 +176,11 @@ int set_direct_map_default_noflush(struct page *page)
 		.clear_mask = __pgprot(0)
 	};
 
-	return walk_page_range(&init_mm, start, end, &pageattr_ops, &masks);
+	mmap_read_lock(&init_mm);
+	ret = walk_page_range(&init_mm, start, end, &pageattr_ops, &masks);
+	mmap_read_unlock(&init_mm);
+
+	return ret;
 }
 
 void __kernel_map_pages(struct page *page, int numpages, int enable)
-- 
2.26.2


