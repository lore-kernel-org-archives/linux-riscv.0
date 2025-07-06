Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1016C83F07
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 23:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myuRNnzPqK3SUl7mqs1adUzSRHQFyOv8SV0f/DvPch4=; b=Nqh0pcjkBwFGOq
	j4L5NnHy4P739G4UBjgVXA0e97yoCYJ7qcIh+mgL85lBo/MGCMINP4ZIQ86Jadh0w3/CvtLINWiUD
	m8z1IS/mmH1wmDfjR1eUTzMg+UYHFqBXk76b04SuZrI0oulH1cDo51d+S6vAcDZ7CI8x7qs+4SC+T
	pQOUGcluqBjxy5Rr5ceEBnF3Y0EoXagaH0zdCedxFSQtG4ggsKWWpMQGHNko3OdEvunDVsNLRcrgB
	lVMcOooq+EhTw0DnxBsk37roJG4CIabYEvBMwg57jbD8Ur6DqeGIyZmexY47+6yk/sBQZPHThStik
	aMPvi2tJl5o06zTirp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYt9-00000000xaA-1fsJ;
	Sun, 06 Jul 2025 23:35:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYt6-00000000xZm-2c5V
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 23:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 447CD44099;
	Sun,  6 Jul 2025 23:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B95C4CEED;
	Sun,  6 Jul 2025 23:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751844911;
	bh=OtkaQlGOMnD2CLW5Awwe4hKtM4qCPFSTKoEi1AtCy/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDY1j3A1/nVOTtdQyU32ZBr/SwuprbOT0SIaJeRgJ7sW8ZVfCri4PBB1btlgnOlPb
	 FbyVJ2FK/86vOZiAIYqMp6CmrYdaDHYbexNv6nQV57OVOY9lukuneklAdkOO8fdgvY
	 JNsqWWqv9XMXwNdsggW3k28Zs96MnYI/H+doXrDoivE2xcTfiT5K1N1FYA5PsP7/E7
	 e+IG2+BnRAsR4eESDMhukUZZmbcn01VlIaNk1GYZDS6zFD2s1g8Shr5JtM2s1k8BeH
	 0a0QAvagzhhoIDusBKfMo8oPcTRcClHk65top2TYzM5GkPioKRnETecepeccpkoB9n
	 kQb/DSjr2ZCRg==
Date: Sun, 6 Jul 2025 16:35:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	herbert@gondor.apana.org.au, paul.walmsley@sifive.com,
	alex@ghiti.fr, appro@cryptogams.org, zhang.lyra@gmail.com
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
Message-ID: <20250706233508.GA179853@quark>
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624035057.GD7127@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_163512_686285_1BB6C5DD 
X-CRM114-Status: GOOD (  23.91  )
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

On Mon, Jun 23, 2025 at 08:50:57PM -0700, Eric Biggers wrote:
> Hi Zhihang,
> 
> On Wed, Jun 11, 2025 at 11:31:51AM +0800, Zhihang Shao wrote:
> > From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> > 
> > This is a straight import of the OpenSSL/CRYPTOGAMS Poly1305
> > implementation for riscv authored by Andy Polyakov.
> > The file 'poly1305-riscv.pl' is taken straight from this upstream
> > GitHub repository [0] at commit 33fe84bc21219a16825459b37c825bf4580a0a7b,
> > and this commit fixed a bug in riscv 64bit implementation.
> > 
> > [0] https://github.com/dot-asm/cryptogams
> > 
> > Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> 
> I wanted to let you know that I haven't forgotten about this.  However, the
> kernel currently lacks a proper test for Poly1305, and Poly1305 has some edge
> cases that are prone to bugs.  So I'd like to find some time to add a proper
> Poly1305 test and properly review this.  Also, I'm in the middle of fixing how
> the kernel's architecture-optimized crypto code is integrated; for example, I've
> just moved arch/*/lib/crypto/ to lib/crypto/.
> 
> There will also need to be benchmark results that show that this code is
> actually worthwhile, on both RV32 and RV64.  I am planning for the
> poly1305_kunit test to have a benchmark built-in, after which it will be
> straightforward to collect these.
> 
> (The "perlasm" file does have some benchmark results in a comment, but they do
> not necessarily apply to the Poly1305 code in the kernel.)
> 
> So this isn't a perfect time to be adding a new Poly1305 implementation, as
> we're not quite ready for it.  But I'd indeed like to take this eventually.

My series
https://lore.kernel.org/linux-crypto/20250706232817.179500-1-ebiggers@kernel.org/
adds a KUnit test suite for Poly1305, including a benchmark, as I had planned.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
