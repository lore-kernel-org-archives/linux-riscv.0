Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE33D3B9A4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 23:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cp0pJ676gEWTYDZnxq3WqG+ufFwhWnW5fBqLdq1g/EQ=; b=I8YEkTzbPeR30L
	8WAPmjgPfIv+CZWl6zrbzVyZrZaJIUcdoIb3fNaG7HvB/LMaShDC0T/seSTcp/XRgFr4PLygWNTle
	IDp7/17nAkj7iLuXVSXMGkwGTmPoof/zN1h7muya8i08ug1U7FeFZ+P+v/drzpHI3odFTYQLpqX7j
	xvdZmyhtJOgaiRYaypI/TTu2vgnF2yIFEy+qe1P/6u+XUgtaEsYBtVgJ32c5Q5pb5y+iTX1iQIFdu
	PFzCFvk1pAz/4KZ5JvWRUiJg7oPsats8C21u2u2KUOd73m3lzvjZ5omK0rdNJJJkXmmphT7Dp56s7
	U+nMQ2jOLlNl7ujbENkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6sM-0000000Ets6-30Eb;
	Tue, 09 Dec 2025 23:12:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6sM-0000000Etrw-1Pnj
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 23:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2BDB60181;
	Tue,  9 Dec 2025 23:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB47C4CEF5;
	Tue,  9 Dec 2025 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765321929;
	bh=dOAJWjzwU/24sx5t+aWrT0lj9C4TaECJbxIz9cLUCfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MH5f5nebthMzdcO/r0VOSjY+F+5gNezwlJuKLAfEsQkLR1sIsrqMvmJKmUds5+FCP
	 sYVbwqG4LLuxzvCjlkI+WJWz5CSae2qUD7FYTP+gTcDKVyYQSma3r+YpyLRgGc3Q65
	 ZPQU515jPo78fRNM+qbfyDuZzsvK2zD9zvNoEYTAJR21WfPelH5K7boV2LYKmdSGJZ
	 dcnJsus1wS7JRgSmcVuh55ZcY1I/hvDxoQGBT0+QV0V1LXBlk1+xKbBBo09tPBqAMz
	 05VyZcqL+azb23iF5rixFnAPAdUzyU44hYZuxh646/RfG9fbvdNplyR1JPWbgfCugq
	 8DsZ1j2XpU3GQ==
Date: Tue, 9 Dec 2025 15:12:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jerry Shih <jerry.shih@sifive.com>,
	"David S . Miller" <davem@davemloft.net>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: riscv: Depend on
 RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
Message-ID: <20251209231207.GD54030@quark>
References: <20251206213750.81474-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251206213750.81474-1-ebiggers@kernel.org>
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

On Sat, Dec 06, 2025 at 01:37:50PM -0800, Eric Biggers wrote:
> Replace the RISCV_ISA_V dependency of the RISC-V crypto code with
> RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS, which implies RISCV_ISA_V as
> well as vector unaligned accesses being efficient.
> 
> This is necessary because this code assumes that vector unaligned
> accesses are supported and are efficient.  (It does so to avoid having
> to use lots of extra vsetvli instructions to switch the element width
> back and forth between 8 and either 32 or 64.)
> 
> This was omitted from the code originally just because the RISC-V kernel
> support for detecting this feature didn't exist yet.  Support has now
> been added, but it's fragmented into per-CPU runtime detection, a
> command-line parameter, and a kconfig option.  The kconfig option is the
> only reasonable way to do it, though, so let's just rely on that.
> 
> Fixes: eb24af5d7a05 ("crypto: riscv - add vector crypto accelerated AES-{ECB,CBC,CTR,XTS}")
> Fixes: bb54668837a0 ("crypto: riscv - add vector crypto accelerated ChaCha20")
> Fixes: 600a3853dfa0 ("crypto: riscv - add vector crypto accelerated GHASH")
> Fixes: 8c8e40470ffe ("crypto: riscv - add vector crypto accelerated SHA-{256,224}")
> Fixes: b3415925a08b ("crypto: riscv - add vector crypto accelerated SHA-{512,384}")
> Fixes: 563a5255afa2 ("crypto: riscv - add vector crypto accelerated SM3")
> Fixes: b8d06352bbf3 ("crypto: riscv - add vector crypto accelerated SM4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

I also added:

    Reported-by: Vivian Wang <wangruikang@iscas.ac.cn>
    Closes: https://lore.kernel.org/r/b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn/

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
