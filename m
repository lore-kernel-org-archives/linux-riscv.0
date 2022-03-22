Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169A2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 04:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqJgf1jFvLS0RYX3YpSgpDMPR+mOw/jHL7z18P91jBk=; b=wxkxz3mwDXNQUC
	Gc8PA+AD9lTSJQYjv1K9zu+MbkGaXLIqmZAiQvH156BiCfcoIy/Ec7obr6FdGRqPVYtn0Dert7uyk
	OcQ0jX4ymbbn/cyhAa46r3mjNDzWRk5tg7c1fDcVfRoEA4GRrwvNjWg1IIB5yW9H8Jixme3Z50DZE
	DizorxM7D8Tj/+zvG42MImN66gW5iTadH/6UHKyvpc8SZYntXkGkv25WHxN8EPC2HnjNyc5R2+KO6
	ZNQHtw8iH55qytde4waMVxlTl1DXulnt5chSz1hL2AusIpNUbKFs7DcChz75DQUxL08yBViFLdqN+
	kKuwXUpIAjUMEt3CxZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWVqb-009wsG-MR; Tue, 22 Mar 2022 04:10:17 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWVqY-009wrT-03
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 04:10:16 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so1109476pjm.0
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 21:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YF27/o9OojcIlWSRXUYvT844QPtgp8LqnE9dm5viGDQ=;
 b=ln3p25fvXLz32myeqm5t0hBcUE6tyk/PEExo8WqpnsfcP5zlqpV1ll671d9e8ZulpU
 lqusXemHq030YWLjogGgWnDGnYL0cm48TsOkP3kJ+Ppu09gPxXQR6O8pCqHds+7TJITD
 NaQ9KpeM5/G3c23uTqF2SHe/SF/5rBIaZ2uoM3yqKWz8h8l8wxtagttGDbq3rwY3g6Jg
 NLL2W5/Gym4XWW5+xpEsUWRIEEcmIIGtidxZwXe/7LkHIP+huczI1wrWMfMVE/Nv+76a
 YEsWTOvlvfCbnrWOA+E7H/WtgT82LDtjHDHfDWlU0jOk3iLi0o77i7cXOLCn93Ww39Ln
 WzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YF27/o9OojcIlWSRXUYvT844QPtgp8LqnE9dm5viGDQ=;
 b=SKppDip+a4DUbsZWRFvXK8hYRIkFtpMVZx32MXzIY9LleXIIOtShN8wrdKNrBF2p/P
 rVFABhRGb6WPIGCTkHsROhvRLaBx7j+GoNthaS5TQDaIDyYZZluetlUAggfTsg81nyig
 pBpBG1xZiV6dRoWXe6dhuHGe2MO0FvU2RFvBbp8VHuj4yrHsRkcKqxPtUxApvzgEVipI
 5U9Y5p92sJeUNKZppF0lITF7cDP/V9yGccIWobcWxMAD7nAl/NiN/XnQddzfnhkgDJ+4
 VIaf/wC3kkUcIzTOfW+WYeN6ihUcvlDt7N4mip69usrWKFAAQIqjp8vvWd7QeH667RTD
 wwgQ==
X-Gm-Message-State: AOAM533RuXNtd2KrGAuBat32DJgK7uVg8uACWta+x/DWiOcWA/+52MQ0
 j8roAACVeZcyzhN9GcdI8SRuv1UDbQD7jg==
X-Google-Smtp-Source: ABdhPJw8K6SJLgXLdJjpWrOAa7EmA/p3qAJ4MfsOv0WC5B8UWGhsRke1K9C1t22yXzXvRnFtjfyYXg==
X-Received: by 2002:a17:90b:1a8a:b0:1c5:f707:93a6 with SMTP id
 ng10-20020a17090b1a8a00b001c5f70793a6mr2699198pjb.110.1647922211988; 
 Mon, 21 Mar 2022 21:10:11 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 t71-20020a63784a000000b00380a9f7367asm16932561pgc.77.2022.03.21.21.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 21:10:10 -0700 (PDT)
Date: Tue, 22 Mar 2022 13:10:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Peter Zijlstra <peterz@infradead.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 jszhang@kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 3/5] openrisc: Move to ticket-spinlock
Message-ID: <YjlMIGKgYaLLpp5T@antec>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-4-palmer@rivosinc.com>
 <YjjuOZMzQlnqfLDJ@antec>
 <CAJF2gTSFh0NKLys7kr=UdQWHDyYgg3XmgTJtVaL37Re7QdZ8uw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSFh0NKLys7kr=UdQWHDyYgg3XmgTJtVaL37Re7QdZ8uw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_211014_298850_30DB742C 
X-CRM114-Status: GOOD (  26.80  )
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

On Tue, Mar 22, 2022 at 11:29:13AM +0800, Guo Ren wrote:
> On Tue, Mar 22, 2022 at 7:23 AM Stafford Horne <shorne@gmail.com> wrote:
> >
> > On Wed, Mar 16, 2022 at 04:25:58PM -0700, Palmer Dabbelt wrote:
> > > From: Peter Zijlstra <peterz@infradead.org>
> > >
> > > We have no indications that openrisc meets the qspinlock requirements,
> > > so move to ticket-spinlock as that is more likey to be correct.
> > >
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > >
> > > ---
> > >
> > > I have specifically not included Peter's SOB on this, as he sent his
> > > original patch
> > > <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
> > > without one.
> > > ---
> > >  arch/openrisc/Kconfig                      | 1 -
> > >  arch/openrisc/include/asm/Kbuild           | 5 ++---
> > >  arch/openrisc/include/asm/spinlock.h       | 3 +--
> > >  arch/openrisc/include/asm/spinlock_types.h | 2 +-
> > >  4 files changed, 4 insertions(+), 7 deletions(-)
> >
> > Hello,
> >
> > This series breaks SMP support on OpenRISC.  I haven't traced it down yet, it
> > seems trivial but I have a few places to check.
> >
> > I replied to this on a kbuild warning thread, but also going to reply here with
> > more information.
> >
> >  https://lore.kernel.org/lkml/YjeY7CfaFKjr8IUc@antec/#R
> >
> > So far this is what I see:
> >
> >   * ticket_lock is stuck trying to lock console_sem
> >   * it is stuck on atomic_cond_read_acquire
> >     reading lock value: returns 0    (*lock is 0x10000)
> >     ticket value: is 1
> >   * possible issues:
> >     - OpenRISC is big endian, that seems to impact ticket_unlock, it looks
> All csky & riscv are little-endian, it seems the series has a bug with
> big-endian. Is that all right for qemu? (If qemu was all right, but
> real hardware failed.)

Hi Guo Ren,

OpenRISC real hardware and QEMU are both big-endian.  It fails on both.

I replied on patch 1/5 with a suggested patch which fixes the issue for me.
Please have a look.

BTW. now I can look into the sparse warnings.

-Stafford


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
