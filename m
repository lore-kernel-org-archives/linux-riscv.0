Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820E5C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iBVNw3k8EIoyAv+xXgk4XrVbT7OHJYeuXznZN9QYuU=; b=KRIKP58sJ3TUdu
	4h035iqfm0T0Q1C/S0uTK0Lw2dhoeTsFmCSfJXbDNIwV6UaB8mv+QCfKgs0QjSlx0Q5io0Fm7qtus
	zImAjQaa4Gb8ds0pR5GuMW1S/R0HX0qXYCqdM1fDZDBQLvQe7tG4rG4mTX6vfOLeKpDZmhweY3w6f
	1NbdsCwNKNfY98ocMYqLrtrLmVA31KzZ/td76mcFYhV3tzyeQiLHbElJpg91Hu90CAevbeWhQ8qid
	18WnO5k8JUWqKbXi0L4ek77WfaJxqcd0nzD7B3GKbVFax1SbVxJs6BTRDTwOtCqriq7/whWPrE24W
	TwnByZueAtZ8apWrkNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox12z-00ADCl-Qd; Mon, 21 Nov 2022 07:16:53 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox12w-00ADAm-9X
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 07:16:52 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5CA6024E199;
	Mon, 21 Nov 2022 15:16:37 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Nov
 2022 15:16:37 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Nov
 2022 15:16:36 +0800
Message-ID: <13578755-ab98-7567-258d-bc6c4164ee6c@starfivetech.com>
Date: Mon, 21 Nov 2022 15:16:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 02/14] clk: starfive: Rename "jh7100" to "jh71x0" for
 the common code
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-3-hal.feng@starfivetech.com>
 <CAJM55Z-Zftr29oGzeBFzOKuGixABSJEzPF-R2c0U9Pg5qDcRCQ@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z-Zftr29oGzeBFzOKuGixABSJEzPF-R2c0U9Pg5qDcRCQ@mail.gmail.com>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_231650_632137_8B8702C1 
X-CRM114-Status: GOOD (  11.74  )
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

On Sat, 19 Nov 2022 00:26:27 +0800, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > Rename "clk-starfive-jh7100.h" to "clk-starfive-jh71x0.h" and rename
> > some variables from "jh7100" or "JH7100" to "jh71x0" or "JH71X0".
> >
> > Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> 
> The patch is fine, but I'm a little unsure about this Co-developed-by.
> This patch is taken directly from my jh7110 branch so does Hal sending
> it count as co-developed-by?

Your original patch merged patch 1 and patch 2. Suggested by Stephen, I
split the patch into two patches, and I need to add a new commit. My
previous thinking was that the Co-developed-by tag should not be added
to the commit author, so I added it to you.

Best regards,
Hal

> 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
