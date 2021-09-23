Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58147C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 07:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B65360EC0
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 07:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B65360EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFIIZ4V6oBtL9aRVzMyG8n7WbFFtGWvkgD9/5+v3DX0=; b=ABjSyPigw+kzHE
	nI8DsdnJLqdWE5yk6IEXtrQQgvqeeiP0HcIJJrXTNQjPog9cvTat3FWcBYj3ppcNqe3cmrd8MHvo/
	HLETCb6PgNnoaKjlU0uKihd/45Q9+8IDYgVNouFxxIt5j8lNroWNILH/WCXi9ZMhcVhT0K3P6jc2F
	I0SzRXb0tG52zp6OJlRwEWj6ecYYWrhuKAoHr+dn47YMIo0JDo3f3NOOpa3uSehAsCdkqs++RfzPg
	T50ydi3mNSPlLzShyMNIksXW68mo6xPP6iu7UqkLkcHk8UxDc4HVRMOiZBVj8zOvbIptDFW5NH/Hw
	xvvnRZEj+dbl0vlFs9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTJPA-00AXrk-C9; Thu, 23 Sep 2021 07:44:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTJOf-00AXeC-3d; Thu, 23 Sep 2021 07:43:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9933660EC0;
 Thu, 23 Sep 2021 07:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632383036;
 bh=iWKfUnKlQ9cPEYiRCmYD11oUFDahtkWK+8zPXcxbHfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H1kaX42zyV3QIA+qDp4knzrt9WyS+qws3w1e8o4EW+yTnl/4fM57n5Dphy5IjQHJ1
 6E+ppDgbmXTDPAKAQlraJB76u0SOF1v5mXkUUakV90s32cAhMAYyDsPNx4Sc1n4wvi
 W2oWhofnItmWkCPORqhQx9dfBnxoDuP3YwVe/8TymJVaQJp3MdfdmJm4lZw7qje1Mr
 1e4A83pakvGWhdUmI+pTan/SrNA9KzDSPNoli0MAkH0aR0LyfCR5iZGE12ruwS9Z1D
 HQ9EitT9EFvxvF9zxe+XZQX3fVc+GHOu2xA+uaYHGpyeNsZPbdbM0oQVVJVjEdP4Km
 NSNLeM6nYHuFw==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 2/3] xen/x86: free_p2m_page: use memblock_free_ptr() to free a
 virtual pointer
Date: Thu, 23 Sep 2021 10:43:34 +0300
Message-Id: <20210923074335.12583-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210923074335.12583-1-rppt@kernel.org>
References: <20210923074335.12583-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_004357_217569_14ED26CB 
X-CRM114-Status: GOOD (  10.15  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

free_p2m_page() wrongly passes a virtual pointer to memblock_free() that
treats it as a physical address.

Call memblock_free_ptr() instead that gets a virtual address to free the
memory.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/xen/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 5e6e236977c7..141bb9dbd2fb 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -197,7 +197,7 @@ static void * __ref alloc_p2m_page(void)
 static void __ref free_p2m_page(void *p)
 {
 	if (unlikely(!slab_is_available())) {
-		memblock_free((unsigned long)p, PAGE_SIZE);
+		memblock_free_ptr(p, PAGE_SIZE);
 		return;
 	}
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
