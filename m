Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7446C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 23:12:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22562173B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 23:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H4DKrWbn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE5K04Xz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22562173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qa2wMABNIRZGCFMygsk78BPYgWUda56m/OdEcHftW4=; b=H4DKrWbnCWfPKF
	Eaz2luPiSwBRj7bLJPajOwDzhaM/hOU3st/HeIiDjtvV02a/NdjMn+f3zsyjs4PixW9JK1/3f5hR1
	aYXzRRhR32CTPp9d8MOZ1w7vnb2h0N/nHBz0zF9C7lzqS3F25eOxnjPuMhIbke1+uMhCQNTFK2maq
	7/l+RhvWS7YKoEV7+6moJ1wLdQJT4peMP60yw3L4qwIEKrm+zoJ7MLVEPmwQctI+u9aU96GDwTX9t
	tqx072moMKRojNQz/Py4OzbcHXl068ouxuWTdK0HWMbR30bLFlylNrkeStlQpJFJ6drDVBpTGm1dw
	5HvWaslQXD5/oUX12IKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grsqg-0000RT-4I; Thu, 07 Feb 2019 23:12:50 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grsqc-0000Qb-Uf
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 23:12:48 +0000
Received: by mail-lf1-x144.google.com with SMTP id q12so1226859lfm.0
 for <linux-riscv@lists.infradead.org>; Thu, 07 Feb 2019 15:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0I4TjkmJopDC8x5iojCng3SWoajxog3ipDWpHmVrWM=;
 b=jE5K04XzmYAx9iKMvPlr5okEnuqaRjlhptUBoj2+YL9i3t1X/Co+7FJ1rKxIbocZBP
 kcVzQh4eQfBoBjknkaJveo8cQZszRDsCiBt/ub68SXvscqhGCld9hMHuslU+sC6CA03i
 dq53UB2ENxbaF+eGa7v1xRlpG9jAxen2zS24svaayTCvgZEfFAYD7V6cjeDvOnnQVdED
 RRp/naeZqDl5TAf0nhJRIq/7Z4bpnAj7+S/Gt4NwaKUKVc71GSH6AaDzfjXxMVx7GlCH
 SWpBlY9wzWtCbT2wXnKuW8jiB90sjsqyOn8WaXy6L0aYQE0MgfbKQDKmdpw8F9H5def5
 LkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0I4TjkmJopDC8x5iojCng3SWoajxog3ipDWpHmVrWM=;
 b=pj8+3QQEu8cdSHa3KuFmbOMrvcXw+9tO9afZPBXFH1FAal2UwFKdhFHutccHOoh3jk
 UCsU5aOVtT9UjlL7au0RFCGJCJdfoGluM6GMWMwa4RjGi/tVbCGwUIgwVOVoYG7LI4vR
 L53m1YJkTAMRR7t//rkuSHsWcQSAPwjdHCxDSRqNtFE0d8s2JlW8kMiJwFxBlvaNfu8i
 gRhSczMWgPwrN5Xk2pNzjA4wEC7WAsE0ocneZGn+Xhb0Y5A+6VS6sPk0Hvr1ews6vKcV
 JRps0I3yzQVGQBna4z+fMQOJzY89KlnTLrMjvASaqNXmb9qOsAO3c0VPQ0iqUYCo4ssV
 wdMw==
X-Gm-Message-State: AHQUAuYKH0RZQRkUjuueGLtdZqPnE5AxkCmL5RE4WhO65ugXAXpTim8Z
 sFYSaFDUtbQ9fWUvFmPmWpW3R6VEQFGA+jiOXFA=
X-Google-Smtp-Source: AHgI3IZoPpr978ql1erFzwlBd9LNy7ON0bcx7r0p47eR1YYpsQLkgM58o1wFKzb9lxQu5dcfE9iyvDzWTwKy1r4tUrU=
X-Received: by 2002:a19:194e:: with SMTP id 75mr11549214lfz.114.1549581163593; 
 Thu, 07 Feb 2019 15:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20190207225531.19219-1-alistair.francis@wdc.com>
 <CAEn-LTrQtL3+MQSDKQmBBx4PJGox4r5yEyHxh35VVd_D4dg0Dg@mail.gmail.com>
In-Reply-To: <CAEn-LTrQtL3+MQSDKQmBBx4PJGox4r5yEyHxh35VVd_D4dg0Dg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Feb 2019 15:12:02 -0800
Message-ID: <CAKmqyKPj5fCQR_sVWDkkMmo28=GEpJ71VcvA+nZb0YzTd0J+Ug@mail.gmail.com>
Subject: Re: [PATCH] riscv: Partially revert "Remove stat64 family from
 default syscall set"
To: David Abdurachmanov <david.abdurachmanov@gmail.com>, zongbox@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_151247_047007_B6B23B7B 
X-CRM114-Status: GOOD (  19.43  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 7, 2019 at 3:04 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> On Thu, Feb 7, 2019 at 11:56 PM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > To fix systemd/sysVinit crashes enable __ARCH_WANT_STAT64.
> >
> > systemd failed to start with this error for 32-bit RISC-V:
> > [    2.833864] Run /sbin/init as init process
> > /sbin/init: error while loading shared libraries: libsystemd-shared-239.so: cannot stat shared object: Error 38
> > [    2.933593] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
> > [    2.934120] CPU: 0 PID: 1 Comm: init Not tainted 5.0.0-rc4-yoctodev-standard #1
> > [    2.934589] Call Trace:
> > [    2.934919] [<c0048a30>] walk_stackframe+0x0/0xa0
> > [    2.935243] [<c0048c14>] show_stack+0x28/0x32
> > [    2.935518] [<c05fa418>] dump_stack+0x68/0x88
> > [    2.935788] [<c004de48>] panic+0xf0/0x252
> > [    2.936041] [<c0051780>] do_exit+0x7de/0x7fc
> > [    2.936387] [<c00517f4>] do_group_exit+0x2a/0x82
> > [    2.936674] [<c005185e>] __wake_up_parent+0x0/0x22
> > [    2.936982] [<c00475fa>] ret_from_syscall+0x0/0xe
> > [    2.937673] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00 ]---
> >
> > sysVinit had a similar problem as well. By enabling __ARCH_WANT_STAT64
> > for 32-bit RISC-V the problem disapears and 32-bit RISC-V is able to
> > boot.
>
> Hi,
>
> This is expected change for riscv32. More details here:
> http://lists.infradead.org/pipermail/linux-riscv/2018-November/002062.html

Thanks for the explanation.

+ Zong

Do you know what the statx implementation is in the 32-bit RISC-V
glibc submission?

Alistair

>
> david
>
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > This was tested with this fork of glibc to enable 32-bit RISC-V support:
> > https://github.com/riscv/riscv-glibc/tree/riscv-glibc-2.29
> > commit: 04fdd476160a55792a75375ba2bf56c761f811c2
> >
> > I'm not sure if this is a glibc problem or a kernel problem, but this
> > commit caused the breakage between the 4.19 and 4.20 kernel so I'm
> > sending out a patch. Let me know your thoughts
> >
> > arch/riscv/include/uapi/asm/unistd.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
> > index 1f3bd3ebbb0d..031b7d78e11c 100644
> > --- a/arch/riscv/include/uapi/asm/unistd.h
> > +++ b/arch/riscv/include/uapi/asm/unistd.h
> > @@ -20,6 +20,9 @@
> >  #endif /* __LP64__ */
> >
> >  #include <asm-generic/unistd.h>
> > +#if __BITS_PER_LONG == 32
> > +#define __ARCH_WANT_STAT64
> > +#endif
> >
> >  /*
> >   * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
