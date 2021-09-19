Return-Path: <SRS0=UXoG=OJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3293DC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Sep 2021 19:14:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4CF860F50
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Sep 2021 19:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4CF860F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31eXzoll+2q2YjGJ4Y77PsfHggugE+sER37qCXW4Vv0=; b=LO98kfq1BBri3j
	9TENPTGmYQmmTd4pjOqamtZgNMcPHHSEWrxB/Ji076EiiNd0722FNed0MwqmA9coVDzREpRvkLKWM
	vmZzrvYbYXfeNrAhFgdX8v5eBV/rgoZbrYg6ulNOY2nZXSCJDr3KUpt77NKjhsimxMEbQxZdxzxCr
	y53keLThW2XXETIV+WBA7aH/qXUek8QLIH1YHI+gqhZ565xaZGlrBbRpnz3FeTd2Q9K/axQ2vtGvU
	yOIUUUqgJZH9ktyuhTOhDI7n90+q5+YkUD035QBIcCagYN/++xZX2gCbtFo0ws+6sBSClKryQUx08
	Vdd0X7CCuKIY+Vx8oXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS2GL-0005fo-VL; Sun, 19 Sep 2021 19:14:05 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS2GJ-0005fN-Mz
 for linux-riscv@lists.infradead.org; Sun, 19 Sep 2021 19:14:05 +0000
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by linux.microsoft.com (Postfix) with ESMTPSA id 377CB20B7179
 for <linux-riscv@lists.infradead.org>; Sun, 19 Sep 2021 12:14:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 377CB20B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1632078841;
 bh=8vDM8D+5m8xPvdc2yp643jfDPpfQqKCVaC1Iss96USQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E++GjQEuD8h86PIj0eFgMLPpGHo+gv/gwOx/P7NfLnQbdgY0bSOUHjJmuVz2mHiR8
 pJrOCSAQkUIbMVEi9FSrp4IFoK4OGDyZfoaOTKb7WUwu7FT5yf7xMeIpTp0A0RjQbo
 VjBgxZQW3vwvDYnyb1hxag48GspctDRc9PPbi1K8=
Received: by mail-pl1-f180.google.com with SMTP id n18so9614273plp.7
 for <linux-riscv@lists.infradead.org>; Sun, 19 Sep 2021 12:14:01 -0700 (PDT)
X-Gm-Message-State: AOAM531hKoviJiDoM0rfl7cT3fhuS6/OnaAStm8ACkdsizokFCYiETYw
 i4CTai/gXbHDjFBkILN05OnrEtRgMcm55t7s7Kg=
X-Google-Smtp-Source: ABdhPJwRxYzolnPsQJGaMuUvcKEJKkThU0IWA7kfqOzABVrfLg+jvZZTXQGJo0AcuHRn8asmnl9VkyPd1aOz75MQLPc=
X-Received: by 2002:a17:90b:3447:: with SMTP id
 lj7mr3531940pjb.112.1632078840771; 
 Sun, 19 Sep 2021 12:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAFnufp0eVejrDJoGE900D2U5-9qi-srVEmPOc9zHC5mSH4DgLg@mail.gmail.com>
 <mhng-22e6331c-16e1-40cc-b431-4990fda46ecf@palmerdabbelt-glaptop>
 <CAJF2gTTJ8M5FpL4=PDnPQgrrPaLxVhsZCTO2rXqaOm6MEn=gnA@mail.gmail.com>
 <9a8137149a164a13a7a04d72b133ad3b@AcuMS.aculab.com>
In-Reply-To: <9a8137149a164a13a7a04d72b133ad3b@AcuMS.aculab.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Sun, 19 Sep 2021 21:13:24 +0200
X-Gmail-Original-Message-ID: <CAFnufp2M_9_TRxoXbRK0bggPXyTgffYnA4moez=uWDNNb=aT8w@mail.gmail.com>
Message-ID: <CAFnufp2M_9_TRxoXbRK0bggPXyTgffYnA4moez=uWDNNb=aT8w@mail.gmail.com>
Subject: Re: [PATCH] riscv: use the generic string routines
To: David Laight <David.Laight@aculab.com>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <Atish.Patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_121403_843628_E60F1EF1 
X-CRM114-Status: GOOD (  21.02  )
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

On Mon, Sep 13, 2021 at 1:35 PM David Laight <David.Laight@aculab.com> wrote:
>
> > > These ended up getting rejected by Linus, so I'm going to hold off on
> > > this for now.  If they're really out of lib/ then I'll take the C
> > > routines in arch/riscv, but either way it's an issue for the next
> > > release.
> > Agree, we should take the C routine in arch/riscv for common
> > implementation. If any vendor what custom implementation they could
> > use the alternative framework in errata for string operations.
>
> I though the asm ones were significantly faster because
> they were less affected by read latency.
>
> (But they were horribly broken for misaligned transfers.)
>

I can get the same exact performance (and a very similar machine code)
in C with this on top of the C memset implementation:

--- a/arch/riscv/lib/string.c
+++ b/arch/riscv/lib/string.c
@@ -112,9 +112,12 @@ EXPORT_SYMBOL(__memmove);
 void *memmove(void *dest, const void *src, size_t count) __weak
__alias(__memmove);
 EXPORT_SYMBOL(memmove);

+#define BATCH 4
+
 void *__memset(void *s, int c, size_t count)
 {
  union types dest = { .as_u8 = s };
+ int i;

  if (count >= MIN_THRESHOLD) {
  unsigned long cu = (unsigned long)c;
@@ -138,8 +141,12 @@ void *__memset(void *s, int c, size_t count)
  }

  /* Copy using the largest size allowed */
- for (; count >= BYTES_LONG; count -= BYTES_LONG)
- *dest.as_ulong++ = cu;
+ for (; count >= BYTES_LONG * BATCH; count -= BYTES_LONG * BATCH) {
+#pragma GCC unroll 4
+     for (i = 0; i < BATCH; i++)
+         dest.as_ulong[i] = cu;
+     dest.as_ulong += BATCH;
+ }
  }

On the BeagleV the memset speed with the different batch size are:

1 (stock): 267 Mb/s
2: 272 Mb/s
4: 276 Mb/s
8: 276 Mb/s

The problem with biggest batch size is that it will fallback to a
single byte copy if the buffers are too small.

Regards,
-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
