Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC878C624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+LWSMbqH+oHRvCUxGi4+FW0nT0jglyvIQfWOpEdGU0=; b=HQJWKMoD+xsY89
	O5gRKBeC5+n95kDBiXXHNlQKc4ZvIpnInOZfu1ISPbi/qTH84yPZXr30MGUOjIyulC+uyDGYWWJII
	NZxtcFMYaYsZMWIqV3P9NdJnBhrXV/4sheHZ0hHNtdake0L1A5rOBxwPV8eTjF5tqfdMoP4kja+Sd
	R8Qqod4aOgaytWEBWH3eMQ202344t5mlOraV6vnvkbKkbVTzZXsWRtdigShvTvRGNoailXzEkDU/T
	inVybZQCnHfOxnwz0ThAGiR63uy0YZaNQv2wpHaR16yHsLa504fsTKIuVDwpQ69X0QvnNxiCXoyvz
	NQtdBLV1nkz/F+/E4GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x273e-0000000HMw0-1161;
	Thu, 03 Sep 2026 13:00:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x273c-0000000HMve-2bpf
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 13:00:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1C2C4013E;
	Thu,  3 Sep 2026 13:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BC11F000E9;
	Thu,  3 Sep 2026 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788440443;
	bh=iegNva3kkOGJqjCoKK1iRqK5iFz7ZD4YDy8u6AOCQVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JuaBmTRR2rTrs+dzlAeqYCZZFwDrmCKGd3uT8IPDU4YSqKWK3PnBdTDk20//uAy14
	 VhPiw1hy90EnkF/yrhvEX7blaDtM3iCXX1+a9rm4cqngxZCvjrdIUo8N781ht6zl+n
	 ZGoDZzuJJYpfO52npPPSmT0MeXUx02U5Q0coe1Wf3yoobyrmJ5UjDj6FcyKudyS2Jj
	 X0T8F3vy4cqCKhKe6SXb8Ug76wWClmniPyilsvJylEG194A+/lA3V9k/cDkCjZB0+G
	 2R/m1C6D5+LwDKC5MglHBL2ieJISBwnsUKXQX1y0uJFG+uUeYP6EymykyJ8k++0rUo
	 0vWPUZHVHHUZQ==
Date: Thu, 3 Sep 2026 15:00:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Long Wan <long.wan@linux.spacemit.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mmc: spacemit,sdhci: Add tx delay
 property
Message-ID: <20260903-tactful-scorpion-from-nibiru-a4ebe2@quoll>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-2-4e7909cf4233@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-2-4e7909cf4233@kernel.org>
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

On Wed, Sep 02, 2026 at 07:03:13AM +0000, Yixun Lan wrote:
> From: Long Wan <long.wan@linux.spacemit.com>
> 
> Introduce a vendor specific property to configure the step count of TX
> delay line which should be applied before RX tuning, compensating for
> board level trace differences. The TX delay line result comes from test
> out of real board which vary from different hardware layout.
> 
> Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> index f35bf7ce08dd..3399a2d076dc 100644
> --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> @@ -63,6 +63,16 @@ properties:
>    pinctrl-1:
>      description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
>  
> +  spacemit,tx-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255

default: 0, I guess?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
