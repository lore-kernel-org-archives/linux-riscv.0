Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872B2C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 08:10:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D8C61181
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 08:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31D8C61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YrOa8RnVEpn14vQRXaMyW+mDK/S/lybsIi72kD+4C5U=; b=l/lFCChLo0Hr3Q
	RvnfJVVnEBw4mE88O4WfkrCuMk4tZZz/fg+clSItZht5+AIENo3i+BJycqZbDXZAiddYGWVo9r/RT
	c2K3Nd9G1/oJePadBOYjqzpoxydYj1cqy3ktpxjQpFHd7NiMHrz7IycxMSMOOL7M7FGM+yE81LMUD
	G0q4K9KQc89ntiq9PWYGWYtltz6H9dn13Svs78xVVXmQsYyIlB9AT9EYZE3bN0MaHOpV+w0/SlgzY
	RTXRPppeIPhTK/j5NR7HXat986pLi9Y9PbWe3HseTX3h3yJ+N8xHnjekGXG4OyUgnrj+lFbfCAYdS
	1j/G3V9nrGpB6sY2D5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbIIJ-005si8-Rj; Fri, 15 Oct 2021 08:10:23 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbIDp-005rB6-P9
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 08:05:47 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M734j-1meqzJ3GCF-008ZVQ for <linux-riscv@lists.infradead.org>; Fri, 15
 Oct 2021 10:05:42 +0200
Received: by mail-wr1-f41.google.com with SMTP id k7so24838729wrd.13
 for <linux-riscv@lists.infradead.org>; Fri, 15 Oct 2021 01:05:42 -0700 (PDT)
X-Gm-Message-State: AOAM532epTX/h9I+uV/hV3GEn+WmjwMnLH0VqNV2haMPLVH1kIj0I1rW
 JWhNbYPl9Bb6Ib4/FeVCu2CPYJS9Icfq2412fgw=
X-Google-Smtp-Source: ABdhPJy9sZlQDrqD9m1U2kCsGr+NuqJq9GR+IhadW9NMvzLQSDS60WXLsc5ghfbjxyAdBhF+koA6oF3ct4kqTEH5fY8=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr12221525wrb.336.1634285142440; 
 Fri, 15 Oct 2021 01:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
 <20211015005634.2658470-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211015005634.2658470-2-alistair.francis@opensource.wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 15 Oct 2021 10:05:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2i-4Q8SPwO+3X_FDF_J=dr3cyuRTgF7zxjW4WKxY0tuA@mail.gmail.com>
Message-ID: <CAK8P3a2i-4Q8SPwO+3X_FDF_J=dr3cyuRTgF7zxjW4WKxY0tuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests: futex: Use a 64-bit time_t
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-perf-users@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair23@gmail.com>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
X-Provags-ID: V03:K1:KsizR+IBZPLEdQl/Sk3aX8H5PWI52Di6M81EAxfK02ejzXyVPH6
 3V4McR1R8lJcj4tBOND0UI1vHlVfQRmKEkxOghiahlDd8RuRKRFQxmTFbiZ4eNi+kSJIFcv
 /ZoKB+nnM06EB+dagjSSLIXa0OW3DM4ctfmsYAUG5OJ/DIxx05WoKzf9/Aj4qRQVFHzXi60
 x1T6aKbBlh29Qe/FfdXLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KBhTYzm8Po8=:zOLPen0XFTRbmrKE5DPFo0
 0qLGnhceDPIaDw8c4ja8VRIWLjp0TdTWZbPvZ6zNns9TwUBg3LpOhvwXGAtMrqWYlljbcgWjW
 AGlRi8PIT7k3qtjhCIcx421g9S9X6Rc3cDY9X+1u151/fR/CQ9QeYC76vb4xoKwanfKLqgHFt
 iNEDUN2cEpgDbBlTd+ndAvrabpIEMqcJvrKipF+8RlXeXf2gTJXflMiaEmGf4GIE3DfZPOl65
 9fPvBzboofqkONzhp9H2pVvARouXvaRX4Oa7KGekv44Kbt45PNt40BJtCyrMe1S1uF2EX8egX
 7KeR+fe7MnyHoo3nmQijhZtqfuhAmpiTTQezKkFtL+Kv4zu4bO3j8/+ZtIy7kVNtwRg4j6eNE
 S2U2r5BkppyiIUFF77JBGUwDxGrtzGUKZvJmkq9MvPBxpbQHTg73UkK6uBN2ht03hxFQDQTB5
 uAqhl0eXcUHoTddUUT7kNl7+LbIsvEh670DgMU9XC6vICdGWY66stHVzNvGo/rycT/q6hTzDU
 YiGOSjBcLpFPzK1pvbFkFuxdO/KNBltPx5wMUi6jXM6fHcotHxfBKyAxf5b9q+fmgxPL9LFOQ
 d953bUjXBz+AuzQpWcoH3smTqsZTx6SFjtzUyt2eb8DBtixyDbYfaoYcuBA4hmGCMDP9eQlxR
 KNrVbxXlSun63lvSCwwbFDzQOynfkuyigeO86kfwacjwyDa3bkViTa++aioYc7+K9Gl1CiVOS
 0IlMvmyjhYZozP70qRmaFMu+jYQfbljl1+mJtA6sLuEdqzJ1u+GP1472Zu0KUetP/6WltpPLg
 8fKDL3b7C29DhE6BGNSM5W8zMdAI6eHQZ+sztjxwf1oiDGsXh9b8tNGPwlH2EgGei/gPwtskS
 GdpmJUrD3Vh0gvgG/cbw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_010546_161372_F81486D3 
X-CRM114-Status: GOOD (  14.19  )
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

On Fri, Oct 15, 2021 at 2:56 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Convert the futex selftests to only use a 64-bit time_t. On 64-bit
> architectures this isn't a functional change. On 32-bit architectures
> we now only perform 64-bit time_t syscalls (__NR_futex_time64) and
> use a struct timespec64.
>
> This won't work on kernels before 5.1, but as perf is tied to the kernel
> that's ok.
>
> This allows the tests to run and pass on RISC-V 32-bit.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
