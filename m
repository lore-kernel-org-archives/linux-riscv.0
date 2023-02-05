Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB2DC636CD
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbNj/LYXZLsHFLNWclwFXHkw2S1Z+5YwlWOWJxEYgS4=; b=DeCa24tHaZyOqL
	yiadSOjvN7Z3tDcoJ2ebKfF11dKXOR6be2k5s4KOC4s2GHtfB8WNOJuxSD7w1x29vO3KFCWGLFKL8
	dO0ilWW3iTUWJmWFRykXLid0FhXhggb4l67Bxp+Y1JWxtdbJw/U4CB3OGyCsD6UeNv8hm/H3IgpQn
	IWWtF/Lm2NsDesLXdxniPwK9uIk+lQpwYWxK052P+1uEvifh8910UwIHlllISGIHefDhheumSm+cR
	4fii4MRPrUNCaFbNu/flDnSgjTGcGJdyB5Rc4V68c4kWs0lewhcmop1pxIhe+45ik2QB0zSWaNH4z
	09hGIwgpI/03NZulkL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pObzq-006Emv-I8; Sun, 05 Feb 2023 10:11:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pObzo-006EmV-08
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 10:11:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C91D60B5A;
	Sun,  5 Feb 2023 10:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D571CC433D2;
	Sun,  5 Feb 2023 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675591897;
	bh=BZ28gvdiTkc7YTOSLd75uiAxygPFFmTcSTP6m1bNxqs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DpiNPO/yo5p53P1JPencToMQjHKsTJ2kFzL2hGhgxgp4fJZZUUwNe31e8lY4Cf0KJ
	 WIbEcuqmFc+Qryf6VCwPtT4IToJOjRWgHQCx4eQkQtuHcZE/m+IAPcsDEiCw2mJjOb
	 uCrT1ZnjIoROaZeCjSd95FBq3qTnj1Pztve7TFs6Y0kAAgf+sQOelHQL+Q2g2um7U+
	 Mu0CP3FGNzIipUTlUjANWW/qtuFTRzHL+EotFiWyOgaNsZ596no76pD0KdV8lJ1BPN
	 ciMLUQAg3JYhyLsO3dVUbBvVd47kq0vnVA3d5pK3QOSj2iAyCL5BXHTqgAUa9Y5JQi
	 g53qXWVGkCdog==
Date: Sun, 05 Feb 2023 11:11:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
CC: yanhong wang <yanhong.wang@starfivetech.com>, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v4 0/7] Add Ethernet driver for StarFive JH7110 SoC
User-Agent: K-9 Mail for Android
In-Reply-To: <Y96S/MMzC92cOkbX@lunn.ch>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com> <Y8h/D7I7/2KhgM00@spud> <81217dc9-5673-f7eb-3114-b39de8302687@starfivetech.com> <958E7B1C-E0FF-416A-85AD-783682BA8B54@kernel.org> <Y96S/MMzC92cOkbX@lunn.ch>
Message-ID: <4C150A01-7FB3-4609-8B8E-6F6023CC22AF@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_021140_124073_97A11542 
X-CRM114-Status: UNSURE (   9.21  )
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



On 4 February 2023 18:16:44 GMT+01:00, Andrew Lunn <andrew@lunn.ch> wrote:
>> >For the patchs of yt8531, see [1]
>> >
>> >1 - https://patchwork.kernel.org/project/netdevbpf/cover/20230202030037.9075-1-Frank.Sae@motor-comm.com/
>> 
>> Please put that info into the cover of the next round of your submission then.
>
>These patches just got merged, so it is less of an issue now. Just
>make sure you are testing with net-next.

Oh, cool. Water under the bridge so.
Sorry for the noise!

>You might need an updated DT blob, the binding for the PHY had a few
>changes between the initial version to what actually got merged.

Cool, thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
