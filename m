Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C37B606D810
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Px3ioRa3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RV6f4qcJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kPt7H04BiIJHURpkBJ1Y2U6HpxrvClJ/baPuUFMH/rs=; b=Px3ioRa3UCSr+7oLIMKINBieuV
	2jge7x/bFNobgMI6qV7g/2x/NwGaY4rXVHsxypYhi7LtjtiZ/DMslr3Hh08iDQH/jgAz1Rjl2o4A9
	7xRj0KgHDq2VSfQ+xk+VTfZb15uGgq8qAcszIcLph374owFjI65T2LWZVrUbk/WlfeIAoZM935jPW
	m0UQytIh4j5gjJvXltxKwe2IU9YLP6SN6xY9FiQhhaTHcFZz9hvuGajMO02RPL/DhJWVn1pxosWwW
	iyipbc/91+czz6bx1BNbRNpD9WcjEdD6c2ctl0FXIxK9YO7qMg81se+WQ1eYxZH4l0e4RhrjdAxeQ
	wDaf9s6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLc5-00000000FaS-2OfH;
	Mon, 09 Nov 2026 09:24:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLc4-00000000FYv-0cwb;
	Mon, 09 Nov 2026 09:24:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F02F40710;
	Mon,  9 Nov 2026 09:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E841F00921;
	Mon,  9 Nov 2026 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794216267;
	bh=cNFD8zbRoLqcBaLpUrUz65qzQQyXXiRBbh/ZFm+g/0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RV6f4qcJIjlbsx8FxA1gxmtGOYGrqDAqHaEFkjDmVEvh9lKtryFCfIVBh2Syv+Nm5
	 3pWfPBY0jOJrkRMONpLfK9G4EHDraDOfXd+MhXzuTpE2P9tsEthfMKFGmOQLCDYlzs
	 SrJGyjebs3ZRk2dtFEh1jcZAgMmA+UzzkSel7YKXk43VbE4n0QFjoaKPOUMpS0lDnO
	 15H2VQcUneTXTIQ+aMXnT45PaTd+sHwAGhegff5F4dk8O3hpM+u4GKIrR7OGwG4/2J
	 uogUUW4aLsfTJs2ixdi0HB3c3kaLECdnu2Awi3Rgj9GQOwpEjUI4amOtG6CTKVQEMx
	 rIaJ9//B6Yzjg==
Date: Mon, 9 Nov 2026 10:24:19 +0100
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
Subject: Re: [PATCH v3 5/5] mm/sparse-vmemmap: drop @pgmap from vmemmap
 population APIs
Message-ID: <avGRQxsRFT6Ax_zy@localhost.localdomain>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
 <20261107043122.25650-6-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261107043122.25650-6-songmuchun@bytedance.com>
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

On Sat, Nov 07, 2026 at 12:31:22PM +0800, Muchun Song wrote:
> The vmemmap population and memory hotplug paths no longer need @pgmap
> to decide whether a mapping can be optimized. That state is now carried
> in mem_section, and the architecture-specific population code can make
> the remaining decisions internally.
> 
> Drop the @pgmap parameter from the vmemmap population helpers and the
> related memory hotplug interfaces, and remove the remaining
> dev_pagemap-specific coupling from those call chains.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
