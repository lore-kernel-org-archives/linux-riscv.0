Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042FC60A382C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m8AxQ0YD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MsxhMa+8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P3ZLUkJFECRHrY9i61pw4IakC7MJlUX/6mKQukVXOVw=; b=m8AxQ0YD4bnRAHjv6uOV7jvu+t
	6i4J/y/5dLxDCRvDiY9gqiNVqkzW37jR5t5IHjhh9Mx5Ky3dt96pdMj85nmd7J4gGNJee+MF6rg1v
	7bgXwafR7A5ujbbWtoy8Hz6ZtDKB230t488tR2CdIUTsN5hACBlSTO/QP2IzkjhAiCI71PoaQ+b+F
	2hTofZnor90Img5GWpTWuWSV8AB75uMaeAy9b9hgmnA3Zr4zkbZsV09Zp3N/eeEniiVis2jrlhSvo
	r5eFwYgKE7E2TIaeOg8zGv0tsvI2ICTb8TRLiJrp0vUTj+bnjLw2YOO8SraC0sAPS54xCNoA1tgh7
	q8cg98+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVP-0000000GOwh-22qn;
	Fri, 23 Oct 2026 13:40:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVL-0000000GOs3-0zSi;
	Fri, 23 Oct 2026 13:40:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1E4760213;
	Fri, 23 Oct 2026 13:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9E21F01825;
	Fri, 23 Oct 2026 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792762817;
	bh=JSne534GRKySd/hPuhXIpMo4L1wNZz0o43yKbATYUSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MsxhMa+8RyiwJgrd29IwYvMrh1cHDsIzj8ShYsSP8l3MGgb0rGCLCUvRTv9kIxkte
	 t0VZKOUDGbmY6X4T3Gw7XtuUlrbLQGSBSRtT6ZMxixd1345kiDmZsRdQw7kjtVNwhX
	 yVbf1NZHIaJc+XOjIrrRoMJoY5ZgjxbvwdTadswH0wxvmeq8QB3Wt1/eZLhikw2cTA
	 a4/kqD8BG6/dlzLTUoTX8d7Y9YqGUyp6Uqr631ey4In10G1wo1cW7k33IEWmejIFHk
	 TOrqQvWrfH3PSsVDJzFucUAbvMtcO8eK/CiO0FoaiTl0NATRKo3vw3g+XN+zdK7puQ
	 Ev7oA1CQstKaQ==
Date: Fri, 23 Oct 2026 15:40:15 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Kees Cook <kees@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Pengjie Zhang <zhangpengjie2@huawei.com>,
	Thierry Reding <treding@nvidia.com>, Xi Ruoyao <xry111@xry111.site>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Rong Bao <rong.bao@csmantle.top>, Hui Wang <hui.wang@canonical.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH] sched/hotplug: Remove unused idle_task_exit
Message-ID: <attjv8zOftf9Hlqe@localhost.localdomain>
References: <20261016095711.1364609-1-srikar@linux.ibm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016095711.1364609-1-srikar@linux.ibm.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Le Fri, Oct 16, 2026 at 03:26:40PM +0530, Srikar Dronamraju a =E9crit :
> Commit 21641bd9a7a7 ("lazy tlb: fix hotplug exit race with
> MMU_LAZY_TLB_SHOOTDOWN") moved the handling previously performed by
> idle_task_exit() into the scheduler CPU hotplug path using
> sched_force_init_mm().
> =

> As a result, idle_task_exit() is now an empty stub and the remaining
> architecture call sites have no effect.
> =

> Remove the calls to idle_task_exit() and the now unused stub.
> =

> Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- =

Frederic Weisbecker
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
