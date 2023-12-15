Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D136EC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWQlmLF6avoNEOSvboA6Aco4Q18jArbnkTqjWDjU8uE=; b=Yyz/4EfBaAwhMv
	tnbyQtWVxa0bDK7QE97MpWh7nUykEwupiVcoxYC2WRlXHXPYMgLD6hyREwxyjBIj1gJIlhzY2IjtO
	yj+f4l3KUXp7GXYuzgI0Vv0BK+dJODkgQnmlyXEvOFV2VmT0evJInM6lTqBsTggvu9fSzaxjU5XC5
	WZ/lkOASI3xdOqvrf+5fDcCzP/z1lxK04AxHrHomq6rdrhQA8j/MiKGo8o1CcG/oKJueSTWHYZgDu
	lqF4SRzb/iNXzdh2lQqsFb4bCcU+Gc9uged1rGwZbj2YCilJ2qRGPWiwlhtsY7jEIceIlk7jPpSM/
	CdOf6u408WC9J+Zueyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEhC-004T7B-0K;
	Fri, 15 Dec 2023 20:22:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEh9-004T4o-1k
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 20:22:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 779FBCE0C4A;
	Fri, 15 Dec 2023 20:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D101C433C7;
	Fri, 15 Dec 2023 20:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702671720;
	bh=pI2fxOT71cP2ivmIh+q5o/w/kpsi6teiRLOD72it0Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJrzU5KoTIW+HShSQYwbkxJPwTWEvjgAHRTYA0oMlaJyRQt9GRF0xRTWx0YfE/w/H
	 QXQOEKIpIPQ02dYda7aFikVE3IViwfZ1Hlgv//o4pvuSgKqYokmm/H8uXa/GzblW8N
	 EHs8qQE/yw78eqw0PhFXmOzSfqnlhhonF8AlCA9/tKzOKPtzAScY1OlnI0b2qn9+WA
	 uMWFf/RIA6qJn1WH+rGi64XeiTt+cGjXLvK1SrQDS+zFcxotPDDZoXLxR7wmkNwpZK
	 UVUYsiXuODjoaQDKaciEW4/Zh1vWwzCdtKKZBZ/Li3lxDkkrQrGwvA2IoQdXScl8gM
	 o2l83j0l4CEYg==
Received: (nullmailer pid 328701 invoked by uid 1000);
	Fri, 15 Dec 2023 20:21:58 -0000
Date: Fri, 15 Dec 2023 14:21:58 -0600
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Fu Wei <wefu@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 4/8] dt-bindings: gpio: dwapb: allow gpio-ranges
Message-ID: <170267171586.328597.4361294916580351710.robh@kernel.org>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-5-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215143906.3651122-5-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_122203_813337_D64D117A 
X-CRM114-Status: GOOD (  10.48  )
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


On Fri, 15 Dec 2023 15:39:02 +0100, Emil Renner Berthing wrote:
> Allow the generic gpio-ranges property so GPIOs can be mapped to their
> corresponding pin. This way control of GPIO on pins that are already used
> by other peripherals can be denied and basic pinconf can be done on pin
> controllers that support it.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
