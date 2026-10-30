Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7459E606A32C
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KnNalHhX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/JomPMd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZptiXwEkUuSGI3sXZAO+B3uhbzjpJfYEjBtnQAD4hwg=; b=KnNalHhXEg2PVJZqdiA3zDLH+A
	3xmkQYdr31pImBnm8dkNz48BL4xIN/FdFp1r6yhGGDY4IHsLgjOLEfhOPjl3gUG957ARb//i6JOrM
	DSctVRBYCsifS0zFWNJUF9S2RIulA/MX3jRbkFnltx2jomKA0DLpoZ4M6QxoYPcsB1awK1A9Qolpp
	QQRDQihTH+hGZbLMuTylu1sEF2FxoQaiDDbkhLIGEs4miSFM9WxRvtvVQJxT2JlEiizLs0iZCgZNY
	4WgqERvZck+6jKU1HgvjtesNrJcBu2/a50949C+/dty9iv71YmQz8243lLdSR95PUDi5wf3q3Xo22
	urq0da9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfdb-0000000As0w-1vgp;
	Fri, 30 Oct 2026 05:58:51 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfdY-0000000As0b-3wAB
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 05:58:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so206131a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 22:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793339927; x=1793944727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
        b=n/JomPMdqDOVSSY9kr7GQdZswQt8KHMnO848lyG3gsTwfvdsRGM64PxCL6lmZIQHrW
         T0lb758rtXybbgo1KSC6YMh8cWz+NWn4yNJDyj+18zyTBjDEO9I/hHwwWVN13i/i06WT
         zl/Sr9Zc8PnfcztFh3zP89hh0zdtYANpcC/RCihLmfqlHOOQBaCnhHLKE6ePumrSf+5n
         Z3XwdO+W53w1XqGeg0lsHkvrPw76pjaQjSW9YQdclSi+oLhRp2bZuVrbLjM8SexQuEWc
         jX05fWMsCHW9I/okFzgIVya/uUw6UyVTwaaK3x7bZW8qVL7v8o3lTxTp7neDQiDfxky5
         PvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339927; x=1793944727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
        b=1KFX/HBLlAABCjYNH/lqDBYfdpEa+L9rBNxwhBHnUbJFX9A5diCIfJUyf77wSoFGy7
         MmVNCtxbR+mPVmKrU7bAs+JqprpfCFUFWFbMkPXm6/7Q/hwKDNmdBJvcFcluAoRZZ/5c
         3n/j/ZpbH8T4FfhsI2OZu8JidAieVxQNK9tmWFaympZJ3PXKRaUyEEL9BEmZl16n+6WJ
         kpGTeTTNul8ESeh24gduSClRKN8Xk0II1xOB6w9s82nks50VkVaRZMKME/FVioP1WR6W
         MlbCXHyZkcMqIovK6eKR9bEggdMSYzT0SXwFUkGW2hmRVy2UVmW9lyzhk3z/XPmr55DN
         fbiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7UDBElNP/hCVa6JMSS8RkqYyKRchxVabFVkNmr3nsKPlwYf4P2P9ChE0Jc5trICkkcHs+Kvga0IHABw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLHkiYn2xIffAJTtOALxFw/URrQde4Ao1+ICFl5hB1HXWElPLee
	Ym13E+FH5EBA5oi0u+vdvW5nTogVxTzKMJmx+sfmW9/A+xR5k+CyptwA
X-Gm-Gg: AYBFou21B+6Zip0S3j4v2trEoBO3FqYUBcgOzrKfKlNfsJlzDVoc2KkNypt6TdvOaHK
	+GmHLNFM7KFEF41yZxOmhwCs7mmhrqKto1j6y1DZRgrBrMtK1K+FDwPkBThY0872CEC2NbkNOTM
	M/4wk1VCIjPY2gBodZ/JTF8ni854f6wU3SDIsrQPMbOBDN+T4vip0Aow+AYEzpjHRsEI6oHLJN1
	q0ogLx91/ZSy38JgXBhXwiYKBs90OvB5DgyQda6ZOuv90QZAXp8cXCg9BvsNUNvbxjME0G1wjk1
	5jLWLV1sd2huivnHQf5UWaVM+mVUrDagDNEV3M6mYntyId6oSvqBJghPxjr4FsUsHxF/y1YcXgY
	L19YgcB4zHnxmTWpy7S9yWiDE2G6A/7p18K0JYJQ9GMeNzX3W4oKXEVTd/xkUaG2lnUTjQSzFPU
	J9BIdNrF8zENmwwQ1Inel6714NhXOrec8tCx59Cbn0xcWQb3EizhfB/GPNNFJWJKBP0FJR/cCir
	alKrCg1ChtXZHsr4+jzlDxP7cN9Kqmvyro0E71qCKELMYY7PUlTPOR98Sc4blYhAMY2fGXa9TYB
	CsJZ2qLcgvPw+qgRitXbVA==
X-Received: by 2002:a17:90b:4e88:b0:3ac:85be:cd52 with SMTP id 98e67ed59e1d1-3ae89867829mr983310a91.59.1793339927439;
        Thu, 29 Oct 2026 22:58:47 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2c5sm7211185a91.3.2026.10.29.22.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:58:46 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:58:38 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
Message-ID: <auQyDnBA2tS2MtxV@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
 <20261029-urging-dimly-3747c8bb9b1f@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-urging-dimly-3747c8bb9b1f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_225849_030681_7CA4A2EA 
X-CRM114-Status: GOOD (  20.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 06:58:41PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:49AM -0400, Kwanghoon Son wrote:
> > Add a platform selection for the BL808 64-bit D0 processor, including
> > the T-HEAD errata and common clock framework used by its UART.
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  arch/riscv/Kconfig.socs | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c422b277064b42530 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -12,6 +12,14 @@ config ARCH_ANLOGIC
> >  	help
> >  	  This enables support for Anlogic SoC platform hardware.
> >  
> > +config ARCH_BOUFFALOLAB
> > +	bool "Bouffalo Lab BL808 SoC"
> 
> Ideally, this should be more generic because it would eventually include
> other bouffalo devices.

Agreed. I'll change the discription more detail with devices
information.

> 
> > +	depends on 64BIT && MMU
> > +	select ERRATA_THEAD
> 
> > +	select COMMON_CLK
> 
> This is not needed, there's a select of COMMON_CLK at the arch level.
> 

I'll remove the redundant select COMMON_CLK in v2 as well.

> > +	help
> > +	  This enables support for Bouffalo Lab SoC platform hardware.
> > +
> >  config ARCH_ESWIN
> >  	bool "ESWIN SoCs"
> >  	help
> > 
> > -- 
> > 2.47.3
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
