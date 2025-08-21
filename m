Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806C4CA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ+EG0F0axFFJNbl0VaQJoKF6TwkMbLDuCfmTOmPwQA=; b=BeqYGF8Lg9JXnt
	djEeV5rgccyC9CwUTpdv0dCUXJuRC61rl4Af4q+E9Z2Aey0bYXs91QfTlD4eYubl2D+nU8yvxpjc0
	v93VYT7tGsYYPaSr0Jhp27uMQR8GTzxdWnWHDOHV0jJLTCU9v60KI/638/Ebn0w4sEZkBM1Ru71+u
	aYzY/GNYwT7AOgQ9xt7i6LD0ZIrEes69p3GxsLnXdTkSxdwh59Lg61A8ulmXN7Sf9xPzA6MX169BO
	zkRre2zNvonNkDEat/ko2iokSJt2j/xpss16I+6K4SsmGzPmAdS1BftOSiTppxz5tszvMKHmHOJ6K
	DYGNnsOeW6borXB84r6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDsl-00000000kY4-1pAl;
	Thu, 21 Aug 2025 22:35:43 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5y0-0000000HAtc-2c5F
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 14:08:38 +0000
Received: from [192.168.0.106] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowADXA6hfKKdoj+MRDg--.46265S2;
	Thu, 21 Aug 2025 22:08:31 +0800 (CST)
Message-ID: <c1396997-fa92-47cd-9bc6-8dcb67e87eb8@iscas.ac.cn>
Date: Thu, 21 Aug 2025 22:08:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] riscv: dts: starfive: Add VisionFive 2 Lite board
 device tree
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
 <20250821100930.71404-4-hal.feng@starfivetech.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250821100930.71404-4-hal.feng@starfivetech.com>
X-CM-TRANSID: qwCowADXA6hfKKdoj+MRDg--.46265S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1UKF4fXrWxZr4rWFyxuFg_yoWDWwc_Ga
	4kKw1fGF4UJF1kK3s8Grn7CF1FyayavrnxA3yFvr47JF9Yg34Yy3ZrG3y0kF1UAF1jgFs8
	GFn3WF4qkr4kKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2X_-DUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_070837_028246_95E01EEB 
X-CRM114-Status: UNSURE (   7.26  )
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

On 8/21/25 18:09, Hal Feng wrote:
> [...]
> +++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +
> +/ {
> +	model = "StarFive VisionFive 2 Lite";
> +	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s";
> +};

Might need to add starfive,jh7110s to:

  drivers/cpufreq/cpufreq-dt-platdev.c

So that it can use the opp stuff here:

> +
> +&cpu_opp {
> +	opp-312500000 {
> +		opp-hz = /bits/ 64 <312500000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-417000000 {
> +		opp-hz = /bits/ 64 <417000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-625000000 {
> +		opp-hz = /bits/ 64 <625000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-1250000000 {
> +		opp-hz = /bits/ 64 <1250000000>;
> +		opp-microvolt = <1000000>;
> +	};
> +};
> +> [...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
