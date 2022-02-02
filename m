Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7FEC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cl7pzRyI6sHJQvGpMMY34tmD9As8tLc4fIZ5uUIlMf4=; b=J5sLpcpCHMqeFe
	qGIZvJqBJsGhYKv8GfKM8sP5o+xg9hcFqnCh9w9Cvic9a//G/iacXD8dUglZH6W/uqGVPotAygjiU
	cC5J/bfAfXPp1wXa+8Zj3IpGg4xmI8wwoYIGySLREyEpRTWUTPG7kTUDHHJpGHuzoQrYHk6LR2UNe
	AcEwpn3zAUbRALx9c2//CCKlugc1NBOvjEtVAOLUrJeIhi472lK48VyJWBeScq7+rjRvfSTyT70UK
	2P35ghv2Y0wQS6VbMlC9QO9BxzX1mqzeMyKAw2b1VtqNRyeRpOnj5t4nKwxbIscoKQnYnTRhwqhYp
	QNUUpzisr+zqLSGwmfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFDUq-00F16R-Ea; Wed, 02 Feb 2022 11:08:20 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFDUn-00F156-Oc
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 11:08:19 +0000
Received: by mail-il1-x133.google.com with SMTP id w5so16723419ilo.2
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 03:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvwP2pq0A69XLEtJRHQeT2K6fCrFL3jZAy9726cRZ/o=;
 b=hkqcAskloSPcrI90jAiwlBCksVcgOjKlFwsucBqi2eYnoWM21moZyBpPgJZ2Xrm0Hd
 pHAJYXSQZIBL8mbYzQFC59iVtLwvbHwLCgjJkw2aYGLyCF+AtQF7qcLxUvcPhU6i68hU
 gYg0UVCo/wSNJrPZJr0TQh3Qlu6UwG2vGdV9uh8q22V2i6+O3tWLV9l7bpszGXrzzovf
 VIxz33W0z2qTWPHNQDb1AMIDAqW+k1i+EyfL6Axy0eeh5oSMXA5T0eMJlGDXB2rPOIHQ
 Q1Kn7C5pwmn/LatVJ9WCYsGLFluu6my88RVOd0QFA5llO69NciKTYbwEpxySXt7ODtRA
 W8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvwP2pq0A69XLEtJRHQeT2K6fCrFL3jZAy9726cRZ/o=;
 b=virrENVYCUeau6HXF7Acaoa/1LVqvzp6HSDTm+pkLoeSFGgtnUjiehBty9PSQm1q7f
 /VPXTZ7nnFIm0CLArG2pttHpB7Jsf6Pav1WamjQdxyvqayVRofHZmUo8KOghzpm7elhe
 12bUlgetkRISYVJOWueTE+6FEDZ5ySRcPp9yRgJzgzABlsy/ZTjOYCiycNQRoIP6gBHK
 hi1fggkEZVd8ipG9eHTaQNtbGGkZW+wW2NxuEnLukEYsG2pWjlfGhWaflTXbh9EKpwe3
 W30+HA7c4fx1eVeOD8vhoRD4+Sxh9hM850R026r+AdcTNbs8aT5bdbhxPn5tqCtVsaXv
 fJMA==
X-Gm-Message-State: AOAM530uKyZSAvCm29DZNkUE6MJCcoaJnzmpCKYIrZsiztYbonx0iiH5
 ZlUnXSKSwx2avVLVXzPySFK4WCfg+wdpMa6Iu144+8TlUCFRHA==
X-Google-Smtp-Source: ABdhPJxvcnLnLL44YJGu9Hx6EDcJ3di6PMIRblKZuakSdFXT0QwOZsAXIX4XpbxJvvDNsWPbd6t+//aY4zx6dFeQpLw=
X-Received: by 2002:a05:6e02:1a4f:: with SMTP id
 u15mr6037825ilv.245.1643800090714; 
 Wed, 02 Feb 2022 03:08:10 -0800 (PST)
MIME-Version: 1.0
References: <00000000000038779505d5d8b372@google.com>
In-Reply-To: <00000000000038779505d5d8b372@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 2 Feb 2022 12:07:59 +0100
Message-ID: <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: linux-riscv@lists.infradead.org, kasan-dev <kasan-dev@googlegroups.com>, 
 palmer@dabbelt.com, alexandre.ghiti@canonical.com
Cc: syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_030817_813335_F48AC0FC 
X-CRM114-Status: GOOD (  18.86  )
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

Hello,

syzbot has already not been able to fuzz its RISC-V instance for 97
days now because the compiled kernel cannot boot. I bisected the issue
to the following commit:

commit 54c5639d8f507ebefa814f574cb6f763033a72a5
Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date:   Fri Oct 29 06:59:27 2021 +0200

    riscv: Fix asan-stack clang build

Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
enabled. In the previous message syzbot mentions
"riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
Binutils for Debian) 2.35.2", but the issue also reproduces finely on
a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
For convenience, I also duplicate the .config file from the bot's
message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d

Can someone with KASAN and RISC-V expertise please take a look?

--
Best Regards,
Aleksandr


On Tue, Jan 18, 2022 at 11:26 AM syzbot
<syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    f6f7fbb89bf8 riscv: dts: sifive unmatched: Link the tmp451..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=1095f85bb00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> dashboard link: https://syzkaller.appspot.com/bug?extid=330a558d94b58f7601be
> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: riscv64
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com
>
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
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000038779505d5d8b372%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
