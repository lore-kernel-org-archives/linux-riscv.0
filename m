Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DCDC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 14:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuHOvYAv3qjYPvM6CPU6qzeHjgOqPeVrGEYtJU8bHuc=; b=BSpZMg6chY75EE
	MV1fV7PMkaYE9AWlSf6iF3o8rVfMri+4kutOS/suR8dpMaA8cBxQIDbCgnXj70767C0uZSW470tEU
	OtkwrpRhUQ6KYOL5lHlZiqXvBPqigo8pylj3+4zqR8aJahL7x1cmcdd9vwzQGMOGnI0PBRRZboMBK
	TYo2uXjyrpI4QVKrIrXvPtoT3Lr8vFj2C5l7+XxhAte7FU7Zdx77Q/npAONNThTqqXIwOWFCXz7l3
	trrLt8AOqEaXMKbxh6HapMkdYlc2T7b7gAE/waPHe69J/XUtsQ30iWTvmVhha66GQy08N5Mg6xh+I
	LBM0709BTmH14EYu+Y0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUSCI-0000000CzO8-0g8l;
	Mon, 29 Jan 2024 14:01:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR3Z-0000000Cfcl-2sbM
	for linux-riscv@bombadil.infradead.org;
	Mon, 29 Jan 2024 12:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fKY0nJ8fYJnC2xkC+wk3vcUZKJJkEzEBPQxWgaxQbuA=; b=MfYgVWN/ZwkZz0pBvAhiH2jYgT
	6Ccb2K1uSFZsFlFohSbx8oov8wgRg4N2ZlzoI+XYNif4k9oyrD9XE6mXOcVAgatQVTlIzzr5uiGaC
	8OZRf7sgVCrCikxuz2w5a9BmPlW7cwK96Qmpo4dQa3qJQgt9dT0SdQXbDnAUPs8YPGMt3EjTA6q78
	7M1MHIRuntnu8jkU56oG9PE0idWq1W2bfipBOFQRt5gHB2KX9/BAWfXe54Wf5P8U3nX19V2jniJSk
	EHNVz+snQ/uzFxTJ2DHITRblkC9mv0my0/onhaOnc7dVXLtc3M2N3q6Mapmh5DUm+0AQpRhtdtC+b
	nSveO2AA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR3S-00000007lfe-45Ax
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 12:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKY0nJ8fYJnC2xkC+wk3vcUZKJJkEzEBPQxWgaxQbuA=;
	b=OlHI15TfXjoLALlWMVD18AUag7qu5TO52EtoDXpjZ7H61P+gOwumcY8ZDvKMg7LRGztEEa
	FGWF9GwTC9m+onFwVxVm5g37BsfhEIFburxDKWPOrE3EMouYniRht3CkXkzOSoZ/nXnzeS
	S6kqZpwO3xqS+oJATeN/F62vAFMIvMY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKY0nJ8fYJnC2xkC+wk3vcUZKJJkEzEBPQxWgaxQbuA=;
	b=OlHI15TfXjoLALlWMVD18AUag7qu5TO52EtoDXpjZ7H61P+gOwumcY8ZDvKMg7LRGztEEa
	FGWF9GwTC9m+onFwVxVm5g37BsfhEIFburxDKWPOrE3EMouYniRht3CkXkzOSoZ/nXnzeS
	S6kqZpwO3xqS+oJATeN/F62vAFMIvMY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-L0LUIbsCOk-VxGFEn38f-A-1; Mon,
 29 Jan 2024 07:47:52 -0500
X-MC-Unique: L0LUIbsCOk-VxGFEn38f-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AC391C04325;
	Mon, 29 Jan 2024 12:47:51 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 304AB8B;
	Mon, 29 Jan 2024 12:47:45 +0000 (UTC)
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
Subject: [PATCH v3 09/15] arm/mm: use pte_next_pfn() in set_ptes()
Date: Mon, 29 Jan 2024 13:46:43 +0100
Message-ID: <20240129124649.189745-10-david@redhat.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
References: <20240129124649.189745-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_124803_945444_0376BDC7 
X-CRM114-Status: GOOD (  12.16  )
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

Let's use our handy helper now that it's available on all archs.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 674ed71573a8..c24e29c0b9a4 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -1814,6 +1814,6 @@ void set_ptes(struct mm_struct *mm, unsigned long addr,
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte_val(pteval) += PAGE_SIZE;
+		pteval = pte_next_pfn(pteval);
 	}
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
