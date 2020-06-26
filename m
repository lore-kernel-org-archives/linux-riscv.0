Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E55C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:23:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B389D207D8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hrCHpt9x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B389D207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zy+S598XDmLKZ/9oCSoElNhOnuhAGzrJdh9+xrVzYKs=; b=hrCHpt9xhAgf2tjRsKWMLyvuk
	+MunhkyvrpS16uabRK/vEuRT6Y8GWTVrJnqyH8quBWRHmdeKMfNsG9Kk5LJWNGa/GRFswXqtWxEsY
	Ml8qItwoMnCD0n6jPveqTYs54t//kG5AsEzhRamMWBqrk+Wfnk5sQnR/w4S//9jbgzhe6y0DLRmKo
	drgQfZtBiLHViSO7/tmFX+9Hbm2DevHTPx/uHDiYAUKwLvRvDFQ1/DlHDtEyhfRyk5D/Isg+Ji/x0
	XpOyGUOpZouBx+hOr4xVuF5n8ijD4/59o82+7nN/beelV0xvs9kTbGGLKwkmnKcZc/EY9Z0y0IEzQ
	hVMUH1R4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jonO9-00048V-57; Fri, 26 Jun 2020 12:23:25 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jon47-0002Yc-0g
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 12:02:45 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49tb9S4vKgzvjc1; Fri, 26 Jun 2020 14:02:35 +0200 (CEST)
Date: Fri, 26 Jun 2020 14:02:35 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH] riscv: enable kcov
Message-ID: <20200626120231.isx3fyhhpuuhwwco@distanz.ch>
References: <20200625183941.23093-1-tklauser@distanz.ch>
 <CACT4Y+azxRtnEQO9tH8nqM_o8VJaTRAiQmQAYhTsrWmVWWhLGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+azxRtnEQO9tH8nqM_o8VJaTRAiQmQAYhTsrWmVWWhLGw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-06-25 at 20:45:55 +0200, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Thu, Jun 25, 2020 at 8:39 PM Tobias Klauser <tklauser@distanz.ch> wrot=
e:
> >
> > Add ARCH_HAS_KCOV and HAVE_GCC_PLUGINS to the riscv Kconfig.
> > Also disable instrumentation of vdso.
> >
> > Cc: Bj=F6rn T=F6pel <bjorn.topel@gmail.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> =

> =

> If it boots:
> =

> Acked-by: Dmitry Vyukov <dvyukov@google.com>

Yeah turns out I boot-tested this with a kernel which didn't have
CONFIG_KCOV enabled :-/ Will send a v2 patch.

> FWIW for x86 we needed to do much more of this:
> =

> $ find arch/x86/ -name Makefile -exec grep KCOV_INSTRUMENT {} \; -print
> KCOV_INSTRUMENT :=3D n
> arch/x86/kernel/Makefile
> KCOV_INSTRUMENT :=3D n
> arch/x86/kernel/apic/Makefile
> KCOV_INSTRUMENT_common.o :=3D n
> KCOV_INSTRUMENT_perf_event.o :=3D n
> arch/x86/kernel/cpu/Makefile
> KCOV_INSTRUMENT :=3D n
> arch/x86/realmode/rm/Makefile
> KCOV_INSTRUMENT :=3D n
> arch/x86/boot/Makefile
> KCOV_INSTRUMENT :=3D n
> arch/x86/boot/compressed/Makefile
> KCOV_INSTRUMENT :=3D n
> arch/x86/entry/Makefile
> KCOV_INSTRUMENT :=3D n
> arch/x86/entry/vdso/Makefile
> KCOV_INSTRUMENT                :=3D n
> arch/x86/um/vdso/Makefile
> KCOV_INSTRUMENT_delay.o :=3D n
> KCOV_INSTRUMENT_cmdline.o :=3D n
> arch/x86/lib/Makefile
> KCOV_INSTRUMENT_tlb.o :=3D n
> KCOV_INSTRUMENT_mem_encrypt.o :=3D n
> KCOV_INSTRUMENT_mem_encrypt_identity.o :=3D n
> arch/x86/mm/Makefile
> KCOV_INSTRUMENT :=3D n
> arch/x86/purgatory/Makefile

Thanks, that's very helpful.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
