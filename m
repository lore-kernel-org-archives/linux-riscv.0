Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DE1C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 07:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhPjRL80L9A6fyPhfhYZqPzUn4mZFUB7osqxgUmQwPA=; b=2O768RgQ8A0GGX
	oOJGRfktFCFdZU6akmQL7NOnIP9NWwuDY0A9+of+Lt7YteE6A6qiRZEuxom+oHVfDpGlejSi05kqR
	J/AIRew7YdsGAIb39AM5w+3wFlHmOFUIqJnM4bLTTb1ZXLdhtDZwFzLvAF3xpSYX0BUuYDvV32L2C
	i0nKGxczH34hGpqt+4TvHG6v8/VPsWP2T0g0zYttp7P9Gm6m8Nny70lAc7T71eAJMr4k4Wv8EQ+kp
	c7Yc44HXr+RMdxPiB4pcBCg/0znco7M9nU/WCHH83hiBGBGr7G69s08yJaRGJpVIqCFcTUM+cRNix
	JDGXOwlaZqoP6V4Y54ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZm2-00000002Ub8-0unL;
	Wed, 05 Feb 2025 07:24:38 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZlx-00000002UXL-1RK2
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 07:24:36 +0000
X-QQ-mid: bizesmtpsz10t1738740211teyq6f
X-QQ-Originating-IP: eYyzO5QSXnnXIwL7uGmtDShdouU8nJoM7QM9YL0sLyQ=
Received: from [192.168.125.117] ( [113.72.145.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Feb 2025 15:23:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16571871631840008166
Message-ID: <EA1B602AAF2011A6+78e19956-822a-46a5-8f67-c99ee79510d1@linux.starfivetech.com>
Date: Wed, 5 Feb 2025 15:23:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] riscv: dts: starfive: jh7110-common: assign 24MHz
 clock-frequency to uart0
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-4-e@freeshell.de>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250203013730.269558-4-e@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NhdiEwnVOUqElu8RlIrSrq6wW33PQPQxE+mopJvaL0gDADNO/nTo6RLC
	ymWFITs28FUnujYHeDy0VRt7HgSOMQD1/beGj0HcJ832rVijeJX1MjKB3NpNxaDx6dIhzlZ
	oPGsxUHvkTWxMHGFNa1RS3VHfTWh0a0Q8tyUJ0tLgYTQG7I3M6DGlO+J6qG27wnMqw8+3s4
	taETCjZpnYgyisT1ne15fI3c3wub81mlJm3iiWFn34nniPpZM1knNNMl5+noDSvzz79lJUG
	m76mvOmCixEEwbnQfwTpnUhn9Vf36KC3zSZpX1HxLXuTrdJ1CX6IxsqgOiOOO01FJmtjEr0
	3Ds70ev0DG9swHuuJQfC8AIgz4fdUIklhuhsE/k0k6fbc5OQqGfbpdRjTN8zDYJkHv/eR6A
	EQ9TfgecaLL6+O+5F8VMelgTTBzjb3LN6ULLbpPvfFoQ5FbzwBO4LtQ7ZkSf/74lnL1fABN
	4fxYcT+5bmSLQWDQUhnHhtD7id/eLvzoO0DTTGfs+isCKbYNAsKzmcaEaw9401fwhQj0VjG
	R3eXlE4FqnY/br09u04vPpIvzXckAbDVJt3RUPM3ADTFQDrERwVBh5DIRsbh8gtS/TmHAzt
	3CUZlx1TmdXxlR+OyozyOsAWM0mbfQLiACPmg1oUMuJL/ekBi4HqWukiKKpXzPQ6fbWRLmb
	6hIndQVUq3XWpU+b+/zeo2SUysv2AwJWvewjAl88Pv/UB5q5OtaCy//CBpJYrtVijYuBdfs
	t/MIbi/oKw0Teud/ZLfpMJ0B3bG1V3y4By52dmuU4xcayl+HFoeuOOfkjJkGvwgNVnSIJov
	IifK85KEbA9i4OpVFzk3mCcWEcFvLa4x7rD535VqGhu3d0qTdFkY9Y3i0pHvNHhx/y7+kOX
	5zD27Q87Tw2wSClDD4IDWF0nf5VgwlGhxdTXFjxByPWuOFpqIAZ2CctvohgIxg98qWfj55g
	6mYirkkSS6+Npi+ku/Bqvfi6C6jnLStYfmy8=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_232434_014054_5BE50C66 
X-CRM114-Status: UNSURE (   9.49  )
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

On 2/3/2025 9:37 AM, E Shattow wrote:
> Set uart0 clock-frequency for better compatibility with operating system
> and downstream boot loader SPL secondary program loader.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8a59c3001339..6bb13af82147 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -635,6 +635,7 @@ GPOEN_DISABLE,
>  };
>  
>  &uart0 {
> +	clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
