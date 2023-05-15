Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E54C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVmGem4gnvC82kl3Ru1cw+BFFHRRF7NxSXxX0wsqxdk=; b=jsPSpPluix/F1o
	0QVmMNyBfCUueMj3Swd3PqeMcqSHtTCybz2kSIU53FQu63QISpA/0o+GYZJX3EpNg88F2OjY/G9kL
	UHS8dacisrJcBOAHbEb70p6Z68OkBlRODk0vShoFnzqzV30ssSdBa5NDNEPlRSo+S+sY+ZSGwocdl
	hqiTOBldSbs8EHH5fLsHSZTV6p63/wsUi0SoY5qrAmnnC778mpYKzS8/WIgEHd8aX3WNEsbAOMRjG
	WEJLvJZ5zxBwGpbRWpgDVrx3/EXY2sjLqSrvMyhlnmjYkK41fd8Hwflc9jR/BxgnHOsPmpaVyXDiW
	m5wbazAhGfj8UC3vvWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyXcc-0029z8-2i;
	Mon, 15 May 2023 12:48:14 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyXcY-0029ve-0K
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 12:48:13 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 41255807C;
	Mon, 15 May 2023 20:47:35 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 20:47:35 +0800
Received: from [192.168.125.124] (113.72.146.187) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 20:47:34 +0800
Message-ID: <d6dad1e0-59f7-e78c-cb9b-28342fbf0fac@starfivetech.com>
Date: Mon, 15 May 2023 20:47:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/3] ASoC: starfive: Add JH7110 TDM driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-3-walker.chen@starfivetech.com>
 <21bc5b06-3d3e-5a30-a90d-ea9f7abc6575@starfivetech.com>
 <ZGIOmWyxPGOuWHx+@finisterre.sirena.org.uk>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <ZGIOmWyxPGOuWHx+@finisterre.sirena.org.uk>
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_054810_445211_8F569EC1 
X-CRM114-Status: GOOD (  13.85  )
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



On 2023/5/15 18:51, Mark Brown wrote:
> On Mon, May 15, 2023 at 04:29:07PM +0800, Walker Chen wrote:
> 
>> I have submitted new version of patch for TDM driver. Could you please help to review and give your comments? 
> 
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so 
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
> 
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.

Hi Mark,

Sorry for that! Please forgive me for asking so eagerly.
I will pay attention to this in the future.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
