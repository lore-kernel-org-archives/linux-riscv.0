Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C3EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 22:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmIjAEeyIY78QyFkJ9hELjho7MQ/KlF9tKhqnXQ/AWM=; b=EXFQ8JK5svA+E3
	AZn7iloKGHD6GzHHGUtAeXJmUGN+bzce62pSME81C88AMPFzAOEyPTtURDqkQxdGkN/U2Odrdtupr
	FoY25UgJf9wONHZFi2sgVp/N2idk0v4eJAAIgmBnH2e7l+rSphveWs0Sa25ZGsPnONst6IZtf/lLK
	/OMSI3bsT+ZDZeQTlDQBW97J9I+/yXfOnSIetfhMi7q99HDO9ZNF6e0tccHBh2FxgtSRRkSrr92W0
	UchmIDvybMoPG2EAJn83Y/FNE5GLp1hRhGM+1KDCOeQzjmuwS7rTko4tKQI9jVOFPIl46TgrDHOlY
	gNrUQeIsRAM+C+QNhmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQEWJ-00CwYE-0t;
	Sun, 30 Jul 2023 22:04:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQEWD-00CwX8-0k;
	Sun, 30 Jul 2023 22:04:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso44245495e9.3;
        Sun, 30 Jul 2023 15:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690754642; x=1691359442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pahPU3wSvsqJHIDLsqPi1ulLhJMWKZSO5rvQ5dMXskQ=;
        b=q0sSR9AXHGYYmyVNDr+xpag+Dw277dZX9Y4ekqdWpmmrFAk+IkylG9pts4k/utI7SB
         zHxzRfyKPebgYRJYkunUtLvj5sS8zxKQl/rhUk5cZJQIXFjNIZ/nNClC0D6BWdCUF1kr
         fzAyd0fX7gdRjXwXHsIBljOjfQ2Pkl9bdDOji8mRYkSKOyEo1mHn2Y/99CtOUV7UOkQe
         KxzfIg/nQMircpIV0T3thGF+3HJlvdO6sZVPjU2MIA6s6Go9vK32qNngksFxfQBf571Z
         60mN9fdB21OXpFV8KY3m4hJg5j4fWeOvu585h2Cu3kZsVc1XjPt+g2fNfR9rszK7il5D
         lU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690754642; x=1691359442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pahPU3wSvsqJHIDLsqPi1ulLhJMWKZSO5rvQ5dMXskQ=;
        b=RsgnJ9ZVyhm+26sqJea0Z5qdJoudFd5Gk7NJQmpQbNxLUJo7aFnZnnuZRShdw8W5T+
         EgGpjzTDISudKhluIqqrguET5M/PNeCcjrTTsMnw6XR96815t5dE0/QHCuRgWSFRZn3g
         nKu18RVdA3P51YFqrSyM+MC5H1LOEuokrR0NtwyMBorFHOz96BdBkvkeq33lcIAwgD3Z
         EOxHnMiGxJdVX+pqkXH2jp1Y1JB52VMRXtyj9RlpeJhwhHfUr4X1FzTnXdXr1xA6ECrA
         2stlKV/wIuaKk6v3blB8PRbLh0Qn56Oid2vO/JyOqfda53PeSNDt7fcDfarjbJOGbsk0
         1WzA==
X-Gm-Message-State: ABy/qLbW53WkLAkF45+1ReHA4NJlIkOAV7rQbIz4Nl2Jp3tS/HWKl8Dy
	4LpGeznvVU2Wvpx0je8a6g4=
X-Google-Smtp-Source: APBJJlEgMsbnQlEpC7AIysBE3EqDVlDLnNG1AaWLi6MDNW/FVVcuRxpaFON35Ui2Xu5tD4xU0RLM5A==
X-Received: by 2002:a05:6000:1289:b0:313:ecd3:7167 with SMTP id f9-20020a056000128900b00313ecd37167mr5545390wrx.42.1690754641719;
        Sun, 30 Jul 2023 15:04:01 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b003172510d19dsm11132401wrt.73.2023.07.30.15.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 15:04:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, John Watts <contact@jookia.org>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Mon, 31 Jul 2023 00:03:59 +0200
Message-ID: <5694691.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <ZLzwaQlS-l_KKpUX@titan>
References: <20230721221552.1973203-2-contact@jookia.org>
 <20230721221552.1973203-4-contact@jookia.org> <ZLzwaQlS-l_KKpUX@titan>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_150405_272098_70D0AFDD 
X-CRM114-Status: GOOD (  14.05  )
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

Dne nedelja, 23. julij 2023 ob 11:18:33 CEST je John Watts napisal(a):
> On Sat, Jul 22, 2023 at 08:15:51AM +1000, John Watts wrote:
> > ...
> > +			/omit-if-no-ref/
> > +			can0_pins: can0-pins {
> > +				pins = "PB2", "PB3";
> > +				function = "can0";
> > +			};
> > ...
> > +		can0: can@2504000 {
> > +			compatible = "allwinner,sun20i-d1-can";
> > +			reg = <0x02504000 0x400>;
> > +			interrupts = <SOC_PERIPHERAL_IRQ(21) 
IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&ccu CLK_BUS_CAN0>;
> > +			resets = <&ccu RST_BUS_CAN0>;
> > +			status = "disabled";
> > +		};
> 
> Just a quick late night question to people with more knowledge than me:
> 
> These chips only have one pinctrl configuration for can0 and can1. Should
> the can nodes have this pre-set instead of the board dts doing this?

Yes, that's usually how it's done.

> 
> I see this happening in sun4i-a10.dtsi for instance, but it also seems like
> it could become a problem when it comes to re-using the dtsi for newer chip
> variants.

Properties can be either rewritten or deleted further down, so don't worry 
about that.

Best regards,
Jernej

> 
> John.





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
