Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B455AEE8013
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjHF5KRb9r7DQabEN64u6IxdBsW4CfV3uweh9+gEXro=; b=fDzWWFNGuXPkY+
	On2A0degV401I8sPexBDNJVRhtMlP9iBZwgIX2jHFiuB+5WRL7MEtWZkmvB2+I8Dqz/6Q8gk5M711
	RKFqNRnsfIyRQ/ACZXxiC3mFIbPz/zh644iRbDrV1MHqJwikGk3+yDQ5G58xCxCrA/hjEUHWDs4Px
	dXjWrrRL9f0PxzaChqtJyeBzM++eCLfMkqMvOlvz22dpmlLXnXd2jxISPIVMj/fy8ATT+W2zf2ORn
	vqVWBd4bpnSRp7Jn3H/6tSzPIJabjaIkO56/FCjBWXKQ7mMUXRf8oyc+ad1Udw//m0Hm+YNKydJLg
	Cbi18gjXmB0fTzDnjgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedTT-00E0lj-2s;
	Fri, 08 Sep 2023 15:32:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedTR-00E0l2-0b
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 15:32:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso16472865ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694187162; x=1694791962; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fJFhjrxWu/l5FowZjv3FdaZf2QRbltLNGgcqvXRLeo=;
        b=YQNzjyJJlqlRaqjT49utwHQiVImxB+TGoyK3V3HaHUBry2kRyFh3LEaBC9DVGFkuJN
         qH9FRRWJddWrp1IKQseBNeJkDi6eXcg5bWJCHwEiXbeYRmcQqDNn1e8xhxJP/EZ7zvQT
         QlYynQPAuo6k4BHxvVbzkeVuQ01TYa4+2ku4oh5vIOhXuUdCHDWD0L42FpVAIbRQz9/v
         0mbGwfSAH7F3hLiaHW5BpDC/Osu9ZWNdUodyFMuCcB45Sv7UCqtgKeZeBlw9f/bq9M57
         0bwHoizLxcOFLLuWgqkOu6M3Xl/EEt8PjJ+F2TYLYRYbZCt0OjgUPhRK72hLbjwHICt2
         otlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694187162; x=1694791962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fJFhjrxWu/l5FowZjv3FdaZf2QRbltLNGgcqvXRLeo=;
        b=rD55NaoJFP1os4qAcJWpZZfcV1yFEq+fyQmbTcT0t3NpZ+GTlgnOf1ERswnbVfZMsR
         kJZoJE8g3F2EmRIz4VhUra9KOfgB/GH3P5fAXWfGqTecKwtP4+GdZMFlWURh0JvZyAyd
         A1DnEmpOziC1Q5m8reXuQQ5v43Gb8nDqhfrdmfEs93Jcmwp3q2hEv5IlMt0CRaJu39eZ
         BEots9XPONjC5Qt2+QAdqH8cOfXJdBveJ9Y6s+C9yst+6lfRLS//UBCkeq3NDGMpJLRo
         adF1VPiVYgHHqVjiONx0aR0Wl7N3NzFNV7S0TZWCKjpZTaXVm66KxwIpyw8StCsVh5UX
         wu5A==
X-Gm-Message-State: AOJu0Yy+18+BIxho24RdvU5TU3iTdYsAafdTJhQ8SP18SyZHStDrO0Js
	bRfT7BtIhRiRv2oyQxPxF94=
X-Google-Smtp-Source: AGHT+IH3+ios7QYkB/ePkY1o/gFLMwga4Co0c7FzkRxPhpCKFic7dIhku6AP60ATToFAIPapz6syBw==
X-Received: by 2002:a17:902:c3c6:b0:1bb:ee1b:3cdf with SMTP id j6-20020a170902c3c600b001bbee1b3cdfmr2545496plj.67.1694187162171;
        Fri, 08 Sep 2023 08:32:42 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id c17-20020a170903235100b001b9d335223csm1733661plh.26.2023.09.08.08.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 08:32:41 -0700 (PDT)
Message-ID: <72cb1319-e072-b3a1-8d1b-a86321b255b8@gmail.com>
Date: Sat, 9 Sep 2023 00:32:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 2
Content-Language: en-US
To: palmer@rivosinc.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 torvalds@linux-foundation.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Akira Yokosawa <akiyks@gmail.com>
References: <mhng-f4556557-af4d-4b6a-aa89-de77f7dacf2b@palmer-ri-x1c9>
 <a21c80c1-533c-5167-8b0b-a6bc4953eec8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a21c80c1-533c-5167-8b0b-a6bc4953eec8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_083245_218992_FC321AFB 
X-CRM114-Status: GOOD (  25.04  )
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

On Sat, 9 Sep 2023 00:27:56 +0900, Akira Yokosawa wrote:
> On Fri, 08 Sep 2023 07:55:57 -0700 (PDT), Palmer Dabbelt wrote:
>> merged tag 'riscv-for-linus-6.6-mw1'
>> The following changes since commit e0152e7481c6c63764d6ea8ee41af5cf9dfac5e9:
>>
>>   Merge tag 'riscv-for-linus-6.6-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-09-01 08:09:48 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw2
>>
>> for you to fetch changes up to accb14aa1e699d11b8172283e8cb82a695b96c85:
>>
>>   soc: renesas: Kconfig: For ARCH_R9A07G043 select the required configs if dependencies are met (2023-09-06 07:20:13 -0700)
>>
>> ----------------------------------------------------------------
>> RISC-V Patches for the 6.6 Merge Window, Part 2
>>
>> * The kernel now dynamically probes for misaligned access speed, as
>>   opposed to relying on a table of known implementations.
>> * Support for non-coherent devices on systems using the Andes AX45MP
>>   core, including the RZ/Five SoCs.
>> * Support for the V extension in ptrace(), again.
>> * Support for KASLR.
>> * Support for the BPF prog pack allocator in RISC-V.
>> * A handful of bug fixes and cleanups.
>>
>> ----------------------------------------------------------------
>> The shortlog looks correct here, but the diffstat includes all sorts of files I
>> wasn't expecting.  I'm not entirely sure what's going on here, but I have a
>> little bit of a complex set of base branches here as the BPF changes have a
>> dependency on some arm64 BPF work and IIRC that sort of thing sometimes makes
>> diffstat go off the rails.  So hopefully that's just it.
> 
> Hi Palmer,
> It looks like you have ignored Stephen Rothwell's kind investigation at
> https://lore.kernel.org/linux-next/20230908082625.487d39c4@canb.auug.org.au/.

Aahh, Stephen used your email address at @dabbelt.com.
Didn't you see the message at all?

Akira

> 
> Excerpt of Stephen's analysis:
> 
>> Actually, it looks like the merge
>>
>>   2bf3c0292f35 ("Merge patch series "RISC-V: Probe for misaligned access speed"")
>>
>> in the risc-v tree was resolved very badly and dragged a lot of stuff
>> back in.
> 
> [...]
> 
>> When I redid that merge:
>>
>> $ git diff HEAD^..HEAD
>>  Documentation/riscv/hwprobe.rst      |  11 ++--
>>  arch/riscv/errata/thead/errata.c     |   8 ---
>>  arch/riscv/include/asm/alternative.h |   5 --
>>  arch/riscv/include/asm/cpufeature.h  |   2 +
>>  arch/riscv/kernel/Makefile           |   1 +
>>  arch/riscv/kernel/alternative.c      |  19 -------
>>  arch/riscv/kernel/copy-unaligned.S   |  71 ++++++++++++++++++++++++
>>  arch/riscv/kernel/copy-unaligned.h   |  13 +++++
>>  arch/riscv/kernel/cpufeature.c       | 104 +++++++++++++++++++++++++++++++++++
>>  arch/riscv/kernel/smpboot.c          |   3 +-
>>  10 files changed, 198 insertions(+), 39 deletions(-)
>>
>> So, the risc-v tree needs to be cleaned up.
> 
> Palmer, you are requesting pull without the suggested cleanup.
> 
> I'd really like this to be cleanly sorted out.
> 
> Of course, it's up to Linus whether or not to pull as it is...
> 
>         Thanks, Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
