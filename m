Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30297606A334
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=df0fkVR/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KolnCTI7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fpFWcx4H81y+GvPDVHJEqwjVhr6qm/OcY94zY7L48hU=; b=df0fkVR/DSjrlYWFTcyAkrHMh5
	FEH5QdEm8jzYQiNelp7uwTtRGZ6NynAooZwfZr59pC7LM7NUGH0m7RdRFF05gcGunznfuorWtSFT0
	IYsd1pHgPHtYYIKewontbb97pVLrepFCIM58QRu3ma+ND7Mu5WXXsJh5Ajf2PP3jvxnCfTS26f4zK
	aQLpeNpXTqp6h1T+veES/gRFknQkXPSGSvVT2lIgPcaHt1IC/NT4hGCFtUX2/2OsJuVhF6SdP+hT0
	6x65Whe2g/MJq1PEYZCKnBSZzZiUuI+NI9ZagqN0kRWXsish5D6gJUa4CrWcidJHamCeHam0uDGFD
	x21dhyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPk7j-0000000F5j2-0Guc;
	Sat, 07 Nov 2026 17:22:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPk7h-0000000F5in-27YB;
	Sat, 07 Nov 2026 17:22:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F243B413EE;
	Sat,  7 Nov 2026 17:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBA21F0089F;
	Sat,  7 Nov 2026 17:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794072156;
	bh=XmI8rWYPQf/Yk3+VD2zo2YslLq5vKVW6l7UCq9+Iu4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KolnCTI7SaK31zca7v7wy2Mycrmz3EJfGWSoHQT+xw4wMvA5veAkZQyAzR0RHLf53
	 7z0w2Y1hoaKGxi6XRZfkLKShmaUF9YXKLnTCvVHVorxctr/2riWCRhVYDHO6JUDsb+
	 /txQnwAPITgzg67QQgZLuuhvC4TDhau41rQl1Dtom+Utzu4v7VHiNwoZu0/cn0y8/P
	 PLwkFVCeoUea5WmCr0NKAudWsjpf99WGVzC3JmNDIMMiNqWVwtxCRaxhwoowmDT/Lj
	 FsIWGLvtajb3oBbBnZA/TWCD+SHD/vs+w/hy5dKGnepbpDYnrmj8WXDbUyZV3nfOeW
	 odC6ug+HnuAgA==
Date: Sat, 7 Nov 2026 18:22:28 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>, Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 1/5] powerpc/mm: make
 vmemmap_populate_compound_pages() static
Message-ID: <au9eVOrRrnRNLUZb@localhost.localdomain>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
 <20261107043122.25650-2-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261107043122.25650-2-songmuchun@bytedance.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 12:31:18PM +0800, Muchun Song wrote:
> vmemmap_populate_compound_pages() is no longer used outside
> radix_pgtable.c.
> 
> Make it static and drop the unused dev_pagemap argument from
> its only remaining caller to simplify the code.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: Qi Zheng <qi.zheng@linux.dev>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
