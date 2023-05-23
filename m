Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33B8C7EE26
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 06:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIWWoWj7ziNgF2mM76wdSa64q1gkuKUVI3urPNWxuGc=; b=kDqO5PPPnTlwv/
	Ry4xH3KQZ4ldAyh6q9rvQNRuiTU/6OeygW80xrNoAZvQyEPukCHKaSIxW+m7/PoXv93BxpF09y5yx
	Rrg4AYQgZGe9IDr/+1ZSlqWuAWwYdWWVw0gmxq6450jaymgaoSdaSrQQ0zmn+8Ol0J6BtCxqOKMNx
	pOeC94PceqLDN+o/+eQE6y/PF7SusLC8MzE0fn9pwCzoOHDG+UM7ks2XniReQbc0oIdxRVl6WTmMs
	s5Y8jxfkdRraR3diVSFchBCFdNpyRl5ShHaBIMVsRriGXaVbVeDPGVv6wper0Aufjjy4D8F0TqG8D
	ykKbrT4rbj1B6vc7lFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Lbl-0095Oi-1y;
	Tue, 23 May 2023 06:34:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1KRK-008wiU-0h;
	Tue, 23 May 2023 05:20:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2062962462;
	Tue, 23 May 2023 05:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C835FC433D2;
	Tue, 23 May 2023 05:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684819202;
	bh=VCOHu+r91RekSvZ+lEnUHnm2c/u+To8APapSLwT3z0M=;
	h=Date:From:To:List-Id:CC:Subject:In-Reply-To:References:From;
	b=VibwJcx2lwId8O7YxhtlikOxayiGhjyjJTUq7YuV4ydjTCh3JlTDLA2SjBieq4t/6
	 IeL0E8NeFfZpixEAOnbldfdOK7LSZuEFayJlKTBDXcFBR3ZEZwfWLl4cIFVHnbMQZl
	 zJAGkZirV9K65cN1FBwQw2VIRaaLQDmiNpzAG+EYoDMJj4aq3DjjRwC0Y90epyApuP
	 bg9ks0fYg3N9Vfb/z1Wq5I5aOmf+Ld1QUqbBDfwQgfDm6BmyNhoUToHxATNqPmche4
	 BsBOi+hAOsUvsJldEfAFdDTGtn2zrSSbpYkA/284U8yUwKLgAO6vd1Ok5SaxD0g+7u
	 eFt3YwD5dVEKw==
Date: Tue, 23 May 2023 06:19:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, soc@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Olof Johansson <olof@lixom.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] Documentation/process: add soc maintainer handbook
User-Agent: K-9 Mail for Android
In-Reply-To: <3B8DFBEF-9EA1-4375-998D-944EA18D3E4E@jrtc27.com>
References: <20230515-geometry-olympics-b0556ff8a5f7@spud> <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org> <20230522-concrete-unpeeled-7e4718e61b46@spud> <3B8DFBEF-9EA1-4375-998D-944EA18D3E4E@jrtc27.com>
Message-ID: <C9862C5C-083E-43B1-8556-4FE1A61F81B3@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_222006_336769_9583E274 
X-CRM114-Status: GOOD (  15.96  )
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



On 23 May 2023 01:32:49 IST, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>On 22 May 2023, at 22:34, Conor Dooley <conor@kernel.org> wrote:
>> 
>> On Tue, May 16, 2023 at 10:31:19AM +0200, Krzysztof Kozlowski wrote:
>>> On 15/05/2023 21:20, Conor Dooley wrote:
>> 
>>>> +devicetree ABI stability
>>>> +~~~~~~~~~~~~~~~~~~~~~~~~
>>>> +
>>>> +Perhaps one of the most important things to highlight is that dt-bindings
>>>> +document the ABI between the devicetree and the kernel.  Once dt-bindings have
>>>> +been merged (and appear in a release of the kernel) they are set in stone, and
>>>> +any changes made must be compatible with existing devicetrees.  This means that,
>>>> +when changing properties, a "new" kernel must still be able to handle an old
>>>> +devicetree.  For many systems the devicetree is provided by firmware, and
>>>> +upgrading to a newer kernel cannot cause regressions.  Ideally, the inverse is
>>>> +also true, and a new devicetree will also be compatible with an old kernel,
>>>> +although this is often not possible.
>>> 
>>> I would prefer to skip it and instead: enhance
>>> Documentation/devicetree/bindings/ABI.rst and then reference it here.
>>> 
>>>> +
>>>> +If changes are being made to a devicetree that are incompatible with old
>>>> +kernels, the devicetree patch should not be applied until the driver is, or an
>>>> +appropriate time later.  Most importantly, any incompatible changes should be
>>>> +clearly pointed out in the patch description and pull request, along with the
>>>> +expected impact on existing users.
>> 
>> I'm not really sure that I like this truncated section so much, but here
>> it is... I kept the last paragraph intact as it does not talk about the
>> ABI, but rather exceptions of submaintainers.
>> 
>> devicetree ABI stability
>> ~~~~~~~~~~~~~~~~~~~~~~~~
>> 
>> Perhaps one of the most important things to highlight is that dt-bindings
>> document the ABI between the devicetree and the kernel. Please see
>> :ref:`devicetree-abi` for devicetree ABI rules.
>> 
>> If changes are being made to a devicetree that are incompatible with old
>> kernels, the devicetree patch should not be applied until the driver is, or an
>> appropriate time later.  Most importantly, any incompatible changes should be
>> clearly pointed out in the patch description and pull request, along with the
>> expected impact on existing users.
>
>Do you have an opinion on acknowledging the existence of other OSes here?

I think that is fair.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
