Return-Path: <SRS0=e4Tc=4I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A1BC34031
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2020 06:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799C120801
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2020 06:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FPLAmCuT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="viZxOsOA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799C120801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q0gtO4xOKrINlGwJFaqSYGlJzjKciaJz3M5LU4iAHBA=; b=FPLAmCuT3DGZ2h
	IROMJ4mNklVafpMqq4VpdA3dKHBFPlAZzXNQ29+r5zIwHQvMuOmJyeqtL4qq7K82XjBcbSffwy/Ov
	Gqfwdakct9IvXQxLvwkm6HYMQA/1hjOn3/zBZ05tQHZJwRlDhy22mPUkkMNe6xubh6IXX62tkHUpW
	euhQ0rM/n66sJUTZU3VvTyyn1uzgZxLH2+uj3mn/RbvkdmWCZD6p+xSgVl1ngMD3BTBZaJy7mQbFA
	GsZ911FhwGrejB+D3NTqcahQfk/UDyeEzwqIn3BGz6ooOv+l1/LIj9YnO7ZZwbERzGDgJQ5Yhv19m
	4734FkfCv4iAn+JsqfwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4f3k-0001Ii-Mh; Thu, 20 Feb 2020 06:11:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4f3j-0001IO-CM
 for linux-riscv@bombadil.infradead.org; Thu, 20 Feb 2020 06:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=q0gtO4xOKrINlGwJFaqSYGlJzjKciaJz3M5LU4iAHBA=; b=viZxOsOA1yAC2b0kPNqLGLlb4v
 UnTi7AAy0ObAvURwaG11eHkYyT1Dsm4xfnqFPI0zzrsd5sK0V9uAFkfu2dGotw11es2C1kHb66Umk
 YFGhn/Mz+NaFLKZdKi63s2GARaBcCnjmIYN2x0lyzxVba05O+ijSWyiYNMygH2MkW1hUQUSMRlviV
 aE7cyVvqPat2jQfzE5O2BkXt551Q/SN8RiwZMzLR+eQ65c6Nr38A9mQe0PsLU+j/mm+SHJOMixHqx
 E6/Hp/kz0yvhVjBrEpqCW8WZxuSWmeO8RBCwQk34GX2W59NGhp0xWeqH/XSoXvOEd3M2/dZNsM3e/
 qOFPxawg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4f3f-0003rb-9V
 for linux-riscv@lists.infradead.org; Thu, 20 Feb 2020 06:11:37 +0000
Received: from debian.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6C72B240005;
 Thu, 20 Feb 2020 06:10:50 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Use p*d_leaf macros to define p*d_huge
Date: Thu, 20 Feb 2020 01:10:23 -0500
Message-Id: <20200220061023.958-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_061135_469893_7987B600 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The newly introduced p*d_leaf macros allow to check if an entry of the
page table map to a physical page instead of the next level. To avoid
duplication of code, use those macros to determine if a page table entry
points to a hugepage.

Suggested-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/hugetlbpage.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 0d4747e9d5b5..a6189ed36c5f 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -4,14 +4,12 @@
 
 int pud_huge(pud_t pud)
 {
-	return pud_present(pud) &&
-		(pud_val(pud) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
+	return pud_leaf(pud);
 }
 
 int pmd_huge(pmd_t pmd)
 {
-	return pmd_present(pmd) &&
-		(pmd_val(pmd) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
+	return pmd_leaf(pmd);
 }
 
 static __init int setup_hugepagesz(char *opt)
-- 
2.20.1


