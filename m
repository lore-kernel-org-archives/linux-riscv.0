Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D963ED3E2A0
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 18:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsGTiV+/PBv3BmUuMenSdoisBgA0RrV7Ct6GDIjdugs=; b=2Du+/bVCWfhDya
	O+Dbd3BZAzyubxF5fyQNGdeJ7zEOzkPBez5/S2p34WHlYjICbXBQJtjTNSYuH/cED4ldHz6F/hD2g
	HgMLI1EqSrh/EvSn9Bf1SJ4aDV+95YYU0fXlAyveTj2EgY237nrrEg2dfRuiKPhUzEMN+Owf4aKs7
	VWfnwcyF848N3c8nNCw6qF1sPQqKAEoMMkqbOIGZs+t8sVz1vzlNgnv44sG1Bu+zMRnVKpklpyBKD
	KYu/sMuYZtFV5ZoH8xvTQOzEhYaluSdcqG+F+6RxHTYcMvEkTrhOAogjm2tslfV4DygLepa55w2xZ
	sivJpgGbSj/3Tll8vh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UgG-0000000Bri6-35b4;
	Mon, 28 Oct 2024 18:41:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Uec-0000000BrS0-1mcN;
	Mon, 28 Oct 2024 18:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51C75A42B3F;
	Mon, 28 Oct 2024 18:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611F4C4CEC3;
	Mon, 28 Oct 2024 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730140789;
	bh=uk4BWPlVVVwanPbUBrAaB+ERcnlLbOL0Xx2a3Ixjboc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufVbxxkTWxJDj8HIHfBS/e+90hOVJwh2ipSDoAm1RUfU5KMmgV7WmmTEjAnysS0gC
	 z5jEygQH1q1/a4tB71R8Bp1ATC7U76OqZCKr7wjOu+I99j4mc2QjAt8Nucxunj7xg1
	 wZGv+VyMIcKunGsRclb7iUvRyfGDDFbVTaCVCog4/uhm9IRpC0XmzA5NwCl+5V8/Bn
	 9wZ5570n4BR8rOzU1bjzDuSdR42R13+66vSllQDn/p2SFwTnRgy26PwXV6Ke4S75WX
	 FEIMyZc4Wgc+/rkrpAtXMY0SjfvDNi/ydcZe2lrkEs8d5xkzyJZMRC4Uj03ufeh6Rh
	 9Iy6DC7COCGhw==
Date: Mon, 28 Oct 2024 18:39:38 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 05/28] arm64: vdso: Use only one single vvar mapping
Message-ID: <20241028183937.GA3132@willie-the-truck>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_113950_537476_CAE38BA9 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, Oct 10, 2024 at 09:01:07AM +0200, Thomas Wei=DFschuh wrote:
> The vvar mapping is the same for all processes. Use a single mapping to
> simplify the logic and align it with the other architectures.
> =

> In addition this will enable the move of the vvar handling into generic c=
ode.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/kernel/vdso.c | 43 +++++++++++++------------------------------
>  1 file changed, 13 insertions(+), 30 deletions(-)

I took this for a spin in qemu to double-check that compat and native
tasks can peacefully co-exist while using the vDSO. It all seems ok, so:

Acked-by: Will Deacon <will@kernel.org>
Tested-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
