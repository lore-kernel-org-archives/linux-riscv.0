Return-Path: <SRS0=u9L5=76=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8BEC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2020 12:58:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D52D207DD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2020 12:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VCw/hB0x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUvWT6a7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D52D207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MNJ9BfYXjr75bfigrz4yaNDWyT7V6NOSdGPw5wbY/o=; b=VCw/hB0xBXPK+I
	HFY8qcokQd1/EcLlLIHkPqt7NMhOKIG8Sbb46bITq2ks/KbWc3zQa4i72+htNXyzIEv1yLg0CUXFZ
	tRTX+BUs7nlv+XF5nVvck2p2EdIgrFHQXfZSmN3FclBZ/DmKLOZ98yenrwKb/CsHCeN8KXYEf501+
	+67znnP8sZSD9r+Ljd7QP+lZ7sS0h0cXeKD0s3U7ZvbJG0Ie7ZRTkal2W7EAuNzqFYiNlo3ibmhE/
	1d/yrbWFoaKRtBDWAH9K6AD67lsYUWTevENWdk5Yp12rZojxdn6mZdrtADtXzZmBYIespwWjDIyEM
	sH9hnxx2krytqsuO6isw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlXeU-0003mY-5E; Wed, 17 Jun 2020 12:58:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlXeQ-0003m4-Sk
 for linux-riscv@lists.infradead.org; Wed, 17 Jun 2020 12:58:49 +0000
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 269A321527
 for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2020 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592398726;
 bh=1MNJ9BfYXjr75bfigrz4yaNDWyT7V6NOSdGPw5wbY/o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GUvWT6a7BzXdVgB5zS62aOgQWeO/ewlkZGsLPS8bYfMcMJjPyBnoEibVhKI2ytgH5
 ER0V8SgZCDpzc75cwS1VemnziKc11j+S4WIjbLSvw061SetorSeSYRn4FUPcP8VwSV
 19zcVpVWCVAsSWRhDJSptlPk+kRENkmZTCMPTtbQ=
Received: by mail-lj1-f177.google.com with SMTP id q19so2756518lji.2
 for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2020 05:58:46 -0700 (PDT)
X-Gm-Message-State: AOAM533TgmHtVHiITG7+b2Kh5WO2MfJacacPL1ce7R1ef2ARz/GzZtYu
 3YbruFTjjnQCfI9HM2qXrVUo+2UWJtVFxGMiJUM=
X-Google-Smtp-Source: ABdhPJzyvt0Zd87N1SCfMemCdg+nXoajhVghAgC2ZRZVjTINK3QeYySu5gZJDb0s7fU9huFVeVqOIstEBCk8dptnSc4=
X-Received: by 2002:a2e:9755:: with SMTP id f21mr3821310ljj.377.1592398724393; 
 Wed, 17 Jun 2020 05:58:44 -0700 (PDT)
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
In-Reply-To: <CAEn-LTrm6__-v7FmCRtNq2zm8up7O18wNhZmBmGwASj-Oy87qA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 17 Jun 2020 20:58:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTcj=bfK-KvE9U5EsLX0wFPEOw+PvZuTLN_rT5u_a5X1g@mail.gmail.com>
Message-ID: <CAJF2gTTcj=bfK-KvE9U5EsLX0wFPEOw+PvZuTLN_rT5u_a5X1g@mail.gmail.com>
Subject: Re: [RFC/RFT 2/2] RISC-V: kprobes/kretprobe support
To: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_055846_965802_713F0BDD 
X-CRM114-Status: GOOD (  28.33  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anders Roxell <anders.roxell@linaro.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Patrick,

I'm the author of csky's kprobe & uprobe, please ref to kprobe [1], uprobe =
[2]

1: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/arch/csky?h=3Dv5.8-rc1&id=3D33e53ae1ce413a081254e686d9b27cc1b3585e2f
2: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/arch/csky?h=3Dv5.8-rc1&id=3D8f6bb793b2be82f1f73bfb416486f156f70b4314

May I continue your patches to finish the work? I'll keep the primary
author's name of you with the patches which you've done.

Most of the instructions' emulation codes will be deprecated, but the
rest is ok. Maybe you should finish executing out of the slot first
and then implement pc-related instructions' emulation.

On Fri, Jun 12, 2020 at 1:58 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> On Tue, Mar 31, 2020 at 5:45 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > On Thu, Dec 19, 2019 at 5:28 PM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > On Wed, Dec 18, 2019 at 9:10 PM Patrick St=C3=A4hlin <me@packi.ch> wr=
ote:
> > > >
> > > > Hi all
> > > >
> > > > On 18.12.19 10:14, Zong Li wrote:
> > > > > On Wed, Dec 18, 2019 at 5:09 PM Zong Li <zong.li@sifive.com> wrot=
e:
> > > > >>
> > > > >> From: mhiramat@kernel.org (Masami Hiramatsu)
> > > > >>
> > > > >> On Wed, 14 Nov 2018 21:52:57 +0100
> > > > >> Patrick Staehlin <me@packi.ch> wrote:
> > > > >>
> > > > >>> Yeah, I think it's simpler.
> > > > >>>
> > > > >>> And I found that the kprobe_breakpoint_handler() was called wit=
hout
> > > > >>> checking !user_mode(regs). In that case, you should add the che=
ck in
> > > > >>> front of kprobe_breakpoint_handler() call.
> > > > >>>
> > > > >>> Thank you,
> > > > >>
> > > > >> Hi all,
> > > > >>
> > > > >> Is there any update? I was wondering if this patch are keep goin=
g? If
> > > > >> not, I think I could pick it up to go head
> > > >
> > > > I am still working on it, albeit slowly, holiday season coming up h=
ere
> > > > in Switzerland may accelerate that a bit. All the feedback I got fr=
om
> > > > Masami has been implemented.
> > >
> > > As Masami's suggestion, I don't see stop_machine in your implementati=
on [1],
> > > are there some concerns to use it on SMP?
> >
> > Hi all,
> > I introduced the patching code framework. Maybe it is helpful for
> > self-modify code here. (Please see:
> > https://lkml.org/lkml/2020/3/9/679)
> > This patch series is reviewing, maybe we could apply the
> > implementation after it was merged.
> >
> >
> > >
> > > > Additionally I added instruction simulation for everything except m=
emory
> > > > accesses. I am currently working on getting compressed instructions
> > > > decoded properly into regular instructions but that is very tedious=
 work.
> > > > I guess I am two or three full days of work away from getting a RFC=
/RFT
> > > > v2 series ready I guess that will happen in early January.
> > >
> > > Thanks for the efforts.
> > >
> > > >
> > > > What I currently have is at [1], that is mostly untested as of now
> > > > (beware I will rebase/squash that branch regularly). What I could u=
se
> > > > help with in the future (as in for v2), is somebody testing it on r=
eal
> > > > hardware, as I've never gotten any testing feedback on my original
> > > > patch-series (that would not have worked properly because of the la=
cking
> > > > cache-flush).
> > >
> > > I give some quick tests by using kprobe sanity test and simple LKM on
> > > Hifive Unleashed board,
> > > it seems to work normally. I could help to test your next version pat=
ch as well.
>
> Hi Patrick,
>
> I have noticed that "riscv: introduce interfaces to patch kernel code"
> (mentioned by Zong above) has been merged in 5.7 kernel.
>
> I was wondering if you plan to submit a new revision of the patchset?
>
> Thanks,
> david
>
> > >
> > > >
> > > > [1] https://github.com/packi/linux/tree/kprobes-riscv
> > > >
> > > > Patrick
> >
>

--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

