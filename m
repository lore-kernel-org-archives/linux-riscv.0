Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23606D3E78D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 04:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8e932TAecmwDzJ8W/Fl4Jm7sLZ3j/m0nXhdSDFmLcM=; b=Oqp/A5mZYmHjjI
	2hnJ0vcYEZaoiiR+opcQsET1fXLp6mbSRY1Lurk+IsQcZok5UY5pgVL2EvqN2u1SGuxKAipeuA2se
	0+HqmWJlWMbRsHgtDS9V4wrT1GEzYPj1/NhaP9KZjf9hau8zUAz+dhNG0R4cvQNIf+Kjl2uLxRg64
	iVN0PuG7l+zP3fkcHptrj/JFZ0KdYkr/iE05oFnoCcvTSmpTPziA14y9LPnTqe/ed+n8or6eT4aga
	FJmDMw7xAIKFnSUR6bVY+EPFxez3ad1r7if6SVCidrKwyJegUGTvDFqMFYiQAAudV3hWXqS+JaeIu
	Ht7wfkR1qVNDmygbuI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTYEG-0000000GCsj-42Sz;
	Thu, 11 Dec 2025 04:24:36 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTYED-0000000GCs4-3z8Y
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 04:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1765427040;
	bh=T5Vf+2g+YWYe547tJSzNV/cF5Tk9glp5AMeYZIdRYEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WHz3iI8QsXUdWqRMSYh+oh6Sv+6TF04T9W9DhNukl54ncN+B2+/pYl9UBmRl+aO88
	 +c1Nm49a8Z95HRpru5yDXJdTQKYYmYEwGv/idQBJISIUMCvZ+KDnDEDZ8Jbp8VTD37
	 hNQwXdf92WsEqhUEMAQUuPfKScHEtxlQT5MLeb3GNyt49OysPuUgijw+az1uv/uHqw
	 P2DCgtULT8Ozs5jBJw+Qi83GWYthFAf2r3OWuPu/lEa3mKkBQ9Q2nzdDC+eeMrQhQ3
	 kkrCbLTtBRlhCldyFKxAoYcywxPR1bN/EPI6Q2xzapozuZTTDwLgi7a5E0vNLOFVN4
	 FLTArFl0uM5Fw==
Received: from [192.168.2.54] (unknown [98.97.63.68])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 39ED2B2203F2;
	Thu, 11 Dec 2025 05:23:57 +0100 (CET)
Message-ID: <4b08ce35-9d2d-4e7b-9ea6-c1dcbc4ad04d@freeshell.de>
Date: Wed, 10 Dec 2025 20:23:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: dts: starfive: Append starfive,jh7110
 compatible to VisionFive 2 Lite
To: Conor Dooley <conor@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
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
 <0bb12889-cb28-44e7-b2d6-7ecba6264d1a@freeshell.de>
 <d8fa12cc-7a03-4954-8ea5-1e2edf9a149d@sifive.com>
 <20251210-pull-pleading-57c880596510@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20251210-pull-pleading-57c880596510@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_202434_471595_85BD0699 
X-CRM114-Status: GOOD (  23.58  )
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


On 12/10/25 08:43, Conor Dooley wrote:
> On Tue, Dec 09, 2025 at 03:18:58PM +0900, Samuel Holland wrote:
>> On 2025-12-09 9:53 AM, E Shattow wrote:
>>> The unanswered question what I was asking in the code review of StarFive 
>>> VisionFive 2 Lite series: What is the normal thing to do for compatible 
>>> strings of relabeled silicon when there is a suggestion of different 
>>> operational parameters?
>> I don't think we are very consistent on this, and some of it depends on how
>> different the binned chips are from each other.
> 
> Largely I think the lack of consistency stems from there being relatively
> few users of these soc-level compatibles, so there's nothing really gained
> from having one in a lot of cases.
> 
>> Example 1: Rockchip RK3399 has several bins. RK3399-S and RK3399-T just override
>> the OPPs, but reuse the SoC compatible string without change. On the other hand
>> RK3399pro is a superset of RK3399, but uses a new compatible string without a
>> fallback.
>>
>> Example 2: Allwinner H616 (https://linux-sunxi.org/H616) has multiple
>> bins/packages/die revisions. H313 is a down-binned version of H616, which reuses
>> the SoC compatible string without change. H700 is a superset of H616 (same die,
>> more pins), but uses a new compatible string without a fallback.
>>
>>> I can include the (paraphrased) above summary by Heinrich, yes. Although
>>> now I doubt whether this is the best approach, when removal of
>>> "starfive,jh7110s" compatible is potentially an equally valid fix, or if
>>> we're rather considering JH7110 at 1.5GHz maximum to be a superset of
>>> itself at 1.25GHz maximum (JH-7110S). Would we want to change all the
>>> JH-7110 boards to then have JH-7110S as the least-compatible, if I am
>>> understanding that meaning of "superset"? I would like to know what is
>>> expected.
>>
>> If starfive,jh7110 is a superset of starfive,jh7110s, yes, it would be valid to
>> add starfive,jh7110s as a fallback compatible string in all of the existing
>> board bindings. But this is not very useful, as existing software already looks
>> for starfive,jh7110, and you can't replace that without breaking compatibility
>> with existing DTs. So the advantage of one compatible string (mostly) covering
>> both SoCs only applies to new software.
> 
> Yeah, adding it to the existing stuff provides no real benefit.

I agree, there's not any benefit to add "starfive,jh7110s" as the
least-compatible to existing stuff.

The reply from Samuel is quite helpful however it's not any clearer to
me what direction to take this.

1. Can we now remove "starfive,jh7110s" compatible and replace with
"starfive,jh7110" or is this not possible because it is already merged?

2. From the StarFive maintainer: "I prefer to keep 'starfive,jh7110s'
compatible, because 'JH7110S' is the chip name in StarFive documents and
the name printed on the chip. It is easier for the users to know which
chip they are using and select the correct device tree."

https://lore.kernel.org/lkml/ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/

So this is the only reason for a new compatible and I'm doing as
Heinrich suggests with a follow-up after that new compatible is merged
to add the actual "starfive,jh7110" compatible to the list.

What then, what is the consensus, is "starfive,jh7110" more or less
compatible than "starfive,jh7110s" for adding to the compatible list of
the VisionFive 2 Lite board(s)?

https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com/

3. Does everyone instead agree that "starfive,jh7110" cannot be added to
StarFive VisionFive 2 Lite compatible list when a new compatible
"starfive,jh7110s" has been merged and I should drop this ?  Seems
pointless to me now to pursue this if there is not any consistency and
what Heinrich suggested is not accepted.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
