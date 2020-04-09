Return-Path: <SRS0=GXl5=5Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A736C2BA19
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2020 17:51:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C455206F5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2020 17:51:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MkJsLjov";
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="brLMEHKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C455206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zm8DFopuwC2QUaIC0B+S/jPJIiq7sgNNsjYHbSi6B8g=; b=MkJsLjovrmHW165QI8I3ur0P/
	sIQS1ugjhMjcH8TM86VXPHGOTDeST1ALkpbyKrvi+LH7FdwPHKL7rl0tOaZMgL/mOSL6y9z5Xk3zH
	+aepu+ivjbhC3G7PWCMhoMoiwSCDGxhC5O4I3waVDp80+ngREAN5PJJKmxT2ttphkBzrETHrS7OJP
	+1xu0Zgz9YR8XhT51LdUmEEhYb0oo4BpS7yKq8J5sD3+bsPDSVXJSWEf5D2fswV0anBRXBsdltGcr
	PsXOM2h3aQZoSyLpXWi4puJwCuDyADkMxfMBHBTuad5Bn7+g2lk+znYKon/wObjMU1Dw5OJtohqfH
	yXnHO3AQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMbLG-0005Lv-6c; Thu, 09 Apr 2020 17:51:54 +0000
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMbLD-0005L6-52
 for linux-riscv@lists.infradead.org; Thu, 09 Apr 2020 17:51:52 +0000
Received: by mail-lj1-f193.google.com with SMTP id 142so595871ljj.7
 for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2020 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zm8DFopuwC2QUaIC0B+S/jPJIiq7sgNNsjYHbSi6B8g=;
 b=brLMEHKsLxQS/mXRonp0tnS65ifhtX+aGx3P1Zd+nyVvr7TqzJ/j7mDabxm2r9FyZ8
 Iq8pKJNR34gw2pOatRbQZUfC2Xpt5XGXsOAz3RYH+hVfNRIlj9HinhWv0whAVLNa54Cy
 tCgERca2zB20B2lI/kSjpHGDO9Fs8BlGzH2ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zm8DFopuwC2QUaIC0B+S/jPJIiq7sgNNsjYHbSi6B8g=;
 b=quhVMCPNhs3ME+8ThSEC46Rx4H8knSQcczvD+X9EHMjHrOtjFF0O+jmPnnPulXAOsP
 0ud/8Nq3/mVN6R50h7maldl84mgXXsAKwxxQkcM4tSncIjkWYbT9E/aoR3ZoXz4/yc8m
 FawS+I91hRavcGrP6BUmwEfFoK4V+pI2hm1Iwa8BSLg2WmMoN+4QZTI+Zrti595bv5Bp
 Uj5oOq/cvhCbzwPdhGsyCWA6tYc/rnTXiEYydjrOJFUnV0/jgcA9GPkb+HEvoUTuKeTz
 Enn9tyL9AVtjFqudk57IjxzZ4/RE1mpfo906WsthxFvwl7PueGxthw32WV4Nshu6LwrX
 6Q/g==
X-Gm-Message-State: AGi0PubIXUij74v2qp2kI6YuxoCIyaTuWHxdY7/gWLF7l1g5pp7zUvSd
 i4b3BaH+Y09eH2a65TqC74brW0BD6w0=
X-Google-Smtp-Source: APiQypIzae9ND9tBlEavatImbOngu+I4yUq0qVGjlaPTqPrU1GRdaysqExpQcrjSKsK7ENfE2DnNeQ==
X-Received: by 2002:a2e:9b05:: with SMTP id u5mr596367lji.257.1586454703114;
 Thu, 09 Apr 2020 10:51:43 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id z7sm3545809ljc.17.2020.04.09.10.51.42
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 10:51:42 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id m19so273439lfq.13
 for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2020 10:51:42 -0700 (PDT)
X-Received: by 2002:ac2:5ec5:: with SMTP id d5mr291121lfq.142.1586454701653;
 Thu, 09 Apr 2020 10:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-e58ec1f9-86f2-451e-ac9f-9add83693752@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-e58ec1f9-86f2-451e-ac9f-9add83693752@palmerdabbelt-glaptop1>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Apr 2020 10:51:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgay_mPN5R5k7hjnLmHPy9wU7xm681CVw5rYKa7-HHoDw@mail.gmail.com>
Message-ID: <CAHk-=wgay_mPN5R5k7hjnLmHPy9wU7xm681CVw5rYKa7-HHoDw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 5.7 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_105151_192441_5699FDC7 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 8, 2020 at 9:50 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> This builds and boots for me.  There is one merge conflict, it's just a Kconfig
> merge issue.  I can publish a resolved branch if you'd like.

It's not the _resolution_ that's the problem.

The problem is that your tree is garbage.

Your commit c48c4a4c7ead ("riscv: Add Kendryte K210 SoC support") is
wrong. It doesn't do what it says it does. It _also_ adds that
(broken) Kconfig entry for the virtual SoC (aka qemu) that isn't
mentioned at all in the commit message.

It looks like you mixed up commits when you did some development.
Possibly because of bad resolutions when rebasing or whatever.

I don't know what happened, but your tree is a mess.

There's also a duplicate commit 9f40b6e77d2f that is a copy of commit
2191b4f298fa ("RISC-V: Move all address space definition macros to one
place") that you sent earlier.

I fixed things up and pulled this, but you're doing something wrong.

               Linus

