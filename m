Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F678C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FW/JxTjM45rzVDeZ3XbNNL1i2elmUnVnitW7nxpthKA=; b=GVOIaR0vy/J7Zn
	qF9Ta4pgOAZQbiBKFapUx8GyhcVQlaNZlCxiAFz5UZO1Mdlxu3uKgnh7wmo6d5gQI8xDGBRSLzB2w
	iG/mcCuLzaaAtJxiV2ENzuYbxQQEYCJ5PwbPXIIkmlMti96hPrtxbONLCoknO5+6UtrkiX+2aRHEE
	ouRgBsi6BUEInCn2fp0YD9RSuzkuXDxyTQQgdgTyQP6W2SU9Z3vH/yp4WXueGx9SFaCKwkvmQszZC
	8Em3wukZ/IgpdMIVj8NW1xelUoG15fMuYhAcYEHFsnxnqcB+dUMdb5B61eoC+S/cTfXhlMqFE4y9Z
	+QQJWWrGJGwHGEGs17qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsdD-00ASkj-0O;
	Wed, 06 Dec 2023 14:12:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsd7-00ASfe-2w
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 14:12:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2B5FD8118;
	Wed,  6 Dec 2023 22:11:34 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 22:11:34 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 22:11:33 +0800
Message-ID: <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
Date: Wed, 6 Dec 2023 22:11:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "airlied@gmail.com"
	<airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, William Qiu
	<william.qiu@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	Shengyang Chen <shengyang.chen@starfivetech.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "suijingfeng@loongson.cn"
	<suijingfeng@loongson.cn>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
 <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_061202_282427_B1E10795 
X-CRM114-Status: GOOD (  12.84  )
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



On 2023/12/6 20:56, Maxime Ripard wrote:
> On Wed, Dec 06, 2023 at 08:02:55PM +0800, Keith Zhao wrote:
>> >> +static const struct of_device_id starfive_hdmi_dt_ids[] = {
>> >> +	{ .compatible = "starfive,jh7110-inno-hdmi",},
>> > 
>> > So it's inno hdmi, just like Rockchip then?
>> > 
>> > This should be a common driver.
>>
>> Rockchip has a inno hdmi IP. and Starfive has a inno hdmi IP.
>> but the harewawre difference of them is big , it is not easy to use the common driver
>> maybe i need the inno hdmi version here to make a distinction
> 
> I just had a look at the rockchip header file: all the registers but the
> STARFIVE_* ones are identical.
> 
> There's no need to have two identical drivers then, please use the
> rockchip driver instead.
> 
> Maxime

ok, have a simple test , edid can get . i will continue 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
