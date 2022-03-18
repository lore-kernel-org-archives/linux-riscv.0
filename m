Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10240C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTKg7X1DYwx7VKEmOvb9E3vsUs4T6FmnA0YgHVBQzoQ=; b=dwjq7n/8avPqI9
	sXWvUQdt9AQxw0jNxneZv7B7KDJ0VP2wYhiz1vOgfiX0nEXIubZhpFcKUWoz8Ha0Cm24eoKFIFZ53
	ByK4AEZPdqhHirwuEfaNgs7zTf7wqcS+jymz9FLnNl/p7Y9MSaQC8kvlLpCLc9D5JNewzwuI2UKcE
	D5lKx7jd5/BWd8XpyVULgzigInCrPGkc9KFzLgSwmP4lc4YNGq7L735gCA20YgDT1WfxL9vVdwU+m
	IgKDuQ7NylhHMuvfgCyR5Jo9FirZsALUWENujGK+FXTgHEtVSmh3/469ZLELB1hayUqQ69P8Q9x6n
	yCgGDgHfAhNQlp0i0QyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV89z-000qas-Ku; Fri, 18 Mar 2022 08:40:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV89w-000qZt-A9
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 08:40:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C43F361A91
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 08:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9B0C340F6
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647592830;
 bh=iUr5tRvZTo9rXrhUfHmBDsVjXAUzfQvdrJ4GOirMD1k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NKX3SMHtB+o8znU/U2KTE369qFnc8hXvVsOukLKqhwmETmkyjpUMSdrLeFv1xNn5T
 MJyJTjAckKX4mKT6/mtDwr9pYbdnc45y8ZNx3Dj3mleoMjB1yGVBx0EYNhpPnsUf2v
 3zXX1EklCxZTKWVyMKQh+verzBUIX40X5errq26vokUMTonsuiXmsRMIovokF6ph9U
 iR+iVF6nab3JbFln6eZYgbeZVdLXTWM1VRCBH5Ek+cz3ZmE34EcjEwOcsYeAp524cO
 QFOPXbBldio8bBwJyc+oP0i0sCY8H7FE2TmOSfw1OXmyjL/Qwg51p6EjEh1RW5O3i5
 FvzQRJ1LQv1Uw==
Received: by mail-vs1-f43.google.com with SMTP id v62so8056164vsv.1
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 01:40:30 -0700 (PDT)
X-Gm-Message-State: AOAM532ZfZ/ZZrwEZFbEdLCCDyr8Lh5oYm4DWroFUk8CzVs8BMaNuieF
 3WXywyrdSVm478SPBAMMtRACldsZSIvg8LNUC6U=
X-Google-Smtp-Source: ABdhPJyKftDFP/Db0LP/WpQBiK7L2dYAjVWhbklLPdx+VCrE7mm4BHhLc/G2CUjhluQs1dFX90+mXlVVyzM9CXgkfOk=
X-Received: by 2002:a05:6102:311b:b0:324:e48a:75bc with SMTP id
 e27-20020a056102311b00b00324e48a75bcmr265902vsh.2.1647592829461; Fri, 18 Mar
 2022 01:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220316232600.20419-1-palmer@rivosinc.com>
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 18 Mar 2022 16:40:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQdhnxJ3gaJDCnd7-boz83GMxaW7tTNaA9hSHs92L_Zig@mail.gmail.com>
Message-ID: <CAJF2gTQdhnxJ3gaJDCnd7-boz83GMxaW7tTNaA9hSHs92L_Zig@mail.gmail.com>
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
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, openrisc@lists.librecores.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_014032_457301_81E7FEB2 
X-CRM114-Status: GOOD (  23.37  )
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

Hi Palmer,

Tested-by: Guo Ren <guoren@kernel.org>

Could help involve the below patch in your series?

https://lore.kernel.org/linux-arch/20220318083421.2062259-1-guoren@kernel.org/T/#u

On Thu, Mar 17, 2022 at 1:14 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
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



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
