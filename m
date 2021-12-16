Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5CAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 04:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soGfhe/+SktBzv13Lno+Ltpbm3uBZI+Lg1Vyq0CVXp4=; b=Z40kycBUqP04Ey
	I6EDmhFOACeckmg6hFRFi9dLMaWR+H8Cn5dFu9YHcdHFgPgepgGYJJozNYLPJ0cp0Q5XAj/zHrS3y
	ulrx1wgHvZAceRIp0gOudaxB0tUjzI6AYY/xU4sbQshvJzifH0U8LGDYy7JptunO/2KHEuU8u8WxY
	dL0QAwQfqnvUNEmCRuaZK7ceoAqVJnau7os/taAupSdhP3J0OcocLLW5Fo0jM4izd0rOPtWLRijbE
	0DbwsdjpHox9UE6d1EkLUFvweH/1AUXmKrH6zkrvOv0Ta3Iawb6pA/EHG0dY1U9zA5KQmG3aZsUze
	tTs5Rm1K6jySxeZ2VhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxiUV-003Y1y-Ve; Thu, 16 Dec 2021 04:35:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxiUT-003Y1e-VT
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 04:35:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53C3761C31;
 Thu, 16 Dec 2021 04:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5ABAC36AE3;
 Thu, 16 Dec 2021 04:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639629336;
 bh=y9QOFaHTSntjEd1BcEK7/c1Zltf72qo8zEU0NPs5vVg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gfyhz1hDgi7s41XdwKJJvPdJiT3I/+kzGCkoFWphA+s/PSWz1E/1L5kwF0rb9XBvp
 24Q3+h3bU1o3lTWb6Y8K4N9RCsOGS4RIV+PX/yVfbxaUeMC5n5Yei/1oAVg6CIL2qO
 rCmObBbNzrzH4ZzfzVxldVZzI6LAj3IvjnTLJ3d+H7ySqQEr2SrA2HTk/MCpnXGmXD
 Dxc2VT/Ni12LHvBY4vS5vpNAcpozAUMj2zk1F6/tMlu+8IDmdQXxbJN0ZTFPSjtQq4
 T3NLD3RAPiEKpanDRkp8fBOkcdX8OSFhbJ9ddUjaxSxKn5ynQVrkGE6GFXAcVV37W0
 Z680YFEL7o2ig==
MIME-Version: 1.0
In-Reply-To: <20211116150119.2171-5-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
 <20211116150119.2171-5-kernel@esmil.dk>
Subject: Re: [PATCH v4 04/16] dt-bindings: clock: starfive: Add JH7100 clock
 definitions
From: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Matteo Croce <mcroce@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Date: Wed, 15 Dec 2021 20:35:35 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216043536.A5ABAC36AE3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_203538_076493_B93D79F8 
X-CRM114-Status: UNSURE (   9.27  )
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

Quoting Emil Renner Berthing (2021-11-16 07:01:07)
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add all clock outputs for the StarFive JH7100 clock generator.
> 
> Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
> to all definitions.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
