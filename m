Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10D2C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 18:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715AE20665
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 18:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UBQi+2gi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="B9srxgoz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 715AE20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=C4YIjQPsD0VYU8qUF1iia/HGf7xgabWSMxIMmnTwoew=; b=UBQi+2gizZg0O3YXjKXD6lRBC
	O73U6veD3g29P7MUfWqy77tG+LhF6DOaognq4GHDTv41Y+V2ncKl/salyxNIRsNUvblJGLPFrCdZG
	o6bopAnk+jhCVCcsX/+5FQv7DGiOhkiM5J3w+sI+C0J1n/T/a6r3mAo3TcVYUuqzwXEb2AcIyAYKe
	uT70+nIIBO1dELBfYWD3VRAzqp8O7dCaRilcN7IMSl4ycbg/E2EQxF9Ana/ZhhX8Ub/kNCqUwIb/V
	nKBgj7bPEnqGT/ySMyXLYHtUY8UNKKVGjeoDSAUKV8hhVdqg4kJYddrkSwG0P41cvRlrCvtIDuBhs
	LSKebJaiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghIYq-0007cv-EV; Wed, 09 Jan 2019 18:26:40 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghIYm-0007b9-AR
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 18:26:38 +0000
Received: by mail-pf1-x441.google.com with SMTP id z9so4055247pfi.2
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jan 2019 10:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=w2mLEAcxG0F0fAsoOfJCAsgsWJa/aRkO5e16sYR+lz8=;
 b=B9srxgoz0Md2VFztXO17e0ciuVl83qMa9MaYhFFn8/K1B3UnICItCY6m9h5MXrVt6y
 0oDyi57k7a65YSUv4zEhavnr4eYnlyDMh1jQFRfBV/vgqR+KF8zgD4UUaMaW9fDHF60o
 5xLp7Daxy+FeCRQ7ZBhrhEvJgz446DDCcJzkchkV7UOyqQ9iye2l4SNUhQgD5ZKNtR/1
 iMtvY3VSOtItV6Cls0EGHh+L4fRHnrEYMQiOde+yU6oBHTmUTPSLjqgBtL2zqGzqiAV9
 C+hcHYDWmCtJE4MJe3VHAhVO7PiaYYn7eNCht1XfcPhtJcrYiS63e9JMQMVgXWloU/GP
 w5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=w2mLEAcxG0F0fAsoOfJCAsgsWJa/aRkO5e16sYR+lz8=;
 b=d6gqx+qO1eSY2400pBzCo0a2BLc8AENRyD71eEW8zGXxcY89AubkZL+S1CwJoBcbhR
 3bDO/n4QmeVWtbjMxF/jCnlmjPjEol3Sv72uzU0zz/5030yli1KhuqTeaHHorLIhNfIY
 rqNj3qefPdQ3TRYOHkV8pnskLZCJAkMKmzrfCvMOggLFhKmqU8gdmbS0LTSDB4zApc5r
 jLZjmpszy/gvB/8M0JC60+mpCdxy2ofsV/7tV31x4Rp+nzt/gLgOhepWAZu6VIQUTuFn
 YjMVHUe8G7kZEWNsWBLAnG4a2+Ts2vMlNAGgs+uiubkdGc2o2169xMEVetWsdsDwg4oa
 KUwg==
X-Gm-Message-State: AJcUukc5TmhJmT4MHv/OYU+R0yg01Wqs98s9DDAmrCOAZeyZsEiQ2Wry
 64YbX7ZBdR0XahuszalrZw3Zow==
X-Google-Smtp-Source: ALg8bN6PFtLMVwVT40/0D++MfOrD7b1pFYWJfNiuuhtcBLsSnI/BmFoWSuBilEtfgojxzvDzt2L2HA==
X-Received: by 2002:a63:de04:: with SMTP id f4mr4137645pgg.292.1547058395431; 
 Wed, 09 Jan 2019 10:26:35 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x27sm134919134pfe.178.2019.01.09.10.26.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jan 2019 10:26:34 -0800 (PST)
Date: Wed, 09 Jan 2019 10:26:34 -0800 (PST)
X-Google-Original-Date: Wed, 09 Jan 2019 10:26:25 PST (-0800)
Subject: Re: [GIT PULL] RISC-V Updates for the 4.21 Merge Window, Part 1
In-Reply-To: <CAAhSdy3jN8U=Aa+=m5bsMv1srnnc3SqyQetEZh-Dy8VEdsODRw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-f867ac0a-5b10-4f63-8dfd-f5b4920ecc0e@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_102636_360544_51D775A7 
X-CRM114-Status: GOOD (  18.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 07 Jan 2019 17:34:02 PST (-0800), anup@brainfault.org wrote:
> On Fri, Dec 21, 2018 at 10:00 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> The following changes since commit 7566ec393f4161572ba6f11ad5171fd5d59b0fbd:
>>
>>   Linux 4.20-rc7 (2018-12-16 15:46:55 -0800)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.21-mw1
>>
>> for you to fetch changes up to 9b9afe4a0ef149db2472f13d6fa3c705d2867c9c:
>>
>>   RISC-V: Select GENERIC_SCHED_CLOCK for clocksource drivers (2018-12-21 08:17:19 -0800)
>>
>> ----------------------------------------------------------------
>> RISC-V Updates for the 4.21 Merge Window, Part 1
>>
>> We don't have many patches for this merge window, probably because
>> everything has been a bit busy with the holidays and conferences.  The
>> only big user-visible change is to move over to an SBI-based earlycon
>> instead of our arch-specific early printk support.
>>
>> The only outstanding patch set I know of is the audit patch set, which
>> I've managed to make a mess of and will attempt to clean up.
>>
>> ----------------------------------------------------------------
>> Andrea Parri (1):
>>       riscv, atomic: Add #define's for the atomic_{cmp,}xchg_*() variants
>>
>> Anup Patel (3):
>>       RISC-V: defconfig: Enable RISC-V SBI earlycon support
>>       RISC-V: Remove EARLY_PRINTK support
>>       RISC-V: Select GENERIC_SCHED_CLOCK for clocksource drivers
>>
>> Atish Patra (1):
>>       RISC-V: Fix of_node_* refcount
>>
>> David Abdurachmanov (1):
>>       riscv: remove unused variable in ftrace
>>
>> Nick Kossifidis (1):
>>       RISC-V: Update Kconfig to better handle CMDLINE
>>
>> Olof Johansson (1):
>>       RISC-V: lib: minor asm cleanup
>>
>> Palmer Dabbelt (1):
>>       RISC-V: Move from EARLY_PRINTK to SBI earlycon
>>
>> Yangtao Li (1):
>>       RISC-V: add of_node_put()
>>
>>  arch/riscv/Kconfig              | 58 +++++++++++++++++++++++-----------------
>>  arch/riscv/Kconfig.debug        |  2 --
>>  arch/riscv/configs/defconfig    |  1 +
>>  arch/riscv/include/asm/atomic.h |  9 +++++++
>>  arch/riscv/kernel/cacheinfo.c   | 11 ++++++++
>>  arch/riscv/kernel/cpu.c         |  1 +
>>  arch/riscv/kernel/cpufeature.c  |  2 ++
>>  arch/riscv/kernel/ftrace.c      |  1 -
>>  arch/riscv/kernel/perf_event.c  |  1 +
>>  arch/riscv/kernel/setup.c       | 28 -------------------
>>  arch/riscv/kernel/smpboot.c     |  6 ++++-
>>  arch/riscv/kernel/time.c        |  1 +
>>  arch/riscv/lib/tishift.S        | 59 ++++++++++++++++++++++-------------------
>>  arch/riscv/lib/udivdi3.S        | 42 +++++++++++++++--------------
>>  14 files changed, 118 insertions(+), 104 deletions(-)
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Hi Palmar,
>
> Greg wanted SBI earlycon driver patch to go through RISC-V tree
> so it should have been part of this PULL request.
>
> Refer, https://patchwork.kernel.org/patch/10711809/
>
> Can you include it your next PULL request?

Sorry about that, I must have gotten confused.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
