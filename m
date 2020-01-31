Return-Path: <SRS0=YNzb=3U=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CBBC2D0DB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2020 16:32:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B9A214D8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2020 16:32:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z8rnVx/Q";
	dkim=pass (2048-bit key) header.d=carlosedp-com.20150623.gappssmtp.com header.i=@carlosedp-com.20150623.gappssmtp.com header.b="subjQhlo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B9A214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carlosedp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d1Uv3L76nOPfRGL7kXduGaTI/F+ikz8TsPaO8O3HlGs=; b=Z8rnVx/QzvBrM4byzLWgSAsvQ
	sdaZW7Pk+5UMjt5AxXenOwjdgpF7qyLkyB773Ge3rrAdGs9LElCi4wkw8vA+3XhPMYybZCnMRuy0Y
	owyHGsNVC72fLTCyhfW0SNGj8WxXb2gP/C4vJLspMqUG834yboF2IZvC6UPkUcZ3FHsndjIOcu/s+
	+tEn0E07RYejd/OgOM+4m6kWFwu7Jo9s/mf3o2IDkjzAOjrOKlmz5QP6Khy+CsRl3sahND7ijODNS
	aVVX2LLFLvoZpMihxav/a1C/nnhzYL7j6TEf5Wj6HlR+kCxG4SJRJmwg5jsPbapaL7pFw/pI45Qlh
	VNlWWy4OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixZDt-0008AJ-GF; Fri, 31 Jan 2020 16:32:49 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixZDq-00089o-6i
 for linux-riscv@lists.infradead.org; Fri, 31 Jan 2020 16:32:48 +0000
Received: by mail-ot1-x342.google.com with SMTP id g15so7150171otp.3
 for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2020 08:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=carlosedp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d1Uv3L76nOPfRGL7kXduGaTI/F+ikz8TsPaO8O3HlGs=;
 b=subjQhloNO9On5BQRngOFccQDrdDqT74USzDRV+w1i45HN1i9x7TgZBg+pIjjVukxK
 cbGdZ1KKQrLzNjrNvvqNhCkY5vQyBuHNpgfbSjTAv1aNCU1PVSjvF+vv7np0ULSCzpoc
 WulPiXPPzAqBDy8VJNvr+D8pz050l2ErWqOtop6q1VNx6vn5DXwnxbpCVmx7sdGk6TdT
 VNMviFPjqny+A1vJ1hvABHai18yF88tkQlFMYtMRFKoLH6LI5o+51Xh7ZamY543WdLa8
 PCRfscJyL+OuCYXTalrRlF0NX3luqc2PvRuCoS6H2yQ6iLvcmmdzp7J54KP6OQAcdHcS
 mYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1Uv3L76nOPfRGL7kXduGaTI/F+ikz8TsPaO8O3HlGs=;
 b=p+zZ3zqdUPAQUdiOG9zn247kQo8umjuVNCYaYTbn0kx30kSiaCBN2uOyYSU9DFApA+
 r5ye3WVkjIzYcvZQNJU00W3x34wXRaOpJixoE9RAQ5Rin/bj2h15gujG2X+QicBDlLek
 B45qYF220phmPZwSSkdf4XvXcMQo9xhWFRYEgOFLbeh9hQuZgvu6feL9l5YTEib4JaPc
 frIDshGMHC8Lca4WA86qwUv8P9KEDq1tROPssRPk/rNdX7rA/GBQobFFRPP/cABu5mGz
 x4a/Bd9vImt7lKW2Bsn7pt7dgfrB/qAl6jn5UYOnSa16jaP8vj29aItNSiiCRXa65VZ4
 ANqg==
X-Gm-Message-State: APjAAAWjIh1P3Pl+t17Ncnun5LSdI1oAe1xvHObDzEDKRu+xsq6aM6KS
 0B4xzQNmaJByIoI6yMmPHYGmCyH5rZn5sg==
X-Google-Smtp-Source: APXvYqyS9uVt4sBznnbRwuLeBHiuOJGoxAL2mX59QL9b/INiP6XzA+/c3zIvohlB+qejKNsUnJjteQ==
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr7955727otk.159.1580488364554; 
 Fri, 31 Jan 2020 08:32:44 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
 [209.85.167.172])
 by smtp.gmail.com with ESMTPSA id c21sm2746054oiy.11.2020.01.31.08.32.43
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 08:32:43 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id q84so7828605oic.4
 for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2020 08:32:43 -0800 (PST)
X-Received: by 2002:a54:4e8d:: with SMTP id c13mr6915982oiy.27.1580488362824; 
 Fri, 31 Jan 2020 08:32:42 -0800 (PST)
MIME-Version: 1.0
References: <CADnnUqfDnkvCJVqBkDw+gV7_zs5Q_Mb3anQTu+UujjJ8bBk+ng@mail.gmail.com>
 <CAEn-LTrSXHdfp9OPGRSoJCfi8D8Cg8FqS=_-JYpDatAT0X5C0w@mail.gmail.com>
 <CADnnUqciAtweH6KqxvK7Z5ZL-uqOQHujWQBrt+aj2y+31BpuHQ@mail.gmail.com>
In-Reply-To: <CADnnUqciAtweH6KqxvK7Z5ZL-uqOQHujWQBrt+aj2y+31BpuHQ@mail.gmail.com>
From: Carlos Eduardo de Paula <me@carlosedp.com>
Date: Fri, 31 Jan 2020 13:32:31 -0300
X-Gmail-Original-Message-ID: <CADnnUqe1GrqJ5EUQQoPp063bs9SqQkHUSqK_hcWqpkJQcxySTg@mail.gmail.com>
Message-ID: <CADnnUqe1GrqJ5EUQQoPp063bs9SqQkHUSqK_hcWqpkJQcxySTg@mail.gmail.com>
Subject: Re: Errors and segmentation fault while building Golang on Kernel
 after v5.4-rc3
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_083246_387618_A2A15986 
X-CRM114-Status: GOOD (  29.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Joel Sing <joel@sing.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Updating this issue, I've built the same Golang tree (master) on Qemu
using the same kernel Image v5.5.0 I have on Unleashed and it built
successfully:

root@qemuriscv:~/go/src# time ./make.bash
Building Go cmd/dist using /root/go-linux-riscv64-bootstrap. (devel
+a858d15f11 13 hours ago linux/riscv64)
Building Go toolchain1 using /root/go-linux-riscv64-bootstrap.
Building Go bootstrap cmd/go (go_bootstrap) using Go toolchain1.
Building Go toolchain2 using go_bootstrap and Go toolchain1.
Building Go toolchain3 using go_bootstrap and Go toolchain2.
Building packages and commands for linux/riscv64.
---
Installed Go for linux/riscv64 in /root/go
Installed commands in /root/go/bin

real    43m19.946s
user    120m34.147s
sys    66m34.964s
Linux qemuriscv 5.5.0-dirty #3 SMP Fri Jan 31 00:13:59 -02 2020
riscv64 GNU/Linux
root@qemuriscv:~/go/src# ../bin/go version
go version devel +6e592c2 Fri Jan 31 14:46:05 2020 +0000 linux/riscv64


Also tried updating to latest opensbi commit as of today and still
seeing same error on Unleashed.


On Fri, Jan 31, 2020 at 11:20 AM Carlos Eduardo de Paula
<me@carlosedp.com> wrote:
>
> My board is running:
>
> SiFive FSBL:       2018-03-20
> OpenSBI v0.5-44-g049ad0b
> U-Boot 2020.01-dirty (Jan 08 2020 - 18:05:52 -0200)
>
> All build on january 8 using the guide I've wrote here
> (https://github.com/carlosedp/riscv-bringup/tree/master/unleashed)
> after our talks.
>
> Haven't tested newer versions on Qemu, might build it to give a try. I
> have v5.4-rc3 built for Qemu and it works fine.
>
> Carlos
>
> On Fri, Jan 31, 2020 at 10:32 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> >
> > On Fri, Jan 31, 2020 at 2:14 PM Carlos Eduardo de Paula
> > <me@carlosedp.com> wrote:
> > >
> > > Golang has been recently upstreamed and I've been building multiple
> > > versions on my Unleashed board successfully with kernel 5.3-rc4 and
> > > previous.
> > >
> > > I noticed that after I updated my Kernel from v5.3-rc4 to v5.5-rc5,
> > > Golang doesn't build anymore failing on multiple points and
> > > segfaulting as well.
> >
> > Could you also mention what version of OpenSBI you use?
> > Does it also fail on QEMU (avoid 4.2.0) or only on Unleashed?
> >
> > >
> > > I've captured a few logs with the error building here:
> > >
> > > I've bisected the versions between v5.4-rc3 and v5.4 and it pointed
> > > out that the commit below is the starting point.
> > >
> > > eb93685847a9055283d05951c1b205e737f38533 is the first bad commit
> > > commit eb93685847a9055283d05951c1b205e737f38533
> > > Author: Paul Walmsley <paul.walmsley@sifive.com>
> > > Date: Wed Aug 7 19:07:34 2019 -0700
> > >
> > > riscv: fix flush_tlb_range() end address for flush_tlb_page()
> > >
> > > The RISC-V kernel implementation of flush_tlb_page() when CONFIG_SMP
> > > is set is wrong. It passes zero to flush_tlb_range() as the final
> > > address to flush, but it should be at least 'addr'.
> > >
> > > Some other Linux architecture ports use the beginning address to
> > > flush, plus PAGE_SIZE, as the final address to flush. This might
> > > flush slightly more than what's needed, but it seems unlikely that
> > > being more clever would improve anything. So let's just take that
> > > implementation for now.
> > >
> > > While here, convert the macro into a static inline function, primarily
> > > to avoid unintentional multiple evaluations of 'addr'.
> > >
> > > This second version of the patch fixes a coding style issue found by
> > > Christoph Hellwig <hch@lst.de>.
> > >
> > > Reported-by: Andreas Schwab <schwab@suse.de>
> > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > >
> > > :040000 040000 1a4ee20b3614c93de2a925bba2df6f2e1518f227
> > > 6b4ffd3e1a2245912cf734a8a3f61db7eb0ccd67 M arch
> > >
> > > > git bisect visualize
> > > eb93685 N 6 months ago Paul ..riscv: fix flush_tlb_range() end address
> > > for flush_tlb_page() HEAD, refs/bisect/bad
> > >
> > >
> > > > git diff eb93685^!
> > >
> > > ```diff
> > > diff --git a/arch/riscv/include/asm/tlbflush.h
> > > b/arch/riscv/include/asm/tlbflush.h
> > > index 687dd19..4d9bbe8 100644
> > > --- a/arch/riscv/include/asm/tlbflush.h
> > > +++ b/arch/riscv/include/asm/tlbflush.h
> > > @@ -53,10 +53,17 @@ static inline void remote_sfence_vma(struct
> > > cpumask *cmask, unsigned long start,
> > > }
> > >
> > > #define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
> > > -#define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
> > > +
> > > #define flush_tlb_range(vma, start, end) \
> > > remote_sfence_vma(mm_cpumask((vma)->vm_mm), start, (end) - (start))
> > > -#define flush_tlb_mm(mm) \
> > > +
> > > +static inline void flush_tlb_page(struct vm_area_struct *vma,
> > > + unsigned long addr)
> > > +{
> > > + flush_tlb_range(vma, addr, addr + PAGE_SIZE);
> > > +}
> > > +
> > > +#define flush_tlb_mm(mm) \
> > > remote_sfence_vma(mm_cpumask(mm), 0, -1)
> > >
> > > #endif /* CONFIG_SMP */
> > > ```
> > >
> > > I was not able to revert this change from recent v5.5.0 so I don't
> > > know if this is the problem or some close commits:
> > >
> > > > git log 2b245b8b..2f478b60 |grep riscv
> > > 2f478b6 N 6 months ago Linus..Merge tag 'riscv/for-v5.3-rc5' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> > > 69703eb N 6 months ago Vince..riscv: Make __fstate_clean() work correctly.
> > > 8ac71d7 N 6 months ago Vince..riscv: Correct the initialized flow of FP register
> > > eb93685 N 6 months ago Paul ..riscv: fix flush_tlb_range() end address
> > > for flush_tlb_page()
> > >
> > > Carlos
> > > --
> > > ________________________________________
> > > Carlos Eduardo de Paula
> > > me@carlosedp.com
> > > http://carlosedp.com
> > > http://twitter.com/carlosedp
> > > Linkedin
> > > ________________________________________
> > >
> >
>
>
> --
> ________________________________________
> Carlos Eduardo de Paula
> me@carlosedp.com
> http://carlosedp.com
> http://twitter.com/carlosedp
> Linkedin
> ________________________________________



-- 
________________________________________
Carlos Eduardo de Paula
me@carlosedp.com
http://carlosedp.com
http://twitter.com/carlosedp
Linkedin
________________________________________

