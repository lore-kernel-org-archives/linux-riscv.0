Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA84C636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqC5F2dVdFbrmaVpDrVqwuKsMfCbjQ4kQ3rLW1JQU3U=; b=jv8SpNOWzeDSJE
	N+MKGBX9f2Uc49+fEreTrm71fIDvzb1GoVCDZNC6J4ei/UsA33suOexmcRl8Awk5k3HFPNKQgyz9m
	UR9dtrJoNYIrtMCclJ26zTmGG8Z/yWmfjtTnXhRumNXoK6L8CV3OApdKpUgr3RwOMvod0oHGCdt8F
	prR1b4QUWeeUG7NEzLfJPrx06CyV1wYHBvIky+ANHi9gzAbwVOOtBMDHlM0+JpynIxICbvXwLtB8f
	vEMpMye8lcWgVxj40tQeiWPB3D9rSiA7sPGJaBXHmHqOKd/ryDADSwaYb3af78sub28d40OHbqxBG
	J09TpwUkU34YkVluFmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqZt-000oIQ-GU; Fri, 03 Feb 2023 07:33:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqZp-000oGn-Gf
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:33:44 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C0B0E24E1E4;
	Fri,  3 Feb 2023 15:33:26 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 15:33:26 +0800
Received: from [192.168.125.110] (113.72.144.84) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 15:33:25 +0800
Message-ID: <90091c73-70ee-8fb6-50c6-9631aedc8425@starfivetech.com>
Date: Fri, 3 Feb 2023 15:33:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 0/5] Basic pinctrl support for StarFive JH7110 RISC-V
 SoC
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
 <CACRpkdbU=Y_LVBfSctQULzFuo4tB9KxgFbv=JGHPuuok6jC8FQ@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CACRpkdbU=Y_LVBfSctQULzFuo4tB9KxgFbv=JGHPuuok6jC8FQ@mail.gmail.com>
X-Originating-IP: [113.72.144.84]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_233341_876748_38DF4FDA 
X-CRM114-Status: GOOD (  19.38  )
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

On Tue, 31 Jan 2023 14:13:44 +0100, Linus Walleij wrote:
> On Tue, Dec 20, 2022 at 1:55 AM Hal Feng <hal.feng@starfivetech.com> wrote:
> 
>> This patch series adds basic pinctrl support for StarFive JH7110 SoC.
>> You can simply get or review the patches at the link [1].
>>
>> [1]: https://github.com/hal-feng/linux/commits/visionfive2-minimal
>>
>> Changes since v2:
>> - Rebased on tag v6.1.
> 
> Overall this looks OK, the DT bindings does not have any review from
> the DT people but I think they had enough time to do that and were
> properly CC:ed so not your fault.
> 
> However when I try to apply this to the pinctrl tree it fails,
> for example it seems to depend on an entry in MAINTAINERS
> which isn't upstream.
> 
> Can you please rebase the patches that are supposed to be
> applied to the pinctrl tree (for example normally not patch 1, the DTS
> patch) on my "devel" branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

I will drop the patch 1 and rebase the patches on your "devel" branch.
I will resend patch 1 after the device tree patches about StarFive JH7110 [1]
are merged.

[1] https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/

Thank you for spending time to review this series.

Best regards,
Hal

> 
> If you resend this quickly I can apply it pronto.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
