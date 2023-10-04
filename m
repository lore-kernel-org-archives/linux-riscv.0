Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34C8E7C4CE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btQn6XkqrM/d/ICVGec3KaOXGM+uxxqdEn1necJLTnw=; b=OuWYZzNtRJX1pm
	JDQ84VdmtSXHF/Nys3hDNYczAQBcqwvewIdimvOeMujhn7Vv8D8Cc/9/NNHivb83exYqiutRPQGOj
	60uZVR3DtG7/LRWLXJ8VjY7foWDR9s7HJJiYR7wRAGb2Tx4T6R5Z7q/shMD2Jv6F6iEaLoFBLBGSa
	St4OyFtrjgQbYz6pLK/rzo/TqZoX9n2UUdObqEvAmz6t8reJY/ciA4zkbQLzq5LuUMBunwnHgQ9G/
	/ZbE9vp5k3f72PQ8X9H6mAnwd5T3DYpxlLC9zBqtFQCKVpFfCFIm4xUbzcEYhArT6SGzn/qF5f6kc
	S5cyyBNhABfzyJaGwNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3Tn-000ImV-1j;
	Wed, 04 Oct 2023 15:08:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3Ti-000Il7-39
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:08:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D2B861591;
	Wed,  4 Oct 2023 15:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45EBC433C8;
	Wed,  4 Oct 2023 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696432077;
	bh=Y5zy75t86c7p9cSZYuR4myWn71kdv7zk6WSRuY/yi70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ce1gg4PsElaaWDOjFq5MbANyHN9jnSvSgiKmKaHFY07okOGDOdCjtNz/9DIzcajIH
	 tYz7u0j4NoFIncrNUumckrrLKO+Pjn9TqLigAv/u+KpqqYrc19FWWVCtq22GToN+Pb
	 Y4cG8n6yuGik7UO0S2TKpW6kRS0Mn538qhzGuI4PPfizyz1NNNIz2YVxrHblKrELbo
	 wJl/bGuodTO/oR7uTMrMS8hcSi6TKPoiu6WQ6MF0gVpZrAqLTZyBifLsCxxHhErOoz
	 E4YtchTIzlm8kGDRBm+ga2HckD8C77GN8zHCOQMcrIv44N41MM9Z9CmbwxOyCnT8G9
	 WRxu5mvH2O7Wg==
Received: (nullmailer pid 3140478 invoked by uid 1000);
	Wed, 04 Oct 2023 15:07:55 -0000
Date: Wed, 4 Oct 2023 10:07:55 -0500
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Add T-HEAD PWM controller
Message-ID: <169643207539.3140422.9692233405638400871.robh@kernel.org>
References: <20231004092731.1362-1-jszhang@kernel.org>
 <20231004092731.1362-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004092731.1362-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_080759_074624_465F7958 
X-CRM114-Status: UNSURE (   9.82  )
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


On Wed, 04 Oct 2023 17:27:30 +0800, Jisheng Zhang wrote:
> T-HEAD SoCs such as the TH1520 contain a PWM controller used
> to control the LCD backlight, fan and so on.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/pwm/thead,th1520-pwm.yaml        | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
