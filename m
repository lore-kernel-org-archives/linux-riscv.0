Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CC4C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 01:34:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49AB2070B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 01:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bRxhdhVb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="QTyGS9LA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B49AB2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNx6q7gznzYaDtT6z9IOsXx+Yiqi0Po3zrYYv0MwxdA=; b=bRxhdhVbvMQ4HZ
	xIDDLI2+awGQe2Lu0A74ZcsoUDjdPlvPlZpZ2S7cy5TI+H7waRk1Lw29u1Mf1kP+c1Ixq4cf9EeGW
	UdPAUorPpJxEWtR3XywP8+3EKSL5md+QS3tokGQ3dFzTBwXhdPeiXdWNVE5ItQrq/kdZY413wHu2y
	lS3iZujoFzy+di8xWnQ66DvkHaZGTRqr6BWeV0KP/pd4X62pFq0ZPceBfizHOM6kfXMw0w0lA6S9e
	+iaejDk4+a5FsVd4Y1u5UjXbPkSnMSmwH6ts3fudmVBAdiQrrg41ipXy6LfJqSUH3cgbR2awFe0US
	CWPj11o96bIjEWnsSJ3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gggHb-0006QO-Le; Tue, 08 Jan 2019 01:34:19 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gggHY-0006Py-8j
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 01:34:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id x10so2400916wrs.8
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 17:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cViR1ZX4Mkra42PDf2Px6lZo8oDueu076Do4jkk3iHk=;
 b=QTyGS9LA1pcEI+zd1F/AvlK4cwAIs+kZVZkUqlC/Jo6WC0jjl26//04FYWY/0AhcrC
 ZSuApGOSrteLNBzjO9O+GUcFOFmAKVjPlzsrQSSyduEB+NO5lukHkGoZWOONLrcbA5Sw
 tB8aTFfw1K5yR0no7ZuCWIJPd17bo5GmaCE4ebalIpCmFpLHIQXJOPWcSBbtY1UEebZM
 bYifg6FdXLpB8kuVeiGjmg+TpyBjJHZhMun92NtgU9feR6kbaL6mwm0RvgDw3bXfgZDJ
 CqdhK86tt20YRcP8s/Q3/564a31gfs0oOr0AUgI7kTv4Wd5j1R282UDv9y73Ib5dMHhZ
 obpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cViR1ZX4Mkra42PDf2Px6lZo8oDueu076Do4jkk3iHk=;
 b=ieP24TM2tKK71H+0ATY0zKQlBIK0Ldz1yEWsvYKV7P9V85uD6HBcUUf2fxV9DtXjZP
 BFeo0aVLZW+nY/WzIYGvAKOGk+PChN0GmQTlVhBzo0R17bn/HhOCyLuo+GFZsZ4QClYy
 Ok01FNc9Eh9uP0bgcBgBy+G1mYpCHElDH6gJty7WrJZ2Qs9Tv/xMGkYXEawiQBpDGUZt
 W1ntTgmd98OJhy3Scbj4Mz757JkFmOqEuivN8OaKHBnRysba4bR2y+FiiaFNy85yuGRl
 s0dRtgsNnKkOEgIOj3aoiSXB5KrGoUMuUaKbtZLx3Klkcb+U3MqKFeC61o80zNkfTD/T
 wLIQ==
X-Gm-Message-State: AJcUukdT93LXEWhNKKGz5BJfjeuFA/Fyw/mnltVHrFii0sDG6Qd7fFGg
 VGWY/hkYUNnfXtCGnHPa8j6s2nEXHpdx9I4KSjX0kA==
X-Google-Smtp-Source: ALg8bN6yQ0ZoBPt2XDXEvpQ/Z7CY4DwR2BVNp4f9bIxTL1Ccx90pgijQUedu1l/YrN5eTcVsamKQXzIJqL6/i9YSqfg=
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr57543404wrp.59.1546911254199; 
 Mon, 07 Jan 2019 17:34:14 -0800 (PST)
MIME-Version: 1.0
References: <mhng-5924ada7-ba61-4f8b-a7c8-6ad4a36882ed@palmer-si-x1c4>
In-Reply-To: <mhng-5924ada7-ba61-4f8b-a7c8-6ad4a36882ed@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Jan 2019 07:04:02 +0530
Message-ID: <CAAhSdy3jN8U=Aa+=m5bsMv1srnnc3SqyQetEZh-Dy8VEdsODRw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Updates for the 4.21 Merge Window, Part 1
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_173416_379062_896B3AD6 
X-CRM114-Status: GOOD (  17.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 21, 2018 at 10:00 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 7566ec393f4161572ba6f11ad5171fd5d59b0fbd:
>
>   Linux 4.20-rc7 (2018-12-16 15:46:55 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.21-mw1
>
> for you to fetch changes up to 9b9afe4a0ef149db2472f13d6fa3c705d2867c9c:
>
>   RISC-V: Select GENERIC_SCHED_CLOCK for clocksource drivers (2018-12-21 08:17:19 -0800)
>
> ----------------------------------------------------------------
> RISC-V Updates for the 4.21 Merge Window, Part 1
>
> We don't have many patches for this merge window, probably because
> everything has been a bit busy with the holidays and conferences.  The
> only big user-visible change is to move over to an SBI-based earlycon
> instead of our arch-specific early printk support.
>
> The only outstanding patch set I know of is the audit patch set, which
> I've managed to make a mess of and will attempt to clean up.
>
> ----------------------------------------------------------------
> Andrea Parri (1):
>       riscv, atomic: Add #define's for the atomic_{cmp,}xchg_*() variants
>
> Anup Patel (3):
>       RISC-V: defconfig: Enable RISC-V SBI earlycon support
>       RISC-V: Remove EARLY_PRINTK support
>       RISC-V: Select GENERIC_SCHED_CLOCK for clocksource drivers
>
> Atish Patra (1):
>       RISC-V: Fix of_node_* refcount
>
> David Abdurachmanov (1):
>       riscv: remove unused variable in ftrace
>
> Nick Kossifidis (1):
>       RISC-V: Update Kconfig to better handle CMDLINE
>
> Olof Johansson (1):
>       RISC-V: lib: minor asm cleanup
>
> Palmer Dabbelt (1):
>       RISC-V: Move from EARLY_PRINTK to SBI earlycon
>
> Yangtao Li (1):
>       RISC-V: add of_node_put()
>
>  arch/riscv/Kconfig              | 58 +++++++++++++++++++++++-----------------
>  arch/riscv/Kconfig.debug        |  2 --
>  arch/riscv/configs/defconfig    |  1 +
>  arch/riscv/include/asm/atomic.h |  9 +++++++
>  arch/riscv/kernel/cacheinfo.c   | 11 ++++++++
>  arch/riscv/kernel/cpu.c         |  1 +
>  arch/riscv/kernel/cpufeature.c  |  2 ++
>  arch/riscv/kernel/ftrace.c      |  1 -
>  arch/riscv/kernel/perf_event.c  |  1 +
>  arch/riscv/kernel/setup.c       | 28 -------------------
>  arch/riscv/kernel/smpboot.c     |  6 ++++-
>  arch/riscv/kernel/time.c        |  1 +
>  arch/riscv/lib/tishift.S        | 59 ++++++++++++++++++++++-------------------
>  arch/riscv/lib/udivdi3.S        | 42 +++++++++++++++--------------
>  14 files changed, 118 insertions(+), 104 deletions(-)
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Hi Palmar,

Greg wanted SBI earlycon driver patch to go through RISC-V tree
so it should have been part of this PULL request.

Refer, https://patchwork.kernel.org/patch/10711809/

Can you include it your next PULL request?

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
