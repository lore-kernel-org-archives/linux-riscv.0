Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AC0C83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqdv4ssvGPTny/gRnuTYlHbwFIJdrenFqf2MM00kBoM=; b=xQeOvHKMqFLZBw
	Z80Pd2N0v7odxDhalnPCNtyOJ5bLIX+8E+RktB42ajN9vjiWfZUp8u+gNUjsEF4uPzBVQxwMceN0k
	cENRTU50kmVIOAhzBht4i1g5UYL35YtI25V92dGnocQZ/OXXLwKO8GOFo04T8R6ucuSQ8yEF0yFBB
	jR10KGf3egiKG44Qy9yrTpdwB105xLm7ENye/XWye4qPvZQlMgWZPSDIlxfnd2akVK676Pu+n7ZNY
	HvSYzyg2burx+AzXxImqyJEJPMoYyyOtxsOiE+EdhIHgwjqu8S1TW+UTiibpHiZPWbUNkR2rR1URY
	oe2f0b8ITKLbUn+e0SGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaWRI-0092Tr-2E;
	Mon, 28 Aug 2023 07:13:32 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaWRD-0092Ot-2W
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 07:13:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2397980C5;
	Mon, 28 Aug 2023 15:12:37 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 28 Aug
 2023 15:12:37 +0800
Received: from [192.168.125.72] (113.72.145.245) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 28 Aug
 2023 15:12:35 +0800
Message-ID: <a49737f0-0a09-b558-ea06-b3d47a6e4240@starfivetech.com>
Date: Mon, 28 Aug 2023 15:12:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC v4 0/4] StarFive's Pulse Width Modulation driver support
To: Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230825081328.204442-1-william.qiu@starfivetech.com>
 <20230825-exclusion-doing-93532be4fa97@spud>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230825-exclusion-doing-93532be4fa97@spud>
X-Originating-IP: [113.72.145.245]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_001328_166393_AFD7A0BD 
X-CRM114-Status: GOOD (  10.93  )
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

On Fri, 25 Aug 2023 16:06:12 +0100, Conor Dooley wrote:
> On Fri, Aug 25, 2023 at 04:13:24PM +0800, William Qiu wrote:
>> Hi,
>> 
>> This patchset adds initial rudimentary support for the StarFive
>> Pulse Width Modulation controller driver. And this driver will
>> be used in StarFive's VisionFive 2 board.The first patch add
>> Documentations for the device and Patch 2 adds device probe for
>> the module.
>> 
>> Changes v3->v4:
>> - Rebased to v6.5rc7.
>> - Sorted the header files in alphabetic order.
>> - Changed iowrite32() to writel().
>> - Added a way to turn off.
>> - Moified polarity inversion implementation.
>> - Added 7100 support.
>> - Added dts patches.
>> - Used the various helpers in linux/math.h.
>> - Corrected formatting problems.
>> - Renamed dtbinding  to 'starfive,jh7100-pwm.yaml'.
>> - Dropped the redundant code.
>> 
>> Changes v2->v3:
>> - Fixed some formatting issues.
>> 
>> Changes v1->v2:
>> - Renamed the dt-binding 'pwm-starfive.yaml' to 'starfive,jh7110-pwm.yaml'.
>> - Dropped the compatible's Items.
>> - Dropped the unuse defines.
>> - Modified the code to follow the Linux coding style.
>> - Changed return value to dev_err_probe.
>> - Dropped the unnecessary local variable.
>> 
>> The patch series is based on v6.5rc7.
> 
> Out of curiosity, why is this series still an RFC?

There was no comments received in v4. So William resend it and
request for comments.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
