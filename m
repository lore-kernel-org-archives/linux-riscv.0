Return-Path: <SRS0=IMUx=3Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC749C3524A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2020 03:56:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B94922087E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2020 03:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SrnLfbsa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT0Xl9XH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B94922087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0yqEMIluUrrjmoEKC4QG+u4vq77dNX7YZkZLx97oMU=; b=SrnLfbsafgtTLJ
	GIdNfyYzWBo6gn/UUtZ9ABgbyXs7x2jM7YXw9geRh+epNfFr6sIsTnxfwjx65y4mwtnAi2EifS+oa
	eVLC9s1i4GkMLMFvHSrTVW9rwoMnFygAuA24ZhHr+qDKQdEIfn8Uo7NcP28zgZV33T10ODoI2EQ2x
	DraBbV7X9tq7VfAHNyGy6QkAirT+8nqr1BcKqX/bhiZMxIpNNwzzgIUTDHBW8oelHO7FqOOV9dFDs
	oPM6pE3Q3UWv6ELE5Y5Ha7GM00bQGI1k+LQF8dxLE7cn3m6Lb1ISI/tVmzFOHUgatR+/Rn4q/wzx7
	kVYsuH5u+hxwaj2a7gzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iypJl-00036L-Cg; Tue, 04 Feb 2020 03:56:05 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iypJi-000360-2b
 for linux-riscv@lists.infradead.org; Tue, 04 Feb 2020 03:56:03 +0000
Received: by mail-lj1-x242.google.com with SMTP id o15so11416379ljg.6
 for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2020 19:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c0yqEMIluUrrjmoEKC4QG+u4vq77dNX7YZkZLx97oMU=;
 b=nT0Xl9XHC/c5BJ46G4mc/Cmn4HLqzGD2IlP0SYYgsKkF8WJKurSRZcULMMzmGW8Nyq
 OwD6e2r9c9MSQJJ9GrccCEFawYrlP3Roooupjs4bZfOO4Gz6Tw7pRB729hbGWQsqyM6x
 c2hAKM9Q6yMa3fOZ0MEahPI+8UG8eqUGRHNdKJiOycwjLBzeBI5lHepr1FkYquBDShtb
 OiPdzG6cqp7xWKtaJRRpMOs8yGHIq41xFdB5A2V0VRLWcSBV8lsqtXzte6XdOS0zCOiw
 w0ZFbVjzis+v0CvgQsA3rI1YwhfQXofoBYf9RpqTUasS1ZS348jwY8vAqcIZyMXwiuOj
 C7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c0yqEMIluUrrjmoEKC4QG+u4vq77dNX7YZkZLx97oMU=;
 b=YHm90wX/XOGGH4fmpzUGusZ6zEJKeN+UYwuZlqXfFXXfAgRXe5pgTEKkiAyZE2kcyr
 Db19z5KvLmPjIRyfRLOnURP+qbn8qG6W2M5ITsqbPyMaNUrYUNgjEfyW4BmXl5vviKgN
 Rr1q5zQh0Um3UXc0hvAudEQvviga0CnUCi0ROuhruLMYOy7YSzxg4N3OtziaEnUvtpcK
 P1AuwJfz5eysmd0DMxQEPgJpmIpVCz8Gb/vryMArcHYd27bOPADwDOWSj6wMidWOo13g
 YYKDlUjNp+qlq6JHGhpfK+92zSW3xRbizgTdtmSSmumzMjRbQ5bkc+9XrKvi+CWaZRJm
 tgQg==
X-Gm-Message-State: APjAAAXzjk1kU5HCXhVebKX1n13TvBhca7S26kyOoPIwQmhf/W2/gCDQ
 kaJRYZiAV7g5kxYbY6pDEyNLH6EhFAOB1k7IvLI=
X-Google-Smtp-Source: APXvYqzEbkZItix+M5vSHoomqRceIu8S8snZJF7l9a6Rqn/h3zQiqagFMM70phLAYYbnyeNgtIV/sluP3k5xJ9dHas4=
X-Received: by 2002:a2e:918c:: with SMTP id f12mr14620079ljg.66.1580788558319; 
 Mon, 03 Feb 2020 19:55:58 -0800 (PST)
MIME-Version: 1.0
References: <CADnnUqfhxWN=cyyr0QQyKrrO13LuDFS9NTqOLwm10CnwB3sDXA@mail.gmail.com>
 <alpine.DEB.2.21.999.2001300259070.23963@utopia.booyaka.com>
 <CAEn-LToMfm=G80TmGQZefpmKhKvpGy_=XOoBLGU0a_77ahY+_w@mail.gmail.com>
 <20200131201118.GA4121429@aurel32.net>
 <CAAhSdy03C==7PmuXE441BtDJH8H07rOH-u+-_sZJG70tbTrJcA@mail.gmail.com>
 <d868acf5-7242-93dc-0051-f97e64dc4387@ghiti.fr>
 <33c9a276-6212-115c-c7c9-e62244f13c76@european-processor-initiative.eu>
 <CABvJ_xiWDZfO6fOd4Roiy-yaUVFKrGEcBDBSWsvj2TKGGMjy0g@mail.gmail.com>
In-Reply-To: <CABvJ_xiWDZfO6fOd4Roiy-yaUVFKrGEcBDBSWsvj2TKGGMjy0g@mail.gmail.com>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 4 Feb 2020 11:55:47 +0800
Message-ID: <CA+ZOyaj16M5q-g4wZ60MuUs4q1AfCB48wd+AN4TTJNu8K4NZRA@mail.gmail.com>
Subject: Re: Error on loading some network Kernel modules
To: Vincent Chen <vincent.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_195602_144391_E53FDD16 
X-CRM114-Status: GOOD (  20.93  )
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
Cc: Paul Walmsley <paul@pwsan.com>, Alex Ghiti <alex@ghiti.fr>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <anup@brainfault.org>, Carlos Eduardo de Paula <me@carlosedp.com>,
 Romain Dolbeau <romain.dolbeau@european-processor-initiative.eu>,
 Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Vincent Chen <vincent.chen@sifive.com> =E6=96=BC 2020=E5=B9=B42=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Mon, Feb 3, 2020 at 12:27 AM Romain Dolbeau
> <romain.dolbeau@european-processor-initiative.eu> wrote:
> >
> > On 2020-02-01 14:59, Alex Ghiti wrote:
> > > Why restrict to 128M whereas we have 2GB offset available to the end =
of
> > > the kernel ?
> >
> > Isn't that 2 GiB offset to whatever the module requires in the kernel,
> > rather than to the end of the kernel space?
> >
> > Is there some guarantee that symbols accessible by modules are at the
> > end of the kernel? If so, wouldn't the maximum offset for this patch
> > still be (2 GiB - <total size of accessible symbols>)?
> >
> > Cordially,
> >
> > --
> > Romain Dolbeau
>
> It took me some time to find the root cause of this problem, please
> allow me to share some observations before the discussion.
> The root cause of this issue is that the percpu data is declared as a
> static variable. The "static" attribute will make the compiler think
> that this symbol is close to the .text section at runtime. Hence, the
> compiler uses "auipc" to access this percpu data instead of using GOT.
> In this case,  the access range is limited to + -2G. However, in
> practice, these percpu data are placed at a pre-allocated region
> created by the memblock_allocate() function. In other words, the
> distance between the pre-allocated region (>PAGE_OFFSET ) and the
> .text section of the kernel module (in VMALLOC region) is much larger
> than 2G.
> I agree that the original patch,
> https://github.com/bjoto/linux/commit/8a56d1c8e8e91c1bc3893946d52b9217c96=
e1589,
> can solve most cases. However, I do not think the patch still works if
> the kernel module region is determined by _end or <total size of
> accessible symbols>. The reason is that the pre-allocated region for
> module percpu data comes from the memblock function at runtime. Hence,
> we cannot know the actual address of this region at compile-time, and
> this issue probably may occur again in this case.
>
> By the way, I think maybe we can refer to the implementation of MIPS.
> 1. For general cases, we can use this patch to solve this issue.
> 2. For a large kernel image (>2G) or enabling the KASLR feature, we
> may need a new code mode to deal with this issue.
>

The range [&_end - 2G, VMALLOC_END] won't be suitable when KASLR is
enabled. Unless we limit the randomized range in small area, the
module region start address will be bigger than VMALLOC_END. So if we
divide a region into module use, we also have to provide module
randomization at the same time when KASLR is enabled. It good to me if
there is a new code model to use GOT for static variable, everything
will be easy.

