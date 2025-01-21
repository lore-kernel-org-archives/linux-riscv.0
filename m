Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAA8C02185
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xYregDv3VcIf/F+ZJVxHuxJNgbJ5KEqyGUn8RaSXb4=; b=kYOWsqDf8v6WIH
	xqvEArJB4HcDaXxPxg4z+apYpm7KD9r0a69Gigmjwaxpx98Ne/8Zu8na1oWvxKm3nKLyWD/zvm8nj
	inAPphroZC6FEh6DAvpTPxRV/GTEnvBTUsRKUTUrTRRQ13idMTCflx6NcxrriC334v+4w7hur1z5I
	T0+LnFuVvFZmRmJevBr1QTZbDzKdY6woD4kEtKc8ZRgilUaO3RfqvGj6LSkjde65tIiqPb83ibtIv
	db/RJCC7Jdjgma9dEUxouEZAcpi4Ez3//OX0tx00yH+1nZOfcqoWBQTma1M4B/fFJ0dBmcid4/MgO
	dgUAWRY2kXBpkiLKZx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taArh-00000007SM9-2URE;
	Tue, 21 Jan 2025 09:48:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAqn-00000007SEy-1OIa
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 09:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9EAFA413E1;
	Tue, 21 Jan 2025 09:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFCAC4CEDF;
	Tue, 21 Jan 2025 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737452832;
	bh=gOL40yEr1/NPatRuvUJBWXcIzOUAyp06nqREo6aK9zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFw3hIUxRpB0pMNWW0ecfvl/6pcMDQLWAHAlTacL7xDYfmxnfuC2GgHgmQtGA7lA/
	 HJOeo177MwbuT8NRlE5PllCCq85/rUPQFQig62PxdRqJrgvkTAVu2CssMFUkaT1oNX
	 5hyF7ug7CtXd3SZWU/NKZN4QfJkaErG6w1aIqu/zSnzKIRUpfzpgu4KQrrI/bFNWbZ
	 NTC/bMqfhPAhj4hkrtbE7q+PknOLGSPlUWMPT9Ju3401Mnl1SRtydWjtFuBcCKS3dR
	 M9Y8x32vW601rin/e5SpoULr1kgQU+1jVQPYtgOpe0keb4APlUOx8lmu94YtAq67/0
	 ocYLgz1JQbhzw==
Date: Tue, 21 Jan 2025 10:47:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org, 
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [RFC v3 01/18] dt-bindings: clock: Add VO subsystem clock
 controller support
Message-ID: <20250121-raptor-of-terrific-perfection-cafc27@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172120eucas1p23993cdbbe65e82054b9cb92fb704103b@eucas1p2.samsung.com>
 <20250120172111.3492708-2-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-2-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_014713_435053_7B6EC266 
X-CRM114-Status: UNSURE (   9.15  )
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

On Mon, Jan 20, 2025 at 06:20:54PM +0100, Michal Wilczynski wrote:
>  properties:
>    compatible:
> -    const: thead,th1520-clk-ap
> +    enum:
> +      - thead,th1520-clk-ap
> +      - thead,th1520-clk-vo
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
>      items:
> -      - description: main oscillator (24MHz)
> +      - description: main oscillator (24MHz) or CLK_VIDEO_PLL

thead,th1520-clk-ap gets also VIDEO_PLL? Aren't both serving the same
purpose from these devices point of view? Bindings are telling what this
device is expecting.

>  
>    "#clock-cells":
>      const: 1
> @@ -51,3 +54,10 @@ examples:
>          clocks = <&osc>;
>          #clock-cells = <1>;
>      };
> +
> +    clock-controller@ff010000 {
> +        compatible = "thead,th1520-clk-vo";

Difference in one property does not justify new example. If there is
goign to be resend, just drop.


> +        reg = <0xff010000 0x1000>;
> +        clocks = <&clk CLK_VIDEO_PLL>;
> +        #clock-cells = <1>;

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
