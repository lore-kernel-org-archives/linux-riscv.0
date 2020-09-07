Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C209BC433E2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 09:59:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2792B20C09
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 09:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQvuE7Cv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Q9Ew4Z8q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2792B20C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/aJ7W5Uhhf6GmNpaDOe7RdNMdRcotslvyt5zwZmHFzk=; b=cQvuE7CvhTrtHoh7J5dbBzxvA
	H7YaitVjDG7U93Tr7Um4V+3wE0YCNQam9pEGZd+jnEF3tB+lk85YxrvqlpZOh2Am1DsCs08uSylA+
	z6mii2g9HLwFb/ij3ETuV1IkT3AClw7ISZygLN2KW1UdRkDpAmz9IIzlnWX1+I1LRpVwuZ49ZV35s
	MclP32M7XrcSN40MZlqgszvxDkSsTDlJJ+IcDpZbHnMmT9QHE+/HK//eb7oMHno09tAPa2E92qGIv
	+Mw4RpnSytQPJtZPa+maw6P+KwFJWh994Nxi1V0Cl3k+aOdA4joKdQc+GowBlCueZrs7jfrXFxQJJ
	iSvveOSyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFDvk-0006sj-Kt; Mon, 07 Sep 2020 09:59:20 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDvi-0006sL-GO
 for linux-riscv@lists.infradead.org; Mon, 07 Sep 2020 09:59:19 +0000
Received: by mail-wm1-x342.google.com with SMTP id w2so13780181wmi.1
 for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2020 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c5DC9nZOly/sIshwJMs/T2M9xGwEixaZIQAAMhdaTd8=;
 b=Q9Ew4Z8qiML0wcPyFpDAyE5dpHUOzyp540W51+cevWVCR86uUG0WM3UoGPOMrCzrdY
 i/B7wUL9G6iwwXzGVL/bq31OOpMm5DJ4n7oJjbejnbb6QKktJfkHIfpjtO2AEy3gYx4K
 pha94kU99hLIeq4c++tfUtg939fZT2efkzPxuPOHILGi7ci1b8AKeLHuGUwARbudSFpQ
 m4FC4mUwYNIa5u3RD0ksuO6SvW7DrJDrm0MjqM++v+OWPvqQ1TLmyVLX79NCB4kfuMzL
 iUeShqpbB51uBhrAXG2J2zDHW2aECCHGqzgHOaj5hGsnp8D79wCGgDOyp0mQs4NXBuqG
 Qk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c5DC9nZOly/sIshwJMs/T2M9xGwEixaZIQAAMhdaTd8=;
 b=I/hNbMKDCLh8uoGt4B8UAAJQkGwacrm627MeYCQQP5H3MV05AqXTw1xDbQ9gLZf8v/
 Bd+JLYpNN1myjtMLBeL6PbtV3fkoPQHBnXckNU1sclwtDE93WvAhUIT6f53keUdxcBAC
 KObt5DdRvzDA47DYngFF3ELfB9cqXSjXXwDWY1QcBAgejPS4W/TPqviihjcMqYTAJkNK
 0R+rya/lodKhqaaogiNPZ346o2422r4DN8H8YGX7soigeuV/tunKCcERDWnQsDzRXVEJ
 mc1HNSxofkNwh2TMCP/dJQOvAnsnp+XMJAtFavKOnnznXUHSXAyVP65xUf9ghDvpwL4f
 jFxw==
X-Gm-Message-State: AOAM53275Y8aZXjGC+bH5dRGFXXYOMdEKZmFsK+MPfuU9drr4zd0Z3Qy
 7tCbDbnlXWPMw2CNi4W8e+JXh40qSqIP04SpZY4OjA==
X-Google-Smtp-Source: ABdhPJwhbVezkRsz42O01tI11rDfQ+ohnilrUWZNMj/Kyt92DMYI2Orkgg8RVLqJ6axE6DSFZmH263z4x/rqWD9gKAw=
X-Received: by 2002:a1c:234d:: with SMTP id j74mr19248120wmj.157.1599472756116; 
 Mon, 07 Sep 2020 02:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200904165709.GA32667@lst.de>
 <mhng-5249e999-3e82-417d-8d39-dcb4a159bd83@palmerdabbelt-glaptop1>
 <CAAhSdy0HW8Rjyoiu+Ldx31C9zCBdxJZxhDBcXC4sgitfXnPNDg@mail.gmail.com>
 <CAAhSdy3ESD6L_T1rFprDF2jduN8buTz173F6_mYCbTL3s4RG2A@mail.gmail.com>
 <20200907061853.GA19038@lst.de>
In-Reply-To: <20200907061853.GA19038@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Sep 2020 15:29:04 +0530
Message-ID: <CAAhSdy2QkjZXzDBfLpu_Wtn8wWJ+pJSnUiyS+e0e4vtrJ2MWoQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow drivers to provide custom read_cycles64 for
 M-mode kernel
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_055918_645000_DCCEB87E 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 7, 2020 at 11:48 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, Sep 05, 2020 at 11:05:48AM +0530, Anup Patel wrote:
> > Your patch will also break if the SOC specific timer has a 32bit
> > free-running counter
> > unlike the 64bit free-running counter found on CLINT.
> >
> > I guess it's better to let the SOC timer driver provide the
> > method/function to read the
> > free-running counter.
>
> Seriously, build the interfaces once you know the consumers.  Don't
> build pie in the sky interfaces just because you can, because that
> is what creates all the problems.
>
> And of coruse at least for IPIs which absolutely are performance
> criticical we need a standard interface (one that doesn't suck as much
> as the SBI detour with the four extra context switches).  But I guess
> I have already given up on RISC-V because the incompetency about things
> like the irq design are just so horrible that it isn't worth bothering
> any more.

Most of us are aware of these issues. The SBI IPI call will eventually
become fallback option once we have standard mechanism for IPI in
RISC-V privilege spec. Until then we try our best to support all existing
RISC-V systems out there. This also means we end-up supporting
existing SOC specific timers and IPI injection mechanisms.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
