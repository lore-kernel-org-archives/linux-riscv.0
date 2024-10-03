Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED0BCF8571
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 09:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdTzf/hJsF05I0Bzio1g0JjVQInN6lehxDblDI8UKIY=; b=EgGNvCTu2wFPWj
	JWz/E8d5clQqAXOXd+3XOKlKqBPOtWErWYu/RKXIlYf5155nY4A713awVrh7X7lf7qcsBW9NMYRdt
	aKWFM+V+S9gSx0FlW01ER/WSvb0UR2LbjZqM+iZwxcPwSTyJKlYjP56mcXxcjiGgOPDErvkNrUR/u
	XPOU5J24F7BQ0j2OswRhPea/AT0OfVl7+L7LCq0oLFQQoBu63RNmWQ6Js8q5vJCzCwhBPFnghhW4a
	GTnURFM0Vrvp29Y/E8urzaq57CUFNwbxe9/X3MPc5+4fBq+ODEVzT/Tgi3Wu5kqrEE+ROqGhFQMh3
	T0GaAMIRTNvDZj28CdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swIbw-00000008jZb-0x9q;
	Thu, 03 Oct 2024 09:59:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swIVG-00000008iZr-0ZRQ
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 09:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E67BCA436C9;
	Thu,  3 Oct 2024 09:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B27FC4CEC7;
	Thu,  3 Oct 2024 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727949129;
	bh=Iz1TA1Le/+JlH07KTEOpcQbnyFnWRNy0QhWePMeK3n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pM5qPXgTL8AZUGDjCGhacmGm0Vt4qzgDO8nCyiRH8PxuLsT3QYCW3F7tdGbWXhbJr
	 b6nn0nl1HswMetkOJzkE9WHQu6w23fwYNTi2+Kjj/c/aJ4Ov5nT7J7RPNrjU36mnO9
	 N9Xgy2jVyig7rXhQZVsVZXEDVDWwUUslLGFIdGTjys9vrsJnTcCL2yZG6wbKRDN3Wz
	 LReNAOyFfdBfGF1XomiVa72BW5L6rEf7r8nIaLN7MmW0G0+8qR0FF2d31JdiCd6B4J
	 NRhUopgh1BX8bnejafoQ+RxXM02mMairPb8JO98PPqEmD6PuHlbW3U78EdIsdmmRua
	 Znt17JzXrPqxA==
Date: Thu, 3 Oct 2024 11:52:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v1 4/5] dt-bindings: riscv: add vector sub-extension
 dependencies
Message-ID: <7e5adthgwuqqpwvjbq7cs4gbtl6xv2fkdsf2zmmqvrpgvmbae6@gjsxa37bw6i6>
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-eagle-fresh-4b2e259e45ee@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-eagle-fresh-4b2e259e45ee@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_025210_353981_FD4E59E2 
X-CRM114-Status: UNSURE (   9.86  )
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

On Wed, Oct 02, 2024 at 05:10:57PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Section 33.18.2. Zve*: Vector Extensions for Embedded Processors
> in [1] says:
> | The Zve32f and Zve64x extensions depend on the Zve32x extension. The Zve64f extension depends
> | on the Zve32f and Zve64x extensions. The Zve64d extension depends on the Zve64f extension
> 
> | The Zve32x extension depends on the Zicsr extension. The Zve32f and Zve64f extensions depend
> | upon the F extension
> 
> | The Zve64d extension depends upon the D extension
> 
> Apply these rules to the bindings to help prevent invalid combinations.
> 
> Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-698e64a-2024-09-09 [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
