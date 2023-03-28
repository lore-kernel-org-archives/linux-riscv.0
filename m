Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12F2C76195
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 01:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Kc9qOLsbwAWKpk+eHX6+9Nw/TprhIUQdqW8zJJXFzI=; b=DimN32woy0E6L0
	EEI2Sa9SNVBL1PW3J/XM7WQAPPCcz25vq7mkzO9rr+NsHCJDiITaVhy8hMfqpzkhOSqXKN5zI7jtB
	vbC0vaSbPGbG/Mrv6aoeh0CirrhRK4f8gc404yN1Llu7D096HnuNSHP5vt3hFpKFs85oouPyZlTSD
	5iWOWb0gSPY7u3pmHWqIKn7kyR8eieLzKSraCUqlIneChQ6gnwXBtGudBg5GMiM+panCHQ2mipuh/
	4BbVWWYOadulHvwjhssR9o8l4EE2mPKHkvnjgQi7PhtlCZ0quv2He+mDE/3aJacDj0RcCfDmK1Yz/
	5PsZbvbf7PU8wKoApRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgyM8-00CnqL-0I;
	Tue, 28 Mar 2023 01:42:36 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgyM4-00CniJ-30
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 01:42:34 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3EFEE24E1CE;
	Tue, 28 Mar 2023 09:42:04 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 09:42:04 +0800
Received: from [192.168.125.74] (113.72.145.117) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 09:42:03 +0800
Message-ID: <a2aae3a9-1d72-0b35-68cf-8fa3d28517c9@starfivetech.com>
Date: Tue, 28 Mar 2023 09:42:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 00/21] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <29ba8a8d-940d-4b49-bd86-5cd5df002c23@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <29ba8a8d-940d-4b49-bd86-5cd5df002c23@spud>
X-Originating-IP: [113.72.145.117]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_184233_127523_F3B3D678 
X-CRM114-Status: GOOD (  11.63  )
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

On Mon, 27 Mar 2023 23:50:18 +0100, Conor Dooley wrote:
> Hey Hal,
> 
> On Mon, Mar 20, 2023 at 06:37:29PM +0800, Hal Feng wrote:
>> This patch series adds basic clock, reset & DT support for StarFive
>> JH7110 SoC.
> 
> Probably obvious at this point given the number of outstanding comments
> on this version, but I'm gonna mark this series as "Changes Requested"
> on the RISC-V patchwork. I'm not sure what Stephen's cutoff for stuff is,
> but I'd like to have stuff ready to go to Arnd for -rc6, so you still
> have some time for another revision I think :)

Thanks for reminding. I will submit the next revision today or tomorrow.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
