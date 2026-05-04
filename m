Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5C2FF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 08:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ugZcgz0P9OJRjetrLxF6QDFbHShitZ4vWpujkvsDf/g=; b=gmbDaYSQfczlvsxBqAFSt0zi9q
	2oBPGsyjxA5IDNZg2VOER81Biyd7HRNjMgbBWzYiMJMMqc6NA+y50ORu3ghMijh569tb8vx5iHhQ4
	bXTMori0lMpoSh0b+gT8RVLoPEKdZb2hEVSC9Bm8HPdOS+Qp4V08AIPwVNEdEWhMoE7KPd7PtvRpf
	lFDq+vwaz4i0PqR/+7afQBwG6qNuJopOu2N76QhiZgWJhlRshT7cRsDCw4FwMGTn38QV3+3//pwKF
	hMjVSqI84xycbkI8X/85Ak7aCUTzLYLwp5FkJShR1U7URaOpyH7bvkgTzpvlQdQZRktnCJTunh+ON
	IlqKr1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoHB-0000000CfyL-2KSd;
	Mon, 04 May 2026 08:03:37 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoH8-0000000CfxU-1J0f
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 08:03:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C2D7EC011A;
	Mon,  4 May 2026 04:03:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 04:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777881812;
	 x=1777968212; bh=lRsobUL6Yqd5naNkEfLWDCbqmttFKUBjkDP0RSCMYno=; b=
	lKIQozwEzFcnuVHJBHQ8r+b5oT97obr68Nf8luMuM3L6O5raCOhhUY7Gctoc1Tp8
	629KHqe8wadhboVSnp1pfYRpNmc+pZFNyYU2mpbW7M44o6VsakgiDSDF58QBnZ/3
	Dd9pzdJUeabis3j6EQvltT0CjZH22hQT5XhkNdF8dWHnvjTSZ5VfKpv8fFimENov
	y2OBPInLOxFUOFKOPP23zqPiM6Xvy5WtUk1iqfX92udoVLSVv+/NSGC8fBHcdL34
	kNewsRgHuStBFHX0paWLj+tG4PMjqZpZnThCSW9mR0nkKphUBaakjPL3G6X4XzOR
	sxsvI2tnrlNp4u4Y/z/Uvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777881812; x=
	1777968212; bh=lRsobUL6Yqd5naNkEfLWDCbqmttFKUBjkDP0RSCMYno=; b=W
	jdGsF4ltkHFNmq4MXhLG7F9XwWgGquAASSnmd6Fq8+oajRxrbhR3fa1qAIKOUp6W
	dz7xegS3ZIzYHyXjL/vCt6mOhMYDrDuAeDbXahTA2ce6HwaHuXFChrssQdGXTdxg
	ASXkoguUZsTFwE5CuZfGLN4oZchI1xBKCYhv6yyMWLFHhoPk8GQ4LJ5j4JaAfNqg
	z7I+qjcYP9OcdQESVckBq+8S86XCu0Awvx1iamWM3zqhSeIYTlj4VSN2gHrxbps0
	1Ms2cGh4aVk79gTiXDdVzyKDoiA721QeovwvOxsqhSeNFyjNsk734G/FtEoFNW94
	jEaf2B4dgR/JL3witKL4Q==
X-ME-Sender: <xms:0lL4aR2L0rD3fWiyNVDOAkvHSrIlIVgK7WgBt5qGs_zUs8aj_oHPMw>
    <xme:0lL4aS4d7LLhmWZPmmqNI-uWQTdk3frrl8Hg52cxJA3YYwV50unHO5OE1dJewfCJI
    Ko-eGJUCsgRPHN7n1uj2hZUa5YYdBsN4955qUHj3NcpB41Loa17Uh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepug
    grvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrohhusegvvggtshdr
    sggvrhhkvghlvgihrdgvughupdhrtghpthhtohepshgufhesfhhomhhitghhvghvrdhmvg
    dprhgtphhtthhopegrlhgvgiesghhhihhtihdrfhhrpdhrtghpthhtohepjhhohhhnrdhf
    rghsthgrsggvnhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohephihurhihrdhnohhroh
    hvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhm
X-ME-Proxy: <xmx:0lL4aRNeIpiqXc5fB1MHgBXrEJ9lZQQEpD-B8lPFp6wgoeLl-5ZA4Q>
    <xmx:0lL4aT2fjft0esTMjzTU1zcrFbzA-_AFE7_VP8BpUHgzkmYgKHRnUg>
    <xmx:0lL4admhcWGT28uCEY5xSJDz_pBSgWnQV3r2LytJJkg8HARZKaDyFg>
    <xmx:0lL4aZ6Wh97kTjE3ydg7__JVwDupqwjhpu_1wCpVBBAEliM3JtcswQ>
    <xmx:1FL4afDExJRXBh0UiKSRKS_WkzSEFtnYN1B_2siySxbqJTYh84FcyA8z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B4B35700069; Mon,  4 May 2026 04:03:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AduvTQsiZ6dJ
Date: Mon, 04 May 2026 10:03:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yury Norov" <ynorov@nvidia.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yury Norov" <yury.norov@gmail.com>,
 "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>,
 "Ruan Jinjie" <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org
Cc: "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <ec4ed7f5-b1c8-49e4-b83d-e29c5414b9de@app.fastmail.com>
In-Reply-To: <20260430211351.658193-2-ynorov@nvidia.com>
References: <20260430211351.658193-1-ynorov@nvidia.com>
 <20260430211351.658193-2-ynorov@nvidia.com>
Subject: Re: [PATCH 1/6] lib: include crc32.h conditionally on CONFIG_CRC32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_010335_028676_72633BF0 
X-CRM114-Status: GOOD (  16.99  )
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

On Thu, Apr 30, 2026, at 23:13, Yury Norov wrote:
> Currently, bitreverse API is either declared based on
> CONFIG_HAVE_ARCH_BITREVERSE, wired to arch implementation, or if the
> arch has no bitreverse, based on generic implementation.
>
> So, regardless of CONFIG_BITREVERSE=n, the corresponding API is always
> declared. If that happens, the functions become declared but not
> implemented, which is an error.

I'm not following that description. Why is it an error to declare
a funtion that is not implemented? Isn't that how optional interfaces
tend to work in general?

> The only header requiring the crc32 and bitreverse prototypes is
> include/linux/etherdevice.h. Thus, protect inclusion of corresponding
> headers in the etherdevice with CONFIG_CRC32, together with the only
> function depending on it.
...
>  #include <linux/if_ether.h>
>  #include <linux/netdevice.h>
>  #include <linux/random.h>
> +#ifdef CONFIG_CRC32
>  #include <linux/crc32.h>
> +#endif
>  #include <linux/unaligned.h>
>  #include <asm/bitsperlong.h>

Don't add #ifdef blocks around headers. If the header cannot
be included without side-effects, change the linux/crc32.h
file instead of its users.

It looks like the problem is the check for CONFIG_GENERIC_BITREVERSE
in include/asm-generic/bitops/__bitrev.h, which ends up
hinding the generic___bitrev32() helper without need.

Simply removing the #ifdef there should avoid the build failure.

> +#ifdef CONFIG_CRC32
>  /**
>   * eth_hw_addr_crc - Calculate CRC from netdev_hw_addr
>   * @ha: pointer to hardware address
> @@ -291,6 +294,7 @@ static inline u32 eth_hw_addr_crc(struct netdev_hw_addr *ha)
>  {
>  	return ether_crc(ETH_ALEN, ha->addr);
>  }
> +#endif

I see there are only user users of this function, neither of
them are performance critical. So the other options would
be to either open-code this function in the two callers
and remove it entirely, or move it into net/ethernet/eth.c.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
