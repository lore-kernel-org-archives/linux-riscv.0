Return-Path: <SRS0=IhIj=4Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED532C3F2D2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2020 23:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF4262469C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2020 23:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="te0wHLPp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ka2sNPSZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF4262469C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0qEnQNDgP8LJynRt0m/ZmXhR+8sikFtnuLmVPIQx31w=; b=te0wHLPpwATjfBaVTnb6osOzo
	zxiP53sTeZixn/C7Vkqyg91LFi+IedF2zRgWRlP7ZVmAmHW1Z0HMG8m8t3Mw4oi3sZuwMDoyj5xuy
	of0cXYO5zCxOT5zeyPj6Q2z2AFH6HQlFefhcW99L32q/HeNMxFGrcn7c3Pl31bOLPjnBoGfbg2f/T
	qKqZZEryJHxRGRTUJIev2aaFuXtRfOMg1rm2sWMzhcfDWh/A34PONyyh0Ur6Ae/sZPGB/AWqiEwcL
	HIR6tqIxudLBN08z4vgb380U7ZlyFKOswWtXPyecIJXayf/BtnEMe9kp3s3GCIpD57urVK/qTVGgB
	B0FCvqo8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7p6P-0001td-M5; Fri, 28 Feb 2020 23:31:29 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7p6M-0001sh-VU
 for linux-riscv@lists.infradead.org; Fri, 28 Feb 2020 23:31:28 +0000
Received: by mail-pg1-x544.google.com with SMTP id y30so2262274pga.13
 for <linux-riscv@lists.infradead.org>; Fri, 28 Feb 2020 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0qEnQNDgP8LJynRt0m/ZmXhR+8sikFtnuLmVPIQx31w=;
 b=ka2sNPSZKEsOZQVDkpUr0tRQzHXiIU3qQVAxFe/mbu9RINpadUTVv3jAPCnWBQzs6b
 nRVS6wmmSOzG+WaWzNP1zeuT9pLIRhNdLwWAcOP89sWRCv/5lCkttkfSFqBT6kLdqtKz
 DTvf354hrkEQQ10KxYlvZmMBo+GchNkjg7eV0+br4cR2YqG8ciC9XbK9tRyvZxsR9uuv
 3l9ZsISYop85HRWgNv3UlpTGgMCC6FSOYURJXOgoiGwRRFaSCLQB3aC5G0BHRpvvImWb
 yPj+CWowB5dvshSQq1hIANbQyqyLK1AWac/Xy64EASS11DSEJuLaOwk49QeSblFpkWBz
 0I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qEnQNDgP8LJynRt0m/ZmXhR+8sikFtnuLmVPIQx31w=;
 b=kJvcL9wGzI26F6i2r8Qy6G3Vm5UysYnX2YeAcasrzshlk+WUItZDpOcZ+qphsEdBcE
 9ZWH4e+8wU6bf5t/u9zWmILJv0Vv0JMboyudD65P9PbbLiliSoh2cWmsBuiW+7GRuM0R
 dbnJLfxKezMhZkBYBXyS0LDN2TTXGtcikWvIesJ+bS+6HcdsyGJWZ+v/RrsyKWjnT1Kl
 x55l2b9gN/dvCvF0GIlOb9CvsW4745NpO9bCQilGKpXl82vGZNto5ijnSE8cPbg96tQG
 uIJIpijAW2VS42tzyfO5SEkYwgJRFw4YQ0gXkKZxEgwWF/NFxl7vd70sUVDmTBpBJt9T
 dlGQ==
X-Gm-Message-State: APjAAAWvSLTMq5bqOSCD0ag9zlRBmOTv/9v1s2VFjDMIISK63ovUh9X/
 SrxBCsAXVOlBAQE7FdjgktKNjtb/hxcQB4t5yuZH5z6o
X-Google-Smtp-Source: APXvYqwLoxZG4PjQqTMI5TG92NFMtF0pbxDsIXEI70KM2S+luu+lmbsL4X/vOvr8P/+UepVwgSa54tkbXjngn8mCk3Q=
X-Received: by 2002:a63:4e22:: with SMTP id c34mr7112819pgb.263.1582932684269; 
 Fri, 28 Feb 2020 15:31:24 -0800 (PST)
MIME-Version: 1.0
References: <20200227213450.87194-1-palmer@dabbelt.com>
In-Reply-To: <20200227213450.87194-1-palmer@dabbelt.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Feb 2020 15:31:13 -0800
Message-ID: <CAKwvOdkgpvxCfBQNDaaZ7BpGsQqwkoukp=nAUhnoLC_nZTR5gg@mail.gmail.com>
Subject: Re: RISC-V: Fix the build on LLVM-based toolchains
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_153127_033144_33BF9909 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-riscv@lists.infradead.org, kernel-team <kernel-team@android.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 27, 2020 at 1:35 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> The RISC-V LLVM port has progressed to the point where it should be able to use
> it to compile Linux.  Unfortunately we ended up with a few GNU-isms in our port
> so that doesn't work out of the box, but I don't think the code without them is
> any uglier than the code with them so I'm happy to support both toolchains.
> There are still some issues using the GNU assembler to compile clang's assembly
> (at least got_pcrel_hi, but there may be others).  I'm going to call those
> binutils bugs, though, and chase them around over there.
>
> While the first one could be considered a bug fix, I think the bug is unlikely
> enough to manifst that I'm going to wait for the merge window for these.  I'm
> going to preemptively drop them on for-next now, but as I haven't really
> started building that branch they'll be rebased (my current plan is to start
> taking 5.7 patches on top of rc4, as it seems like things are shaping up to be
> fairly solid on our end).  If there are any comments I'll handle them as part
> of the rebase, but I'd like the various autobuilders to start chewing on these.
>
> Unfortunately the kernel compiled with LLVM doesn't boot for me.

Thanks for the series! In general, our approach for bringing various
architectures online has been:
1. get it building
2. get it booting
3. get it running well

For most architectures, 1 included 2 (per chance).  Mips was a notable
case of 1 not including 2 due to undefined behavior we found and
removed.  There's always a chance of compiler bugs, too. With the
above series, we should now be able to start digging into 2.

-- 
Thanks,
~Nick Desaulniers

