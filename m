Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD112C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 15:34:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49AD622285
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 15:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49AD622285
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f3rXU3TIbVIIevamVV3yIL4liSIyum1FrzotqYz3vNw=; b=ZVdZ8PKq1X2IFavHUCexnMa9H
	HsUUC1BtXcRxiAj/qf7uiZ4jeVM+5eldx8rsTIXN+wiAH6Wh7//vp7VpfHuFDZ09quwL2UKDCfPIB
	WrgGTcx32ZsvyKuIfNs8r+xtgHzwZ0xdn3Jo3xOZe7NBvxLpY2Wz8OQzRcFf9fdnDAxOKiQE8/Psk
	rpjfQzRYxKSa5PGOmwhkTbjdBFh9JBzPki+PbaFoq2iMKEB7XW0Fy4H6Utb7fzKTi0u0RWqhsHroo
	WZoFN9aHCD5D7kUhYfBnJGWAIQ/lSDRYgq7hkGAegRjVBTwomPKp5E0LttXkjgoHrJ1/Wjr6HlGVU
	2SDpAYjNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1WXP-0005gR-H3; Mon, 18 Jan 2021 15:33:51 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1WXM-0005c1-CH
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 15:33:50 +0000
Received: by mail-ed1-f51.google.com with SMTP id n6so2953143edt.10
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 07:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rR9roZIqrLGag/PtFNc1IIMQg0OQPGVvI2efiyqTDEw=;
 b=AUX11qwrvsEA05hn4MgXsi99JIyMHKw89gmTclBS95iQuHAbJV27CHaB0ZF6VLm5rD
 T4uiOBgY9jINRuUT9JyjixQiuAaZPQyKN+Xcs2u3kMxhrURj3pOIjWwZmXsyG45FT/Ej
 ez92gqQQ+mO64NaWkQ3ZgrjOyv3tIOVzKf2Rx4nK0r3nBUEmsteESRJCsU8ErFhbhOxO
 F3LQMExFdWUGqlysj6Lb24G5JrhKKG1cU4tQfuPa0t6LGi3g//AAdUIs1NtM0ytGRv4G
 f7U2uLhp8Bck2g6J2juo3nGQC/gUJeUk1/UE/CciZhNswbV5xfyVMUoIdmwLUCI7z1xb
 J7OA==
X-Gm-Message-State: AOAM5316PavzGQmydvGn2AJVzgBDMJRUz2z5n/WPJtGs0bVsyWY+Aw9n
 xMqbH+17XySXMCh1GeKEvWo=
X-Google-Smtp-Source: ABdhPJypeB+3/kIpsdPrKXLa2tZNphIY88uTWvgcGxp9zTCIkIMMVA403rs6ZVAmzDpdQV4ndGRYRw==
X-Received: by 2002:a50:8b61:: with SMTP id l88mr37909edl.250.1610984014461;
 Mon, 18 Jan 2021 07:33:34 -0800 (PST)
Received: from ingrassia.epigenesys.com ([2.236.81.180])
 by smtp.gmail.com with ESMTPSA id c24sm8536677edt.74.2021.01.18.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 07:33:33 -0800 (PST)
Date: Mon, 18 Jan 2021 16:33:31 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: perf tools build broken for RISCV 32 bit
Message-ID: <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
 <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
 <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_103348_427613_80F79FA2 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Khem Raj <raj.khem@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd,

On Mon, Jan 18, 2021 at 04:19:47PM +0100, Arnd Bergmann wrote:
> On Mon, Jan 18, 2021 at 3:53 PM Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> >
> > Hi,
> >
> > after some searching I found this patch from Yocto project:
> >
> > https://www.mail-archive.com/linux-yocto@lists.yoctoproject.org/msg01004.html.
> >
> > I don't know if it's ever been proposed as mainline patch.
> >
> > What do you think about it? Could it be the right solution?
>
> No. While this makes it work on rv32, it does not fix it in a
> way that makes it work on other architectures with a time64
> libc. If you fix it, please do it in a way that works on all architectures.

Ok, I totally agree with you on this point.

So, it is right to conclude that the problem is not in perf
implementation but in the libc implementation?
That is, for example, glibc should define SYS_futex as SYS_futex_time64
in case of riscv 32 bit because of its support to 64 bit time_t?

>
> I had really expected both Alistair and Khem to know better.
>
>       Arnd

Thank you, best regards.

Emiliano

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
