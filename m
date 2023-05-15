Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8287C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlFXVLHESy3G+e5xwcWZYAmdqEAnwHH+lJ+ygrWMHNs=; b=3PyjYKealjwhfZ
	w3n/qGpqatbTbSGGWPXSeu3fQm3C5BUCn+nUxdcTri4iS2naMjNU+pnup9yhZLICCPO1MhLC3R/Ig
	UKgGqKNdr6VBq6aO3HEm33uihpTNO+bSzYUp123ziHe40MygkPp6PEPI+jgTNUpV5r/HXr2PP4AlP
	LS6k+2c2dlAi7sxk5ZYkKGOqcHVCZz/vejYDcgk4KoI7JcK6ht0MhQbNEW1QlLQkGCFDvaHHaXnBV
	fH0XeMOc1Oku+dSzEezRa7fdSACdc+i0z+RZBUPb3FCu/6Tft5D0823aT6o3ckPJwpD/n7fa6b9GB
	XdkiodnVcbb5WLR2lvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyTa9-001Pqx-2n;
	Mon, 15 May 2023 08:29:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyTa5-001Ppx-1X
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 08:29:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B2F0A24E1B5;
	Mon, 15 May 2023 16:29:08 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 16:29:08 +0800
Received: from [192.168.125.124] (113.72.146.187) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 16:29:07 +0800
Message-ID: <21bc5b06-3d3e-5a30-a90d-ea9f7abc6575@starfivetech.com>
Date: Mon, 15 May 2023 16:29:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/3] ASoC: starfive: Add JH7110 TDM driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-3-walker.chen@starfivetech.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230511091549.28003-3-walker.chen@starfivetech.com>
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_012921_667831_2F1B22EF 
X-CRM114-Status: UNSURE (   9.84  )
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


On 2023/5/11 17:15, Walker Chen wrote:
> Add tdm driver support for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  MAINTAINERS                     |   6 +
>  sound/soc/Kconfig               |   1 +
>  sound/soc/Makefile              |   1 +
>  sound/soc/starfive/Kconfig      |  15 +
>  sound/soc/starfive/Makefile     |   2 +
>  sound/soc/starfive/jh7110_tdm.c | 554 ++++++++++++++++++++++++++++++++
>  sound/soc/starfive/jh7110_tdm.h | 138 ++++++++
>  7 files changed, 717 insertions(+)
>  create mode 100644 sound/soc/starfive/Kconfig
>  create mode 100644 sound/soc/starfive/Makefile
>  create mode 100644 sound/soc/starfive/jh7110_tdm.c
>  create mode 100644 sound/soc/starfive/jh7110_tdm.h
> 

Hi Mark / Claudiu,

I have submitted new version of patch for TDM driver. Could you please help to review and give your comments? 
Thanks a lot!

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
