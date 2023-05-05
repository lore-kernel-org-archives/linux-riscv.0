Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78642C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 01:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dyh5C97byf7qtdZO9ULLpI5iP04udaKLfxt7G9iPqQ=; b=PSKbJGYY8kcWUx
	2mP4vfWbZLUHsQa0NWvJ54XozIlv4sH6AvnFCQAHfK1QWyvBU6N8LnQW8wJPJkAfF6qYnTSWSyUHF
	AtAnL/6fsM+oWVeByiG0lb5h7KNPY4GUu8aatZPybfyFmXpthJtW5fvCPZjC30frjHDkh4yxaU2RX
	FrhKb2YPcjSPqrrR2hNIL14S2axakjvkhcqqKs8guFdCnZxUm0C6ocuOLvVmmQay9VKiwFuFOcHJR
	C6jOUhaHQJqeNHAWSZO/M2Cr6cHXoGsP1nmGvLr5Q+puKgbIhrSfzHAQKuOuSCiH1BX8UFGbAOFTe
	VcJYxNWCgzDaRGWpZqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pukQ0-009TP0-0n;
	Fri, 05 May 2023 01:39:32 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pukPx-009TNB-07
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 01:39:31 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E355824E2B1;
	Fri,  5 May 2023 09:38:39 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 5 May
 2023 09:38:39 +0800
Received: from [192.168.125.89] (183.27.99.121) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 5 May
 2023 09:38:38 +0800
Message-ID: <457c35b5-aec4-1147-673f-947052b5f944@starfivetech.com>
Date: Fri, 5 May 2023 09:38:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/3] Add JH7110 cpufreq support
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
CC: Shengyu Qu <wiagn233@outlook.com>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230421031431.23010-1-mason.huo@starfivetech.com>
Content-Language: en-US
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <20230421031431.23010-1-mason.huo@starfivetech.com>
X-Originating-IP: [183.27.99.121]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_183929_437667_2A672A91 
X-CRM114-Status: GOOD (  15.46  )
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

Hi Conor & Shengyu,

Thanks for your review, and is there any comments about these v3 patches?

Thanks
Mason

On 2023/4/21 11:14, Mason Huo wrote:
> The StarFive JH7110 SoC has four RISC-V cores,
> and it supports up to 4 cpu frequency loads.
> 
> This patchset adds the compatible strings into the allowlist
> for supporting the generic cpufreq driver on JH7110 SoC.
> Also, it enables the axp15060 pmic for the cpu power source.
> 
> The series has been tested on the VisionFive 2 boards which
> are equipped with JH7110 SoC and axp15060 pmic.
> 
> 
> This patchset is based on v6.3-rc4 with these patches applied:
> [1] ("Basic clock, reset & device tree support for StarFive JH7110 RISC-V SoC")
>     https://lore.kernel.org/all/20230401111934.130844-1-hal.feng@starfivetech.com/
> [2] ("Add X-Powers AXP15060 PMIC support")
>     https://lore.kernel.org/all/TY3P286MB2611A814E580C96DC6F187B798969@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM/
> 
> Changes since v2:
> - Fix the new blank line at EOF issue in dtsi.
> 
> Changes since v1:
> - Fix dts node naming issues.
> - Move clock properties of cpu node from <board>.dtsi to <soc>.dtsi.
> - Follow the alphabetical order to place the cpufreq dt allowlist.
> 
> ---
> v1: https://lore.kernel.org/all/20230411083257.16155-1-mason.huo@starfivetech.com/
> v2: https://lore.kernel.org/lkml/20230417063942.3141-1-mason.huo@starfivetech.com/
> 
> Mason Huo (3):
>   riscv: dts: starfive: Enable axp15060 pmic for cpufreq
>   cpufreq: dt-platdev: Add JH7110 SOC to the allowlist
>   riscv: dts: starfive: Add cpu scaling for JH7110 SoC
> 
>  .../jh7110-starfive-visionfive-2.dtsi         | 30 +++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 33 +++++++++++++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c          |  2 ++
>  3 files changed, 65 insertions(+)
> 
> base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
