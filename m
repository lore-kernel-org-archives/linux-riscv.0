Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726FBC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 03:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mn2GyRM4MsaI2glThwo0XwbXKm/Cc94DgW4Y4EV+Ne8=; b=tV8z+iNx2W/HMJ
	CatCok1N92AzXEKoAy4i5PbYNENsVHywbE3UI7YCbqBqnD7uIghQj115EysQeSYGLSXgs+TEpGoeT
	Z/V6xhM+7R3TYZ6h+K9Sss66hGtpwZOgKU7V0b/CWB4HD0m/zU+ddT1LBrJ1hqFd/mJQ/oqVz+Vpo
	ujEa7pVmrH6jMHBXnGdQe/2JtS8QbooxPvYH177wg9GS1FmqP3Gi4bCtGM6z1P8B0nC+QxwB5WE42
	Mw43KwVhMXWT/O3y+rtxC8XbOwqsZyq6JQMvVmqVjsJ2UD0V5efOPS7fK7acp9mEMBvghmhWCIjj4
	eVYUmiG7uS88Hy3YM7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzqv3-00Exbg-2Q;
	Fri, 19 May 2023 03:36:41 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzqv1-00ExbE-0E
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 03:36:40 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 6AF39320093A;
	Thu, 18 May 2023 23:36:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 18 May 2023 23:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1684467397; x=1684553797; bh=diU1oZ3wF+1gcYWcuOQa1MF4aBn8RcnRjwd
	RnfN9NLI=; b=PcgdDiU25qGVCNKlDw3lx6EEI704++3C4s7rTxt29UIcctD5kXu
	jkT5jfKwKQAPXlqGgNbbPIjg+uozJwpfp93sod2rvuIbPYT1gZjvnJ+6dpQl0e8f
	7HtZ9e+coitfEXz27c8VWK7w81tUGkdCxiTYwvzc2/OFeoLWoT3pf2tTAhngD/xq
	YPThqbUYQGvEcYgL9GmRZSeXb4a/tixVwFU9P8O9X1AUUlKqh0o0RkR5PT+VCT4C
	FN7evi0S0ytQ6M7bzqPjoR3TULf/48+RO3k4m9olUS+Hhxz9wxIndaeRu0KnlhsB
	onl9Rmw1oIt07OmXToX+C1UdOqsYByZVVjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684467397; x=1684553797; bh=diU1oZ3wF+1gcYWcuOQa1MF4aBn8RcnRjwd
	RnfN9NLI=; b=BsCIbs3RnaBCP93urIOn5VhksdBzszTdcY2uhpmL6cDK+g1bY9C
	aPf07j3Swjds90Dk4m/N2luVy3OZkqSkbWsJKRgsay5VD4pyG23Wk4iT2TS8qq5I
	H3kKglNKmfRbXrEn+Ee1MvwM89dKrNoePrFentQtJal6H/BayroWfjkdsji4pDE4
	jfnvvoLEuGio4nNZXI0CLoJX4SPtV9BYykAvhqkE7ECjE+0s/XvGowl1wpw13Ry+
	zKaAQxn0wbQazqm7Xt67hB4PsPs8z1nlfwiieFbaWtmX/M7k/wakM5aDyedIE5q1
	bcr3H8XbYK0DrTXlc9A+CgWC/UaYytKSqww==
X-ME-Sender: <xms:xO5mZHiBQIWg6IR8Q5E86qmqRUFLujHm6iIEPACmMRk8qhWOxdhhPQ>
    <xme:xO5mZEAMX2MHn_MqiBmcJE8xBGMZ2c-9qVuOP3WRFRrZJ4x7ehrDqNVVW_x2WSx3V
    QPEnEdg3XKk13Svkw>
X-ME-Received: <xmr:xO5mZHEP2natGNvefyJlca2SueZnA8LygwImSdgTOvKccLZyjDcVDEnV2TlIvrmOoej6LQ2uH5Ql5M6hPSXvKiO7dmA5nYkyT0GyCnnJwnXSKQ6nM9UHyL9y0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeejgfffhfdujeeftdeuudeguedttefgieetffffheejuefguedv
    heejteeftdfftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:xO5mZESFxwNEqLukoRaw-a01QgYzKvf2lNcav7j61kEnq5nuostvHg>
    <xmx:xO5mZEyaouxYljFYYKajxlhbrXsxPqiDQ6IgKILX7seS_qjEG8ksUg>
    <xmx:xO5mZK6W0n4Wy8t8BKhfKvWn5enrbBJqRN_T5jDorhKhwzlumZlXWw>
    <xmx:xe5mZJKaxnVRK1HdtxpDBz4pZ90i-3_70XEujgeYLEBjSH58GlcOlA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 May 2023 23:36:35 -0400 (EDT)
Message-ID: <fb80487a-9f79-746f-3bfc-4b9eea2ce8eb@sholland.org>
Date: Thu, 18 May 2023 22:36:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-3-jszhang@kernel.org>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 02/10] dt-bindings: interrupt-controller: Add
 bouffalolab bl808 plic
In-Reply-To: <20230518152244.2178-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_203639_147311_E7A289F2 
X-CRM114-Status: GOOD (  10.65  )
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

On 5/18/23 10:22, Jisheng Zhang wrote:
> Add compatible string for bouffalolab bl808 plic.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)

Indeed, this is a T-HEAD C906. So ignoring the question I raised about
the vendor prefix:

Reviewed-by: Samuel Holland <samuel@sholland.org>

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index f75736a061af..3f9439b0c163 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -65,6 +65,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-plic
> +              - bouffalolab,bl808-plic
>            - const: thead,c900-plic
>        - items:
>            - const: sifive,plic-1.0.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
