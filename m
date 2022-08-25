Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAC7ECAAA3
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NjUt123zUebsoR8OPhjK9m7SgwI1RCnkG4nH+DL4JTk=; b=KoqrIwEdA/MsnwMpPr3gQ9FcVT
	4twhHHlTNt5Kv8FqzJYgyC4n1cCBWuHsVKdSjuvvTo09Qw9zGxO6c+jR68bIUValTKzv+kkdzB5Lr
	OlstHXLJaXulj1yxMt27DByZgYAH4NNFBCUjsLvuHHqazoGhc3XlVDYwQa/BArOiDrA44EYvhxcif
	gQAnNgWH5ZT/COfiUW64hPVgNjZlq463OHAbd0LYVgSdVo3F2I7i5JtALajT5b6FSUsFNP5dkWl9z
	XhvQQDOFRe1csQm1D3VF6WX3z0X0QWhicJqu5NjQwErJSjCPEsKs9LNWIDp/29gm5hdQ+5rbVAhBe
	bIvIUZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMV4-004Eo7-HO; Thu, 25 Aug 2022 23:43:02 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMUz-004EkP-Va
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 23:42:59 +0000
Received: by mail-pg1-x530.google.com with SMTP id 202so19192133pgc.8
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=wiEsNvz5ZJJ1GrD/uuku1yQ6cApUWHJmUxRfgwiaX+Y=;
        b=i1J1uRnC8rskyL9RmZ21dnnwmWJhw+hHrY/KBDKpL27AP14d3bPb8RFs+rK0TH1g92
         5jwjQmLP821ACk0zKzFz5mlucx3x9MBDrZ9+Yi8SzR6r+kbN3AzodpFoZT0Wm4CXFfd5
         ea3mRvVUf4dgAoDDu9DnghlOAsVsDMySxyedQZ18gdYZD0qL3vd5UT9MJ6TmorkZ3gJ0
         VY+k1X/269JhAdYE86PXZi2+yJAm6GFE22hjB7eqGwOczwz4E6vbUSqwyYS7rrHrn6Qm
         D2GlE7jkMVRtPng1muRhM4AP8BUtsPaQc3K1pztIHhPAscOG7378ml3G9FUSSshFsbif
         cI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=wiEsNvz5ZJJ1GrD/uuku1yQ6cApUWHJmUxRfgwiaX+Y=;
        b=P28cR1vKL/ZLtr1pvKeJm77O2y8CFDvAz9LBxa6ymEf68hcZIqQGK+VWSxd1lPTfq0
         IF92EwxHR0HDoOx/xIPrkusXQYykTMzuysuPpXYMTf93aO/EfBf76N0IFWR/+9ulVPZB
         CPVHIQWzkbufw/BHwQ9DEjYfq/FvwaeyrvqPfBHoGmSuj0LJ8uNW3rQMcPThrKVeG+Bm
         vC6l7qVVf5BhO3by8ryKCYdLM8ic1LTwNeJn10ST5jRXJR4nmtLIDaJFMqHWHdwIM1Sl
         pRxSncv6DgFOnck6CxGaawaR/xdcyvsnuwIAelTNU3Jas9391EzwptxRjmUok7jLs0Tu
         3OQg==
X-Gm-Message-State: ACgBeo2oFtBXtJokx4Cv1kRqYPTAhbI8Uk72Bs4u8/68UlOA1mGnoPW4
	OfOLD4MAAqBBMz2vIzE/LO0WZA==
X-Google-Smtp-Source: AA6agR6PGWwsGBhmDj/mFX/3PJvX0zBuN/lav09rmNgS9vGADrGEKqTtG0egaYFX5YNXBjBnSU7Wsg==
X-Received: by 2002:a63:eb02:0:b0:429:ee06:825f with SMTP id t2-20020a63eb02000000b00429ee06825fmr1138993pgh.606.1661470974202;
        Thu, 25 Aug 2022 16:42:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902aa9100b00172d0c7edf4sm130808plr.106.2022.08.25.16.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 16:42:53 -0700 (PDT)
Date: Thu, 25 Aug 2022 16:42:53 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Aug 2022 16:42:52 PDT (-0700)
Subject: Re: [PATCH 0/4] misc warning cleanup in arch/risc-v
In-Reply-To: <CAK9=C2UGJgu0eXHARkvftf+xbqnTaK2k9Jbz_4WVS8PQpgtaWg@mail.gmail.com>
CC: mail@conchuod.ie, anup@brainfault.org, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, conor.dooley@microchip.com, guoren@kernel.org,
  vincent.chen@sifive.com, xianting.tian@linux.alibaba.com, heiko@sntech.de, wangkefeng.wang@huawei.com,
  tongtiangen@huawei.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-45ccfcad-b9d9-4914-8e07-c7a3581ea52b@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_164258_184648_08359328 
X-CRM114-Status: GOOD (  28.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 19 Aug 2022 09:14:32 PDT (-0700), apatel@ventanamicro.com wrote:
> On Fri, Aug 19, 2022 at 4:32 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Sun, 14 Aug 2022 07:12:34 PDT (-0700), mail@conchuod.ie wrote:
>> > From: Conor Dooley <conor.dooley@microchip.com>
>> >
>> > Hey all,
>> > Couple fixes here for most of what's left of the {sparse,} warnings in
>> > arch/riscv that are still in need of patches. Ben has sent patches
>> > for the VDSO issue already (although they seem to need rework).
>> >
>> > VDSO aside, With this patchset applied, we are left with:
>> > - cpuinfo_ops missing prototype: this likely needs to go into an
>> >   asm-generic header & I'll send a separate patch for that.
>> > - Complaints about an error in mm/init.c:
>> >   "error inarch/riscv/mm/init.c:819:2: error: "setup_vm() is <trunc>
>> >   I think this can be ignored.
>> > - 600+ -Woverride-init warnings for syscall table setup where
>> >   overriding seems to be the whole point of the macro.
>> > - Warnings about imported kvm core code.
>> > - Flexible array member warnings that look like common KVM code
>> >   patterns
>> > - An unexpected unlock in kvm_riscv_check_vcpu_requests that was added
>> >   intentionally:
>> >   https://lore.kernel.org/all/20220710151105.687193-1-apatel@ventanamicro.com/
>> >   Is it worth looking into whether that's a false positive or not?
>> >
>> > Thanks,
>> > Conor.
>> >
>> > Conor Dooley (4):
>> >   riscv: kvm: vcpu_timer: fix unused variable warnings
>> >   riscv: kvm: move extern sbi_ext declarations to a header
>> >   riscv: signal: fix missing prototype warning
>> >   riscv: traps: add missing prototype
>> >
>> >  arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
>> >  arch/riscv/include/asm/signal.h       | 12 ++++++++++++
>> >  arch/riscv/include/asm/thread_info.h  |  2 ++
>> >  arch/riscv/kernel/signal.c            |  1 +
>> >  arch/riscv/kernel/traps.c             |  3 ++-
>> >  arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
>> >  arch/riscv/kvm/vcpu_timer.c           |  4 ----
>> >  7 files changed, 30 insertions(+), 16 deletions(-)
>> >  create mode 100644 arch/riscv/include/asm/signal.h
>>
>> These generally look good to me.  Anup handles the KVM bits so I'll let
>> him chime in there, but
>>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> on all of them.
>>
>> Happy to do some sort of shared tag thing, but it looks like these are
>> all independent enough that it'd be easier to just split them up.  I've
>> put the non-KVM bits over at palmer/riscv-variable_fixes_without_kvm, if
>> you guys are all OK splitting this up then I'll go take those onto
>> riscv/fixes.  I'll wait a bit for folks to get a chance to look, so it
>> won't be for tomorrow morning.
>
> Thanks Palmer. I have queued the KVM fixes (first two patches).

Sounds good.  The others are in riscv/fixes.

>
> Regards,
> Anup
>
>>
>> Thanks!
>>
>> --
>> kvm-riscv mailing list
>> kvm-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
