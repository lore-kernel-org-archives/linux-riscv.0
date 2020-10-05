Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5032C4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 08:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363EB2075A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 08:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GCzNvROJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 363EB2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gj2PmeBL27CN27VAhYhWIP1AXQ/tCI5IoMr+xIl5WfA=; b=GCzNvROJlrdU5H+1hJDTXxJ1z
	NL/iS4yYA0aMNzXJirD9h2ulvSUDx4NbFMBig8ACKYGI6pt110GPrZw8Y0tawcQG2SEfcOgODSai5
	F0TvRbg+CmxrOFMq3O9vp4y1wQ9HC/bYZclRK4eiawrwQQFLT4nk1t4df6aS1hi1qbAUc1+2wEljh
	SeBE+yVTsCZM4wN5/twikcfyhA7OWdlOa5NVOwuUBReOPzbIcDLeB+5gU1TaCIiO5+xwkLRePHgrR
	VHTFVY4g2GeaBpbhUSFuTF5UNaJzMEqKbGj+Gb043sMG9tQPpDuQpnsL8NO+2cH+tDr+lohBUHP1D
	yxd1tQo/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPLoL-0006Yt-Ec; Mon, 05 Oct 2020 08:25:33 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPLoI-0006Xt-6R
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 08:25:31 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C4YZD5F9Jz1qs0n;
 Mon,  5 Oct 2020 10:25:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C4YZC6ySnz1qyX8;
 Mon,  5 Oct 2020 10:25:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 20RLGyIoJIhc; Mon,  5 Oct 2020 10:25:22 +0200 (CEST)
X-Auth-Info: RJk2R64A7dwhmZJnCEYI/TAtxilQoLVj9TjvCdKUXvl1KRi7AS6cLgi9JR91QNDM
Received: from igel.home (ppp-46-244-175-195.dynamic.mnet-online.de
 [46.244.175.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  5 Oct 2020 10:25:22 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 58B1F2C28B7; Mon,  5 Oct 2020 10:25:22 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
 <1593266228-61125-2-git-send-email-guoren@kernel.org>
 <20200911204512.GA2705@aurel32.net>
 <CAJF2gTQiLV8sDE5cnvP=aBog4zaiMvMeieg_JtXwRODky1u3Hg@mail.gmail.com>
 <20200914103836.GB2705@aurel32.net>
X-Yow: Leona, I want to CONFESS things to you..
 I want to WRAP you in a SCARLET ROBE trimmed with POLYVINYL CHLORIDE..
 I want to EMPTY your ASHTRAYS...
Date: Mon, 05 Oct 2020 10:25:22 +0200
In-Reply-To: <20200914103836.GB2705@aurel32.net> (Aurelien Jarno's message of
 "Mon, 14 Sep 2020 12:38:36 +0200")
Message-ID: <87lfglt6z1.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_042530_347066_AE837247 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sep 14 2020, Aurelien Jarno wrote:

> How should we proceed to get that fixed in time for 5.9? For the older
> branches where it has been backported (so far 5.7 and 5.8), should we
> just get that commit reverted instead?

Why is this still broken?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
