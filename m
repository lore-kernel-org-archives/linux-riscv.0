Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F8CA0FED
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BW+8ENf22VEC021eX4vliUF91Yjn2Z8oZ0ZxNEM/m4=; b=lwm2FsLtvsMGmx
	5Rz83t8wXpkcSxbydG6BlScd8l4DafvXAhWnLX9a0AJP9tGkLgTiLFGDHQoVrkED5tuD+u+5ml0LL
	0ctWmROuVbCvtMvByJfCfR2J+VICljvZbjXGNtucyhnhFJj/++0+nL2rXdnimVOyj8fnlFzk1KY/z
	5n0vyoy7cosFRVuXpasElOM/E7gELoEAKemrtAJWiXSZqfRxFmpcLQ4qV0UHnwxolvllsN9hNfCZS
	YHj+3QzpSzvpKe84daLFcCrf8uRb7dBynbWmVBCqPv4ddbp3bFHh2nSyHY9DE/tXuBxupSp51oJqt
	cZGzBFthZLMmF7pol0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk1Ej-00000006JSC-1Nhe;
	Fri, 30 Aug 2024 13:00:21 +0000
Received: from 5.mo563.mail-out.ovh.net ([46.105.53.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk1Ee-00000006JQt-20t8
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 13:00:19 +0000
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [152.228.215.222])
	by mo563.mail-out.ovh.net (Postfix) with ESMTPS id 4WwJCW1MQcz1VMq;
	Fri, 30 Aug 2024 13:00:07 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <dfustini@baylibre.com>; Fri, 30 Aug 2024 13:00:06 +0000 (UTC)
Received: from DAG3EX1.emp3.local (unknown [10.108.42.252])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4WwJCV12JBz86Jy;
	Fri, 30 Aug 2024 13:00:06 +0000 (UTC)
Received: from [192.168.0.75] (90.89.163.127) by DAG3EX1.emp3.local
 (172.16.2.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 15:00:04 +0200
Message-ID: <5a463f00-a03d-4cf3-be3c-970ca5611486@tbonnefille.fr>
Date: Fri, 30 Aug 2024 15:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
To: Inochi Amaoto <inochiama@outlook.com>, Chen Wang
	<unicorn_wang@outlook.com>
CC: Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Albert Ou
	<aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Conor
 Dooley <conor+dt@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan
	<dlan@gentoo.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495348B5FFE61FF1D76ECC4DBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Thomas Bonnefille <thomas@tbonnefille.fr>
In-Reply-To: <IA1PR20MB495348B5FFE61FF1D76ECC4DBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Originating-IP: [90.89.163.127]
X-ClientProxiedBy: CAS9.emp3.local (172.16.1.9) To DAG3EX1.emp3.local
 (172.16.2.31)
DKIM-Signature: v=1; a=rsa-sha256; d=tbonnefille.fr;
 s=ovhemp1147286-selector1; c=relaxed/relaxed; t=1725022805;
 h=from:to:subject:date; bh=3xzeZZed1caYdsVmSD9tMT8ztI6dOeLf77ko1WrVFl8=;
 b=K5c+keZu33DnBUPwc7skyaLF+NxHPTt9Cw0S98sXFVVW+SXVc5i0krrWTS/RoStbq6XJ6YfAhp7SBXylKTKY4r8KYFDxWMUiMChLJNb3jrOCqvpfKu8lj3Dnc57hzxZyNA2YQs+jTvx4U1muFytVNfLfJUlyr4eo2K7VoZQbPdqpPi29wk4SdWfeqLjxK77ffU6zepkcGXZeA9BYqezfVhhXcYydFI0i87T/Ra/EwCUZ+S2hrY7Jz71ita5msia3YHXVrtVnJI9TLAU89JINqsWU++in2i6QoOvp4Ph27zQX9cN9+4WolDbtIcbg7bdirjp7Ts/52etGiI9PAFLHbw==
X-Ovh-Tracer-Id: 14003380092947865892
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttddvjeenucfhrhhomhepvfhhohhmrghsuceuohhnnhgvfhhilhhlvgcuoehthhhomhgrshesthgsohhnnhgvfhhilhhlvgdrfhhrqeenucggtffrrghtthgvrhhnpeevvedtledtheeggfffudfggffhteeftdeitddttdejleegjeduieeugeehvdefffenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepuddvjedrtddrtddruddpledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepthhhohhmrghssehtsghonhhnvghfihhllhgvrdhfrhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepughfuhhsthhinhhisegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhi
 drvgguuhdprhgtphhtthhopegulhgrnhesghgvnhhtohhordhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehguhhorhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhsiihhrghngheskhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_060017_677859_7A8C75CD 
X-CRM114-Status: GOOD (  18.25  )
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

On 8/2/24 2:35 AM, Inochi Amaoto wrote:
> Add pinctrl node for CV1812H SoC.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>   arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> index 8fcb400574ed..2dfa450f0d26 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -4,6 +4,7 @@
>    */
>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
>   #include "cv18xx.dtsi"
>   #include "cv181x.dtsi"

Hello Inochi,
I'm trying to apply your patch to the LicheeRV Nano series but I can't 
find the file "cv181x.dtsi", neither in the upstream v6.11-rc5 nor in 
the additional required patch.
It was first mentioned in the v3 of your patch series.
Was it supposed to appear here ?

If so, can you help me figure out where to find it?

Regards,
Thomas

> @@ -14,6 +15,15 @@ memory@80000000 {
>   		device_type = "memory";
>   		reg = <0x80000000 0x10000000>;
>   	};
> +
> +	soc {
> +		pinctrl: pinctrl@3008000 {
> +			compatible = "sophgo,cv1812h-pinctrl";
> +			reg = <0x03001000 0x1000>,
> +			      <0x05027000 0x1000>;
> +			reg-names = "sys", "rtc";
> +		};
> +	};
>   };
>
>   &plic {
> --
> 2.46.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
