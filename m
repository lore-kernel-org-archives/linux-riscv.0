Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEA8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlpVX6xHCknmrDWHaEblWDtqZ4c8uCwTuB7eBLt5wLs=; b=KWefon3XfxEykn
	vAfFArbBumxNhTc7kipBzhwzr6hHI7DvkedCwUg7QodpArr7vDtOFXzUSTQ9W4/xlDBG9ljPezTr9
	E6EZXg/GHwG6rnBOND4GTh7Wm7s4tBw0RhyDPKHdPgkpHI6xDUjzTshxya8BGInj/bUalZ6aK4C02
	Hy/hUVdm3IvfDiNkBqdheQVyjCElqF8RS9B8MlVFQLLgvgFRXkuO/mpHOFChZq+p5sMPpFDCdw1ls
	Q23yp3KCSMCAkZukSSU79fKTvmqwIw/RyNSB2s6nSUC7iCNCzOin8YNbht8ECYjclIiR92mZfzHpN
	01cdSmih+rxORdEnGGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEX7W-009XR2-Ev; Mon, 31 Jan 2022 13:53:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEX7I-009XMo-Ig; Mon, 31 Jan 2022 13:53:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB52D612D9;
 Mon, 31 Jan 2022 13:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA1AC340F7;
 Mon, 31 Jan 2022 13:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643637190;
 bh=ubnmPmWzE8WZHK6ZDIgiYDZ8V5Auo9sjXu6gY0DackM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tE6Azk07ef7p3PyY9nPWsvB4UG0ym7aIa7c0/Aq4ps9A01ne0MZvdOrWsFqal0AiU
 0P7V4TI/ZhF33PhVXme354y8saJj86gikF7RnUZvdvua8uDRQHsud7M0acourjCUn9
 zdR16D1WrF68aNJlsNa9P3qBuqWtesfv8rw5IF2hNE5wWlmhVz2+xC6JL/7OFxTrUu
 iYRe6d4g7Gbq/Qos37N0Q1pmKEbdxburfCFLWH+4ZWaTzMUR00B3+zFQtir0xTCFaf
 b1l+X6y8wEge0g7mMXhya3HjmyH2u/XnQNDpSggCfTYPXq4wmSCGpISV7WE9u1iTrZ
 WZsj7ejW6v9Gw==
Received: by mail-vs1-f44.google.com with SMTP id x13so11866296vsl.10;
 Mon, 31 Jan 2022 05:53:10 -0800 (PST)
X-Gm-Message-State: AOAM531fmvGE1iBuUUE1VOiawKosja1vsw1qnsFnWw1K4TD2dAIYSmJL
 eBQVqJPwsAh8XiYglDAxo9wpmJjXzUIl5Kp5Pwo=
X-Google-Smtp-Source: ABdhPJwJr063nx9nXXC4e7XbyWpioW1G/tD5r4ayyBqg50Z49dU59MzIv8eNccq661nAVS/wEBLJ08MiD/T+S+t5NT0=
X-Received: by 2002:a67:e947:: with SMTP id p7mr7925194vso.59.1643637189058;
 Mon, 31 Jan 2022 05:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-4-guoren@kernel.org>
 <YffURrqD0pfXnEkV@infradead.org>
In-Reply-To: <YffURrqD0pfXnEkV@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 Jan 2022 21:52:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSQafQxzAyaD90n-O6pPo22RCDXdsrOn=csUJBur0u-Ew@mail.gmail.com>
Message-ID: <CAJF2gTSQafQxzAyaD90n-O6pPo22RCDXdsrOn=csUJBur0u-Ew@mail.gmail.com>
Subject: Re: [PATCH V4 03/17] asm-generic: compat: Cleanup duplicate
 definitions
To: Christoph Hellwig <hch@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_055312_686585_2E7F443A 
X-CRM114-Status: GOOD (  14.98  )
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

On Mon, Jan 31, 2022 at 8:21 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Jan 29, 2022 at 08:17:14PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > There are 7 64bit architectures that support Linux COMPAT mode to
> > run 32bit applications. A lot of definitions are duplicate:
> >  - COMPAT_USER_HZ
> >  - COMPAT_RLIM_INFINITY
> >  - COMPAT_OFF_T_MAX
> >  - __compat_uid_t, __compat_uid_t
> >  - compat_dev_t
> >  - compat_ipc_pid_t
> >  - struct compat_flock
> >  - struct compat_flock64
> >  - struct compat_statfs
> >  - struct compat_ipc64_perm, compat_semid64_ds,
> >         compat_msqid64_ds, compat_shmid64_ds
> >
> > Cleanup duplicate definitions and merge them into asm-generic.
>
> The flock part seems to clash with the general compat_flock
> consolidation.  Otherwise this looks like a good idea.
Okay, In the next version, I would rebase on general compat_flock
consolidation v4.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
