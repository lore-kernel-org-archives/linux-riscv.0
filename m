Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD45C83F12
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 18:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fem/EuHTWtQRIFxPAVYH+0213UpKR7lANzli7OTcArA=; b=hZ8nXRXqPlg0fp
	X8dGmbViJv7q0DeGglkzbxro8Mf45kVejwemklFfY6nhr+bgXn3xBl3V0aBSG7Tx9s7TvKnNU1LfX
	EKjTMnEb9d4IGhhaMmur8BsmlrNCx3A0XbxsHmzaoZ+3vz5uriIdCDp/i4DMOP2eFV6qCsTy9Mti8
	iBMMJmdg4ECaZf6F5svK/OMM+AVYsXllNBRT8kj07/39JNH3H7e8aziU25wrTOivMEYwgkJTtFDf3
	0dS5TyNz+awzH6s61HP+pLNVDejDVvlqtnId9ciGnWNYqcWTi58tZ97QM3B8M8ZV57ErvgUOg9PUM
	lIMm2WC3cioKw+0Yy7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb3re-00C5De-32;
	Tue, 29 Aug 2023 18:54:58 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb3rc-00C5DG-22
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 18:54:57 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso6270197a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693335294; x=1693940094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7rkeLzlKLJm6uIQxs6qrmHZPlBWb8A/YK44W7thpWJg=;
        b=Q6SSiEaCrCkveJreuDnQ2goaa7FhBqB8eCiRKCGytyRoe1AQaSX/9r06XagFo7RffS
         yobhr3xSrN3Cv32B4w0M9rzuiZ70qTqmC+fM3sGRMETsTMPLEUfwcqkuKAU6NHAGk7OU
         R3wJuKLczA9Wz2ZVEwLcymk7BJQIKugtPaeIgEmTKbfMdoGq06run9f/+B7RxpVLPp/t
         NxtsWVAh294H/o+XsBFU3dfZSm1mErvi4VKIPWuB6DpyLHi9evttCzrW5OUdvojTb0Jf
         sP3mBl3F4b+aUQGn+sqb8grhjMfQdhkAJSYDtvf1MAyYoxPT9pt5HPMwF5UdPCa9fMqf
         1A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693335294; x=1693940094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rkeLzlKLJm6uIQxs6qrmHZPlBWb8A/YK44W7thpWJg=;
        b=ZRCXrMqFdZ7fndGk/Yub8u9GUjWc9CA1R3AeAnyJMxPXWMIfYTeWPrQl8ttX4Ku8vZ
         TFu9B8n6PfC8dI5MTDL5tZLzNHh+QFWrMsavLe80hXDVXzvVXFbSJDOvZM2ZLBrgoQQu
         r/zxqro5PZvvtIyXoKVQx5Hs1fFaO+2v+lD5kHulpWkhOiu+zrgRtqrZu3ptulkc7KZI
         FdGAf2BLVG61POglty7PTolygNFjJItcD3kRKtHI6bXgxK+GG01sAe2UBbMKQkrDfQfD
         0WxSw0wHVS2Rz5FHUpzm9eMWYSlAJ8kwgrUfmLweHcsGcmu2c9JTozRy2twe8L45wjMl
         B+Fg==
X-Gm-Message-State: AOJu0YwdHdmLS8zG+njcRl596newYIZYIhWal2zTG6zkY8H4Elabs8Fd
	EiqqF1Fg1OW2YYXmRNPOUWo=
X-Google-Smtp-Source: AGHT+IFcqzFt/WzR0tUdIWAOMjVgkWSBdToB/3XihxPZP5cmyTOr+ZsfKHhhDnE69wepr3vSv8v/Hg==
X-Received: by 2002:a17:906:cc52:b0:9a2:139:f466 with SMTP id mm18-20020a170906cc5200b009a20139f466mr12104379ejb.13.1693335294289;
        Tue, 29 Aug 2023 11:54:54 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id kb12-20020a1709070f8c00b0099297782aa9sm6195916ejc.49.2023.08.29.11.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 11:54:53 -0700 (PDT)
Date: Tue, 29 Aug 2023 20:54:52 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, guoren@kernel.org
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
Message-ID: <ZO4+/P9B29Bpb0Yz@nam-dell>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
 <ZOyhozSq3S36eRSq@nam-dell>
 <ZOymDqhE9STgx4Mm@nam-dell>
 <87edjmz864.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87edjmz864.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_115456_675929_F33E7973 
X-CRM114-Status: GOOD (  28.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 29, 2023 at 08:14:59AM +0200, Bj=F6rn T=F6pel wrote:
> Nam Cao <namcaov@gmail.com> writes:
> =

> > On Mon, Aug 28, 2023 at 03:31:15PM +0200, Nam Cao wrote:
> >> On Mon, Aug 28, 2023 at 02:48:06PM +0200, Bj=F6rn T=F6pel wrote:
> >> > Nam Cao <namcaov@gmail.com> writes:
> >> > =

> >> > > uprobes expects is_trap_insn() to return true for any trap instruc=
tions,
> >> > > not just the one used for installing uprobe. The current default
> >> > > implementation only returns true for 16-bit c.ebreak if C extensio=
n is
> >> > > enabled. This can confuse uprobes if a 32-bit ebreak generates a t=
rap
> >> > > exception from userspace: uprobes asks is_trap_insn() who says the=
re is no
> >> > > trap, so uprobes assume a probe was there before but has been remo=
ved, and
> >> > > return to the trap instruction. This cause an infinite loop of ent=
ering
> >> > > and exiting trap handler.
> >> > >
> >> > > Instead of using the default implementation, implement this functi=
on
> >> > > speficially for riscv which checks for both ebreak and c.ebreak.
> >> > =

> >> > I took this for a spin, and it indeed fixes this new hang! Nice!
> >> =

> >> Great! Thanks for testing it.
> >>  =

> >> > However, when I tried setting an uprobe on the ebreak instruction
> >> > (offset 0x118) from your example [1], the probe does not show up in =
the
> >> > trace buffer.
> >> > =

> >> > Any ideas?
> >> =

> >> >From my understanding, both uprobes and kprobes refuse to install bre=
ak points
> >> into existing trap instructions. Otherwise, we may conflict with somet=
hing else
> >> that is also using trap instructions.
> >
> > I just realize you probably ask this because uprobe can still be instal=
led before
> > applying the patch. But I think that is another bug that my patch also
> > accidentally fix: uprobes should not install breakpoint into ebreak ins=
tructions,
> > but it incorrectly does so because it does not even know about the exis=
tence of
> > 32-bit ebreak.
> =

> FWIW, I can still install the uprobe at an ebreak with you patch. It's
> not hit, but succeeds to install.

It seems uprobes install failures are completely silent (see uprobe_mmap() =
in
kernel/events/uprobes.c). So I think although uprobes install seems fine, it
actually is not.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
