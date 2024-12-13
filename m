Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BB3E7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 19:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSaKKqZhuSO/SLAWUKkjAaoYhJRnYO4y3dGGI3CX9TA=; b=HvVW/Iz2sSMSn3
	6Fae3C4e09RyrtnO2LoTsqaiibgNO9p2T2/wCj9cPH2YMqDJIOs6MrHnq1fPmMYIqa2wHSe9KMUtP
	tkt5+Bg2IE3GY7zpN25pQoxeGnNcq9U8Mp5aqAq5wMWImnRPndrkI3DiF5nH6BN4SObz57yMgxzkb
	fYTjnViZv1NDWF3MwGKuEq7K+MrllH3b32FWuOC5/asHCaP/q2d9qDWYRn/4iwl+W2zxLsZ17BQNs
	qP/pSn//YAYTTh9Lx3WxLBgGU/SWlOZ6rlapquZJ3UIjSPbg35LK0Sff1GmlDnfyMd3L7mU9uuZuf
	UWljbFrQih/Q5tUYhkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBoA-00000004tpl-3SnP;
	Fri, 13 Dec 2024 19:58:42 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBo7-00000004toH-3Nac
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 19:58:41 +0000
Received: from [IPV6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46] (unknown [IPv6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 457CAB4B2F92;
	Fri, 13 Dec 2024 20:58:31 +0100 (CET)
Message-ID: <e4e19875-c02c-4673-814b-86090223b55d@freeshell.de>
Date: Fri, 13 Dec 2024 11:58:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: Fix a typo in StarFive JH7110 pin
 function definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241210042002.165297-1-e@freeshell.de>
 <oacmcw5yvdlsmvqbt4dbdmsx6rvd6x43qv2ejmypw57jgraqu7@txhhsxdg2agq>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <oacmcw5yvdlsmvqbt4dbdmsx6rvd6x43qv2ejmypw57jgraqu7@txhhsxdg2agq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_115839_989196_99BC3B33 
X-CRM114-Status: GOOD (  12.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 12/13/24 01:37, Krzysztof Kozlowski wrote:
> On Mon, Dec 09, 2024 at 08:19:56PM -0800, E Shattow wrote:
>> Fix a typo in StarFive JH7110 pin function definitions for GPOUT_SYS_SDIO1_DATA4
>>
>> Fixes: e22f09e598d12 ("riscv: dts: starfive: Add StarFive JH7110 pin function definitions")
>> Signed-off-by: E Shattow <e@freeshell.de>
>> Acked-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
> 
> Why are you sending the same multiple times? Where is the changelog and
> proper patch versioning?
> 
> Best regards,
> Krzysztof
> 

I did respond to Hal's comment that the patch is missing a commit title 
description and that I would re-send. How instead should the message be 
formatted so the patch commit title description is changed but the patch 
is not the same being sent multiple times?  And now, again, based on 
your comment that this is not a typo I will again change the commit 
description but I don't know how to do that without sending again as a 
duplicate.

Thank you for the review and for your patience with me when I am 
learning how to participate.

-E


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
