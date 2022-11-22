Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A274BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 06:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/EnK4SxRUOwoa8/z5qUlMsncA4MUo1oi+Zdimn+qe4=; b=vjZ1jZQrr16E5w
	bWTEfe21QRTxcGgwj0DrRUARKP42lxWU5orpUsI2gplJX+6XJRSrqrw12DSpQc9mafG+rnTzb8sMR
	bWGbYWCUxwKk5rPp1qFsJKN2ucSipxIytW23o3bv6aMKASTJ4eqAkvCnx4CMAffDEBZZXfhJfeHP8
	Wy8qow0zYG1X0ZDNdYNh0YUmJwdYHJ9jOAdapRTxHORZeMiZIKuNhsFGQ9HDkJq4wbODdXavl0rok
	JzONr3BVo2udjtxx2chAqRr+Zhl8w0SNsummClgm1s2hENzzZpzSu5Hpl74dcDmmKaeuokqjTj0hO
	Rl7sGT8LxNAOuo8weZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxMX5-004tEh-RM; Tue, 22 Nov 2022 06:13:23 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxMX1-004t7S-Jj
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 06:13:22 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E55F624E0AC;
	Tue, 22 Nov 2022 14:12:44 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 14:12:44 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 14:12:44 +0800
Message-ID: <fdcb8ddd-f68b-0f01-9cce-ad61d47a3b7d@starfivetech.com>
Date: Tue, 22 Nov 2022 14:12:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 14/14] clk: starfive: jh71x0: Don't register aux
 devices if JH7110 reset is disabled
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-15-hal.feng@starfivetech.com>
 <CAJM55Z8t8yotMTWVw2J7gtGMyx5no2onj-YcfB6d1BY0ACeDJg@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z8t8yotMTWVw2J7gtGMyx5no2onj-YcfB6d1BY0ACeDJg@mail.gmail.com>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_221319_944384_5F5D0792 
X-CRM114-Status: GOOD (  18.55  )
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

On Sat, 19 Nov 2022 01:18:18 +0800, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>>
>> The JH7110 clock drivers will not register redundant auxiliary
>> devices if the JH7110 reset auxiliary driver is disabled.
>>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  drivers/clk/starfive/clk-starfive-jh71x0.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
>> index dda19c6937cb..4e69f56b00cc 100644
>> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
>> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
>> @@ -333,7 +333,7 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>>  }
>>  EXPORT_SYMBOL_GPL(starfive_jh71x0_clk_ops);
>>
>> -#if IS_ENABLED(CONFIG_CLK_STARFIVE_JH7110_SYS)
>> +#if IS_ENABLED(CONFIG_RESET_STARFIVE_JH7110)
> 
> I don't see any reason you'd want to build a kernel that needs the
> clock driver but not the resets, so I don't think this is something we
> should optimize for. I'd just drop this patch and let such broken
> kernels register the auxiliary devices even when no reset driver is
> there to use them.

You're right. I made this patch just following the style of jh7100.
And I think it's better to select RESET_STARFIVE_JH7110 in config
CLK_STARFIVE_JH7110_SYS.

Best regards,
Hal

> 
>>  static void jh7110_reset_unregister_adev(void *_adev)
>>  {
>> @@ -384,4 +384,13 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>>  }
>>  EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
>>
>> +#else /* !CONFIG_RESET_STARFIVE_JH7110 */
>> +
>> +int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>> +                                    const char *adev_name,
>> +                                    u32 adev_id)
>> +{
>> +       return 0;
>> +}
>> +
>>  #endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
