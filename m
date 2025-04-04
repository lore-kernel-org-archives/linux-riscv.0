Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C25DC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 05:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A7vVbJ/c1ubPtbA4tg63Pg90pWFuoEEbQBKCgCklajA=; b=h3rZKuqhXTOtAYx9fdeUhbr2Fd
	bmxg+qTTNppE3lUeFxwTGdgfFutu7xNTo7LFbHz9ErBLuq1Op94NTcxd5PmvJu53cYVOT5T4T+Gdk
	k5XZEvjlQkYWl6ATpC/akGNn/mm0kIpNW8mFmB814RJ/0jOMnNU77sHuoacqmQqj8YCL3SgGA9yc7
	446aBUxslCgqPq552BNlRsK4sYnst7qRZHwe6BlIwQ/bGXM4btm9I3wdTrnMeHtSqomdTS5Gf9DB5
	XyDRHJNECGGwV5PFXj0/osIajHk9BCLc0yUDFd+RvjJVWIM1bxCdp83LeS7PwnBYYg67fJBOV+3Gh
	p9v+ds6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0a5B-0000000ApQ5-3Ani;
	Fri, 04 Apr 2025 05:59:13 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0a59-0000000ApPk-1Zt7
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 05:59:12 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 26A43254021A;
	Fri,  4 Apr 2025 01:59:07 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Fri, 04 Apr 2025 01:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743746347;
	 x=1743832747; bh=WtWETSKQn6E8bswj3SLwct6dL1bxKxqY0tLnxPdz92w=; b=
	kyfj2nX9ywt+kVVqKE1zT4yIyvL/zGCsiqO6jTMQsjvGPl/kiPADp7TbnoMZCX/+
	QFXcz/uvl9vN8VceDDBP2648jebgklkeEOSTSLzreuLOQ66tbyj1ik2g3RGuwpoL
	UHMfUYvkNRTbRQxAaPry9K9zDXpBx2fzk0BIL/qaFlJEhNIwbWArvn19EjQozfsj
	K1dZKi3x+x/YhUHYDfzSzl3m8Dg1rBI8dhuVS8wFXlPhveAwoPjZxdkSSNpyuQXz
	s1ZsNxjjB+Vt/q1eB5UnBi3CKuftqnsjcYivr0PDrUXPg+bHEks+t0O+KerRhSsa
	IQ+mazqhzkkCr+tYTirCOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743746347; x=
	1743832747; bh=WtWETSKQn6E8bswj3SLwct6dL1bxKxqY0tLnxPdz92w=; b=U
	lXaRuZ7WZImyYo29349y1E1+PLVJ0jXDAetbG1N9eyw+lYEC+kMR3wqtrzLbAxAK
	5giOOqAaZNhi8FRpn3MTMc4IxAxD7pb700AWeI6+xYK5GYSlObTX1hXqSM93KQhZ
	28Fz7hGF6R5qFu5uDqMTN7KG58OOgscxreZyiSP71gFnGHKRqWLsKceOZ7OatKwJ
	IyAz/gPUNOcSKeUlmCjGuN1h9nQqGTO4gQsW0iTArh61X1WDe+EWrhSuhg6V6Juq
	E8EI4of3KJRnKdyNPlZHhSsq2l5n3WHqeHEElu4x0f3dSihhIqHbcxPssBC45/4U
	JUyXvAN7mnhOv1RT4rsXg==
X-ME-Sender: <xms:KnXvZycppOk42usNnGIZ-1ad9UmDjWojB-S12dWSvr4zNG24vbrrTw>
    <xme:KnXvZ8OryAGUYA6VsbLaJDzt9EEOnbekFpg2e6fmAyAQRpgA9DUwHG17U0-pcVoKq
    6gr1ob-e6TRw7IabRE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledtieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghlmhgvrhesuggrsggsvg
    hlthdrtghomhdprhgtphhtthhopegrlhgvgiesghhhihhtihdrfhhrpdhrtghpthhtohep
    iihhihhhrghnghdrshhhrghordhishgtrghssehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epihhgnhgrtghiohesihgvnhgtihhnrghsrdgtohhmpdhrtghpthhtohepsghjohhrnhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhi
    shhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:KnXvZzis5nVlP2N_1orhQVV-sh5Gv_mpr8KN165f-qtU3w6qAptW8A>
    <xmx:KnXvZ_8PdQo94lXe-_5Ne7XFtI_xMvdMKpEw3gptZnk2RKEaz9wLQg>
    <xmx:KnXvZ-utjr21MYl3URUU1tX-WmnkR98v79aXEKuzmq75_3iqtUZ3IA>
    <xmx:KnXvZ2HLi4WUyOTg1wGHDxc5bhdzD9G4VaRB-WrK6BS-zirO9J2vNw>
    <xmx:KnXvZxswNfWyawCUSZPdgwJw-w89RVRs8F9GgKVBNOcQZV_fTIc4pKdC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 362E42220073; Fri,  4 Apr 2025 01:59:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tdae3ef9051e7a30c
Date: Fri, 04 Apr 2025 07:58:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ignacio Encinas" <ignacio@iencinas.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: "Eric Biggers" <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Zhihang Shao" <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>
Message-Id: <c6efcdca-5739-42b6-8cb4-f4d8cc85b6af@app.fastmail.com>
In-Reply-To: <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
 <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_225911_478146_E87392D4 
X-CRM114-Status: UNSURE (   8.99  )
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

On Thu, Apr 3, 2025, at 22:34, Ignacio Encinas wrote:
> +#define ARCH_SWAB(size) \
> +static __always_inline unsigned long __arch_swab##size(__u##size value) \
> +{									\
> +	unsigned long x = value;					\
> +									\
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
> +		asm volatile (".option push\n"				\
> +			      ".option arch,+zbb\n"			\
> +			      "rev8 %0, %1\n"				\
> +			      ".option pop\n"				\
> +			      : "=r" (x) : "r" (x));			\
> +		return x >> (BITS_PER_LONG - size);			\
> +	}                                                               \
> +	return  ___constant_swab##size(value);				\
> +}

I think the fallback should really just use the __builtin_bswap
helpers instead of the ___constant_swab variants. The output
would be the same, but you can skip patch 1/2.

I would also suggest dumbing down the macro a bit so you can
still find the definition with 'git grep __arch_swab64'. Ideally
just put the function body into a macro but leave the three
separate inline function definitions.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
