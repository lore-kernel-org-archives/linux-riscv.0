Return-Path: <SRS0=RYOb=WR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACA5C3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 03:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0A62332A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 03:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hIQyKJIi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="CC01joea"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C0A62332A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upO4+N+5vdt8SgvR6Cvf7YpdW28p9/lSZ249oNxBraU=; b=hIQyKJIiMsiIli
	w9rcPl1GKeFKOirfRewaeFrvRFouG3o0zElgszTkzFhnOpzj8DCQrL4VvdazLl5k+0kd/l75vdGK8
	+lf+wZOYmcJFCA0XIeYqZjShUzy9u/js06MCIe1lt+XFqPlmEcYw1yKc9boLs5/jBaZpMBB8Wy2hM
	PmEmgnB9OqqALEdohKKaF+J53McKdXpMk3Yhvm+Fty0XTgMSoPW5Srq2dwf+PAG5pbx6MlEL4739s
	hLHvgEHwmX/fgjE28MCLGHyODaaErKaGCl667KujTBBqVRGwq8lA92XpUI5xIVwHZL3btHhN7AdEw
	eN8miFkBCor+tw/Ma5hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0HgH-0001VV-7V; Wed, 21 Aug 2019 03:53:05 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0HgE-0001V6-SH
 for linux-riscv@lists.infradead.org; Wed, 21 Aug 2019 03:53:04 +0000
Received: by mail-wm1-x343.google.com with SMTP id m125so620832wmm.3
 for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2019 20:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q866pfLZUUGzykCVlgEKOZZOziqbhijhD1KhBLgHDuA=;
 b=CC01joeanbShowTYisfRKQQ61kAqiysEDe7KMhHsnvznkhCvA0zOqJJ3ZLtNn9TzNR
 d4q11HxmhCYM5xBMBbmm/7OPjW5vwv/MNCer3+ZWkpumdjU9siisBaMAaJVEBXnFDOje
 BFI3q5R0PpiqBxvKVcxTuRSpQntslzKq3jtR2aldxgBB+zHHA5GG+brSqjTztNsmm2dZ
 Wa4Voa1vfrl7cagd03kgcjwZbJXGmwO1u9NK0CcoOIgTt42geUwgVkA977wX2Nkkawth
 RjbTy+5+7/G4T1cDWvaAS3nLUi9GQWtaZ1T/t8tBFXAR096gRYYUGmTlkQngJU0/xfoQ
 kbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q866pfLZUUGzykCVlgEKOZZOziqbhijhD1KhBLgHDuA=;
 b=O8uEfUk5PBNVLtE16sncXpzVTdFo9BB/wf8F/COxScoFmkFmznx7G4Zs8Q2h1GcQ3f
 YBjuCEyzET0S4Dwej1NxLZvGQoC7v+LNxHOD4JBtk44h6heLVySoT6hv0F7HutWuBz2c
 6f6PHPs8Ghwqc/inQNVYuxJvHMxtnhc7oDFb/tcwytetN/fAFrGner8yJmjBzOr//OdB
 msKsj2KocPucAPYraWrKUAQVtagLuhoNsFkcB1rWD55ZcnWbeWASmO6oJP/rSB5Qmvyi
 gh6SLgY5Xjd+WO8ku+p0JHaUUrC6Tap/X3CJU57QrjT2531e5txdJ/ukbwvCnrPiJwtu
 Ljmg==
X-Gm-Message-State: APjAAAUlVpCpoMyKxKQ5Z8+vxPP8cup1qawiRpPN5+ZAlIC5AuBVh76v
 VAzwA/n+BVxrUcGH++fQL+UEhUcb6sx7feuuNyiGeA==
X-Google-Smtp-Source: APXvYqzDZPixEa7x5dg6CFkkM3l2F1MJKZKytyiRjSYnXVT5ZH6+qKWyalba8BS/+Y8qD7J/UcdZL695Rb+CDBmimGQ=
X-Received: by 2002:a1c:3d89:: with SMTP id k131mr3004134wma.24.1566359579978; 
 Tue, 20 Aug 2019 20:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190820004735.18518-1-atish.patra@wdc.com>
 <mvmh86cl1o3.fsf@linux-m68k.org>
 <b2510462b55ffd93dba0c1b7cc28f9eef3089b50.camel@wdc.com>
 <20190820092207.GA26271@infradead.org>
 <76467815b464709f4c899444c957d921ebac87db.camel@wdc.com>
 <20190821012921.GA30187@andestech.com>
 <20190821014052.GA25550@infradead.org>
In-Reply-To: <20190821014052.GA25550@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 21 Aug 2019 09:22:48 +0530
Message-ID: <CAAhSdy0GX9BbayYScsm2_Mvi0hDH-y0UVvTWFGLbKY-rE8TfZQ@mail.gmail.com>
Subject: Re: [v2 PATCH] RISC-V: Optimize tlb flush path.
To: "hch@infradead.org" <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_205302_977921_7CD81D90 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Alan Kao <alankao@andestech.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>,
 "schwab@linux-m68k.org" <schwab@linux-m68k.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 7:10 AM hch@infradead.org <hch@infradead.org> wrote:
>
> On Wed, Aug 21, 2019 at 09:29:22AM +0800, Alan Kao wrote:
> > IMHO, this approach should be avoided because CLINT is compatible to but
> >  not mandatory in the privileged spec.  In other words, it is possible that
> > a Linux-capable RISC-V platform does not contain a CLINT component but
> > rely on some other mechanism to deal with SW/timer interrupts.
>
> Hi Alan,
>
> at this point the above is just a prototype showing the performance
> improvement if we can inject IPIs and timer interrups directly from
> S-mode and delivered directly to S-mode.  It is based on a copy of
> the clint IPI block currently used by SiFive, qemu, Ariane and Kendryte.
>
> If the experiment works out (which I think it does), I'd like to
> define interfaces for the unix platform spec to make something like
> this available.  My current plan for that is to have one DT node
> each for the IPI registers, timer cmp and time val register each
> as MMIO regions.  This would fit the current clint block but also
> allow other register layouts.  Is that something you'd be fine with?
> If not do you have another proposal?  (note that eventually the
> dicussion should move to the unix platform spec list, but now that
> I have you here we can at least brain storm a bit).

I agree that IPI mechanism should be standardized for RISC-V but I
don't support the idea of mandating CLINT as part of the UNIX
platform spec. For example, the AndesTech SOC does not use CLINT
instead they have PLMT for per-HART timer and PLICSW for per-HART
IPIs.

IMHO, we can also think of:
RISC-V Timer Extension - For per-HART timer access to M-mode
and S-mode
RISC-V IPI Extension - HART IPI injection

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
