Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F26C83F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDn3HG/7CwPq6Hn8O7dFNMYroQxcMC4Evpl6zQLMG0k=; b=n1/I43Xh82/UH1
	qClHvbMmarFWuzedj0gC3nT5HYDK0RyXC6jNzCCivE8xEqih5/coEOx095tMLTYU8ornuivwyK8nD
	P0YkE57L+dLcG3ABD/OUevgHZETdJ0ehus2ufAcD9zV8rKtMe0J0jdZbeVnceO1qaGIWpGfBzgK3E
	Bj35OasOOfCGo2VEo0qqTKKv2I8XTGzUB5T3gyyr1l78rb5TW9ze3vuBXja68QsPnO1jGl09+0GI0
	ohM8UoPXvoRxUtX6Ojx3IVdMxyX1BWI9ovgT+fX4BLgmBaImSB9HjxVCw7UGjmi9ME4UKHgwlZVdr
	LoKKLncvmumNzhpGrijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qblBn-00FcMm-0i;
	Thu, 31 Aug 2023 17:10:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qblBk-00FcMN-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 17:10:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F55F63372
	for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 17:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2F7C433D9
	for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693501834;
	bh=uiLO/nSsSs1flvZrz0Clz6ISPAZ5Lq0D/ODFOp9fdgQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rCgiIYm06eaOAocNQELX49Q8behSSuN+BfgZ8tfRRcQJ6pprAiVbiU29w3pyK5F1K
	 H3Zk68nL8JE11nQpEdh2gbwoy8DtSgyOGUnMfgZwCCtuW3MoXscvHt4F+xcT0ie5Dd
	 g9lPvvtaTQKAxQCQJZ/68a+tRRri4FAGanfXC9uWVwm9dJoN1DerP2zQ+HuR5X1ts4
	 OkmATAirOgW47/gYcZppOoRTQRPsJxQKtzoSHmQZRrEpn6eAAPs2bUMC8EnWokw7Eg
	 JqPD6fLLAnp9WIzBionw8w7KuzEVmBqM6H8gOg7i9uhrNNlLZ4tQBG+rUf+skQ4GF4
	 sCnw8F9mSYYYg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso1994928e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 10:10:34 -0700 (PDT)
X-Gm-Message-State: AOJu0Yymhv8hZssw+/QNEFB4BRx6A4oMw0Vjn33UaQ80ByJIXe9hlGpS
	iWFehz0VbnOarw0SAcXib7PZlYgHRTeTeoXOVlA=
X-Google-Smtp-Source: AGHT+IF8GFFoaBrYuN/cSSRBUoKAsriFhs5bDc+5Wc47CXydA/TFLIhQ4nA4ynwj24A7e02vE9Qk2y9Oa1etj/q0Vvw=
X-Received: by 2002:ac2:499e:0:b0:500:b7ed:1055 with SMTP id
 f30-20020ac2499e000000b00500b7ed1055mr4170875lfl.56.1693501832516; Thu, 31
 Aug 2023 10:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230726172958.1215472-1-ardb@kernel.org> <ZMy1DkYRBc1PxC8e@gondor.apana.org.au>
 <CAMj1kXHCt6DJEZKYVYBXN0QhZ0w2ByCPUK2S2y2T5U06Ztrx9A@mail.gmail.com>
In-Reply-To: <CAMj1kXHCt6DJEZKYVYBXN0QhZ0w2ByCPUK2S2y2T5U06Ztrx9A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 31 Aug 2023 19:10:21 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF0e+MKyDJPS7r=LWusEBCaw=t03JC=+Dz0Qk+GmY+uXw@mail.gmail.com>
Message-ID: <CAMj1kXF0e+MKyDJPS7r=LWusEBCaw=t03JC=+Dz0Qk+GmY+uXw@mail.gmail.com>
Subject: Re: [PATCH] crypto: riscv/aes - Implement scalar Zkn version for RV32
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, ebiggers@kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_101036_220349_17F518A2 
X-CRM114-Status: GOOD (  11.74  )
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

On Fri, 4 Aug 2023 at 10:31, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 4 Aug 2023 at 10:21, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
...

> > Hi Ard:
> >
> > Any chance you could postpone this til after I've finished removing
> > crypto_cipher?
> >
>
> That's fine with me. Do you have an ETA on that? Need any help?
>
> I have implemented the scalar 64-bit counterpart as well in the mean time

Is this still happening?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
