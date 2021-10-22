Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1DEC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B576A61073
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B576A61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkSx84WzWOVt84dUgg6Ja0938Y1LPt9MqwRFFrs5UK8=; b=24fakUQeah3uw3
	ouLv+9JpJg86HhXXL8MLzOe3JIqTjAwZasbt6zxe4tHrCu8TCMmFy842lKam44Uw+hDoKodVly2nX
	f96eHQp1m4hRAWsNIoQ2dVfUTLCBIGuO9xkCyd7olRgAeqUzI4fbl+RAiOvbUqTahdliTaecr1w2V
	ndRetnF0xxKIo4+TwfrblNXdy4eiMBkkmRcCM578ebztFZwO7IrxavpYAIYJsfP2A2SSz8xKXi7Nd
	5WWSANG/fXSwkKcjjJXs/zvd1YVVuqpI5gc4SeOpviBDv14d+soVvIK43Ql0Z/HpGLgm4hBuIqhcH
	5LeB8riJ0xioLH7zV0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduHw-00B28t-2d; Fri, 22 Oct 2021 13:08:48 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mduFZ-00B1Vy-Cl
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 13:06:23 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HbPjx4cbRz1qwy7;
 Fri, 22 Oct 2021 15:06:13 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HbPjx1ZvWz1qqkB;
 Fri, 22 Oct 2021 15:06:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 47iEcBUIACYB; Fri, 22 Oct 2021 15:06:11 +0200 (CEST)
X-Auth-Info: pHCxIG/3Fn8LyBofwRXxdTnAKN2ei9mTIkWXITidtoTB3gneygtKBg6A1vL4R5zg
Received: from igel.home (ppp-46-244-166-255.dynamic.mnet-online.de
 [46.244.166.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 22 Oct 2021 15:06:11 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 914BC2C19B9; Fri, 22 Oct 2021 15:06:10 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org,  Palmer Dabbelt <palmer@dabbelt.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Thomas Gleixner <tglx@linutronix.de>,  Marc Zyngier
 <maz@kernel.org>,  Philipp Zabel <p.zabel@pengutronix.de>,  Linus Walleij
 <linus.walleij@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,  Jiri Slaby
 <jirislaby@kernel.org>,  Maximilian Luz <luzmaximilian@gmail.com>,  Sagar
 Kadam <sagar.kadam@sifive.com>,  Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,  Michael Zhu
 <michael.zhu@starfivetech.com>,  Fu Wei <tekkamanninja@gmail.com>,  Anup
 Patel <anup.patel@wdc.com>,  Atish Patra <atish.patra@wdc.com>,  Matteo
 Croce <mcroce@microsoft.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
X-Yow: ..  Should I get locked in the PRINCIPAL'S OFFICE today --
 or have a VASECTOMY??
Date: Fri, 22 Oct 2021 15:06:10 +0200
In-Reply-To: <20211021174223.43310-10-kernel@esmil.dk> (Emil Renner Berthing's
 message of "Thu, 21 Oct 2021 19:42:16 +0200")
Message-ID: <8735otjjjx.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_060621_639601_40E93AA3 
X-CRM114-Status: GOOD (  12.53  )
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

On Okt 21 2021, Emil Renner Berthing wrote:

> +config RESET_STARFIVE_JH7100
> +	bool "StarFive JH7100 Reset Driver"
> +	depends on SOC_STARFIVE || COMPILE_TEST

Why does it need to depend on SOC_STARFIVE?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
