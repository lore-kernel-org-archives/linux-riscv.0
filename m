Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4D9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 18:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C63B161130
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 18:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C63B161130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4K5Aiq7kV9eyU3R4p6o15Eiy99LE7pDthLh3PnErS94=; b=pBXDBs3UNOoj4K
	Pf9uaBSxoYwKFDpct4AjGljGoN+UJjsCGJ5y5j5NsFUAUjEwKVzss/DsU55I2+lk0Op2J1YeZ5drM
	aJatKG8RBGn1jxKeGax0d7e+oKrd/3J2AtuTYv2nAhEs+Q2guM4KByVkjWTdm7NWthoJ4Z93jYygY
	EU7JgE47Bz1qjcAEME6cqCyCcIU6idaTtu4LlDXx8/SNvbPQVzzgWoDeFKUustGQhm/smd85xsnCu
	KeZuBDWeo+kQ2r4stPHwSn2dcGP5HGegoNAZEUmcsYVMP+LnkAnkcetRolhJVcLZGxPghvnx1dskZ
	3eAos2OrEmkq3X8ORbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYBex-00FJYW-5V; Wed, 06 Oct 2021 18:28:55 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYBet-00FJXr-PK
 for linux-riscv@lists.infradead.org; Wed, 06 Oct 2021 18:28:53 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id h2so7455974ybi.13
 for <linux-riscv@lists.infradead.org>; Wed, 06 Oct 2021 11:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0n7XTaYuNuU3GQROpWlHveon37tQGGRs8ekBzlKCoOE=;
 b=J6lI24iVpCdHoWTtNM7a/8ZwFedTCp/QYd7FALh8Tpc0VTNH/H/a/A6zY/gO4qGFL5
 HiApsBuVnVxYyelJMV5w4M+PnZ6pKWEzylR/zFMx7qxiTGvyfr8sdCpE/Hv4O59NCf7J
 PFL/3b+ZlF7hsCL35SoZvUe1X//m/4EWglNIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0n7XTaYuNuU3GQROpWlHveon37tQGGRs8ekBzlKCoOE=;
 b=zteaGV2QYUw4XrfBDKzI4GltU2L8HXxn/xrgtfSmE2VtVJrCuG51Rrqws1baNbUuf0
 JQU8k7svCFmBysZ8OTjj0bIkdzqFv0RhAeQNfvi5TKdeS1TAOzkPvZqhFlfoTJ+ddCn4
 1ozkVCLAiN3iKrLJRcbGlND6FkfjtvY/qvpitAPYBpqLyNhmOvWdl4iXb8I/sb9c2W8e
 G4az6v3xLUYYj/r7XmhCeVNBLyFJkyDOf5dvKkj8ot15TzR0Wkn5KXZ36UKZMK4okgoT
 Yh+p99kZNBc2GDVSyxxD1q7ujCjMy717Cb4PCftjVUlk4kAL22OnjKvZ3NMbo2KvyXMo
 bdrg==
X-Gm-Message-State: AOAM530X6ItgoMSljIbZvGEJs6YJmu+zye5rKDYcRkOpau1UkYZpjs/9
 cBj1ZO7LuIN4PMhaMzkBn2k2VmlK5YjPQPsCR3nP
X-Google-Smtp-Source: ABdhPJy4ghJUXe860sK/73CDH7bq+Ep1/YOkYbT2u0s7Dyc2ylF3jCsuAhbF7KTPSGqFvXAumb8QRRuDBQVZ+tVWJMo=
X-Received: by 2002:a25:d47:: with SMTP id 68mr31232340ybn.204.1633544923738; 
 Wed, 06 Oct 2021 11:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210910192757.2309100-1-atish.patra@wdc.com>
 <20211005121744.728385be@redslave.neermore.group>
In-Reply-To: <20211005121744.728385be@redslave.neermore.group>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 6 Oct 2021 11:28:32 -0700
Message-ID: <CAOnJCU+0=9FG+cUT0V16TEN_ar7d9F+Me_nkQtK+5mKrFFZOqg@mail.gmail.com>
Subject: Re: [v3 00/10] Improve RISC-V Perf support using SBI PMU and sscofpmf
 extension
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Atish Patra <atish.patra@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, 
 Ard Biesheuvel <ardb@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jiri Olsa <jolsa@redhat.com>, 
 John Garry <john.garry@huawei.com>, Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, 
 Anish Khurana <akhurana@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_112851_846618_6760C21C 
X-CRM114-Status: GOOD (  12.41  )
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

On Tue, Oct 5, 2021 at 2:18 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Fri, 10 Sep 2021 12:27:47 -0700
> Atish Patra <atish.patra@wdc.com> wrote:
>
> Hello Atish,
>
> > Perf stat:
> > =========
> >
> > [root@fedora-riscv riscv]# perf stat -e r8000000000000005 -e
> > r8000000000000007 -e r8000000000000006 -e r0000000000020002 -e
> > r0000000000020004 -e branch-misses -e cache-misses -e
> > dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -e cycles
> > -e instructions ./hackbench -pipe 15 process Running with 15*40 (==
> > 600) tasks. Time: 6.578
> >
> >  Performance counter stats for './hackbench -pipe 15 process':
> >
> >              6,491      r8000000000000005      (52.59%) -->
> > SBI_PMU_FW_SET_TIMER 20,433      r8000000000000007      (60.74%) -->
> > SBI_PMU_FW_IPI_RECVD 21,271      r8000000000000006      (68.71%) -->
> > SBI_PMU_FW_IPI_SENT 0      r0000000000020002      (76.55%)
> >      <not counted>      r0000000000020004      (0.00%)
> >      <not counted>      branch-misses          (0.00%)
> >      <not counted>      cache-misses           (0.00%)
> >         57,537,853      dTLB-load-misses       (9.49%)
> >          2,821,147      dTLB-store-misses      (18.64%)
> >         52,928,130      iTLB-load-misses       (27.53%)
> >     89,521,791,110      cycles                 (36.08%)
> >     90,678,132,464      instructions #    1.01  insn per cycle
> > (44.44%)
> >
> >        6.975908032 seconds time elapsed
> >
> >        3.130950000 seconds user
> >       24.353310000 seconds sys
> >
>
> Tested your patch series with qemu and got results as expected:
>
> perf stat -e r8000000000000005 -e r8000000000000007 \
> -e r8000000000000006 -e r0000000000020002 -e r0000000000020004 -e
> branch-misses \ -e cache-misses -e dTLB-load-misses -e
> dTLB-store-misses -e iTLB-load-misses \ -e cycles -e instructions
> ./hackbench -pipe 15 process
>
> Running with 15*40 (== 600) tasks.nch -pipe 15 process
> Time: 20.027
>
>  Performance counter stats for './hackbench -pipe 15 process':
>
>               4896      r8000000000000005
>                             (53.34%) 0      r8000000000000007
>                                                 (61.20%) 0
>               r8000000000000006
>                   (68.88%) 0      r0000000000020002
>                                       (76.53%) <not counted>
>               r0000000000020004
>                   (0.00%) <not counted>      branch-misses
>                                                  (0.00%) <not counted>
>                   cache-misses
>                       (0.00%) 48414917      dTLB-load-misses
>                                                 (9.87%) 2427413
>               dTLB-store-misses
>                   (19.43%) 46958092      iTLB-load-misses
>                                              (28.58%) 69245163600
>               cycles
>                   (37.09%) 70334279943      instructions              #
>                  1.02  insn per cycle           (45.24%)
>
>       20.895871900 seconds time elapsed
>
>        2.724942000 seconds user
>       18.126277000 seconds sys
>
> perf top/record also works.
>
> Tested-by: Nikita Shubin <n.shubin@yadro.com>
>

Thanks for the testing.

> Yours,
> Nikita Shubin
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
