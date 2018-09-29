Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00696C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 06:13:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B9B206B8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 06:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NPfLN6xr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="X+HY5Ft5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1B9B206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iv7aVJ9npl6Ui4l8kR2iZMHTyM6JiuTtrv0dVGuwTco=; b=NPfLN6xry+5IXk
	8IGDT0PXecxXUOilBziUjKgvyKsD2MRxnhVRRj05TiVJwUtRKfhfvkO/zpOwaZAA4puK4Z3RpfQaa
	viel5NATEwRwpy9+1PleJXhY43U8kPDGJ8D4U9AgfCFRw36wl9ukSbwykqoPPwE7Uf6D7TNrGASu4
	NXkVC6JcONFYcl9JmjJPU4YvxOy85qWBUML+rAGmHsrx7pr899T4VI7loGtkEdGLS7A3i/JUe3Che
	cgzuCFNflbn49sxdPkMQZXTFiaUgBGtosBqOYBzgXRdydisbG9FY4qFoxZd6lKTNHtFVFtj6aKs+6
	ZO2FbDvQX/3pbDtHHNEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g68V9-0001Pr-EN; Sat, 29 Sep 2018 06:13:15 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g68V6-0001Og-6S
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 06:13:13 +0000
Received: by mail-wm1-x342.google.com with SMTP id n23-v6so4038831wmc.1
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 23:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29jDzSXlXoffgt2mMIY4dV6BM8lRkIziSF82pMVMEUI=;
 b=X+HY5Ft5iJaK0ZTUxP+aceQUKNO/Y1AdprsmKMDrmGYY3DmZ6BIKQn7tZN93/7piOC
 YNkh9/XQjZHBUBS98iXRFnblDKAnUQOeced4giytTsSjIu51dG7MaDSz82UoAn8XC5Tm
 yeAYv3NeZ7REQwEM4jHvSLnRZ/RzWvXwvCETCXvgSxjqa9kQ9Kqt1ctx3cORjw7Cwba5
 Wl07ONSXkhVEJEe5o1NZnhdWXqdSoUzM0gwDGlpo+6tfWN7TfIT4mqhdsb7kz8UKyJwp
 RUZe4uxJHcRpUBQ+k8z8T2elU0K2MbuvfwJAt06y23KBwPsE096PtWMmRCVQV1K1OAED
 5dLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29jDzSXlXoffgt2mMIY4dV6BM8lRkIziSF82pMVMEUI=;
 b=UEo7lgGar5A2U3zKMriK2cmWHYor3Q4ePiMafeGelyk1h1ckr9yq+aDakwljMJ0ppK
 wy9nBBVNbCKs2RMafDiKnYunzzULGlPYPHwgWbFAUpgGk3LI446ryro4jTSJ/3OZHypR
 AynCybVn2KvvK7w23BSVfbInQL4h/9xFDBVF0XTzknU3AJgxbpmOXkOtw36NjaR6CWxe
 puLfn9J7Hzs9+vkyZbJl7mEypvxMhoOtOvho4g/iBMAZ5xWmDFFc0dn1FxuSWDSNqK0y
 zj6rGGRYKgIEjpIyidh9qLVwq9MrVhoLQPc+gX3HoO3O7CB9i0Xe9tOe2IMrmSJlXEzY
 X0mA==
X-Gm-Message-State: ABuFfoh8aAgRHXqLwLUwOkgSXhl8yGKB7X5cvX0HIQLeSRzybdFPAPGF
 DJV6xc3CMjRNxzBZDate32CoN91exQXtzNXNO6iDjCWiGoE=
X-Google-Smtp-Source: ACcGV63seKW84U6HmityIPpYOaCw3LFOUKpPjVpDhbo8qpRwSHMESAdEb+Nc7CMM3mi/N2b3lmBlAQvlDvmhVdwgNFA=
X-Received: by 2002:a1c:3383:: with SMTP id
 z125-v6mr3183079wmz.56.1538201577553; 
 Fri, 28 Sep 2018 23:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180912143822.21948-1-anup@brainfault.org>
 <mhng-f8bcf381-8d26-4082-876a-781fe87ee721@palmer-si-x1c4>
In-Reply-To: <mhng-f8bcf381-8d26-4082-876a-781fe87ee721@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 29 Sep 2018 11:42:47 +0530
Message-ID:
 <CAAhSdy2gC15j9zW+_rjBQzofGyhBjcNVWSYCbBtrAmQtDogBqA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_231312_239470_6A7E59E6 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929061247.W_FlmBpBgN3vktQMHj6AHQkWKUNRq3Y7oPdUZDR1Oyw@z>

On Sat, Sep 29, 2018 at 7:16 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 12 Sep 2018 07:38:22 PDT (-0700), anup@brainfault.org wrote:
> > Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
> > is in-correct. This patch shows CPU ID and Hart ID separately
> > in /proc/cpuinfo using cpuid_to_hardid_map().
> >
> > With this patch, contents of /proc/cpuinfo looks as follows:
> > cpu   : 0
> > hart  : 1
> > isa   : rv64imafdcsu
> > mmu   : sv48
> >
> > cpu   : 1
> > hart  : 0
> > isa   : rv64imafdcsu
> > mmu   : sv48
> >
> > cpu   : 2
> > hart  : 3
> > isa   : rv64imafdcsu
> > mmu   : sv48
> >
> > cpu   : 3
> > hart  : 2
> > isa   : rv64imafdcsu
> > mmu   : sv48
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > ---
> >  arch/riscv/kernel/cpu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index f0f0ec2737b7..7c1342e242e6 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -87,7 +87,8 @@ static int c_show(struct seq_file *m, void *v)
> >                                                  NULL);
> >       const char *compat, *isa, *mmu;
> >
> > -     seq_printf(m, "hart\t: %lu\n", cpu_id);
> > +     seq_printf(m, "cpu\t: %lu\n", cpu_id);
> > +     seq_printf(m, "hart\t: %lu\n", cpuid_to_hardid_map(cpu_id));
> >       if (!of_property_read_string(node, "riscv,isa", &isa)
> >           && isa[0] == 'r'
> >           && isa[1] == 'v')
>
> I like this, but it doesn't appear to apply.  Do you mind sending something
> against Linus' master?  Then I should be able to sort it out.
>

This patch is requires cpuid_to_hardid_map() added by Atish's
patchset so I have requested Atish to make this patch part of
his v6 patchset.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
