Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE99EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SC8MWhtKhqQ5dW8oOg8TYWoj0E0q111T1GIodw+BSgI=; b=mSrEJXVkUAaZAi
	ycZTDefw1StibEf1plOucnoMzwJFOEU8EHoXPKp0JbFO5Kx3Jy7OlZV4rURc4zEt5iZeJ0Xu+fUKF
	g8xIe4XdwfXcRoncd02n/u/j2dWyvATt7wUgrAn5LLlPXf6r0zVVzGBqqOZDWln2ml85hYM2ioDkh
	rsNwFCiyH4uCOoA9B+qhV/6Jmw0jKaaJKL8UVbEXQjUCw8qRxjuvFDpUXfXrk/DEK7gH+dI5yji8n
	W1Oel8fdBqBL2M0hEG8c624LsFPLbBZAjdwsGO0pLxJU0oOz7MHy5uExzMVqi73mSrM/AbPpoL/5k
	BZkzNZGEi51DsCRJwMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMjuX-00D5JZ-03;
	Fri, 21 Jul 2023 06:46:45 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMjuR-00D5I9-0F
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 06:46:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D267C7FD6;
	Fri, 21 Jul 2023 14:45:55 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 14:45:55 +0800
Received: from [192.168.125.128] (113.72.147.86) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 14:45:54 +0800
Message-ID: <8794c997-f371-70f8-2462-a6c677e7308c@starfivetech.com>
Date: Fri, 21 Jul 2023 14:41:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 0/9] Add STG/ISP/VOUT clock and reset drivers for
 StarFive JH7110
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230713113902.56519-1-xingyu.wu@starfivetech.com>
 <20230720-enjoyment-gestation-adb8baa9aaf1@spud>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230720-enjoyment-gestation-adb8baa9aaf1@spud>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_234639_489467_0A743E67 
X-CRM114-Status: GOOD (  16.85  )
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

On 2023/7/21 0:32, Conor Dooley wrote:
> On Thu, Jul 13, 2023 at 07:38:53PM +0800, Xingyu Wu wrote:
>> This patch serises are base on the basic JH7110 SYSCRG/AONCRG
>> drivers and add new partial clock drivers and reset supports
>> about System-Top-Group(STG), Image-Signal-Process(ISP)
>> and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC. These
>> clocks and resets could be used by DMA, VIN and Display modules.
>> 
>> Patches 1 and 2 are about the System-Top-Group clock and reset
>> generator(STGCRG) part. The first patch adds docunmentation to
>> describe STG bindings, and the second patch adds clock driver to
>> support STG clocks and resets as auxiliary device for JH7110.
>> 
>> Patches 3 and 4 are about the Image-Signal-Process clock and reset
>> gennerator(ISPCRG) part. The first patch adds docunmentation to
>> describe ISP bindings, and the second patch adds clock driver to
>> support ISP clocks and resets as auxiliary device for JH7110.
>> And ISP clocks should power on and enable the SYSCRG clocks first
>> before registering.
>> 
>> Patches 5 and 6 are about the Video-Output clock and reset
>> generator(VOUTCRG) part. The first patch adds docunmentation to
>> describe VOUT bindings, and the second patch adds clock driver to
>> support VOUT clocks and resets as auxiliary device for JH7110.
>> And VOUT clocks also should power on and enable the SYSCRG clocks
>> first before registering.
>> 
>> Patch 7 adds struct members to support STG/ISP/VOUT resets.

BTW, I found this patch is not in the linux-next or clk-next.
These STG/ISP/VOUT CRG drivers are 'incomplete' without this resets patch.
I don't know what your plans about this patch and I'm just curious on it.

> 
>> Patch 8 adds external clocks which ISP and VOUT clock driver need.
>> Patch 9 adds device node about STGCRG, ISPCRG and VOUTCRG to JH7110 dts.
> 
> b4 did not detect this correctly, but I picked these 2 up too.
> They should be in next tomorrow.

Thanks to you.

> 
> Please let your co-workers know that they should resend anything that I
> didn't sent a thanks email for today, as it failed to apply (eg DMA,
> eMMC).
> 

Okay, I'll let them know and resent these patches.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
