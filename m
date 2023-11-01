Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A7EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQgbL6XaRalHB1l0h4FM8kqWvX4kNgkBfzHYf/aS+6M=; b=czzME70vHfDVNo
	+vuhmq3fI/AeE+6UG46YFxHYx346wdfm9jdCqONKyBh4cEYjCtxlHS074uN8Z7kFMTWpqw6wseBxV
	3uz/BauO2x+4Y/54u+pdbbGKHFYShwaN87/1gsHHTvIWRGiUMXvd5BJmWDRJepSKCXLcC7xGGIeYA
	yHZDp1Ap4nfUeqTQa5GkNoFEFfMegD7UuyH2lEURNKiO4TyuD4zi7M9pLMzWRTZWimKnL536C2bX6
	v6d5Ezs1b1un1E3vQCbSyrJTVBYSRP9sLV/JTKZiAAtdswNfVp0Jhqj0oX07KQIhaSFUyuNfDce2K
	cTm7jFw7avMwRNIiPRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy8BS-0071H0-1P;
	Wed, 01 Nov 2023 10:10:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy8BP-0071FY-0x
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 10:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CB0161189
	for <linux-riscv@lists.infradead.org>; Wed,  1 Nov 2023 10:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1A3C433C7
	for <linux-riscv@lists.infradead.org>; Wed,  1 Nov 2023 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698833441;
	bh=QFH4mbOlwulYYasFS3YuYwTE92akGQL8J4F9Y36xcuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V3A9dZHWYN/ljW33r4rPDYX2hWgMeE5fTvsiql7Uu1cL216ab8euWmr2ZgeudaXJg
	 Yl8vVJpFMCTJ0uch4n8S93s6z+HRj/gqxa3CW3sJ6Z+7cIC9eYYnObFo+vWBe9IEoF
	 pdTV6uy8FqI+F66TjJHgEX5Pqhl7WEejLGUWWC3nQC12W/ynCYdB9udDi/jAiu8+cN
	 9ozsRmE+9qffNQMVoSCxQXPU1zWw3uXzYI+QavEIQffBlUSqm7/0OOUfY6h4fiGxaR
	 2Uvbjk5rhO3EAqwK3oUFDmWWQusXZZ5fkM9gZJw1q4TI9gjUJBoJZ+TY7ytwlXh9M7
	 mkOyilr1RB1Sg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507c1936fd5so752278e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 03:10:41 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz52BphnYToe5v7zq8A99THQ0oCloB92jSPXfHNgqo4zg+xHge/
	gvO7GpGHuuqE5XGRjvAXl92HajPRP6wW1b1yX00=
X-Google-Smtp-Source: AGHT+IGUolrzHl+5DPRZaJM1K8FO2NyqWCUzH8G7kYBqNXIiYIj6quDWBwTyhi8z0igm3YpdEz7izRR/1AFraApPjBY=
X-Received: by 2002:a05:6512:3189:b0:504:320a:b420 with SMTP id
 i9-20020a056512318900b00504320ab420mr785872lfe.17.1698833440076; Wed, 01 Nov
 2023 03:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXF0e+MKyDJPS7r=LWusEBCaw=t03JC=+Dz0Qk+GmY+uXw@mail.gmail.com>
 <mhng-ff1fe914-36e9-42e8-88ac-44c7f6976e3d@palmer-ri-x1c9> <20231027-stage-cable-022844c2567d@spud>
In-Reply-To: <20231027-stage-cable-022844c2567d@spud>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 1 Nov 2023 11:10:28 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE7g9Xvn+SMRyJWJpC_Au3JguSMRj0p1cCF4azSMc6y2Q@mail.gmail.com>
Message-ID: <CAMj1kXE7g9Xvn+SMRyJWJpC_Au3JguSMRj0p1cCF4azSMc6y2Q@mail.gmail.com>
Subject: Re: [PATCH] crypto: riscv/aes - Implement scalar Zkn version for RV32
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, herbert@gondor.apana.org.au, 
	linux-crypto@vger.kernel.org, ebiggers@kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, christoph.muellner@vrull.eu, heiko.stuebner@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_031043_405536_02E195EF 
X-CRM114-Status: GOOD (  19.35  )
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

On Fri, 27 Oct 2023 at 15:17, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Oct 27, 2023 at 06:11:40AM -0700, Palmer Dabbelt wrote:
> > On Thu, 31 Aug 2023 10:10:21 PDT (-0700), Ard Biesheuvel wrote:
> > > On Fri, 4 Aug 2023 at 10:31, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Fri, 4 Aug 2023 at 10:21, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> > > > >
> > > ...
> > >
> > > > > Hi Ard:
> > > > >
> > > > > Any chance you could postpone this til after I've finished removing
> > > > > crypto_cipher?
> > > > >
> > > >
> > > > That's fine with me. Do you have an ETA on that? Need any help?
> > > >
> > > > I have implemented the scalar 64-bit counterpart as well in the mean time
> > >
> > > Is this still happening?
> >
> > I don't really know much about the crypto stuff, but looks like there's
> > still a "struct crypto_cipher" in my trees.  Am I still supposed to be
> > waiting on something?
>
> Regardless of crypto_cipher structs, this needs whatever series that
> actually implements Zkn detection from DT/ACPI to be merged first,
> as otherwise the definitions that iscv_isa_extension_available() depends
> on don't exist.
>

Please disregard this patch. I have an updated version already, but
I'll need to rebase it once the prerequisites are in place.

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=riscv-scalar-aes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
