Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E9C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/L2FEVrmBslqL+Kp0oEYqhy69/Y5X34Ts1HRLNQCn0=; b=bLbfMHsj/wB0sl
	xfp14LRID5Fe2wKBJgYLGhm5tuiZCteVdny9WZ/LxkWWhGwLwf+gyZi8qahFw/undO35gwdBHSDvQ
	dsyuTg5wre7nqqxBrzH36ibLVPBBVCFcD5sLC+ZBxJlL0BqTKB4hmlElru+nLdYSsmB3ZwGLWdZzq
	iimt6h6ULh/5x3rurdvRy0xcrAcdQpRDxt8pT15ZfgHp7/5Vpbgd+T+C0LgfXG//pewFd3VDwDe3v
	0ehi4upCqdCQ36fx+2qiq47c4M1O+TAin3utVtOeatEx/ZOkiL2izd3//1Pag5RRwyOCDEK9XECy9
	m8MqI2NuFqTBValGXYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZUl-000000045ny-1p8N;
	Mon, 10 Jun 2024 07:31:11 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZUe-000000045nC-45F8
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 07:31:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60C7120008;
	Mon, 10 Jun 2024 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718004659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=peXQDKPKM2SH0GrsNM/5NIgqruWO0h7j87RkGy1k6rM=;
	b=l3RiJSBznUh0cOintGPPJhaYBUBbFovJSVKd0nC42cxVTLliFUFdCdaI4NN5g+I0ohvZ4L
	MnxTZmSxCxMKNtZyQs89GeDikE5+ZMwD1AUmAGCQT01+vZbw2jp7XAvelDgthvvVsF2A6i
	U/z5G9jYFBeHhkcOaSmOP73VIn5ZoCYLlQ7WcRttpnOTAUIm1b+TlfmpukwKqB1CUP4ryP
	HxmTDXgxuMcW6XcxTruFYj/zvkKwdsdIb85gfp5vRRIg46XY0TzlUvcYGWUrC7PCpVMKuD
	1Og4xUkxg5iHkkRY6pujlE3Shqd/BYclxN/W6giBDm4NHVk3OPENXpMbRt6cgg==
Message-ID: <addbe5b3-04bc-4f02-be44-bdfe3aeba319@bootlin.com>
Date: Mon, 10 Jun 2024 09:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH 5/5] riscv: dts: sophgo: Add LicheeRV Nano board device
 tree
To: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Chen Wang <unicorn_wang@outlook.com>, Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
 <20240527-sg2002-v1-5-1b6cb38ce8f4@bootlin.com>
 <IA1PR20MB49535CBF66DB31C2059C291ABBF02@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <IA1PR20MB49535CBF66DB31C2059C291ABBF02@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_003105_341771_D058226D 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thank you for your answer :)

On 5/28/24 12:25 AM, Inochi Amaoto wrote:

>> +
>> +	aliases {
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
> 
> It is also better to add all already support nodes, such as gpio,
> other uart port.

I'm importing, cv18xx.dtsi through sg2002.dtsi, so GPIOs are already 
configured and activated by default.
For the other peripherals, all of them are, with the default pinctrl, 
set to function that haven't any driver yet (ADC, MIPI, PWM...).

Based on what I just said, I'm not sure to understand what you mean, can 
you be more specific about the changes you want?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
