Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109A6C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 07:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26QKTX5zXbMuAH4uCm/rXB6FqV631k3hwWkER5MZ7FI=; b=nrAt4HcqNPxJZ1
	zmqkeMQ4rq6BYwbVE7Eca87ksXUAnm97m8geA/smi+MPDxx8VVA/Wtv1aiHQUf+WYl55356igQi9q
	iL0acRYgGHD5+WUl42ji8x/+ujNloXrLYmr3b9GDcbFo2EpoYyim5YI/jTksgVnFDp71M6Rrdvs0m
	bx6D7TiNGFogV9hx2UxeZydjIi0iQIXoobYYRCUBRQ/tyaU9sLZpMiT5Mf09F+fJO8yVe/Qn/1wyL
	eVgwrWBfyVaQGxKK5yCgjs77EKazPH1WK6lRvcA7RaPtgb8Khp7UxT7fAjkbMnAbNLYqAATQ/1CzS
	HdIqyOIZTGum9fmDvW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6HE-00000000pYn-2xXO;
	Tue, 09 Apr 2024 07:52:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6HA-00000000pWm-3Zml
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 07:52:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9A091C0007;
	Tue,  9 Apr 2024 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712649132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fv6RYLQFO+Neqn3UJOqdARRddJ1bSBwtGcUX7fOSOmY=;
	b=LDR6LfN0SwuGCykwpiBkJhA675YPhZc5smBYQgzhs2+vOL71choduSOtMKeCZ2zbteNJn0
	dGJwqyul7Z0JOPsG62iRy8pajSj5AEAeMSVy/lf4TLETXNF1+gDsC3OFpHo5nmtmXmRFzk
	aK/qznAU2TBbbDw3G/qIeT9fmNuBkNYfUFo8TPzXqqQq9ROFOWCt23M2DTALqh8KAfENcL
	39BBu5x5ef4Kx9BZzIoskU8FeKrLjpWy7qDStgYb/F9C9n6l7y2MGK3BfMeHJCtaxBVuKG
	yAT8KjC8HZjDZlX+o0rAr5v3PFUrw6zbXrRxMjPPvNY0tIJjA+f1xCEJ8KDrcw==
Message-ID: <7364e62f-b776-42c2-b063-319aa939da29@bootlin.com>
Date: Tue, 9 Apr 2024 09:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board device
 tree
To: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_005217_200489_C9A6E801 
X-CRM114-Status: GOOD (  13.06  )
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

Thanks for the review and tips!

On 4/9/24 at 09:17, Inochi Amaoto wrote:
> On Tue, Apr 09, 2024 at 08:45:04AM +0200, michael.opdenacker@bootlin.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> This adds initial support for the Milk-V Duo S board
>> (https://milkv.io/duo-s), enabling the serial port and
>> read-only SD card support, allowing to boot Linux to the
>> command line.
>>
> Hi Michael,
>
> I think your patch losts the board binding and have wrong compatiable.
> Also, the SD can have rw support with proper property. See link [1]
> (need 'disable-wp').

Right, ""sophgo,sg2000" doesn't exist yet, so it will be indeed cleaner 
to use "sophgo,cv1812h" instead.

>
> I suggest you resubmitting this patch after applying clk patchs.
> This could reduce some unnecessary change. For now, you can just
> use the dts for huashan-pi (with changed memory size).
>
> [1]: https://lore.kernel.org/linux-riscv/IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com/

Good to know. That was next on my list.
I'll submit a V2 in the next days.
Thanks again
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
