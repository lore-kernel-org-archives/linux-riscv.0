Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE11C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A96236F9
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14A96236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0EmU57ie5YJd3YACpPLZYz5NNLY/I+poH47jGh1IgNI=; b=m2gAUfC3B0lKJyxBdgncv6tmC
	nMALE4Jtq0fEeoof0YPP1OxjrIY7bT8tA+YE6dShCyAIFBK05gMCFhlEPkngJLPWBdulUsKRqdon8
	CNVGcKCZT5qxm2RhDKUS/rQt2QS8+DVe5MQgSSmxQW8rwDynZua6lQkg30y08vZmOC9o8tMJfn/ek
	tf7N4kiiISB6X71xo/YLd/BrU3oC3rZjHkVlF33yOfS/3uy18vpQZ4B21Ppd0yrSbNpnzQTW9Kd2u
	66j5/rAEFIdebR8zNFn459ZkqqfoRX1npV8Ut7lPaeF+twhYInc59KjE3RlafJTh2/oIQbxd1PS3Q
	2y4rzdFzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpdIe-0006KD-N4; Wed, 16 Dec 2020 20:21:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpdIc-0006JZ-NL
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 20:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608150086;
 bh=N+zhwQ+YfkBtvavMJpsqeEW9p7YZZNr6aOvmok4o4gs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=UNjChfjfxsSDltNd7XCWDaMsNU7Vlki9M2oBfaWhJv90xpYc5kLp++DhXbwemADbX
 Hv9cXlfnlmCwFvVMGwWgFd8ygpDZcOu7zjr1chPA9FgnEPJmwhtr1VaypLDPE0X0aK
 HAviCPUgHfVjVYYGoWK0KeP1HDVAjZf954uNEmpRi8rnx0PhteTflLBMJiG5WCet4u
 48Bio3A6mO4B3dFfUxomPcVdLcsEj5aGqw50VfYQ0NA9CZ3g+25JywQqALzdngJPhl
 UuMD9CqiucCTru5p/h0Gw/99MMgoozENOj/f5s7M96G8DFsPGpvJMEH5uRVNkCNYor
 3eIvWZiz4BBvw==
MIME-Version: 1.0
In-Reply-To: <20201209094916.17383-4-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com>
 <20201209094916.17383-4-zong.li@sifive.com>
Subject: Re: [PATCH v7 3/5] clk: sifive: Add a driver for the SiFive FU740
 PRCI IP block
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pragnesh.patel@openfive.com, schwab@linux-m68k.org,
 yash.shah@sifive.com
Date: Wed, 16 Dec 2020 12:21:24 -0800
Message-ID: <160815008470.1580929.14197735214079508813@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_152126_893025_980EFB62 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: Erik Danie <erik.danie@sifive.com>, Henry Styles <hes@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-12-09 01:49:14)
> Add driver code for the SiFive FU740 PRCI IP block. This IP block
> handles reset and clock control for the SiFive FU740 device and
> implements SoC-level clock tree controls and dividers.
> 
> The link of unmatched as follow, and the U740-C000 manual would
> be present in the same page as soon.
> https://www.sifive.com/boards/hifive-unmatched
> 
> This driver contains bug fixes and contributions from
> Henry Styles <hes@sifive.com>
> Erik Danie <erik.danie@sifive.com>
> Pragnesh Patel <pragnesh.patel@sifive.com>
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Henry Styles <hes@sifive.com>
> Cc: Erik Danie <erik.danie@sifive.com>
> Cc: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
