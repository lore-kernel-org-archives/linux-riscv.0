Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB98BC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1PauCtc8t0Qx6gKWnbA3MHAhD3xAPKoBKZj7HcvIec=; b=qdWFwcK9Fna6Wl
	BcsUM0G1P+RmFBxr8dspqNLczsbu5W9DO0rtNTtudyaIzWAeH2VKk1ZfOmHY1FavN3loEDh1Bs9MZ
	+Tw/q2lqe4P+xP8mpLsmQV4uoJRy+4QJGthJwuX5ZVA81p+VXoc7ICC5VZ4VPYzPOe8eMwxVHBO0m
	MmQMNO2NcYy8kexYJcCY7qLqITGYiYj2EG2Tn7RLLqIH3TDs5L1rWuLqp2Y9V8XEcOgB9j7kCPxhF
	JIBq4cmLtuYuHTBOMZfjjy7/ziAw4x1ndqpSGDOhffenMcTVVJ1U5ZLs4MOD2idJxzzM0vqJY7X5S
	aF4hVBzOkeRokhJL8vvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFa21-00EB3H-0p;
	Tue, 19 Dec 2023 13:21:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFa1v-00EB2I-2N;
	Tue, 19 Dec 2023 13:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702992060;
	bh=TsO3xC5LiEC2Q1rDd6j5HFyylembdHw/NQAvbMXny7I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1wTMgGGDN41nxiK38PIzsZRseLY07AikSD3kZrb6PZ/3ByZMDE7oCm8FOQWDXzzFD
	 ym4/CBeHqaC2rghNXq8jIxH5xOeU2qE3gXG8fQoQPo8Lb6cy/mHXSIDQp41qpMLEWK
	 EI6d1quKbBpZCn8o4BaTxt8nmkSCmPgueu7RmSk/IDBQl2PEMAB58kYAObV3Ng1oyT
	 nzaIHtWLIKRUZVA2BWM/XL91BQ9ZUl824xjvkjFDZME9LagsP8wkrWOlSDwPWWielV
	 cVmXBkCGeo1OAX1vfUxbC90Cv6/ref42de0inLmjCDs0RtMkow7xpCvtrNlAPPsjbM
	 lOkKmBOzqlhng==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5AB9F378145A;
	Tue, 19 Dec 2023 13:20:58 +0000 (UTC)
Message-ID: <0451e5a9-0cfb-42a5-b74b-2012e2c0d326@collabora.com>
Date: Tue, 19 Dec 2023 15:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Enable networking support for StarFive JH7100 SoC
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
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
 <a37d2df9-e593-476f-bfef-d9abaf063daa@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <a37d2df9-e593-476f-bfef-d9abaf063daa@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_052103_954544_01DA4A54 
X-CRM114-Status: GOOD (  14.30  )
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

On 12/19/23 11:03, Andrew Lunn wrote:
> On Mon, Dec 18, 2023 at 11:44:40PM +0200, Cristian Ciocaltea wrote:
>> This patch series adds ethernet support for the StarFive JH7100 SoC and makes it
>> available for the StarFive VisionFive V1 and BeagleV Starlight boards, although
>> I could only validate on the former SBC.  Thank you Emil and Geert for helping
>> with tests on BeagleV!
> 
> You will need to split this into patch sets per subsystem. The changes
> to the stmmac driver can then go via netdev, and the rest via each
> subsystem maintainer. It should then all meet in linux-next and work
> there.

Thanks for the reviews and your support to get those networking issues
properly handled!

Just to confirm the split will be done correctly, I'm going to keep just
the bindings and dts patches in v5, while the networking driver and
clock related patches will be submitted as part of two additional sets.

Regards,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
