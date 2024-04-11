Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE88CD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCjCIjjD3ST3yeUAemGZlY1fnvT7JmxOuZJZlKepXBM=; b=4Qfp6FgIuiZGJZ
	QXjfMm+mqvcG0+3xbcjYseonxRrzFPfGVbNBIrTJBnPHgd7uqA9PTFE2FJ5v39k7Frp72lqVGsIxK
	yUdn/r83KqkuX2l3glNaROgvVgx/wbtGXR2ZDToSliOKs3ooSv5eZUjh085HIH5iZ8dEbKOqxALF1
	5QpwaOlfKVZ1VP+M58kLvnQJPgzuih1b84Rwf35nJHD7JzVucZbwNf/4fdRuG1elZUd2wmlKMJsJ1
	md85jo61d3sSg+BtFXjid5treLACqQsI3VtuR1PwAgi7aFKwpRAl4BPb7u+jk1AgDiINd9PMqEDMb
	zeeEPZ0jnKcRvJnwaP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruouY-0000000Aqe1-14e1;
	Thu, 11 Apr 2024 07:31:54 +0000
Received: from wfhigh5-smtp.messagingengine.com ([64.147.123.156])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruouV-0000000AqdH-1YQ2;
	Thu, 11 Apr 2024 07:31:52 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 81E2218000CB;
	Thu, 11 Apr 2024 03:31:48 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 11 Apr 2024 03:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1712820708; x=1712907108; bh=ss9obh18Sk
	iQHEXzh7qcLFdvdlxpa80B0Z7MJyyJWOs=; b=fAFRq2a4RR5m0uoGjxvbSDZhhg
	XBLt22beIqBHO1PhCVLZIYorAfbGnpIs6i0KjnrNMag6CtHF8mAtIX4+g4JkM/y4
	oNakw3qvrAtMITJTRe3dP5XCRbSlUNRMtgb+FJogTSdTceTcdRzappHrax+eWmGC
	C48KZTiW2+745Tpmz56zPJgFu5sXmnDOXQgOHhBxECqtppJaW42Os3TNEDRkpPfI
	7xKy28dP14Q+rdv1IglqoN1MM2Wo71oJ88dpxu76wssTF5yL3dssA5ZNSuq2aEsa
	sQ7EBo/MLbjI9e+DTEeltLlDImftLLOUzlWPomQgt5r5GI+C7bz29lbepBoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712820708; x=1712907108; bh=ss9obh18SkiQHEXzh7qcLFdvdlxp
	a80B0Z7MJyyJWOs=; b=DzSFGGOr+zqR4sfSmeOxAZvA6tvMP0LGFanC2+BgYdJy
	+4hbOwbt0daWkKElaJ7hw1qTgNt7659JrHfKx7+c2NRv2nXqcVlsOuvhc37YXOZ6
	/5MKG6iTFCQ6aufnWu+0iv1mQHtdHJ4K9QX9ZNac5sLfv829dYcU7OrtBhvzAPeJ
	qvI5fpyEZjo1rJqt0In+B4EMVZTz3BIN6xIPeqBy76lVWIdHpPj7mI1hWq7dyIWT
	CnWqJQpCHMCE2NVdUfy2AgXYjJNlhFvPsLF/BoiRix4BR68kBN/e6viA7DoExAkP
	1lsK1ob4cyEjdsraiMT0hwoBXzOe78DNkW/8wTm9dg==
X-ME-Sender: <xms:45EXZr7T_OnGStrr7SKzpEUpju9NZAoJ-lpF9Idxf_AAZawFa25PqQ>
    <xme:45EXZg74AAZ239bjRLX7EeRcHaT8wGi_jFHosNYQYKIaCYvcpDRxLFrBw8T1Wh8fR
    jo4RGsgbbTYIfp5aDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehjedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:45EXZieKjjVog6Wf67CQD8NJtTers1M6KFeWe75e-UlBkt2QP7uJXg>
    <xmx:45EXZsJIp1DUMatuZM3plg1HZpaO63G81PNWgtOVl7mQ4q3U6QDMgA>
    <xmx:45EXZvIKtC1NGjybHKKb-88n2S8h7w1gUs0XzOcd8JC5HH3wCWVBpA>
    <xmx:45EXZlyxfKvoW4q6bfCKoSeKRYfJBEypsh0ZQzt4uZT200LeFEQ3Rw>
    <xmx:45EXZuaOX9x1nVPc-UnZtz-zaIuHLseO3kmjE2oKiQEaEOt4QcV-JewM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5E761B60092; Thu, 11 Apr 2024 03:31:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <c0e170f7-5498-40ed-ba35-2ac392c2dd2a@app.fastmail.com>
In-Reply-To: <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <87wmp4oo3y.fsf@linaro.org> <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
 <87wmp4ogoe.fsf@linaro.org> <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
 <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
Date: Thu, 11 Apr 2024 09:31:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ard Biesheuvel" <ardb@kernel.org>,
 "Samuel Holland" <samuel.holland@sifive.com>
Cc: "Thiago Jung Bauermann" <thiago.bauermann@linaro.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 "Christoph Hellwig" <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, "Alex Deucher" <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_003151_670264_9B9F3875 
X-CRM114-Status: GOOD (  20.17  )
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

On Thu, Apr 11, 2024, at 09:15, Ard Biesheuvel wrote:
> On Thu, 11 Apr 2024 at 03:11, Samuel Holland <samuel.holland@sifive.com> wrote:
>> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
>> > Samuel Holland <samuel.holland@sifive.com> writes:
>>
>> >> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
>> >> 32-bit arm until we can provide these runtime library functions.
>> >
>> > Does this mean that patch 2 in this series:
>> >
>> > [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>> >
>> > will be dropped?
>>
>> No, because later patches in the series (3, 6) depend on the definition of
>> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
>> find a GPL-2 compatible implementation of the runtime library functions.
>>
>
> Is there really a point to doing that? Do 32-bit ARM systems even have
> enough address space to the map the BARs of the AMD GPUs that need
> this support?
>
> Given that this was not enabled before, I don't think the upshot of
> this series should be that we enable support for something on 32-bit
> ARM that may cause headaches down the road without any benefit.
>
> So I'd prefer a fixup patch that opts ARM out of this over adding
> support code for 64-bit conversions.

I have not found any dts file for a 32-bit platform with support
for a 64-bit prefetchable BAR, and there are very few that even
have a pcie slot (as opposed on on-board devices) you could
plug a card into.

That said, I also don't think we should encourage the use of
floating-point code in random device drivers. There is really
no excuse for the amdgpu driver to use floating point math
here, and we should get AMD to fix their driver instead.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
