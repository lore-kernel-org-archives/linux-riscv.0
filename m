Return-Path: <SRS0=wYeJ=CV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B82C43461
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 08:41:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C326C21548
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 08:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R36sFbr2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aw7itSEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C326C21548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=khj+rDp0/3TS7tC+wu331o72vcJ1aCC7v5X7yL7haiE=; b=R36sFbr2iynY5z38I45gQJbY9
	YGC2As/KjjR2FKiyUBKcip9DSf6QwfpoV2vdL5u1All6tSFlsEsmhLwerSx42uxmJfZtzPpDCwb/E
	ualOy7LVpUOzOucSeevyKZMJwLOw6o1bgEHtT+bF9GTkeYlX80PplxQA2Pb0EtnoRO5HjQyHpK240
	m6fL0lHZHE4rKzRU/wgb78hRtbaV9iFvGZ8oLQMcqo6sKsekxWMDBOkGYeBCC7jVRxEmxgb+1oCRY
	ABcFsZ6pHmNopaZrWdMcWV/0RVslCcIRrmYH7by1B5prJcQoJ/6Opy3fET56X9owM+87+HaESCYQd
	ODVujuMGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kH15V-0004m1-LU; Sat, 12 Sep 2020 08:40:49 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kH15T-0004la-IX
 for linux-riscv@lists.infradead.org; Sat, 12 Sep 2020 08:40:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id e4so2031737pln.10
 for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2020 01:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xtZpYqJi2Eh1iCduCHOJ+h77NknG0j+OKsQgYvK291Q=;
 b=aw7itSEeTJJzT2wS1waWn3QoWAFE2Rnm8cV2CO7tT69YDo7gEiKozK1mGeNQob02Ii
 c/lpmqphdvUbCf6NJO96JhB87t1IdfH17rWXMQbMN9nuNsyBtkvi2vD4peBSDiJfKnNn
 LhiHbyxb+UGBPCoCWciHsyiWAnhYi7pqC2YF0JUgaq+6TsH9iPOah3d/sk4dLvlkhuyO
 U+s8IyGWITEWrBw3DqZsEDzawfC3D6W9Cm8SolrMGzfSElybJO+ZSb8vKMtkGPXw4NcQ
 BRKvsvXKGx9LG5iOfH9sHiIBEqBk+dyKw6MaYDh8A1vr/+LnfiLGZsGagf/fahfxFd2i
 ugzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xtZpYqJi2Eh1iCduCHOJ+h77NknG0j+OKsQgYvK291Q=;
 b=WKBKGLrUjGQTScr3lZanxFQUU6Hk6AgRtFGoidGrs4q1IO9deypLCd42/6wYE4jumO
 xODIsMRlorrE5Sqg6KC/uq8xzloT24V6BuYtaoR+0H8O1HZ/nHoocrp4UXBrQo615JTh
 MDHhAgK3FAgXU/UkWTUZCc0x4NjH/fgmm8smzuPthISjYNoXUAiD8IelikWIDxYpgmI9
 L5L62NAI+fwUl7GdSL3QN6AABNKUcW9pVdd5nk/DGZshbuA+1v67V4Untwgh/drFtjbn
 l6/GafoZY8Mgmxgn64NEPDdqVTtxPieH9eb+J5ZprCu6sB7BMxYJCw17t3eqlwKKRbij
 8NkQ==
X-Gm-Message-State: AOAM533Usfvh7uPnUSHVpF1U3zkHY93X5hAllizLs6TPg9wQeG5U+hNe
 SW9xCPph7L/ou8dl2tz/oU0=
X-Google-Smtp-Source: ABdhPJzZcn+s/PFPMGentFcESDpGVRZhUChlRUiTJzIXjPkcJ269s9m/RC3BlMACaK3CVlK8JhLktQ==
X-Received: by 2002:a17:90b:4acf:: with SMTP id
 mh15mr5478887pjb.204.1599900044119; 
 Sat, 12 Sep 2020 01:40:44 -0700 (PDT)
Received: from localhost (g168.115-65-169.ppp.wakwak.ne.jp. [115.65.169.168])
 by smtp.gmail.com with ESMTPSA id
 i126sm646895pfc.48.2020.09.12.01.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 01:40:43 -0700 (PDT)
Date: Sat, 12 Sep 2020 17:40:41 +0900
From: Stafford Horne <shorne@gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH v3 3/3] openrisc: Fix issue with get_user for 64-bit values
Message-ID: <20200912084041.GQ3562056@lianli.shorne-pla.net>
References: <20200910233940.2132107-1-shorne@gmail.com>
 <20200910233940.2132107-4-shorne@gmail.com>
 <20200911205526.65llro2gnh7zlsu4@ltop.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911205526.65llro2gnh7zlsu4@ltop.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_044047_670976_8F3CE3F7 
X-CRM114-Status: GOOD (  20.87  )
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
Cc: Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2020 at 10:55:26PM +0200, Luc Van Oostenryck wrote:
> On Fri, Sep 11, 2020 at 08:39:40AM +0900, Stafford Horne wrote:
> > A build failure was raised by kbuild with the following error.
> > 
> >     drivers/android/binder.c: Assembler messages:
> >     drivers/android/binder.c:3861: Error: unrecognized keyword/register name `l.lwz ?ap,4(r24)'
> >     drivers/android/binder.c:3866: Error: unrecognized keyword/register name `l.addi ?ap,r0,0'
> > 
> > The issue is with 64-bit get_user() calls on openrisc.  I traced this to
> > a problem where in the internally in the get_user macros there is a cast
> > to long __gu_val this causes GCC to think the get_user call is 32-bit.
> > This binder code is really long and GCC allocates register r30, which
> > triggers the issue. The 64-bit get_user asm tries to get the 64-bit pair
> > register, which for r30 overflows the general register names and returns
> > the dummy register ?ap.
> > 
> > The fix here is to move the temporary variables into the asm macros.  We
> > use a 32-bit __gu_tmp for 32-bit and smaller macro and a 64-bit tmp in
> > the 64-bit macro.  The cast in the 64-bit macro has a trick of casting
> > through __typeof__((x)-(x)) which avoids the below warning.  This was
> > barrowed from riscv.
> > 
> >     arch/openrisc/include/asm/uaccess.h:240:8: warning: cast to pointer from integer of different size
> > 
> > I tested this is a small unit test to check reading between 64-bit and
> > 32-bit pointers to 64-bit and 32-bit values in all combinations.  Also I
> > ran make C=1 to confirm no new sparse warnings came up.  It all looks
> > clean to me.
> 
> It looks correct to me too now at C & assembly level.
> Feel free to add my:
> Reviewed-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Thanks a lot.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
