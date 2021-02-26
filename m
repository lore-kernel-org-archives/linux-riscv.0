Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFEFC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 19:43:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA62564F1B
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 19:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA62564F1B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x/aqzGeq6WD1fLu/xFMbWrEx4/y3ICA8FGsrh6h5T2o=; b=aVOClUKYghHyONpmIiT0QsPmi
	7Go8Nf6HGQV5zPwtBsUKQzmPcENlRSh50DtkgttkCW61rp+UbzbH5JsnfOxIumI89NEdBbZhgbB35
	RqquW7UoQeeqhKdq+dv2jh6BnNE3995/W/PFTo+hgfal2sWDsFWwNLeemxGImQT+jfXEBPOvvGZst
	mFzfmy+AoCPCnDwWmMqHEVZAjRhqic/nNHnJab8863n+egKZiFxtwT3V0wPRoEwoOGyIJwrfOd9MO
	XGBPcVQCcU1OhxqRG9BxF2pbcJnzVYKy5LSU6zMSl5U7yEjRAFb0N4kFW2p602NX9HHXstkghRXtV
	0A7PMxE9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFj1V-000226-0Z; Fri, 26 Feb 2021 19:43:37 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFj1T-00021Q-GZ
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 19:43:36 +0000
Received: by mail-il1-x134.google.com with SMTP id v8so5391035ilh.12
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 11:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nQgQdVxzCnygvmyr7XzmI9Y87BNsqr8+LRCIrqPVOU=;
 b=MfY8kMClqiFIJcCusiF8ttnXu4ZoQYb9jLsnO3mdL64dpXRJGtgXba1m9oXp5iasWZ
 llQQyWf8ip79oy+Pj8rhXb4khhifyJVfiLDy8BeZYOE+SQgvWW9tP0E0wOrxOIbG+9MM
 T+mDKl4sBBFqPDEvHjKcwYn68NQM4q5bCcJcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nQgQdVxzCnygvmyr7XzmI9Y87BNsqr8+LRCIrqPVOU=;
 b=Pqd3XIuCvbNmof3HEr5rh7ddi2tDlAGDdRSuI6RficACREOFhJZhL9TZjFrGLWL9lV
 6PIlvJdW1/cp25/IRuxIEbo/Z0Ao4yLCoqyvxvk300J9VI16sCFNxJLOo2Ya5DaN0gv0
 jSbfcaAVxhTZZ4JBxcXxEfkpGSj3cEZqSjvxF0hO5X6TrlBQrY1iez/m3tjwwUVG/s2K
 VXAUEPWVsZw6qvNORbinEKoFOiVpJdKV6DEa2Kd2Gshln0zfdyM0Cvj3K2UD7kTVlNLw
 nUINFVGTwC3LsWkEDRj+G69rMDlFMo1aSY6nAkL+A8YMMFFZOCekk2FZ+jSVBxDIbT+A
 W5ag==
X-Gm-Message-State: AOAM5327kQuXKA1ZyZvjd1CUo0OToc/AoqIpj0mGGa4NecU1Tjk3weh8
 eZK5t2gfVBaKV++r6/3y17xM225HHUwPQTDb9hrYUY7bFc2R
X-Google-Smtp-Source: ABdhPJzYDv6D5ONb3zbIXZYSGU8bolm9zrWPEHcck1L2SRZ25z6jby4x1ZeeTlXHH7JrXq/FxNNzPA/JGRVShETttw8=
X-Received: by 2002:a05:6e02:1608:: with SMTP id
 t8mr3784291ilu.79.1614368611817; 
 Fri, 26 Feb 2021 11:43:31 -0800 (PST)
MIME-Version: 1.0
References: <6039178e.nIA6K0eHFcbkwcNB%lkp@intel.com>
 <20210226111336.91a89c0f5230eae69196f71e@linux-foundation.org>
In-Reply-To: <20210226111336.91a89c0f5230eae69196f71e@linux-foundation.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 26 Feb 2021 11:43:21 -0800
Message-ID: <CAOnJCULoVsPJajC0XD43_Ux9=U1HvYhJcJRTUDyKAkGqvTi_cA@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 d01f2f7e35573049673b71e18be7abfe3f80323f
To: Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_144335_564085_4D1ABB52 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, kernel test robot <lkp@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 26, 2021 at 11:13 AM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Fri, 26 Feb 2021 23:45:18 +0800 kernel test robot <lkp@intel.com> wrote:
>
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > branch HEAD: d01f2f7e35573049673b71e18be7abfe3f80323f  Add linux-next specific files for 20210226
> >
> > ...
> >
> > page_alloc.c:(.text+0xe028): undefined reference to `node_reclaim_distance'
> > riscv32-linux-ld: page_alloc.c:(.text+0xe02c): undefined reference to `node_reclaim_distance'
> >
> > ...
> >
> > |-- riscv-randconfig-p001-20210226
> > |   |-- page_alloc.c:(.text):undefined-reference-to-node_reclaim_distance
> > |   `-- riscv32-linux-ld:page_alloc.c:(.text):undefined-reference-to-node_reclaim_distance
>
> I assume the riscv randconfig managed to create a .config with
> CONFIG_NUMA=n, CONFIG_SMP=y.  Configuration doesn't make a lot of
> sense, unless someone has a single-CPU machine with cpuless nodes...
>
> Could the riscv maintainers please test and merge this?
>

Yeah. This was discussed a week back.
http://lists.infradead.org/pipermail/linux-riscv/2021-February/004640.html

@Palmer Dabbelt Is the fix merged in the PR ?

> --- a/arch/riscv/Kconfig~a
> +++ a/arch/riscv/Kconfig
> @@ -314,6 +314,7 @@ endchoice
>  # Common NUMA Features
>  config NUMA
>         bool "NUMA Memory Allocation and Scheduler Support"
> +       depends on SMP
>         select GENERIC_ARCH_NUMA
>         select OF_NUMA
>         select ARCH_SUPPORTS_NUMA_BALANCING
> _
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
