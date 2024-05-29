Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88965C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vUT9fgntnTFWYmAXZF0+cfpVHdBbEw93szjs3tloBU=; b=bPEKrxHrnOOulV
	zwMcF6LJHa4ZsHlfLzqOeSh3PMCW/5bxdJt1T81wg6sV3hwVXztsLOc4lm29YtDVhcWTJ+vZsuRNl
	37qu4eN9SWPW5jKfb5uHJaDVIhv5BjKARNIxs5rbRaM1p/+V3+JAGqKPTA26GMxn/xEwqQ6Eq1FpQ
	yUmnPDEKqHg1NSsKtfHz3nyb0l2HjpwqrvPMUsmxyf2JHWaoQfuPc1B2x/zPDulqCuigLmJbXyYjU
	SGvQayzCn2X+pmNsGuKNyu2lH5xBPjGxi6AFEXGY+mLNlBi73xnsT/Rx5tX3pp4AtHvIUXjVlu8KM
	e/ekydmykNqZ/3fqWBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLgd-00000004n53-3rrx;
	Wed, 29 May 2024 15:57:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLga-00000004n3v-0rlq
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 15:57:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56953CE0A53;
	Wed, 29 May 2024 15:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D28C113CC;
	Wed, 29 May 2024 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716998272;
	bh=OYSSBejeV+h0PVcSSif4AfjAaQ8JCT/Hva0H2R4ia90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSkDCEhlOxLXGm6lJ/xoOCrEOygETBWQSbf75n62dS1s2Znq+1O1leoHDMz2n2aZk
	 agVKmRJJ+TdsUTHtlgUe8urgEhUmDs6OE3FwnBJViKwQOVA6VRXdXqYVBVDd+aoRiR
	 ie2zuSz4gC2mFjUrRRir6eXQlSJlDv1CPcD0yB3FbF8bKgGbc/JrSLzyNwvyYL6al9
	 FGXEPjua7QhBRIwnCkWXHvAfxZs6hnORKrEEk87UtZP+a/Jr90ZSkmsmMrCYIiAJok
	 TxLpSBzzFbrm0nDz6dPk4rj6tG/y7kf+Gr/uEVJHKj37mtRjYpShMY1t02dDLGCcwJ
	 x0v3CQgkSBqjA==
Date: Wed, 29 May 2024 08:57:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/7] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <20240529155749.GA1339768@thelio-3990X>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-3-alexghiti@rivosinc.com>
 <20240528193110.GA2196855@thelio-3990X>
 <CAHVXubjYVjOH8RKaF1h=iogO3xBM6k+xrGwkPnc-md2oRxbxrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubjYVjOH8RKaF1h=iogO3xBM6k+xrGwkPnc-md2oRxbxrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_085756_647948_4A4AE42E 
X-CRM114-Status: GOOD (  23.02  )
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

On Wed, May 29, 2024 at 02:49:58PM +0200, Alexandre Ghiti wrote:
> Then I missed that, I should have checked the generated code. Is the
> extension version "1p0" in '-march=' only required for experimental
> extensions?

I think so, if my understanding of the message is correct.

> But from Conor comment here [1], we should not enable extensions that
> are only experimental. In that case, we should be good with this.
> 
> [1] https://lore.kernel.org/linux-riscv/20240528151052.313031-1-alexghiti@rivosinc.com/T/#mefb283477bce852f3713cbbb4ff002252281c9d5

Yeah, I tend to agree with Conor on that front. I had not noticed that
part of the message when I was looking at other parts of this thread. I
could see an argument for allowing experimental extensions for
qualification purposes but I think it does create a bit of a support
nightmare, especially when there are breaking changes across revisions.

> > config EXPERIMENTAL_EXTENSIONS
> >     bool
> >
> > config TOOLCHAIN_HAS_ZABHA
> >     def_bool y
> >     select EXPERIMENTAL_EXETNSIONS if CC_IS_CLANG
> >     ...
> >
> > config TOOLCHAIN_HAS_ZACAS
> >     def_bool_y
> >     # ZACAS was experimental until Clang 19: https://github.com/llvm/llvm-project/commit/95aab69c109adf29e183090c25dc95c773215746
> >     select EXPERIMENTAL_EXETNSIONS if CC_IS_CLANG && CLANG_VERSION < 190000
> >     ...
> >
> > Then in the Makefile:
> >
> > ifdef CONFIG_EXPERIMENTAL_EXTENSIONS
> > KBUILD_AFLAGS += -menable-experimental-extensions
> > KBUILD_CFLAGS += -menable-experimental-extensions
> > endif

Perhaps with that in mind, maybe EXPERIMENTAL_EXTENSIONS (or whatever)
should be a user selectable option and the TOOLCHAIN values depend on it
when the user has a clang version that does not support the ratified
version.

> That's a good idea to me, let's see what Conor thinks [2]
> 
> [2] https://lore.kernel.org/linux-riscv/20240528151052.313031-1-alexghiti@rivosinc.com/T/#m1d798dfc4c27e5b6d9e14117d81b577ace123322

FWIW, I think your plan of removing support for the experimental version
of the extension and pushing to remove the experimental status in LLVM
(especially since it seems like it is ratified like zacas?
https://jira.riscv.org/browse/RVS-1685) is probably the best thing going
forward. If the LLVM folks are made aware soon, it should be easy to get
that change into clang-19, which is branching at the end of July I
believe.

> Thanks for your thorough review!

Thanks for taking LLVM support into consideration :)

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
