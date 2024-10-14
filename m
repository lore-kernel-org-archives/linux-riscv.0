Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508FCD16277
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOe1UKn3+aJ1+2QjLtfaRQNQu6/7SIWbSaM/HIxBqLs=; b=Ze9RqyZcgHnOt/
	oOyDO2O5HlBXoIvRfEzQLb0xgzvcOI3urnxkHqZ1WJcwwpZusrTQB4AmuQCoRVnCPjTet4DXV7t4R
	7DGFvwvAqLeAdno9BocBYA1qX5kp+2otIxJNbRdpG2bjA1oSj+aeqXAXrL7CdIj2XVGVEy3KLF5qy
	4BuLVBVq/9GgeOav354FFHH6284ok5vPfFbMdCHZk9GRBoKcT3R4NaDdNdAwwk0M2oHiM0+t1ybbb
	LpptFgtm7EB9aIM6BL+mojLdLkhIp77hdWi8gsDo7sQ3hdVuF6b4xvWci/OpwhT1jtARZUR3/8sim
	fipE46Ov/IMVTAE4OZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0M4B-00000005TJq-2Kf4;
	Mon, 14 Oct 2024 14:28:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Lby-00000005OjC-3QPq;
	Mon, 14 Oct 2024 13:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CFD0A40EB8;
	Mon, 14 Oct 2024 13:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE44C4CEC3;
	Mon, 14 Oct 2024 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728914388;
	bh=H9P82NUHjzhSG+q03ylKXcErnfke+kcbkRkAXEXtqss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSUyMHM312ILKPLeoDrkDB5PqqmMcQXJGNf/rrrQ0VjEAD4ebiRUhrIyozWQ2eGPN
	 K4ege7WiwKlk46bvSDbx03kr9XUeKzrIYI4sHwciGOxO0WMzPdKSJ6ENhrZWuDWWeY
	 GLi+EB0emlojuZERgAdKWUPgzjI84Bo+t6HxU4mNonaA5w49WHQf50KtXnMSmKMsWX
	 VOXG+zGYmKJPumw9ypG4H8TIPF5FA1wC7F43lKOpZWuVLy+l+3UHOeD0LqDjmxV0Su
	 7VJ4wdZCBX9uUsoWFr9xRbWSzq4LDNiwWQS7Z9d2YGbMNLUObt8UqFKWlzg4mwT3bi
	 W27SYygaZmeJQ==
Date: Mon, 14 Oct 2024 14:59:39 +0100
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
Subject: Re: [PATCH 3/9] arm64: vdso: Remove timekeeper include
Message-ID: <20241014135939.GC17505@willie-the-truck>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
 <20241010-vdso-generic-arch_update_vsyscall-v1-3-7fe5a3ea4382@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-3-7fe5a3ea4382@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_065950_934618_462BA9B1 
X-CRM114-Status: GOOD (  13.80  )
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

On Thu, Oct 10, 2024 at 05:44:46PM +0200, Thomas Wei=DFschuh wrote:
> Since the generic VDSO clock mode storage is used, this header file is
> unused and can be removed.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/kernel/vdso.c | 1 -
>  1 file changed, 1 deletion(-)
> =

> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> index 706c9c3a7a50a4574e77da296e9c83e1e2a9f5ab..8ef20c16bc482e92de8098d55=
000c9999b89830e 100644
> --- a/arch/arm64/kernel/vdso.c
> +++ b/arch/arm64/kernel/vdso.c
> @@ -19,7 +19,6 @@
>  #include <linux/signal.h>
>  #include <linux/slab.h>
>  #include <linux/time_namespace.h>
> -#include <linux/timekeeper_internal.h>
>  #include <linux/vmalloc.h>
>  #include <vdso/datapage.h>
>  #include <vdso/helpers.h>

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
