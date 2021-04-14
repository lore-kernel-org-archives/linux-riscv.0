Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F87FC43470
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 05:55:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22C7660240
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 05:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22C7660240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wqy+/5HkCoKO/J0XqaGQe3jwbLyHYgK+qh9DNZZ/lQM=; b=EE3PtPlKJ3NqyNoYgtUbusp8y
	yWpWMfQwiNsd6nWKtHZKSBg4hDDCUefrYx3n5V/3Hh5aepI2+1xuUhIvyfd/L7pJGq3DkzSHl882m
	sRcu/ZmLbjiG32wsjGa91P0VkdTh/q//B9baiCc+oylNMpEOwNaU/LDMHmm+VGKVjpJMAm5Wo+I5c
	wvJDMyH6X/6bulk6U+82lsvB2v+vVLN4xnPn03mQAFhFeKth4/SsNGagsw8R3KtuGpuG4nR3ex6+h
	orBovDQjkCFTAnVFfBJCW7zPT+Q0R4j9FJjBLOKgfJx7/ixdk6bRFWEshRQvtX/lyktIuC6CmwN6M
	iPTNqHXWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWYUC-00Baby-GZ; Wed, 14 Apr 2021 05:54:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYTz-00Baar-3c
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 05:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=suKFVplHEDGdd0IZVMlkQSClqz6TcOtdB/x48D6wuMA=; b=XgV17PXq1bOp5il4FWdF2zg4Az
 Zo3rc+Axe22PM5XaZNa2UcGL/zFxLTlKhuqVlJLqo+IUfb0c8rR8SQri5UezRu6vSFoXltHuLkxF1
 fj+s471mtNLdcWHfykGkOzWXXTtEwZRIMqSalX3YT0I6d9ke8LaE9xJHTaRMHVl36IG9aOjqgqydB
 kVVuKX/2D+sSAoWOyRosY/GpWOJzVE49JYHjZiMaRY8IjhI08LkkL4MhI03bJc49yQYLzwplrJ1fz
 yv11/nV1kl7EoH+TccyJNQeHidzizll527R2Ho5vyw/1jaYvTixErGHOFuqvg5ccT5ggplGlKZe76
 FRvoL7IA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYTw-007VWZ-Gy
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 05:54:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49354608FC
 for <linux-riscv@lists.infradead.org>; Wed, 14 Apr 2021 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618379671;
 bh=e0GvAqItKrgC7xw+mYTZm1jWGWMl1RtZC+QudRQVvVU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AKyiMYAOp5u74Mfl8iLk7Sxh1yYch8Aicyz+bYIOBK6sJoTIco/QV2z1X/6ORQ8RO
 k13lHshi4pwQIEK3wXLN66kASyFjysW5HY5pK0v0qcksfMY1EgbEgAkDtK2uijwBU3
 uqLHomJ8D0hoNH0oaTyWU4NiyrcofypIE3IdiMVV+L1fAh8kNLtZpgeatZBL08UsxG
 x8u/OfJL3M/2EA6xntC5qiD/LPkeDXPjBryw2h8selY9QFa9MPqXpGUUe6Bjm2khZK
 vJBITiYaZMmWPlmUH62OTo0xpRX7sC30OeZTrkKNNi6CbJRVp5uM/o8ut0p+ILEGjL
 JMLwk0dKJ0V/w==
Received: by mail-lj1-f172.google.com with SMTP id r22so11294292ljc.5
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 22:54:31 -0700 (PDT)
X-Gm-Message-State: AOAM530zLGrUH6FvORi91mICnbix0IUWz9pFvYNXJXYYnRyNQT1/ro5d
 RA8PKQ/3JbKZC/72x0rOW8Ktdixz2NZT0AMFY9E=
X-Google-Smtp-Source: ABdhPJzLhQOFkp2cNfza5RPwNjXsLt4AjtmrFdQ9MA3JHT7YIse6wTSnxKU/n/GZ0uYgcHLjxzwDlxV5nnIYOxZkYsU=
X-Received: by 2002:a2e:919a:: with SMTP id f26mr22943414ljg.508.1618379669738; 
 Tue, 13 Apr 2021 22:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
 <YHVl8fFfdQDn+QYW@hirez.programming.kicks-ass.net>
 <CAHB2gtTzEuD7j-+5ztui0eV6UNiEisBTgoK+2Sr=Z0b4PPXRyA@mail.gmail.com>
 <20210413104503.GD15806@arm.com>
 <73cab48b63ea4ba3b1ef532f47d146f4@AcuMS.aculab.com>
In-Reply-To: <73cab48b63ea4ba3b1ef532f47d146f4@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 14 Apr 2021 13:54:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTE54rDfFeVGbc0BL7br3hy+6oN6KMFQDx5+aKPSSviKw@mail.gmail.com>
Message-ID: <CAJF2gTTE54rDfFeVGbc0BL7br3hy+6oN6KMFQDx5+aKPSSviKw@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: David Laight <David.Laight@aculab.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>, 
 Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Anup Patel <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 "will.deacon@arm.com" <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_225432_624359_C000F51B 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue, Apr 13, 2021 at 6:54 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Catalin Marinas
> > Sent: 13 April 2021 11:45
> ...
> > This indeed needs some care. IIUC RISC-V has similar restrictions as arm
> > here, no load/store instructions are allowed between LR and SC. You
> > can't guarantee that the compiler won't spill some variable onto the
> > stack.
>
> You can probably never guarantee the compiler won't spill to stack.
> Especially if someone compiles with -O0.
>
> Which probably means that anything using LR/SC must be written in
> asm and the C wrappers disabled.
Agree, and cmpxchg has been widely used in Linux. I think it's the
last requirement for complex atomic API, although cmpxchg has ABA
problem:

CPU0
                          CPU1
=======
                        ======
do {
  old32 = load32;

                               *ptr32 = new32_tmp;

                               *ptr32 = old32;
  load32 = cmpxchg(ptr32, old32, new32); //still success
} while (load32 != old32);

That means cmpxhg only cares about the result but not the middle
situation. It's different from LR/SC or AMO instructions.

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
