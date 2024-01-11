Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F362FC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 18:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyCWqePzK048p5TQ9tcFWqfGExCpLPvpanbyIZ6s3JU=; b=uR99quzAxpWywD
	1bK8Eaf+ADQp2lGCihp6IgRg/QtjFlMZ4qICpLIKDqeGXIffpwK/t0r8BPAmu3TyzEvpnzJRuR7Kw
	7zbnY1eCP7/XxG46uZYyFJimERsS1tdQVKf9RmP61zeGbLrUoWzu4rSIEE2HZjOua95djVjTs4/c8
	ytG7fAQLT0TfpfwuDq1r6ZYhRER2ky4FgwQrg33iPR6vUO8pgG20RWluer9/8buiGwpOqQMmYXz/k
	Fx+dvo8iv2C3aPxXEfZzYNmtsQmIe6LTjI3WqT0Pr81mgR43RpcadLXCc4JTxCIDqKoZYzjqwJPM2
	WSKq62cjiMIgXWvXGi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzSc-000nEC-03;
	Thu, 11 Jan 2024 18:07:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzSY-000nCs-0H;
	Thu, 11 Jan 2024 18:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704996431;
	bh=lv5L2wbjPc1YW+bfBQ2xAmvYm+GCTmQkkdH8Qjc9HRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k15I3w8q1Xt6+sO+soQbwSrQPfh0RCgowNT2FUnLnjHfgzEghTstoGgHA4O9JIbRZ
	 4ghe80QPeXKCGlKmaV/VCtqhawWXnRUrUwCbqmYdk3IHFJ/nlFNUqox206qYmftSt1
	 NWC3/vhnl5q3AFfcQKUV2vNUsDoRd1QBR2E7J6/iHsKiNZ4cFFn2ZKVoISuu2Kf2Sx
	 /U3YJ4N5DwnBp5EeOgMf60+7nhZgOS/r7gFl95KJDIqXZJi5KnRvJZUOkf4xP3at5u
	 8egkGmktDDfQtE3ySHf6ZqrmdhV1I4gZqfGTP6hi4L0dEnHF4k4PI4aLDv1P7q5Zc2
	 Z4/kZvag02TxQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82F463781FCF;
	Thu, 11 Jan 2024 18:07:09 +0000 (UTC)
Message-ID: <59bb488f-f2ad-44b0-87fa-206ae3b1c33f@collabora.com>
Date: Thu, 11 Jan 2024 20:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: net: starfive,jh7110-dwmac: Add
 StarFive JH8100 support
Content-Language: en-US
To: Tan Chun Hau <chunhau.tan@starfivetech.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Jisheng Zhang <jszhang@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <rmk+kernel@armlinux.org.uk>
Cc: Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Jee Heng Sia <jeeheng.sia@starfivetech.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20240111025531.2875-1-chunhau.tan@starfivetech.com>
 <20240111025531.2875-2-chunhau.tan@starfivetech.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20240111025531.2875-2-chunhau.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_100718_287280_B0C1F34F 
X-CRM114-Status: UNSURE (   9.24  )
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

On 1/11/24 04:55, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> JH8100 dwmac has one reset signal instead of 2 resets as in JH7110.
> 
> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 50 +++++++++++++------
>  2 files changed, 37 insertions(+), 14 deletions(-)

[...]

Please note this is going to conflict with the about-to-be-merged changes
in [1], so probably it makes sense to wait for that to be picked up before
sending a new revision.  

[1]: https://lore.kernel.org/lkml/20231222101001.2541758-2-cristian.ciocaltea@collabora.com/

Regards,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
