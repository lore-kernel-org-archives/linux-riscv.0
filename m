Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED71C54EAA
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 01:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJLDv9AdUQZcEDFgS5JzcGHd20Z0g1HlQfwJ367r7Kw=; b=bApDcKYCG1sNOY
	JeykRYfgGnEtwtbTNRIzcUZdqlKdCfblmbGGMFS0nBeAwS9XWuFMcRL4SwWKlTNCghvDzrjCBuv3U
	5GOBG901QpviePpXrEucsAo+Riq9q1PLYh4xjnEkAgVMoGDB+b7wwFhLd0lgeVM1oDV0ZRmC4io9O
	44FScVQvKJa1EQTe8E8aGXghzvZZIVxyHkEOXarP46bqkKLhNa/9Z3rp3rS3bdFj3CYI16VF/uWbB
	jXFAZZD1vE65CwxS3iOor/B1mSX/qklx5ek4LPi8XYb8AMmBeFAMid/FZTbltBGyUE72pPhD3qZWk
	ELIDsUaIdzJAaO6+HhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMf0E-005xS0-Va; Tue, 31 Jan 2023 01:00:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMf0A-005xND-T1
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 01:00:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A8DAD24E115;
	Tue, 31 Jan 2023 08:59:13 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Jan
 2023 08:59:13 +0800
Received: from [172.16.16.234] (183.27.99.60) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Jan
 2023 08:59:12 +0800
Message-ID: <6e332748-9cef-7f7d-1390-6b90a04b3ce0@starfivetech.com>
Date: Tue, 31 Jan 2023 08:59:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/5] Basic pinctrl support for StarFive JH7110 RISC-V
 SoC
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20221220005529.34744-1-hal.feng@starfivetech.com>
X-Originating-IP: [183.27.99.60]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_165959_117612_33274476 
X-CRM114-Status: UNSURE (   7.08  )
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

On Tue, 20 Dec 2022 08:55:24 +0800, Hal Feng wrote:
> This patch series adds basic pinctrl support for StarFive JH7110 SoC.
> You can simply get or review the patches at the link [1].
> 
> [1]: https://github.com/hal-feng/linux/commits/visionfive2-minimal
> 

Hi, Linus,

Could you please help to review and give me some suggestions
for this patch series? Thank you for your time.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
