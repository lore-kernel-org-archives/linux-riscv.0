Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDB1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 00:56:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA3AF610A1
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 00:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA3AF610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4pXe3aro0f1vttC+h6dAMH8l6huZCYl8Derc/rLkRY=; b=qPOUZiEDXCKVIY
	0891W7o0xKPAl3FeebhAbDKR0V8l8wfVvN/lr2GNT1P+yNEd9xzZ79Aw3+X7XNBLFhq6L2gy7BWSF
	eaD2DA6PKk7gdPue6uYz7zCwEpUj/s732lGDPHSeO17/65zT0fKKBB4B0L9AcxbyWlvOmv2fZcuvx
	ciMZb1K6Ef6bd146V7G/LGbkjdAp2ckwJmFOYhPxnXeM1b3cWz3Adm2tTZZ0ihIh0SYmVexER6Vni
	zERhSwLaipy6gm9lDAmTkYcNBPb1njauHWAL16uYuqbkP+WpRhadForCgSnJq8JaR4EcZ4ELKg+rS
	aihMtx/B5d0IDL2PTT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcdQ5-00HVHK-IR; Tue, 19 Oct 2021 00:55:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcdQ3-00HVGz-9e
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 00:55:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 186916128E
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 00:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634604954;
 bh=cIGQRuB5/4x08XlxRDA3Ao4AUXcOHw77Zhri+XpaAOo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MK5K42cHFpsLhdENsE2bQgGFWcnMCoqtAdg+L386ST0mMkmkhSWDz+s2wjDXLMU/2
 UwNTddFOo85pr0yyS+C1K6GGGC7BsPvr8jZf29E15SknIHrZPdmnLbgVMb07VbqCJO
 Wc/tR0i6SQcMxoL2kxeAx0+LS3M5XkcWkcFsZa0PCsiUJF5tJhv1ycvQakl4rCBzrD
 d2MHE0Wu56KXTSvHDxihBfwq1f2rDPmFvehCJgAD5nrv7/VGyBHjeIciilz/0AE3WW
 uctcPWL2Nr+AIx9hrvO3w78XQRrkE2tuWpHWtzWmk6Zdb461yRVOSQLeQatQRWRG+I
 HyVBEqkVd6ZfA==
Received: by mail-ua1-f52.google.com with SMTP id f4so290051uad.4
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 17:55:54 -0700 (PDT)
X-Gm-Message-State: AOAM530+RtlBwWGKOAw475pEkI3T+JOUsBseAYXqD4F5ILe2vvijCA8C
 4iHb9IjOrT9KlQKuimjBiZNK1vPpdkbqx82rWOA=
X-Google-Smtp-Source: ABdhPJzwkEEBSQVzjjrkD+0CHBWKBCiLyhGhSpmTY1ODlPUy6auanc2+wSEfbPXmOII4D1ThZB9ekmQ6lgfucHgqXls=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr32242550vsj.28.1634604953132; 
 Mon, 18 Oct 2021 17:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-3-guoren@kernel.org>
 <CAL_Jsq+NM=jvYfvyNVsJCrizHzqaDMPe05hkBhnOWHc+JwBNig@mail.gmail.com>
In-Reply-To: <CAL_Jsq+NM=jvYfvyNVsJCrizHzqaDMPe05hkBhnOWHc+JwBNig@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 19 Oct 2021 08:55:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRdowd_jicA+iWQ9sg5xSZA_O8KZ7q45A3CS+i0iKYicg@mail.gmail.com>
Message-ID: <CAJF2gTRdowd_jicA+iWQ9sg5xSZA_O8KZ7q45A3CS+i0iKYicg@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: update riscv plic compatible string
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, "heiko@sntech.de" <heiko@sntech.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_175555_378373_D90A15E3 
X-CRM114-Status: GOOD (  12.49  )
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

On Mon, Oct 18, 2021 at 8:02 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 15, 2021 at 10:22 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add the compatible string "thead,c900-plic" to the riscv plic
> > bindings to support allwinner d1 SOC which contains c906 core.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Atish Patra <atish.patra@wdc.com>
>
> Please send to the DT list so that checks run and it's in my review
> queue (IOW, use get_maintainers.pl). And run 'make dt_binding_check'
> so reviewers don't have to find your typos and other errors for you.
Thx for the tip, I would follow that in next version.

>
> Rob



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
