Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBADDC54E94
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ndo7nXz1GFw/eBYrngiwmMruY8qhRufCigIfT4Ronk=; b=IT+djAencptJ43
	H09KvQEafnl58n7XqnacGzJeO0FKIVGcsmr75nrJqx/PrY70AH6D6CWIuhJ6QH5sakAXyjkMCP38n
	PSXy9bTa8kGlIwS9x8RiTq0T+Y65t5xzhwJoTzWhi0z1Pd8DsgBJL1l67K5Sml1kiG/mSVBtvBVqG
	BuifBrfRP+z666+919u4UkDO8BofOiad6nDMFjWno9BrHTCD4T/ylFlEmIHOKzZCRMhed04QGeeCr
	zsb3ojyKiOAb3CbrzAahg/4aBq3Gjj7ibIsDorDVkqkQp1Z2THV0JeC9dQc+Feyi4PuwknLXZngiH
	Bs+Ezvtw7qPxwKJvy6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJsK-004A4V-Gj; Tue, 24 Jan 2023 14:02:12 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJb8-00426R-AL; Tue, 24 Jan 2023 13:44:28 +0000
Received: by mail-vs1-f41.google.com with SMTP id d66so16440279vsd.9;
        Tue, 24 Jan 2023 05:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6DU+ytc1NqENDkZNmeISMtYPcZVMd3z1m1alcPvP8E=;
        b=iimUKuoTgLAEcFFbXjXLM+sIhgv49FbTy9HFxLTxeQ3D5UqH6Oxqc8YrhC1EivCrJ2
         1WRG+2DmAFzSA3fYtpWX60sshX0QuiAmUhoogjj+ShvItgXlCzim2DSmA6+NAkV5Fc4I
         XK4V8MbzcpFLa6cOZti4wjpRf3o+rPofpahoqy/XU3WOgmrf81S/d0jDqOtQFBdUYSnF
         ifxzmbcl5LaZfFNB+OWtCRp4T2x59qnVhxLcDY7uyrFHcsGHq5qGFJzkIz7h93U/Rc0A
         VyFmi6LjuVZ1sAgDOepN7uvU23Ifh2cW+P96a0UGZnuowRv2bfzSR7wgXSMDSrIhc6e4
         M1dg==
X-Gm-Message-State: AFqh2kpIZ+HUYP6Dm8+MjqG+xCSGDMUVq8HHJHW1O9ptzzlbuOOAiRdJ
	5+q61fHCyWCPm7okDWC0R/SUe0n+IoAL/Q==
X-Google-Smtp-Source: AMrXdXsy+2deLGsHrVya3u0tV9oY8td+to4FXWDRcSokbALk2+S3ZAeRbjgw574bG8bENFKnq0fPbg==
X-Received: by 2002:a67:fbc4:0:b0:3d1:4bb9:d08a with SMTP id o4-20020a67fbc4000000b003d14bb9d08amr18258166vsr.7.1674567862522;
        Tue, 24 Jan 2023 05:44:22 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id d26-20020a05620a159a00b006feea093006sm1407085qkk.124.2023.01.24.05.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 05:44:22 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id x4so17096158ybp.1;
        Tue, 24 Jan 2023 05:44:21 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr2648671ybg.202.1674567861745; Tue, 24
 Jan 2023 05:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20230120121856.1407369-1-sudeep.holla@arm.com>
In-Reply-To: <20230120121856.1407369-1-sudeep.holla@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jan 2023 14:44:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZzLkWvhQ=YeH2KfQ_FRidemfOvbbHf_b1AHROK9HFNA@mail.gmail.com>
Message-ID: <CAMuHMdUZzLkWvhQ=YeH2KfQ_FRidemfOvbbHf_b1AHROK9HFNA@mail.gmail.com>
Subject: Re: [GIT PULL] cacheinfo/arch_topology: Updates for v6.3
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, linux-riscv@lists.infradead.org, 
	Pierre Gondois <pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_054426_413864_0D96C92A 
X-CRM114-Status: GOOD (  29.79  )
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

Hi Sudeep,

On Fri, Jan 20, 2023 at 1:22 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> It has been tested on RISC-V which is the main users outside of arm64.

Has it?

> The ACPI the RISC-V parts are acked-by the respective maintainers. All
> the changes are in the -next for sometime and no issues reported at this
> time.
>
> Regards,
> Sudeep
>
> -->8
>
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
>
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/archtopo-cacheinfo-updates-6.3
>
> for you to fetch changes up to 198102c9103fc78d8478495971947af77edb05c1:
>
>   cacheinfo: Fix shared_cpu_map to handle shared caches at different levels (2023-01-18 09:58:40 +0000)
>
> ----------------------------------------------------------------
> cacheinfo and arch_topology updates for v6.3
>
> The main change is to build the cache topology information for all
> the CPUs from the primary CPU. Currently the cacheinfo for secondary CPUs
> is created during the early boot on the respective CPU itself. Preemption
> and interrupts are disabled at this stage. On PREEMPT_RT kernels, allocating
> memory and even parsing the PPTT table for ACPI based systems triggers a:
>   'BUG: sleeping function called from invalid context'
>
> To prevent this bug, the cacheinfo is now allocated from the primary CPU
> when preemption and interrupts are enabled and before booting secondary
> CPUs. The cache levels/leaves are computed from DT/ACPI PPTT information
> only, without relying on any architecture specific mechanism if done so
> early.
>
> The other minor change included here is to handle shared caches at
> different levels when not all the CPUs on the system have the same
> cache hierarchy.

While this gets rid of the "cacheinfo: Unable to detect cache hierarchy
for CPU N" warnings printed during boot, it resurrects the printing of

    Early cacheinfo failed, ret = -12

during early boot on all my RV64 platforms

See also https://lore.kernel.org/all/CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=SQ+X8w5Q4C_70g@mail.gmail.com/
for a similar earlier version triggering the same issue.

> ----------------------------------------------------------------
> Pierre Gondois (6):
>       arch_topology: Build cacheinfo from primary CPU

Reverting commit 5944ce092b97caed ("arch_topology: Build cacheinfo
from primary CPU") fixes the issue.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
