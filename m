Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83822C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdxyMf7F5K1bLyh3FgIo8Is27mnqizVRFGfKMia8EGg=; b=i7JQWzRwI0QWW2
	ESpoBGIE1vh8Zag4Ci3tDo64L9H9f1Z3Y57HEx/bpmRgLgqi4WPPbfMSO24R1M47nnpi0qIsAbE0h
	7gKNrjh9TfH/iYDcUlE1bXhZ1qX+wJbjikoBzyJF46UYAbNcaP815CDtdbDWhaS0TZC+iMmKKfjeL
	1nzzHJeXl7YeE1EvBLfQTaZIvTlb2K8DhhJe/iAElz6nD17CTMBa45/CTww73mPoP7S5jZmya21Eo
	pemALJVIOyfMtcBIZqfhpzXNIDAlya2ft/kRgXiCwr2JQFKElSa5EwtlP8rTf45DleDOkr4rpKGSa
	OseRyTP2RTM2JNcMCg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8Nd-00702c-HU; Thu, 24 Nov 2022 09:18:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8Na-00700u-WE
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:18:48 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B6C9324E252;
	Thu, 24 Nov 2022 17:18:27 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Nov
 2022 17:18:23 +0800
Received: from [192.168.125.96] (183.27.97.81) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Nov
 2022 17:18:22 +0800
Message-ID: <ae660806-9136-ab75-5bee-8fef534795ba@starfivetech.com>
Date: Thu, 24 Nov 2022 17:18:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 0/4] JH7110 Power Domain Support
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <CAJM55Z_OGDrCHs++9w4FhG-mZzGzOsnHZT77Q6BDJOGWX7eXJQ@mail.gmail.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <CAJM55Z_OGDrCHs++9w4FhG-mZzGzOsnHZT77Q6BDJOGWX7eXJQ@mail.gmail.com>
X-Originating-IP: [183.27.97.81]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_011847_197878_F58CA667 
X-CRM114-Status: UNSURE (   7.89  )
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

On 2022/11/19 2:38, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 14:34, Walker Chen <walker.chen@starfivetech.com> wrote:
>>
>> This patchset adds power domain controller driver for the StarFive JH7110 SoC.
>> The series has been tested on the VisionFive 2 board.
> 
> Hi Walker,
> 
> Thanks for upstreaming this! I've left some comments on the individual patches.

Sorry for late reply. Thank you for taking the time to review this driver!
Your advice is very helpful to me.

Best Regards,
Walker Chen




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
