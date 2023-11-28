Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBEBC07E97
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 20:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InAtOc2Ld2Z5noZXDFtBRmid3j08uk5DTI7q12Z6Eps=; b=tTyntnVT/gISIk
	ZEYVrNEa1+1nWk2MxUduxl4DAJDxnsTvCaGyL+13mTCunH26EsP9NfdUNhQPrijutQ3q1QUfuqGYj
	tqCvg5ub+nd/cEFWUu6kc+KCMpT0TvoA46wtDyj95fbf32Nsmj/RhUJ4db7tXwk2aGA3CRg6LJ+sH
	n6PxSmWvoCg1UuH60OhVPmLc/e8pEkBABilOEIWM1wWIvmels+jo1D+BQXvrUVfOvinsYwjn5NQBr
	PbckyjCjCOkQgGyKaNA0QTr007Z63JWqOG43rg6zl+TCT3Z4vFfDoTAoKBCoCmkSGZc8k9mwMi0N2
	3kUVngjTWVMHryjLSraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84Rt-006EYU-03;
	Tue, 28 Nov 2023 20:12:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84Rc-006EQq-1h
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 20:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2999B618CD;
	Tue, 28 Nov 2023 20:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884BBC433C7;
	Tue, 28 Nov 2023 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701202351;
	bh=MhX9PEGZOUPQ3Y/dHE9lpPPcT4wCLCEPYr8D6D5VCtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2oSykRN0FvNVERNHm6/mDH1mmOkc0Q49tLDgd40gyaDip6gEW7TAl9Jl/MxHObYA
	 mdl/hcepl0h4CXURQz3Tn8VcDCpPQ0NXOnPu68SuNYjvg/HQgzZ8g4KrNzM5TZPDbJ
	 vDC1pzxUpGiHmYxfU45duhcvVDLjsmwei0St+4UE1NUI6IMhUgdA8mzeRXuH+mLU4q
	 a9yc1zaSWu/cJYpBKDvcaynYd9nSzkV4ILJkE9pokYSgNviVD9rofuNx9vfvhXXoO0
	 vs/iR/aqK59xYP/4AVrqBmBlKYcCuz41pVbRh1aFxjKBpXasnU4aR8ZDjcQrf4mS9b
	 /NZ1g23uTLU3w==
Date: Tue, 28 Nov 2023 12:12:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Jerry Shih <jerry.shih@sifive.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 04/13] RISC-V: crypto: add Zvkned accelerated AES
 implementation
Message-ID: <20231128201228.GE1148@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-5-jerry.shih@sifive.com>
 <20231128-await-tipper-2094715466f2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128-await-tipper-2094715466f2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_121232_603262_E1932DAA 
X-CRM114-Status: GOOD (  13.07  )
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

On Tue, Nov 28, 2023 at 05:54:49PM +0000, Conor Dooley wrote:
> > +static inline bool check_aes_ext(void)
> > +{
> > +	return riscv_isa_extension_available(NULL, ZVKNED) &&
> > +	       riscv_vector_vlen() >= 128;
> > +}
> 
> I'm not keen on this construct, where you are checking vlen greater than
> 128 and the presence of Zvkned without checking for the presence of V
> itself. Can you use "has_vector()" in any places where you depend on the
> presence of vector please?

Shouldn't both of those things imply vector support already?

> Also, there are potentially a lot of places in this drivers where you
> can replace "riscv_isa_extension_available()" with
> "riscv_has_extension_likely()". The latter is optimised with
> alternatives, so in places that are going to be evaluated frequently it
> may be beneficial for you.

These extension checks are only executed in module_init functions, so they're
not performance critical.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
