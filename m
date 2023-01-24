Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E13AC25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 05:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/uG8Ug8jqdWE8aBfTbPUZ9WWR/S+LAMTdb8yYz5sIc=; b=kkLmNMOvn0Ron7
	OII40IcQGFsHW9eoHSpMFbZFyClbr3N3C5qC+wzQrfCAw6Zsggb0g5ajElGQWLlXAktAHc8YJOv6N
	zhZdH9RLf399XqYgTAwgOdQNR8eiU8JYTW4vnbEWacr82xNRIszv2vtuGhSj4Oe0hR25xOKuKskDJ
	7dy8ATNo1ZZQXIOYtug+9vGVHvOEF6jr+cCkrfYTPVxeOgVja5VizSgl5ilRF8lko3cTZ3ehnswtY
	RJxwqLV/g8dcfa5yxzJUmvZ3zsTW9mNYylvSPvrS9q0bL+WAk5GJD5PzySFh2TDQESlleoyWETsX1
	rvbL9F44Ayx+TkLGBGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKBr6-002Mg1-5z; Tue, 24 Jan 2023 05:28:24 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKBr2-002Mf4-Ig
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 05:28:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B821724E309;
	Tue, 24 Jan 2023 13:27:47 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 24 Jan
 2023 13:27:47 +0800
Received: from [192.168.125.95] (183.27.96.38) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 24 Jan
 2023 13:27:46 +0800
Message-ID: <65d7d5fc-e803-49a2-3d72-9c0cac87af4a@starfivetech.com>
Date: Tue, 24 Jan 2023 13:27:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/2] dt-bindings: power: Add starfive,jh7110-pmu
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, <linux-riscv@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230119094447.21939-1-walker.chen@starfivetech.com>
 <20230119094447.21939-2-walker.chen@starfivetech.com>
 <202301240500.30O50FJV072625@SH1-CSMTP-DB111.sundns.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <202301240500.30O50FJV072625@SH1-CSMTP-DB111.sundns.com>
X-Originating-IP: [183.27.96.38]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_212820_813926_312019FD 
X-CRM114-Status: UNSURE (   6.31  )
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

On 2023/1/19 19:59, Heiko Stuebner wrote:
> Am Donnerstag, 19. Januar 2023, 10:44:46 CET schrieb Walker Chen:
>> Add bindings for the Power Management Unit on the StarFive JH7110 SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thank you very much for your support!

Best regards,
Walker


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
