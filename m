Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9E1C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 05:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/bIcFpavwMjeJiSysoMRqmjHKWXNiVUVhYO0fs4SHA=; b=VF/wMjEOOcnIm9
	3iSwcufqbrV6iLsW91WymFBrcp1N+Rt9ajyMRgBWo6vjLIUX5AWtjsojG5OnPmhkDj3TwGfQsQmOn
	qjIC7rivnOA2bg5o5+YQLwbRRmtJNvB1IgaDh/ZCxIHrmpMRev7CRveLfuFIGb8cQ0Cu5l9BA6Qr0
	U+FxYTt8TA5T/pGdx9IEqlSBEBY7cGbi4AQyjRofwXU4XUjYhwxozaQsmsz+iA1LZA1gs43ElUQ3e
	UWDt/ngwi1oL9aMdCGCYNaJZ/cwXpAq4Iy+/P7FcUnyqUkjYzpanU3s1ncp1dDHbYfJ4Mt9MsNXcb
	yz/EaBhZ0+Q8ry8seaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oztd8-006bam-ON; Tue, 29 Nov 2022 05:58:06 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oztd6-006baT-Um
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 05:58:06 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 212215C010E;
	Tue, 29 Nov 2022 00:58:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 29 Nov 2022 00:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669701484; x=
	1669787884; bh=toRxxeDncESQ5ly6fHLcJiv4LuWMVHyJPEIjPKru2Cg=; b=G
	nNXEBVXe4/fRb0d2elSjodffbQpUW6HTYxjt5noLwqTcLzbPnXgg4kZXhJ+y+N5A
	63IexRDGMr0sBbpXHlKacen0AsPhQwg2JvhVDyKI2pG7aYuyPox1aPYqQUAGS0vS
	DKeCqWIGOhjKD0RE65S1WrmryKdl4QJPy8lD1IOMzAEwXLDuZv3xc46Fbk+1//ew
	G8UJ15pOIM10t00bTipGEopPFXgxuxjcFN7ZgdPhO9ITMWqkVGyZ2hAjpAdaLvB+
	NZVOyqD6mBcAgwa+Kv7NPOMWKMT9+Z7AW/0Z802kkbFhmd8J3zOX7HtjB68zqSFF
	ThWfwj8i8svWWkQkoAz3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669701484; x=
	1669787884; bh=toRxxeDncESQ5ly6fHLcJiv4LuWMVHyJPEIjPKru2Cg=; b=e
	0O86b1KyCXPKIzyCduorHpOyPLo0c6fqtE4XdsEkGMVNoFjJ2UcVu/t32BDxw1F6
	VZopeONoAKs7vOX9QKO9QURn22eI6uXzk6xD3UGZ2HknF2z072r/FSJlxOy62QDP
	G/L+tmztMysaR1FeePGQiQQhF+kShkgO8o2uh/vR7MddHxsuNFQ+NZAqu/T2Aj+1
	9mlV8uaoC3yt3ATjcnbMFMDZn5+RQpz3FGhujsllztySNRLdo+Fl8UPBH074w5Y5
	rhH/cz4bWStDGX/NVpaCTy/x46eI7Me85xrDFeUWIsbGplTToygg9X6wOPAgCth7
	W/32C2sZ7DsrH/vIr2tzA==
X-ME-Sender: <xms:a5-FY0FPzggBOzOAbZJzLMxv5rdphYcOlbFwbSRStQOkMzWXYun95Q>
    <xme:a5-FY9VA7tBLpwflzxJjbXD9RXnomVL1y_mc9_injyfdvzM1Z2PaS4QYc-hfVWYst
    Q9tHpaoyh3soDlKsQ>
X-ME-Received: <xmr:a5-FY-JQbXX1E2z6nW9tN1zo2jNt7d7fU68O-UuJFaxaLovHL5msujne5iPVjqpOdUtET5wfNpf433hQGNtW2CqwWfp8RcWIcnIlymyaWSycy3sDh4lYgnSJDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjeefgdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepjefgfffhudejfedtuedugeeutdetgfeiteffffehjeeugfeuvdeh
    jeetfedtffdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:a5-FY2HocQdN1pJKOSMsFwiuscapQ4Xvpw3i2_3L8LwbxA_kFBWFGA>
    <xmx:a5-FY6Xb9hVl1F91w-jl6U9WyWdio59MDEfHim9K3JV5jNB13041fA>
    <xmx:a5-FY5NfdDaSOUg18SOEOOeRGC-6D6y6PlhhvAt4nJ8CdpQ_hbHfxg>
    <xmx:bJ-FYzfOF2aBaFBgeiZqf2JlqgskeJ94j-vLJd08k8E4blXzoRLWFw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Nov 2022 00:58:02 -0500 (EST)
Message-ID: <565e1861-7052-9bd3-e7ba-e590bd91cf20@sholland.org>
Date: Mon, 28 Nov 2022 23:58:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <bf8e33fd-a752-d5d5-859e-14302d069f2d@sholland.org>
 <CA+V-a8sz4i_wenTyA5tVTVB8dQWLmuXCf3CGYOPC+C07GJ8WTw@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 7/7] soc: renesas: Add L2 cache management for RZ/Five
 SoC
In-Reply-To: <CA+V-a8sz4i_wenTyA5tVTVB8dQWLmuXCf3CGYOPC+C07GJ8WTw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_215805_085311_C8A0F5F8 
X-CRM114-Status: GOOD (  15.28  )
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

On 11/26/22 15:09, Lad, Prabhakar wrote:
>>> +     if (!ax45mp_priv->l2c_base) {
>>> +             ret = -ENOMEM;
>>> +             goto l2c_err;
>>> +     }
>>> +
>>> +     ret = ax45mp_configure_l2_cache(np);
>>> +     if (ret)
>>> +             goto l2c_err;
>>> +
>>> +     ret = ax45mp_configure_pma_regions(np);
>>> +     if (ret)
>>> +             goto l2c_err;
>>> +
>>> +     static_branch_disable(&ax45mp_l2c_configured);
>>
>> Instead of enabling this before the probe function, and disabling it
>> afterward, just enable it once here, in the success case. Then you can
>> drop the !ax45mp_priv check in the functions above.
>>
> I think I had tried it but static_branch_unlikely() was always returning true.

You use DEFINE_STATIC_KEY_FALSE above, so static_branch_unlikely()
should return false until you call static_branch_enable().

>> And none of the functions would get called anyway if the alternative is
>> not applied. I suppose it's not possible to do some of this probe logic
>> in the alternative check function?
>>
> you mean to check in the vendor errata patch function to see if this
> driver has probed?

I meant to do the equivalent of:

+     ax45mp_priv->ucctl_ok = ax45mp_cpu_cache_controlable();
+     ax45mp_priv->l2cache_enabled = ax45mp_cpu_l2c_ctl_status() &
AX45MP_L2_CACHE_CTL_CEN_MASK;

in the errata function, since that decides if the cache maintenance
functions actually do anything. But ax45mp_cpu_l2c_ctl_status() gets the
MMIO address from the DT, and trying to do that from the errata function
could get ugly, so maybe it is not a good suggestion.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
