Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243DCC00140
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 02:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aSvQz0DG8bhknOlzBAK6wel6xsOMVuebCpOd6QnVHpg=; b=IQ5q4dFyHDMDwD
	r8bARWZT8kLVpKuOYgoeBHYvYBH5Mk+nWOLq+p5hcjWMe7/zeGabQflkv6bFlrAo8h6UDGF9+cD5G
	HDMu8Bq8ZoHaBlBDpsm+4MPprbcGKF52Spd4wCy+DUpMOapMNOe40r537TJeECMxbyaHX+XsAhwtB
	osfRlEgdY7ez0zbe6N5q/04ATC537BU24Ax1eDK8xcFjJ5laz1bF80dJUXt1pUZXlQ1IIhPPLr6Bg
	58aKmNa30773Tp2WhHow6Yfk9OZbAHU38wxDm0gSUtPqfS/WiIWRrPXf9L5AQZxg47WC62RezIY2+
	8qa2TCuRhlcLTcFBifLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLFRx-000dSb-2W; Tue, 09 Aug 2022 02:58:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLFRt-000dQ2-6l
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 02:58:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C445BB81144
	for <linux-riscv@lists.infradead.org>; Tue,  9 Aug 2022 02:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86018C433B5
	for <linux-riscv@lists.infradead.org>; Tue,  9 Aug 2022 02:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660013906;
	bh=vY5ylUkzROKwy6ry3674cLxiF3l1xgYFwsMymQ3/CTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R8BvOq/2UB9nvzN0NTUl0Ua9w1FdnAGpPjzhHZajA4xbD3NrKkwByj3aeAQ37TVrX
	 stsuOdxBc6zfiTAVYLi+5we5azJSs55v0zRZALYRKQttF5/P44aEBZvT1NpykBDCcT
	 OCDcFnx3hFLOHtZwNokPc84wgz1lhYH1rTMXlYpbe0v25AfC589E/2LqB/eLEAp5IC
	 o66iwu2s++KkUVIpL47K+iX/WyMJ2+GZPfJlYwTUmVfS0HsPeSrn8zKqi7VLWJhwzd
	 Kq4LDTOvA08REc/NqzmcRGcxaL+S4DWwJaEDExZZlukJNb4ZHwSfEHqYJpT854i3x2
	 qK0DFeZlO8ouw==
Received: by mail-ot1-f47.google.com with SMTP id k29-20020a9d701d000000b0061c99652493so7713397otj.8
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 19:58:26 -0700 (PDT)
X-Gm-Message-State: ACgBeo2sOwP2jFpeCbOgB9fvnWV8Fhj5YRe0TYI7a9yoMhAWEq0hf+Q0
	CUXYKVLhatIw/9yStr96zvAvHoiKq3/UvnBiXHA=
X-Google-Smtp-Source: AA6agR5lND1hBBqkzDW8S6KaZCUwopF2Nn6/QDh4BK6hrBv+XTSLq99vu0sFJBLe9j6l/fXE+mioK2Jp5R7Gv07KeoQ=
X-Received: by 2002:a9d:b95:0:b0:637:9c9:864a with SMTP id 21-20020a9d0b95000000b0063709c9864amr606716oth.140.1660013905660;
 Mon, 08 Aug 2022 19:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220808080600.3346843-1-guoren@kernel.org> <20220808080600.3346843-2-guoren@kernel.org>
 <alpine.DEB.2.22.394.2208081119230.411952@gentwo.de>
In-Reply-To: <alpine.DEB.2.22.394.2208081119230.411952@gentwo.de>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 9 Aug 2022 10:58:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQhLYCtuLwjXREPG5ibL+biGEgFQaE6x+9MXRG_8F_+WA@mail.gmail.com>
Message-ID: <CAJF2gTQhLYCtuLwjXREPG5ibL+biGEgFQaE6x+9MXRG_8F_+WA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] vmstat: percpu: Rename HAVE_CMPXCHG_LOCAL to HAVE_CMPXCHG_PERCPU_BYTE
To: Christoph Lameter <cl@gentwo.de>
Cc: tj@kernel.org, palmer@dabbelt.com, will@kernel.org, 
	catalin.marinas@arm.com, peterz@infradead.org, arnd@arndb.de, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_195829_612730_EF697D4B 
X-CRM114-Status: GOOD (  22.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 8, 2022 at 5:31 PM Christoph Lameter <cl@gentwo.de> wrote:
>
> On Mon, 8 Aug 2022, guoren@kernel.org wrote:
>
> > The name HAVE_CMPXCHG_LOCAL is confused with using cmpxchg_local, but
> > vmstat needs this_cpu_cmpxchg_1. Rename would clarify the meaning, and
> > maybe we could remove cmpxchg(64)_local API (Only drivers/iommu/intel
> > used) in the future.
>
> HAVE_CMPXCHG_LOCAL indicates that cmpxchg_local() is available.
>
> The term LOCAL is important because that has traditionally signified an
> operation that has an atomic nature that only works on the local core.
>
> cmpxchg local is used in slub too in the form of this_cpu_cmpxchg_double.
1. raw_cpu_generic_cmpxchg_double don't use cmpxchg(64)_local.
2. x86 and s390 implement this_cpu_cmpxchg_double with direct asm
code, no relationship to cmpxchg local.
3. Only arm64 using cmpxchg_double_local internal, but we could remove
the relationship from generic cmpxchg_double_local. It's a fake usage.
So maybe it's time to remove cmpxchg(64)_local in Linux and replace
them by this_cpu_cmpxchg & cmpxchg_relaxed.

>
> But there is the other naming using this_cpu.....
>
> Maybe rename to
>
>         HAVE_THIS_CPU_CMPXCHG ?
I think we should keep 1/BYTE as a suffix because riscv only
implements 4bytes & 8bytes size cmpxchg. But vmstat needs 1Byte.

>
> and clean up all the other mentions of "local" in the source too?
Good point, I would try. How we deal with drivers/iommu/intel/iommu.c:
tmp = cmpxchg64_local(&pte->val, 0ULL, pteval);

Change "cmpxchg64_local -> cmpxchg64_relaxed" would make them happy? I
think they are cmpxchg_local & cmpxchg_sync users.


>
> There is also a local.h header around somewhere
Yes, thx for mentioning, I missed that. The alpha, loongarch, MIPS,
PowerPC and x86 make local_cmpxchg -> cmpxchg_local. Most of them are
copy-paste guys, not real users.


--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
