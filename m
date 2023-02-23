Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFAAC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cr/DGijB143ST5oRgPwI0/NN/l+XE4kZf13Hte+QlVU=; b=T/SCuLtg8F43Ig
	z0oKYW0TIYOkSxJRF1txuctk711Lg3y1speBLTlCDsRAfehFtySdWrCc2iWOA4illkUvARwjM1jvI
	fkhefkYFEzUhozSYFomBZwM9jXZBVXB06gFcilZSOyZI/ylUkiI1sSCHvF820Z9lFNgf91VqYvLlr
	2g/hDit95A1vrJ6Z2gn4BYObofWvJkUdwwNk2odwfsySHT2z+V8wZLXO3GVZgjI/bPInq9FccA6y+
	AYQD8UEijoO4NlwPgZKkQdZj/TrG9TLEW2B3gj8T9AtjlKQLwkw814TQsvi8HORFpLEw/2AjeKXim
	jn3aJGlsoJDM+EQ/gHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV56Y-00FI0h-Uv; Thu, 23 Feb 2023 06:29:22 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV56W-00FHzu-JZ
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 06:29:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E43F124E1CF;
	Thu, 23 Feb 2023 14:29:03 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 14:29:03 +0800
Received: from [192.168.125.82] (113.72.147.165) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 14:29:02 +0800
Message-ID: <6029c63a-9f26-e677-80c9-4470a96bdfb2@starfivetech.com>
Date: Thu, 23 Feb 2023 14:29:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 13/19] reset: starfive: Add StarFive JH7110 reset
 driver
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-14-hal.feng@starfivetech.com>
 <CAJM55Z_O9K=sCRXga9pMOXk9YjXc1v_V0e5S-8xN9Mi8gvHzvg@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z_O9K=sCRXga9pMOXk9YjXc1v_V0e5S-8xN9Mi8gvHzvg@mail.gmail.com>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_222920_812793_5086C3A3 
X-CRM114-Status: GOOD (  12.39  )
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

On Tue, 21 Feb 2023 16:33:09 +0100, Emil Renner Berthing wrote:
> On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
>>
>> Add auxiliary driver to support StarFive JH7110 system
>> and always-on resets.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  drivers/reset/starfive/Kconfig                |  8 +++
>>  drivers/reset/starfive/Makefile               |  1 +
>>  .../reset/starfive/reset-starfive-jh7110.c    | 64 +++++++++++++++++++
>>  .../reset/starfive/reset-starfive-jh71x0.h    |  6 ++
>>  4 files changed, 79 insertions(+)
>>  create mode 100644 drivers/reset/starfive/reset-starfive-jh7110.c
>>
[...]
>> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
>> index db7d39a87f87..e485472e1adc 100644
>> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
>> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
>> @@ -6,6 +6,12 @@
>>  #ifndef __RESET_STARFIVE_JH71X0_H
>>  #define __RESET_STARFIVE_JH71X0_H
>>
>> +struct reset_info {
>> +       unsigned int nr_resets;
>> +       unsigned int assert_offset;
>> +       unsigned int status_offset;
>> +};
> 
> As far as I can tell this struct isn't used anywhere but in
> reset-starfive-jh7110.c. If so just move it there, and in any case
> please call it something less generic like struct jh7110_reset_info.

OK, will fix it. Thanks.

Best regards,
Hal

> 
>> +
>>  int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
>>                                    void __iomem *assert, void __iomem *status,
>>                                    const u32 *asserted, unsigned int nr_resets,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
