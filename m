Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11A4C2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 00:12:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D01A223C7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 00:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxHF/RkW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mPTbV2Uh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D01A223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yU9zS2EltGwg0smR6IkUkqpLYq6oU4yIeOobu9PXDXI=; b=YxHF/RkW6mlWwTQlW/XUCtv97
	nA/SKfe+hF68VarNfzOs5/s4HnQnNMQJzCVJod4ROK2h93rN+mkZZ20eOeNoWqmS7sH3tIEzBV9cA
	59pB42P9GcMm0YRfjBs3p6QPlNOOB+GH+ZuDG0zvw5k5r6aJvpqP8yKbVaNhZ9MSGHa6b1+HGjxbO
	GQE3KNng3y/BIk+R02ftpU/KOxprKD7n5dqzWsYqdTehXpESlEdLbsPPXH4DIibl5cVwbUsKxY22N
	TdFpdgsO7c/IFrpnTFQ5sw24Gb/THds+xRp3LrDAvStaCxig+RbWkvuAqpsYrpGlUtiF1sW142AhE
	KxXjPL7RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka6Oy-0004wC-Th; Wed, 04 Nov 2020 00:11:49 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka6Ow-0004vZ-BZ
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 00:11:47 +0000
Received: by mail-pg1-x541.google.com with SMTP id w4so4794948pgg.13
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 16:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NFjsAF4kgpQCHVIlKmgYN6bEVL36r1XibqsUv152D08=;
 b=mPTbV2UhVfnJP2OoJL4D5QLosesGivMu0Yj5j7pkCrVtHA6dueaCzR1JSWWklnSxS2
 Wgzos2joCi+Wlp8KUeVXQhCOJbK/Z4g4eTF82BJYkvr8uaU2CIt3++/EZgLF7nCLiPmR
 RFfDgHAz/9hjV1ZrPMZTrZyKkXhcZM/AoX3+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NFjsAF4kgpQCHVIlKmgYN6bEVL36r1XibqsUv152D08=;
 b=XA7w69b1Q0C0D8SEwFhPbo1+zT2ioEAfQ7yRZhQSaxGboTnOUFfgSvb5FMI+xyR/sq
 hHngfPKfHmJG4/ij3G4X2iY2Z8QGKVTX/CYH+Do3oiiZeoPz26K+NCMfwAOenpsHhSp+
 Kcc1TZPJyKdTOpYsNSRg0MCsD3IH7ErR3Bs5S8CMNPpVJA5E+vJhbRS9nBV3sljI+JZ8
 guZFkqDonKBFdLcuFSTG/j9K9UDY+GDrOPU5/cpDitsxwgs0DXh0OsaF3JM4+k27JAqP
 x+8OIADdl6UuIxf+0joMdINUaHAd+gw+AoO44YnnmraFjSDNd5BsUP5ujQwLSWcwLyF8
 ZvZQ==
X-Gm-Message-State: AOAM5330grNSpukcrQFRh/tZHAvKzzfuzvBUCMHMyDjgCwaYO+OYktie
 MBNOThvl/QBnRKgFE3k9M/cbIg==
X-Google-Smtp-Source: ABdhPJybME+aS3qtjx8JuwpcYMqCGEp0y1Q8idII2QCmSunt2ifzlNcehSCk1E6c+iZLzWwdlgTh0g==
X-Received: by 2002:a17:90a:5285:: with SMTP id
 w5mr1762165pjh.50.1604448702345; 
 Tue, 03 Nov 2020 16:11:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j20sm118311pgl.40.2020.11.03.16.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 16:11:41 -0800 (PST)
Date: Tue, 3 Nov 2020 16:11:40 -0800
From: Kees Cook <keescook@chromium.org>
To: YiFei Zhu <zhuyifei1999@gmail.com>
Subject: Re: [PATCH seccomp 0/8] seccomp: add bitmap cache support on
 remaining arches and report cache in procfs
Message-ID: <202011031606.423EC9E@keescook>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_191146_460067_87ABD1F6 
X-CRM114-Status: GOOD (  21.65  )
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Jann Horn <jannh@google.com>,
 Valentin Rothberg <vrothber@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Josep Torrellas <torrella@illinois.edu>, Will Drewry <wad@chromium.org>,
 linux-parisc@vger.kernel.org, containers@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 07:42:56AM -0600, YiFei Zhu wrote:
> From: YiFei Zhu <yifeifz2@illinois.edu>
> 
> This patch series enables bitmap cache for the remaining arches with
> SECCOMP_FILTER, other than MIPS.
> 
> I was unable to find any of the arches having subarch-specific NR_syscalls
> macros, so generic NR_syscalls is used. SH's syscall_get_arch seems to
> only have the 32-bit subarch implementation. I'm not sure if this is
> expected.
> 
> This series has not been tested; I have not built all the cross compilers
> necessary to build test, let alone run the kernel or benchmark the
> performance, so help on making sure the bitmap cache works as expected
> would be appreciated. The series applies on top of Kees's for-next/seccomp
> branch.

Thank you! This looks good. I wonder if the different handling of little
endian is worth solving -- I'm suspicious about powerpc's use of
__LITTLE_ENDIAN__ vs a CONFIG, but I guess the compiler would match the
target endian-ness. Regardless, it captures what the architectures are
doing, and gets things standardized.

> 
> YiFei Zhu (8):
>   csky: Enable seccomp architecture tracking
>   parisc: Enable seccomp architecture tracking

I don't have compilers for these.

>   powerpc: Enable seccomp architecture tracking
>   riscv: Enable seccomp architecture tracking
>   s390: Enable seccomp architecture tracking

These I can build-test immediately.

>   sh: Enable seccomp architecture tracking
>   xtensa: Enable seccomp architecture tracking

These two are available in Ubuntu's cross compiler set, so I'll get them
added to my cross-builders.

>   seccomp/cache: Report cache data through /proc/pid/seccomp_cache

In the meantime, I'll wait a bit to see if we can get some Acks/Reviews
from arch maintainers. :)

-Kees

> 
>  arch/Kconfig                       | 15 ++++++++
>  arch/csky/include/asm/Kbuild       |  1 -
>  arch/csky/include/asm/seccomp.h    | 11 ++++++
>  arch/parisc/include/asm/Kbuild     |  1 -
>  arch/parisc/include/asm/seccomp.h  | 22 +++++++++++
>  arch/powerpc/include/asm/seccomp.h | 21 +++++++++++
>  arch/riscv/include/asm/seccomp.h   | 10 +++++
>  arch/s390/include/asm/seccomp.h    |  9 +++++
>  arch/sh/include/asm/seccomp.h      | 10 +++++
>  arch/xtensa/include/asm/Kbuild     |  1 -
>  arch/xtensa/include/asm/seccomp.h  | 11 ++++++
>  fs/proc/base.c                     |  6 +++
>  include/linux/seccomp.h            |  7 ++++
>  kernel/seccomp.c                   | 59 ++++++++++++++++++++++++++++++
>  14 files changed, 181 insertions(+), 3 deletions(-)
>  create mode 100644 arch/csky/include/asm/seccomp.h
>  create mode 100644 arch/parisc/include/asm/seccomp.h
>  create mode 100644 arch/xtensa/include/asm/seccomp.h
> 
> 
> base-commit: 38c37e8fd3d2590c4234d8cfbc22158362f0eb04
> --
> 2.29.2

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
