Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D80606A322
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2026 18:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dCiIc4XP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J6C08BAV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vi7ICLQBDwsDnASOirNwLIUXPx/px21UFVKxFLfZL1w=; b=dCiIc4XPBVyxlx5daa9HnjgeDg
	ldFUU81297x0W1fTGRH7wc1HcBVRqMdo/zoGn2QED+Q4F8lmLm2nXbLPJPKluVhC/vTawN6NwegkO
	9oqgSYZrBNL1Jqipt23nPkbAnwDFWVxCOVjYjgdgj8QKUPnxBX4N/eahQTAyDabx5ysYCiSsO3Wf4
	4K7CqaGgw8c6wq91/6NDcSMhIVInEelDjJ5k/aG2rBvBmfQE5GqO/8ePRSNjazaM5cF48EFQNimY6
	mKpkD0Kfr9L7ZWnYPnrcAjlHIXjrj9Cz0s7p9gNhBuezGMSpuV4ZYbCfh6uGvyNDmnTMKkJKsK7Ko
	0sOSBgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3Fu-00000001Ioe-39t4;
	Sun, 25 Oct 2026 18:47:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3Fr-00000001Inj-3kcY;
	Sun, 25 Oct 2026 18:47:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35C62600CB;
	Sun, 25 Oct 2026 18:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2E91F01828;
	Sun, 25 Oct 2026 18:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792954057;
	bh=5wnAqR12mDvQqCEE/MRBIlSMPEALxmmJZfIrTK2aMRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J6C08BAV+F3iiWM9FlcPNqjRNGrOHJtPKNVu3OUcI7HqHZFW2bJf7N0c8G+JK3kuC
	 Q9nwKr5QZZOaBx04tv6bryafAtS3l8ddZSESLreLqFOuH9yUyY5YFa2WLyjKrfokOY
	 I5aQbn4Z7ktlYAGGiVhADA+Z2owm484BBGS0MXEu9+8SJ1Xd+9nopeImLHezCjmbsI
	 l+b9jyQmwALbi3HX0Fd2Od6jLx4uuOwo/I0r78SNRDtzRGmz0Z0w8l5bueq5IOCdWr
	 lyimjYWJ1aQUhpScd4g5pAdhgA9k8TZ3KLStW1ngSWF9YCMs/TnFJYzxEr+8kDEq+3
	 1F+kG3xlNHiHw==
Date: Sun, 25 Oct 2026 19:47:34 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Srikar Dronamraju <srikar@linux.ibm.com>,
	Ingo Molnar <mingo@kernel.org>,
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
Message-ID: <at5OxorR-UUIxlIe@pavilion.home>
References: <20261016095711.1364609-1-srikar@linux.ibm.com>
 <attjv8zOftf9Hlqe@localhost.localdomain>
 <20261023165434.GX2823843@noisy.programming.kicks-ass.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023165434.GX2823843@noisy.programming.kicks-ass.net>
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

Le Fri, Oct 23, 2026 at 06:54:34PM +0200, Peter Zijlstra a =E9crit :
> On Fri, Oct 23, 2026 at 03:40:15PM +0200, Frederic Weisbecker wrote:
> > Le Fri, Oct 16, 2026 at 03:26:40PM +0530, Srikar Dronamraju a =E9crit :
> > > Commit 21641bd9a7a7 ("lazy tlb: fix hotplug exit race with
> > > MMU_LAZY_TLB_SHOOTDOWN") moved the handling previously performed by
> > > idle_task_exit() into the scheduler CPU hotplug path using
> > > sched_force_init_mm().
> > > =

> > > As a result, idle_task_exit() is now an empty stub and the remaining
> > > architecture call sites have no effect.
> > > =

> > > Remove the calls to idle_task_exit() and the now unused stub.
> > > =

> > > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > =

> > Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> =

> Excellent; less is more and all that. Shall I take this through the
> scheduler tree?

Yes please :-)

-- =

Frederic Weisbecker
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
