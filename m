Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3129E95A6C
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 12:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cok+9dF/edUEGD8AKedRsh1rEXQiPFzbC4uVt92QVc=; b=xO8sM1YfhpjBqk
	rJLB/SuxztkZxI+a3TnoQeCsSQ5HBnfyKdLOv9J3uOrAciIMyeg6Wm2qATnlCKlggrt7X164b6DW5
	6svor9Hdm4G33w5s4EzH/V7B9gLpa6XlctJQTvv/Q6m54x129hgyW/ynR0Xe/GytdSTERntjIvZ0m
	KUCSV99pfWQ6HF81Th+il85P43nWU+HHTJW460aKC5tpltRJhmfeStGgD3TzwuqEkmdojN2kBq3sy
	E19tk9LWmzu+jO7Is9c3sroiLt1gWW/woG83AcRsX25e0u7tEBuotqTGfBlQeqcqvcCw+4W9yylqg
	sIRswUBVELW7f0P5B8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYuW-00000004o1Z-0JjW;
	Tue, 30 Dec 2025 12:33:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYuV-00000004o1O-2MBA
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 12:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9253E60018;
	Tue, 30 Dec 2025 12:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2646C4CEFB;
	Tue, 30 Dec 2025 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767097990;
	bh=7SyWJ6TfKHldAp3wvnbKABxB1tOmnBRHMTO1kry0O0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8UEsfR6aB26uL+qakfmjqQWOWai7AqqIou56DMm0UmyQhYxwbcf9k+GdqbiQ9eU6
	 5Sd/G16D3L/aMZVh3wbnUdf685Gq3uJAPFbLbbsrz6ydq+ftiXGlH45scafH6QDvk/
	 WTcCU+lUqmpdgwARdFKVJiBoaG0b0hyksPundst3s7zUMnxfgb9WITCU+vbqQf9xtM
	 67v3FSOY5/90V7WMiYAuvXCS6RqtnOdmszFmfyxpSBzZvwEUmSHYQiD6lkA57LXkQM
	 x6QW1WsqwxnszWJ0PVS8ggApvUM273IGMoM79LO+DHrWW5v1RYJ0SJlcimprb38EWc
	 nBQwlfyQujKQQ==
Date: Tue, 30 Dec 2025 13:33:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: spacemit: add compatible name for
 K3 SoC
Message-ID: <20251230-mature-fanatic-angelfish-5d6ede@quoll>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-1-269e76785abb@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229-02-k3-gpio-v1-1-269e76785abb@gentoo.org>
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

On Mon, Dec 29, 2025 at 08:46:38PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC's GPIO controller.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
