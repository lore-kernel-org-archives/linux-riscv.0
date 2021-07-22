Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BE0C63793
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 15:43:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1370610D2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 15:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1370610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anl67U6THjpdgbayKavupTl0H0bB4KmR3Tu+kiM0Wxg=; b=zBt5ZUeZzZyeM7
	P8U+SS9V5CLYQ5pc2KGOPJQ54K6XXZ+cGqXvMlTFMV1bxtDSEd66mm+7QNOjTQ/TkLD9izFCYOcy5
	TZALP8TN3Rl0WPXnVGLmohaTdDoRni6GJiqVvZxEwGnm3GHSx18MIeJmBGhylVwv7eRqVesg/KuUU
	AdXFovrE3RjqxCAT2Z7yLkFhhRPP9T2WFM6I8HgQwd1e6ut8PG+YsUJPeWtrM+SLxt1wurnnW5tlk
	PTP25+VMMtT9V5Rmpe8/A0kgMr2Yr3T4aTr1dXG5Au43Z5PPLik3oW7C+PD5u7JSNknCKfHfnEosh
	Wlzxye4/L59qvNIYDelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6aqj-0020s5-Cw; Thu, 22 Jul 2021 15:43:01 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6aqg-0020qX-2O
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 15:42:59 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GVxYB2TV3z1qy4L;
 Thu, 22 Jul 2021 17:42:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GVxYB0jbnz1rmYB;
 Thu, 22 Jul 2021 17:42:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id bY5aEtjrg-3r; Thu, 22 Jul 2021 17:42:53 +0200 (CEST)
X-Auth-Info: PIjtPIK9afYCsoiZrRCgLg1D74hHiwqDc3Ol8FTCod9odBW8gn7GZlgUh/jJPM+a
Received: from igel.home (ppp-46-244-188-81.dynamic.mnet-online.de
 [46.244.188.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 22 Jul 2021 17:42:53 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 8D6C92C2659; Thu, 22 Jul 2021 17:42:52 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Atish Patra <atishp@atishpatra.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  tongtiangen@huawei.com,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
References: <87bl6yrcmd.fsf@igel.home>
 <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
 <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
 <20210722213724.1f12a0e7@xhacker>
X-Yow: Don't hit me!!  I'm in the Twilight Zone!!!
Date: Thu, 22 Jul 2021 17:42:52 +0200
In-Reply-To: <20210722213724.1f12a0e7@xhacker> (Jisheng Zhang's message of
 "Thu, 22 Jul 2021 21:37:24 +0800")
Message-ID: <87zguexslf.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_084258_304883_9CDAE05F 
X-CRM114-Status: GOOD (  10.18  )
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

On Jul 22 2021, Jisheng Zhang wrote:

> I think we need to pin the stack before calling get_wchan(), could you please
> try below patch?

Thanks, this fixes the crash for me.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
