Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C58DD3B7EA
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 00:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIPHHsvvOR9bpaWSFqZdno22g6n82HCJOHGghJ4EPYM=; b=ztque/VXkeEMOO
	gG3ZE6KRt6L8e1UlN8QNisxSIHkEbdkuxJGHQ94CjXearUC1kddUHoZDUk34uOtjniY9z54S/Aptz
	aQ11+KPaLrclXVHipcxgJjtvt88XnI8J+rJUdPOkLk4vi3yIF2i6Ut3PlC92gwCP2muUUZEs+vqLG
	SExEps67nk5CSgAopGf3VpNALSZYJo7so4Qp4rHJfq81FYn7BabnpNhMwCOWSP4qFH43DR1dwmrlQ
	XR5B8u08PdqS+opndBr01KzGDm9F7cUcvk4VMxxt8SKfqQc+tHAhKPXYXLA5L5GlKP79eLB4OU3Ak
	gm64poBIGyTl7lihF8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlzO-0000000DgNP-17Fb;
	Tue, 09 Dec 2025 00:54:02 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlzL-0000000DgMq-1MNB
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 00:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1765241608;
	bh=JYbGL1yqQk9SuwODfYiIFqUpr7SdpAuoCOkoOtKwzjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n0BGyjBWBVeCMnYmYKWTILMYPfIjeney/xMqe0OhvU8ZLEGLi2p6M+2EtdGA8tzO5
	 8srH96kKXvdBh8rM4UhzNG1NmoB5lkiOa5q8LXR8sgWJehogAPYVmB99PKL5/Q+rCq
	 kKmmqI2k7oyjnkIGS3FAUyLaMXCsnQizHK8FZKJ5zzzunPdFD2KDvpHHqrwPOTHY14
	 Gr35yDSTw5jFu64FHqnHwZ2YTv2kA1aoy51sbAEyoqzD7LqmZ5nuWHtQ3BT89h+7op
	 YxXtNtmyACVEUZnsWxiIPuqz0ThsNfojJ2Py7W0wpy/MqmT8Lp2ppQ4jnAzO1ykRQs
	 tzdSQgNHiNsOw==
Received: from [192.168.2.54] (unknown [98.97.27.25])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7A5E8B2215DE;
	Tue,  9 Dec 2025 01:53:25 +0100 (CET)
Message-ID: <0bb12889-cb28-44e7-b2d6-7ecba6264d1a@freeshell.de>
Date: Mon, 8 Dec 2025 16:53:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: dts: starfive: Append starfive,jh7110
 compatible to VisionFive 2 Lite
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Hal Feng <hal.feng@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251206204540.112614-1-e@freeshell.de>
 <20251208-jogging-morally-9b787b7ab1b8@spud>
 <a18850ad-b6de-4444-9daf-a4a653f4f9ae@canonical.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <a18850ad-b6de-4444-9daf-a4a653f4f9ae@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_165359_861730_6FD39CB7 
X-CRM114-Status: GOOD (  19.22  )
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


On 12/8/25 08:38, Heinrich Schuchardt wrote:
> On 12/8/25 17:29, Conor Dooley wrote:
>> On Sat, Dec 06, 2025 at 12:45:30PM -0800, E Shattow wrote:
>>> Append starfive,jh7110 compatible to VisionFive 2 Lite and VisionFive 2
>>> Lite eMMC in the "least compatible" end of the list. JH7110S on these
>>> boards is the same tape-out as JH7110 however rated for thermal,
>>> voltage,
>>> and frequency characteristics for a maximum of 1.25GHz operation.
>>>
>>> Link to previous discussion suggesting this change:
>>> https://lore.kernel.org/lkml/1f96a267-f5c6-498e-
>>> a2c4-7a47a73ea7e7@canonical.com/
>>>
>>> Fixes: 900b32fd601b ("riscv: dts: starfive: Add VisionFive 2 Lite
>>> board device tree")
>>> Fixes: ae264ae12442 ("riscv: dts: starfive: Add VisionFive 2 Lite
>>> eMMC board device tree")
>>> Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>> Signed-off-by: E Shattow <e@freeshell.de>
>>

>> You can't do this without modifying the binding too, as this doesn't
>> pass dtbs_check.

Will fix, thanks.

>>
>> However, is this actually correct? The frequency of operation and the
>> temperature range aren't a superset of what the jh7110 can do, what is

The unanswered question what I was asking in the code review of StarFive
VisionFive 2 Lite series: What is the normal thing to do for compatible
strings of relabeled silicon when there is a suggestion of different
operational parameters?

The devicetree/usage-model documentation does mention SoC family but is
not specific about any marketing or quality assurance test for silicon
binning. For the K1/M1 SpacemiT chips relabled as Ky manufacture there's
no suggestion that the relabeled chips have different operational
parameters and so a new compatible was rejected then.

The reset condition of 1000MHz @ 0.9V on the family of JH7110/JH7110-S
boards is not present in the dts OPP tables for jh7110 and jh7110s dts.
I've asked previously [1] (in the discussions about bootph-pre-ram
hints) before having knowledge that there was a JH-7110S product
planned, what prevents JH-7110 from having more than 4 divider operating
points and including this default condition? Not having been tested
seems to be the answer. Not all testing results are published or
described in code upstream either. I'm making my guess based on what
information that is available.

1:
https://lore.kernel.org/lkml/40d77aae-9e53-4981-a2aa-dcdc6f11ac83@freeshell.de/

>> the actual advantage of having it? If there's some software that this

Unless I misunderstand the meaning (as above), then this is what is
recommended for in the documentation. Heinrich confirms this avoids the
need for checking the new "starfive,jh7110s" SoC compatible. Maybe I'm
wrong about this approach for binned silicon? Please someone give me a
clue if this was answered already and I missed it.

>> would make a difference for, please mention it in the commit message.
> 
> Appending "starfive,jh7110" would reduce the number of compatible
> strings to check in the OpenSBI platform driver.

I can include the (paraphrased) above summary by Heinrich, yes. Although
now I doubt whether this is the best approach, when removal of
"starfive,jh7110s" compatible is potentially an equally valid fix, or if
we're rather considering JH7110 at 1.5GHz maximum to be a superset of
itself at 1.25GHz maximum (JH-7110S). Would we want to change all the
JH-7110 boards to then have JH-7110S as the least-compatible, if I am
understanding that meaning of "superset"? I would like to know what is
expected.

> 
> Best regards
> 
> Heinrich
> 
>>
>> Cheers,
>> Conor.
>>

Thanks for the review, -E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
