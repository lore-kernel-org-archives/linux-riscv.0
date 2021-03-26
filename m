Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDE5C433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 08:38:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD74619BB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 08:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CD74619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bu7SauvSyVwNU+EhQTXcx8rxTXD/wp8I7y3rQusIiMc=; b=ceCfwmU6gJGNmP/d0YLqAYO9x
	8Sg9ChfPv8FAUcrofTkzD7ZZYvY90xyJbCxw/PgGitOSiJeSJOkCHvugQamAu3Dt97ljtW1qpszZA
	Q/tAcAtAgfGRm73Ag7AbCePdGlU28EzdX63hGZw1sF1e7h23+xb9X9IiKrZykywiBRs+Wu5Fv4SW0
	SYzUm2wKnQgNDWD01mcIH9UWByqB4MQcuQWh8ebEktytiM4vZvO1gWBeeoiGhkkXEIizPUcGOJsT+
	2srCRQlcFYfr6TJB9ZkoADxBnm/0C+XcRgHo/yeEH3pCAV+sumUk+ikZ8fjymra8KvV9LTXumpCy3
	47D0oTofQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPhzL-0032GR-Iy; Fri, 26 Mar 2021 08:38:39 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPhzG-0032F5-6I
 for linux-riscv@lists.infradead.org; Fri, 26 Mar 2021 08:38:36 +0000
Received: by mail-io1-xd2f.google.com with SMTP id x16so4622405iob.1
 for <linux-riscv@lists.infradead.org>; Fri, 26 Mar 2021 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=GuhNBMfb4hYHF8Dvll8qk+/OkL+kGWlRUKt4MNqIm78=;
 b=pQlYGB7i1fTagrQL8ZahXbuVoa7nLYSNqXV2OgpmXfdez2GKWFDsc8WlGD7ecsBtTX
 eBDobmPP/I0bYWXgogvHq1OBAxKaEyaCYFaXkD3sindpc9CNIV4hZmhIrc+hPnTtHWA0
 JWFEegJOg6BSKlfxlTP8pQlqZXhQN2Few6iH5x6V3LQ+6LN79qin646nZ3BlTxGu1Iqa
 FqvVTwcKrTsyYIgcPPa1dsojUHYZ63P4augntBXJDNWCujD897lk1sUHPuweOQgFwPNI
 ImYixt74gHJAInlTwDpanxxVKIjfWN9nO/WagRR5vXCl/p3fJew6YI8aHxVRSTukJrch
 5qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=GuhNBMfb4hYHF8Dvll8qk+/OkL+kGWlRUKt4MNqIm78=;
 b=XWNAVIS+WkpwPvVQ2NUxPMvrJgKBwUUVIlghCqJkktmKJU49smBKs5RBCi0/f+lA79
 V9ZDhriOEtwP8SbFEWLLtWUp3Pu3l8WrNf1eAlHklJ3xOtCvcirHZi+5D/w93pXk5rDn
 LTByUc3vJJNDK45N11aieQTiGYPFxdzzbwnCGL4E4AVK/+f+/EE8O+1mF3jhIYXUc/1t
 D6cBmpLtAz9NogasXT+u6e5HiusjbEN2EC3qP6q50bq1pErxa7zc+oUg2PqgkyTNpZe0
 W0Ifr6EIMP5yI3haC3UeeWOwJZHwMjaK8G5zprGLRoAp0svI/K3mY2UdyOcNusPsWRez
 wCmA==
X-Gm-Message-State: AOAM533zdhTYPIyZZ1vtQNKD8ZUbH7xdUVSPU4loV0Syge2mqiq5oQAX
 Kq9ZkUWYAnUzhNYv5xU4VgrEIPiLqCV7lOh1rSY=
X-Google-Smtp-Source: ABdhPJzFLpEIBJOC5vBSPe8rAMg+aO/wThi0+tlUhyN/NoXs4BbB5whXFHrDSEWyoiii52lEQn3Dbr8onwTQzN8P3VI=
X-Received: by 2002:a05:6638:1388:: with SMTP id
 w8mr5089745jad.30.1616747911961; 
 Fri, 26 Mar 2021 01:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210325223807.2423265-1-nathan@kernel.org>
In-Reply-To: <20210325223807.2423265-1-nathan@kernel.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 26 Mar 2021 09:37:55 +0100
Message-ID: <CA+icZUWgxmrtM=oj-aJi1KXxZx0YUZDiUPK42MjHvqS96aazYQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix CONFIG_FUNCTION_TRACER with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_083834_314501_42A9EBD2 
X-CRM114-Status: GOOD (  24.55  )
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
Reply-To: sedat.dilek@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 25, 2021 at 11:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi all,
>
> This series fixes function tracing with clang.
>
> Patch 1 adjusts the mcount regex in scripts/recordmcount.pl to handle
> the presence of PLT relocations, which happen with clang. Without this,
> the mcount_loc section will not be created properly.
>
> Patch 2 adds a workaround for clang less than 13.0.0 in relation to the
> mcount symbol name, which was "mcount" rather than "_mcount". This was
> written as a separate patch so that it can be reverted when the minimum
> clang version is bumped to clang 13.0.0.
>
> Patch 3 avoids a build error when -fpatchable-function-entry is not
> available, which is the case with clang less than 13.0.0. This will make
> dynamic ftrace unavailable but all of the other function tracing should
> work due to the prescence of the previous patch.
>
> I am hoping this series can go in as fixes for 5.12, due to patch 3, but
> if not, they can always be backported (patches 1 and 2 are already
> marked for stable).
>
> This series has been build tested with gcc-8 through gcc-10 and clang-11
> through clang-13 with defconfig and nommu_virt_defconfig plus
> CONFIG_FTRACE=y and CONFIG_FUNCTION_TRACER=y then boot tested under
> QEMU.
>
> Cheers,
> Nathan
>
> Nathan Chancellor (3):
>   scripts/recordmcount.pl: Fix RISC-V regex for clang
>   riscv: Workaround mcount name prior to clang-13
>   riscv: Select HAVE_DYNAMIC_FTRACE when -fpatchable-function-entry is
>     available
>

Does this only fixes stuff for clang + riscv?
If so, please put a label "riscv" also in the cover-letter.

- Sedat -

>  arch/riscv/Kconfig              |  2 +-
>  arch/riscv/include/asm/ftrace.h | 14 ++++++++++++--
>  arch/riscv/kernel/mcount.S      | 10 +++++-----
>  scripts/recordmcount.pl         |  2 +-
>  4 files changed, 19 insertions(+), 9 deletions(-)
>
> --
> 2.31.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210325223807.2423265-1-nathan%40kernel.org.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
