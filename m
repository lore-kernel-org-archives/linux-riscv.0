Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C3DC636CD
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 02:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl9So0RGDjmvxMIXxH7GOBSzqJMCqKoE0qE4ed5Nd14=; b=BvQW6aNq8xzYgN
	AQrSXNfx2KgexNZpkxrbZNgWLk/MC3BdIi9wr1MOv+opoBoUPe/K+jX5PPI0cJFibB+d9AMHnsBzx
	mcgmubCKfgEFM0lBtweWC0n1euQJuKJxY8Vek+2S1gE3btqOiN8A9x/9Fdh+T1UmiJxK2HcSsoTL+
	AU5UWw5EmlUPBlbR1wD13C1xtTv8RjWN0itaNEi1+ljycLIcea6irZxoQYnPOIkGzNXQZtOyUwOOx
	xtUgDkuGMsd0oR6+/UyUuWTGRUhHVk1izX+n2Whmh7RVI7Plm175MNaP+mBzKc0WPMxSVzQcFwB/3
	DEdZoG9oQARTwoENIX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPaFs-00DrQA-IO; Wed, 08 Feb 2023 02:32:16 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPaFp-00DrN1-As
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 02:32:15 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EEF6B24E20C;
	Wed,  8 Feb 2023 10:31:36 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Feb
 2023 10:31:37 +0800
Received: from [192.168.125.110] (183.27.96.33) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Feb
 2023 10:31:36 +0800
Message-ID: <87e31545-3107-1cc2-fc93-197f66712ccc@starfivetech.com>
Date: Wed, 8 Feb 2023 10:31:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 0/4] Basic pinctrl support for StarFive JH7110 RISC-V
 SoC
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Andreas Schwab
	<schwab@suse.de>, Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
References: <20230203141801.59083-1-hal.feng@starfivetech.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230203141801.59083-1-hal.feng@starfivetech.com>
X-Originating-IP: [183.27.96.33]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_183213_544226_4AB72630 
X-CRM114-Status: UNSURE (   9.88  )
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

On Fri, 3 Feb 2023 22:17:57 +0800, Hal Feng wrote:
> This patch series adds basic pinctrl support for StarFive JH7110 SoC.
> 
> Changes since v3:
> - Rebased on Linus's "devel" branch of linux-pinctrl repo, which was based on
>   on tag v6.2-rc1.
> - Dropped patch 1.
> Patch 2 & 3:
> - Added a reference for '-pins$' patternProperties.
> - Put "additionalProperties: false" before properties section. (by Rob)
> - Improved the description.
> - Changed the node name in examples from "gpio" to "pinctrl".
> Patch 4:
> - Added some missing headers. (by Andreas)
> 
>   v3: https://lore.kernel.org/all/20221220005529.34744-1-hal.feng@starfivetech.com/

Hi, Linus,

I have resent the patches rebased on your "devel" branch. Rob has added
Reviewed-by tags for DT bindings, but the DT binding patches still need
to be modified a little bit. Could you apply this series if I modify the
DT bindings patches and resend as v5? Or it need another round of review?

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
