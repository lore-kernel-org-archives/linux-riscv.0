Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B50C636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 06:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IcPuvR6ayl8o28QZVeyy4dh+p/74Pg2kUHJytOOgGI=; b=jSivYPlNZ6vwu5
	V95rpgtO1c2R+kbaxr3POE74MXF/giWGVdvxZCPu9w2BAxMvUwlD9ruPzpJdco3WaIDNAI18KC6t/
	vkqN6Jfs3lj/aSFrNrhmvcYqfp+VUGTwNof90oUjR+HCgoLzILChPj7Jp8Dv9kEJLdffxVwt2MZki
	3ybYsbuUXpsctonwQUamv091o9TWqk8KgC5NN/s2MKUHdOI3IlBn/7+vm2F+cmhOXSEcm+kxsyLHV
	DDJMmTbXTWGYUgVJU07fkgA8GNAqKCadpx4Pu3WaMU5X5j9vULpIGrbwvvsbbNNmneho3LeDR7zgI
	XYr01liYpTLqg3V3SP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5P6-00FKgj-Q8; Thu, 23 Feb 2023 06:48:32 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5P2-00FKdv-G2
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 06:48:31 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B4B4B24DCBE;
	Thu, 23 Feb 2023 14:48:04 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 14:48:04 +0800
Received: from [192.168.125.82] (113.72.147.165) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 14:48:03 +0800
Message-ID: <e0d8f9ba-5bf4-d7dd-5110-20d4196556f9@starfivetech.com>
Date: Thu, 23 Feb 2023 14:48:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 13/19] reset: starfive: Add StarFive JH7110 reset
 driver
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-14-hal.feng@starfivetech.com>
 <CAJM55Z_O9K=sCRXga9pMOXk9YjXc1v_V0e5S-8xN9Mi8gvHzvg@mail.gmail.com>
 <Y/TygwbxyuhbDooX@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y/TygwbxyuhbDooX@spud>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_224829_374031_BEB5181A 
X-CRM114-Status: GOOD (  21.38  )
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

On Tue, 21 Feb 2023 16:34:11 +0000, Conor Dooley wrote:
> On Tue, Feb 21, 2023 at 04:33:09PM +0100, Emil Renner Berthing wrote:
>> On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
>> >
>> > Add auxiliary driver to support StarFive JH7110 system
>> > and always-on resets.
>> >
>> > Reported-by: kernel test robot <lkp@intel.com>
> 
> Drop the reported-by here too please Hal.

OK.

> 
>> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> 
>> > +static int jh7110_reset_probe(struct auxiliary_device *adev,
>> > +                             const struct auxiliary_device_id *id)
>> > +{
>> > +       struct reset_info *info = (struct reset_info *)(id->driver_data);
>> > +       void __iomem **base = (void __iomem **)dev_get_drvdata(adev->dev.parent);
>> 
>> Hi Hal,
>> 
>> I saw the kernel test robot complain about this, but I still wonder if
>> the extra level of indirection is really needed. Isn't it enough to
>> just add the explicit casts, so
>> 
>> dev_set_drvdata(priv->dev, (void *)priv->base);
>> 
>> in the clock drivers and here just
>> 
>> void __iomem *base = (void __iomem *)dev_get_drvdata(adev->dev.parent);
> 
> I *think* if you do that, sparse will complain that you cast away the
> __iomem. The complaint is something like "cast removes address space
> qualifier from expression".
> 
> The other option is, rather than set the base as the drvdata, just pass
> the whole priv struct. That's what I did for mpfs at least & I thought I
> had suggested it on v3, but must not have.
> It looks prettier than the casting madness at least ;)

I modified this just because we need to use container_of() to get some
struct in [1].

+struct isp_top_crg {
+	struct clk_bulk_data *top_clks;
+	struct reset_control *top_rsts;
+	int top_clks_num;
+	void __iomem *base;
+};

+static struct isp_top_crg *top_crg_from(void __iomem **base)
+{
+	return container_of(base, struct isp_top_crg, base);
+}

[1] https://lore.kernel.org/all/20230221083323.302471-7-xingyu.wu@starfivetech.com/

If we pass the whole priv struct, we need to make the priv struct
public. I think setting the address of "base" as the drvdata is
enough and easier.

Best regards,
Hal

> 
>> > +
>> > +       if (!info || !base)
>> > +               return -ENODEV;
>> > +
>> > +       return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
>> > +                                             *base + info->assert_offset,
>> > +                                             *base + info->status_offset,
>> > +                                             NULL,
>> > +                                             info->nr_resets,
>> > +                                             NULL);
>> > +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
