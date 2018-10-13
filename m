Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F732C71122
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 01:54:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4840420865
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 01:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JKQVJqct";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="oO7CQBJ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4840420865
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9SRHhdmruuMTeJG6tcR+kvUVljT/pxo2MX5n3PWq9A=; b=JKQVJqctSMCawT
	aaoebvMk4WR7i2EBiloE+eTEX4jERA1NsJIrAouv4qifyzRY2YQrQEh5dC9Oz3Kof1uUXAFaHpiEP
	7DwDf2fFiLsv115FvdlhlrI5eVJU77WZ3wuPjcBFc8WigiYUt5JywyhTFylp9VlVcQbt5aC33qLJB
	DpMufqDLyFQm8GQ8BAFLRwVVSwKM+suA41ZzfDZ/6hGqJSyCrnLuJAGHDmiXMKtrkVvdKL8EBnyDr
	EEcBkLW9RxZjj5XRmHii5RsMrsDVDgDBQ84jE3ttBRHo6rSizg3WrFmO7vEKkC91vD3jPNAdHpSQY
	jqjwNWEK6d/Lhe7/aZWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB98q-0003Hc-1X; Sat, 13 Oct 2018 01:54:56 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB98m-0003EH-RA
 for linux-riscv@lists.infradead.org; Sat, 13 Oct 2018 01:54:54 +0000
Received: by mail-ot1-x343.google.com with SMTP id c32so14078679otb.8
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 18:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ruDqHADLGhUq/OqjXNRFevT5jDn0habRcwA3l0QGuG8=;
 b=oO7CQBJ0o3h4W+oksCLNlcAMMdo7sg4Jtv1VCUZcuw6SrUuKQoC7/yRbVEByqVegR5
 2XakAmI6gLBq49bXmjVYz4+acBeAcuwKtUHPjj2sGXy+jzOkdhqdTL0YPcZPqB+LKt6o
 bhRful9oO7cRR8nbmHw1A7uqI9ttcB1fV31XpSXw7a9IcC+joMzcgVc8TxQKKcRQt8Re
 zoNMfZUWu+1do2+6RW0MSWVyN/9DUjKrGt5dJpbjxpWiCS22HxYleuy9uZIoJeze7/q0
 zCoyyhRBLvqgZ71FAynWB3xe4pRvB3ibgZGe60xwaYIUrVPx8bwkXyzud+F7R7U1MaXx
 /VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ruDqHADLGhUq/OqjXNRFevT5jDn0habRcwA3l0QGuG8=;
 b=l8rghv4xbJYFoEp1oEBqP3z05Yf5180/JHOmicxcBxHMTJtp3utqRhEsgln+gHh7b7
 Ay/pvw6IIsESx0xJgK2LWVPaqvuo7BD1BitpQoQhR6n05aobAVs6bJ+zcJ09L1FrPV8s
 niq75EqN5Pj9vIj0U9gL0hEvsArMjarMaRyuvOpLqnkVRhHfbFkaFDy8vGUQgddrUCT9
 en1L4raOZrfnzUjEh12bejGuutTgpIPDTZI1YB5Sj/yiF1ekLKYq81MwWDHxSgbaJdh8
 prCSKhpc/Tl3F1tZisU0WgMy7L7YQ63VTzeLy7ehsUbpmTn5bQiCZtaC+YdOSKmK5rTM
 IxaQ==
X-Gm-Message-State: ABuFfoitUGrYC/Y0HgMi0mraAikV6iicfajVNvuoH7PTIScy/1edZX8Z
 RZhgyR6n5RUP56vJOzJvW/9H+SRmhmMQ7f+Ry14zyQ==
X-Google-Smtp-Source: ACcGV61wTHJT8KA0FRbB4T8HJavFhx8DCnBEFcv7It/8YmRplkdtkLJbpEFBtddWCai0iE4efhP92rfUMrMKw3tumlM=
X-Received: by 2002:a9d:3a21:: with SMTP id j30mr2325823otc.237.1539395674440; 
 Fri, 12 Oct 2018 18:54:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:56d8:0:0:0:0:0 with HTTP; Fri, 12 Oct 2018 18:54:33
 -0700 (PDT)
In-Reply-To: <20181013014429.GB207108@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
 <20181013013540.GA207108@joelaf.mtv.corp.google.com>
 <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
 <20181013014429.GB207108@joelaf.mtv.corp.google.com>
From: Daniel Colascione <dancol@google.com>
Date: Fri, 12 Oct 2018 18:54:33 -0700
Message-ID:
 <CAKOZues25aaKz3_AiyfJ=r2QBd5MghgY3ky_ptg4Z8=ST4DCgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
To: Joel Fernandes <joel@joelfernandes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_185452_914611_715C698D 
X-CRM114-Status: GOOD (  10.72  )
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
Message-ID: <20181013015433.VDJNaVLewX29nj0zVLXYDW4QRARV-_o6DPkot-OZxXM@z>

I wonder whether it makes sense to expose to userspace somehow whether
mremap is "fast" for a particular architecture. If a feature relies on
fast mremap, it might be better for some userland component to disable
that feature entirely rather than blindly use mremap and end up
performing very poorly. If we're disabling fast mremap when THP is
enabled, the userland component can't just rely on an architecture
switch and some kind of runtime feature detection becomes even more
important.

On Fri, Oct 12, 2018 at 6:44 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> On Fri, Oct 12, 2018 at 06:39:45PM -0700, Daniel Colascione wrote:
>> Not 32-bit ARM?
>
> Well, I didn't want to enable every possible architecture we could in a
> single go. Certainly arm32 can be a follow on enablement as can be other
> architectures. The point of this series is to upstream this feature and
> enable a hand-picked few architectures as a first step.
>
> thanks,
>
>  - Joel
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
