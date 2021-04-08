Return-Path: <SRS0=+Lbj=JF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0074EC433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 22:45:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E45610F8
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 22:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55E45610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i+JPU2C8s5ASvxOGBcHfYpxEwxhkN1e2ZGfOlPVFLW4=; b=mq6jpEjo5c8Fl6//uD14Ejfi0
	+QyNEqUY1svmScsWtsv9VOfm8Pykob52cBkiqxeYHRFUFoMEGSCME9sO3QWEys9pV8ZE7zgxpyO0Z
	EmCODhg6L7eA7frscBEnZt2I3RyTJcnzuwWNOM79v+hUQ4l890JWtmcFpbfDhBCYPIUxwaRdK1DL0
	U+kT2Fca1jH4KWKGtykTfHpD+ygTYl6AvN6n63clm6opLXe1cDbqNLaiEguChznsMdV28r1wZOaZ9
	VfpczSlxrJq02UlfR+Dtng+V3zKvXixaklv/D3VpXQIbZzbfFWopw5ZzaRJK14sBdo78xFExSKnjW
	jKyuye+gA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUdOq-009Ok4-MR; Thu, 08 Apr 2021 22:45:20 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::4])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUdOm-009OjT-ST
 for linux-riscv@lists.infradead.org; Thu, 08 Apr 2021 22:45:18 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 50BEB92009C; Fri,  9 Apr 2021 00:45:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 4323792009B;
 Fri,  9 Apr 2021 00:45:13 +0200 (CEST)
Date: Fri, 9 Apr 2021 00:45:13 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Masami Hiramatsu <mhiramat@kernel.org>
cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, 
 Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@linux.alibaba.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
In-Reply-To: <20210409073858.e7b439e99e9e506f4f3847e2@kernel.org>
Message-ID: <alpine.DEB.2.21.2104090041400.65251@angie.orcam.me.uk>
References: <20210330021624.2b776386@xhacker>
 <20210330183316.942215efe8e6e8455ad14113@kernel.org>
 <20210331222244.45a5807c@xhacker>
 <20210401093036.037f2abbce7ed5d1e68466b7@kernel.org>
 <alpine.DEB.2.21.2104032020100.65251@angie.orcam.me.uk>
 <20210408192348.1d50c588@xhacker.debian>
 <20210409073858.e7b439e99e9e506f4f3847e2@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_234517_108132_1F3C9D6D 
X-CRM114-Status: GOOD (  10.94  )
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

On Fri, 9 Apr 2021, Masami Hiramatsu wrote:

> > >  Is this approach guaranteed to keep interrupt handling latency low enough
> > > for the system not to be negatively affected, e.g. for the purpose of NTP
> > > timekeeping?
> > 
> > IMHO, interrupt latency can't be ensured if kprobes is triggered.
> 
> Indeed. The latency depends on what the kprobe user handler does. Of course
> it must be as minimal as possible... On x86, it is less than a few microseconds.
> Thus it may be a jitter on hard realtime system, but not a big issue on
> usual system like NTP timekeeping.

 Ack.  Assuming that the breakpoint exception will only disable interrupts 
if kprobes are in use it seems reasonable to me.

 Thanks for double-checking.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
