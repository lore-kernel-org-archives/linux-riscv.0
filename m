Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE87C61D99
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 01:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jcLqqn1yXgZcjwq8pFODYEP2I5boqIERVN9nYsmvp0=; b=Qje60VZBttay0w
	qh36pX2vjmpW0iuFIrIURS2u78l9XBuY3Ei9nd1i1I4duZbjFpNzNuZEhWwVkNexkWe6yXsyLBGCV
	ZROPiCQzuP+2vViIdA5dEkQTxBHe+H8WAqVIzcQZUpSG9iLpLOuUQY+iT6SRBMsFPrRGj/fZce/Xo
	gqS7N9qMKbibjLD4UKs5/pw8oAL+AUm6KTadtU4ioJnTKeWKaNAmpvSepvUm5HKp2cEmSgUmFyUZo
	vJAPbt7Jd1HeICqA2hhNycCwHbmbSe0yjiD6OSLlIYF8+qGxuZU/hhLdcfNPWqXyb843z8ivQWQHW
	tvtUq+7p8CQFIfLswo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5yka-003Wms-2Z;
	Thu, 23 Nov 2023 01:43:28 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ykW-003Wkg-1U;
	Thu, 23 Nov 2023 01:43:26 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 8AF5B3200A7A;
	Wed, 22 Nov 2023 20:43:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 22 Nov 2023 20:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1700703795; x=1700790195; bh=kpJ7rIIPVcAc8EF2r6PrWszTIVA9ySDoeaX
	MPqEdzug=; b=ZzsC+3OGyidfsO/VHJkNN2FTEhdzOA9eTqIDB55G4UkiL9Y74KI
	jYGrIWY+DaaOKg+Hb94tFvrmbOGNoIhsCmf2aNPNsKjhCCghs0Le6aOU9vy8x0Cs
	xURZU2iJ0Hs/kMcSmxBFFID/fValyshTyAjuUgZ/+8yEZNM9YGAZIqWEp8AFuYdT
	jXWfA+aOlfHWKcBJ2jDJHIVOP0tDi36FQ7IGyjrdlnpFnrtTNMCVUS7HpFz2Pd6C
	AeXVs1Jm2ibVM+mQF8i+2qxvFxtpQavFzJYVOWTPzVV1t92KqFAonlXuanT1pR+4
	RKrKwPCGEywEoiuMivfx2Z0SIAedTUCENVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700703795; x=1700790195; bh=kpJ7rIIPVcAc8EF2r6PrWszTIVA9ySDoeaX
	MPqEdzug=; b=n27HfOH34aTHyuth9K0vSvjJvmr7LwpZprEIzwi8YpeW/dolen3
	Tjr8kYJBHFPqScz2957PE0LpnfJ8b7RRAJYRvdybfJySYNPKeIFU76+Ur3HFgmiS
	lTqpC2PQbDCqyXZblc0fFuUAXGRtUjZYTc5K/2QpbUsYIDX5NkRA/3FC9FdHNhx6
	JPvtt8rnotVq02S6TrREBXzqWsJ0hdtvbhbDVd0geGej2RaxOlWREbWwpTBgJGoy
	vl8EC2Ucn0KcFMgl7gC0PuGubh0zZLp5A9ClH0QwGeWsc3ZI8fcJGfz6xfXhXKXZ
	P2NyFYtZ1hJqJ+gwOwSoaxTGut8Dd20Xkcg==
X-ME-Sender: <xms:Ma5eZbT5sqpOezfB-uelhbDpjIB6SGtLymUucWDfwsWiVPV9uds8Bg>
    <xme:Ma5eZcwlcgzXMpbYtxqX7cqQ4NtfsQcjiCgCEGIBpI58UJcdlqy7SlaOiCdNlAhjc
    FlMaiYdALJpATIuCQ>
X-ME-Received: <xmr:Ma5eZQ24_5HHAnFfyhIcMvNQ6abLB_r1uHARSsKWW1W0uKNK6CsaEfi5xRHpMOaQI8M3bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehvddgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeetieekgeeilefgtdfgteejhfevtdfgieekvdffjedvvedvveei
    veelfeeuhffhfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Ma5eZbB3HCApg14CsXql6FtcVxvPq552AmHZnE3oSv0q4EzKKK5N2g>
    <xmx:Ma5eZUjaKnI94jUJ2nBk5kDhe6xauQNOSArZYkUuU29r86h2fz3yrA>
    <xmx:Ma5eZfo8okfbgTchIox45vxrk7QaYGmpWqvNvqVJic11ufcLsYmNjA>
    <xmx:M65eZcTrGSuzkog0fb29drsK42958bQvo__qx-RQVreNtW2SPbLs4Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Nov 2023 20:43:11 -0500 (EST)
Message-ID: <a0a95390-ac9e-4d82-9727-d4880e5e48ae@sholland.org>
Date: Wed, 22 Nov 2023 19:43:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/10] perf: RISC-V: Move T-Head PMU to CPU feature
 alternative framework
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Yu-Chien Peter Lin <peterlin@andestech.com>
Cc: mark.rutland@arm.com, heiko@sntech.de, atishp@atishpatra.org,
 conor.dooley@microchip.com, guoren@kernel.org, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, anup@brainfault.org,
 dminus@andestech.com, dylan@andestech.com, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, prabhakar.mahadev-lad.rj@bp.renesas.com,
 locus84@andestech.com, tim609@andestech.com, paul.walmsley@sifive.com,
 linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20231019140119.3659651-1-peterlin@andestech.com>
 <20231019-predator-quartet-e56f43d5aa8d@spud> <ZTJAYqk_DnrR9-Sc@APC323>
 <20231020-snippet-diffusive-1a6052d52aae@spud> <ZTTmtVnZrioRWpJx@APC323>
 <20231023-impulse-quickness-4c7076e6eb58@spud>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20231023-impulse-quickness-4c7076e6eb58@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_174324_545853_FE1D159F 
X-CRM114-Status: GOOD (  21.67  )
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

On 10/23/23 03:26, Conor Dooley wrote:
> On Sun, Oct 22, 2023 at 05:09:09PM +0800, Yu-Chien Peter Lin wrote:
>> On Fri, Oct 20, 2023 at 10:05:20AM +0100, Conor Dooley wrote:
>>> On Fri, Oct 20, 2023 at 04:54:58PM +0800, Yu-Chien Peter Lin wrote:
>>>> On Thu, Oct 19, 2023 at 05:13:00PM +0100, Conor Dooley wrote:
>>>>> On Thu, Oct 19, 2023 at 10:01:19PM +0800, Yu Chien Peter Lin wrote:
>>>>>
>>>>> $subject: perf: RISC-V: Move T-Head PMU to CPU feature alternative framework
>>>>>
>>>>> IMO, this should be "RISC-V, perf:" or just "RISC-V" as the changes
>>>>> being made to the arch code are far more meaningful than those
>>>>> elsewhere.
>>>>
>>>> OK will update the subject to "RISC-V:"
>>>>
>>>>>> The custom PMU extension was developed to support perf event sampling
>>>>>> prior to the ratification of Sscofpmf. Instead of utilizing the standard
>>>>>> bits and CSR of Sscofpmf, a set of custom CSRs is added. So we may
>>>>>> consider it as a CPU feature rather than an erratum.
>>>>>>
>>>>>> T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
>>>>>> for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
>>>>>> for proper functioning as of this commit.
>>>>>
>>>>> And in doing so, you regress break perf for existing DTs :(
>>>>> You didn't add the property to existing DTS in-kernel either, so if this
>>>>> series was applied, perf would just entirely stop working, no?
>>>>
>>>> Only `perf record/top` stop working I think.
>>>>
>>>> There are too many users out there, and don't have the boards to
>>>> test, so leave those DTS unchanged, it would be great if T-Head
>>>> community could help to check/update their DTS.
>>>
>>> So, there are too many users to add xtheadpmu to the devicetrees, but
>>> not too many users to make changes that will cause a regression?
>>> I'm not following the logic here, sorry.
>>
>> humm, I'll try. I assume that the sun20i-d1s.dtsi is all I need
>> to update for T-Head PMU.
> 
> I think you can actually add it to all users of T-Head CPUs currently in
> mainline since all those cpus report the 0 mimpid and 0 marchid that is
> being used as the detection method in the current code.
> 
> That said, changing the in-kernel devicetrees doesn't solve the
> regression problem. Not every dts lives in the linux codebase, for
> example, and just because they don't, doesn't mean we can just not
> care about them!
> 
> As a result, I don't think that we can just do a conversion here from
> one method to another like this, since it's likely to break things for
> people. Certainly interested in hearing from those that support the
> T-Head IP based SoCs about whether they'd be okay with something like
> this.

PMU support is not required to boot, and it didn't really work correctly anyway
until OpenSBI commit c9a296d0edc9 ("platform: generic: allwinner: fix OF process
for T-HEAD c9xx pmu"), which is still not in any released OpenSBI version.

So I am fine with requiring a devicetree update for continued PMU support.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
