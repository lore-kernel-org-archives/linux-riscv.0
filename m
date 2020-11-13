Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5916CC388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 08:11:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94982206D9
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 08:11:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U9rop06C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6LiCQIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94982206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IplmE/VUZyWzxEQHSsot1Ry37slpK0KY3jMVJ3JvhhY=; b=U9rop06COAANb0mj9y0be5GN/
	pNotu/EEapPQ3Iv2ICfoQfXTfpWrFD7s0n6tYUwB8cJlnr02f9he9CPYIoxNQHp/a6n0m0eGn4Apa
	NfIgDD/A9zp1h+bIFhxv6GjpKG2+x6coDigbhKK7dxwDRtncT7mXzbKkgTmO9ef+H/a1TyP9U5GMG
	DqxPJEICmuN5tEwspIVF6U2naoFpQ9v/gprWOUPoXcpaE0tv0pFT0oNhJ9EKBbUIs3QUiXpSzHMpY
	NYW9NjfukXAn9lDucSCnDAnd6FgGVhRiBkYbWIUlM4FVYrKcBnBD8dXc3ksmLsPY0QlszZzlbLzUj
	GTfzj4pZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdUB3-0001V2-4W; Fri, 13 Nov 2020 08:11:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUB0-0001Uc-Pr
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 08:11:23 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9C64206D9;
 Fri, 13 Nov 2020 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605255081;
 bh=q7R0ZJDODTZcOxWdt3jAqjnMWNyOJbFIt8pXF6LGNt4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=l6LiCQICXEhVpbskIMBx/95dvbCNC1vayy/peszqYiL1yFABOyvMkK5tYBA2sBj1I
 x6GJ65poI9UWlFOPoygr3y4XRGxbAIUmyzzOzQm55F9LCFZm11Gt/Rb/NxCg8Ukv7i
 z6Qkuc1JWAxqt2A9nD2t5Oln3ZgzwdVgpTXKOa18=
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
 <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com>
 <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com>
 <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Fri, 13 Nov 2020 00:11:20 -0800
Message-ID: <160525508016.60232.12394737512819290718@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_031123_214061_C27FD213 
X-CRM114-Status: GOOD (  17.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2020-11-12 23:57:19)
> On 2020/11/13 16:53, Stephen Boyd wrote:
> > 
> > Yes it's fine. Just the commit text reads as "If of_clk_init() is not
> > called in time_init() then nothing works" which is true but made me
> > wonder if it was because it needed to be super early or not. The commit
> > text could be a little clearer here.
> 
> OK. I will clarify the commit message in V2. Working on it now.

Thanks!

> 
> > We don't have any good solution for a fallback to call of_clk_init()
> > somewhere later. I do wonder if we should generalize this though and
> > call of_clk_init() from start_kernel() directly via some Kconfig that
> > architectures select if they need it for their timer and then move it to
> > an initcall if architectures don't select the config. Or throw it into
> > the of_platform_default_populate_init() hook if the architecture doesn't
> > need to call it early.
> 
> This last idea seems reasonable and probably the easiest. And I think it could
> be done unconditionally even if the arch calls of_clk_init() early as the
> already populated clock provider nodes would not be initialized again.
> 

Also of_clk_init() is for the CLK_OF_DECLARE() users and if they can
wait to platform bus population time then they could be converted to
regular old platform device drivers. Maybe the problem is the clk driver
you're using is only using CLK_OF_DECLARE() and not registering a
platform driver?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
