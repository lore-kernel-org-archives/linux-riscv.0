Return-Path: <SRS0=lPIR=7H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5A3C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 May 2020 16:18:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC8F2071A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 May 2020 16:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WaSaqi+R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC8F2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p36e5h/hCllnPuZ90FUwtOLy6KPkKTpTETPdAZobUFE=; b=WaSaqi+RyMKrsY
	s36OTXQdCwPeVROwnSVvHxUgfKsGWi4D6UlcTEyYJ6eSaptnpWNTyDKLnOcZR1daxAsfj1X1VRPGd
	VZSGNc0JKoYFY0Z17NbvPaHDVaYfPRRelhd3AuMEuCnEmoWptjVH1mz8EhwWkzCECUdpb8r+QxT53
	4yJPgwPvMOoHaJ0hcUIdstGUZy4afQIbYQtwF2jrUIABeOHd4O0AMNnsth8mOd2DYSqOtt5Jpyc3J
	0yUUJ98fr3m+mPav5EzXwfVSFLYRfjDz1C7ZSR5R2C2JIT8kWzX3ES9PXUtlXNkorFxrazaJ8zUc+
	yjiCikOunPHK/h79yCHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdFng-0003XT-9X; Mon, 25 May 2020 16:18:04 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdFnd-0003Wh-Us
 for linux-riscv@lists.infradead.org; Mon, 25 May 2020 16:18:03 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D2B724A2;
 Mon, 25 May 2020 16:17:59 +0000 (UTC)
Date: Mon, 25 May 2020 10:17:58 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Subject: Re: [PATCH] Documentation/features: Correct RISC-V kprobes support
 entry
Message-ID: <20200525101758.5cf2d32c@lwn.net>
In-Reply-To: <20200523210005.59140-1-bjorn.topel@gmail.com>
References: <20200523210005.59140-1-bjorn.topel@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_091801_998329_D48DA440 
X-CRM114-Status: UNSURE (   7.04  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 23 May 2020 23:00:05 +0200
Björn Töpel <bjorn.topel@gmail.com> wrote:

> The Documentation/features/debug/kprobes/arch-support.txt incorrectly
> states that RISC-V has kprobes support. This is not the case.
> 
> Note that entries that have been incorrectly marked with 'ok' will not
> be changed back to 'TODO' by the features-refresh.sh script.
> 
> Fixes: 7156fc292850 ("Documentation/features: Refresh the arch support status files in place")
> Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>

Applied, thanks.

jon

