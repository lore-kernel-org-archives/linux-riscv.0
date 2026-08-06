Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3641C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTRUAkJsjG8vJGN5C755WOmPX/X2zfztosS1bvOiiWY=; b=frIhccBN5gw54d
	zmR7GUn+vK+Ab23FPeoCv4CI0XBf611Q6Rbm45PrPw2Fasc/9rrTwMBktOAtr4ipjr7TIWdj5YDgt
	GyQVZoQTyQovQJNDMPS2sj6xkQwaP84iAQhS0Wjor3g5a079qdIxRAq7fBDkoxg2oawVOL8C4CxpF
	FQsYu8j7R+elet4ktlNNSlaHbwoJHO3LjCmqRZWwdsG8IVvjT3h1w0AdF6a4HfcJZVhZ97Z05VEjC
	K8YWQtFWGsSt06eb3tR00/3vj/dvrQzw/2inwIHvmcMzym2PiIQgv/ReS6YpSkVlrh9jwcO12oGIH
	Y+Wun7hWOp/KWeSLKffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrt3w-00000005Bdk-42d4;
	Thu, 06 Aug 2026 08:02:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrt3v-00000005BdD-0yjX
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 08:02:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99AC560A9F;
	Thu,  6 Aug 2026 08:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CAD1F000E9;
	Thu,  6 Aug 2026 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786003366;
	bh=idcwp6KHbiBQ5C7uiDAZRyemXBi5Ek9ZsWuxuZ5Hl0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gapas08fqJU5eV6gWBXgoDj7GB5a/rJ5Da2PZkKOWcQ2wsdi1DhHWXna4lhCe/bnq
	 uXEszbe0uLxDd0ppBwe8ErstloA7eReluB96Hw7M/V3afBhVt5538IRlGN3En7vgLC
	 Z2s32EQMMb39DK4iRb50dx3kixFDubznh+nHYiJWf5mTVFe2xM6EyFD0vAW/AwpfED
	 By/8vfqOD5dtqkUTFYy7oeI6J+USyAqtzGhV7SpqyStlyvmi9+8rDk0p/vjPDURYZY
	 i7/mfEfjTbQR4+hwXPtnskSis0Ldxew4IK8A1QJ6m+PL7XqAK4ODnKoblo1yHYZOuZ
	 qMaLJZd4zo+iw==
Date: Thu, 6 Aug 2026 10:02:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Message-ID: <20260806-fair-bright-leopard-afbe1e@quoll>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-3-b86c75d1c552@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-3-b86c75d1c552@linux.dev>
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

On Wed, Aug 05, 2026 at 02:00:53AM -0700, Troy Mitchell wrote:
> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.
> 
> Do not provide a national,lm63 fallback because the CTF2301 is not fully
> compatible with LM63. It uses different conversion-rate encodings,
> extended local-temperature registers, additional fan lookup table
> entries, and device-specific PWM and ALERT/TACH configuration. An older
> LM63 driver would therefore not operate the device correctly.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
