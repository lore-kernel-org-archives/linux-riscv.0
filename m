Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB41AC77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 02:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vE/f9j5bINXBL8gcYfwkEE/XlrUHOy0b1bg1lLFejlw=; b=qQFY1AeRcJW8yK
	Gr2e5O/driiCCfvp/leTHB8PQ4/ZVv2K95QKN7Q1PkurBzT23uZBQwSTlE+rZJqPOqlMum2v/dHLf
	O5m/Pt4L1Xzyvuip/kbmylHGxmpkoytkJVqNiO9jNwYVEvMdhGV/xOfewCI3jUadHOhIQX/LxP1Ji
	BCBI5/MM8Ml63QcmnEgdCau0j7tQljZPkvtxzOcHbzI4m0kW+gSdfKhDnSf097tYZwCbKSMcyJGMi
	EeYJdHwMXjho0j2/lgFF50fuoj7o+uldtYe6fERLKqwGgeUe06U4vES4ZUFygG990MjlzD4YkFo6y
	5sGKN/2QOG84StdHaaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvqs3-00H3DS-0i;
	Mon, 08 May 2023 02:45:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvqrz-00H39n-38
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 02:45:02 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4CCD524DBC2;
	Mon,  8 May 2023 10:44:33 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 8 May
 2023 10:44:33 +0800
Received: from [192.168.125.124] (183.27.98.219) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 8 May
 2023 10:44:32 +0800
Message-ID: <54494959-f2cb-d962-ca27-d5d08e70da93@starfivetech.com>
Date: Mon, 8 May 2023 10:44:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/3] dt-bindings: sound: Add TDM for StarFive JH7110
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-2-walker.chen@starfivetech.com>
 <ZFhQujhpbt/7yGGc@finisterre.sirena.org.uk>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <ZFhQujhpbt/7yGGc@finisterre.sirena.org.uk>
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_194500_160629_6340A6BC 
X-CRM114-Status: UNSURE (   8.65  )
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



On 2023/5/8 9:30, Mark Brown wrote:
> On Sat, May 06, 2023 at 05:01:14PM +0800, Walker Chen wrote:
>> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks for your reminder, I will pay attention to this when submitting
 patches in the future.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
