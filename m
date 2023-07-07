Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2C8EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99TdzAPGgkYif9tHPgs1Vig+zsZ4KCDqgXIRgDtzYKU=; b=QB9F4NoIYGrv/p
	l2gELs3SIoKUUjy0+SJKvL+WMnXKXJ6UMFHC6x7zN8cLcqQnRZbuKdCZ6XtE38x7gt8e4VvTtu4Z+
	VTGcS+fNYWfnXjEs0Gr04heYRqYBjAn9dhavYcrA8hgcs7vc5O5FX2XbB/WrXDF9o+9o5wTGm5T97
	Vc+13IUi6SjKxhVwQyeeUlRkWGpn2H1obDJ7sy2vY2TsBZ3g46EYBneYS/iA6ElrDP5k6bl9vjWP1
	LYuMLypCBD+ddxb7HtAwwPzWDUSxQ0qsxdq6Fz1tqURSHpQ9bubJZVOO9/9R6xM/0Mil07IIUxB0z
	zCAnSDDXOZYTBPBK0IWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgDR-003uC2-0x;
	Fri, 07 Jul 2023 07:49:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgDO-003u9R-1q
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 07:49:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0A6C68116;
	Fri,  7 Jul 2023 15:48:54 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Jul
 2023 15:48:54 +0800
Received: from [192.168.125.128] (113.72.145.114) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Jul
 2023 15:48:52 +0800
Message-ID: <b649773b-ec51-20fa-a5a1-553e89b0d223@starfivetech.com>
Date: Fri, 7 Jul 2023 15:45:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL
 clock inputs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-4-xingyu.wu@starfivetech.com>
 <20230704-tingling-automaker-22460e884793@spud>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230704-tingling-automaker-22460e884793@spud>
X-Originating-IP: [113.72.145.114]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_004918_854017_D8CA7956 
X-CRM114-Status: UNSURE (   9.03  )
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

On 2023/7/5 6:23, Conor Dooley wrote:
> On Tue, Jul 04, 2023 at 02:46:06PM +0800, Xingyu Wu wrote:
>> Add PLL clock inputs from PLL clock generator.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> As expected this produces warnings for the existing, in-tree,
> devicetrees which go away when the later dts patches are applied.
> It'd be good to mention that its intentional if you end up sending
> another version of the series.
> 
> Otherwise, this looks good to me too.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 

Thanks, I will add the mentions in next version.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
