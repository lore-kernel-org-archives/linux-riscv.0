Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31864C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 01:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmJ4I1j/EcORpbK0qYRMadRILLXLC32KNoSl1a6H5A8=; b=TLNzBuZR6/Q2sL
	t+8a4g4LlMyay4FwO1AOF5abthTHbTF8VMjWNl4Ky0n+FMMxiWVNu2FadapkR9x2zYC4bIfYpeQhI
	hyTr8uXyoBV+NF7cBNnsDw4e6NbwKpCvvGRhL79AU5evRSFL/4vkn82viNfdrKOyVCQbqkaQIM9Cc
	XVce9mK1i3SP3yq1Cej4h8yOuPYs8V7D+ert/xXwAJmkvCkWWHzbqSDAtUw61A/LctxXGACbR43dQ
	c6lK2b3t/HCEzvpf5ye/ansaajPIOfWDCBvCQrDjxbjPNnbRYr6iUIWgrFwMhvzLditmBtfdO9/Yk
	TeFyuk8aOGoTgVztn84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcG0A-00Bxv4-07;
	Wed, 15 Mar 2023 01:32:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcG06-00Bxpz-32
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 01:32:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E384F24E2A5;
	Wed, 15 Mar 2023 09:31:42 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 09:31:42 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 09:31:41 +0800
Message-ID: <51102144-1533-d2f7-5fde-e01160a6f49e@starfivetech.com>
Date: Wed, 15 Mar 2023 09:31:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis
	<pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230313034645.5469-1-samin.guo@starfivetech.com>
 <20230313173330.797bf8e7@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230313173330.797bf8e7@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_183223_186411_499E8A71 
X-CRM114-Status: UNSURE (   7.68  )
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

Re: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
From: Jakub Kicinski <kuba@kernel.org>
to: Samin Guo <samin.guo@starfivetech.com>
data: 2023/3/14

> On Mon, 13 Mar 2023 11:46:37 +0800 Samin Guo wrote:
>> This series adds ethernet support for the StarFive JH7110 RISC-V SoC.
>> The series includes MAC driver. The MAC version is dwmac-5.20 (from
>> Synopsys DesignWare). For more information and support, you can visit
>> RVspace wiki[1].
> 
> I'm guessing the first 6 patches need to go via networking and patches
> 7 and 8 via riscv trees? Please repost those separately, otherwise
> the series won't apply and relevant CIs can't run on it.

Hi Jakub,

	Thanks a lot, I will repost those separately.

Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
