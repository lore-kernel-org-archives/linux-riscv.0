Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9510C04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 18:35:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77BF2173E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 18:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFgwMipg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjLGkhCL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77BF2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFZRim6U51sB6lb8WmteCENtpHCdzWyapWuZKeGALeA=; b=pFgwMipgYKyjAk
	Pf49SBDRDbkLxFfCZCab2Z/WNuVsWsh9iPt9UHUIx+olaErwib6Im1fl6jubcJoj+GwZi5at65fgn
	qrwZLmIxfyBvKILe7/jgGQNxLa3diOTmUiIik3OUV3Rp1CjsH7AyG8CTZrJop08ZmvwjG7T7DnGMn
	hCQVCX/CWlG3yiqMv0RRyYA9Z5rgLtucdu3JUBuS1NjDybEFs8fZETrELxnNbbGUFxb++tMG6u0RP
	9TWBZUCkB+fNWo5Vr9doehM9ntO+ZxLZuwd/l3ub8pR7ZRHs9ati4SEY8+eSlNAO+faETHFZ3ffNW
	cM4MN9IQvj2L4iWJHU3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT9bK-0003rN-Pc; Tue, 21 May 2019 18:35:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT9bH-0003pK-Jw
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 18:35:01 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 031D22173E;
 Tue, 21 May 2019 18:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558463699;
 bh=h6QMBPaQJ9YaytqpgsgQE/jdYbpm7zZS+J6xihNl3uc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sjLGkhCL+6CNctT+nhppZVHDDEgcqXJhArozSlipyDH2C+UGfFJOeUJONbchPrrY8
 NnZc0hEFDhjUWchObZB1iK02IZGnHKzuzz28tdEqIK9x9HCkiglnIwWuBCPWHjlo87
 xUH2qf4/zRl92Gqfbg1BllN7kb1qmZXCE6tCZOoE=
MIME-Version: 1.0
In-Reply-To: <20190513213001.23956-1-paul.walmsley@sifive.com>
References: <20190513213001.23956-1-paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] clk: sifive: restrict Kconfig scope for the FU540 PRCI
 driver
From: Stephen Boyd <sboyd@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, mturquette@baylibre.com,
 pavel@ucw.cz
User-Agent: alot/0.8.1
Date: Tue, 21 May 2019 11:34:58 -0700
Message-Id: <20190521183459.031D22173E@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_113459_668688_FFEBADCB 
X-CRM114-Status: UNSURE (   7.92  )
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
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Paul Walmsley (2019-05-13 14:30:04)
> Restrict Kconfig scope for SiFive clock and reset IP block drivers
> such that they won't appear on most configurations that are unlikely
> to support them.  This is based on a suggestion from Pavel Machek
> <pavel@ucw.cz>.  Ideally this should be dependent on
> CONFIG_ARCH_SIFIVE, but since that Kconfig directive does not yet
> exist, add dependencies on RISCV or COMPILE_TEST for now.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-fixes


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
