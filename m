Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1D9FD8FF1
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehvx9QyocbeKIr3F+CgjGeXtevsA9WCj4YipT4Y2K7I=; b=IF9rJ4KciBqzZX
	hX6VO+6aPC7/nKNfojO9PjiY35ocUduFDVnMpQRFOSf5wCJqvM/+djAIy7pJR8XoUvwiMkBmEuz47
	VLLuJT0gHVs6lDLxqmaQn1qCpvaDcYrwDR1ZJmJh/pKyp18ME7pgCwIYhZFdWrOVtR4+YB1Y8pSgy
	t9nc3x92OZp7d1wkJkzjfRrKYv9eyVrb2MkpB/LGl57QQv3z5hPhntJFq0Aubp9rLa7RXjVy12D0r
	vmKMostXjwTMJ9h8AZZx9FaBxIEaW+LUR2K/zOQZtNQUTJp+gM1TNvJ3teEbsEj/XVcdQsEEGvNH2
	Hw8uN1cIvabA+5Vd2WLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfyd-00000006x0Q-1dkh;
	Thu, 26 Feb 2026 18:20:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfya-00000006wzm-31jN;
	Thu, 26 Feb 2026 18:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93D1641A62;
	Thu, 26 Feb 2026 18:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC48BC116C6;
	Thu, 26 Feb 2026 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1772130039;
	bh=HV1S/qrSmKMNPz1JBIra1UdVobFVeWulvDlaZO10nbE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PabnRhzU6AHT18WWRNM+FYnoFqe+hChSMy4cjmvk9ZcHJNCXAdiqYd9DXMpTA4IgR
	 7sZPKkxDq1KXm+4nAHkDanvWCFUJp9dczwmhvEv3LBaJTNwaXyTLAreHodUOMltsf+
	 iYrZK8OgzA+d74p/SRx/nc8YUk2EuT6G2bkC4R7Q=
Date: Thu, 26 Feb 2026 10:20:37 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner
 <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, Dan Williams
 <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, David Sterba
 <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>, Song Liu
 <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>, Li Nan
 <linan122@huawei.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: cleanup the RAID5 XOR library
Message-Id: <20260226102037.b855483efa0bf23c72d130d3@linux-foundation.org>
In-Reply-To: <20260226151106.144735-1-hch@lst.de>
References: <20260226151106.144735-1-hch@lst.de>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_102040_814408_71250F8C 
X-CRM114-Status: GOOD (  17.03  )
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

On Thu, 26 Feb 2026 07:10:12 -0800 Christoph Hellwig <hch@lst.de> wrote:

> the XOR library used for the RAID5 parity is a bit of a mess right now.
> The main file sits in crypto/ despite not being cryptography and not
> using the crypto API, with the generic implementations sitting in
> include/asm-generic and the arch implementations sitting in an asm/
> header in theory.  The latter doesn't work for many cases, so
> architectures often build the code directly into the core kernel, or
> create another module for the architecture code.
> 
> Changes this to a single module in lib/ that also contains the
> architecture optimizations, similar to the library work Eric Biggers
> has done for the CRC and crypto libraries later.  After that it changes
> to better calling conventions that allow for smarter architecture
> implementations (although none is contained here yet), and uses
> static_call to avoid indirection function call overhead.

Thanks, I'll add this to mm.git's mm-nonmm-unstable tree for some
testing in linux-next.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
