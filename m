Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F7BCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oI5s86ZjK6dr+Kn5Zzez0VTfG72hesVC7Tpko7oapAs=; b=gKsvXq3B/ohozT
	fz4j4SqmXvr3jzvEPHgEvybrursm++UySZJsEXVijIbQE1jvWSfUkA/vsQJnMluD4VEAyWHU+MoEt
	xKwT7ikuIzQfVD9IGGAg4qpJPWZNwpMQGa8TKgSAdwPjS8S51jqBcU932yROIbmTpwVjmIDLBSQfn
	Vvo2RkFx0gN1/rV/zAL7rnvrCfy+rTHnb+6yc3NbEkpcYtNEQ9I3L77Cl+ijPcAtrawQQgWW91RSK
	JH2FJntCEY28LocDXu37dqcBYnwt/j9yJLXW0hNnBSa7QzdqfTrJ3F04ifkQb06+2sfkvJR8WucMn
	HTkzpWDA11s7iLikzzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBD7-000000023nl-3tmD;
	Tue, 09 Apr 2024 13:08:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBD5-000000023mY-1EXe
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 13:08:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C144FF805;
	Tue,  9 Apr 2024 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712668099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9T6euOk4oLnKn7XOOhHOx32RHO0aEaguxxQgz1xRenE=;
	b=VBEC4XXLO+3SmdyGg1bRw00Sp2OP7hy7cflEZJpH9aRSZhvOWaVhNI9sCcJNL7JaVdc/um
	XXna65X+8UEA9BZ4VkMqJu9GGtSKm4pOkqogrWAhbxijF724FoKBRcVj/syhEVn26ayRVx
	o9muJeY5CNuqpR1yW7pL5LJZ4JnEHpFk2a3FYq6fi8yD2Bat0DnEsKdVuqTpffiX+vKFRd
	F9X6jwQuj4fWxwndWrh2adDmsNNL4U9a7ReMAZT3x5v23DRAMT3CAPhUHgS09OGiIN2tuE
	Af2UPIDPP2esXejHoZwNKajbPBvEUSTQQoOfi6HIgKHVNjI68tPSiSvY7tBq6A==
Message-ID: <1514d28a-5e96-4531-a972-894e41902efa@bootlin.com>
Date: Tue, 9 Apr 2024 15:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board device
 tree
To: Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240409-prevent-deepness-2d22bf009b16@spud>
 <IA1PR20MB49534E00CAE29D24F7D7E718BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <IA1PR20MB49534E00CAE29D24F7D7E718BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_060823_499632_E6CE7265 
X-CRM114-Status: GOOD (  12.78  )
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

Hi Inochi

On 4/9/24 at 14:27, Inochi Amaoto wrote:
> On Tue, Apr 09, 2024 at 01:13:32PM +0100, Conor Dooley wrote:
>> On Tue, Apr 09, 2024 at 03:17:35PM +0800, Inochi Amaoto wrote:
>>> On Tue, Apr 09, 2024 at 08:45:04AM +0200, michael.opdenacker@bootlin.com wrote:
>>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>>
>>>> This adds initial support for the Milk-V Duo S board
>>>> (https://milkv.io/duo-s), enabling the serial port and
>>>> read-only SD card support, allowing to boot Linux to the
>>>> command line.
>>>>
>>> Hi Michael,
>>>
>>> I think your patch losts the board binding and have wrong compatiable.
>>> Also, the SD can have rw support with proper property. See link [1]
>>> (need 'disable-wp').
>> [1] doesn't go anywhere useful.
>>
> This is my fault, I copied the wrong url. The right patch is
> https://lore.kernel.org/r/20240217144826.3944-1-jszhang@kernel.org.


No problem, I found out.
I confirm that using the "disable-wp;" property does the trick to make 
the MMC writable.

However, it wasn't mentioned in the above URL...

By the way, do I really need those under &sdhci0?

+ bus-width = <4>; + no-1-8-v; + no-mmc; + no-sdio;

My board looks happy so far without them ;-)
Thanks again for your help
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
