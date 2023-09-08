Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB601EE801E
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Oh/ApwVrNFEGmCsdXZqE/qK42HoR8bsIlfbO7y1iZIA=; b=PQJ8NbAmopa8uwDH6ooo7kXwnV
	Hxu9DtJWn5WLTBMyzAS/TnBbLQgFDIzVG/6Wx1UbbsQI1l3jFnPoUKUUVIq5rUKm7ZrLTBkiEuTba
	1LDvl3t+oeZm7Qtv8Ctq671c6jgb2HGpQgCtR7NJGxgQyBf/hwN+oLCqpMj9wdk5SWnvTDnt6ytN8
	jmFCN4G9wYZULHad37BYmUKahlsU2wyRnW9tBB1EdPNpd5B30nCZ/R2HLpPqAEt8cXzhfAnzIXSyW
	vPGdcPlLqPTCnt0rJRUMnbmECG7mF6C/ox5zzYKefZRqjr2e5BLkgIKKuq1e+GY3GOyNwFugg9wwj
	MW683Vqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeeTd-00E5ta-2y;
	Fri, 08 Sep 2023 16:37:01 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeeTa-00E5sh-0P
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 16:36:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bdc19b782aso18119875ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694191013; x=1694795813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hha0R8WpwiNtISVJgyEcefuuZ1tW3gKFT2Wp4a2qgHg=;
        b=fEJ0XnJo0IaPX6XuCrXxH+4PmUknCr1wzIfMbJk7BvJkmptYY/jwR59oggDOEmE6+p
         HXDPNK9EXesN0sHCTLMzKqhtXxVgRYUQs2IU6xU6e1xgWszOFPMCLOSj8Jt9BrZtu0EB
         X1lUsG3NhGvPhuvFGtDtmRphkrhyuLsdHtX1D/xw1rHV2AReov+xH+b+wbiZNrgZT38X
         jGdUgz+QluRxeTmKxBDkD2JCD7HS5uFmEBlkw7W5G63ICyteAvyPpHAEJOWHJMDvk3wn
         rKdCOjIYR0bOzSbKramnWA+VHyy48u6WIwIPXBNj3OCydnL60YYldgxVSqShzRnhABlw
         3qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694191013; x=1694795813;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hha0R8WpwiNtISVJgyEcefuuZ1tW3gKFT2Wp4a2qgHg=;
        b=XeV40wWsnW8baorF0GaK2XYppAMQQMgORPGP4HPOeiQ4w7nbmK2KZs3LB7/j1whIBk
         +2aY5CU7rG/VhTfSKiw6jQ9ZbC7z/eC0pa6HeK9VpEw+8DZONtAIjkc0OC3hUdc0/Xgn
         bCWqaeqwCuJbXS8QCU+xPkhjfe/wkesHlskNP5vVUQynPgutGpfTT9Kp5yQ8GAGByDQu
         8FdbTeSY8LprGLqMbqiyrqksSESiAkdPEmOOXCARaumXRnILYy5C/thQFwuz9EPK07L8
         If9E2EPvN+wBJGpSICUBjNzlMlc3jgctEOM/Lfhq8+ILfmzBePAFKCDh9hRZXsAD4Soc
         Ptag==
X-Gm-Message-State: AOJu0Yx2FBjn3j4HCPd1wL6PJx8v3OlDccmTIREbDSVjju41clfKU9Gz
	W4mYnHIMmPqQNmbPgmn09Wq4iA==
X-Google-Smtp-Source: AGHT+IG5z+BUmJdGSZCdLGShsVjcHK/gNeNfc83vbpPvBhGN58S9/wBG8y2536EHecqwGZcBQKH1eg==
X-Received: by 2002:a17:903:22c4:b0:1c0:b82a:b0d9 with SMTP id y4-20020a17090322c400b001c0b82ab0d9mr3534052plg.29.1694191013464;
        Fri, 08 Sep 2023 09:36:53 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902d30600b001bc6e6069a6sm1785499plc.122.2023.09.08.09.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 09:36:53 -0700 (PDT)
Date: Fri, 08 Sep 2023 09:36:53 -0700 (PDT)
X-Google-Original-Date: Fri, 08 Sep 2023 09:36:46 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 2
In-Reply-To: <72cb1319-e072-b3a1-8d1b-a86321b255b8@gmail.com>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, akiyks@gmail.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: akiyks@gmail.com
Message-ID: <mhng-32285c56-bd5b-49de-a971-e3b3628bbd39@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_093658_403840_D69B3263 
X-CRM114-Status: GOOD (  20.27  )
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

On Fri, 08 Sep 2023 08:32:37 PDT (-0700), akiyks@gmail.com wrote:
> On Sat, 9 Sep 2023 00:27:56 +0900, Akira Yokosawa wrote:
>> On Fri, 08 Sep 2023 07:55:57 -0700 (PDT), Palmer Dabbelt wrote:
>>> merged tag 'riscv-for-linus-6.6-mw1'
>>> The following changes since commit e0152e7481c6c63764d6ea8ee41af5cf9dfac5e9:
>>>
>>>   Merge tag 'riscv-for-linus-6.6-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-09-01 08:09:48 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw2
>>>
>>> for you to fetch changes up to accb14aa1e699d11b8172283e8cb82a695b96c85:
>>>
>>>   soc: renesas: Kconfig: For ARCH_R9A07G043 select the required configs if dependencies are met (2023-09-06 07:20:13 -0700)
>>>
>>> ----------------------------------------------------------------
>>> RISC-V Patches for the 6.6 Merge Window, Part 2
>>>
>>> * The kernel now dynamically probes for misaligned access speed, as
>>>   opposed to relying on a table of known implementations.
>>> * Support for non-coherent devices on systems using the Andes AX45MP
>>>   core, including the RZ/Five SoCs.
>>> * Support for the V extension in ptrace(), again.
>>> * Support for KASLR.
>>> * Support for the BPF prog pack allocator in RISC-V.
>>> * A handful of bug fixes and cleanups.
>>>
>>> ----------------------------------------------------------------
>>> The shortlog looks correct here, but the diffstat includes all sorts of files I
>>> wasn't expecting.  I'm not entirely sure what's going on here, but I have a
>>> little bit of a complex set of base branches here as the BPF changes have a
>>> dependency on some arm64 BPF work and IIRC that sort of thing sometimes makes
>>> diffstat go off the rails.  So hopefully that's just it.
>>
>> Hi Palmer,
>> It looks like you have ignored Stephen Rothwell's kind investigation at
>> https://lore.kernel.org/linux-next/20230908082625.487d39c4@canb.auug.org.au/.
>
> Aahh, Stephen used your email address at @dabbelt.com.
> Didn't you see the message at all?

It should go to both of them, but looks like something must still be 
broken with the email on my end.

>
> Akira
>
>>
>> Excerpt of Stephen's analysis:
>>
>>> Actually, it looks like the merge
>>>
>>>   2bf3c0292f35 ("Merge patch series "RISC-V: Probe for misaligned access speed"")
>>>
>>> in the risc-v tree was resolved very badly and dragged a lot of stuff
>>> back in.
>>
>> [...]
>>
>>> When I redid that merge:
>>>
>>> $ git diff HEAD^..HEAD
>>>  Documentation/riscv/hwprobe.rst      |  11 ++--
>>>  arch/riscv/errata/thead/errata.c     |   8 ---
>>>  arch/riscv/include/asm/alternative.h |   5 --
>>>  arch/riscv/include/asm/cpufeature.h  |   2 +
>>>  arch/riscv/kernel/Makefile           |   1 +
>>>  arch/riscv/kernel/alternative.c      |  19 -------
>>>  arch/riscv/kernel/copy-unaligned.S   |  71 ++++++++++++++++++++++++
>>>  arch/riscv/kernel/copy-unaligned.h   |  13 +++++
>>>  arch/riscv/kernel/cpufeature.c       | 104 +++++++++++++++++++++++++++++++++++
>>>  arch/riscv/kernel/smpboot.c          |   3 +-
>>>  10 files changed, 198 insertions(+), 39 deletions(-)
>>>
>>> So, the risc-v tree needs to be cleaned up.
>>
>> Palmer, you are requesting pull without the suggested cleanup.
>>
>> I'd really like this to be cleanly sorted out.
>>
>> Of course, it's up to Linus whether or not to pull as it is...

Let's just drop this PR, I'll go re-spin my tree -- and try to figure 
out what's going on with my email.

>>
>>         Thanks, Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
