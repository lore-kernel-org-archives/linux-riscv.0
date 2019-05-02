Return-Path: <SRS0=NPVC=TC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43630C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 22:11:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F2A120B7C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 22:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RmjMhT2S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqczSP24"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F2A120B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRzOFcpbI3xnBA1d8k6FermQtRWFXV8rBgscQcw5MUc=; b=RmjMhT2SXxfhOQ
	nCk7F/OZxrWdKZTt194nS1ZbYwrShM0N0UVJTri90f/xNfsNgczgf7Fnd3sJ3KkW9plnjoIK/vgwu
	QXE0VULJpvPtcQf+zrWJUrkfRYykVgAd7kcNk2BKWJjCkBXCRp7I3BRjOaoUClt7gWALpmS4dw59s
	UXBGHg5+bUnZIMZpp1FIHdQLhsyZLKO+8BGm4beIsFhy118CMWmGmc77pAQL0PwBqKQY97oySIhvM
	miWWF1U00Wgsv54dNRRrUWZ6ytqSVqPzUnIysKg/gJNhKeJjGo41dzk23VL3HWl2kHRhSr080J5oK
	YMQeL9jCYt+FLgCj/XqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMJvX-00088E-DR; Thu, 02 May 2019 22:11:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMJvU-00087E-De
 for linux-riscv@lists.infradead.org; Thu, 02 May 2019 22:11:37 +0000
Received: from localhost (unknown [104.132.0.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9AB12080C;
 Thu,  2 May 2019 22:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556835095;
 bh=2Npcycgwql1NQwXWHBSmcFCyRTuCpGuk4AWq0e9cSUI=;
 h=In-Reply-To:References:To:Cc:From:Subject:Date:From;
 b=SqczSP24PSwwh51HipvMPIHWCAgkSQYRBX9iVLL0l3kbSCXTluWEQF/+H7gcMfnWg
 tlFI3LseEmvmcfVp1jpEQaMU3IR0vH8gGfmWFlAixbSnetJQRbFRd7O77kvP/LMX5L
 u2DAf3zOR5K3fNUtZMy4O0b9J4YmlpgMZ1Ie93Lw=
MIME-Version: 1.0
In-Reply-To: <20190430205055.25673-2-paul.walmsley@sifive.com>
References: <20190430205055.25673-1-paul.walmsley@sifive.com>
 <20190430205055.25673-2-paul.walmsley@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/2] clk: analogbits: add Wide-Range PLL library
Message-ID: <155683509491.200842.3659543106794259397@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Thu, 02 May 2019 15:11:34 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_151136_482501_EB386208 
X-CRM114-Status: UNSURE (   8.09  )
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
Cc: Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Megan Wachs <megan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Paul Walmsley (2019-04-30 13:50:58)
> Add common library code for the Analog Bits Wide-Range PLL (WRPLL) IP
> block, as implemented in TSMC CLN28HPC.
> 
> There is no bus interface or register target associated with this PLL.
> This library is intended to be used by drivers for IP blocks that
> expose registers connected to the PLL configuration and status
> signals.
> 
> Based on code originally written by Wesley Terpstra
> <wesley@sifive.com>:
> https://github.com/riscv/riscv-linux/commit/999529edf517ed75b56659d456d221b2ee56bb60
> 
> This version incorporates several changes requested by Stephen
> Boyd <sboyd@kernel.org>.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Applied to clk-next


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
