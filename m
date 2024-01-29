Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329FCC47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 12:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDcnEC9JSSm1M1Z6AKodT2kUmzOfTp8NI0cCS/n3RqQ=; b=RWpbrJ3ZzTWxsK
	d9wF/be8rl7UGGfStySx1BqbP3Kvl/BqL4mhUvQDiTCCWaRQtPfUlkU5nFkLOWVpSFQf5mjx6ZzEP
	4pyHlJXNOpxKUBSnVMLASPwNINDwfc5JyMxHHEKV46BvpSIySo/3q+P2lkW7ZhgLcJiou1p8h2NPc
	6aMuNfkO46YYjzMyyxk+UDP6USAAiRaqGcn1X44nNl3xaZSPWprR97lc0DmlMrBcMdG8SeXfwrH/u
	a38CFxv/lUNhaidELD4N5MTYwFDqrsZRJMp8VsOwmyDAuEIxGkSe2GJfYUMrLPWsEtMXi2yxvh4oa
	xJZN364GI2fQ7+LkhAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR2m-0000000CeuQ-3sIt;
	Mon, 29 Jan 2024 12:47:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR2g-0000000CepA-35dW
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 12:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZBuztrATUgWrwPaWrq4xl5RtiXYg83ssHnQD4Nso+0=;
	b=QntP4EtW51BYS+iiMun9hx+iE4+fCp+swcMqpbe7PxmcZasC02MkCoozks4XscqHA+WQSt
	mqUo04VixYCeCHXHpPwgrsDf287lFlQFPBMuCyk42X44Up74sLhHcoE6/pUWTGgoKXD+yV
	ae+Qyke0f9BXYa+jDf6fe7T+PYO/Ry4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-iEa3Fx0fMcCsFoiq-is6nw-1; Mon, 29 Jan 2024 07:47:10 -0500
X-MC-Unique: iEa3Fx0fMcCsFoiq-is6nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2C1F185A783;
	Mon, 29 Jan 2024 12:47:08 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B5E5107BD;
	Mon, 29 Jan 2024 12:47:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v3 02/15] arm/pgtable: define PFN_PTE_SHIFT
Date: Mon, 29 Jan 2024 13:46:36 +0100
Message-ID: <20240129124649.189745-3-david@redhat.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
References: <20240129124649.189745-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_044714_933736_07B03E86 
X-CRM114-Status: UNSURE (   9.62  )
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

We want to make use of pte_next_pfn() outside of set_ptes(). Let's
simply define PFN_PTE_SHIFT, required by pte_next_pfn().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index d657b84b6bf7..be91e376df79 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
 extern void __sync_icache_dcache(pte_t pteval);
 #endif
 
+#define PFN_PTE_SHIFT		PAGE_SHIFT
+
 void set_ptes(struct mm_struct *mm, unsigned long addr,
 		      pte_t *ptep, pte_t pteval, unsigned int nr);
 #define set_ptes set_ptes
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
