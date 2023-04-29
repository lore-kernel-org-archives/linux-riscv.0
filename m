Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32BAC77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OnZdvMFi53Ou2ghWoSrFDIyQDRe04chep+Lu2dbF7B8=; b=wtm4v/FlrpMYtejC9ySRPOPKgH
	kLLZhCUIO0yJqjc+aZEB43hFHrNRrJmgoac7HYFT4JkppbomALOrIUjgcxb5SZbpBeIJ2Tkotb56v
	xLR/MBCqmuxYjnSNietBrZjDO+3mOqZY4LE6C3cBdpYqxY3u6ksgT8hHh2a8ri1CmScLjRIh2rtGh
	hbyRWmcPMfS3DfkI6r9hDsm4LZ20rFFLSvSWQMzEKm5SNBUMlOGMkGAFxhWwO5KB6+emFbkYXOZoX
	TfjQ7scqBN7RfYk7t0Hf2hx/PvGM/kGMg95fSJmFb7nAgomYSiGgt6Utry5IpgHk/2ruVlJJpIOB8
	QumYwIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psr0t-00D65i-1V;
	Sat, 29 Apr 2023 20:17:47 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psr0r-00D64s-0L
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 20:17:46 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-517bb01bac9so737150a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682799460; x=1685391460;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFiB6ytrVKj/f6xCbTDWl4yWJ/Q1XjEK8T+2S6imf1E=;
        b=ckhI7YSalDo0gVPkZX3y0qPl1uNA7CqFa8/4xrOteEHCuf72A+45+dISdfdHAgH8c9
         Cbq3t/XsjCWSqvq+BtsjcNK4uftpXQuhhKN0dPy3ZX9fF3YEeX3iWRzpD0npnJBfk5bz
         PsjLBnDcDY8E6q+14CLo0YpidmB++p2/IXze6+aao6dOYy6KeVn8b9u2fEu6lriZNest
         PKcREt/kS+uzBkXRPehfASAD7lDgkT//MnOdn2lHVXy6D8QFm57lSMFLFsCk4/hmR3qP
         g9nJb7ydjGYhip6eoC+pWvOy4tJm/p76YJY0OsmLe0DGpfWutGkk75eUfK479JUFE1Ej
         hBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682799460; x=1685391460;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFiB6ytrVKj/f6xCbTDWl4yWJ/Q1XjEK8T+2S6imf1E=;
        b=C9YvdIMjk8stux5ZP7jmG2rZ8uPl/25UgwUb54LEeX0YmvjzfbysL1W5UTg/ptUhzW
         JCe+US+GR3s9HsqrX4+YQW1w/0Bx+QDbHO4ds+ABrAY7/4HcHzWTDAQnG1SOpDjk+HNJ
         B6yiVGlIv8cxKTvrIFPVOLoGJWBJZ/NyE7nKDbD3DyFaF8tvx4TVzR4S2uH1qDc1wm/t
         kSEhO9ObVs/oQBpkRlxCQxgS72dXrIbDpDD6mmoNbYX1ggExOsElPM8dD3/UgX+Qptb2
         trxy67kmfTww9eAhWRWp4Q4UySgqTaUM3CoDzRk6fmh49bfOH8tXgFlYIVSANxWUn3WW
         5+bg==
X-Gm-Message-State: AC+VfDzUpnO3Of9MGdoLCYcvdkjxyNFqwkqiPP+vT/ZMVPWArtc8lnwe
	GbyrCcBx/GtOQBjPbe0hJ3U3JazGVDDS0qxw1HTF4A==
X-Google-Smtp-Source: ACHHUZ49aJWNY1E5qUu3lujxh4rbVwp8/wmyvBrQN0Vd47cPc3ONhq23W7fKGmFhRbb61OlkDqx+zQ==
X-Received: by 2002:a17:902:ea07:b0:1a9:baa4:8681 with SMTP id s7-20020a170902ea0700b001a9baa48681mr9261344plg.24.1682799460249;
        Sat, 29 Apr 2023 13:17:40 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c14900b001a9a36c5216sm6303823plj.80.2023.04.29.13.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 13:17:39 -0700 (PDT)
Date: Sat, 29 Apr 2023 13:17:39 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 13:17:16 PDT (-0700)
Subject: Re: [PATCH] RISC-V: fixup in-flight collision with ARCH_WANT_OPTIMIZE_VMEMMAP rename
In-Reply-To: <20230429-neurology-sudoku-8d53b23d01b8@spud>
CC: Conor Dooley <conor.dooley@microchip.com>,
  Linus Torvalds <torvalds@linux-foundation.org>, akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-b5a20207-95a2-4607-9e6c-52396d569d91@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_131745_161368_F3AB67D5 
X-CRM114-Status: GOOD (  19.27  )
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

On Sat, 29 Apr 2023 02:32:33 PDT (-0700), Conor Dooley wrote:
> On Sat, Apr 29, 2023 at 10:27:33AM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> Lukas warned that ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP had been
>> renamed in the mm tree & that RISC-V would need a fixup as part of the
>> merge. The warning was missed however, and RISC-V is selecting the
>> orphaned Kconfig option.
>> 
>> Fixes: 89d77f71f493 ("Merge tag 'riscv-for-linus-6.4-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")
>> Reported-by: Lukas Bulwhan <lukas.bulwhan@gmail.com>
>
> That should have been Lukas Bulwahn <lukas.bulwahn@gmail.com>.
> This is what I get for hand-typing an email address that I could have
> copied from lore I suppose.
>
>> Link: https://lore.kernel.org/linux-riscv/CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com/
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> I guess you picking this up for your second PR makes the most sense
>> Palmer?

Yep, except it crashes b4

$ b4 shazam -lts https://lore.kernel.org/all/20230429-trilogy-jolly-12bf5c53d62d@spud/
Grabbing thread from lore.kernel.org/all/20230429-trilogy-jolly-12bf5c53d62d%40spud/t.mbox.gz
Analyzing 2 messages in the thread
Checking attestation on all messages, may take a moment...
Traceback (most recent call last):
  File "/home/palmer/.local/src/b4/b4/command.py", line 383, in <module>
    cmd()
  File "/home/palmer/.local/src/b4/b4/command.py", line 366, in cmd
    cmdargs.func(cmdargs)
  File "/home/palmer/.local/src/b4/b4/command.py", line 100, in cmd_shazam
    b4.mbox.main(cmdargs)
  File "/home/palmer/.local/src/b4/b4/mbox.py", line 713, in main
    make_am(msgs, cmdargs, msgid)
  File "/home/palmer/.local/src/b4/b4/mbox.py", line 101, in make_am
    am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers,
  File "/home/palmer/.local/src/b4/b4/__init__.py", line 552, in get_am_ready
    checkmark, trailers, attcrit = lmsg.get_attestation_trailers(attpolicy, maxdays)
  File "/home/palmer/.local/src/b4/b4/__init__.py", line 1319, in get_attestation_trailers
    for attestor in self.attestors:
  File "/home/palmer/.local/src/b4/b4/__init__.py", line 1158, in attestors
    self._load_patatt_attestors()
  File "/home/palmer/.local/src/b4/b4/__init__.py", line 1261, in _load_patatt_attestors
    patatt_config = patatt.get_config_from_git(r'patatt\..*', multivals=['keyringsrc'])
AttributeError: module 'patatt' has no attribute 'get_config_from_git'

So I probably need to just go update my setup, I've got a bunch of wacky stuff.
I'll try and remember to do so, but I'm going to scrub through other bits
first...

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

>> 
>> CC: Palmer Dabbelt <palmer@dabbelt.com>
>> CC: Linus Torvalds <torvalds@linux-foundation.org>
>> CC: Andrew Morton <akpm@linux-foundation.org>
>> CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> CC: Lukas Bulwhan <lukas.bulwhan@gmail.com>
>> CC: linux-riscv@lists.infradead.org
>> CC: linux-kernel@vger.kernel.org
>> ---
>>  arch/riscv/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 5c88ac4b52be..e1bdb3fb16cc 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -46,9 +46,9 @@ config RISCV
>>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>>  	select ARCH_WANT_FRAME_POINTERS
>>  	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
>> -	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>>  	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
>> +	select ARCH_WANT_OPTIMIZE_VMEMMAP
>>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>>  	select BUILDTIME_TABLE_SORT if MMU
>> -- 
>> 2.39.2
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
