Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAB6C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SffAuMQmvC1X2oJMakYpPBIA32J0Q1VS33ujI8m5yfw=; b=ye/sy2OQ1uOMV0bL2K1lx6Ql8R
	OfBSOrjaaA4V0IR4VXrBi9RbLxxMLGmldtvxvNG0tlM5I7M74dzpGRH9dm5Wh+fmnawu/cjpjic5f
	Koh0Ko/4JUoqOq9CVgAyLp65FUCEouohz6gSL9QZr4FsXzFbGS3aaony8GCa81bQObpQE6ViIamf/
	iVYyRSOHFbFlszCbpDyTn7y2Y4Nq7ccLgafEM5GHgX+qTy+Nhh3AW5NRTqiqJJv7DbM25Dwa7+a6W
	gI/kEOqHKnrNxJzMMqlLiiFqPhuYHMJpJOqiz0C1QpqiiOVzqniUsES2kE+0U5OFrd+Ikr9dXYAAN
	lPZflCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRnX-00E8Tb-0R;
	Wed, 30 Aug 2023 20:28:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRnT-00E8T2-2c
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 20:28:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68a3e271491so64072b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1693427292; x=1694032092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2H63ybEH+lPLnjbRem1hfLY4KNPeQB3OU4MI7nLoWg=;
        b=HAlZjdHBPCpOl8bn9JGYE0y1z2PhFUnDsH3mzOts+Qxzh+JmILaqmbSoyuGYHONxlW
         EqPV45ooT/i9FQ+nNAhPiEVX35hv5LJR8yh95ZsIRLo3k11L6kWrZOtX8AnEXZ3Z6ajG
         WKATq3pvMKsMZiVPJDqkpsWh1iFfS1Yp9T4jOdaIMHNPc2BwO9RYRlOylAUPgQKkGNuO
         1cCLtn2+/EbYy4a02u4YLeDiVo9RoT19Mt9OmYnCFHEj0b+FTGmiOD11ZLqcAZyBP2YV
         FAAmS6cIK4EJIhnrIZZaFfQ/VvH71RltsDOcmDr3Gqp78YyR8/rup/pplNTK3oNaDPBo
         TznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693427292; x=1694032092;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2H63ybEH+lPLnjbRem1hfLY4KNPeQB3OU4MI7nLoWg=;
        b=b8N6hZg0oJyhSJAfxY8wFI+NoncSnzdyXBJquBpJ0vUJCG67SqTSW654otNfuejijQ
         vas7s0blsyzax2tD4gwoYwSavjWYQc6cGiW7XEwyAcRZWWfSLAcf3y3+5B9qx+q7pllH
         GumpVfYE8srB8IHk8bVCr8ogIwRktSAZyZ/6uuS0NDrT6pNL1IDL538EBCYJYMwbJi4o
         5G6yso5e7MpShyNAolYT9vbVCDd3rInBULasMjUb7OwMt6dtzKEZZt8vL+p3wFcI+gE8
         BGTupwovvO4k8HJT4Wrkh6q3bWxIakP00DdeEZyCsVqxqutFrXZexBuIVp7vEa6q9hVu
         a6tw==
X-Gm-Message-State: AOJu0YxUKqfKBd06PxEZlhz1QK6CktF2FkrroXjirIQedSffh+90QXm2
	pWgqR6czBl45Drit+nPWntkN06+5ubTlK3q5C24=
X-Google-Smtp-Source: AGHT+IETF/XjrvlG+qMkslo8rJxuvOSm2p06PzHhd1BO9VEFGIEGZyORqVGQBET0z0LS1WicKofMkg==
X-Received: by 2002:a05:6a00:2345:b0:68a:6926:78ac with SMTP id j5-20020a056a00234500b0068a692678acmr3676116pfj.22.1693427292546;
        Wed, 30 Aug 2023 13:28:12 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id a19-20020a62e213000000b0068893a5a848sm10435515pfi.184.2023.08.30.13.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 13:28:11 -0700 (PDT)
Date: Wed, 30 Aug 2023 13:28:11 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Aug 2023 13:28:05 PDT (-0700)
Subject: Re: [PATCH v2 0/6] RISC-V: Enable cbo.zero in usermode
In-Reply-To: <20230830-367b41474b33b230aa3f0c3a@orel>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-dd123a54-663e-48cc-b7f6-621ceda30cda@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_132816_037543_BCFCF994 
X-CRM114-Status: GOOD (  20.65  )
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

On Wed, 30 Aug 2023 09:52:46 PDT (-0700), ajones@ventanamicro.com wrote:
> On Wed, Aug 30, 2023 at 06:49:55PM +0200, Andrew Jones wrote:
>> In order for usermode to issue cbo.zero, it needs privilege granted to
>> issue the extension instruction (patch 2) and to know that the extension
>> is available and its block size (patch 3). Patch 1 could be separate from
>> this series (it just fixes up some error messages), patches 4-5 convert
>> the hwprobe selftest to a statically-linked, TAP test and patch 6 adds a
>> new hwprobe test for the new information as well as testing CBO
>> instructions can or cannot be issued as appropriate.
>>
>> Thanks,
>> drew
>>
>> v2:
>>   - fixed build of the vector selftest
>
> for-next also needs commit 25696067202f ("selftests: riscv: Fix
> compilation error with vstate_exec_nolibc.c") in order for the vector
> selftest to build.

Thanks.  I'm going to hold off on this one for this week's PR and then 
pick it up for next week, assuming no other issues crop up.

> Thanks,
> drew
>
>>   - changed this-cpu wrappers to just cpu wrappers and then pass
>>     smp_processor_id() at the callsite
>>   - added comment to EXT_KEY macro
>>   - picked up a couple r-b's
>>
>> Andrew Jones (6):
>>   RISC-V: Make zicbom/zicboz errors consistent
>>   RISC-V: Enable cbo.zero in usermode
>>   RISC-V: hwprobe: Expose Zicboz extension and its block size
>>   RISC-V: selftests: Statically link hwprobe test
>>   RISC-V: selftests: Convert hwprobe test to kselftest API
>>   RISC-V: selftests: Add CBO tests
>>
>>  Documentation/riscv/hwprobe.rst               |   6 +
>>  arch/riscv/include/asm/cpufeature.h           |   2 +
>>  arch/riscv/include/asm/csr.h                  |   1 +
>>  arch/riscv/include/asm/hwcap.h                |  16 ++
>>  arch/riscv/include/asm/hwprobe.h              |   2 +-
>>  arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
>>  arch/riscv/kernel/cpufeature.c                |  10 +-
>>  arch/riscv/kernel/setup.c                     |   4 +
>>  arch/riscv/kernel/smpboot.c                   |   4 +
>>  arch/riscv/kernel/sys_riscv.c                 |  46 +++--
>>  .../testing/selftests/riscv/hwprobe/Makefile  |   9 +-
>>  tools/testing/selftests/riscv/hwprobe/cbo.c   | 162 ++++++++++++++++++
>>  .../testing/selftests/riscv/hwprobe/hwprobe.c |  64 +++----
>>  .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
>>  14 files changed, 280 insertions(+), 63 deletions(-)
>>  create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
>>  create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h
>>
>> --
>> 2.41.0
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
