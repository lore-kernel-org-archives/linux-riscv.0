Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C3C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phCC/NHwMPCorzcMnG+Hnyk68M0lAD1quhZXTlKw/1g=; b=NXR3rkVm6TDVsv
	wL33+o+67Wc7APm13Pw0JJ1acdqrKoR5Z7xoFmtCmbY1ObdXdpFawupnNd5ErRnmpFZn9XRhSUGc2
	u3TotIEIdXpxt9CuOaNj7e2WnT2xVAV5CQbj89/6pZ9QzAwsEdyD8WKhpGVNx1gWm0nPbjli+2aQN
	XUWQweYKjYaCIB3dhDYD32W6kFpo6O5eK3XI8Hcba2lMmZVTqiC5TyX6RsWQTyjdGGUoTA9rFfpsi
	eg5AMBjkmXo+1yq7YqESjHUCNlO2G6PHMtaGDAI/9T/ryznhKzp6HP8UEKzdBfWrTED/y95MNW1UR
	3XMXuxbUziub3hqc2m7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6cs-00DwhF-QS; Mon, 21 Nov 2022 13:14:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6cn-00Dwfx-Hv
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 13:14:17 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C4E9624E2BA;
	Mon, 21 Nov 2022 21:13:41 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Nov
 2022 21:13:41 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Nov
 2022 21:13:41 +0800
Message-ID: <dc09d673-906c-0cd2-2f16-5ee0af3691e2@starfivetech.com>
Date: Mon, 21 Nov 2022 21:13:27 +0800
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
 <13578755-ab98-7567-258d-bc6c4164ee6c@starfivetech.com>
 <CAJM55Z-a1Pg2q7ZyvhwU2sp9YpsJZmE8y161UM-Ap7egCdgYVw@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z-a1Pg2q7ZyvhwU2sp9YpsJZmE8y161UM-Ap7egCdgYVw@mail.gmail.com>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_051414_276119_45962C7D 
X-CRM114-Status: GOOD (  18.77  )
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

On Mon, 21 Nov 2022 12:32:24 +0100, Emil Renner Berthing wrote:
> On Mon, 21 Nov 2022 at 08:16, Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > On Sat, 19 Nov 2022 00:26:27 +0800, Emil Renner Berthing wrote:
> > > On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
> > > >
> > > > Rename "clk-starfive-jh7100.h" to "clk-starfive-jh71x0.h" and rename
> > > > some variables from "jh7100" or "JH7100" to "jh71x0" or "JH71X0".
> > > >
> > > > Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> > >
> > > The patch is fine, but I'm a little unsure about this Co-developed-by.
> > > This patch is taken directly from my jh7110 branch so does Hal sending
> > > it count as co-developed-by?
> >
> > Your original patch merged patch 1 and patch 2. Suggested by Stephen, I
> > split the patch into two patches, and I need to add a new commit. My
> > previous thinking was that the Co-developed-by tag should not be added
> > to the commit author, so I added it to you.
> 
> Even if you didn't just copy it[1] I still don't think splitting
> patches counts as "developed by". You can set the author of new
> commits or copy them from a previous commit with git commit -c.

Okay, I will remove my Co-developed-by tag in patch 1, 2, 4, 5 and set the
commit author as you.

> 
> [1]: https://github.com/esmil/linux/commit/df4bcbc307e97cb6a0e7b8ed5ecc66487395176d

Oh, I don't even know you still work on JH7110 and update on github.. All
your patches were cherry-picked from your gitlab branch. There is no doubt
that we did the same thing for this patch.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
