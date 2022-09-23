Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DF4C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 19:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqgcTDR58yNk5kl4TlYw33FIL0Hd/UGvE5cL+ibWb9Q=; b=G2sLGGYNMd5cQV
	iBaYiBeZvmonyUWQA/FaVH78sZUK2xJIBtrz0Q5wDAjDrBkMXq38PbLQgzU0h6ujGUBXr588Ab1+D
	MLbXvq1jtTzHJTHRry5lloeMq2YIW2N6N1UDjsPTAYeCBAwKsXfPdkNNF5PmcivfpLBNfzbv5mC/2
	7iuVQ6iqsvtd0v9XsniJZ7YUbRSMpkzh3RUg/pVnPxkr2LZiF2s0coDcIiwAZ5u5wNrytPZOjv2k1
	n8j9545uxxQN0jxpDuklL6q8aOhYShz9u+hdjetgE01s2K656DRlJMOTdppszWjTYDc9ApidoSpbH
	xukuwpGeLBPhcN9Em5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oboGJ-005WTQ-1V; Fri, 23 Sep 2022 19:22:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oboGF-005WSr-HA
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 19:22:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC9DCB812AA;
	Fri, 23 Sep 2022 19:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90C1C433D6;
	Fri, 23 Sep 2022 19:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663960970;
	bh=dxJUMPg4v5+cExG8Fen/qWFcmtXkI6YSzHcJbYu1c9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nt2TkJaBJjKeGMA9QavXMfC5IgsKAGHJFaDIGGVoCah1nlmO0yxsYapds3TAh+GJ9
	 LeiKEMqOgXGn5oqzsIXh9WdyWJImsxOXx/BqcF3d26EbDwvF5dEdPZvPXv1Mz/rZlk
	 aYoLDrhGY0bOWK5+m2+N2es7CdyX6uYTByJvcGX5uX5bWEJjusiyrHJRP4LZfqkRPg
	 hncJPTyft4d9gSE0W0VPNArBeE+ktFXN0c9dIDGXxaLzRrWC9a7GENWNhXhA4MbOLP
	 0NhkSNY4eCJv2hFZoiiuMUp9cqPQ2lsGp7UddjnfkxJ/3bmWBExr7v+V7/laZWACvA
	 +vn/v0GmZVqTw==
Message-ID: <95dd9b44-1c2e-0d0f-ee45-0b7eb340ed82@kernel.org>
Date: Fri, 23 Sep 2022 20:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 07/27] riscv: replace SOC_STARFIVE with ARCH_STARFIVE
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 damien.lemoal@opensource.wdc.com, geert@linux-mk68.org, kernel@esmil.dk,
 arnd@arndb.de, Conor Dooley <conor.dooley@microchip.com>
References: <20220923185605.1900083-1-conor@kernel.org>
 <13823003.RDIVbhacDa@phil> <Yy4FsiNKypEpXwiU@spud> <2349144.bB369e8A3T@phil>
From: Conor Dooley <conor@kernel.org>
In-Reply-To: <2349144.bB369e8A3T@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_122255_732930_CABA9BAC 
X-CRM114-Status: GOOD (  17.04  )
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

On 23/09/2022 20:20, Heiko Stuebner wrote:
> Am Freitag, 23. September 2022, 21:14:58 CEST schrieb Conor Dooley:
>> On Fri, Sep 23, 2022 at 09:09:03PM +0200, Heiko Stuebner wrote:
>>> Hi Conor,
>>>
>>> Am Freitag, 23. September 2022, 20:55:46 CEST schrieb Conor Dooley:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> As discussed at LPC, the SOC_ symbols are being converted to ARCH_
>>>> for the sake of consistency between "incumbent" vendors and those who
>>>> have a legacy from other archs.
>>>>
>>>> Convert SOC_STARFIVE to ARCH_STARFIVE across arch/riscv
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>  arch/riscv/Kconfig.socs               | 2 +-
>>>>  arch/riscv/boot/dts/starfive/Makefile | 2 +-
>>>>  arch/riscv/configs/defconfig          | 2 +-
>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>>> index c4c7add1516f..910697baf097 100644
>>>> --- a/arch/riscv/Kconfig.socs
>>>> +++ b/arch/riscv/Kconfig.socs
>>>> @@ -17,7 +17,7 @@ config SOC_SIFIVE
>>>>  	help
>>>>  	  This enables support for SiFive SoC platform hardware.
>>>>  
>>>> -config SOC_STARFIVE
>>>> +config ARCH_STARFIVE
>>>
>>> doesn't this create a bisection issue?
>>
>> Yeah, I thought of that midway through and then promptly forgot about
>> it... I'll sort it out for v1.
> 
> It's of course the same for sifive and probably more.
> 
> ARCH_MICROCHIP was pre-existing in your series, so that transistion
> goes way smoother - though I haven't been able to find where that
> symbol actually got added :-) .
> 
> I.e. in Palmers next branchs the symbol is still SOC_MICROCHIP_POLARFIRE

Ah for god's sake, I gave the wrong hash to format-patch lol.

I didn't check carefully to be honest as I wasn't too concerned about
the content and more about how I would break the series up!

I am glad I said RFC...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
