Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C03C3600B
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfFs4f5+3g6E0GyQ2vTKjZZbsOWuRIkEGeRzOaqYhfA=; b=qxScT0VQOI2dR2
	xrONw+Ip9alB4e3sdz1HBMgE4LRDX7j3ak361VBeMy4hF8qGu1gd/LPqDXM8kial7BP0RbzGcn/SR
	YE0LD6gxoQzsyUXBtJiGoOiG1muGBVQ1J61PUgF8QaltoernFW/w40GxthBUk1ruLaaSfKUWlTaJH
	jZMVe6e2zSHg5bDIJsH8CdX+CgiksSgXnJx+a8IA1g9cqXPu/UbTHVYu84MjG1nMpW1UgXyblssXS
	vEmBpTSpkcF+1csJ6lyV5N38SHwM/ekSLuQ4m8OLIVPzJt6Fs93U2tAxbPAUFl/coxco1UqPcz3YO
	lrVu7c1wNlDXFqtGe6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5tP-00000006Huk-0cVf;
	Tue, 25 Mar 2025 15:08:39 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4gq-000000065wB-226M
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 13:51:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6847244254;
	Tue, 25 Mar 2025 13:51:29 +0000 (UTC)
Message-ID: <0788826e-4b96-49ca-94ac-1d5b92f9ee64@ghiti.fr>
Date: Tue, 25 Mar 2025 14:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] dt-bindings: riscv: document vector crypto
 requirements
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
 <20250312-flask-relay-b36ee622b2c8@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250312-flask-relay-b36ee622b2c8@spud>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeehiefhuddtuddukeetkeehhedtffduhfevfeeftdefveffgfeuffejjeejfeekueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurddvhegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_065136_660333_A651D677 
X-CRM114-Status: GOOD (  12.41  )
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

On 12/03/2025 14:11, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The Unpriv spec states:
> | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the
> | composite extensions Zvkn, Zvknc, Zvkng, and Zvksc-- require a Zve64x
> | base, or application ("V") base Vector Extension. All of the other
> | Vector Crypto Extensions can be built on any embedded (Zve*) or
> | application ("V") base Vector Extension.
>
> Enforce the minimum requirement via schema.
>
> Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/vector-crypto.adoc#extensions-overview
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../devicetree/bindings/riscv/extensions.yaml | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 02065664f819..9aeb9d4731ca 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -726,6 +726,39 @@ properties:
>               - contains:
>                   const: zve64f
>   
> +      - if:
> +          contains:
> +            anyOf:
> +              - const: zvbc
> +              - const: zvkn
> +              - const: zvknc
> +              - const: zvkng
> +              - const: zvknhb
> +              - const: zvksc
> +        then:
> +          contains:
> +            anyOf:
> +              - const: v
> +              - const: zve64x
> +
> +      - if:
> +          contains:
> +            anyOf:
> +              - const: zvbb
> +              - const: zvkb
> +              - const: zvkg
> +              - const: zvkned
> +              - const: zvknha
> +              - const: zvksed
> +              - const: zvksh
> +              - const: zvks
> +              - const: zvkt
> +        then:
> +          contains:
> +            anyOf:
> +              - const: v
> +              - const: zve32x
> +
>   allOf:
>     # Zcf extension does not exist on rv64
>     - if:


Ok I see now where you enforce the right dependencies, you can ignore my 
question in patch 2.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
