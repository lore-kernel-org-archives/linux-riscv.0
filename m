Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F978C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 15:54:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E0B464DFF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 15:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E0B464DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KyRwfyjoRzWa1U83XfugfjBZnNoyb1mes1DQstGoHdo=; b=StQFAQ0u9J000k6nMGsOu572e
	eR65+jR7z2DFvnO2Tdb7u4Xe0OvRJz9qOF4B99NLPCzjbPxpbC4ycRy6YzQJxJHV1uY4EhDcNADY3
	76jL1POCNXELFImZzJ4jR9ta3YZ0k2yPYJl+JhbSMwGknENsckReIOFgj/cXyeAdRXMyaSEG98YyD
	oMGfmmGA4YBb9da0SnIhVqSBmph/jiYcv8Q8ni0rr5YIcbFy73Bb/fbl4kh43vfuGOtpL2DF9nway
	SFeJIiw3Pwe7F9CcCNLCU5Qbz6XW7Ul/13wATou1VZwZgHH3PDkEwYWiI2syh0FV+7GGVv8gO0hO3
	TrKow3GMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMuye-005aUl-32; Thu, 18 Mar 2021 15:54:24 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMuya-005aUO-Ln
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 15:54:22 +0000
Received: by mail-qk1-x72a.google.com with SMTP id x10so2452742qkm.8
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 08:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J+EfAqBWMuldZhFLKTK7DYwRmCCO76h3wFXCCWaZSMc=;
 b=JAuMzMkBbITRNY13aACDLIk/k+iuZNwnY+TuVS/VkWrpwiwiZnjIqAqXg+sgD6k0rD
 2683zQhrba+zznwFVhN9TrfJ2tXM27aBcej6YTISwW5enO4MpUM/7/vUSZLCc/eilbKY
 de8krjIAoXdrlFD7hjXponAFXD9uzSZQ848crh8XQfUyaA7GE/p44upKGkaYGQID7gjQ
 TGu3nqOZmibsYwtW4nkpKaMz1xaGTssKbFmUcf+q/G9q1Acnpjk726Z+krAWQQ7qI1tE
 /FFn9w3c8gJi84/60Z/hO18B5j9iNY799t13VZZHHC7ydIZvKIyuqgIX3IRpPo6ahMIi
 Auyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J+EfAqBWMuldZhFLKTK7DYwRmCCO76h3wFXCCWaZSMc=;
 b=h1gYEPlDeE+n0YsJPJKAWB4u8pmqDTCaXyoDJ/BxpnWCIJNqti956JJHpJ1KAUZlPx
 w9E4Z06+JJ3fVsCyaX5KNUblOUOuyKn3/5MOSfV6o0rGPUv3atMXMoVtEkZm9a5T1GQk
 bg9jLRhsX0umA9XlgM5ACuVqptF2vATtegBtWFApg9XTAHoE65WqqbqRJRZ9kWl6Mw4J
 8QBCXuJRGaY7Bk44OT5ObXx5FiQ66chMEKIrwYpDCUwj3T4CE9x2JN1ebp4m0DfJj1sG
 q8jNUGKIaEVJOMecFPttHoIgrOCtWGShxRxrLbhx9gl2K0/wyDxIswwkx2DTbcrpHujo
 YsNA==
X-Gm-Message-State: AOAM533dyeep2dZuW4nC2Cy06ctysHspJQ0BrYfknqKMV68UHJdEp+dx
 F1raDSlNjyQEDsJz0OU1zQlJWD6U5/qs1VVhe8LLeg==
X-Google-Smtp-Source: ABdhPJxFh76WWb8+3I2ntXhBqRjTSAc+1WcZgiaZ7ifnOH2xeqOLOi44Fqrc0Z0eZNzc0q7qHi5UZ42ezkHaQtthL9A=
X-Received: by 2002:a05:620a:410f:: with SMTP id
 j15mr5028891qko.424.1616082859168; 
 Thu, 18 Mar 2021 08:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000096cdaa05bd32d46f@google.com>
 <CACT4Y+ZjdOaX_X530p+vPbG4mbtUuFsJ1v-gD24T4DnFUqcudA@mail.gmail.com>
 <CACT4Y+ZjVS+nOxtEByF5-djuhbCYLSDdZ7V04qJ0edpQR0514A@mail.gmail.com>
 <CACT4Y+YXifnCtEvLu3ps8JLCK9CBLzEuUAozfNR9v1hsGWspOg@mail.gmail.com>
 <ed89390a-91e1-320a-fae5-27b7f3a20424@codethink.co.uk>
 <CACT4Y+a1pQ96UWEB3pAnbxPZ+6jW2tqSzkTMqJ+XSbZsKLHgAw@mail.gmail.com>
 <bf2e19a3-3e3a-0eb1-ae37-4cc3b1a7af42@codethink.co.uk>
 <CACT4Y+ZVaxQAnpy_bMGwviZMskD-fy1KgY7pbrjcCRXr24eu2Q@mail.gmail.com>
 <8372d8e5-af6e-c851-a0ac-733e269102ce@codethink.co.uk>
In-Reply-To: <8372d8e5-af6e-c851-a0ac-733e269102ce@codethink.co.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 18 Mar 2021 16:54:07 +0100
Message-ID: <CACT4Y+aDY38_to=UN9YtAr2aBrSaEqs0jfd9R--Qxdw8=jEt3w@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 sock_ioctl
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: syzbot <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 andrii@kernel.org, Alexei Starovoitov <ast@kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, David Miller <davem@davemloft.net>, 
 John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 kpsingh@kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 netdev <netdev@vger.kernel.org>, Song Liu <songliubraving@fb.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Yonghong Song <yhs@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_155420_863061_1AA13678 
X-CRM114-Status: GOOD (  37.38  )
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

On Thu, Mar 18, 2021 at 4:35 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 18/03/2021 15:18, Dmitry Vyukov wrote:
> > On Mon, Mar 15, 2021 at 3:41 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >>
> >> On 15/03/2021 11:52, Dmitry Vyukov wrote:
> >>> On Mon, Mar 15, 2021 at 12:30 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >>>>
> >>>> On 14/03/2021 11:03, Dmitry Vyukov wrote:
> >>>>> On Sun, Mar 14, 2021 at 11:01 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >>>>>>> On Wed, Mar 10, 2021 at 7:28 PM syzbot
> >>>>>>> <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com> wrote:
> >>>>>>>>
> >>>>>>>> Hello,
> >>>>>>>>
> >>>>>>>> syzbot found the following issue on:
> >>>>>>>>
> >>>>>>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> >>>>>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> >>>>>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=122c343ad00000
> >>>>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> >>>>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=c23c5421600e9b454849
> >>>>>>>> userspace arch: riscv64
> >>>>>>>>
> >>>>>>>> Unfortunately, I don't have any reproducer for this issue yet.
> >>>>>>>>
> >>>>>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>>>>>>> Reported-by: syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com
> >>>>>>>
> >>>>>>> +riscv maintainers
> >>>>>>>
> >>>>>>> Another case of put_user crashing.
> >>>>>>
> >>>>>> There are 58 crashes in sock_ioctl already. Somehow there is a very
> >>>>>> significant skew towards crashing with this "user memory without
> >>>>>> uaccess routines" in schedule_tail and sock_ioctl of all places in the
> >>>>>> kernel that use put_user... This looks very strange... Any ideas
> >>>>>> what's special about these 2 locations?
> >>>>>
> >>>>> I could imagine if such a crash happens after a previous stack
> >>>>> overflow and now task data structures are corrupted. But f_getown does
> >>>>> not look like a function that consumes way more than other kernel
> >>>>> syscalls...
> >>>>
> >>>> The last crash I looked at suggested somehow put_user got re-entered
> >>>> with the user protection turned back on. Either there is a path through
> >>>> one of the kernel handlers where this happens or there's something
> >>>> weird going on with qemu.
> >>>
> >>> Is there any kind of tracking/reporting that would help to localize
> >>> it? I could re-reproduce with that code.
> >>
> >> I'm not sure. I will have a go at debugging on qemu today just to make
> >> sure I can reproduce here before I have to go into the office and fix
> >> my Icicle board for real hardware tests.
> >>
> >> I think my first plan post reproduction is to stuff some trace points
> >> into the fault handlers to see if we can get a idea of faults being
> >> processed, etc.
> >>
> >> Maybe also add a check in the fault handler to see if the fault was
> >> in a fixable region and post an error if that happens / maybe retry
> >> the instruction with the relevant SR_SUM flag set.
> >>
> >> Hopefully tomorrow I can get a run on real hardware to confirm.
> >> Would have been better if the Unmatched board I ordered last year
> >> would turn up.
> >
> > In retrospect it's obvious what's common between these 2 locations:
> > they both call a function inside of put_user.
> >
> > #syz dup:
> > BUG: unable to handle kernel access to user memory in schedule_tail
>
> I think so. I've posted a patch that you can test, which should force
> the flags to be saved over switch_to(). I think the sanitisers are just
> making it easier to see.
>
> There is a seperate issue of passing complicated things to put_user()
> as for security, the function may be executed with the user-space
> protections turned off. I plan to raise this on the kernel list later
> once I've done some more testing.

Thanks for quick debugging and the fix. This is the top crasher on the
syzbot instance, so this will unblock real testing.
I think I will trust your testing. syzbot instance is now on
riscv/fixes branch, so it will pick it up as soon as it's in that tree
(hopefully soon) and will do as exhaustive testing as possible :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
