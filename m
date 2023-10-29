Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724FFC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 22:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wWswCZKZ5x15U3/YCZPhvgbO6mNub0qskH5e0A31uI=; b=ojXeWPmtbQ659D
	JHSdzou798HpSquCeYlo8YZ7ZcrIypUbTK3a3urYvSGBFCa7yKG8e9RobyPkIYOjWYPUHhvUeT+YT
	FhKLziT2HETwjJ2+ILfFi2RR8aECBdAQZ9x/agsPi5ajXrfZsX3nrDem9O+Ca1FvJbnQcN5hja6+I
	GMN0kzwmBPeJbMxj+0l+KYoMlsqSh7uHxOrG6A6G2Hmt2J1m72dGHZaMk2os4heQbPRQaRiObW+rD
	cgt6CGVHFzLPRh+QdSO4zUAV36ffRUFZHds3quWKFI/4J7Qx5yzspGhRCi8k2i40JctjJnL9zJ/Yx
	3RayqRKbSYY7ROmo2FeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxEfT-002DLz-0i;
	Sun, 29 Oct 2023 22:54:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxEfP-002DLS-33;
	Sun, 29 Oct 2023 22:54:01 +0000
Received: from [192.168.1.90] (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5344666072BB;
	Sun, 29 Oct 2023 22:53:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698620037;
	bh=vm9aJnhq63RdAaCsogNW1tU6wc1DMvmWq3qynSp9OGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZlS35BI0RXrQj/Gnyaf64juE825VEBdfX4SYCJizDZFvT5KuXISWLctywXd80qzuC
	 /WGuacRkxqmWk5ftBuaGxLpx/Yi+7iInpcYkuBmmI1yJVxhwQJutYlMtAEb54C6GTm
	 NXW+e5p2TQNAHOMyTwCv4742iRyQfKm+GffBe8OlU7tskNnujIke4QYrmA4ohjPNRn
	 TmjagXC3BYwMItuBM4bNDPZXSDLkLOtlPOxyh3Rf0HyBJasYMbr7fLRVG8fBvg8jJx
	 u7+aIQaPU2c/5qxCB/Wb1fKKy0XmH/1JNCQ4MqOGDrUiqtvrx8kr2lkc8F1PwWDDa9
	 iTgFfFHJJ0OUw==
Message-ID: <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
Date: Mon, 30 Oct 2023 00:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_155400_117553_E85ED208 
X-CRM114-Status: GOOD (  13.72  )
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

On 10/29/23 20:46, Andrew Lunn wrote:
> On Sun, Oct 29, 2023 at 06:27:12AM +0200, Cristian Ciocaltea wrote:
>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
>> RGMII-ID.
>>
>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
>> yes, add the mdio & phy sub-nodes.
> 
> Please could you try to get this tested. It might shed some light on
> what is going on here, since it is a different PHY.

Actually, this is the main reason I added the patch. I don't have access
to this board, so it would be great if we could get some help with testing.

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
