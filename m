Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA3CCF9C6F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHvskqnES3Kvt83GHHBVR50ZjCRQfghkOSpENQOV7IE=; b=OqMK70ZpieNUAx
	MFaykfGMcOoOYdWLlCYe02nHSe+if3A+1L+gObdHc+cUTUo3qZknmEOey7L529TyWZ5RcETbHhXIA
	KPVg+MPeCzdb0+Kadc5rRATItCw0XGjPXGgNhfg44RcOyUJW54olcCMG/GoNwRIw4Z6KEMX+0Ca4o
	rlLJ6iyDLhM+55RrXw2mjo48ppDhO9jH6uXUimZ00Mny+t8kFme3kAJUjK6yNZaQJRoqFnwGA7WiN
	ulog5OGJ5OqVsaby7S9oTvb1FzeZrZuA6GL6CB4/a0pVwYk0JgrMd00F4yWAinQ3XkAIiQuySKJy6
	Sj354VxsNKSBQL0rWEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfoc-0000000GtdB-3XzT;
	Mon, 23 Sep 2024 09:57:10 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfoZ-0000000GtbM-3W1p
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 09:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=KSpGKT8tqlqF3uvKBUIVDjvirodZerxMHtuK5v8dth0=;
	b=TUjORmG8AilmAXRxk2sMBokBtdklYj8nnZuKcyl6igsregyr/n84hnYY0c24FJ
	b/r6Tw0kgpIfvNpKGUOETv7K1W/mDjG4+6hPCvUI1CQCZe2siIgHNaEPsNoZeDXd
	26LpIVH55UwoOJuxDmHEWoKyT+AsoA4zh7GCQrFNIc4gs=
Received: from [192.168.31.242] (unknown [27.18.197.191])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wAHDX1PO_Fm3gDcCw--.9132S2;
	Mon, 23 Sep 2024 17:56:34 +0800 (CST)
Message-ID: <c8e3f856-d2ca-4e54-af28-50b6bb2bc05a@163.com>
Date: Mon, 23 Sep 2024 17:56:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064706.318793-2-18771902331@163.com>
 <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
 <33e64928-0939-434a-9e6c-5f1af57992b2@163.com>
 <20240923-gyration-enzyme-16cd3fc6d091@spud>
Content-Language: en-US
From: Ze Huang <18771902331@163.com>
In-Reply-To: <20240923-gyration-enzyme-16cd3fc6d091@spud>
X-CM-TRANSID: _____wAHDX1PO_Fm3gDcCw--.9132S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW7CrW3CF1DKw4kAw4DXFb_yoW8Ww1kpw
	4agFs8Crn7JrsIyF1aqFyqgr1avan2yr40gw13KryUJr1aqry3GwnYqr48WryDWF4xZ3y0
	9r4Fq34I9r1YyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRrb15UUUUU=
X-Originating-IP: [27.18.197.191]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNwhjombxMMbYZQAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_025708_348332_FD65F2B2 
X-CRM114-Status: GOOD (  10.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/23/24 5:50 PM, Conor Dooley wrote:
> On Wed, Sep 18, 2024 at 04:39:29PM +0800, Ze Huang wrote:
>> On 9/16/24 11:52 PM, Krzysztof Kozlowski wrote:
>>> On 16/09/2024 08:47, Ze Huang wrote:
>>>> Add pinctrl device, containing default config for uart, pwm, iis, iic and
>>>> mmc.
>>>>
>>>> Signed-off-by: Ze Huang <18771902331@163.com>
>>>> ---
>>>>    arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 316 +++++++++++++++++++
>>>>    arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
>>>>    arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
>>>>    3 files changed, 336 insertions(+)
>>>>    create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>>>>    create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
>>>>
>>>> diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>>>> new file mode 100644
>>>> index 000000000000..0737f50d2868
>>>> --- /dev/null
>>>> +++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>>>> @@ -0,0 +1,316 @@
>>>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>>>> +/*
>>>> + * Copyright (C) 2024 Ze Huang <18771902331@163.com>
>>>> + */
>>>> +#include "k230-pinctrl.h"
>>>> +
>>>> +/ {
>>>> +	soc {
>>>> +		pinctrl: pinctrl@91105000 {
>>> That's odd style - defining SoC nodes outside of SoC DTSI. Are you sure
>>> that's preferred coding style in RISC-V or Canaan?
>> Pinctrl-related nodes were separated the for ease of maintenance, but the
>> convention in Canaan is to place them in the board-level DTS file. Would it
>> be better to stay consistent with their approach?
> Yeah, please put them in the board-level file.

OK

>
> Thanks,
> Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
