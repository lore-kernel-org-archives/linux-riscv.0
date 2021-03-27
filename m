Return-Path: <SRS0=+x6g=IZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37045C433C1
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 12:17:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7D80619AE
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 12:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7D80619AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vOgrajTXAdIVVnHNTjrzN7otQi0EOkppH6YosKSSCkQ=; b=PdLUPoqRCezxqG8wfHN51DsVc
	9YLRzzZBa3gtAbwcT0K5GbjMsTBxOo29n1Dlau/9ZiV+IrgQTrNCqXUSWIhdq97qTeDtJUnkyn2pu
	O1UzUHQk75rICwBwJVso7rsxraLnlJLgvE7YSi4tHJKtAOl2CuI58vxhBODZ4d+eM2liN6bzZ3jt3
	XUAkj51uZbhuORGf00F5jtmD6ANzK7OXkJJnJLnB6Mb7jbc1CAxRSDFMHtf+CeFl+0SP+hkhreYVK
	hmirEkWH+qiL4bWyBDCvZvbm9a8BO1quHRSlIxe3vRs6iVrFfCTUZ0pjat25onI1ifTtyevXgyKCG
	59xKbuOjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQ7ss-00560q-5A; Sat, 27 Mar 2021 12:17:42 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQ7so-00560I-1X
 for linux-riscv@lists.infradead.org; Sat, 27 Mar 2021 12:17:40 +0000
Received: by mail-io1-xd2e.google.com with SMTP id r193so8107142ior.9
 for <linux-riscv@lists.infradead.org>; Sat, 27 Mar 2021 05:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=W0OCNJlAmSG63LfDiOFxZzKLOJtCIjR/fUw42G8WAYI=;
 b=iEWQcmzfe1YXd0pp2Aq7mgJ9QaK2nVkq6mYvXsPmLN7UysMFvRvedIyIVnNd/I3XWL
 AUw7xSQN55n7TASuf9xxb53665/TolORGTIGNTzMOUgLfSiSF09d4+0YvFxwhYbXpCyn
 kHZ95SVcqwA7RQ6QiXxbUBhQ4fxlMyjCXf5ImsHu0V60oXJCNuaj8Hnzu/+JDAcVFW3s
 2Hkz2Ro5e39ooRKSdV53UiR1jntHvXl3HYPyx1Z+JoTdGHiolNu9vheL3orubZROpsLN
 bZQZgJVQUjvSejKL7kEcmVwijJkZpjMJbr1AFhIvFe1gVoTrtRsPYoxDtZhpJOpALQmr
 huRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=W0OCNJlAmSG63LfDiOFxZzKLOJtCIjR/fUw42G8WAYI=;
 b=B2VAuCTa3Ly8qeg+55nLE/yEgTstf6JA0bazTM4piam0v5bkWDj4fbTMq0nu41J4fD
 VaAzkLwkZmNHtV9CNZB7dVKX+NOlZFEbG7YKPmrkMt1xLrSeVS3Yn/ewNR7G8PpbrH6o
 gF6a3FdMjPflT5/Jw5uBq42JqBgE7/JHSImnesdEq9SWQ12BtyemuNqTDDwyRjMWHGK8
 cQp5xM8hHxHpHeUIN8w6yFFm1cbTgOxyBPorM45iRTGEN53ptu+gsMRjTVQoIZ07Va3R
 ZAQB21jjbKiEMzwbtdBx+bm5L3GpVK8kEPh2ToxnZMJ2dcaHqWqr9Ts9IC122X2H3Eax
 BJaQ==
X-Gm-Message-State: AOAM532wyMSc0GEbum2xwMmDA1sNguuQcAXli5slDG80wx8Nng4SpXxI
 IG10WjCC9yU1Xv6oB0fKeomdLa1z3c39gpnoRCI=
X-Google-Smtp-Source: ABdhPJxq0LbjHww3sV5wuK2q4vWZC2pFkSIydOiu6GLexH1m0wSxxKl5Hwo5znh81XK59ms4cf7fbgr7Us4ud3CNyTI=
X-Received: by 2002:a5d:9d13:: with SMTP id j19mr14040542ioj.110.1616847454985; 
 Sat, 27 Mar 2021 05:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210325223807.2423265-1-nathan@kernel.org>
 <CA+icZUWgxmrtM=oj-aJi1KXxZx0YUZDiUPK42MjHvqS96aazYQ@mail.gmail.com>
 <20210326130702.3yaz2vqwejnfnlq4@MSI.localdomain>
In-Reply-To: <20210326130702.3yaz2vqwejnfnlq4@MSI.localdomain>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 27 Mar 2021 13:16:58 +0100
Message-ID: <CA+icZUVHyGSX1R89O-MG-fwfw7BPLGBP8COcpyPCwmhNj88d3Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix CONFIG_FUNCTION_TRACER with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_121738_153972_EC5B089E 
X-CRM114-Status: GOOD (  29.36  )
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

On Fri, Mar 26, 2021 at 2:07 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Mar 26, 2021 at 09:37:55AM +0100, Sedat Dilek wrote:
> > On Thu, Mar 25, 2021 at 11:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Hi all,
> > >
> > > This series fixes function tracing with clang.
> > >
> > > Patch 1 adjusts the mcount regex in scripts/recordmcount.pl to handle
> > > the presence of PLT relocations, which happen with clang. Without this,
> > > the mcount_loc section will not be created properly.
> > >
> > > Patch 2 adds a workaround for clang less than 13.0.0 in relation to the
> > > mcount symbol name, which was "mcount" rather than "_mcount". This was
> > > written as a separate patch so that it can be reverted when the minimum
> > > clang version is bumped to clang 13.0.0.
> > >
> > > Patch 3 avoids a build error when -fpatchable-function-entry is not
> > > available, which is the case with clang less than 13.0.0. This will make
> > > dynamic ftrace unavailable but all of the other function tracing should
> > > work due to the prescence of the previous patch.
> > >
> > > I am hoping this series can go in as fixes for 5.12, due to patch 3, but
> > > if not, they can always be backported (patches 1 and 2 are already
> > > marked for stable).
> > >
> > > This series has been build tested with gcc-8 through gcc-10 and clang-11
> > > through clang-13 with defconfig and nommu_virt_defconfig plus
> > > CONFIG_FTRACE=y and CONFIG_FUNCTION_TRACER=y then boot tested under
> > > QEMU.
> > >
> > > Cheers,
> > > Nathan
> > >
> > > Nathan Chancellor (3):
> > >   scripts/recordmcount.pl: Fix RISC-V regex for clang
> > >   riscv: Workaround mcount name prior to clang-13
> > >   riscv: Select HAVE_DYNAMIC_FTRACE when -fpatchable-function-entry is
> > >     available
> > >
> >
> > Does this only fixes stuff for clang + riscv?
>
> Yes.
>
> > If so, please put a label "riscv" also in the cover-letter.
>
> Sure, my apologies for not doing that in the first place, I must have
> been in a rush with the cover letter.
>
> In my defense, I think the titles of my commit messages and the diffstat
> below make that obvious without the tag :)
>

No need for any apologies.
I was fooled as you sent two triple-patchset nearly simultaneously.
This riscv patchset here was not of interest to me.

- Sedat -

>
> > - Sedat -
> >
> > >  arch/riscv/Kconfig              |  2 +-
> > >  arch/riscv/include/asm/ftrace.h | 14 ++++++++++++--
> > >  arch/riscv/kernel/mcount.S      | 10 +++++-----
> > >  scripts/recordmcount.pl         |  2 +-
> > >  4 files changed, 19 insertions(+), 9 deletions(-)
> > >
> > > --
> > > 2.31.0
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
