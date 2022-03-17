Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704E1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QySuw+OVvbeXj5xEDvZm5I9svKkNmtd3NoJgqUZeYeI=; b=EhUkvorNyVDgge
	cIFKCmYmc1IxfLZA2HlJ3tu8b+Z/VPIds8a9EldCbjFejqfv9FdXZM2AG/ciTvtn4RT48SAK2gR/9
	i/URnGO62u1bhhbUGveiTEFi0zJKqRiCOSSeQafYZxrms8/L8f6eg5HdknyB4u/IYHlJnJBZKLg5y
	dp8tof4oXqJUqQWLRtFe4Jaaepffia3Yynnv3kAwlpb2/R5shdwwbAIFeBToogW6DV47KkQ+7aWrE
	E/BORyvMIH78c0MqJraQ0VA+KWgMaqeWadmmqjSjQSAm5bULEevJmrN0yQnP0C+Cckdh0n97JAI0+
	w2DHNyTj8iFd7vs4eWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmFu-00FV2s-48; Thu, 17 Mar 2022 09:17:14 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmFq-00FV1D-9b
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 09:17:12 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLR5f-1nm2Hw1r1v-00IVcd for <linux-riscv@lists.infradead.org>; Thu, 17 Mar
 2022 10:17:07 +0100
Received: by mail-wr1-f47.google.com with SMTP id a1so5035253wrh.10
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 02:17:07 -0700 (PDT)
X-Gm-Message-State: AOAM531xejpv3cXwU4TwbODCGN4UfsULwrdTSgjp4mkiIruFc9Y3da3n
 at9qqTH4QJ+r/tYFuAjBCRvuiHrkvXmStzauDuY=
X-Google-Smtp-Source: ABdhPJzHxRGEWXDlBot3JUsd9DgwDJ6ivxcLghivZobZjz3wwreUXbJML8BPLrLgeRbd4dSRRrBLY4hc87aaQUXL1EU=
X-Received: by 2002:a05:6000:1e0d:b0:203:e950:7b74 with SMTP id
 bj13-20020a0560001e0d00b00203e9507b74mr1946333wrb.219.1647508627012; Thu, 17
 Mar 2022 02:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220316232600.20419-1-palmer@rivosinc.com>
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Mar 2022 10:16:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0J3ViDWserQew2wt95Hnu6AHT5gmSxtUz0x5W2fWdxBA@mail.gmail.com>
Message-ID: <CAK8P3a0J3ViDWserQew2wt95Hnu6AHT5gmSxtUz0x5W2fWdxBA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Generic Ticket Spinlocks
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Peter Zijlstra <peterz@infradead.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Openrisc <openrisc@lists.librecores.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:ETV0uYun1dfHR8FeNf9QV2JbzSiTYDwr61Z5kQYzZ+usXxto+Af
 EmaQKXRA3YLHw/ZAus1J6ktSFpsy9Ff5IoE5pzcWO/yyIbVv+HR2b26/4QbehuU7NOxIdoM
 uwC67vwU6m1fTnEPUYPpwUb1NUpfbZOGcsFY458VFaNMW6+u6u6PDPHJ1tJXW8nuMnEfSBB
 Xli2uIhXmjXK4u2FnWxAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XMYO3hF29FU=:ed2KwU7iSPYPcX3nray20q
 Aku5yO06GN2eMgcmjrnd+9X2156ZjkdmSn9iodfw2AF4PwMZn3Rtdek0MgsBnC+sERPk4P/mb
 0+5pHfEFeO+GLHAiIIsEINaoax4MWduP/r8OvsIwok84YHF2RAQ/+/9hsUstbPLL+JLjxPaEu
 +S7XvLwbmrQ7CHeGgZ0stHvFSilKdgw5Xa4suuEqq+Fv6axfEDFUMhCk0h9JWjlIfpubKlrCZ
 ZlMZUYhry9vUSHNAdodd5tZIvvFwlfLO9FuFh4HxyzESh3348Oy3/sdId+zKgesW9fRW9pt4h
 w1CBfZOjj/qyXVsc/nv90i2jnBB5p/UEMdKm24ojAXdtCLeqC4aDniTuBXTUI+WLdDAz3myoa
 cenqBF0N7weGdZCxN+ycAiefQRV0QHxIx21lEmUYEVYVcqYCJg+ltVKxgo3GyMAXfufTY7+DU
 wcxmpK+DmztRV+N2uioYtqcRmyAM0hwGpBuazQ8reR2uUOPfjPW8h9wPLwH3kdfpFNk9jafdY
 zRzBtchzKvo9yxl6e8/7UCg/JoZiIbVeL5n5ix4eatz+mBgFQc2pFvk06PinLNRn44RQ3HLoF
 sZ0hjlm4ZdOEWLj1MXIBdLBJCq1Cb84pMtLDIgJwgeqN8DqXGoMrZmQyIQgDFkVrv0PopNRY5
 tEkh4tvI8oLOH4UzRUDwY4eZ1KO0DFg3HeUnFgkdZSJ4NY1+HEz3RfQ8qADbOSFuBY6A=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_021710_656973_AC0EB396 
X-CRM114-Status: GOOD (  25.47  )
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

On Thu, Mar 17, 2022 at 12:25 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> Peter sent an RFC out about a year ago
> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>,
> but after a spirited discussion it looks like we lost track of things.
> IIRC there was broad consensus on this being the way to go, but there
> was a lot of discussion so I wasn't sure.  Given that it's been a year,
> I figured it'd be best to just send this out again formatted a bit more
> explicitly as a patch.
>
> This has had almost no testing (just a build test on RISC-V defconfig),
> but I wanted to send it out largely as-is because I didn't have a SOB
> from Peter on the code.  I had sent around something sort of similar in
> spirit, but this looks completely re-written.  Just to play it safe I
> wanted to send out almost exactly as it was posted.  I'd probably rename
> this tspinlock and tspinlock_types, as the mis-match kind of makes my
> eyes go funny, but I don't really care that much.  I'll also go through
> the other ports and see if there's any more candidates, I seem to
> remember there having been more than just OpenRISC but it's been a
> while.
>
> I'm in no big rush for this and given the complex HW dependencies I
> think it's best to target it for 5.19, that'd give us a full merge
> window for folks to test/benchmark it on their systems to make sure it's
> OK.  RISC-V has a forward progress guarantee so we should be safe, but
> these can always trip things up.

This all looks good to me, feel free to merge the asm-generic
bits through the riscv tree.

Regarding the naming, my preference would be to just use
this version in place of the (currently useless) asm-generic/spinlock.h,
and just naming it arch_spin_lock() etc.

This way, converting an architecture to the generic ticket lock can
be done simply by removing its custom asm/spinlock.h. Or it
could stay with the current name, but then have a new
asm-generic/spinlock.h that just includes both asm/ticket_lock.h
and asm/qrwlock.h.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
