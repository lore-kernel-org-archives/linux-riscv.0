Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4479BC71122
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 17:51:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C66A20693
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 17:51:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H4BW048F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="gtX/3bFK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C66A20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6DJy4u6XfD3oB9eFnKSpxG3J/uYVoGgIMhsf6MEjxs=; b=H4BW048F3Sq70y
	NucsVkWHFzzdmHJM/N6Plhq5W95RRDR6fT1Bvrbu5gMJbrQW7Xu4eCAFxh9PWMt11rVLspRayslgQ
	iPafQeikyQYZifPXTSQyPhVRw6v3Y/Wtn+Ky26nV97HV3QH3lWcXegn4ro6zdjrGrRCwiNk0NoNvL
	pPcfes+rwwstdtKVyvQHMKzESHycJLAKlXmn8mcMMxsD43r+0euXm4WKITESGfoePLfVdpkea/W6b
	Eyb4SNblIqZKVI44kAJa6s6p3KsrPeNGSHNG2PyKbf15zh+sCT4FsflXPxWEjgJctKe9rwHo6nthy
	efF7e5vHglMh4XwuVm4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gBO43-0000v8-2s; Sat, 13 Oct 2018 17:50:59 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBO3z-0000sa-LJ
 for linux-riscv@lists.infradead.org; Sat, 13 Oct 2018 17:50:57 +0000
Received: by mail-pg1-x541.google.com with SMTP id 80-v6so7260501pgh.10
 for <linux-riscv@lists.infradead.org>; Sat, 13 Oct 2018 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GoWsMygASIRyu7PZgD3N2dBBnQZB9nQ/7GbuLV2HYnY=;
 b=gtX/3bFKdysbo0S38lPP9ATjDdsTysp7ptOg+SsEzBQmc5jRhOODzCYik6fd+BjPNr
 xu2Vp+XyGO4o3VTbAkLtyvZfSWRtUUHxernM8wIzLOXHfZUYx/YsB2m5iu16tCWuQG1m
 dx/4Vn6wKESA5zdAVp2ssOawvrRQIiujDiDAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GoWsMygASIRyu7PZgD3N2dBBnQZB9nQ/7GbuLV2HYnY=;
 b=LIyj7nuBWUw29tGBwBmYQUcwKl4c6am8Gnm4DrhOHPQQeMZ49yHhqS2pNB1hsIhqhU
 QCQNYbvyPTOJbGSYni0QTaXKg27rHv9aO9md6Ui4489aSyjW2k8gOuPcin0hU9XdyTIq
 wWv9/mRgHBw0tYkG4gyyBbiJCAQ4Npw161fZ+iPiNzZCOBK/521/KterhQsdDHDP0sPt
 gg3V/Wy6hiODBa7mvgC9H1hLh/zNtMgln/XsBb6tFf83qRSrGEqnTWofSXRK3WWQYDpW
 YUTR/5/rMp7RpjIFV9N/dPO5iA3MHTY0QBHr95LzwvrmWDGM+P/caVe89ka4zIO6IP2w
 hVAg==
X-Gm-Message-State: ABuFfoj4eLU7DkvvaDK5Z4znUMYQc4KuI9lEnXvcV++A8SleN+MkWfK+
 0Uook3cnOBduzs/AX9VRqk1JPw==
X-Google-Smtp-Source: ACcGV61mIIBnEva6K1s4pwIUv1udY8Qs2DvoHn+puuc+AYRgF7l/b6wUFQE1+gRiz97iAhmfFDPhRQ==
X-Received: by 2002:a63:f64f:: with SMTP id
 u15-v6mr10134944pgj.258.1539453041895; 
 Sat, 13 Oct 2018 10:50:41 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id t26-v6sm7479626pfa.158.2018.10.13.10.50.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 13 Oct 2018 10:50:40 -0700 (PDT)
Date: Sat, 13 Oct 2018 10:50:39 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: dancol@google.com
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181013175039.GB213522@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
 <20181013013540.GA207108@joelaf.mtv.corp.google.com>
 <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
 <20181013014429.GB207108@joelaf.mtv.corp.google.com>
 <CAKOZues25aaKz3_AiyfJ=r2QBd5MghgY3ky_ptg4Z8=ST4DCgw@mail.gmail.com>
 <20181013021057.GA213522@joelaf.mtv.corp.google.com>
 <CAKOZueu2wdkeUFYLQ8qE48yJs1_uRz-9RVJRkp==CL=jp=Q8+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKOZueu2wdkeUFYLQ8qE48yJs1_uRz-9RVJRkp==CL=jp=Q8+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181013_105055_696226_D91EF2CE 
X-CRM114-Status: GOOD (  21.49  )
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
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 Lokesh Gidra <lokeshgidra@google.com>, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, deller@gmx.de, Hugh Dickins <hughd@google.com>,
 jejb@parisc-linux.org, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, mingo@redhat.com, geert@linux-m68k.org,
 aryabinin@virtuozzo.com, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, fenghua.yu@intel.com, jdike@addtoit.com,
 linux-um@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name, gxt@pku.edu.cn,
 Chris Zankel <chris@zankel.net>, richard@nod.at, linux-parisc@vger.kernel.org,
 Ramon Pantin <pantin@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 linux-alpha@vger.kernel.org, lftan@altera.com,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013175039.sFwNXAvloB4rnfWOE8R1rQoeX3NktdeCxrowqmf33io@z>

On Fri, Oct 12, 2018 at 07:25:08PM -0700, Daniel Colascione wrote:
[...] 
> > But anyway, I think this runtime detection thing is not needed. THP is
> > actually expected to be as fast as this anyway, so if that's available then
> > we should already be as fast.
> 
> Ah, I think the commit message is confusing. (Or else I'm misreading
> the patch now.) It's not quite that we're disabling the feature when
> THP is enabled anywhere, but rather that we use the move_huge_pmd path
> for huge PMDs and use the new code only for non-huge PMDs. (Right?) If
> that's the case, the commit message shouldn't say "Incase THP is
> enabled, the optimization is skipped". Even if THP is enabled on a
> system generally, we might use the new PMD-moving code for mapping
> types that don't support THP-ization, right?

That is true. Ok, I guess I can update the commit message to be more accurate
about that.

> > This is for non-THP where THP cannot be enabled
> > and there is still room for some improvement. Most/all architectures will be
> > just fine with this. This flag is more of a safety-net type of thing where in
> > the future if there is this one or two weird architectures that don't play
> > well, then they can turn it off at the architecture level by not selecting
> > the flag. See my latest patches for the per-architecture compile-time
> > controls. Ideally we'd like to blanket turn it on on all, but this is just
> > playing it extra safe as Kirill and me were discussing on other threads.
> 
> Sure. I'm just pointing out that the 500x performance different turns
> the operation into a qualitatively different feature, so if we expect
> to actually ship a mainstream architecture without support for this
> thing, we should make it explicit. If we're not, we shouldn't.

We can make it explicit by enabling it in such a mainstream architecture is
my point. Also if the optimization is not doing what its supposed to, then
userspace will also just know by measuring the time.

thanks,

 - Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
