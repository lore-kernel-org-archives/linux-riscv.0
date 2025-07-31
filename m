Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7C3C87FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Inv3yGTRTsQ9O+3RTiFRmdVsFAqXpamamMCpcoWb/oE=; b=OlkDdJwMCQQ+9m
	MvDrWbzM6bSgQs1qSCFeRRWKLpPUNHLymPMAEyHEWcFbPAcK1l33WYMfx2wbCr6dToN8tU1eBl1ul
	t51YzZRLVS6BX2XEN/772hOAi+1M0zKYTuNUuc1faFK8SIqnuhrmaqXlO3Uov33v4IdwqJJpHDqpl
	XJRjcTFwA76yLn50WvvDPa7l/KYeJoiazzHnC7FGtCfWp4cdkUxpXaXG2nhhKRKFcM0YpfEMuTH0S
	acN5axozw/LWmtkNbqIFw70FGbRTsOMSkb9oy8UbhJzJTHG+s47YhYRFW98WXHs2T6TZLQpk9AlGs
	i3XNi6WaSsKuan4PyIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVkI-000000041nO-2e5d;
	Thu, 31 Jul 2025 16:03:06 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVkE-000000041m5-2p7w
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 16:03:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753977750; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DGVGICaTwhhJr59gs+cfZIQtxM2SepPnYLR/ivuLXW+6ONYxfFOmF/m90Avpb5zRkiM1CFHFsumMTL5pQP5LO1apBSZ7JW974L42i0iGtZSOqi4uwI3I8+yLa6jQUhNFDDrbLhA4XVB9LBEQb0FMYKWiQMPUu36H2bUQlgA1vE8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753977750; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jsundmjk432Nmx+yxivH/Xk7ers/4Sj7qV5Y59avV5g=; 
	b=jXJ5PIT9OftLeQJq9Mgv/O2RwZNvlA+Z3/MdnDE2IeJIf3jCRszZlUXaespC1q5Mk6PBc2z0B9VvyXApz7fOQZoih+KbUnPvx40pLpTlBGtYPffCH1x2waK7hFVc/SGJtRiNLorQwf95kuIHn8kXKMqQbLcC73lXCUFlrR1blZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753977749;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=jsundmjk432Nmx+yxivH/Xk7ers/4Sj7qV5Y59avV5g=;
	b=bcQ9Gw+jfHYzvDinaxptTQseABCW6dyLRb4HAE/vHF5+bg6OQXjqZtEp9b2szz6N
	kw6Iy4yI6w830plPR6802G9dUD4zErzqq7DnRMDJwv+r/eeEeorIPNi2MJYsXxMd65y
	3aSpCymxEyWj7fLqY8U5Q2VgOHl1NstMwA1xXyMc=
Received: by mx.zohomail.com with SMTPS id 17539777482221004.5959311406996;
	Thu, 31 Jul 2025 09:02:28 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v2 2/8] selftests/mm: protection_keys: Fix dead code
Date: Thu, 31 Jul 2025 21:01:26 +0500
Message-Id: <20250731160132.1795351-3-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731160132.1795351-1-usama.anjum@collabora.com>
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_090302_795746_D2126E87 
X-CRM114-Status: UNSURE (   8.89  )
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

The while loop doesn't execute and following warning gets generated:

protection_keys.c:561:15: warning: code will never be executed
[-Wunreachable-code]
                int rpkey = alloc_random_pkey();

Let's enable the while loop such that it gets executed nr_iterations
times. Simplify the code a bit as well.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/mm/protection_keys.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 23ebec367015f..6281d4c61b50e 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -557,13 +557,11 @@ int mprotect_pkey(void *ptr, size_t size, unsigned long orig_prot,
 	int nr_iterations = random() % 100;
 	int ret;
 
-	while (0) {
+	while (nr_iterations-- >= 0) {
 		int rpkey = alloc_random_pkey();
 		ret = sys_mprotect_pkey(ptr, size, orig_prot, pkey);
 		dprintf1("sys_mprotect_pkey(%p, %zx, prot=0x%lx, pkey=%ld) ret: %d\n",
 				ptr, size, orig_prot, pkey, ret);
-		if (nr_iterations-- < 0)
-			break;
 
 		dprintf1("%s()::%d, ret: %d pkey_reg: 0x%016llx"
 			" shadow: 0x%016llx\n",
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
