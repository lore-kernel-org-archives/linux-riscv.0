Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B989C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 17:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pVwUo7w9iRP9b/vKDciXcptgxSAbskbCVVdiuW3lhw=; b=rSCzV47VQatq5z
	wA8QmGdtiQ2aPASdShjTjIgVtreUD1a9MbSNK0sK0J/6bKHhxa6wvaXiMAK9vCXin8xe9xcBCHQZk
	sFRytzVuqUQ8YR6O5X7SRFa6tgkZfwdNHW30NX9y1n8u4VXcGCiKU7SV/psE1GonrEo0ZIhmv4u9H
	imRbPPEhC4PZIV+h9RbBcNfPiHaVuNcJdfUqVZWE0y8vVwrTvuGq7FxcVUYLHwEsGEvi5Xn/JUE6Z
	mByyglB9ufJ3ElktFrp9rO5YaWK4QLhkHTz3UuIXJ5dXuNldflaLI6+3JUDeY4AJo8E3WbyAPJdRj
	C303GRXwGaKwnZqg5lNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Slm-0000000Dmyo-1mAN;
	Thu, 17 Apr 2025 17:11:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SZo-0000000DkrX-1mfE
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 16:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B55405C1D1E;
	Thu, 17 Apr 2025 16:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39E2C4CEE4;
	Thu, 17 Apr 2025 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744909139;
	bh=jxIXxKxaNPo3dQmGxoi0tG5S1YbEPJ8HH1VVwK4JwsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8AX4HSlMyK+6vjGU6LNISIWaMI2Kvl2ZIRqMHxyDAt/Vmem72yJ1zLaip+GqanQC
	 roC/3ASqU987M0/pMgs09BI3a7n17pIPMzEmba0a+moJ47+F4yhsVk0jx/GHxtke1g
	 sYl5I0WW57wSgkij+x1IH+ySGmYxZeZNYLY4mdXW2Nl2ycVCqmdrdoOwi6BNGJ/zpC
	 eoZaqiX+XCZN3nQOYCC9V43vKoHRrp8TBYF4aJqbYMAih+fJPsNb0j9+Tl3bhq+uf7
	 LR7WJaM6XqazLHqR1lV4SDC5PxKdSMInlgW59aaXMAHlHsCeFYKgLWrTMV/htMXQWT
	 JfeVOXg8AU9DQ==
Date: Thu, 17 Apr 2025 09:58:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
Message-ID: <20250417165856.GB800@quark.localdomain>
References: <20250417064940.68469-1-dqfext@gmail.com>
 <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
 <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
 <CAMj1kXH-u7hiKGQfgYHj_16V4ATN_aHmA_wkvMSyLh+E3+QaAA@mail.gmail.com>
 <CALW65jZVYUZoka7Gbjcoh43qbkD7rGpw8gTZjjOYpZD-BhLyBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65jZVYUZoka7Gbjcoh43qbkD7rGpw8gTZjjOYpZD-BhLyBQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095900_517523_E2CD1E9C 
X-CRM114-Status: UNSURE (   8.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 17, 2025 at 04:42:46PM +0800, Qingfang Deng wrote:
> > I see. But do you have a particular configuration in mind? Does it
> > have scalar AES too? I looked into that a while ago but I was told
> > that nobody actually incorporates that. So what about these
> > extensions? Are they commonly implemented?
> 
> It's aes-generic.c (LUT-based) with accelerated GHASH.

That's an odd combination.  Normally accelerated AES and GHASH go together.
Presumably you're targeting some specific RISC-V CPU.  Is this going to be a
one-off thing for that specific CPU?  Or can we expect many RISC-V CPUs to have
GHASH acceleration without AES?  And if so, why?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
