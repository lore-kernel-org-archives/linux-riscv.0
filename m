Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C0CEC8748
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeQg8g2oa2Goxbb48TeN7ZcPOIRJRYXoCHlY5i8WwTg=; b=OU29J5n9UmAAsu
	ov+2unGrbKAK0UCfghHMMPO2j1nqiSGMl+N1hMT0BTqVlukezQfc930VMoxMGVIJbx5t624Y0cB3p
	8cjmfl2gX3WY3zGovpRgEPiWSkcFFc+WoBfG3XygZon8fjq0Q7RK4PnCYdjfMnK94NsmLv4QAnGDx
	Z+3vOZtesPMf6AtxtGwTlGCodr65WyORKiHJjTomiqDKyu4kHjVpkeecWszxZ63VAVtSHiNwUGPnp
	xWeaK3U/l/AxeCOeKuJHYMbdsKMy70PzTdNz50CgW1E6iwx+ij6cf91+SYzCAhlVLtsvi/pAealVh
	M7he95Vb3zM5VtkN7MhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfG9R-00GJrh-1U;
	Sun, 10 Sep 2023 08:50:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfG9O-00GJr6-39
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:50:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C6086CE0204;
	Sun, 10 Sep 2023 08:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77069C433C7;
	Sun, 10 Sep 2023 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694335835;
	bh=vsqC4Q0V2oBEuQjchMzNlW8atq0L+1M6Tmmkzi/4EhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLPQ9eXDMYpawn2FVYrooVHIvkEML7VFiVxFM3fpL+1JL79CGzXxdKhWsuOqy4wVT
	 QIy6P7u32Sjt+ae7SJoOEZ8JoQttxYaas9a+Y8JkR3aZRczKQZxjJzGJ8b4+sI3pbw
	 4l+q20Iuhd7eCVkR3MQSuIIFdzmoMhPm5j9tVPFYPIfS5DIxxtK+KFWrboXBrdJEyl
	 Ee33yGFrEov+z7H3J4u3MPzPARqXA8U5fz3odyjCmuSra2DR7UM4cvVwNrQwzeZDTR
	 BPzc+SE3BSFEf0us+d6qga17E560ME+J5VuaWcgI2p+lqL9Bu2SgeR2hLehzhp+K7Q
	 mJ3IX83I3sVOQ==
Date: Sun, 10 Sep 2023 04:50:29 -0400
From: Guo Ren <guoren@kernel.org>
To: Leonardo Bras <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 0/5] Rework & improve riscv cmpxchg.h and atomic.h
Message-ID: <ZP2DVap64lJZj9g4@gmail.com>
References: <20230810040349.92279-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810040349.92279-2-leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_015039_403768_1E9BC708 
X-CRM114-Status: GOOD (  29.06  )
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

On Thu, Aug 10, 2023 at 01:03:42AM -0300, Leonardo Bras wrote:
> While studying riscv's cmpxchg.h file, I got really interested in
> understanding how RISCV asm implemented the different versions of
> {cmp,}xchg.
> 
> When I understood the pattern, it made sense for me to remove the
> duplications and create macros to make it easier to understand what exactly
> changes between the versions: Instruction sufixes & barriers.
> 
> Also, did the same kind of work on atomic.c.
> 
> After that, I noted both cmpxchg and xchg only accept variables of 
> size 4 and 8, compared to x86 and arm64 which do 1,2,4,8.
> 
> Now that deduplication is done, it is quite direct to implement them
> for variable sizes 1 and 2, so I did it. Then Guo Ren already presented
> me some possible users :)
> 
> I did compare the generated asm on a test.c that contained usage for every
> changed function, and could not detect any change on patches 1 + 2 + 3 
> compared with upstream.
> 
> Pathes 4 & 5 were compiled-tested, merged with guoren/qspinlock_v11 and
> booted just fine with qemu -machine virt -append "qspinlock". 
> 
> (tree: https://gitlab.com/LeoBras/linux/-/commits/guo_qspinlock_v11)
Tested-by: Guo Ren <guoren@kernel.org>

Sorry for late reply, because we are stress testing CNA qspinlock on
sg2042 128 cores hardware platform. This series has passed our test for
several weeks. For more detail, ref:
https://lore.kernel.org/linux-riscv/20230910082911.3378782-1-guoren@kernel.org/

> 
> Thanks!
> Leo
> 
> Changes since squashed cmpxchg RFCv4:
> - Added (__typeof__(*(p))) before returning from {cmp,}xchg, as done
>   in current upstream, (possibly) fixing the bug from kernel test robot
> https://lore.kernel.org/all/20230809021311.1390578-2-leobras@redhat.com/
> 
> Changes since squashed cmpxchg RFCv3:
> - Fixed bug on cmpxchg macro for var size 1 & 2: now working
> - Macros for var size 1 & 2's lr.w and sc.w now are guaranteed to receive
>   input of a 32-bit aligned address
> - Renamed internal macros from _mask to _masked for patches 4 & 5
> - __rc variable on macros for var size 1 & 2 changed from register to ulong 
> https://lore.kernel.org/all/20230804084900.1135660-2-leobras@redhat.com/
> 
> Changes since squashed cmpxchg RFCv2:
> - Removed rc parameter from the new macro: it can be internal to the macro
> - 2 new patches: cmpxchg size 1 and 2, xchg size 1 and 2
> https://lore.kernel.org/all/20230803051401.710236-2-leobras@redhat.com/
> 
> Changes since squashed cmpxchg RFCv1:
> - Unified with atomic.c patchset
> - Rebased on top of torvalds/master (thanks Andrea Parri!)
> - Removed helper macros that were not being used elsewhere in the kernel.
> https://lore.kernel.org/all/20230419062505.257231-1-leobras@redhat.com/
> https://lore.kernel.org/all/20230406082018.70367-1-leobras@redhat.com/
> 
> Changes since (cmpxchg) RFCv3:
> - Squashed the 6 original patches in 2: one for cmpxchg and one for xchg
> https://lore.kernel.org/all/20230404163741.2762165-1-leobras@redhat.com/
> 
> Changes since (cmpxchg) RFCv2:
> - Fixed  macros that depend on having a local variable with a magic name
> - Previous cast to (long) is now only applied on 4-bytes cmpxchg
> https://lore.kernel.org/all/20230321074249.2221674-1-leobras@redhat.com/
> 
> Changes since (cmpxchg) RFCv1:
> - Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error
> https://lore.kernel.org/all/20230318080059.1109286-1-leobras@redhat.com/
> 
> Leonardo Bras (5):
>   riscv/cmpxchg: Deduplicate xchg() asm functions
>   riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
>   riscv/atomic.h : Deduplicate arch_atomic.*
>   riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
>   riscv/cmpxchg: Implement xchg for variables of size 1 and 2
> 
>  arch/riscv/include/asm/atomic.h  | 164 ++++++-------
>  arch/riscv/include/asm/cmpxchg.h | 404 ++++++++++---------------------
>  2 files changed, 200 insertions(+), 368 deletions(-)
> 
> 
> base-commit: cacc6e22932f373a91d7be55a9b992dc77f4c59b
> -- 
> 2.41.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
