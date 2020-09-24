Return-Path: <SRS0=cKew=DB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9B1C4363D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 16:04:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53D5F2388A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 16:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYTnFThK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="hzTI5ClF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53D5F2388A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2zGh/bSDzlreOD3C7UPuvYzZiQuUzHJEnKzDRO0l18U=; b=TYTnFThKoePDwitkceANTdjYm
	f8/PiIfQqNgaGoRzl04smjup9Hla+5tic2hlEPglpDmwby2Cvt/nUawZ2T++D2y8my4OTouGRniiK
	o03e7bhwlchrQ3M8s951AARVzv+1BwBgNaZQ+ZS+ECRsaOarBVcNss7Ug80+upqC4IDU4zkqDyjn1
	FaXQom+tGoOEOjPZ9tK4Zwtvqyp7idV7d/wtj6qubNpR8EWSa8uohYAAK9eORoU+E7ULCRZwl3gBG
	91BXJfo4hLQCQlUQzcz/n8dbJj8FdFdh0904PnY1u9yQghPHt6Sv53m4a41YKHDQFzlOV9Mp2VDh8
	4Nkg8CBgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTjY-000272-F1; Thu, 24 Sep 2020 16:04:36 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTjT-00025r-U6; Thu, 24 Sep 2020 16:04:33 +0000
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 08OG3umH021486;
 Fri, 25 Sep 2020 01:03:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 08OG3umH021486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1600963437;
 bh=9ee9VwwvdZUxUdcXkkdp1U0lx4DpuWOQMZvDwgytdP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hzTI5ClFT4hOzIoN61jwlSFslzZdSjOWWXR+OdW95+DN+iQjYnA0h0WUtB5ir816s
 +DZ87UAF+nIACgqkwIw4F9pB0RMs1ARNQnZ4wFcSQGRMvfJthFhuGd/ENCPHOENHuh
 octp/bzp1hYU7SieXdp8Wf8kOOIRC3q0kMMR+lkPNoxHYcUfwQ7enFrI2lNYZ4K/LV
 gY9Q0QWN0Mw/Cl3KeRn0ZGc48MJPMumbOKVzGFiExWK6dhJe1YOlO3W3WCSsJW8CB2
 QDxuQfR6FNom+nQiZKHYiceUnq0wFU2t6828TZmfd13Es7qIWNtebAxMt9+XnooEz8
 GPoSxtqBHqrCQ==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id u3so1836730pjr.3;
 Thu, 24 Sep 2020 09:03:57 -0700 (PDT)
X-Gm-Message-State: AOAM532JRihs+G0dsToDM3yGwcwPXb0bWRwRvggaRRFfjypV0K1CMuiP
 mUPlyUXoInZ/Hah/ujgApDE8jCiO8mmvUyLIVhs=
X-Google-Smtp-Source: ABdhPJyETrEzNzrVd1OXy91uCC2rbMXAsfzVerHQYhaGFjYLlItBVGJOuJ4Yzsw08mGvCA0s2iw7gEeNxhCwz3+/C+c=
X-Received: by 2002:a17:90b:208:: with SMTP id fy8mr27540pjb.153.1600963436461; 
 Thu, 24 Sep 2020 09:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200922232140.1994390-1-morbo@google.com>
In-Reply-To: <20200922232140.1994390-1-morbo@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 25 Sep 2020 01:03:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATjf+bVqkkoZgwu9sr-A+VXxEnW_R8nEwmH=aDEU6NAQw@mail.gmail.com>
Message-ID: <CAK7LNATjf+bVqkkoZgwu9sr-A+VXxEnW_R8nEwmH=aDEU6NAQw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: explicitly specify the build id style
To: Bill Wendling <morbo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_120432_283914_E118C729 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, bpf <bpf@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 Networking <netdev@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23, 2020 at 8:21 AM Bill Wendling <morbo@google.com> wrote:
>
> ld's --build-id defaults to "sha1" style, while lld defaults to "fast".
> The build IDs are very different between the two, which may confuse
> programs that reference them.
>
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  Makefile                             | 4 ++--
>  arch/arm/vdso/Makefile               | 2 +-
>  arch/arm64/kernel/vdso/Makefile      | 2 +-
>  arch/arm64/kernel/vdso32/Makefile    | 2 +-
>  arch/mips/vdso/Makefile              | 2 +-
>  arch/riscv/kernel/vdso/Makefile      | 2 +-
>  arch/s390/kernel/vdso64/Makefile     | 2 +-
>  arch/sparc/vdso/Makefile             | 2 +-
>  arch/x86/entry/vdso/Makefile         | 2 +-
>  tools/testing/selftests/bpf/Makefile | 2 +-
>  10 files changed, 11 insertions(+), 11 deletions(-)


Applied to linux-kbuild.
Thanks.

-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
