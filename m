Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C145C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFY4mFRgoj8DrPwPsRyMElJpiPt3reksEaLFG6EjHYk=; b=mrYMdgtKlQt5Fe
	LqIvAaXU7DmUr5TVkiNn8yyNSjC9B/3AUoIaAxa48bKIK+FBkH6JzbWzkuRWV0tDk76GGkWb/8pMc
	vgPVzZipe4Kwdm65IpbcTpp+TYQwU71Hspb0zKG9rNQU2ZJOCy6ZQ4GQbcyYmmx3/zvU+7gXPJG5v
	Xyl5LCZISbZN5jaJmAeFIc+OkLF8TX8feIfqIBn9muQRoxgkLqtcA3BbSHLrfYUyJDvGSbm91Soa1
	r9a4XWV/sHfoon5zlrScWvneQOamY300jKgNlTJZx1K4XPbbLMJtLsc42Rj94KzqQf1w6miHpKQm8
	xCbqCf7u24v7ksqRdZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovvdi-002UuS-5A; Fri, 18 Nov 2022 07:18:18 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovvdd-002UtS-Os
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 07:18:16 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7B43824E25D;
	Fri, 18 Nov 2022 15:17:40 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 15:17:40 +0800
Received: from [192.168.50.235] (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 15:17:39 +0800
Message-ID: <4db38c2e-49b5-81fc-bfda-bef61860e411@starfivetech.com>
Date: Fri, 18 Nov 2022 15:17:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 0/5] Basic pinctrl support for StarFive JH7110 RISC-V
 SoC
Content-Language: en-US
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20221118011108.70715-1-hal.feng@starfivetech.com>
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_231813_971313_58C511F1 
X-CRM114-Status: UNSURE (   7.17  )
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

On Fri, 18 Nov 2022 09:11:03 +0800, Hal Feng wrote:
> The original patch series "Basic StarFive JH7110 RISC-V SoC support" [1]
> is split into 3 patch series. They respectively add basic clock&reset,
> pinctrl and device tree support for StarFive JH7110 SoC. These patch
> series are independent, but the Visionfive2 board can boot up successfully

Note that this patch series depends on the patch series [1].

[1] https://lore.kernel.org/all/20221118010627.70576-1-hal.feng@starfivetech.com/

> only if all these patches series applied. This one adds basic pinctrl


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
