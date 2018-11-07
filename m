Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28E7C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 21:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F0120892
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 21:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q8Gm/xcC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RTjQjtLB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92F0120892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSPzQ77ScLgMitOo17KtCHKdrFFsxcnR/Zbs5q6hrAw=; b=Q8Gm/xcC+nEiFS
	HIviLZL5XfQULIPY7NkeYRwnP9UFRPIgc4Dg+rf48v2TCuZg7b5KJKYsBWUDebPJ2pQief/oDr/Y9
	txxhAl434KZY9eSnGwr5W+7Wz1mkPMCVIn2xDw0S9+qdvYYxpGRWMecgGJ889GtYv9wTHd+8c8jS2
	fbyFAQpAV9jQxStc98aGa8bjp+G6zHSfPbYgxstoRAoJLvdE8uOtlixPVQdIR3RsfWiGR16BN9r/t
	whv2YCpWsU5XOZgFZgTFUl5iYzq7aVM55YG/OpuOrdBTEycpgLuH77SbG+cglvj7sKpkNY606Kx+T
	uqXlaHl19MbQHFrp0WSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKV5c-0007BT-Fg; Wed, 07 Nov 2018 21:10:16 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKV5a-0007BK-Q3
 for linux-riscv@bombadil.infradead.org; Wed, 07 Nov 2018 21:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/354RJktfWO3Xv0X4oRS/MwprSK52O+Iss7VIFmrPCA=; b=RTjQjtLBxWkmrJjzu+1FFsIt7
 WIe8Z7HtmY2DdU9RKQfB99qedo6ezz6FYHBB7IGVk+1Lrp4FMlXfIde7Ujek/9vc4flWQRqmTZFu5
 WG+11ukBtdfSlEPTLSvjJ/LZd3XdXxpDcX3Qmk4DpXea0+vFNDcygopCEube41MEwHF2hjjVIweFu
 7WOyZPLRcg9mOnfPBT7nxbNJHdTH4LILSeZhRgdbK2aILrS9nxIxRYJdoUoyMeL/kFgMZfK+rk6O2
 0l1Hp1mKrxDdMRBaB6RZguliCt97fNxdE09lJCsMT47SOV1owBDH4BV9iwnXMybmNRS48bjWNju+L
 lIfG6R0tw==;
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKV5X-00033z-V9
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 21:10:12 +0000
Received: by mail-qk1-f193.google.com with SMTP id 131so23001059qkd.4
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 13:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/354RJktfWO3Xv0X4oRS/MwprSK52O+Iss7VIFmrPCA=;
 b=CWm7oUer12LupInyu22TPHEBIaVz5TJFw3ClpubsBs0RwukfGDVk9iZLRj/vP12EvF
 8Hhs6DIHduo3jZbWucYrdI/KMQnwrY1NB7jIZUBKzQxUdsAYAHo9g0tZW2pzXX7VSTmz
 5D0QCs5Z3NFW5ZFTlhsTwpfvdWxdmTAQ4FNH9t3aTIj2Qn76ta2mTYl2WfhXyQTjJrEi
 jPJufZD6Pu3o3ZUxcTHYdRLW4j+94KfsFNr2KjuUxZV/7N/iqMdivqavoXt42FhxzLDI
 g/Hq9rThu6F/+wap8agiagXERCLoTZlCcj13gMuiVphqDOX4k4S3gW5sz4D99h04Ecyx
 YjLA==
X-Gm-Message-State: AGRZ1gJQmEPe9J9Ry5Lqj3vDoN8Q9B/ZM8eJ1FtxAaxYzL5k1KBb5+DF
 R3RDuAfHYawyLM8L3BnUau7xdxBih/ZOJSyu/f0=
X-Google-Smtp-Source: AJdET5dWhffFHUu7ZBoRk2k1Xds+Ikbp4k6UXVNUOvLdhMLXUvvYGJXNGas97+IHnJoQZuTJ58TZ4WJzzzpen9pkmQM=
X-Received: by 2002:a0c:f50c:: with SMTP id j12mr1864644qvm.149.1541624998627; 
 Wed, 07 Nov 2018 13:09:58 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3JcztCSYBuu5ZJXaV83VNLv_1v3v-EKMR+tC1oOsQesw@mail.gmail.com>
 <mhng-3c26b2fb-0c11-42f2-9026-1113b200a7b2@palmer-si-x1c4>
 <CAEn-LTpQ5uTte2bBrEs3uLKtsckkKPUOP+jHw5k-DFAwGCS3WA@mail.gmail.com>
In-Reply-To: <CAEn-LTpQ5uTte2bBrEs3uLKtsckkKPUOP+jHw5k-DFAwGCS3WA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Nov 2018 22:09:39 +0100
Message-ID:
 <CAK8P3a30Dmq3vp-+=jvVu8VMe+GKc9dU=+ZF0rzhFiUq2NuJ_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_161012_046622_83FCE9F8 
X-CRM114-Status: GOOD (  15.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107210939.fuHIwdZhzYIE1UKqYuXaNbjeRKVFR7mWTWWrwQ1XFkE@z>

On Wed, Nov 7, 2018 at 7:30 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> > On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:

> > The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
> > That's progressing well, with one last blocking issue related to some of our
> > floating-point emulation routines before we can submit the port.  This should
> > give us ample time to line up the ABIs correctly so everything works.
> >
> > So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
> >
>
> Then if you agree I could do and send v2:
>
> +#ifdef __LP64__
> +#define __ARCH_WANT_NEW_STAT
> +#endif /* __LP64__ */

Looks good to me.

> Cannot use CONFIG_64BIT as in user space nothing defines it.
> Alternatively I could
> check for __riscv_xlen == 64.
>
> I found _LP64 and __LP64__ being used in kernel, incl. include/uapi/linux/rseq.h

I think older gcc versions were less consistent about those macros, which
is why I introduced __BITS_PER_LONG a long time ago. We now support
gcc-4.6 as the minimum, so using __LP64__ is reliable, and on RISC-V
we obviously have a much newer compiler anyway.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
