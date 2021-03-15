Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD2CC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 12:09:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AEF064E98
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 12:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AEF064E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3sZjAM+Ey3SmgUfrUynCLy/etH4g5s0gbSrE721BZUc=; b=kFPs7A1GqR0mMFnezvcHSjv4S
	nV274zz40sz83ua+ooYBHkZS+qetqDYcVnrWBy2Ce7sG0GHLu0wzXDUvPwhPPMkwljW0Zm6ZPNGVs
	2H3QAAwE/kM9gOZac8LGarx0EwyZsuEB+ham9Q22C0V0i6CbKLNTcw3qyUUFvKmd4DSp30AsRTpus
	fFvKhGv7P1WRyz7tWCJwakZweHMGLCWDuNDVL1Nr5zr4MJMLLfGxsgZ6ftABXihXjfmB4O3UOk+C8
	VZrXlUXMOBzWGY9KKdGkDyAxnPh55PzuYxWLyeLxLpKBknloYdwRYMTiOm9GaiPkMoOrLaefRrnN6
	3EPUc9feQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLm1x-00Fmls-CI; Mon, 15 Mar 2021 12:09:06 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLllj-00FiT5-Tc
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 11:52:50 +0000
Received: by mail-qk1-x72c.google.com with SMTP id s7so31249105qkg.4
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=32TvfxSkzYWhVmQkeQkwenaCMad2tF6b4G0jVDrs/a4=;
 b=ALfTs7zBGQzj2IMrYgNcHtnpLmGTXDRfaQxZeu/odl7eyYeCFi0V4NJ2x+y2LuA/uz
 ph/729wVQpd0FYg5hUL/S5JpkzzIIbXewyEbvTpYCTaOondRqIV/FlqJJHPMNzO38S0Q
 uJIkZ/5XeFOaFuwSu0wnZUFE2kxWowkZVUzuVr6UYgHHX97qT7+D5GZ74lpqhG97Y0Iu
 QuRRiUBPJqd3xTswAwvv0dz/KN7xZuyVta1zyH76bJzIgh6+tWMhlBeBOyQEjnQz6oGu
 Lfa9LATToyUKerCBNO7M5foMGA1o0zbY18S+cyGiuV4dLDY5SS1PphobALB7tG2TshM+
 ifrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32TvfxSkzYWhVmQkeQkwenaCMad2tF6b4G0jVDrs/a4=;
 b=NZj4gssG06JmbDXFyHAFzhuymSZncoI+kTGrM5q9ds/AhWh8hF0Ezm0pLWT0gVQ/OH
 z12+O4SP30BDXi5xXEFbf2SMxqfeThu9pCXseitwW8vbQYZqMTS/COU4LLob4sxpn3C6
 5wwD9jFubbR/w2ceawW7BQ0wu4I4a1ESXebeL4OgidHn7koMOyxNFm8AyLPv8xH7ddre
 ukEQjAFAPYTZM+gI6PL2/BK0WDjYyhVkdMpHGBXBY7ur+iAWsOxy6B3VG4cUKIdmFB+g
 q3zXlP6uKQetntG47nK4Ob03KKMU++OCN+Swg9PNFioal3HBGQU9Bj3vKsAGEy1P2juL
 0eeA==
X-Gm-Message-State: AOAM531GUISX77GGXI4NIHdcKKVRMeCXlYULDFvMno2gcRpg8FPAO9yb
 YOjGzD8HJyIMA9POxfqrp00HWIA0rP9gsbcB5lIdSQ==
X-Google-Smtp-Source: ABdhPJyTiP3VZRD2+BkeloNDqEutijd0tcaoS2gge3f4Ric1U/h+BWCA5c0B+z0nk79PDPEdKLh0VUeNxtwNGc7korU=
X-Received: by 2002:a05:620a:981:: with SMTP id
 x1mr23826304qkx.501.1615809134984; 
 Mon, 15 Mar 2021 04:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000096cdaa05bd32d46f@google.com>
 <CACT4Y+ZjdOaX_X530p+vPbG4mbtUuFsJ1v-gD24T4DnFUqcudA@mail.gmail.com>
 <CACT4Y+ZjVS+nOxtEByF5-djuhbCYLSDdZ7V04qJ0edpQR0514A@mail.gmail.com>
 <CACT4Y+YXifnCtEvLu3ps8JLCK9CBLzEuUAozfNR9v1hsGWspOg@mail.gmail.com>
 <ed89390a-91e1-320a-fae5-27b7f3a20424@codethink.co.uk>
In-Reply-To: <ed89390a-91e1-320a-fae5-27b7f3a20424@codethink.co.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 15 Mar 2021 12:52:03 +0100
Message-ID: <CACT4Y+a1pQ96UWEB3pAnbxPZ+6jW2tqSzkTMqJ+XSbZsKLHgAw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210315_115245_270148_15BC8D4E 
X-CRM114-Status: GOOD (  28.09  )
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

On Mon, Mar 15, 2021 at 12:30 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 14/03/2021 11:03, Dmitry Vyukov wrote:
> > On Sun, Mar 14, 2021 at 11:01 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >>> On Wed, Mar 10, 2021 at 7:28 PM syzbot
> >>> <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> syzbot found the following issue on:
> >>>>
> >>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> >>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> >>>> console output: https://syzkaller.appspot.com/x/log.txt?x=122c343ad00000
> >>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> >>>> dashboard link: https://syzkaller.appspot.com/bug?extid=c23c5421600e9b454849
> >>>> userspace arch: riscv64
> >>>>
> >>>> Unfortunately, I don't have any reproducer for this issue yet.
> >>>>
> >>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>>> Reported-by: syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com
> >>>
> >>> +riscv maintainers
> >>>
> >>> Another case of put_user crashing.
> >>
> >> There are 58 crashes in sock_ioctl already. Somehow there is a very
> >> significant skew towards crashing with this "user memory without
> >> uaccess routines" in schedule_tail and sock_ioctl of all places in the
> >> kernel that use put_user... This looks very strange... Any ideas
> >> what's special about these 2 locations?
> >
> > I could imagine if such a crash happens after a previous stack
> > overflow and now task data structures are corrupted. But f_getown does
> > not look like a function that consumes way more than other kernel
> > syscalls...
>
> The last crash I looked at suggested somehow put_user got re-entered
> with the user protection turned back on. Either there is a path through
> one of the kernel handlers where this happens or there's something
> weird going on with qemu.

Is there any kind of tracking/reporting that would help to localize
it? I could re-reproduce with that code.

> I'll be trying to get this run up on real hardware this week, the nvme
> with my debian install died last week so I have to go and re-install
> the machine to get development work done on it.
>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/ed89390a-91e1-320a-fae5-27b7f3a20424%40codethink.co.uk.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
