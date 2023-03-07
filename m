Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D999AC678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 03:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzXGSjwDRoGSWidnjoWUmTzWZPE+nHf2LkM9i3FNLx0=; b=dU9ARp+kz4vwN2
	zkQYZzrJ2masdY5jezFWdXI5N9YgJPESooxzlh+T7tS7E9+unrsqhemNPgkrwBq3Rv0T0hR0iZoU2
	iZN9vD7CfrIwJ487MXIZNAKv14rOG2JEKnCyjeME6+n7nUywGEJWSGfZCdh4A0ZXF3UsVjB39bsRu
	i+Z+JECbmddyjfk3BMt9z7DbOlI9p+StihqRJSmpX5JZKgYeswOaIlQEVeoyE48Fxu1m0YMuuXigA
	egMfYhbCnFtZw5rQKwrkiXLP41az2++kUPwF287ljXyC5ZXgYVf496D4cDiyiOn5DHiLwRDaRrm9T
	+UQ4vQe1OroldK24dQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZOLD-00G5IE-N2; Tue, 07 Mar 2023 03:50:19 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZOLA-00G4zF-8z
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 03:50:18 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 03FF224E023;
	Tue,  7 Mar 2023 11:47:42 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 11:47:41 +0800
Received: from [192.168.125.128] (183.27.97.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 11:47:40 +0800
Message-ID: <c745392f-6d8a-8e00-803b-dd61a0a008a0@starfivetech.com>
Date: Tue, 7 Mar 2023 11:47:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] clocksource: Add StarFive timer driver
To: Andreas Schwab <schwab@suse.de>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
References: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
 <20221223094801.181315-3-xingyu.wu@starfivetech.com>
 <mvmzg8vlcfk.fsf@suse.de>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <mvmzg8vlcfk.fsf@suse.de>
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_195016_522718_19EE5C0A 
X-CRM114-Status: UNSURE (   7.29  )
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

On 2023/3/2 17:39, Andreas Schwab wrote:
> drivers/clocksource/timer-starfive.c:117:13: error: conflicting types for 'timer_shutdown'; have 'void(struct starfive_clkevt *)'
>   117 | static void timer_shutdown(struct starfive_clkevt *clkevt)
>       |             ^~~~~~~~~~~~~~
> In file included from ./include/linux/workqueue.h:9,
>                  from ./include/linux/srcu.h:21,
>                  from ./include/linux/notifier.h:16,
>                  from ./include/linux/clk.h:14,
>                  from drivers/clocksource/timer-starfive.c:12:
> ./include/linux/timer.h:188:12: note: previous declaration of 'timer_shutdown' with type 'int(struct timer_list *)'
>   188 | extern int timer_shutdown(struct timer_list *timer);
>       |            ^~~~~~~~~~~~~~
> 

Oh, this timer_shutdown(struct timer_list *timer) function was not available
in 6.1-rc5 which this patchset was base on. And in the new version, it's the
same name as my own function. I will change the name of this function.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
