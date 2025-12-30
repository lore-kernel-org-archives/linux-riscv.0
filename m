Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD1E94108
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ortEA5F1TuvrqG2mqQG6CjtTddYG6zDR24R+e5QvvJE=; b=tZGbc+xhZq6Stt
	VKyxh617hn7fcVQSLVzrHJ3sKJHKZRB5OFWh3nVSIJmsycEuRy5wk36XR3/dnPKi/WuBJmgQGAUZG
	2Tz6c3Llk8KgOXT2uiv33D9mULYyNNTkoexmM0+L9oAELNVTaK6gDjzcapYlQ0r5lz1utJeppZ6W/
	g2GS8sSjkUoMCGo7DAR+t0f2tin0tKJozCPc+T8aZVlRP0cRRUTd6wfyxgcoLUEnrEjG9IilOmTRN
	yKkkROo0mNOarxF8vkQv1GlMs+MJBhJIUVHecgT8SSSIWJYCH7k47YvrC6UI4ez4LsdpBqLsuwv9Z
	BA63c9eAGRLsJxLCf8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVg6-00000004cqE-2eTT;
	Tue, 30 Dec 2025 09:06:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVg4-00000004cph-3sLX
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 09:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3525343973;
	Tue, 30 Dec 2025 09:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87218C4CEFB;
	Tue, 30 Dec 2025 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767085564;
	bh=FFmFLOGcRxnFIt2njib8cEC4BnQSt9mMbKuUEJ06tUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjvhdDsN36CSz4iCvXcvukq1VtRHS/IaElFb/7GS7z/03+KoW3rhHNYtDkBxwxCxm
	 1oX90ok3SICrkCtolLsEEP6/hPn89Iq6Bfwon8yG0SP9VMtfltT+3EqlfG4MfffVkJ
	 CuXCONON2VfFKt4i1Dx6pEmggElamNkbxPTs5EurKFeLPAhklTcg/eNo/jkYDSiJj5
	 tx8h1qRTPHJcDskjMtqlqWMuZfa/qu6xVEx3Ko+ycms4mKI3z4ITmG2eLnyBdiohAb
	 aF3dinMskLYyyWwhIWTf+zpCGhrci09MKREdk8DlIRTlVvLluyqUYRiAZ8WLHR86S+
	 vCvvBnSZs6wgQ==
Date: Tue, 30 Dec 2025 10:06:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC support
Message-ID: <20251230-jasper-loon-from-atlantis-c7c2df@quoll>
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
 <20251226-02-k3-pinctrl-v2-1-5172397e6831@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226-02-k3-pinctrl-v2-1-5172397e6831@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_010604_977654_33CDA8FE 
X-CRM114-Status: GOOD (  13.70  )
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

On Fri, Dec 26, 2025 at 08:58:24PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml     | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index d80e88aa07b4..d2cb994e30c1 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pinctrl
> +    enum:
> +      - spacemit,k1-pinctrl
> +      - spacemit,k3-pinctrl
>  
>    reg:
>      items:
> @@ -74,8 +76,12 @@ patternProperties:
>            drive-strength:
>              description: |
>                typical current when output high level.
> -              1.8V output: 11, 21, 32, 42 (mA)
> -              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
> +              For K1 SoC, the settings show as below:
> +                1.8V output: 11, 21, 32, 42 (mA)
> +                3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
> +              For K3 SoC, the settings show as below:
> +                1.8V output: 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33 (mA)
> +                3.3V output: 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 (mA)

This should be a schema rather than free form text. Add oneOf where each
item is description (1.8 V) + enum. This would be first commit for
converting text to schema for K1, which you grow for K3 in this commit.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
