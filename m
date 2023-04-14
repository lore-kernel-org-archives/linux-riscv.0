Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6F8C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 01:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXRBeMpw0YAn2v06TQvZ4LghA+SFlCYU+TmY2KUcXw4=; b=NrHr9CRXEFNbJS
	xMUmXk/ThUXkqREIXFzTLGcV845lSRWLJdygXYU5B4K0/xXRjVCPeVVCcOPAbGyQZq9myqbYSF3bp
	DYBAiT7ojWsQEluM694kbf2VKwsuAedJ1ZT3T40QFH2hHPA8s3LZk2F7S5EVd+GTz0DKZ4ARu0NpP
	QuYA1AnTduv38usAfDGIi43QLUPEB78SwD+Ko+sBL7gxECH7bC58INqs8Kr/vCYprOj8ipkUGxwOR
	X4kaO8tFvHRPWznz+hpGa+b9hnnE6qEYDOC5YbcxW9w7213wU8ho6bozsnCWsGHxF0xoxNE1kjjFt
	3H5xq+QZ4HJWrvgd6NqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn8Ov-0083M2-2k;
	Fri, 14 Apr 2023 01:38:57 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn8Or-0083L0-1D
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 01:38:56 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1D2778086;
	Fri, 14 Apr 2023 09:38:27 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Apr
 2023 09:38:26 +0800
Received: from [192.168.125.131] (183.27.97.249) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Apr
 2023 09:38:25 +0800
Message-ID: <f020e55c-d4e4-dbb9-d658-7bef2b8bd94b@starfivetech.com>
Date: Fri, 14 Apr 2023 09:37:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 07/10] clk: starfive: Add StarFive JH7110 Video-Output
 clock driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230411135558.44282-1-xingyu.wu@starfivetech.com>
 <20230411135558.44282-8-xingyu.wu@starfivetech.com>
 <683cbe934d1df9436e003466d2a419ef.sboyd@kernel.org>
 <463ee23c-f617-bed0-27a8-56c6fb40d092@starfivetech.com>
 <cd4a11ae65e186799145410969d40421.sboyd@kernel.org>
 <4ed4d0e6-8da5-7eef-8713-44854b8d4a9b@starfivetech.com>
 <d70886f6ee13e70845a72354fe9a2b7d.sboyd@kernel.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <d70886f6ee13e70845a72354fe9a2b7d.sboyd@kernel.org>
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_183853_734502_77FCE0D7 
X-CRM114-Status: GOOD (  15.89  )
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

On 2023/4/14 2:38, Stephen Boyd wrote:
> Quoting Xingyu Wu (2023-04-13 06:31:12)
>> On 2023/4/13 12:04, Stephen Boyd wrote:
>> > diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
>> > index 5ec210644e1d..851b93d0f371 100644
>> > --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
>> > +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
>> > @@ -11,6 +11,9 @@
>> >  #include <linux/init.h>
>> >  #include <linux/io.h>
>> >  #include <linux/platform_device.h>
>> > +#include <linux/slab.h>
>> > +
>> > +#include <soc/starfive/reset-starfive-jh71x0.h>
>> >  
>> >  #include <dt-bindings/clock/starfive,jh7110-crg.h>
>> >  
>> > @@ -335,26 +338,32 @@ static void jh7110_reset_unregister_adev(void *_adev)
>> >       struct auxiliary_device *adev = _adev;
>> >  
>> >       auxiliary_device_delete(adev);
>> > +     auxiliary_device_uninit(adev);
>> >  }
>> >  
>> >  static void jh7110_reset_adev_release(struct device *dev)
>> >  {
>> >       struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> > +     struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
>> >  
>> > -     auxiliary_device_uninit(adev);
>> > +     kfree(rdev);
>> >  }
>> >  
>> >  int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>> >                                    const char *adev_name,
>> >                                    u32 adev_id)
>> >  {
>> > +     struct jh71x0_reset_adev *rdev;
>> >       struct auxiliary_device *adev;
>> >       int ret;
>> >  
>> > -     adev = devm_kzalloc(priv->dev, sizeof(*adev), GFP_KERNEL);
>> > -     if (!adev)
>> > +     rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
>> 
>> Can there use 'devm_kzalloc'? Are you not using this because the struct is public and clock driver
>> and reset driver both use it. But I think the both clock driver and reset driver are the same
>> device and can use 'devm_kzalloc'.
> 
> No. The release function for the auxiliary_device is supposed to free
> the memory. It shouldn't be tied to the lifetime of anything like the
> lifetime of the clk driver being bound.

Get it. Thanks.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
