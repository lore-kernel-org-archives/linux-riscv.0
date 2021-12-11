Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5438CC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Dec 2021 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3P5BSm5EzwyB33FgVu2cCA259Pll27WXE7wiJx9Zrfc=; b=Ip27yr4ee3wfAf
	EHFDdQCQEf7n+yfQ0ZxkZKzeliqnOE2AGNrZGcOVnZwcIjq6jTE3+35kaaZzaKyQIZSBO9/OycT5b
	8sjyW0PAivrV6KE/nZx0605knWCdO1nQLq7CjRcxo+GOkIrvoVk+xHL7NSCU3GLGFv9viCGxew5DH
	pUZbggDq7wh2CRRhcq5c5+5g4NdTxXrbb4NXAR/L+JF/kh2ZXw+oPmCM2jWtLtvYsFqttu6KIVkZw
	ULSSr8Bop0QTEtKsQrjHAeQOHjyjhC8OdA/5CA/r+r9jmlhlhnydK8DfqNhwA5uDhztfyDXLclxWx
	/YQfiW+DE7yAENxdYM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mw0Yq-004w6l-U8; Sat, 11 Dec 2021 11:29:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mw0Yp-004w6f-St
 for linux-riscv@bombadil.infradead.org; Sat, 11 Dec 2021 11:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f4UCyKNSENtw2fzLPkaghq1pfi/HZtXcIyX9sFNA5N4=; b=OHq1I59ebQujJQh7AlcxHA0ObP
 WXzUZvt2EhEGK+2wkcmEWcU3cnGuB7Wh/aY9DYIt2RQclUq7B3/pl6djXvOtLO1EkwQ7bT2Furo1B
 GyN7suL+OERs2sAeaCTr6J4HGFRtiOJ0a4e4wgaPvm+tKN4DSWPicSpTZ4q23LXHFv5RtMJt82Tj8
 eNE56yIn8L/gjBo55FEAe7mdaIGy2YxfiDDHU3UXOK9UKQ1hXPf6MRzix9veAvwAfnAFt+TOcaUBu
 pUDWOlJAb6eXWRGlSB1XG8a30zjDRhInnhLV7gSAsdRBuPo6vfMvAVTuB8LiIhK9cwTnHm0CNPo7C
 AZbsZp6g==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mw0Yn-000il3-94; Sat, 11 Dec 2021 11:29:01 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 1A5FB405D8; Sat, 11 Dec 2021 08:28:59 -0300 (-03)
Date: Sat, 11 Dec 2021 08:28:59 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Darren Hart <dvhart@infradead.org>,
 Alistair Francis <alistair23@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 linux-perf-users@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH v5 1/6] perf bench futex: Add support for 32-bit systems
 with 64-bit time_t
Message-ID: <YbSLe1EWglAc592n@kernel.org>
References: <20211209235857.423773-1-alistair.francis@opensource.wdc.com>
 <YbNX3mRT0A9/N2il@kernel.org> <YbNZw1/cUXJ8up5b@kernel.org>
 <CAK8P3a05D=fb9stZEL6rUMs7c=S6gJxN5gR7HG_i8RiXAbaB5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a05D=fb9stZEL6rUMs7c=S6gJxN5gR7HG_i8RiXAbaB5Q@mail.gmail.com>
X-Url: http://acmel.wordpress.com
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

Em Fri, Dec 10, 2021 at 03:23:42PM +0100, Arnd Bergmann escreveu:
> On Fri, Dec 10, 2021 at 2:44 PM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> > Em Fri, Dec 10, 2021 at 10:36:30AM -0300, Arnaldo Carvalho de Melo escreveu:
> > > Em Fri, Dec 10, 2021 at 09:58:52AM +1000, Alistair Francis escreveu:
> > > > From: Alistair Francis <alistair.francis@wdc.com>

> > > > Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> > > > time_t and as such don't have the SYS_futex syscall. This patch will
> > > > allow us to use the SYS_futex_time64 syscall on those platforms.

> > > > This also converts the futex calls to be y2038 safe (when built for a
> > > > 5.1+ kernel).

> > > > This is a revert of commit ba4026b09d83acf56c040b6933eac7916c27e728
> > > > "Revert "perf bench futex: Add support for 32-bit systems with 64-bit time_t"".

> > > > The original commit was reverted as including linux/time_types.h would
> > > > fail to compile on older kernels. This commit doesn't include
> > > > linux/time_types.h to avoid this issue.

> > >   10     9.99 alpine:3.12                   : FAIL gcc version 9.3.0 (Alpine 9.3.0)
> > >     In file included from bench/futex-hash.c:29:
> > >     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
> > >        37 |  __kernel_old_time_t tv_sec;  /* seconds */
> > >           |  ^~~~~~~~~~~~~~~~~~~
> > >     In file included from bench/futex-wake.c:25:
 
> It looks like we need to add include/uapi/linux/time_types.h to
> tools/include/linux/ and update tools/include/linux/types.h
> in order to address this.

And make sure it is found before the system ones, yes, that would fix
the issues. I'll try to do it these days.

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
