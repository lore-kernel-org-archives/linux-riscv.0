Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0006BC6787C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 02:11:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B0B20895
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 02:11:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ocXRNal1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="N2gi5ZnN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B0B20895
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrjwdsNXt50TWoQ+3sta4EY/4Zaz+p4PSWfMiIdQHF0=; b=ocXRNal15X+qTO
	eNgTJhpp2VlTapruOPMzSNO3JJbKiBdpmK+vUPl/3Y3WOzsCAiVzWpfts0XX62r3AixN0o21KRGU7
	45v2edclLzpbSEuhQaNgCws2eMzTpwodMV7c7q04yCMtMto/fuAZ4zTE5eHYBHsl/i16wMC3dJkK9
	yTGIJTyrglb0Re2hKmX2gu4pIsbJn66Ag6IMqjf0YOO9Tr3wIJZpYay/DrbbExhys6LPHUPz6XXMN
	09cUNbonB/XkWctEOyyd8Zu/vmYaDPrtOc5KcEze1pJTijd6CrWg/0r/9fbmjqQbzpn8VESIK+5IX
	GDsu/NbUtMN6M1znOwUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB9Oc-0001k2-Jp; Sat, 13 Oct 2018 02:11:14 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB9OY-0001i9-Oz
 for linux-riscv@lists.infradead.org; Sat, 13 Oct 2018 02:11:12 +0000
Received: by mail-pg1-x543.google.com with SMTP id i4-v6so6621514pgq.9
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 19:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6XZWKP2pbysVG8F4WKX4YkunFpUXVJoneS2qWT0rIgM=;
 b=N2gi5ZnNq30pQxOnEBYq6zdh6G0ns+SI6AVZkhimNQGD9yQOm5UYR6JGFwS2BUFCIW
 FauhTl3Q+WSZVHehFg8SNEE/bWYFsI9CNtDr8BWvee6Gq8YU62TJwxNiZpLSShCoUVdR
 L56i07BfoCPIOURgBXyQvQokxNKgq+N+jyEKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6XZWKP2pbysVG8F4WKX4YkunFpUXVJoneS2qWT0rIgM=;
 b=dYzNlAttyvfVh1EvHUxaFJtOLW0q2HmgZbkZ30NVtctMhovzMiKEs05kMK3UFIgVx4
 iSuR5x4xBGVTxAyXPJetkSkoR5JzzteVZcaUus/XdJik+lwM+7bkDzY63MJYRfcDXUJ2
 GZGiMIvL9ZB2cMa3ZxS2d61rcRkVLOdAIrqEGudOt+7AhY2DhzujRyxpu2WyzV7ByaWu
 /cmU1gXJjgi6NgMJRA5cAmQQ7HSa3WlgWzMBvhRJhkegwXgK6Lyy/XYEiHT6uLoD70fu
 tLz/zngzX/uKWDwCPxVuahylY5uYHIUzN+XQNO0N1glMIY4bNGVK5Gl8+wQ+iCT1azsQ
 HbnQ==
X-Gm-Message-State: ABuFfoiGcEXa9f+5P545x/Qs1VE8hoei1b6pZCGqG19cOgXh75B1E7Yr
 q64VTMjMqNSetnJ7dc9KhlGSSg==
X-Google-Smtp-Source: ACcGV63F+9SrXFCpEUHB+XptA5Iqqus34UkUro+5Ai/GVN+L0Yg6ILmrGMV/JAu7RXyjGdEg/oMq4Q==
X-Received: by 2002:a65:5147:: with SMTP id
 g7-v6mr7890713pgq.252.1539396659739; 
 Fri, 12 Oct 2018 19:10:59 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id b29-v6sm4669490pfj.183.2018.10.12.19.10.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 19:10:58 -0700 (PDT)
Date: Fri, 12 Oct 2018 19:10:57 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Daniel Colascione <dancol@google.com>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181013021057.GA213522@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
 <20181013013540.GA207108@joelaf.mtv.corp.google.com>
 <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
 <20181013014429.GB207108@joelaf.mtv.corp.google.com>
 <CAKOZues25aaKz3_AiyfJ=r2QBd5MghgY3ky_ptg4Z8=ST4DCgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKOZues25aaKz3_AiyfJ=r2QBd5MghgY3ky_ptg4Z8=ST4DCgw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_191110_832720_7F502443 
X-CRM114-Status: GOOD (  14.02  )
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
 elfring@users.sourceforge.net, jonas@southpole.se, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-hexagon@vger.kernel.org, deller@gmx.de,
 hughd@google.com, jejb@parisc-linux.org, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, mingo@redhat.com, geert@linux-m68k.org,
 aryabinin@virtuozzo.com, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, fenghua.yu@intel.com, jdike@addtoit.com,
 linux-um@lists.infradead.org, Julia.Lawall@lip6.fr,
 linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name, gxt@pku.edu.cn,
 chris@zankel.net, richard@nod.at, linux-parisc@vger.kernel.org,
 Ramon Pantin <pantin@google.com>, jcmvbkbc@gmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 linux-alpha@vger.kernel.org, lftan@altera.com,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013021057.3DjOKygTtQraVEYjiIqIEnSJPVGOCSa-3FSP3PwyaGc@z>

On Fri, Oct 12, 2018 at 06:54:33PM -0700, Daniel Colascione wrote:
> I wonder whether it makes sense to expose to userspace somehow whether
> mremap is "fast" for a particular architecture. If a feature relies on
> fast mremap, it might be better for some userland component to disable
> that feature entirely rather than blindly use mremap and end up
> performing very poorly. If we're disabling fast mremap when THP is
> enabled, the userland component can't just rely on an architecture
> switch and some kind of runtime feature detection becomes even more
> important.

I hate to point out that its forbidden to top post on LKML :-)
https://kernelnewbies.org/mailinglistguidelines
So don't that Mr. Dan! :D

But anyway, I think this runtime detection thing is not needed. THP is
actually expected to be as fast as this anyway, so if that's available then
we should already be as fast. This is for non-THP where THP cannot be enabled
and there is still room for some improvement. Most/all architectures will be
just fine with this. This flag is more of a safety-net type of thing where in
the future if there is this one or two weird architectures that don't play
well, then they can turn it off at the architecture level by not selecting
the flag. See my latest patches for the per-architecture compile-time
controls. Ideally we'd like to blanket turn it on on all, but this is just
playing it extra safe as Kirill and me were discussing on other threads.

thanks!

- Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
