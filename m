Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBBACA1009
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdLuvLqfpebwQFZS66zZxmMyOjJAtSVwBzG3Rz9wRoo=; b=nUBpngU6oVhS2l
	NqB3fG1Wvyayg0vrTkBZv9IlfF9ALT7GqJkUNdmQCNDAz1f77Mxn5Fazg2yvjZabS8faRFXhdf4eF
	XSxZ2GJEYHI9lzRdDoYkb61Q8p9Gen8nuWRVpJEbw92lnXS2pijAd7WHhbAKEPVfaY7arDs+8oXtb
	jgH4s+8mHtECm9odh3FRV9cQaEP7dUrKsAJheYWo2xC37VX3Cy45FfwAPkEtfSyMUvEIBZU02DGZt
	snknT4fp756LaV3SvzWmKmkg+HFfLNDbd54jHhvmlTF8rGEhYM0i6oN0eeodBWowzGSZIQr/82VcU
	q7CU/CM1StZqX4mCiszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYnD-00000002C8D-1g2Y;
	Tue, 02 Sep 2025 21:43:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTAk-00000000kM4-2CnW
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 15:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E70B060219;
	Tue,  2 Sep 2025 15:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33632C4CEED;
	Tue,  2 Sep 2025 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756827829;
	bh=BXcZPplxJ9zfzW6WJTMNMoL9j1icVZ97rqwgknQ8weo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XonpivA6tNUoMCDQnvJnnLsqVLB2GNqTL0ow8E35yoIBQIVLpMWd1/FtQAfRzEPgo
	 FK/6wtO7+w/d5cSb1AK45aCQ+d4QF5lzzl5L09K/4patmlXWGdDLINjHdexyOUkDov
	 se+HAwIfM9xcvHW71ClV3Dmo2SONTD+CFE0rZMkXqhPBQ25xjiz3yYRSufMvn5C0jL
	 Hp3YybPMqQHpH143bjN01lNHubj+doruwD23Q7i1UQMoaXMMmD/jY3TMChIOpXAjOI
	 TuQyFNjcorYnnAIONtjSe9gvlX/n/rLRCpz+jpFoGfwpsfDDyK/v1Tr8PAeIA9HF1M
	 v5glpjobLTSaQ==
Message-ID: <8d538aca-a90f-4710-b697-0d7de65bfc4f@kernel.org>
Date: Tue, 2 Sep 2025 17:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
To: Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <ziyao@disroot.org>
References: <20250901042320.22865-1-ziyao@disroot.org>
 <20250901042320.22865-2-ziyao@disroot.org>
 <20250902-peach-jackal-of-judgment-8aee13@kuoka> <aLazFzq2l7s66IqS@pie>
 <75cafd7e-02a5-41d1-9daf-24bef20dab82@kernel.org>
 <705de60088f72c1ed575d92e8c4f4b90989385c5.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <705de60088f72c1ed575d92e8c4f4b90989385c5.camel@pengutronix.de>
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 02/09/2025 15:57, Philipp Zabel wrote:
> On Di, 2025-09-02 at 15:44 +0200, Krzysztof Kozlowski wrote:
>> On 02/09/2025 11:04, Yao Zi wrote:
>>> On Tue, Sep 02, 2025 at 10:27:53AM +0200, Krzysztof Kozlowski wrote:
>>>> On Mon, Sep 01, 2025 at 04:23:17AM +0000, Yao Zi wrote:
>>>>> +/* VO Subsystem */
>>>>>  #define TH1520_RESET_ID_GPU		0
>>>>>  #define TH1520_RESET_ID_GPU_CLKGEN	1
>>>>> -#define TH1520_RESET_ID_NPU		2
>>>>> -#define TH1520_RESET_ID_WDT0		3
>>>>> -#define TH1520_RESET_ID_WDT1		4
>>>>
>>>> This is ABI break and deserves explanation and its own patchset.
>>>
>>> The registers in control of TH1520_RESET_ID_{NPU,WDT0,WDT1} don't belong
>>> to the VO reset controller (documented as "thead,th1520-reset"), and
>>> thus cannot be implemented by it. They're in fact AP subsystem resets,
>>> which gets supported in Linux with this series.
>>>
>>> Is it okay for you to separate a patch to delete these wrong IDs and add
>>> them back for the AP reset controller latter? Anyway, I should have
>>> provided more information about these three resets. Thanks for catching
>>> this.
>>
>> So feels like separate patch dropping these resets with above explanation.
> 
> They happen to be reintroduced with exactly the same values, just for
> the AP subsystem reset controller:

Yes, I noticed, but that's different reset controller, so previous ABI
for that controller stops working. Anyway my comment still stays.
Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
