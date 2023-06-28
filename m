Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A689EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 00:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VLMJDTE8flhqYRJb94wBWDqjsIQWCV1A2IHzefruug=; b=jssFU8kqevQZEH
	dczJrLdgOU+GYiXABjPip/OBUtAnfighL0+bRMd1igq4mTe1TqAISzAYZlYrOfqUMxrQtB5M878VY
	2stVbK/O95lVGeHfemLLmu/d9kOOT0DrJq2in4CPYLrOHbOYCfW1IBdo5l7YGdySHlMNQ39sGcUNE
	7GBNhcev6Md4r7WpBCe96o5ECOLSPjvV0XmC5lCeeoOV/lbjBIyqnj1awI6/kNP8S4j3xvoAZvC4T
	7rv2NLv/XAaiYjw2OfSBdySdyEw6UOYI4KXdUG6StyhJqJFuKtkBBvXQiWFePhAuDzBfhz0ody40f
	F6xt20sRXOc2ihWQoAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEJ93-00ERka-2S;
	Wed, 28 Jun 2023 00:34:53 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEJ90-00ERkE-38
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 00:34:52 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4CD235C01C5;
	Tue, 27 Jun 2023 20:34:50 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute1.internal (MEProxy); Tue, 27 Jun 2023 20:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1687912490; x=1687998890; bh=6q
	RdSl8RgtgnLYAHyN1daelemOofzp4E191q490dyuA=; b=ZcC4sPRI6qZvfIdpPy
	cuMb2oAZhSnBaXJpLrBgyuLCdeAN8YCzrdDrFLnIjP75164Tkerl0wyaRL5jV1SY
	cNHOMb20250ehP/AVnvE2QtdrCdoffhqUf5aesy0mojdpVqpz6EdXSvfKkEb4wd0
	a5lHVOBh4R42SRH6tWP9ybLTtAXXehdOJjNQxKm1jKgFgG4wqSHBdyat+VwnijZr
	muri1jSxVmSKlORfj9Fu4zPWZ+JOLRW6zmsiWplMikVGF+n9kEee4hrph2Gmuwdd
	ZxxKjwfLRZqzQbTnFAvyhFI1un4pdsfWmHdv4nLLqUls9BYccLDB+1sMp/5uITu7
	hKdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687912490; x=1687998890; bh=6qRdSl8RgtgnL
	YAHyN1daelemOofzp4E191q490dyuA=; b=gITisZwDu+03PaMzN15x4ZErk1auI
	qv9QSXhSJ0GvRRSWyXM+BK3tqdeh6zZQNi2+TcIp36RDG7/+OYdRqPIOPZ7aogJB
	yZ8jO/YVqmYBRq112QaAhtRiMiEN77gRF3Elhvw1KEnpDCfAeIimmbz00DGOH5iX
	6Xa79Mq5w4lmy3tPq/bFMceq3NRHBGfEeO8/9MBSH+Ic9XYrkIUMTlOZeGGzGeIk
	GaTgiN7CVvEO+vZMRT1C0Nyf4bu9VAq/8w8i2ZKqS3GJ0Qvffc9EbxDagn4b8Kz7
	XdBSD8doWdmF+HVZ4E9F0mEdU+iKCWDjLcFaJaBHk9M8f3KvBDm7ryRIg==
X-ME-Sender: <xms:KoCbZK2JNnn6M6rSSzGT1eoSRlgy6rcdveH2DdFdZhFyCC7FTd2mmg>
    <xme:KoCbZNEoXNUDv3v1inVcoB7mWZIauxoFTgkERMaD8FHdp-OycHrkKKAs_OtA4m5tD
    W1VkDUEIwAGFPF0Jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtddugdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuthgv
    fhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejueehgedtueetgefhheejjeeigffhieefjeehuddvueegtdfh
    heevgfeggfektdenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:KoCbZC5_9Xr-v58LkTdWIArZIuU_OX_hwGHyLGKwS1OGwQgNmGpA_A>
    <xmx:KoCbZL3mFVIiKnKrxFFL3IP94MZ9WjGnPIU0RbCtsDFCaUswuDtD8w>
    <xmx:KoCbZNHQIHk1Hfgf_dJomqKPn4S0Ng7M3feScRm-Jm2kuxK-G_tJZQ>
    <xmx:KoCbZFEyZiumDMKfMlSEbknY4FKytDmRg5lmzobSkCTcwlNejK_YBA>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0BE0A1700089; Tue, 27 Jun 2023 20:34:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <348f624f-3be0-4df7-ab5d-4a912197d82b@app.fastmail.com>
In-Reply-To: <20230627143747.1599218-3-sameo@rivosinc.com>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-3-sameo@rivosinc.com>
Date: Tue, 27 Jun 2023 20:34:20 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Samuel Ortiz" <sameo@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux@rivosinc.com, "Conor Dooley" <conor.dooley@microchip.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Heiko Stuebner" <heiko.stuebner@vrull.eu>,
 "Anup Patel" <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, "Guo Ren" <guoren@kernel.org>,
 "Atish Patra" <atishp@rivosinc.com>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Evan Green" <evan@rivosinc.com>
Subject: Re: [PATCH 2/3] RISC-V: hwprobe: Expose Zbc and the scalar crypto extensions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_173451_104313_1D6CF294 
X-CRM114-Status: GOOD (  21.02  )
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

On Tue, Jun 27, 2023, at 10:37 AM, Samuel Ortiz wrote:
> Zbc was missing from a previous Bit-Manipulation extension hwprobe
> patch.
>
> Add all scalar crypto extensions bits, and define a macro for setting
> the hwprobe key/pair in a more readable way.
>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> ---
>  Documentation/riscv/hwprobe.rst       | 33 ++++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 11 ++++++++
>  arch/riscv/kernel/sys_riscv.c         | 36 ++++++++++++++++-----------
>  3 files changed, 66 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> index 19165ebd82ba..3177550106e0 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -72,11 +72,44 @@ The following keys are defined:
>         extensions.
> 
>    * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, 
> as defined
> +      in version 1.0 of the Bit-Manipulation ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZBC`: The Zbc extension is supported, 
> as defined
>         in version 1.0 of the Bit-Manipulation ISA extensions.
> 
>    * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, 
> as defined
>         in version 1.0 of the Bit-Manipulation ISA extensions.
> 
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKB`: The Zbkb extension is 
> supported, as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKC`: The Zbkc extension is 
> supported, as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKX`: The Zbkx extension is 
> supported, as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZKND`: The Zknd extension is 
> supported, as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZKNE`: The Zkne extension is 
> supported, as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZKNH`: The Zknh extension is 
> supported, as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZKR`: The Zkr extension is supported, 
> as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZKSED`: The Zksed extension is 
> supported, as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZKSH`: The Zksh extension is 
> supported, as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZKT`: The Zkt extension is supported, 
> as defined
> +    in version 1.0 of the Scalar Cryptography ISA extensions.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains 
> performance
>    information about the selected set of processors.
> 
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h 
> b/arch/riscv/include/uapi/asm/hwprobe.h
> index 006bfb48343d..8357052061b3 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -29,6 +29,17 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
>  #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
>  #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
> +#define		RISCV_HWPROBE_EXT_ZBC		(1 << 6)
> +#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 7)
> +#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 8)
> +#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 9)
> +#define		RISCV_HWPROBE_EXT_ZKND		(1 << 10)
> +#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 11)
> +#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 12)
> +#define		RISCV_HWPROBE_EXT_ZKR		(1 << 13)
> +#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
> +#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
> +#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_riscv.c 
> b/arch/riscv/kernel/sys_riscv.c
> index 26ef5526bfb4..df15926196b6 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -145,20 +145,28 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe 
> *pair,
>  	for_each_cpu(cpu, cpus) {
>  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
> 
> -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> -			pair->value |= RISCV_HWPROBE_EXT_ZBA;
> -		else
> -			missing |= RISCV_HWPROBE_EXT_ZBA;
> -
> -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> -			pair->value |= RISCV_HWPROBE_EXT_ZBB;
> -		else
> -			missing |= RISCV_HWPROBE_EXT_ZBB;
> -
> -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> -			pair->value |= RISCV_HWPROBE_EXT_ZBS;
> -		else
> -			missing |= RISCV_HWPROBE_EXT_ZBS;
> +#define SET_HWPROBE_EXT_PAIR(ext)					\
> +		do {							\
> +			if (riscv_isa_extension_available(isainfo->isa, ext)) \
> +				pair->value |= RISCV_HWPROBE_EXT_## ext; \
> +			else						\
> +				missing |= RISCV_HWPROBE_EXT_## ext;	\
> +		} while (false)						\
> +
> +		SET_HWPROBE_EXT_PAIR(ZBA);
> +		SET_HWPROBE_EXT_PAIR(ZBB);
> +		SET_HWPROBE_EXT_PAIR(ZBC);
> +		SET_HWPROBE_EXT_PAIR(ZBS);
> +		SET_HWPROBE_EXT_PAIR(ZBKB);
> +		SET_HWPROBE_EXT_PAIR(ZBKC);
> +		SET_HWPROBE_EXT_PAIR(ZBKX);
> +		SET_HWPROBE_EXT_PAIR(ZKND);
> +		SET_HWPROBE_EXT_PAIR(ZKNE);
> +		SET_HWPROBE_EXT_PAIR(ZKNH);
> +		SET_HWPROBE_EXT_PAIR(ZKR);

Does the presence of a HWPROBE_EXT bit imply that userspace software can
actually directly use the described feature?  If so, we should probably
not set ZKR unless mseccfg.USEED=1.

-s

> +		SET_HWPROBE_EXT_PAIR(ZKSED);
> +		SET_HWPROBE_EXT_PAIR(ZKSH);
> +		SET_HWPROBE_EXT_PAIR(ZKT);
>  	}
> 
>  	/* Now turn off reporting features if any CPU is missing it. */
> -- 
> 2.41.0
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
