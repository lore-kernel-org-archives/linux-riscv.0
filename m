Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E0606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T0iAP6V1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Lg1B8Tcr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qXdCKs6EZ3LgixttqF0zQcL/whiEqwoWzzBckY0LLQ8=; b=T0iAP6V1AB582V8iMB2OI3fSei
	og1iaqR1ufSHvCabFb/qZ/T+O1EufCA7RqQK5J/kc5R0lHx5lBVuSG3sN2rEYwHDcSZXW6Ejqmhf8
	Aq5HcGGm1v9UvhSNbWm2RX0McpGCOqu5lx72KUYb/040iRcugCg+M3mHptGm8AyVMdHYYa6W2ru/Z
	BnkQ1zoALGx2RnAtCbQDmUNTD/ZS/RaRB5SJlz+LGxbD1+LVzQT22cBQ6i5P6mMt2yobbiRTRTLWG
	2LWSwFkIa5p24nn5wtCgxBGCy2WX4H8wTYb8BUsJLpoKw8ZJJHiZOx6J86C2oVZ9XHYm62ygg4oSu
	btF/w0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIXX-0000000GhWi-2Nsv;
	Fri, 23 Oct 2026 16:54:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIXU-0000000GhWI-0iMF;
	Fri, 23 Oct 2026 16:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pcT1nqswGvhjhJ6QI4zO5XNTRfIOEZo9dTuCxwHmQEQ=; b=Lg1B8TcrpKQEABeOMU7T3G5Hpu
	Ewmq0QRH1jBJFanR+BBTFIBbID7ztHj4FrrwjLV/LgIv7rxAeq1eyiAu3twSLRq9hzSsXY1+ZXy1d
	3zm5oheRLbGuumab5EoiI51+7kNANEBo6rzryhElKcgie/Sq5Mww2j6QmJEgkvuQoObtAiGQsu1HM
	sH1uGVqVk4nRfxi6MUJT9kfaGkVfxW2V+hJGFLdc95a3mbrckGcz89jP1riMHPpSZZE1Th2QgMq/K
	W6jHj7Mb1KRa6dycBCd6PPiioxvEAnV/qTuJJkZT6q7MRLCmbuzFfqbdcvLwx+MDuqJ57MuygfHJr
	fJP3342w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIXM-0000000A7Li-42D2;
	Fri, 23 Oct 2026 16:54:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E4C55300720; Fri, 23 Oct 2026 18:54:34 +0200 (CEST)
Date: Fri, 23 Oct 2026 18:54:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
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
Message-ID: <20261023165434.GX2823843@noisy.programming.kicks-ass.net>
References: <20261016095711.1364609-1-srikar@linux.ibm.com>
 <attjv8zOftf9Hlqe@localhost.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <attjv8zOftf9Hlqe@localhost.localdomain>
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
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 03:40:15PM +0200, Frederic Weisbecker wrote:
> Le Fri, Oct 16, 2026 at 03:26:40PM +0530, Srikar Dronamraju a =E9crit :
> > Commit 21641bd9a7a7 ("lazy tlb: fix hotplug exit race with
> > MMU_LAZY_TLB_SHOOTDOWN") moved the handling previously performed by
> > idle_task_exit() into the scheduler CPU hotplug path using
> > sched_force_init_mm().
> > =

> > As a result, idle_task_exit() is now an empty stub and the remaining
> > architecture call sites have no effect.
> > =

> > Remove the calls to idle_task_exit() and the now unused stub.
> > =

> > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> =

> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Excellent; less is more and all that. Shall I take this through the
scheduler tree?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
