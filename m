Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97526D16268
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iw2q1r58GhFRfZvPjuv9ws5z/2yj6g2/5XNI4H437bY=; b=QcHURa3XC638KV
	JgJfKQsYv3hJAjno8JxY1+iYA3LsWYT5QHHmXE99zpqZYPOtaa4dQH1PNPfhf5D3huzDXAyAFXsj6
	PQGTZmdzRiGq2rYsZUklfJ+4CL7Xj3mq0d81Wtfz/K5wEhtgM42RY/R1RHrOiMmFjP9Fn6pf0Z777
	fwdNuCfj0SPeckxGqfvUSjmOijuYNn/F3hG/xkvKrJzBwQ+AKEj8b4u3A9AlnfavQqsr+3UjWIzIA
	8cZSaIxYA8OWjBiY3XNe4pR0Z2Oa1btMAiy+bjeAIaAWH31YkcKnahtZH044I7v2hWhkIdbtFHW/Z
	g1+5Atg851fddb8FKNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0M2o-00000005T2s-0WkX;
	Mon, 14 Oct 2024 14:27:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LbW-00000005OYV-3aIJ;
	Mon, 14 Oct 2024 13:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C15BA41049;
	Mon, 14 Oct 2024 13:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93215C4CEC3;
	Mon, 14 Oct 2024 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728914361;
	bh=OFpg+lOM6lZXKg41f2jamDsHYXkihHB1FSkYSOpNp7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLiQSRnyrpGh3KeRNqwVQin1xwWw8rjBh6YtiIP+ymVkvW8PlGuD4VtJIxOmpdA7B
	 kLkCXSdWO7/FV7LDmeiT3sDuHbEWfE+uDkzGg9u0jQtgPxwbFMt+IYVBxBrs8U2LC1
	 9Nadzv3qkoFqNSpWKUSyaxfFzYjt/ZSWSsyITg1OKm1SPfPzUCVpR3eToqy/TZ6K43
	 5XWZnSHQHQ7upIBccE716ZkFnzDKlzLGLucKHqBxRdpjzBny2jaw725EkRJ1uOMeI1
	 0f+RlmDrO9MpoT9zo3HWfgQn1fmyMap2Almoz8XozNC3KcwbCpAd0AZ4ckWWNQjHHO
	 bhyzWaJbPd0OQ==
Date: Mon, 14 Oct 2024 14:59:12 +0100
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/9] vdso: Remove timekeeper argument of
 __arch_update_vsyscall()
Message-ID: <20241014135911.GB17505@willie-the-truck>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
 <20241010-vdso-generic-arch_update_vsyscall-v1-1-7fe5a3ea4382@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-1-7fe5a3ea4382@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_065922_980406_516CF86A 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 10, 2024 at 05:44:44PM +0200, Thomas Wei=DFschuh wrote:
> No implementation of this hook uses the passed in timekeeper anymore.
> =

> This avoids including a non-VDSO header while building the VDSO,
> which can lead to compilation errors.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/include/asm/vdso/vsyscall.h | 3 +--
>  include/asm-generic/vdso/vsyscall.h    | 3 +--
>  kernel/time/vsyscall.c                 | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
