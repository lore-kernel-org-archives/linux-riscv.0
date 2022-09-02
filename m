Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1CCC001B5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHRxmX1A5dK2qLPvtpUH1D8+u7Il1E8gSQ4pAgl7xFs=; b=PFhzmtQOxca6vM
	495qEXMXQGE6myEJYf7pNByuD/jYlAXVMlrJq8g3ALpqNx7PApyXB472WNxLUwIZRCUIOtXUE6BoW
	x9dYswsC4oRzspLM7f3SSSNFNMsB3ltIIFc4CHGFMQlqmbi0NFQKRD/2LSdZ9jOI4yATrwq+lgg4t
	2c4UpsjY76PWEnMozuOTKxxnlWByOhuiRfqT5/E/vig+qccXwHBEQ3Jrr9JWx1B05EuK3+rM0ocvD
	ZBTa910/TZ6F98mJigarqs9+3PLBWpR/LVKKHJEqYYv1yJpVZutkqIW4YtnxLjkW0I91lEuXX2TYl
	id5Pvbx4rXmZ0J8q0t0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9oy-007Fjb-HU; Fri, 02 Sep 2022 16:47:08 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9os-007Fgb-Ut
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 16:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=c3C1L8ygkR4POw1lwqktfSTczjSvOPxAtxJRah3i+HI=; b=whVQWd4t2aVki+JXH3XkSZhGtC
	PJo27LgefpRIXaqls1aW0Jiew82P9vuQJpCafjlbH4tIt109jp1wySZ41wIX3CZ85x5Ffn+QaV8vE
	YhEhTSwqNFkL4V+7Q0y+bdeWWBGRl0/4EVyh7clygnaZn+TkEhghJ7uTmodGCd6SX1yaLA11KPmE1
	9qr0aPDm1g9DeQ4a5qEa2193jUa69jXOPfFPJZDVmtTR+bmUhR9afrs2MWtaPOr0RwLlfSuKkZXKi
	dkq8qqUKKqmLgKcnVucnjpeZVUGRtf4b/Yv6OytdYwG3Kcqpnne47unnomP3YMmPrZYApjn6t1251
	cWJhUwBg==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1oU9oo-004uKf-03; Fri, 02 Sep 2022 18:46:58 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1oU9on-00HIPa-1Y;
	Fri, 02 Sep 2022 18:46:57 +0200
Date: Fri, 2 Sep 2022 18:46:57 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Jan Wassenberg <janwas@google.com>, Anup Patel <anup@brainfault.org>,
	Mathieu Malaterre <malat@debian.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jan Newger <jannewger@google.com>
Subject: Re: rdcycle from userland with RISCV_PMU_SBI=y
Message-ID: <YxIzgYP3MujXdqwj@aurel32.net>
References: <YxEhC/mDW1lFt36J@aurel32.net>
 <CAOnJCUJ-E-VyQOyh+psbJP4mDO9F+ShvnxDYjoCUUkH4rddJtw@mail.gmail.com>
 <CAOnJCUKDQfCD7mh-RWrq0E8a3Fmp4Xz348THrS+SmJ71GX8=PA@mail.gmail.com>
 <CA+7wUsww-CGmyNOHJw2bVfcDamq3_XD8mVDJ6pfk0UsxreEjOw@mail.gmail.com>
 <CAAhSdy2RGu9NHg0rOfiGxZYsvvcvtOr-jGWdLVt+iUkpZKgN=w@mail.gmail.com>
 <CAGRC-mj-v6RoGjCNr_TiabgqYX7H9mTXYE9tx6BhCKT5nHD-Aw@mail.gmail.com>
 <CAK9=C2W2tkmyX0x2A7iaNLGoRq4N7L0CwwNacmdtsw6OUdfODQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2W2tkmyX0x2A7iaNLGoRq4N7L0CwwNacmdtsw6OUdfODQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_094703_501966_B8FC199D 
X-CRM114-Status: GOOD (  16.05  )
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

On 2022-09-02 17:34, Anup Patel wrote:
> On Fri, Sep 2, 2022 at 3:52 PM Jan Wassenberg <janwas@google.com> wrote:
> >
> > OK, but even if frequency changes, a cycle counter seems more useful for benchmarking than a low-resolution wall time.
> >
> > FYI it's not just Highway, the Google benchmark library also uses rdcycle.
> 
> Since the RISC-V ecosystem is still evolving, it is best time to fix
> things now rather
> than later.

Fair enough.

> Currently, only "time" CSR is available to user-space and all other performance
> counters should be enabled (or accessed) using Linux perf syscalls.

This is more complex in practice. For a recent kernel, the availability
of the "cycle" CSR depends on the PMU driver being used or compiled in
the kernel. For instance on both QEMU and a Polarfire Icicle board, the
legacy PMU is getting used, so rdcycle is available:

[   34.420435] Legacy PMU implementation is available

In the meantime, I upgraded QEMU and with it OpenSBI, so the SBI PMU is
used instead, and I should also update it on the Polarfire board, but it
is not so easy. Not that for QEMU, the value of scounteren is ignored,
so that rdcycle is still available.

We should make that consistent so that all users see the same behavior.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
