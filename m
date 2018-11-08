Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43350C46465
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 10:38:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1643E20685
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 10:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="icW7Vbyy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qkg5ydbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1643E20685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnKBMpauWCmcq75IJm43KkL6hGHBhOdF6qGjYz3/Vro=; b=icW7Vbyy7OlUG+
	r1IS1+Je8VxQJJ4AL9dqT6mxeYboHSFCvFX1bIrl4X0PmDaDiHvDzPXCscsJs14P+GP0cMq/Vvln4
	AQdxkketj1Q5oaMT6/GW0chUniWqBgsPVZbihYhOTbzafFB0IIxyrZEk5Fu9Ht8qeyBFyjqga1Wov
	GOLEQ+upXLZa9+YIRSC+U+CiAHu/Bu2635mkP+tqhrBlFfEebWVZFlvlM4iPaGmFEdEEdjf212DXk
	tixO6LefcAGCF6510gn/4rBKpeU8PnzjXrROwxzPzFcocT2RwDBta7Kbuw9OmjQw1TVlBfE4NspZP
	O/2VfB3NXleUxoVCpA6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKhi3-0005p2-9g; Thu, 08 Nov 2018 10:38:47 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKhi0-0005nq-VV
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 10:38:46 +0000
Received: by mail-ot1-x343.google.com with SMTP id s5so3727122oth.7
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 02:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yIPOAKMwJeHPUZIv+fRJ7M0KKDeAFvDEIIu4jLul4ts=;
 b=Qkg5ydbDOPXjxWc2y9lflI940ZAqznNhW0Zwj7/SMbTmfKbRYLYb0vCU90yM06dmbb
 FpFlsJhOy14jvenujSV+9YUzk3OVUWNn/37WctUxAePQJnoEFaPed0jrjo8JFsm0l6vT
 jSICY09sGLdL/u9DFvIuAph7ZrxPyCZYxzNsvjYGH2uAZRbUDHWnFr7OtQE0cLRnp2pD
 KAfOI2zywl4K0HIDZQQ7vuXHI8qMMl4Zqykt/Gml26NunQusfQIq+ktTTE+rsEKtdpwY
 bqOUYu0inAc0zGbxQtsdBmiZIeqbSGCahKwXhrRTD42vFw7l1c7W4aL8dOZe6hE+HhCu
 6cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yIPOAKMwJeHPUZIv+fRJ7M0KKDeAFvDEIIu4jLul4ts=;
 b=DDD2EBY/zwn2oAWCPLoIbjDRyf64rJUEOdsJLGN7JrQL88xGgxBZrz0yYQw7EkJRgI
 +MB4oVREYGYkwdLJAfU6xA/Cn7EV/EfxCbpgOuCrfTLkjvKRjZY1vQFjYv/xsAPJhplP
 uvNnmeqUAq+Qexxil24hqusCQ1G8PREjfViSP3VFyoPqeh/2OnZ/QtOz0FWI7iNvv/gy
 pS1IcFpLaytYFtrLYjeU26ms/N3EQYSgkYaOnZ8DgHh308B2j5j8rG8JJ5gotUU91zEY
 e2bGIIlW+gyEfgCwJ+lbJcl3SQVLFYexnoLqCeV/ksmCnd8hNLchjq1YSLKc93LjwsfR
 LzjA==
X-Gm-Message-State: AGRZ1gIH559Kufy/02VbcJv5cUlMBGvpv4HLKr1Q7atJQY6k+o4jjKxW
 y/6gRGyvXgHighNEiSswC37I4RaggqoMEIpFNsw=
X-Google-Smtp-Source: AJdET5ecBAYdZh/BBViixUSEzOUpNE/adi4HGCg8qjrX1rrQLGkj+J1CzIFzGaUzsfDxww+3QrEwvLSz2qa5grIUjOI=
X-Received: by 2002:a9d:2fac:: with SMTP id r41mr2256574otb.169.1541673513329; 
 Thu, 08 Nov 2018 02:38:33 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a30Dmq3vp-+=jvVu8VMe+GKc9dU=+ZF0rzhFiUq2NuJ_w@mail.gmail.com>
 <mhng-23f94805-b961-4e68-a4c1-7d79b60bd925@palmer-si-x1c4>
In-Reply-To: <mhng-23f94805-b961-4e68-a4c1-7d79b60bd925@palmer-si-x1c4>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 8 Nov 2018 11:38:22 +0100
Message-ID:
 <CAEn-LTqCT-u0_QNdOSf3bLKYa5S2vz4T0X5yKmnS1AE4pDYOkg@mail.gmail.com>
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_023845_007688_B0831F2E 
X-CRM114-Status: GOOD (  17.20  )
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
Cc: aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108103822.Yt21AbmUSwna1BLx7H9RC2fk_H1FeH3dJCCN0z81d3Y@z>

On Thu, Nov 8, 2018 at 3:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 07 Nov 2018 13:09:39 PST (-0800), Arnd Bergmann wrote:
> > On Wed, Nov 7, 2018 at 7:30 PM David Abdurachmanov
> > <david.abdurachmanov@gmail.com> wrote:
> >> On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >> > On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
> >
> >> > The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
> >> > That's progressing well, with one last blocking issue related to some of our
> >> > floating-point emulation routines before we can submit the port.  This should
> >> > give us ample time to line up the ABIs correctly so everything works.
> >> >
> >> > So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
> >> >
> >>
> >> Then if you agree I could do and send v2:
> >>
> >> +#ifdef __LP64__
> >> +#define __ARCH_WANT_NEW_STAT
> >> +#endif /* __LP64__ */
> >
> > Looks good to me.
>
> This is a bit pedantic, but I'm not sure what the right answer is here:
> "-march=rv64gc -mabi=ilp32d" will not define __LP64__, but will define
> "__riscv_xlen == 64".  I actually don't know enough about how an rv64gc/ilp32d
> ABI would work to answer this: would we have "long long" all over our syscalls?
>
> Probably not worth worrying about for now, as we'll have to go audit all of
> these if we ever end up with an ilp32 ABI.  So just go for it and we'll throw
> this on the pile to deal with later :)

GCC will not allow "-march=rv64gc -mabi=ilp32d":

    cc1: error: ABI requires -march=rv32

I see that arch/riscv/include/uapi/asm/elf.h already use __riscv_xlen so to be
consistent I will use it too (but I like __LP64__ more as it is well
known macro).

Looking at other UAPI headers I see that include/uapi/linux/rseq.h is using
__LP64__ macro. This header is installed on riscv.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
