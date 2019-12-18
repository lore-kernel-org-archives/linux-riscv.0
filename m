Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE1AC43603
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 10:07:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 409E62176D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 10:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hNljY5Oq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/Dz4ukr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 409E62176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hnc+Qtpj1ux44k69lNmT/0NQKfi5c/PxZmcRKhpeVUI=; b=hNljY5OqaYswDImuIISXfgqfE
	h9twgfhNRKitBzQ1/xpQ1ComHs4qIVPl5Iy2auM64cyhlznPT19+PnG7TQTixyd9+t48O3qOIIcUn
	e7UUT9sMn7qCtFuX90KQe08OR9W+vXr6+R3hg11ynpQSFlAmsudHuJnsmD5BK4n0yodrfYnFtj7RO
	iYKYlfWLRkk5olJKJW8UrAi5jzA8RXvG6cPGxsDiGSWyCwYsz5KxWriyYEvVpLyW/zJbWeuTeKTkt
	KteHWnygxvdUiQIsZh6xHNtZrpOC7Cq7Ma9DfdrEnyxPpOOe/d8VmKnS/HDEzsMahzXq05mdXPoQv
	N1g9zmHdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihWF0-00009C-Cq; Wed, 18 Dec 2019 10:07:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihWEx-00008e-ID
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 10:07:36 +0000
Received: by mail-wm1-x341.google.com with SMTP id t14so1187027wmi.5
 for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2019 02:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hnc+Qtpj1ux44k69lNmT/0NQKfi5c/PxZmcRKhpeVUI=;
 b=V/Dz4ukr1yXILlDlis3/bkczr5RqrcSC2dG1fl+a/0z5tFQ9DJsxZPhKgBN0vWRz4l
 f+qIVDEcu5artj5f24a197YuqSVUJ7kY+hYWbjkqxwJtZjkLAwOjUZYOYKxI4Z2SRaf6
 Dzwf/lfFAh7DNfT3xkoorL39dUXmytJfnAsBoPlN73EtATwoiwlapXDcFkfBIu0XToxz
 Mxd2FGvgA7vrFzsmNBJviZuyZ9546Z9N1KVMVPkOioIre4m6UORtDov4ffjjv7lEu4qL
 K8xWGtfwKiqAkoSvulzPHo/7IDkqZFqB88fAnXI27bwMijlcDIEhDV/oUbkqyPsLksa/
 kzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnc+Qtpj1ux44k69lNmT/0NQKfi5c/PxZmcRKhpeVUI=;
 b=A1mK9iT2ZCwxeF7ck3VTeipjiu8GsE7822m+wmGps7+T/v1IDbCzNeqcrgZCxKF4LA
 M9oRqBCWCQ6FfJ32g+1J11p3SibFZATIiwPfdSG52M3oE2o9PBMKSxtQwPFmzBrk0Jlx
 dM3Kelzm0uvLSxDjXaJguMeWGIph44QnYPP7s+X11lWT3F2BFzy/5mkhh5HOEXl/jcw5
 YKbOaniDIaDKR4SE9xAi/VaJFfRTFh3j5orbHYZMrhLcdjNOxOOA9v0PLC7bJbhGckHy
 AVI4TMXg7drTsmMlyAPB8Tg5YeNH1CShvDXspxln9OoZMbn1VTOa5KlfOkJ3DrDiFHIm
 kacQ==
X-Gm-Message-State: APjAAAUSmlwMjfn/n6/KXeXBvZ/3mMnzkTUKbu8QzNAUl/b4imqpoxIx
 Pgs5b/pGCF/nwddPPM7K5yZBiwobxEb+gbJ1zyQ=
X-Google-Smtp-Source: APXvYqyBbxfNZX/fDYlx1sQzQD+dovvpivZ0Iw+N5kjZL1Q5w3uZFQVgiOCiHCoKXk1Up5mOW7UsoYWMnotVP71Bs7A=
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr2309027wma.5.1576663653844; 
 Wed, 18 Dec 2019 02:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20191218084757.904971-1-david.abdurachmanov@sifive.com>
 <mvmo8w63r1d.fsf@suse.de>
In-Reply-To: <mvmo8w63r1d.fsf@suse.de>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 18 Dec 2019 12:06:57 +0200
Message-ID: <CAEn-LTojXuAbY31nReCsbE=7Q9PkuKexAttTc+35ZFn7SLG-_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: reject invalid syscalls below -1
To: Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_020735_627357_FD40DD5D 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Chen <vincent.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bin Meng <bmeng.cn@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 18, 2019 at 11:46 AM Andreas Schwab <schwab@suse.de> wrote:
>
> On Dez 18 2019, David Abdurachmanov wrote:
>
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index a1349ca64669..e163b7b64c86 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -246,6 +246,7 @@ check_syscall_nr:
> >        */
> >       li t1, -1
> >       beq a7, t1, ret_from_syscall_rejected
> > +     blt a7, t1, 1f
>
> How about using bgeu instead in the preceding check?

The syscall number could be -1 if tracer rejected it.

We could do:

li t0, __NR_syscalls
[..]
// first check if syscall was rejected
li t1, -1
beq a7, t1, ret_from_syscall_rejected
// then check the bounds
bgeu a7, t0, 1f

>
>         /*
>          * Syscall number held in a7.
>          * If syscall number is above allowed value, redirect to ni_syscall.
>          */
>         bge a7, t0, 1f
>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

