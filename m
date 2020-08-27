Return-Path: <SRS0=FYRI=CF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4395C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:23:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A429622B47
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:23:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zqk6VrxQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="amAWIrNt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A429622B47
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uT0y6Vp8RJEYH92SsMrItFEQdjaOdMkxloPup8yiayU=; b=zqk6VrxQKuxqg1CFpXY88Y6Bg
	17qnvbINtzCX6Y1YnFLGiTDPzfw7brBjnI/LzNsqwlGY2lXu3YI1ohsQyOu0+DhlsVRMAdPCJXEh/
	dkeYKfwrPeq1IeiTMEiLlQCEpMUkZ+VThxByhrNvKnfutg7x+CWPfGxKxV4MDxeCCe5TYUZ0y+WWI
	8cYbdrj1PVh+THr+GGQ+AAVvX7vYvCdwKr9oykAb/fNrN+vYTd7NZ7z9eeRBf77z/hEG2g2St/H30
	5x95RVQ0uG+py89H/gv/X7hTKsm1HJEf49Q+5Mdcp/7gU8Qp3Kt1bxnDf8nKcn40y4l+057IfSNbj
	CQt4nDcfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDBU-0001FA-7k; Thu, 27 Aug 2020 08:23:00 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDBQ-0001Cs-Sl
 for linux-riscv@lists.infradead.org; Thu, 27 Aug 2020 08:22:57 +0000
Received: by mail-ot1-x344.google.com with SMTP id k2so3752076ots.4
 for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2020 01:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VGJWcpN1ntTu98dcskn67ut+Ep3J0JtQnookryJIizM=;
 b=amAWIrNt1eTgYWi1kEAYhttdOwvSYssVqMFE49HSWbPuMy643K+dkGD3bna/Us80Zq
 Uk017raHDRDEhceG/BxRvXmSVqLrXXLuZTZcUCDzpHCR6T96a/ubnk/BFHjzqQyTz2ou
 Ca0WTwo+dhAHPqnzH9mTLuwG53ZOg+BNpfT81/1/iyL1y3/XJThWHOSP9Y3L2siWfs/r
 lTXxXnJAaB9ejlUcF+Yll0eDOfDTeXtH2/L4hJgIRxb5l89JnCZDlMMj5hTgs4HiwJ4k
 KSpQf7CjjVAWAdMQ7YMp/kvh4D4iXBqO9441k7a78o7z+X8vyPE90UJE8Xp7faNsgUjh
 nFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VGJWcpN1ntTu98dcskn67ut+Ep3J0JtQnookryJIizM=;
 b=BOB4yKyGYZLgWT6swo1pj/m3NFjKZfzYgEudbiPgCv0O4nv1cNhnN6+YWhaURASWo+
 Zdi7paWFZb1R7PNJqmyh4Fi3n7UDLrXeejyBtKC9t+WLR4zzgHuN6IPqfSsiG41traHe
 khXKWbyL0xghwKYROnS1uM13VC8XfaSRW7OzSczoi+vG0nnpUV4MKRqdCTog+qxdVR/h
 AtwMtvqdFwjOQiZMCMgith/wUbmJ8KTNkB/C5gzWAsWMjzuMlRSl0FtS1oAC4Uy3ygnn
 +sImogFdOkTVv9yGTzww/dG5e/sLWRWBcKdTBvVrnSprXparGBmJxNvxsaCWV3QAozQk
 DjRg==
X-Gm-Message-State: AOAM5312lavNQH6mQH/tVV6aX0M1kbxe9XjyEEIZgfovNhIO3VevJJ35
 eTXmdnm0uSWNXR/yrYByAf+4pJwVysuDpJPL8kzPFw==
X-Google-Smtp-Source: ABdhPJwbvObRJv75xg6Z4J9EmesdTOtkbN7G+0jBQXvEjsAG3ZnZD+wmPOQx+5bZgJg6Xy9KRD+xu13pah/sJ5hEnpM=
X-Received: by 2002:a9d:58c9:: with SMTP id s9mr13183617oth.127.1598516574712; 
 Thu, 27 Aug 2020 01:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593766028.git.zong.li@sifive.com>
 <mhng-ec05108e-fd03-44c2-992d-649e967f86f0@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-ec05108e-fd03-44c2-992d-649e967f86f0@palmerdabbelt-glaptop1>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 27 Aug 2020 16:22:43 +0800
Message-ID: <CANXhq0rbKJFHgVCQzXDAmSOi6KjCcwE583tAVF7TNLTpLsiTSQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Get cache information from userland
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042256_978107_A1F45B24 
X-CRM114-Status: GOOD (  20.13  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 21, 2020 at 4:45 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 03 Jul 2020 01:57:52 PDT (-0700), zong.li@sifive.com wrote:
> > There are no standard CSR registers to provide cache information, the
> > way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
> > AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
> > could use them to get information of cache through AUX vector. We
> > exploit 'struct cacheinfo' to obtain the information of cache, then we
> > don't need additional variable or data structure to record it.
> >
> > We also need some works in glibc, but we have to support the function in
> > kernel first by rule of glibc, then post the patch to glibc site.
> >
> > The result of 'getconf -a' as follows:
> >
> > LEVEL1_ICACHE_SIZE                 32768
> > LEVEL1_ICACHE_ASSOC                8
> > LEVEL1_ICACHE_LINESIZE             64
> > LEVEL1_DCACHE_SIZE                 32768
> > LEVEL1_DCACHE_ASSOC                8
> > LEVEL1_DCACHE_LINESIZE             64
> > LEVEL2_CACHE_SIZE                  2097152
> > LEVEL2_CACHE_ASSOC                 32
> > LEVEL2_CACHE_LINESIZE              64
> >
> > Zong Li (3):
> >   riscv: Set more data to cacheinfo
> >   riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
> >   riscv: Add cache information in AUX vector
> >
> >  arch/riscv/include/asm/cacheinfo.h   | 14 +++++
> >  arch/riscv/include/asm/elf.h         | 13 ++++
> >  arch/riscv/include/uapi/asm/auxvec.h | 24 ++++++++
> >  arch/riscv/kernel/cacheinfo.c        | 92 +++++++++++++++++++++++-----
> >  4 files changed, 127 insertions(+), 16 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/cacheinfo.h
>
> Sorry, I lost track of these.  There's a little issue in #1, LMK if you want to
> send another version or if you want me to just fix it.

Sorry for being late here, I have sent the second version patches to
fix it, thanks for your reviewing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
