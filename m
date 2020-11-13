Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EAEC4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 07:53:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D640208D5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 07:53:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2/9zUiu+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0AwJizWZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D640208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wzrBnSRlGU+hw0uiCcaXQMVb68fU9u/PIIq4VMnNuBU=; b=2/9zUiu+34jd28TPIlMfLtbRg
	4AbnK9DlWN0j+Y0GCLItetYuHupx2dx29fzxhXlO9fuNDWzlMcLPhW9XmjYPMoW27SQNsYNKaxwJ+
	WPRp5wKswOx4Up68eTRUA4mUIYiSRokb/bilAS40TSwoDGIC5HIZ777+3DhFcHf5d9aVZ+AdTpfAN
	AHlHD7JRdWbZglqHKhxkraPN44GRmRIEY84KqoZtkDHy5dhRRKTkgTqlSMt/AqeBtfWVeMV+UrdXD
	KzwBq6ePNgsyWFrzMMKnnQ+5WLqSfN0vtOFIGpcHPOL2KBavJtbfADIlnGTgs4SeqfkPD2aUIeaU7
	dZvHfMVnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdTtQ-0000Ko-3Y; Fri, 13 Nov 2020 07:53:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdTtN-0000KE-BW
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 07:53:10 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 551BB208D5;
 Fri, 13 Nov 2020 07:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605253988;
 bh=qA8YURu9OEeXzoU7ofhA5m7bLtH8fT8x4bawGyc1VkY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=0AwJizWZJl7oqWEB6iqVKXClGvFyUUEOQaujmPrm5kZMmtPr5sM9WukgkQUW91hTZ
 5AN3/WzKdcllb/8VBX0PcDh0D2rj8LY2900+ydpe7TnC9DnChdxT0vuyA0MqsC09gM
 FpEuPmqMphdXNwPaK5n0xejOq9aVVmxX+Zs4Hmrk=
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
 <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com>
 <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Thu, 12 Nov 2020 23:53:06 -0800
Message-ID: <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_025309_468387_D5067EBF 
X-CRM114-Status: GOOD (  23.95  )
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

Quoting Damien Le Moal (2020-11-12 23:40:17)
> On 2020/11/13 16:31, Stephen Boyd wrote:
> > Quoting Damien Le Moal (2020-11-07 00:13:56)
> >> If of_clk_init() is not called in time_init(), clock providers defined
> >> in the system device tree are not initialized, resulting in failures for
> >> other devices to initialize due to missing clocks.
> >> Similarly to other architectures and to the default kernel time_init()
> >> implementation, call of_clk_init() before executing timer_probe() in
> >> time_init().
> > 
> > Do you have timers that need clks to be running or queryable this early?
> > This of_clk_init() call is made here when architectures need to call
> > things like clk_get_rate() to figure out some clk frequency for their
> > clockevent or clocksource. It is OK to have this call here, I'm just
> > curious if this is actually necessary vs. delaying it to later.
> > 
> 
> I think the clocks could be initialized later, but at least the CLINT will
> depend on one of the clocks, same for the CPU frequency information. So need
> checking.
> 
> What this patch fixes is not the need for a super early initialization though,
> it is that _nothing_ was being initialized without it: the clock driver probe
> function was never called with the current riscv time_init() as is. I looked at
> other architectures and at the default kernel time_init(), and mimicked what was
> done, that is, added of_clk_init(). Is there any other way to make sure that the
> needed clock drivers are initialized ?
> 

Yes it's fine. Just the commit text reads as "If of_clk_init() is not
called in time_init() then nothing works" which is true but made me
wonder if it was because it needed to be super early or not. The commit
text could be a little clearer here.

We don't have any good solution for a fallback to call of_clk_init()
somewhere later. I do wonder if we should generalize this though and
call of_clk_init() from start_kernel() directly via some Kconfig that
architectures select if they need it for their timer and then move it to
an initcall if architectures don't select the config. Or throw it into
the of_platform_default_populate_init() hook if the architecture doesn't
need to call it early.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
