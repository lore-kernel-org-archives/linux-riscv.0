Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135F5C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7lj1dODcIsQpxf4q1yCFpRWdswwkQKPpEJ3xJOwXQE=; b=rdnd6iF0nb5Kcl
	boRXOV4Az7RU6dm9AnUUFY22rEOpx0RSvlyDppvngsL7sskLbwgz4sMkxZzIWBak3EyH1F1AuuAln
	L30i7mPW+75a9C06UKlYh0wdxSiYUr/dxE+B1PIgfBcAXlXizTAUBWkepiJWUvmIBeV3Oy/7jJbJm
	SZKX1odvMXovRKo2Ke7mXjH2DhRCX/CdM4sDO9EgSn7jWxUs/ANNZGjTHuS6rQksqNMMQDWdnnBD8
	rk/ko2k4puLDfnpSO0ccyecNN51xD4uF5nbIhQ9S563+V45LKXCtbsage3bqYeVPxWZN8V9+Dt+3r
	6RZs3q7ESHwDyP7V8V3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HKz-00Gdpa-2a;
	Wed, 31 May 2023 08:37:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HKw-00GdoG-0l
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 08:37:44 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D901424E1CF;
	Wed, 31 May 2023 16:36:58 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 16:36:58 +0800
Received: from [192.168.125.80] (113.72.147.198) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 16:36:58 +0800
Message-ID: <c0e42907-8495-a53f-783e-d9575250ae4d@starfivetech.com>
Date: Wed, 31 May 2023 16:36:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 08/11] reset: starfive: jh7110: Add StarFive
 STG/ISP/VOUT resets support
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
 <20230518101234.143748-9-xingyu.wu@starfivetech.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230518101234.143748-9-xingyu.wu@starfivetech.com>
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_013742_440255_82A1B7C1 
X-CRM114-Status: UNSURE (   5.63  )
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

On Thu, 18 May 2023 18:12:31 +0800, Xingyu Wu wrote:
> Add new struct members and auxiliary_device_id of resets to support
> System-Top-Group, Image-Signal-Process and Video-Output on the StarFive
> JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
