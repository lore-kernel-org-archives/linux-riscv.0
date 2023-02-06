Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8CAC636D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sgv4LBykAEhE1ny3PQT5+kk/jcQiYoGsnPHYbqLHz8o=; b=LKs9vU0J8Rs89x
	McRphYoQHXXkIdsEaTU5efHO3sftFQigehwkE+FICI73ZEzdgLbe2ln+ugqwTRLY+eHRYh04+EmHf
	titiJfNyojx/4/R4c+2xIuJDV+Y5n7t02TDJLhep2jjulPCESNnY/Ktt2gmyROKy7ojJL1igtDKQG
	JjPspkVJE45wHkJsTamIvhIDCDBHvi27VU03yaZ1XhQBSnzH4cHFev7mM1vSdVvzeYMjgjwC7l0eD
	9BLWZe1AFI/W23Y/+ZQtMVos5bya1FNxiS4tbdNsehvOyOiMTk12vSqGv+tvZUTMuOO1n6GFtvSk6
	HabHVSrsoiZymVzrHTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP4TO-009Lfo-H2; Mon, 06 Feb 2023 16:36:06 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP4TJ-009LeT-O0
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 16:36:04 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9B8E324E01A;
	Tue,  7 Feb 2023 00:35:48 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 00:35:48 +0800
Received: from [172.16.16.234] (113.72.145.145) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 00:35:47 +0800
Message-ID: <a365f918-5a99-c9ed-d925-895de5969358@starfivetech.com>
Date: Tue, 7 Feb 2023 00:35:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/4] dt-bindings: pinctrl: Add StarFive JH7110 aon
 pinctrl
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, <linux-gpio@vger.kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>, Andreas Schwab
	<schwab@suse.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <linux-riscv@lists.infradead.org>,
	"Linus Walleij" <linus.walleij@linaro.org>
References: <20230203141801.59083-1-hal.feng@starfivetech.com>
 <20230203141801.59083-3-hal.feng@starfivetech.com>
 <167569988090.161822.12197118549919509895.robh@kernel.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <167569988090.161822.12197118549919509895.robh@kernel.org>
X-Originating-IP: [113.72.145.145]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_083602_109356_5533FED4 
X-CRM114-Status: UNSURE (   8.16  )
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

On Mon, 6 Feb 2023 10:11:39 -0600, Rob Herring wrote:
> On Fri, 03 Feb 2023 22:17:59 +0800, Hal Feng wrote:
>> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>> 
>> Add pinctrl bindings for StarFive JH7110 SoC aon pinctrl controller.
>> 
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../pinctrl/starfive,jh7110-aon-pinctrl.yaml  | 123 ++++++++++++++++++
>>  .../pinctrl/starfive,jh7110-pinctrl.h         |  22 ++++
>>  2 files changed, 145 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
>> 
> 
> With the issue noted fixed:
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Will fix accordingly. Thank you again for spending time to review.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
