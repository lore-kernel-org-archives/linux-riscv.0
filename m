Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79556C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 07:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGlc5OesvyyVAsLTvLw8Q1d3QgzuGS40rZ2Nh5w/nWY=; b=AstYHjDu6ZOkn2
	2SXgK1qaPVrQ3uG0q/FtuwVoRi9lyhVtULp3u7AIXaRs7QGDqtHvMR5n2KWdAZGCcqs+DKzWWdyWM
	vDWckl+KTQ2spOQYiP72R8g58ev8bj/zXvsYac4PGJmjuK+EVO1M3OAuP7srkJDwfymh03XhgI5Yv
	oKqWYq46pIcXLhm2YbNttloohvLLv/epN7udUQJU10FA/PegR+gFHkJidqbdMoiuxOXaId96ePiJw
	AC0byM1gb+wzsk5L+eRCoZu/pWZKFek7kDa1f5AUj6H1NtjNDUniAD1h0PGttDzBewTXNc7j/IDzo
	19OVO/Jc7qqs7kcXTHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1jJe-006sIX-Np; Sun, 04 Dec 2022 07:21:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1jJZ-006sFs-Qh
	for linux-riscv@lists.infradead.org; Sun, 04 Dec 2022 07:21:33 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DCF1824DC31;
	Sun,  4 Dec 2022 15:20:36 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 4 Dec
 2022 15:20:37 +0800
Received: from [192.168.0.111] (183.27.98.23) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 4 Dec
 2022 15:20:35 +0800
Message-ID: <84b119e1-19b5-65ae-d002-98ceab6cd5ef@starfivetech.com>
Date: Sun, 4 Dec 2022 15:20:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
To: Palmer Dabbelt <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Ben Dooks <ben.dooks@sifive.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd
	<sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	"Emil Renner Berthing" <emil.renner.berthing@canonical.com>, Marc Zyngier
	<maz@kernel.org>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-9-hal.feng@starfivetech.com>
 <167000658679.29055.15185601584520551755.b4-ty@rivosinc.com>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <167000658679.29055.15185601584520551755.b4-ty@rivosinc.com>
X-Originating-IP: [183.27.98.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_232130_028883_501BED0C 
X-CRM114-Status: UNSURE (   7.08  )
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

On Fri, 02 Dec 2022 10:43:06 -0800, Palmer Dabbelt wrote:
> On Fri, 18 Nov 2022 09:17:14 +0800, Hal Feng wrote:
> > Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
> > StarFive JH7110 and JH7100 SoCs to boot with serial ports.
> > 
> > 
> 
> Applied, thanks!

Thank you so much!

Best regards,
Hal

> 
> [8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
>       https://git.kernel.org/palmer/c/6925ba3d9b8c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
