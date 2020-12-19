Return-Path: <SRS0=YJ0P=FX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1E9C4361B
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Dec 2020 19:45:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C1E23131
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Dec 2020 19:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C1E23131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dqiQKmuOUShxGp0DtaK6Do7nDFQhQiCmEde9GghP5kQ=; b=Jj0yAi3F7W1avUvXFHhkeQ1en
	Ln2qTqgfL6VsXbMPplFe09C+uhfWVLZZKEOqNo/7bXhMscdt+jsI1O1Z65hri5R0PQziLo5dEQgS3
	buyzFfx3yXvP2S4+mpGrIdD++s7N6CdxiEwE0n9dTCnUZBsFWFg2ebvKA0YIqVvUyYm8QirbfCcg+
	lPb4CZtgrzmS/NkYEnnhuharRH/O+e6fWa2GRnoPQGXgAE6olQHyC9/iFlHa9Y8ZHo+e7LTeqJOa9
	rJeXBcGHE/RYQJ+0xPcbih+BPEXWfdRL4ODxMK9Cu1AoyuF7oqsOS3eA8/aEOqW5z3IJf0j18ErF/
	i8HS/AyqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqi9x-0004In-8O; Sat, 19 Dec 2020 19:44:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqi9u-0004IE-42
 for linux-riscv@lists.infradead.org; Sat, 19 Dec 2020 19:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608407093;
 bh=7K8eUGnj2uMOFSrmvgYHs3AI2vLv/y/cha7daax2KpU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=K+2otkQMRCYLZbq4HXhkeb1Y4mZZBqftLy90BZZiRdLe0R3TbsrIlWMAJSswUnsv1
 kYYyvTFsxJzzliwaD1gcvgdclTdjytteel4tRwOy5uppi2DI7bSlXVxjhpMCnBVopP
 GgQI/961K/PW5oijEGBp0B/dZZT+kNdahTMdkhynxbeprenClfhhL5LCHwbg8f5EjP
 +DO2PFQNREGk7UPkbd88qpfGt9uwRvlLKJWA4f2z16pCkd3FzfzQpmVsRzSxmPbYbH
 wEieDYfQoL9UOhpQy6EYpLVK8jREa5rTO0BgXGavy3Me3TWvCVJ+KouEqV3sUoHmmN
 APIqTUvwjDzPw==
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB6522CB93958F090C1075A9CBE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
 <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
 <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
 <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com>
 <CH2PR04MB6522CB93958F090C1075A9CBE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,
 k210-clk bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Sat, 19 Dec 2020 11:44:52 -0800
Message-ID: <160840709202.1580929.729105789064274741@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_144454_246719_A0C61618 
X-CRM114-Status: UNSURE (   5.53  )
X-CRM114-Notice: Please train this message.
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

Quoting Damien Le Moal (2020-12-17 02:54:14)
> 
> One more thing: to avoid dt-binding checks error for this patch, can you also
> take patch 8 that adds "canaan" as a vendor name ?
> 

Sure.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
