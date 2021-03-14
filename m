Return-Path: <SRS0=fQzb=IM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C02C433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 10:02:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56FA564EC6
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 10:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56FA564EC6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rwf8VD2JWzS9NtfjUzRizy5K70fPTYAFOhNsc1X89Ag=; b=FGU56ERSDBD5lrPCxTz96dpuA
	o6FhvOtgpNNSTqgf1y92kM1S6IlB5Fq4eNsv7EtOR7cPQCPVZr/EUfVSlQx/c5XVLmU+ciJvRvyih
	L6MYLKf5ngxKV1oSzVyKebc7izAw62oDw8GdYkPAQ4x/t4E2gV1IhBkEvhtRgh3w8UGO8wdEj8Gg5
	9SLuemt6otZ0A9Ptft5XnDr+9xseMtLnw6f6q0dToqpPL6BOgLnv49hYktYbYboDjnDvAnjluaT6z
	WBIXfqxAcbH4DUvE+bMana5yO0k9RN+lxbF0vqRQOTPAcaryX0XseZpuP7Y9czrKeAKKj5ZAo6BcU
	YqF+fGcNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLNZM-00E64R-Pq; Sun, 14 Mar 2021 10:01:56 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLNZI-00E63s-Qr
 for linux-riscv@lists.infradead.org; Sun, 14 Mar 2021 10:01:55 +0000
Received: by mail-qv1-xf31.google.com with SMTP id cx5so6412640qvb.10
 for <linux-riscv@lists.infradead.org>; Sun, 14 Mar 2021 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V9sT2+1xGWWst4bttpxK8qQ+hu8YuKQN51ohN8OT3c8=;
 b=V0E9YrVrqNrmHyaGGS2inR5EG2jdyBufEWpDo1J7GHy2CDxubNlpcs2qDjK8muao68
 vJ/fBpCplKi9jzNcEsBT+NeZ5ZcU6wbjacQMfVTiCoXeodLZFL+3j9O+EmwgDRcgyqku
 WnLMo7j7BOPADrmvQn5Hf7D/mz9sCpNVKfglfFUsK+aYPBorVNl99DLBSw7mATQJKrm1
 FViIjGdN5yZe1/RNfm4H6Kd592Q1I6cgrIYSYtiRMbY8NbsZtK6RCbnL1ew3GpJ16idM
 8X9VNTXyQeyfLwUac+y1LdoA+rZ/Py48RhmKQL2E/tgLxh7LzN5p/sqB/6qs8KEMFfwp
 vhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V9sT2+1xGWWst4bttpxK8qQ+hu8YuKQN51ohN8OT3c8=;
 b=gqKTR60QFYANlUcP3EMgEiOt7tnCJfKq57y97MJEEqIGkiwZTKwHb+5UC/AnWUaJRx
 RCaeaR3wd/d5kY1pRhcfgovHFYwH5peNTk4fYRezsuH4jtzpwasFV9cvKXDcTf7eoWDo
 JGwpYKN5BMMj7k8eNDQVKEP3EGfIMqMHKHm33ZRGNFzVE6n64bv/sfTTjWlu44K5qVNL
 OZ3W6Ut7ewL11vaJ1LVIaOk/x0uZtGdGPLPXAlBRqqukm873yqmui7mo/73pueVb0VhF
 B4gwxoaMEHzqCUop9Fp+0kr0cmYGtlKY8C4UvCBvroLsSsBTSgvXPQol4+PceUjV7cXK
 aTtA==
X-Gm-Message-State: AOAM530pAvERVhZgv/wkbwe6nLvCF51yL46r6/1Qg8+D8P8yjYRCwtlt
 W7pl7qzTzGzWnzNC7A6isqZLeSAIbOQbpuAD8XMsFg==
X-Google-Smtp-Source: ABdhPJy+VvF0EiHA6nUvKNqWlrBetdvLNPW+AK/wZIPRYlo9k7aSKbqQa7OoPlVK+wlWobmQl0SijN7Ooh4s/FNr5eA=
X-Received: by 2002:a05:6214:326:: with SMTP id
 j6mr5856707qvu.13.1615716110661; 
 Sun, 14 Mar 2021 03:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000096cdaa05bd32d46f@google.com>
 <CACT4Y+ZjdOaX_X530p+vPbG4mbtUuFsJ1v-gD24T4DnFUqcudA@mail.gmail.com>
In-Reply-To: <CACT4Y+ZjdOaX_X530p+vPbG4mbtUuFsJ1v-gD24T4DnFUqcudA@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 14 Mar 2021 11:01:39 +0100
Message-ID: <CACT4Y+ZjVS+nOxtEByF5-djuhbCYLSDdZ7V04qJ0edpQR0514A@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 sock_ioctl
To: syzbot <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: andrii@kernel.org, Alexei Starovoitov <ast@kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, David Miller <davem@davemloft.net>, 
 John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 kpsingh@kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 netdev <netdev@vger.kernel.org>, Song Liu <songliubraving@fb.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Yonghong Song <yhs@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_100153_006641_BA0E3BDE 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, Mar 10, 2021 at 7:53 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, Mar 10, 2021 at 7:28 PM syzbot
> <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > console output: https://syzkaller.appspot.com/x/log.txt?x=122c343ad00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> > dashboard link: https://syzkaller.appspot.com/bug?extid=c23c5421600e9b454849
> > userspace arch: riscv64
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com
>
> +riscv maintainers
>
> Another case of put_user crashing.

There are 58 crashes in sock_ioctl already. Somehow there is a very
significant skew towards crashing with this "user memory without
uaccess routines" in schedule_tail and sock_ioctl of all places in the
kernel that use put_user... This looks very strange... Any ideas
what's special about these 2 locations?


> > Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000020000300
> > Oops [#1]
> > Modules linked in:
> > CPU: 1 PID: 4488 Comm: syz-executor.0 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> > Hardware name: riscv-virtio,qemu (DT)
> > epc : sock_ioctl+0x424/0x6ac net/socket.c:1124
> >  ra : sock_ioctl+0x424/0x6ac net/socket.c:1124
> > epc : ffffffe002aeeb3e ra : ffffffe002aeeb3e sp : ffffffe023867da0
> >  gp : ffffffe005d25378 tp : ffffffe007e116c0 t0 : 0000000000000000
> >  t1 : 0000000000000001 t2 : 0000003fb8035e44 s0 : ffffffe023867e30
> >  s1 : 0000000000040000 a0 : 0000000000000000 a1 : 0000000000000007
> >  a2 : 1ffffffc00fc22d8 a3 : ffffffe003bc1d02 a4 : 0000000000000000
> >  a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
> >  s2 : 0000000000000000 s3 : 0000000000008902 s4 : 0000000020000300
> >  s5 : ffffffe005d2b0d0 s6 : ffffffe010facfc0 s7 : ffffffe008e00000
> >  s8 : 0000000000008903 s9 : ffffffe010fad080 s10: 0000000000000000
> >  s11: 0000000000020000 t3 : 982de389919f6300 t4 : ffffffc401175688
> >  t5 : ffffffc401175691 t6 : 0000000000000007
> > status: 0000000000000120 badaddr: 0000000020000300 cause: 000000000000000f
> > Call Trace:
> > [<ffffffe002aeeb3e>] sock_ioctl+0x424/0x6ac net/socket.c:1124
> > [<ffffffe0003fdb6a>] vfs_ioctl fs/ioctl.c:48 [inline]
> > [<ffffffe0003fdb6a>] __do_sys_ioctl fs/ioctl.c:753 [inline]
> > [<ffffffe0003fdb6a>] sys_ioctl+0x5c2/0xd56 fs/ioctl.c:739
> > [<ffffffe000005562>] ret_from_syscall+0x0/0x2
> > Dumping ftrace buffer:
> >    (ftrace buffer empty)
> > ---[ end trace a5f91e70f37b907b ]---
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
