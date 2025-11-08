Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71705CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pGZ/x7sRCgo8+7wG5vAhlXjkKdp6kYiLXPLgu7gnsE=; b=0cX1X4iZVoc5z6
	QSxgVnWXDg4xuapvlup1EwdkHPXPAxAdRXiphJL8NK5WyEl0n5UoY8WbAAoMy8LAOfSBi6KLq6jvj
	FO9BeIY7DXtPw+Zj/zYLAOQo45VdikLoElCmo7nREEcmi+mn/ahy9l4lmPaTJcXuPBKigNSp/byEb
	+k/4OiWmamIjHtVe+DWQJezMUifADg1aON5Wrn3alv6hDGIKH0wAOC9q7iVWKzcFrYOEj9I7eHAzf
	qxepPPVhVIYE55pUB1UBg/aJ6UEyHhQ2Syb9/cgPh/XwpQ4hm1t7VwpCCauMZbseAQSdpKmAdZ3am
	fK2w+NzUXWHAl2HjDC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHlrm-00000003HWG-2G0C;
	Sat, 08 Nov 2025 16:32:42 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHlrh-00000003HVM-3z0J;
	Sat, 08 Nov 2025 16:32:41 +0000
Received: from smtpclient.apple (unknown [180.172.111.150])
	by APP-01 (Coremail) with SMTP id qwCowAAnvs2PcA9pK68BAA--.352S2;
	Sun, 09 Nov 2025 00:32:16 +0800 (CST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH 1/3] riscv: soc: re-organized allwinner menu
From: Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <20251108-hurler-clammy-0df5e778c04c@spud>
Date: Sun, 9 Nov 2025 00:32:01 +0800
Cc: Han Gao <gaohan@iscas.ac.cn>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org,
 conor+dt@kernel.org,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Yixun Lan <dlan@gentoo.org>,
 Drew Fustini <fustini@kernel.org>,
 geert+renesas@glider.be,
 Guodong Xu <guodong@riscstar.com>,
 Haylen Chu <heylenay@4d2.org>,
 Joel Stanley <joel@jms.id.au>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>
Message-Id: <90B0751B-CEF0-4E73-B3B2-F20D5D055AC3@iscas.ac.cn>
References: <cover.1762588494.git.gaohan@iscas.ac.cn>
 <d17a3a01e2b1297538c419b51953f9613426ba42.1762588494.git.gaohan@iscas.ac.cn>
 <e98a1e59-f3ff-4e9f-a180-79aea9943236@kernel.org>
 <43109A90-8447-4006-8E29-2D2C0866758F@iscas.ac.cn>
 <287444fa-120c-42b4-9919-2f05ab1a2ab7@kernel.org>
 <8ae5d81d-4869-4c39-9561-cb0f87da70fd@kernel.org>
 <20251108-hurler-clammy-0df5e778c04c@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-CM-TRANSID: qwCowAAnvs2PcA9pK68BAA--.352S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFW5GFy3uw1xXr1xXF1UWrg_yoW5KF1fpr
	4xCFsIka15ZryfKanrKr1UuFW5tw1kJr15Wr1DJ3y8Z34qvr4UXr1qqr4xWFyqqr1UWw42
	vryDuF1293y5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRRD7VDUUUU
X-Originating-IP: [180.172.111.150]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBg0ADGkPW4-QngAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_083238_359590_3D171DDC 
X-CRM114-Status: GOOD (  17.25  )
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



> On Nov 9, 2025, at 00:23, Conor Dooley <conor@kernel.org> wrote:
> 
> On Sat, Nov 08, 2025 at 03:48:18PM +0100, Krzysztof Kozlowski wrote:
>> On 08/11/2025 15:47, Krzysztof Kozlowski wrote:
>>> On 08/11/2025 14:59, revy wrote:
>>>> 
>>>> 
>>>> 
>>>>> -----Original Messages-----
>>>>> From: "Krzysztof Kozlowski" <krzk@kernel.org>
>>>>> Sent Time: 2025-11-08 19:29:07 (Saturday)
>>>>> To: gaohan@iscas.ac.cn, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Yixun Lan" <dlan@gentoo.org>, "Drew Fustini" <fustini@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Guodong Xu" <guodong@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>, "Joel Stanley" <joel@jms.id.au>
>>>>> Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Han Gao" <rabenda.cn@gmail.com>
>>>>> Subject: Re: [PATCH 1/3] riscv: soc: re-organized allwinner menu
>>>>> 
>>>>> On 08/11/2025 09:20, gaohan@iscas.ac.cn wrote:
>>>>>> From: Han Gao <gaohan@iscas.ac.cn>
>>>>>> 
>>>>>> Allwinner currently offers d1(s)/v821/v861/v881 on RISC-V,
>>>>>> using different IPs.
>>>>>> 
>>>>>> d1(s): Xuantie C906
>>>>>> v821: Andes A27 + XuanTie E907
>>>>>> v861/v881: XuanTie C907
>>>>>> 
>>>>>> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>>>>>> ---
>>>>>> arch/riscv/Kconfig.socs | 22 +++++++++++++++++-----
>>>>>> 1 file changed, 17 insertions(+), 5 deletions(-)
>>>>>> 
>>>>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>>>>> index 848e7149e443..7cba5d6ec4c3 100644
>>>>>> --- a/arch/riscv/Kconfig.socs
>>>>>> +++ b/arch/riscv/Kconfig.socs
>>>>>> @@ -54,14 +54,26 @@ config SOC_STARFIVE
>>>>>> help
>>>>>>   This enables support for StarFive SoC platform hardware.
>>>>>> 
>>>>>> -config ARCH_SUNXI
>>>>>> - bool "Allwinner sun20i SoCs"
>>>>>> +menuconfig ARCH_SUNXI
>>>>>> + bool "Allwinner RISC-V SoCs"
>>>>>> +
>>>>>> +if ARCH_SUNXI
>>>>>> +
>>>>>> +config ARCH_SUNXI_XUANTIE
>>>>> 
>>>>> 
>>>>> You should not get multiple ARCHs. ARCH is only one. There is also not
>>>>> much rationale in commit msg for that.
>>>> 
>>>> The main goal is to avoid choosing multiple IP addresses for erreta. 
>>>> If using Andes IPs, I don't want to choose XuanTIe (T-Head) ERRETA.
>>> 
>>> Not explained in commit msg but anyway not a good argument. It is some
>>> sort of micro optimization and you completely miss the point we target
>>> multiarch kernels.
>> 
>> Heh, and I actually did not forbid or discourage choosing erratas per
>> your soc. I said you only get one top level ARCH. Look at all arm64
>> platforms. How many ARCHs are there per one vendor?
> 
> 
> Yeah, it only allows you to enable the errata, it doesn't force any of
> them to "y". Some will get enabled by default when ARCH_SUNXI is
> enabled, but if someone is only targeting on device they can just turn
> them off... I'm pretty inclined to just NAK this unless there's some
> actual value.


I understand. I'm going to abandon this patch and plan to resubmit a patch 
that only modifies the description from sun20i to allwinnner.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
