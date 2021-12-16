Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B53BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 04:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlNul5ajfD/e7Bhl2TcY3U4A2gymmRmMTa5AhMa5jjg=; b=3dG0q9ijtyonUF
	mdHHiYS50hbCo01MuldEknP9mHkCx0JBe2txKNfhVwHCispCJkRJYOqQWj72Jpiot/bp0JdNJDAso
	qo0MQCUU43RyWcMyAFsRUsAwFbTimaGuNXDbkBSi3gvSYbxnUT+/Sm1EjLlNVZLpwoJmexpmNaKLs
	aPVQcyMR9TPqf3CQKJXl1+pCedu+bHD3pUQVQvyYzvvEyYBLDn40V9cFIZQQH5I6g42g8stW5GfUH
	I8A0z7eA3BfqenY5rzbi0ccdzLC6qL39VUm+3WciKqt5fYvDyQkgHhvKtWSbaWDvlWcGfxKY0g2Z1
	24gx3ROI4EbRov9ReKAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxiUi-003Y3X-SE; Thu, 16 Dec 2021 04:35:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxiUf-003Y30-Ed
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 04:35:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1199BB82208;
 Thu, 16 Dec 2021 04:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE246C36AE0;
 Thu, 16 Dec 2021 04:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639629346;
 bh=y79COlb2nj+djtDCDbx7LTCD32j+1RJcU7XjiBJeA0s=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=N0i8uGCoqxbQoYosgINaC0cXUYrJB4Hokz2ejKlsTkT9xrHTqfilzGU1jLjXx1LZ/
 Lrv2XuseLAF3xKKkP8WTLLqXALV9TfdLrZxUPSNrZt65YzGhR+4R7119jv3PCbWk33
 KvHEKaTWhmNgjpLEuaIUmIjXhCQRVyZnw5N7U4Yj10oUwnUdPNzjLCOR0z0QxGCr0h
 KeQeVsYcQDYjuGKn5Esi9fgQo17fX7UMic9YunF+4URIt/1RU1W0de3Mnj/5dyU315
 txAhsglMusOrPK1BpD8MSCRDUCOod4/xYnP8dYBuOK/bGCRKopSO+sZZrTu3zNuESd
 SZKy3vM/RP7jA==
MIME-Version: 1.0
In-Reply-To: <20211116150119.2171-6-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
 <20211116150119.2171-6-kernel@esmil.dk>
Subject: Re: [PATCH v4 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
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
Date: Wed, 15 Dec 2021 20:35:45 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216043546.BE246C36AE0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_203549_652247_5ED39BE8 
X-CRM114-Status: UNSURE (   9.42  )
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

Quoting Emil Renner Berthing (2021-11-16 07:01:08)
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add bindings for the clock generator on the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
