Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A4BC433DF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 14:58:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 770A120702
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 14:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQcT8MCZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMrS6FjS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 770A120702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3tTHIWpJnPz7nkxGFZdw9hQffsOZbn8ZMD2D2niaPO4=; b=mQcT8MCZMyah+lpsY1Z+rn0WL
	zniGDElPApb14Zwb41odlLkCZWmrWKi/LJI40q8BxbfO2LoVQFXShhDKlT4olkKNvBXbw21UEddbK
	V2+OQGdMF5+CmtS0pUIK/a+KcEblQ8XvuDGneijBkG5ToyFlqUcWOyzQoTyVVkNv3DQu1OC684FIb
	YbQor49mktkHzTdbf87BZ7PZnGVeNpNSjQTZ+2bfExG2kPlsPbJwE/j7wLccPfmGSduR6evl738mk
	jqmNkJW6LoyLt9i/gdZcTd0rrFPRYzNDPm11ylVlX2g5GQVtbRMatnPSyDlC184De9EMGr3n2DTst
	cHsy4WjdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js65i-0001O2-5g; Sun, 05 Jul 2020 14:58:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js65f-0001Nb-LV
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 14:58:00 +0000
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 449AA2075D
 for <linux-riscv@lists.infradead.org>; Sun,  5 Jul 2020 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593961078;
 bh=hKu8Ge+GDHcHtvN8fZmsImI1IXaySAu9UgW/3ZltK8c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aMrS6FjSObh4IvGluWF3vLq7UZf1d1xQpP9De4B5iRpDu8rfXrGXcWzTipN/fJc8B
 1ddxnQara4TqcXg34zhm8tU6L+z/68J+L0NkN3DcWwtS/Zzfy05aNcr76Cs1x1yD/a
 WrMpbRWoJ7RJJ9SnykXMuIK69v5WhkT/cwo1rtkw=
Received: by mail-lj1-f170.google.com with SMTP id h19so42324198ljg.13
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 07:57:58 -0700 (PDT)
X-Gm-Message-State: AOAM5322Av/sZjujwph2RXR+zGhO2djljD0dUXRsF9tEgI5BVtGOYZc1
 5UOV0DvNThaYEwKbpXcdePrBRvtZkYFSJsmbls0=
X-Google-Smtp-Source: ABdhPJzFKqf6ENpiHgx8xjZOOHzNdSTXrrdLCz7bWc2ZcGA2082YBDUf49gnwfPgTKbZdKuMqITCM7MR5baxsPTa0pw=
X-Received: by 2002:a2e:5344:: with SMTP id t4mr22000172ljd.79.1593961076576; 
 Sun, 05 Jul 2020 07:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20181113195804.22825-1-me@packi.ch>
 <20181113195804.22825-3-me@packi.ch>
 <20181114003730.06f810517a270070734df4ce@kernel.org>
 <a6abc4ce-4398-5ca6-992b-efb31e01c5ca@packi.ch>
 <20181115004141.5ed772834fc6bdf3467f244e@kernel.org>
 <CANXhq0qWwKRrz80Q3LSeQu-cH19otCF1my6dDGDxH0Q5j1RYYw@mail.gmail.com>
 <9cdd84b5-6c81-9bfa-5d35-6645f542f71e@packi.ch>
 <CANXhq0peZCWZsh37zZVzoi7spSzTfz7v4H5AytiAENKJdWK_tA@mail.gmail.com>
 <CANXhq0r5+BjsJ8jFtkWcm_1qPPQnLyZ5THNdPsxU568FNNa0XA@mail.gmail.com>
 <CAEn-LTrm6__-v7FmCRtNq2zm8up7O18wNhZmBmGwASj-Oy87qA@mail.gmail.com>
 <CAJF2gTTcj=bfK-KvE9U5EsLX0wFPEOw+PvZuTLN_rT5u_a5X1g@mail.gmail.com>
 <20200617235443.4110b4ef31150722dda7973a@kernel.org>
In-Reply-To: <20200617235443.4110b4ef31150722dda7973a@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 5 Jul 2020 22:57:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRVNeJh-7KV7+YGJrkHQRKsSqeTeO+82sppwbJbxbtjDg@mail.gmail.com>
Message-ID: <CAJF2gTRVNeJh-7KV7+YGJrkHQRKsSqeTeO+82sppwbJbxbtjDg@mail.gmail.com>
Subject: Re: [RFC/RFT 2/2] RISC-V: kprobes/kretprobe support
To: Masami Hiramatsu <mhiramat@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_105759_826819_77D044C3 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Anders Roxell <anders.roxell@linaro.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Masami,

On Wed, Jun 17, 2020 at 10:54 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hi Guo and Patrick,
>
> On Wed, 17 Jun 2020 20:58:32 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > Hi Patrick,
> >
> > I'm the author of csky's kprobe & uprobe, please ref to kprobe [1], uprobe [2]
> >
> > 1: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/csky?h=v5.8-rc1&id=33e53ae1ce413a081254e686d9b27cc1b3585e2f
> > 2: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/csky?h=v5.8-rc1&id=8f6bb793b2be82f1f73bfb416486f156f70b4314
>
> Thanks for the porting!
>
> >
> > May I continue your patches to finish the work? I'll keep the primary
> > author's name of you with the patches which you've done.
> >
> > Most of the instructions' emulation codes will be deprecated, but the
> > rest is ok. Maybe you should finish executing out of the slot first
> > and then implement pc-related instructions' emulation.
>
> I can review the patch if you update it. Anyway, my major concern was the
> self-modifying code, others are minor points.
>
I've done riscv kprobe/uprobe: [1]. Please take a look when you are
convenient, take a look.

Thanks a lot

[1]: https://lore.kernel.org/linux-riscv/1593833659-26224-1-git-send-email-guoren@kernel.org/

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
