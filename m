Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0F9C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 18:54:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A377664F25
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 18:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A377664F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RAgMgcSgEyWLIdqEHVISr3feRuZ1DIxzYCOrnAwusg4=; b=h6PRp4Zt1Tmezm6ya3Rwaztc6
	sJ39D2x2p49yyi3DFozH5XpVmElXynlMPasC/Vk2M6uaZXjOnTde+PB1+f3uuYuueCvjTV4MiNzx5
	Bcq8kqAf7NBkJcXlNqTxMju4coErIrcA8VSh/v7wR0fF+weYcRTL+CmsNw5jAz+r08l7xHLeSokfU
	2IWBWjYI4XQYCqgTbUbvjRWhWmzR0LgEkTewcq6bZs0ukjZGY/Btbh7RmZ6VgNkTC8+tiBz0TvEjt
	CB1102+smtXpigbdQeANqy2aZCTpZZK2Yp9xc+gZITR+DN7iq8rPAXvLpFn0xSOhvO+f5w88MwL66
	7vvGg1rsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK3yG-007YIQ-Ty; Wed, 10 Mar 2021 18:54:13 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK3yC-007YI1-5Z
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 18:54:10 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d11so13820524qtx.9
 for <linux-riscv@lists.infradead.org>; Wed, 10 Mar 2021 10:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vLXAkAskiQcQ1LGOy8c4iMFazBShIBbsgNpMAGpqQ4c=;
 b=ZuSIP/eNepj/rQzXVsX2ED06gVSKBiUOIYtuJZqyh6bBg/meWNhS3uDaqTxOhhOfp1
 bu0ZN+1Y0NhncPI+mdAV92Z5lxeHf1uXQD4umfdqGUX9RYpKA58TSR+3HZvjjn8dXigB
 B4vSKM1L7AojEUrjbKVX6KL0MBAqQ+uUpw/v1Cj/Nx//AMeFWuBOl7QLr54lmmuOujyd
 qBSaxOUE0W+vcWp3K2qFFaoyn4hZjSNsVMf0x0IVXKUPhklrcUHAUlQdrAIl7Vx8WjRO
 bq3bKqGL18LWzf4ANxQ4VljxaTw2rPzWEGjFgQaIiweVTc/iCHuC+nDSNJayJILLX/NN
 P1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLXAkAskiQcQ1LGOy8c4iMFazBShIBbsgNpMAGpqQ4c=;
 b=IKlUbQdEXzLQhA/VvK1FbRo+xfZTyV/zMJZmMrHhY2a6YFsmCn1p1VUDmtIhn3BARW
 L+uevfVIivifyHBl9KPC8KfgTr+E1u/JOq0VSVAX6/KzQCbvLzSb14Bzzj2PLmjirq8D
 fggV9c9LbyybdOt+7jBOaYi1XgnWg6Xeg2sSlE2Gttav5g5ZVtxvmKfWICOdGImbFnrv
 9/4sgZzGyEgqYYh1nHvaIHfBQvqUo4LjuTS3tJp2s8tu3yeUz9YLQAlGvDe+CxmiRxmu
 3npxBFYmaU6brp/tLkwIcXmM0uortPjRW+27Excq36xlBd6ZPUvwVWFNYB+rWuWq1b0U
 +iWw==
X-Gm-Message-State: AOAM532K+XERl6wdxWC1UbMJ96qBKti6tdcPHwwUBY4dLqnrXczxjvWX
 9lz9ABdtxdqA/aQgoiZ/OsA7/NZciCcHHt30LHQbYg==
X-Google-Smtp-Source: ABdhPJyM9qnpbKqhCRB40B0yeUnOBOcSPvPcrAs7e98U0YztJpyjwaEfa6Bmu6KrOPIe04vN06dWWBKZgCJLhO+r/tY=
X-Received: by 2002:ac8:5847:: with SMTP id h7mr3945605qth.43.1615402446649;
 Wed, 10 Mar 2021 10:54:06 -0800 (PST)
MIME-Version: 1.0
References: <00000000000096cdaa05bd32d46f@google.com>
In-Reply-To: <00000000000096cdaa05bd32d46f@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 10 Mar 2021 19:53:55 +0100
Message-ID: <CACT4Y+ZjdOaX_X530p+vPbG4mbtUuFsJ1v-gD24T4DnFUqcudA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210310_185408_297059_88BE79EC 
X-CRM114-Status: GOOD (  19.26  )
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

On Wed, Mar 10, 2021 at 7:28 PM syzbot
<syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=122c343ad00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> dashboard link: https://syzkaller.appspot.com/bug?extid=c23c5421600e9b454849
> userspace arch: riscv64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com

+riscv maintainers

Another case of put_user crashing.

> Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000020000300
> Oops [#1]
> Modules linked in:
> CPU: 1 PID: 4488 Comm: syz-executor.0 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> Hardware name: riscv-virtio,qemu (DT)
> epc : sock_ioctl+0x424/0x6ac net/socket.c:1124
>  ra : sock_ioctl+0x424/0x6ac net/socket.c:1124
> epc : ffffffe002aeeb3e ra : ffffffe002aeeb3e sp : ffffffe023867da0
>  gp : ffffffe005d25378 tp : ffffffe007e116c0 t0 : 0000000000000000
>  t1 : 0000000000000001 t2 : 0000003fb8035e44 s0 : ffffffe023867e30
>  s1 : 0000000000040000 a0 : 0000000000000000 a1 : 0000000000000007
>  a2 : 1ffffffc00fc22d8 a3 : ffffffe003bc1d02 a4 : 0000000000000000
>  a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>  s2 : 0000000000000000 s3 : 0000000000008902 s4 : 0000000020000300
>  s5 : ffffffe005d2b0d0 s6 : ffffffe010facfc0 s7 : ffffffe008e00000
>  s8 : 0000000000008903 s9 : ffffffe010fad080 s10: 0000000000000000
>  s11: 0000000000020000 t3 : 982de389919f6300 t4 : ffffffc401175688
>  t5 : ffffffc401175691 t6 : 0000000000000007
> status: 0000000000000120 badaddr: 0000000020000300 cause: 000000000000000f
> Call Trace:
> [<ffffffe002aeeb3e>] sock_ioctl+0x424/0x6ac net/socket.c:1124
> [<ffffffe0003fdb6a>] vfs_ioctl fs/ioctl.c:48 [inline]
> [<ffffffe0003fdb6a>] __do_sys_ioctl fs/ioctl.c:753 [inline]
> [<ffffffe0003fdb6a>] sys_ioctl+0x5c2/0xd56 fs/ioctl.c:739
> [<ffffffe000005562>] ret_from_syscall+0x0/0x2
> Dumping ftrace buffer:
>    (ftrace buffer empty)
> ---[ end trace a5f91e70f37b907b ]---
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000096cdaa05bd32d46f%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
