Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8611C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 15:18:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C1364E89
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 15:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C1364E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Fbc1bsTGhHg/6+Oz+pH2L2VaQhFnq3l2x/ZANjil1g=; b=Pi5HfmGFGw9fYPfdQSHJxNik6
	8QZ/maqm8OZ/uVV1K582vEs/IhWAYXxg54A1+cXTJKkqb/pryUFGFnJlby2zUgB7BWN9CfWcgpTiA
	PXwHiHPyqWArxOAtpATYCscKs6OIfarSrGKpfqqhABvPRlvdXLAYYIsf+ezrC4cz1qOhFaUg3zriB
	cevK0hgB/5uCvEsu2U7pX4Ad1YouSUNAW1Udy3rRnn6Ug3UDk9Y+IpDN2kXHnR7frhvVkg+dyzGq7
	tj48lNSVdIScZtqPBZRmdG1/Z/wYTNj16pUiC5oEP72xC/KjlI7Om5h+gqFOkkmuQGKweec1Pvpyf
	QZ6m8vAvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMuPj-005Z8y-IJ; Thu, 18 Mar 2021 15:18:19 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMuPg-005Z8Y-2H
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 15:18:18 +0000
Received: by mail-qv1-xf34.google.com with SMTP id g8so3362373qvx.1
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 08:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wOFBEPOr1SLeNR/Um5yDZSZIjOy82REcErjZY7pyKDQ=;
 b=CGGA9HuO0wmX6avzNQTVJ1nxLiQT7aoA7o7FrVE3h5ceaWoUInIhyTeqemyADCS6SS
 J1aSW/VAUL1LnUkoNWIaeeSEzosnmOzekeP/Cd/AKRy6XHe9D7fDF40I0pEkVfgkcW04
 Wueno/T53xBADAnWoqeonhzXD9XNteEmC/vWz3nlkLOJoxqPjJij8jrdxkVtid3qxIiG
 I0rOFVlJAHwmbMjA/2dQi7Yn2BAdLee9UC8U/FG16CmNV2srxQv8jKGwqOFHX+vGZrEo
 6/yLe1Nt7gWUUdg+KAGLwVM8/EjMxf07fwbwGl6wHOYdCUuiAcVwJliH313dDR58H1k5
 zZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wOFBEPOr1SLeNR/Um5yDZSZIjOy82REcErjZY7pyKDQ=;
 b=J5iQnm8x+wHEUCqghRgFVP6MJqux5PLLzvLWeb9wfFR5zD/xgGMPgYH7ptkQOL3C03
 Sj0K8eJiaBdtqrMNo1WafqrYjtM2v+qDXBWqF6Ha0YYd0PHDSehj9BS2yuS34PjPm4Dp
 3Iwm/hxSmFWHVUL6O3SswMcwGFpwAypXRe/ySAcPAea4yQL4WikeyQQ1QuHDzd38YOFo
 WEpOyM0Eh9Pp8jV06EwkqCuxjPdRmzb3FJ83sqQ4qZhBbSsL6L4VWRvA/VchEpOZFeNJ
 gvgMF7hEfIvCoVyAToLHx9HkZ8scSLYQjjFc43Ye4j4B4nOG7/d1Ygx+dPSNbgz4CTMB
 FK5g==
X-Gm-Message-State: AOAM531WSZTB6XKYuMuJwVJ0SdGZ/jy9xc8PjfcFHSNJ2gUTM4iwilpj
 WI82TDMwgDtcK4KFfKqatjqw06Sp8J1kxeroM6cTWn/YUJ1L6A==
X-Google-Smtp-Source: ABdhPJy+OexF6sUgIP9Tj4vBricdu5cz15i4H10NQtNRkmkVuuYT5vaIDniBeQ+tCfWs2JPm3+l6eTr6bCrP19dyYj8=
X-Received: by 2002:ad4:410d:: with SMTP id i13mr4704593qvp.44.1616080694677; 
 Thu, 18 Mar 2021 08:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000096cdaa05bd32d46f@google.com>
 <CACT4Y+ZjdOaX_X530p+vPbG4mbtUuFsJ1v-gD24T4DnFUqcudA@mail.gmail.com>
 <CACT4Y+ZjVS+nOxtEByF5-djuhbCYLSDdZ7V04qJ0edpQR0514A@mail.gmail.com>
 <CACT4Y+YXifnCtEvLu3ps8JLCK9CBLzEuUAozfNR9v1hsGWspOg@mail.gmail.com>
 <ed89390a-91e1-320a-fae5-27b7f3a20424@codethink.co.uk>
 <CACT4Y+a1pQ96UWEB3pAnbxPZ+6jW2tqSzkTMqJ+XSbZsKLHgAw@mail.gmail.com>
 <bf2e19a3-3e3a-0eb1-ae37-4cc3b1a7af42@codethink.co.uk>
In-Reply-To: <bf2e19a3-3e3a-0eb1-ae37-4cc3b1a7af42@codethink.co.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 18 Mar 2021 16:18:03 +0100
Message-ID: <CACT4Y+ZVaxQAnpy_bMGwviZMskD-fy1KgY7pbrjcCRXr24eu2Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210318_151816_185329_052025F4 
X-CRM114-Status: GOOD (  30.36  )
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

On Mon, Mar 15, 2021 at 3:41 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 15/03/2021 11:52, Dmitry Vyukov wrote:
> > On Mon, Mar 15, 2021 at 12:30 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >>
> >> On 14/03/2021 11:03, Dmitry Vyukov wrote:
> >>> On Sun, Mar 14, 2021 at 11:01 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >>>>> On Wed, Mar 10, 2021 at 7:28 PM syzbot
> >>>>> <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com> wrote:
> >>>>>>
> >>>>>> Hello,
> >>>>>>
> >>>>>> syzbot found the following issue on:
> >>>>>>
> >>>>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> >>>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> >>>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=122c343ad00000
> >>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> >>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=c23c5421600e9b454849
> >>>>>> userspace arch: riscv64
> >>>>>>
> >>>>>> Unfortunately, I don't have any reproducer for this issue yet.
> >>>>>>
> >>>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>>>>> Reported-by: syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com
> >>>>>
> >>>>> +riscv maintainers
> >>>>>
> >>>>> Another case of put_user crashing.
> >>>>
> >>>> There are 58 crashes in sock_ioctl already. Somehow there is a very
> >>>> significant skew towards crashing with this "user memory without
> >>>> uaccess routines" in schedule_tail and sock_ioctl of all places in the
> >>>> kernel that use put_user... This looks very strange... Any ideas
> >>>> what's special about these 2 locations?
> >>>
> >>> I could imagine if such a crash happens after a previous stack
> >>> overflow and now task data structures are corrupted. But f_getown does
> >>> not look like a function that consumes way more than other kernel
> >>> syscalls...
> >>
> >> The last crash I looked at suggested somehow put_user got re-entered
> >> with the user protection turned back on. Either there is a path through
> >> one of the kernel handlers where this happens or there's something
> >> weird going on with qemu.
> >
> > Is there any kind of tracking/reporting that would help to localize
> > it? I could re-reproduce with that code.
>
> I'm not sure. I will have a go at debugging on qemu today just to make
> sure I can reproduce here before I have to go into the office and fix
> my Icicle board for real hardware tests.
>
> I think my first plan post reproduction is to stuff some trace points
> into the fault handlers to see if we can get a idea of faults being
> processed, etc.
>
> Maybe also add a check in the fault handler to see if the fault was
> in a fixable region and post an error if that happens / maybe retry
> the instruction with the relevant SR_SUM flag set.
>
> Hopefully tomorrow I can get a run on real hardware to confirm.
> Would have been better if the Unmatched board I ordered last year
> would turn up.

In retrospect it's obvious what's common between these 2 locations:
they both call a function inside of put_user.

#syz dup:
BUG: unable to handle kernel access to user memory in schedule_tail

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
