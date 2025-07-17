Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C62C83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EezNw0ATtX9eQgIuP9O8wyX0WMlzbov+frwWEQR8Vo0=; b=d5bz0LM7uu0h8U
	XngxtQAzrXBt0FARK8UszlR2JboHn6n2tyo8ICOlnu7uMD06yBk+kQmbuHakLfvH7p7imkjEmB3Jr
	32I5Gmn7LpI7/xaK1vCVatTP8YM3ehSvRyYKfaopnkrswjY8c1CTSNmNiYF98gLUekjdufOwtfxRf
	xttsYN2J51yNR4zeZcrSVQloNEAcKMqcK4uy+ob3h7Fw4dSqyngvVkctUTdx0gOQYTJj2m8AbZiW9
	xTVXHn/WVYdbAbhRQ5CAjJ10S3OfS9bOZgiudl3b2vg7O9hmVLj9pi1usAvzr9UOvBe4VzexE2VBl
	ODjCyVTCLwwoCrscfaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIz0-00000009QqC-1a3L;
	Thu, 17 Jul 2025 07:24:46 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIhv-00000009NcA-2DBb
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 07:07:09 +0000
Received: from [192.168.2.54] (unknown [143.105.119.108])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E3DBBB4D0F48;
	Thu, 17 Jul 2025 09:06:59 +0200 (CEST)
Message-ID: <c3d8693e-f7f5-4072-bdce-2bb0778c77c3@freeshell.de>
Date: Thu, 17 Jul 2025 00:06:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-milkv-mars sort properties
To: Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716061940.180231-1-e@freeshell.de>
 <CAJM55Z_77aygReSPJyZMtfZWk_UPYTzYLH5E5uEw6K=GSu0LNQ@mail.gmail.com>
 <20250716-strategy-evasive-57b400af9366@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250716-strategy-evasive-57b400af9366@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_000707_714159_D736E8E5 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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



On 7/16/25 08:28, Conor Dooley wrote:
> On Wed, Jul 16, 2025 at 02:17:34AM -0700, Emil Renner Berthing wrote:
>> E Shattow wrote:
>>> Improve style with node property order sort of common properties before
>>> vendor prefixes
>>>
>>> Signed-off-by: E Shattow <e@freeshell.de>
>>
>> Thanks!
>>
>> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> I'm going to pick this up, but it may be very late for 6.17.

Yes. The other questionable sort style in this dts I was looking at are
whether we want "compatible" before "model" in the root '/' node?  And
then why we have this common pattern of 'pinmux' (or pinctrl*)
prioritized firstly in the natural sort order, also pinctrl-names before
pinctrl-N is a common pattern that seems an arbitrary reversal of
natural sort order?

Thanks,

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
