Return-Path: <SRS0=NPVC=TC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E730C04AAA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 22:11:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F4721670
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 22:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="co1pseOK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="twrMDF/5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F4721670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1hBiSgdAWzbpsITpXpcn+YdzTRPFYBYeNb7yN40E30=; b=co1pseOKNU4ueZ
	WFJTMSOf1pdUjIcXb/+qcND0r6z1WBHjeFFawaEDtowt9EOZ2Cm1toHvG/UUQ3KEmaUd+cMuqud6p
	K/m/GDqttRfvdtMgXDBSdeanhcttvrlY9lcB5YS8xWOlELSXziwrRxqgbX60NqoNye5YBNefwzicV
	W3DOBjt7uqpNA5N0fMd7lsTsC4tEUZn2yErAJugjUDLyNvPvkBxw2deJJiMeFSbtsEkhvpqITnvnX
	clGFz4ok/KCQmszhRnYv0AEOXpX3YaToFZxTcp8peJIWtDtWKvld2nWaNwHOlgwd7QQwN79ZI1YNd
	0RxsAk4O7OrvfaKmA86w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMJvZ-00089n-Ui; Thu, 02 May 2019 22:11:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMJvW-00087p-VO
 for linux-riscv@lists.infradead.org; Thu, 02 May 2019 22:11:40 +0000
Received: from localhost (unknown [104.132.0.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92E652080C;
 Thu,  2 May 2019 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556835098;
 bh=YE/dc/fbqSnsUBzu9pKS5Er4/+4KslyKlrQjkn6EK20=;
 h=In-Reply-To:References:To:Cc:From:Subject:Date:From;
 b=twrMDF/5I3O4hSsKWXOGEE/q2vs6/Svlyb5/LFsXPBqyyHFop4Kot60KTa18xfDyh
 XAst1BemLDx0ICPsyX6gW7u7aRdATGtFIRXWMtgMf6PzOFEBqJMQ5RjOQxvHQQs9Va
 bfQNjwUsDrTw15NUc7BTa87zy8WHakHlLkffoYVQ=
MIME-Version: 1.0
In-Reply-To: <20190430205055.25673-3-paul.walmsley@sifive.com>
References: <20190430205055.25673-1-paul.walmsley@sifive.com>
 <20190430205055.25673-3-paul.walmsley@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 2/2] clk: sifive: add a driver for the SiFive FU540
 PRCI IP block
Message-ID: <155683509781.200842.728012475637311820@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Thu, 02 May 2019 15:11:37 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_151139_033600_D745F44C 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Wesley W . Terpstra" <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Megan Wachs <megan@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Paul Walmsley (2019-04-30 13:51:00)
> Add driver code for the SiFive FU540 PRCI IP block.  This IP block
> handles reset and clock control for the SiFive FU540 device and
> implements SoC-level clock tree controls and dividers.
> 
> Based on code written by Wesley Terpstra <wesley@sifive.com>:
> https://github.com/riscv/riscv-linux/commit/999529edf517ed75b56659d456d221b2ee56bb60
> 
> Boot and PLL rate change were tested on a SiFive HiFive Unleashed
> board.
> 
> This version includes several changes requested by Stephen Boyd
> <sboyd@kernel.org>.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Wesley W. Terpstra <wesley@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> ---

Applied to clk-next


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
