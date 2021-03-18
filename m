Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEC6C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 15:01:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 579EE64F11
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 15:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 579EE64F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c6t4z4nkWVfyq3lFktNZb39sOswp1cpeYhJef8tFenI=; b=pYxNmcPCxh/O7VDO7/EeN2CHB
	DAF3wgxeJyP9SvOxU04Y2U4culGgBj6l+u7T38jBZKhldlVB65pGvCq6O2zizgn1kCreSajh649T8
	S24J5p58aBNP35utFC43oNFky88/rX7gJBuxwpX2VLvHi/19hH/HorwaxEb2RcwXDP4uCdaxUFGz/
	d+Ev5lNL2whVlcIO7nHlGsUBmHdf3ipQT8RxTrNVXZgjfo+d2TWIQ+MBS3i6aDOuJdob8Z0ySlXLF
	BhytXuA7L0Phfo/QHycbHG3cOmWQ7/CKQTKrgRvnw7NqQdMacx76f1GFNpWHeKSz3Ok03i53oD+R3
	n5NlRDV4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMu8V-005X44-H6; Thu, 18 Mar 2021 15:00:31 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMu8H-005X24-O0
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 15:00:23 +0000
Received: by mail-qk1-x736.google.com with SMTP id m186so2213985qke.12
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 08:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bxU4B+nPTRvM9ZSZ6AoL1FQH5EKqbaO4AUDdmZHY4sI=;
 b=FMYfnfClh0ZpsMe4rUISHYHqBUlQwe6DJICKpxwL7H0T1o3CzbN5M/Jgvd0k+NOBpm
 w8+4HqRhiluSxzDLaBfeliemodCDBEwlJrQ/RISc4M2h4NsBcPGj01Aukw1ib5pj2rSl
 hmrAvXtu1mO4gOdmUq7eiiuiZQwpYfwVheRXV0ten5GJXKNXzAc6cHPaf9Tqrf6EHrtn
 XKTq4eIpgZ0jxm1zoGvckPQARMbgGzod7NBp3I/4Huzt1gMVqt0n29GcNV5XtiwtRb0g
 R0rHhye3RrVwOqWjk/dNCUkgJXLEmTL+c2faNd7ADnPcBhs798dTqDuPmZLcLTHVjtGg
 J61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxU4B+nPTRvM9ZSZ6AoL1FQH5EKqbaO4AUDdmZHY4sI=;
 b=EzPr1a7AcdWyH7rFzbt5tfT6DkymNt/TXM6nLuxF502HkD+R8ZoBhLdXG3CcKzhGdk
 4Cn2t4s7PFiOWeU5g7O77zWmHj3sbr7bUVza1USYPNWyDSBQVuk9keQJ+98KnqGyKZOH
 U3YpgtGx8PsXOojely++rXHk69AfXGVKUWi78i6+0D1Kk0eCo1ma6Kp/bGh9g7MFzgz2
 nahf6qmfVEiO3Aigl8A+yahkEMXWB68fDXD6p+ygQPDGfRFRBjJ/SgMgVW/rJxLcXFy4
 oquQoVmQw0I0/amT5391ddk2pWcKz+jMe9/4cUmnCMxjMVoYxoI4mVBbS5mGVreKLI+X
 5Dog==
X-Gm-Message-State: AOAM530+PQCng+m2s9TfIX0cZIY2/87C3H6cfn1Co6ufsF/szo4KUqy4
 OfM4leSLT/ukVi//YNOHiKpPfdjhpWBI62OE32AwSA==
X-Google-Smtp-Source: ABdhPJxg+3qTjY8O8SPZ8KLwB8cFot7os7lZv/k4zkQYpQppPM/BeTeLp/gSMbo4mtKoDI69/7hzy3AethVE9rBuD5s=
X-Received: by 2002:a37:a7cb:: with SMTP id q194mr4759869qke.350.1616079616393; 
 Thu, 18 Mar 2021 08:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000056b18b05bd7c6511@google.com>
 <CACT4Y+brvecfGUk7H7-mcJ82NxbEuETv+js0nRxpV7zc1AZH5w@mail.gmail.com>
 <c82390e5-33f6-75f6-6b93-c618537413e5@huawei.com>
 <CACT4Y+ZpfAiQKagp5xr0HY85SRr2h6pe10emm4_B5RLfVraN9A@mail.gmail.com>
 <093ff4d1-3977-1085-404f-ec46a3b1d8f0@huawei.com>
In-Reply-To: <093ff4d1-3977-1085-404f-ec46a3b1d8f0@huawei.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 18 Mar 2021 16:00:05 +0100
Message-ID: <CACT4Y+ai3qVzcBcTBoD4KkVTQzKm5nhEskhTjhNDmwuyBWSy-A@mail.gmail.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in riscv_intc_irq
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: syzbot <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_150017_867208_F9F50E91 
X-CRM114-Status: GOOD (  25.59  )
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

On Thu, Mar 18, 2021 at 3:50 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> >> On 2021/3/14 18:47, Dmitry Vyukov wrote:
> >>> On Sun, Mar 14, 2021 at 11:14 AM syzbot
> >>> <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com> wrote:
> >>>> Hello,
> >>>>
> >>>> syzbot found the following issue on:
> >>>>
> >>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> >>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> >>>> console output: https://syzkaller.appspot.com/x/log.txt?x=15a35756d00000
> >>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=81c0b708b31626cc
> >>>> dashboard link: https://syzkaller.appspot.com/bug?extid=005654dd9b8f26bd4c07
> >>>> userspace arch: riscv64
> >>>>
> >>>> Unfortunately, I don't have any reproducer for this issue yet.
> >>>>
> >>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>>> Reported-by: syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com
> >>>>
> >>>> ==================================================================
> >>>> BUG: KASAN: slab-out-of-bounds in riscv_intc_irq+0x24/0xcc drivers/irqchip/irq-riscv-intc.c:24
> >>>> Read of size 8 at addr ffffffe00c963bd0 by task kworker/1:1/4388
> >>>>
> >>>> CPU: 1 PID: 4388 Comm: kworker/1:1 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> >>>> Hardware name: riscv-virtio,qemu (DT)
> >>>> Workqueue: events nsim_dev_trap_report_work
> >>>> Call Trace:
> >>>> [<ffffffe0000096c0>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201
> >>>>
> >>>> Allocated by task 76347056:
> >>>> (stack is not available)
> >>>>
> >>>> Last potentially related work creation:
> >>> There seems to be some issue with riscv stack unwinder.
> >>> This does not have stacks.
> >> Hi, could you test with the following  patch about the no stack
> >> issue(from v5.11-rc4), I made a mistake when do some cleanup...
> >>
> >> https://lore.kernel.org/linux-riscv/ce5b3533-b75d-c31c-4319-9d29769bbbd5@huawei.com/T/#t
> > Hi Kefeng,
> >
> > Please see:
> > http://bit.do/syzbot#no-custom-patches
> >
> > Is a unit-test for this possible? Fuzzing is not a replacement for unit testing.
>
> ok, I mean that the issue about stack unwinder which may cause by my
> previous patch,
>
> if some one want the stack back, it could try the bugfix.

Everybody wants the stack back!
Good, let's wait when it's merged and we will see stacks in all kernel
testing systems.





> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/093ff4d1-3977-1085-404f-ec46a3b1d8f0%40huawei.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
