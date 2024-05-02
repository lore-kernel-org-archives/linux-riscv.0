Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D77BC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7eGAd8AepPD91Jrj3bD3RctJ0qtffUH6J1oUrvsbyY=; b=KNzWY+GtYgaC94
	vsB4cyn5Mivyutwwk+UmW9dbodDk1W9gN79aCXkXioEhT1utDAI2HrrCLHu9RPvrA2b49WnsSee58
	nULo36cSBjZqMLws+XA4E+/eQxv2j/2+5XQEqrRRE4MqZ8p1pupc6L4Y1OdwdA8VV61pn6OORhAMO
	yUAyd0pc1MRdXDqdkMFO/GGguPmRo1TzLhbLooZnbVXW63O5G68ZQhuNTYyRa9zh9wo/AAb6i4Luo
	zdIq+177pLOG9VV4DWa+1xJcJ39ngKoFQtxV5r6g/s+u1cnXFN03Kef2S/ZjHMChTJhHEflHMOdpT
	J9hsC2D/jkTxWqF7XCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2RAU-0000000BrI8-0pg4;
	Thu, 02 May 2024 07:47:50 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2RAP-0000000BrFi-1sbu
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 07:47:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4183FF80E;
	Thu,  2 May 2024 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714636063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhXtmRv3kbKgnYd6PjMU3UqcLb0WMxLPFCLc04cLDYY=;
	b=dYnqEXt1YNKWgJZAg//9nAueSIXvkhnkrzXNziy64VRfhQRLC4LLmXKNJ4iTNKZgj+i1Ah
	GxjzyWJOQgMIy+NoiuBXRUz/FinD3VEmbMP5Z/Q/M5uGVP3mca94UcphgiPCz3T0yjdL1a
	/W78laTzvdpKnxmPkJwowz2Q70RJ/C8FsTQEXQz/9LDl7OdKXK2K2FSgs9caAGMDdWvhPE
	b6fy+SDXjwjtje5h+OOURmG8bnRzGBXBawFIGd4Vn+/tSVbRaO10S+L5rKiaC6VGEi7RkQ
	WRWQJnXnWYuMjK0NXPYUxzpaeGZVefX4Xfy2HRoKUEZ1NcqidPJ9TgxYgIaYnw==
Message-ID: <1444dac5-c725-4bf7-8843-469a62c3abf1@bootlin.com>
Date: Thu, 2 May 2024 09:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/4] riscv: dts: thead: Add clock to TH1520 mmc
 controllers
To: Drew Fustini <dfustini@tenstorrent.com>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
 <20240426-th1520-clk-v2-v2-4-96b829e6fcee@tenstorrent.com>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240426-th1520-clk-v2-v2-4-96b829e6fcee@tenstorrent.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_004745_675056_2F1ED049 
X-CRM114-Status: UNSURE (   6.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 4/27/24 2:10 AM, Drew Fustini wrote:
> Change the clock property in the T-Head TH1520 mmc controller nodes to a
> real clock provided by the AP_SUBSYS clock driver.
> 
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>

I experienced that, when the I2C clocks were correctly configured, the 
UART stopped working, likely due to their dependence on FOUTPOSTDIV.
Setting up the UART correctly, for instance:

                 uartx: serial@xxxxxxxxxx {
			...
                         clocks = <&clk CLK_UART_SCLK>, <&clk 
CLK_UARTX_PCLK>;
                         clock-names = "baudclk", "apb_pclk";
                         ...
			status = "disabled";
                 };
resolved the issue.
As this would be mandatory in the future, I suggest that you configure 
all the nodes currently set to a fixed clock, not just the MMC controller.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
