Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B461C11F66
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 00:30:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D602061467
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 00:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D602061467
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CO2YiFN4Z2pzzr2qeOATHgyjcVVNrhmZCWPMN4o/bUI=; b=oFCaCluzmRb5Ck
	OodP07p1N2ciaaWFtxX/h4PH07gdF4UxgA05/x8nmz0DibpD1ZqETjX5EwyBOO37PXRW1XonLcWLw
	AWGyf/dT5Gw+gWNrPkXM0k1P8fr5OgVyk0fBKMBJGjhaEKC7C7Nfw9ciAgH9HhH5RC8PoVZg2mu5D
	2A54xBswlTbmu3woy3zqRth2kSkflJOH+S01+CHbRTeQEFiWNqg2mIFUp9gKJU3lRRASnvo7DpCD5
	1ddM5hfgAhBtx1gi7tLOsyUhX/cawbSPR4V7OB+Rd1oewmQ0T4YKq/n7l94R+mCCrVUmbbnqoYkXj
	iRQaKG9mumUtV/3efRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lykao-00FfvR-8p; Thu, 01 Jul 2021 00:30:10 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lykak-00Fftm-24
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 00:30:08 +0000
Received: by mail-ej1-f41.google.com with SMTP id hr1so3933491ejc.1
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 17:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Obt/WpmgjleJIeQYUF0es+scX4GBTb/kCyHMNh/3ZGg=;
 b=BXIc5IatEUT7Ue6fpxdTM9LPx6xBsC9aEP13+p81t8lzhcl2qcl96lLr2VdpY8AW9b
 tHkDo9MKDWUNmHzJG+FaQWsPBb4JmnCN8rROElJuzU5vACU+MvRW3o4WqZcpEPqLvBdM
 XZga00gxxbyHbCv9I2jw1QCqxCz6YqL7CXy0LzCM0XshdilksoUuHTNJI46ItoO91rcf
 KCL0a8pyJZ6RWo5gc49tdX5tll0erzZgF2RsI7MxPZDVTJFp+mR1BivelPtE4WJnn5SM
 Bq0W5MItpnaFAzXujEUir9rFMyQxmJns1+ecMYWyelU182/QNC1qteUudDBZ/XBM7xEP
 Xuig==
X-Gm-Message-State: AOAM530SzsdeLgziRll/HdN8C+kiSmyCAE/vBSi5OclXMY27aXwO6Jyt
 WGbKfEHqW6koeIqPqk86MkY=
X-Google-Smtp-Source: ABdhPJwB8l13zZz2CxDpDKkqQDE+D/K80MBx+6+9m9qUWHsw3xGbCpGiZcKhom5H9EMWso3fj79uRw==
X-Received: by 2002:a17:906:b30f:: with SMTP id
 n15mr38576990ejz.552.1625099403407; 
 Wed, 30 Jun 2021 17:30:03 -0700 (PDT)
Received: from localhost (host-80-182-89-242.pool80182.interbusiness.it.
 [80.182.89.242])
 by smtp.gmail.com with ESMTPSA id co21sm207995edb.24.2021.06.30.17.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 17:30:02 -0700 (PDT)
Date: Thu, 1 Jul 2021 02:29:55 +0200
From: Matteo Croce <mcroce@linux.microsoft.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick
 Kossifidis <mick@ics.forth.gr>, Guo Ren <guoren@kernel.org>, Christoph
 Hellwig <hch@infradead.org>, David Laight <David.Laight@aculab.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, Drew
 Fustini <drew@beagleboard.org>, linux-arch <linux-arch@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 0/3] lib/string: optimized mem* functions
Message-ID: <20210701022955.61ecb657@linux.microsoft.com>
In-Reply-To: <CAFnufp160uvpqNowZpDdOY4bSN1NJ5j81nYcX=9+rW9WZHfXcQ@mail.gmail.com>
References: <20210625010200.362755-1-mcroce@linux.microsoft.com>
 <CAKwvOd=rzoCFtUPrB+Hh8ZneGJwKc_2jW=QN6apb4T033r+kYg@mail.gmail.com>
 <CAFnufp160uvpqNowZpDdOY4bSN1NJ5j81nYcX=9+rW9WZHfXcQ@mail.gmail.com>
Organization: Microsoft
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_173006_172705_697B14ED 
X-CRM114-Status: GOOD (  34.20  )
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

On Sun, 27 Jun 2021 02:19:59 +0200
Matteo Croce <mcroce@linux.microsoft.com> wrote:

> On Fri, Jun 25, 2021 at 7:45 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Jun 24, 2021 at 6:02 PM Matteo Croce
> > <mcroce@linux.microsoft.com> wrote:
> > >
> > > From: Matteo Croce <mcroce@microsoft.com>
> > >
> > > Rewrite the generic mem{cpy,move,set} so that memory is accessed
> > > with the widest size possible, but without doing unaligned
> > > accesses.
> > >
> > > This was originally posted as C string functions for RISC-V[1],
> > > but as there was no specific RISC-V code, it was proposed for the
> > > generic lib/string.c implementation.
> > >
> > > Tested on RISC-V and on x86_64 by undefining
> > > __HAVE_ARCH_MEM{CPY,SET,MOVE} and HAVE_EFFICIENT_UNALIGNED_ACCESS.
> > >
> > > Further testing on big endian machines will be appreciated, as I
> > > don't have such hardware at the moment.
> >
> > Hi Matteo,
> > Neat patches.  Do you have you any benchmark data showing the
> > claimed improvements? Is it worthwhile to define these only when
> > CC_OPTIMIZE_FOR_PERFORMANCE/CC_OPTIMIZE_FOR_PERFORMANCE_O3 are
> > defined, not CC_OPTIMIZE_FOR_SIZE? I'd be curious to know the delta
> > in ST_SIZE of these functions otherwise.
> >
> 
> I compared the current versions with the new one with bloat-o-meter,
> the kernel grows by ~400 bytes on x86_64 and RISC-V
> 
> x86_64
> 
> $ scripts/bloat-o-meter vmlinux.orig vmlinux
> add/remove: 0/0 grow/shrink: 4/1 up/down: 427/-6 (421)
> Function                                     old     new   delta
> memcpy                                        29     351    +322
> memset                                        29     117     +88
> strlcat                                       68      78     +10
> strlcpy                                       50      57      +7
> memmove                                       56      50      -6
> Total: Before=8556964, After=8557385, chg +0.00%
> 
> RISC-V
> 
> $ scripts/bloat-o-meter vmlinux.orig vmlinux
> add/remove: 0/0 grow/shrink: 4/2 up/down: 432/-36 (396)
> Function                                     old     new   delta
> memcpy                                        36     324    +288
> memset                                        32     148    +116
> strlcpy                                      116     132     +16
> strscpy_pad                                   84      96     +12
> strlcat                                      176     164     -12
> memmove                                       76      52     -24
> Total: Before=1225371, After=1225767, chg +0.03%
> 
> I will post benchmarks made on a RISC-V machine which can't handle
> unaligned accesses, and it will be the first user of the new
> functions.
> 
> > For big endian, you ought to be able to boot test in QEMU.  I think
> > you'd find out pretty quickly if any of the above had issues.
> > (Enabling KASAN is probably also a good idea for a test, too). Check
> > out
> > https://github.com/ClangBuiltLinux/boot-utils
> > for ready made images and scripts for launching various
> > architectures and endiannesses.
> >
> 
> Will do!
> 

I finally made the benchmarks on RISC-V.

The current byte-at-time memcpy() always copy 74 Mbyte/sec, no matter
the alignment of the buffers, while my implementation do 114 Mb/s on
two aligned buffers and 107 Mb/s when need to shift and merge words.

For memset(), the current byte-at-time implementation always writes 140
Mb/s, my word-wise implementation always copies 241 Mb/s. Both
implementations have the same performance with aligned and unaligned
buffers.

The memcpy() test is a simple loop which calls memcpy with different
offsets on a 32MB buffer:

#define NUM_PAGES	(1 << (MAX_ORDER + 2))
#define PG_SIZE		(PAGE_SIZE * NUM_PAGES)


	page1 = alloc_contig_pages(NUM_PAGES, GFP_KERNEL, NUMA_NO_NODE, 0);
	page2 = alloc_contig_pages(NUM_PAGES, GFP_KERNEL, NUMA_NO_NODE, 0);

	src = page_to_virt(page1);
	dst = page_to_virt(page2);

	for (i = 0; i < sizeof(void*); i++) {
		for (j = 0; j < sizeof(void*); j++) {
			t0 = ktime_get();
			memcpy(dst + i, src + j, PG_SIZE - max(i, j));
			t1 = ktime_get();
			printk("Strings selftest: memcpy(dst+%d, src+%d), distance %lu: %llu Mb/s\n",
			       i, j, (j - i) % sizeof(long),
			       PG_SIZE * (1000000000l / 1048576l) / (t1-t0));
		}
		printk("\n");
	}

Similarly, the memset() one:

	page = alloc_contig_pages(NUM_PAGES, GFP_KERNEL, NUMA_NO_NODE, 0);
	dst = page_to_virt(page);

	for (i = 0; i < sizeof(void*); i++) {
		t0 = ktime_get();
		memset(dst + i, 0, PG_SIZE - i);
		t1 = ktime_get();
		printk("Strings selftest: memset(dst+%d): %llu Mb/s\n",
		       i, PG_SIZE * (1000000000l / 1048576l) / (t1-t0));
	}

The results for the current one are:

[   27.893931] Strings selftest: memcpy testing with size: 32 Mb
[   28.315272] Strings selftest: memcpy(dst+0, src+0), distance 0: 75 Mb/s
[   28.736485] Strings selftest: memcpy(dst+0, src+1), distance 1: 75 Mb/s
[   29.156826] Strings selftest: memcpy(dst+0, src+2), distance 2: 76 Mb/s
[   29.576199] Strings selftest: memcpy(dst+0, src+3), distance 3: 76 Mb/s
[   29.994360] Strings selftest: memcpy(dst+0, src+4), distance 4: 76 Mb/s
[   30.411766] Strings selftest: memcpy(dst+0, src+5), distance 5: 76 Mb/s
[   30.828124] Strings selftest: memcpy(dst+0, src+6), distance 6: 76 Mb/s
[   31.243514] Strings selftest: memcpy(dst+0, src+7), distance 7: 76 Mb/s

[...]

[   52.077251] Strings selftest: memcpy(dst+7, src+0), distance 1: 74 Mb/s
[   52.508115] Strings selftest: memcpy(dst+7, src+1), distance 2: 74 Mb/s
[   52.939309] Strings selftest: memcpy(dst+7, src+2), distance 3: 74 Mb/s
[   53.370493] Strings selftest: memcpy(dst+7, src+3), distance 4: 74 Mb/s
[   53.801865] Strings selftest: memcpy(dst+7, src+4), distance 5: 74 Mb/s
[   54.233287] Strings selftest: memcpy(dst+7, src+5), distance 6: 74 Mb/s
[   54.664990] Strings selftest: memcpy(dst+7, src+6), distance 7: 74 Mb/s
[   55.086996] Strings selftest: memcpy(dst+7, src+7), distance 0: 75 Mb/s

[   55.109680] Strings selftest: memset testing with size: 32 Mb
[   55.337873] Strings selftest: memset(dst+0): 140 Mb/s
[   55.565905] Strings selftest: memset(dst+1): 140 Mb/s
[   55.793987] Strings selftest: memset(dst+2): 140 Mb/s
[   56.022140] Strings selftest: memset(dst+3): 140 Mb/s
[   56.250259] Strings selftest: memset(dst+4): 140 Mb/s
[   56.478283] Strings selftest: memset(dst+5): 140 Mb/s
[   56.706296] Strings selftest: memset(dst+6): 140 Mb/s
[   56.934335] Strings selftest: memset(dst+7): 140 Mb/s

While for the proposed one:

[   38.843970] Strings selftest: memcpy testing with size: 32 Mb
[   39.124047] Strings selftest: memcpy(dst+0, src+0), distance 0: 114 Mb/s
[   39.421848] Strings selftest: memcpy(dst+0, src+1), distance 1: 107 Mb/s
[   39.719613] Strings selftest: memcpy(dst+0, src+2), distance 2: 107 Mb/s
[   40.017310] Strings selftest: memcpy(dst+0, src+3), distance 3: 107 Mb/s
[   40.314939] Strings selftest: memcpy(dst+0, src+4), distance 4: 107 Mb/s
[   40.612485] Strings selftest: memcpy(dst+0, src+5), distance 5: 107 Mb/s
[   40.910054] Strings selftest: memcpy(dst+0, src+6), distance 6: 107 Mb/s
[   41.207577] Strings selftest: memcpy(dst+0, src+7), distance 7: 107 Mb/s

[...]

[   55.682517] Strings selftest: memcpy(dst+7, src+0), distance 1: 107 Mb/s
[   55.980262] Strings selftest: memcpy(dst+7, src+1), distance 2: 107 Mb/s
[   56.277862] Strings selftest: memcpy(dst+7, src+2), distance 3: 107 Mb/s
[   56.575514] Strings selftest: memcpy(dst+7, src+3), distance 4: 107 Mb/s
[   56.873142] Strings selftest: memcpy(dst+7, src+4), distance 5: 107 Mb/s
[   57.170840] Strings selftest: memcpy(dst+7, src+5), distance 6: 107 Mb/s
[   57.468553] Strings selftest: memcpy(dst+7, src+6), distance 7: 107 Mb/s
[   57.748231] Strings selftest: memcpy(dst+7, src+7), distance 0: 114 Mb/s

[   57.772721] Strings selftest: memset testing with size: 32 Mb
[   57.905358] Strings selftest: memset(dst+0): 241 Mb/s
[   58.037974] Strings selftest: memset(dst+1): 241 Mb/s
[   58.170619] Strings selftest: memset(dst+2): 241 Mb/s
[   58.303228] Strings selftest: memset(dst+3): 241 Mb/s
[   58.435808] Strings selftest: memset(dst+4): 241 Mb/s
[   58.568373] Strings selftest: memset(dst+5): 241 Mb/s
[   58.700968] Strings selftest: memset(dst+6): 241 Mb/s
[   58.833499] Strings selftest: memset(dst+7): 241 Mb/s

Anyway, I have to submit a v2 because the current one fails to build on
compilers which can't understand that byte_long is constant:

lib/string.c:52:39: error: initializer element is not constant
 static const unsigned int word_mask = bytes_long - 1;
                                       ^~~~~~~~~~

Regards,
-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
