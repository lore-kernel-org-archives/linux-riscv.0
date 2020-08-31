Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC0AC433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:14:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121872072D
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s3PY66Jw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QUXLlaMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 121872072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6bf3Rf+k26JT/mHkYrI8nxkQRmAyVnXiq/1vQtdILNI=; b=s3PY66JwMBjM3hUm/K64SZySb
	BbO0Yx+Nt4LTgaqFBvXRAHIXkr4BbSt7oY/NBe7TH8jw+D6eY7IrbL9QS74tG9n671ummgGnAL65Y
	bABZvM6GJCD5L6phNN+EMbx8YCigKd6FgCC16O8aM5efE1JlwOVbN2lH2hUTuD4XE+m0fpf0XnJXC
	ej3tZcfHIRAqgAbLb1S2vLmGgeydav1qw6b103HhzJCqz7doox2gFPgGRdCsxaYA2MzowhQjW2qAY
	k8pPhvDagYq8Abe/Bmm12euZzjPk4hR0MrtjtDXcBXqnrItja29vHLxtileOJpaBodR37lt6YW5Fa
	KANOmmpVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCe12-0007A6-Ci; Mon, 31 Aug 2020 07:14:08 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCe0z-000799-5w
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 07:14:06 +0000
Received: by mail-ot1-x343.google.com with SMTP id n23so4473972otq.11
 for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2020 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgZs/VQ839tlF6XpObbQqftfbwRMB7KiDGtBHT54oHg=;
 b=QUXLlaMc9s08DIBhu191N5Ae8DUOsNN8mICoLuHBPp3oYNEoAyLVx1gXf+f+wA9ed7
 UDs7As+bafJ+GUkrnwRBLQeHU5QJWVw4ri3qFdqx4YdTjgYINeC2s1+k+0ooA7BgAcBK
 ghzbXDB/94LMiSb5tWXUtPEIxuTFQF+af1ZILYaNHTxmoSUNQR4G4/Q7kzp/jat1tKYW
 C7gupKoqYuu0U4WAwb9+W/bbaSCRjU+CjGl9al+2ECglSXTJWY3I0Vs07daizg7hBuh0
 EH3fN0V7JXGZ1cTLgDfedRS0vY/+JlMJ4VnJycreqVckM8W1kMJ2pJ5gSQJgx9yXxCTc
 XkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgZs/VQ839tlF6XpObbQqftfbwRMB7KiDGtBHT54oHg=;
 b=N8fcPe0x+P/kWlPVdaYxa1OXJhz9vmBcOK6XTXl7qmESr+q9WZwx2WhKKMKakzuAOI
 m75vkzhh0towwVoIUnaTAZiv2pyj+nRlmjdhCdE2AiMAgqd0RxQEwck++WhIRp+qVU3d
 fXWpir8JFNijwK4+xLhzFaHbqKXohMGYvbKefjAcYuR+XN0L2uEuv0NMsPaZj2adlMt/
 hD/QTAMOSvmJfx7/S7znA7kOxWqce25yV4s0prAdDBTQhg4FqFYmP//WWsA1tMX4Ss9d
 TRstXvs03eFM7yB5enyzyZJ5Le5zJ1edYpyuCWVYavueLID/lzm+Df9mjw1c8GLQmmJ0
 0GPA==
X-Gm-Message-State: AOAM531brc97sqqVd2Pvq4P/80AHXtLX97xTmpisxp6JLn38cIj4pEck
 Zlc3RINLKf/pGQKG84Cb0n5jGU4/vWUVdRK0sxFnvw==
X-Google-Smtp-Source: ABdhPJzVUckTNcf+6/d/nfahPDWR6MmytqqhwXTbzxbat1nN6EGh4BMb6quz/swi6Zscp+w9ambqJD/4E9JkJmeWaTc=
X-Received: by 2002:a9d:522:: with SMTP id 31mr188244otw.33.1598858043090;
 Mon, 31 Aug 2020 00:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598598459.git.zong.li@sifive.com>
 <3f1f693147f0b62f19f4a44b8e8ef3d5bde23352.1598598459.git.zong.li@sifive.com>
 <CAOJsxLHOvvt8WGQUynGkLxZCA4OQQ+KgxxJJD7s_iP8Pxf-Omg@mail.gmail.com>
 <CANXhq0r2jg_fVZJE0shquGc25QNgenL+Qq6HRUBXEYPSf=QcFQ@mail.gmail.com>
 <CAOJsxLF_+0eg6zU=CFwnN+pc75jF4aqvUqog5z18wfG4WOKoDQ@mail.gmail.com>
In-Reply-To: <CAOJsxLF_+0eg6zU=CFwnN+pc75jF4aqvUqog5z18wfG4WOKoDQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 31 Aug 2020 15:13:52 +0800
Message-ID: <CANXhq0pEEaHirF6N7J7KDcnrqyyp0pZR75uxqSs0UN7tvosz8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: Set more data to cacheinfo
To: Pekka Enberg <penberg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_031405_535810_CB6D1BF2 
X-CRM114-Status: GOOD (  13.90  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 31, 2020 at 3:00 PM Pekka Enberg <penberg@gmail.com> wrote:
>
> Hi,
>
> On Mon, Aug 31, 2020 at 9:15 AM Zong Li <zong.li@sifive.com> wrote:
> > If the sets is one, it means that the cache is fully associative, then
> > we don't need to fill the ways number, just keep way number as zero,
> > so here we want to find the fully associative case first and make the
> > if expression fail at the beginning. We might also rewrite it as
> > follow:
>
> [snip]
>
> Thanks for the explanation! The rewritten version is much easier to
> read, at least to me.
>

Let me change it for readability in the next version, thanks.

> - Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
