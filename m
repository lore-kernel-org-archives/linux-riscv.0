Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F24C47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 01:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ED/zUE5DMmKgWnPr5nkHt1LEJ7v1qdiA0Vzouegw5aU=; b=REv/0/GDDBCcw+
	lTEz7upByKgpNB5cM+2IrdQvR3C+BGhAjjgqGsguTsNA1dkQEolrT5UGhdnzjmv9anwjNb3QI3ksw
	v2bJwcDtsJ8C5otm7PeK95vJWZNVkepssjFD2sdC1J9RIqhs00bu50bPetcgB2iBNC5yqxQuU2PGO
	qOmdD2mqvPdsZwtPxuS1ERE6HKRmBddudIBvWpBDZ0sfC0t4bZkk2ziX/ArKtuTev13Krfwc285et
	SgbH8HIMesPWtClsowi53xDhoYOEegyP2DgWxm8kSgDCN4+uND4NJkqeVjccvQh43D62VX6Ko/ax3
	IW23nq809F7UcqbMw9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdKg-0000000EtOS-3peT;
	Tue, 30 Jan 2024 01:54:38 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdKd-0000000EtMk-1PvD
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 01:54:37 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B0B195C008E;
	Mon, 29 Jan 2024 20:54:29 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Mon, 29 Jan 2024 20:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1706579669; x=1706666069; bh=mMpNTLFWFB
	+c+/GqlSqqj8inaaP0ntBJTMndPE1dOMg=; b=DhbXJuXuirbal3flctgFLnEDMY
	NVV90NGALz4rFUD+jhVjdOPnm9O1a/Z8Cqj182nL6o0fQ1583n+uaLdPbVyN8S4M
	kJ7KtlaTJcuIlHk96FfWq/2B6lpWE+SCIuKgfLlo/y2Q/aUrknQwdWuosJl8WWzV
	BguoRjRYMAtQYncU8/4S6s4dIAdSyv3hEJ4eOcMph0S2EQIND86VZv9HdumZZXX1
	zvAIKBi7Xn4J7hGkGZHa90NEewHFJI3+YEWgOGT5zuyFwE+ukDmwTknR5EJMei3Q
	blre5Y+f31bvwkO30v0lWYZ4gHDsdDHrGGjzqihyfU9p1lhcNHyHrOo7ZvPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706579669; x=1706666069; bh=mMpNTLFWFB+c+/GqlSqqj8inaaP0
	ntBJTMndPE1dOMg=; b=kXNeMn+gqMZDHn5/MRv1MlFQLB7P4lJvgo/HQFt22TxG
	EbQll0ypr4fVfX8hSBY76VsXMttudPwTFqCYQpYUrIkmLU5BOo8tSbxepMhFYa37
	O39tmRZS2LXLZlaRUJb1sajC8ZMtvOA5/mk4LgODWKhEtsgpwJ85cpRtj5LfHrBn
	3KNNddQ9vh61s7naxyBn5vwTPoU1Yg3zE/l6JE5Nu27n0ypq9vRZLbkFMdCrWxVr
	71+SWNyMS4GKx+W2rVoHomY5EEIGEqX4faD5FpUh2QEOQ2QF9VNxu1I+IVUx8WNQ
	+aNJZ6IrZtY9byS/BhWszHijVEMax6byne2kludvfQ==
X-ME-Sender: <xms:1Va4Zch97yQW2uZHhRP3aVO1GyaW8fGNG-fZkc_enBgKyb6_OWUDuA>
    <xme:1Va4ZVBaUJG9ZqQAFuUQqTJMVIftV-CP40drOQf8-pAf4p5enN2DOWpuU-50lacRW
    pDQDl8uwvAJkTJPrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedthedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufht
    vghfrghnucfqkdftvggrrhdfuceoshhorhgvrghrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepjeeuheegtdeuteeghfehjeejiefghfeifeejheduvdeugedt
    hfehvefggefgkedtnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhorhgvrghrsehf
    rghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:1Va4ZUGseqlASZF7QeeiKcjbmesx_chOdeWTawBf1ffzzBaiSov5AQ>
    <xmx:1Va4ZdQpzc4y7-9nZ2i9a9L8AdhHDlW5VH8ooA50yJsM7qzJeq8e7Q>
    <xmx:1Va4ZZwLowROqck9Rq2H9wRJTggRNAII88JP7-tjL0QFzntH88vqmg>
    <xmx:1Va4ZZdnkK2W4JBOV-1A5EKgpvCdqdWALiFkOrL2fPoyoXhciqvzjg>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F40761700096; Mon, 29 Jan 2024 20:54:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <46b90dbc-3b5f-4f52-8539-0f6fa7e28ce9@app.fastmail.com>
In-Reply-To: <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
 <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
Date: Mon, 29 Jan 2024 20:53:31 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Shuah Khan" <shuah@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Yangyu Chen" <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_175435_844705_77FF1672 
X-CRM114-Status: GOOD (  25.00  )
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

On Mon, Jan 29, 2024, at 7:37 PM, Charlie Jenkins wrote:
> On riscv it is guaranteed that the address returned by mmap is less than
> the hint address. Allow mmap to return an address all the way up to
> addr, if provided, rather than just up to the lower address space.
>
> This provides a performance benefit as well, allowing mmap to exit after
> checking that the address is in range rather than searching for a valid
> address.
>
> It is possible to provide an address that uses at most the same number
> of bits, however it is significantly more computationally expensive to
> provide that number rather than setting the max to be the hint address.
> There is the instruction clz/clzw in Zbb that returns the highest set bit
> which could be used to performantly implement this, but it would still
> be slower than the current implementation. At worst case, half of the
> address would not be able to be allocated when a hint address is
> provided.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/processor.h | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/include/asm/processor.h 
> b/arch/riscv/include/asm/processor.h
> index f19f861cda54..f3ea5166e3b2 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -22,14 +22,11 @@
>  ({								\
>  	unsigned long mmap_end;					\
>  	typeof(addr) _addr = (addr);				\
> -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> -		mmap_end = STACK_TOP_MAX;			\

Setting mmap_end in the no-hint case seems to have been lost?

-s

> -	else if ((_addr) >= VA_USER_SV57)			\
> -		mmap_end = STACK_TOP_MAX;			\
> -	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> -		mmap_end = VA_USER_SV48;			\
> +	if ((_addr) == 0 ||					\
> +		(IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> +		((_addr + len) > BIT(VA_BITS - 1)))		\
>  	else							\
> -		mmap_end = VA_USER_SV39;			\
> +		mmap_end = (_addr + len);			\
>  	mmap_end;						\
>  })
> 
> @@ -39,14 +36,12 @@
>  	typeof(addr) _addr = (addr);				\
>  	typeof(base) _base = (base);				\
>  	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
> -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> +	if ((_addr) == 0 ||					\
> +	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> +	    ((_addr + len) > BIT(VA_BITS - 1)))			\
>  		mmap_base = (_base);				\
> -	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
> -		mmap_base = VA_USER_SV57 - rnd_gap;		\
> -	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> -		mmap_base = VA_USER_SV48 - rnd_gap;		\
>  	else							\
> -		mmap_base = VA_USER_SV39 - rnd_gap;		\
> +		mmap_base = (_addr + len) - rnd_gap;		\
>  	mmap_base;						\
>  })
> 
>
> -- 
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
