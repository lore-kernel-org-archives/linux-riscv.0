Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2B3FD5F87
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksrs/nHE75Q+dd9T/JhdRjOjoOGWKhKmX5cWxCabUa4=; b=nPa4gFlMzQuxVb
	Ej7SnHgAYVRXrPl0QTN/SJpWp9FeU5XvTnoT2eNo1ZD/3NGXTEJacUyJfS7RpvZABx2MjxMStJoq8
	a/1bUET1LUy/HKARKj6uDZvpQvLxOn1yelM/cFEZMcNQsNhegJxpTXEKjWFnq2AzJp8RVYzxT2O42
	h0Fem+JTxwVBTdvW/U96eTH7IUmyIwSC1wj2ljmdM2IgI7F2ZLX4cwHZEbj9pigl1unADXQyWhTuO
	M1hXFLKlSdFZ6joPpVIW/L8TYOTmPBzib98DUCDdhQEt5rW7swxqsSG3k05nky9o/d05HJgWzE4WH
	kFsmeXvG+19uv8ImQ/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMje-00000008N1B-1Bpp;
	Wed, 08 Apr 2026 06:49:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMjd-00000008N0u-2pls
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 06:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA5CF6013D;
	Wed,  8 Apr 2026 06:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06413C19424;
	Wed,  8 Apr 2026 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775630996;
	bh=OJinugmxk3U59o8Evz03tGU+ZiGJ5IC9Tl/JyCwJolQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jefaGRshR9m/AZQS3dwk2dgYtMI7pdtGh7qqqUMcmxKabsrErngqg0ZVO44OaYXzE
	 +QzXMZkBySSPouG04gvWI9a9iu02cWlGTekQeOuY84SgC0OJls3bBqXl5ccxu+lS6C
	 gUMqCH3Ip3a7YKnV2THDOiT3OftuWa5rC/dg4Zn8EyCREDJpmAYEgEVkgtx8FxoCGU
	 F5rZlAikJpGmcH4U2J4M3Z028Dh93XHh9GnbHZ+q9GiXkN8wnhjm7M+ICgM2pi/1J+
	 pFDsNOEf91T0DV2W6iDagsJYMfFZCMsust1EcrKamzaEFqSAFFzOMvhLzVgSUM2Run
	 gOVYtaqJ93Z7w==
Date: Wed, 8 Apr 2026 08:49:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.dev>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Message-ID: <20260408-nocturnal-talented-dinosaur-cbb9c0@quoll>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
 <20260407-orangepi-sd-card-uhs-v6-1-b5b8a1b2bfc8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-1-b5b8a1b2bfc8@gmail.com>
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

On Tue, Apr 07, 2026 at 10:25:21AM +0200, Iker Pedrosa wrote:
> Document pinctrl properties to support voltage-dependent pin
> configuration switching for UHS-I SD card modes.
> 
> Add optional pinctrl-names property with two states:
> - "default": For 3.3V operation with standard drive strength
> - "state_uhs": For 1.8V operation with optimized drive strength
> 
> These pinctrl states allow the SDHCI driver to coordinate voltage
> switching with pin configuration changes, ensuring proper signal
> integrity during UHS-I mode transitions.
> 
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..932fccc609bf8dbaf3ecfe09d9e610852ac7afa0 100644
> --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> @@ -11,6 +11,7 @@ maintainers:
>  
>  allOf:
>    - $ref: mmc-controller.yaml#

Drop

> +  - $ref: sdhci-common.yaml#

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
