Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78158FD9E0A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 21:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ELRQsUru9y6//tPCTUIYZu3rJjmt3OdU683fxDt2Es0=; b=d1FdistRosAj8alfMQSY3Zsj4n
	saI6HVx99qYjRAuvWxpuAZiObXkrYHwS79CVV9drj4MoV2fJXs+e+oaxmQaINE2qHK2NscV0dg4an
	BYapzvW8ahz97KQBr4WCbuxkLorE+hZuk7iUw46Yw8sUx5v7gzpuMRUS7DTuWd4EmzxPP5Ti3ICpB
	LLeXunc8Qi1e3dgsJFrefUsGShiZPKDbPbL1w5WQDyxWti4eUf+Ss1pCtO1K7xtCX3DZIdKCnynlD
	3F2o7yH4nLw8c7X2hTdsesPvOKE0g+QX9nVPoPcyVafyRpdJy82lVjQZwYG8MiNfBxUb3aFWm5oSF
	A32hGXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjAt-00000007GOB-1dHy;
	Thu, 26 Feb 2026 21:45:35 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjAq-00000007GMQ-0tIR;
	Thu, 26 Feb 2026 21:45:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0B325298599;
	Thu, 26 Feb 2026 22:45:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vJnDbvqv8fxU; Thu, 26 Feb 2026 22:45:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E98F629859D;
	Thu, 26 Feb 2026 22:45:27 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jjhkwk3e1cfi; Thu, 26 Feb 2026 22:45:27 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2545C298580;
	Thu, 26 Feb 2026 22:45:27 +0100 (CET)
Date: Thu, 26 Feb 2026 22:45:26 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, will <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
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
	Sven Schnelle <svens@linux.ibm.com>, davem <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, mingo <mingo@redhat.com>, 
	bp <bp@alien8.de>, dave hansen <dave.hansen@linux.intel.com>, 
	x86 <x86@kernel.org>, hpa <hpa@zytor.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	dan j williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, 
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>, 
	Li Nan <linan122@huawei.com>, 
	linux-alpha <linux-alpha@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	loongarch <loongarch@lists.linux.dev>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-s390 <linux-s390@vger.kernel.org>, 
	sparclinux <sparclinux@vger.kernel.org>, 
	linux-um <linux-um@lists.infradead.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	linux-btrfs <linux-btrfs@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	linux-raid <linux-raid@vger.kernel.org>
Message-ID: <445921547.2198.1772142326749.JavaMail.zimbra@nod.at>
In-Reply-To: <20260226151106.144735-4-hch@lst.de>
References: <20260226151106.144735-1-hch@lst.de> <20260226151106.144735-4-hch@lst.de>
Subject: Re: [PATCH 03/25] um/xor: don't override XOR_SELECT_TEMPLATE
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147 (Linux)/8.8.12_GA_3809)
Thread-Topic: um/xor: don't override XOR_SELECT_TEMPLATE
Thread-Index: geHUNAwCPFDc7iDnvkYlaCznwUsWXw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_134532_625096_7B42F886 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhjaCIgPGhjaEBsc3QuZGU+
Cj4gWE9SX1NFTEVDVF9URU1QTEFURSBpcyBvbmx5IGV2ZXIgY2FsbGVkIHdpdGggYSBOVUxMIGFy
Z3VtZW50LCBzbyBhbGwgdGhlCj4gaWZkZWYnZXJ5IGRvZXNuJ3QgZG8gYW55dGhpbmcuICBXaXRo
IG91ciB3aXRob3V0IHRoaXMsIHRoZSB0aW1lIHRyYXZlbAo+IG1vZGUgc2hvdWxkIHdvcmsgZmlu
ZSBvbiBDUFVzIHRoYXQgc3VwcG9ydCBBVlgyLCBhcyB0aGUgQVZYMgo+IGltcGxlbWVudGF0aW9u
IGlzIGZvcmNlZCBpbiB0aGlzIGNhc2UsIGFuZCB3b24ndCB3b3JrIG90aGVyd2lzZS4KCklJUkMg
Sm9oYW5uZXMgYWRkZWQgWE9SX1NFTEVDVF9URU1QTEFURSgpIGhlcmUgdG8gc2tpcAp0aGUgdGVt
cGxhdGUgc2VsZWN0aW9uIGxvZ2ljIGJlY2F1c2UgaXQgZGlkbid0IHdvcmsgd2l0aCB0aW1lIHRy
YXZlbCBtb2RlLgoKSm9oYW5uZXMsIGNhbiB5b3UgcGxlYXNlIHRlc3Qgd2hldGhlciB0aGlzIGNo
YW5nZSBkb2VzIG5vdCBicmVhawp0aW1lIHRyYXZlbCBtb2RlPwoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
