Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A2AC77B7F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CavBx1D05SVZWuEQFxm1rgRQ22bPhLIXsconahk68ec=; b=z+fqfsXpCby2uZ
	obWR6Ka6iwtBFwZhoyOe4tgjC/EsrOixh04GlibuBt/kcfA1kItKrVO891cN/ZHWeM1yFuZr3PQKs
	yDJJQdAJt5Zltb9R+os+IstDvH0jOQvT+snpj3XJL14AeKYI6Z+Xk2iVZ7Gon0f5KNVVqCW8sy5E0
	sbOoiHihWlyff2HYXshVm5ZxKhygiCJBfTAiA3hseD4CmX25u+dQYr1A050I44f+Yy4h/s5VWVkRI
	bfB7wOuX/A2ykUcZKIavVbCKI9rysLldNZAvymQa6EvWXpNSqjm4v3zROw3zeAFnPtG8rH62OQKRp
	EIDK4VU3LByu1Tk5drkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Nd4-001gy4-1B;
	Sat, 20 May 2023 14:32:18 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Ncz-001gxA-1I
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 14:32:17 +0000
X-QQ-mid: bizesmtp66t1684593116t2c0umov
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 May 2023 22:31:54 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: RmDZc/K2LPEPOHsJ1JSKHHcUPDqD0No37nsGY5eqpO6LGzdOd94mh4Wd/weQ4
	cRb1gzcYjFdZnWMwKzupL3vpcbPcf7Z4rUwiCAjk3gZTbFQpkGr+jyC6yLIc97CzZUjax6s
	5kwcGgCFfenBkl6Oc2fxkuBxF+xxfX8QhT8l6XdccQO9wGQLPBMMmeqR1olBaqac7Jzjbhh
	4EzJEtwIzh1blSAYvkTuR1xReUHj5yFNsvcW/KzHnONxV0HeIZkzqMQ8R0YtzANctNba4/v
	/DEtjWi1bITZ7IfaNGFWT/mjEZMWT9oumz6JhzLTemftEGwTBbupnZWwaXdQU+L5Szq4wWn
	Jree7y5SH5J0CUj5Jkv1izDnQnZQvaaoTyTQb744yuZD4yXzR+yUtnkqFxk8Q==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16622545413430521310
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: aou@eecs.berkeley.edu,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulmck@kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: riscv: Fix up compile error for rv32
Date: Sat, 20 May 2023 22:31:54 +0800
Message-Id: <20230520143154.68663-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519094030.GA24947@1wt.eu>
References: <20230519094030.GA24947@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_073213_740102_8F606AF5 
X-CRM114-Status: GOOD (  23.19  )
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

Hi Willy,

> Hi Zhangjin,
> 
> On Fri, May 19, 2023 at 01:00:18AM +0800, Zhangjin Wu wrote:
> ...
>
> > * To let it compile for rv32, we still need to apply one of such actions:
> >     * Revert the kernel commit d4c08b9776b3 ("riscv: Use latest system call ABI"),
> >       but it is not the right direction, that commit has removed all of the time32 syscalls,
> >       and let C lib (e.g. glibc) provide the same C APIs based on the other time64 syscalls
> > 
> >     * If not really use any of the time32 syscalls, defining __ARCH_WANT_TIME32_SYSCALLS
> >       macro will let it compile, but this is buggy for the current implmentations are based
> >       on time32 syscalls!
> > 
> >     * Really implement the C APIs for rv32, based on the time64 syscalls, just like glibc.
> >       This commit c8ce48f06503 ("asm-generic: Make time32 syscall numbers optional") shows
> >       us which functions should be re-implemented.
> > 
> > So, the work todo for rv32 is:
> > 
> > * Rebasing all of the old time32 syscalls based C APIs on the new time64 syscalls,
> >   but they are not simply mapped one by one, glibc is a good reference.
> > 
> > * Add standalone rv32 test support in tools/testing/selftests/nolibc/
> 
> I'm not the right one to judge how to best support rv32 but at least I just
> don't want to go backwards. I'm just having a probably stupid question, but
> how relevant is rv32 ? I mean, all the boards I've seen to date were based
> on rv64 even the smallest embedded ones, so I'm sincerely wondering if there
> exists at all any rv32 devices capable of running Linux. Because if that's
> not the case, maybe we should instead declare that we only support rv64 ?
> If such devices exist however, I'm all for us supporting them well.
>

Firstly, as the commit c8ce48f06503 ("asm-generic: Make time32 syscall
numbers optional") shows:

    We don't want new architectures to even provide the old 32-bit time_t
    based system calls any more, or define the syscall number macros.

So, this is not rv32 specific, more and more architectures are trying to
use the generic unistd.h (include/uapi/asm-generic/unistd.h), but rv32
may be the first new architecture variant who have no time32 syscalls.

Second, I did search some rv32 socs/boards from two companies, they are
bl602/bl616/bl702, esp32-c2/c3/c6, some of them even have 532KB sRAM which is
enough for nolibc-based app + linux kernel, I have gotten 334K rv64 vmlinuz
(+nolibc hello.c) in the tinylinux work for riscv, the future work may be
running linux on such a real rv32 board ;-)

Best regards,
Zhangjin Wu

> Thanks,
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
