Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0662CC48BE5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 09:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCDEF6128C
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 09:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCDEF6128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOiDKnCbVmFuOz4tRxARGartNEpjd03bIVbFSNvcthw=; b=HEjD9ffdTSbaur
	UAGcFDTJYzrhMAyMYa4tBGNm3ZmWHppwIR1rqNWWsTwM6s1lB8qcK2OIlRstV+67OQhXIvAFrEbNn
	AYJxbLOdH88QqiF3eE0VSg83aHmj6kkWpiIaZXT4GiVXuIQYSveV67+tzvoiSndNj4dZThTCfXD+Y
	jnWFNeeJWac/jA6wRD9PlmcJ2/wKvc5E9xrPAIJTh0DLEfSTyqdLNlmmHKMZYUQItSo3DfrVm+hzN
	KQ9h11Aw9CgJRUmmC+yTV1NpyG4PE6fYAA//LdXIByamg+asaQYXEelgPIjBoBNIk5IS3+r5AM3c7
	S5sXkJJmKQMeegDR9+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lto73-009c7E-Np; Thu, 17 Jun 2021 09:15:01 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lto70-009c5q-8m
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 09:14:59 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4G5GbZ5gHmz1r5TD;
 Thu, 17 Jun 2021 11:14:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4G5GbZ3rnkz1qr3h;
 Thu, 17 Jun 2021 11:14:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id BNoJzHI3K9ck; Thu, 17 Jun 2021 11:14:49 +0200 (CEST)
X-Auth-Info: +G38n7BK4v8zE2k4U0K1yd1apNmkNM93lb9wmBJEqzJxi4lUTiCAnYN6Jt0+IEcd
Received: from igel.home (ppp-46-244-187-91.dynamic.mnet-online.de
 [46.244.187.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 17 Jun 2021 11:14:49 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id B037F2C3784; Thu, 17 Jun 2021 11:14:48 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux@roeck-us.net,  alex@ghiti.fr,  corbet@lwn.net,  Paul Walmsley
 <paul.walmsley@sifive.com>,  aou@eecs.berkeley.edu,  Arnd Bergmann
 <arnd@arndb.de>,  aryabinin@virtuozzo.com,  glider@google.com,
 dvyukov@google.com,  linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com,  linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear
 mapping
References: <20210611110019.GA579376@roeck-us.net>
 <mhng-569bbfda-00d0-4c1f-9a88-69021f258f7e@palmerdabbelt-glaptop>
X-Yow: I will establish the first SHOPPING MALL in NUTLEY, New Jersey...
Date: Thu, 17 Jun 2021 11:14:48 +0200
In-Reply-To: <mhng-569bbfda-00d0-4c1f-9a88-69021f258f7e@palmerdabbelt-glaptop>
 (Palmer Dabbelt's message of "Wed, 16 Jun 2021 19:58:41 -0700 (PDT)")
Message-ID: <87czskonsn.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_021458_498384_C2AD1FDD 
X-CRM114-Status: GOOD (  11.26  )
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

On Jun 16 2021, Palmer Dabbelt wrote:

> This seems a long way off from defconfig.  It's entirly possible I'm
> missing something, but at least CONFIG_SOC_VIRT is jumping out as 
> something that's disabled in the SUSE config but enabled upstream.

None of the SOC configs are really needed, they are just convenience.
They can even be harmful, if they force a config to y if m is actually
wanted.  Which is what happens with SOC_VIRT, which forces
RTC_DRV_GOLDFISH to y.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
