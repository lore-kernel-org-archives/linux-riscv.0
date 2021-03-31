Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ACBC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 07:12:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47CA1619DD
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 07:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47CA1619DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8NWlqZXrpM8mmROcl1Qoy9ndhiD7LNdOSkFujkJ0M4k=; b=pVpfZcTEtcmrkVQ/cRFQZ+wPP
	LZEgLtFovVIfnARDJBJvjoGGCUZPdcHrhFhMyUNwBh+vBB4dmNTqURGIQ+X8lBqeifiYAUtkIGrww
	UyFXaLl10lacIaSmo+9e0PVWDKYXC0tVOn/OkK1GdTpgGczuWaR7H0FYsI30A4vn6HbqWcxV4K9hg
	SWktq9DUR+kBEwiJX0RT0G04EfKtc5K0huWQLsEJV7anmNu6ZVc1+s9lfuKl2mdP1R87BduWc1a38
	s/iRCwVkoyxSaAg5J8sMth8tQZAFpVIcDu1pFtzFXI9/5P13BTfWZDc8e3BkQ0rKQtzIrqwWgprKS
	gYpBTGbuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRV1f-005kLC-AH; Wed, 31 Mar 2021 07:12:27 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRV1b-005kKd-P5
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 07:12:25 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MxEcg-1lpvf31gLY-00xeFv for <linux-riscv@lists.infradead.org>; Wed, 31
 Mar 2021 09:12:21 +0200
Received: by mail-ot1-f42.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so18071296otr.4
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 00:12:20 -0700 (PDT)
X-Gm-Message-State: AOAM530QBBgBZrG7hBX8YUhvxqsvF3NPoQK90iYMeC21BCyTwr/X9Yn7
 zUe9P/A0N9yThgLe2pjTHpqPrPoiK2K3xjKgI9I=
X-Google-Smtp-Source: ABdhPJyDDdJN4bOkBUX/6z8TQTYJT7CTrMHBr52q+GIbBO0fps9qLwpUyqCwRyTxF2TfGzWqXN6oPJ/d9KksN2Qfcso=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr1622938otk.305.1617174739722; 
 Wed, 31 Mar 2021 00:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAK8P3a2bNH-1VjsZmZJkvGzzZY=ckaaOK9ZGL-oD0DH4jW-+kQ@mail.gmail.com>
 <YGG3JIBVO0w6W3fg@hirez.programming.kicks-ass.net>
 <YGG6Ms5Rl0AOJL2i@hirez.programming.kicks-ass.net>
 <CAJF2gTRwd0QpUZumDFUN1J=effv67ucUdsQ96PJwjBhPgJ1npw@mail.gmail.com>
 <CAK8P3a3jpQ7dDiVG0s_DQiL6n_MdnhYHMjqFfJ92JJBJFPQZPQ@mail.gmail.com>
 <CAJF2gTSpnHndT9NkrzvNP6xvqV51_DENwh2BHaduUnGyUE=Jaw@mail.gmail.com>
 <CAK8P3a0DkbM=4oBBhA2DWvzMV7DwN1sqOU8Wa1qFtpd_w7iWmQ@mail.gmail.com>
 <CAJF2gTSGLn7katm6YAtkKWJcQRqw36_yqn+aK1pKUSRM5V1zUg@mail.gmail.com>
 <CAJF2gTSXY1fCBSZ-Z=8_AcRxoiCOoaNu-5A_JximGJxZY18RzQ@mail.gmail.com>
In-Reply-To: <CAJF2gTSXY1fCBSZ-Z=8_AcRxoiCOoaNu-5A_JximGJxZY18RzQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 31 Mar 2021 09:12:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3EXJorMNFpG0_M3W2KFNrEqyoYBU9Cp-Fr=HJAZ9KGNA@mail.gmail.com>
Message-ID: <CAK8P3a3EXJorMNFpG0_M3W2KFNrEqyoYBU9Cp-Fr=HJAZ9KGNA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
X-Provags-ID: V03:K1:82DWx9iSOUZxIqETI3PBCOfoBE8fx2k0QZSrBpXzItTd+fJLISq
 rkjT1VhlT/aS+agv94c6mtJ+/suLtvTNsHwLaZsS/k1m6u6plJDZGaP5ndgJ4ea82HIhYcj
 MCQbwZZSPaV8hCo4h5znbBgCmwIEl6/Gb49eHCiNE1bkve6dTNAwfQZ1vO3iPg3wCMeTjB9
 kt8gWsua6iYAatqIKqllg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WRy0Ah4Ap6k=:Sp4g3chhYgg+O7ScpgNw+/
 NORzq/hoiBUqdaXDO+gPLciCOJGArD9I2DdK+Da3bALDitCuImFZdyIPYXg6grtF0o2x5Gw5E
 USOhUjWObwzf4u/ObjNL5FZJxZRFkMBzACESyFBhRSdhs8vTIMN01uuWjJwtds/GhVdYnV8oC
 gOMbsA2GeW2iKkF6wTWpHDcuaVM5N509M9pMl0S0Yb7UOVuMM96ybftqqoBYgbxwbDptSb9Ag
 b/gtA1OQPo1soGFDbF4gARskPga0dzPEnO07qYdg5FvV6lyCbcbUCRWsxABo7KmR0/6eDgMyM
 A6VEKlosB0gtBuT+TahL7fOWY8qyeBXAkvBSDvfGWVv6YVk4W2i5s9Lrp3N8Q0AkgSESpJfUD
 qaayw+KpADOp0IOK08R/VB5osUNF+kqKVDG2IDhI3YW586Gw6FYLjxbdpFIx9pLFVX2DtgtYQ
 4UX4BI+LNke6Rgd3mwpAELc4yEnNhydCkuoD2V7rrmvLW6pHqRLAgHuykDCWMzM+hK/Uu3n6z
 GfGKhNtcZeFuax8FqJfn9WRbF46vZ7zt0Be0A1Qy0znS7/QU7Fd7ubl4t8Fx5AJO7Bc3BZb+s
 BCZGisDA8EZHDi2rymmpnM/sl4i6mClZUY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_081223_968467_41832C02 
X-CRM114-Status: GOOD (  19.43  )
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

On Wed, Mar 31, 2021 at 8:44 AM Guo Ren <guoren@kernel.org> wrote:
> On Wed, Mar 31, 2021 at 12:18 PM Guo Ren <guoren@kernel.org> wrote:
> > On Tue, Mar 30, 2021 at 3:12 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Mar 30, 2021 at 4:26 AM Guo Ren <guoren@kernel.org> wrote:

> > > As I understand, this example must not cause a deadlock on
> > > a compliant hardware implementation when the underlying memory
> > > has RsrvEventual behavior, but could deadlock in case of
> > > RsrvNonEventual
> > Thx for the nice explanation:
> >  - RsrvNonEventual - depends on software fall-back mechanisms, and
> > just I'm worried about.
> >  - RsrvEventual - HW would provide the eventual success guarantee.
> In riscv-spec 8.3 Eventual Success of Store-Conditional Instructions
>
> I found:
> "As a consequence of the eventuality guarantee, if some harts in an
> execution environment are
> executing constrained LR/SC loops, and no other harts or devices in
> the execution environment
> execute an unconditional store or AMO to that reservation set, then at
> least one hart will
> eventually exit its constrained LR/SC loop. *** By contrast, if other
> harts or devices continue to
> write to that reservation set, it ***is not guaranteed*** that any
> hart will exit its LR/SC loop.*** "
>
> Seems RsrvEventual couldn't solve the code's problem I've mentioned.

Ok, got it.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
