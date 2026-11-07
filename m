Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3BE606A33C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R1R2MPUB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRsQH68f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vpZq9iwLxMdXSr0aIhJfvruW3V/iHQNJUoIdElBCirk=; b=R1R2MPUB/d1bT64gmRb3H7NPt8
	UGuuSEq085InUU4slzWmkIB/cD0TXYqQVy0En4cZGV7c52pc8xsrAW2fUHd68GKmH+ZabVWjKEP9f
	CYUz1uS6DQSxHkd449uqrZOniACxFHyJR42+2+/gW3ZO8LgCDUVQc1p3OLN2Db81bcYmOPI7cRcvt
	nBthgRxy8NA7X8pGcQtc6qaxtRwqiR6H/wrAOyyrdMrPpg6wuzgYZD1gilPbi1BMxXa3KkLjBH7it
	UR43C677MGfJnXwI0zO+Zxvvq5jbloFn5/QBlMXu+Dvp7c/vkwAN9rxJLWvqbCYiUfSvaXMKDPAJZ
	ZgyQ9plQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkQO-0000000F70y-45LB;
	Sat, 07 Nov 2026 17:41:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkQN-0000000F70J-3Iyw;
	Sat, 07 Nov 2026 17:41:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27E4640086;
	Sat,  7 Nov 2026 17:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19951F0089F;
	Sat,  7 Nov 2026 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794073315;
	bh=2smR8h1VY8UC7VVz5oqEi+bHmSa6sUXSBdFSQ0jzot0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRsQH68fYsmt/YqRKnGb7j9+ZUn/BT15BJaZIFXTUVXUP3ixFLBWVgTbJU6W8sJpS
	 b1fCpxzQFDVR2VJSr2R8zzA4uJoZdaIK0pmjvTM5lACaj4AJ7F874TXs2E62xNfRn9
	 L5SR2J84VJFqjLNK97AGzyBA0Ut29SeanbpUSwqtHzIqfGJ1wHFQCwrSmOOG0/hr64
	 1IfxE5CLwKht2cP+gI6KyqwZ4xjSA0Mx4E7dLsA3LP5pk3KX25TULgFopV3s/ukW5u
	 KabHjycL3hyF/UFtHzldk64LubWRNFGj7GoutJ/5UALUefJc+nTjsr7J1+bPnfoGCg
	 7ItmzA7G+8f3A==
Date: Sat, 7 Nov 2026 18:41:46 +0100
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
Subject: Re: [PATCH v3 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Message-ID: <au9i2uHBRVP27pbp@localhost.localdomain>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
 <20261107043122.25650-3-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261107043122.25650-3-songmuchun@bytedance.com>
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

On Sat, Nov 07, 2026 at 12:31:19PM +0800, Muchun Song wrote:
> Whether the optimized mapping can be used is now decided in the
> architecture-specific vmemmap_populate() path. When PowerPC has to fall
> back, such as on Hash MMU, it can disable optimization for the populated
> vmemmap range there.
> 
> Add section_vmemmap_optimization_disable() to centralize this fallback,
> use it in the Hash MMU path, and drop the radix-specific
> vmemmap_can_optimize() override.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

I was about to complain why you do not go ahead and drop vmemmap_can_optimize
but then I saw patch#4 :-)

 

-- 
Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
