Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7457EEB569
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=U5kYMrG4iC+Ggv0o/XUuP6u/JugDBhTJB3kSO5SAzts=; b=QAI6kpgt7/pMylH5Fh3Eo9lKlq
	5kfrSGiIR0dchpo1MSHdW00l7Vu8KVzz0i5wFix+t2i95f7483Kpw30uI4KXFscvrm1Dm9GFdremJ
	hvoKOoChqU66xbW28F8ozPlxkbbUo26Tc/lhkf9HV64ca6T0PaKEASh9DH0TVffeO8ewAyLsrdPWf
	BnGDNVZkijM5eDv4qD3lTfM6zcRfZZidK8O4YZE6JSDiZrIgZZzasuXhWrBWypfVNWRl7WubySE6I
	krwUg+B2dA9sj1ZwDDjajmN+jfyRI3SAEDfjZe3UlFGMV9Gey94dJriJbKHW/xxoH/SPEgHznWiuJ
	pJcttkbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qehQv-00EPCx-34;
	Fri, 08 Sep 2023 19:46:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qegNG-00EIPy-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 18:38:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68c576d35feso2234200b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 11:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1694198311; x=1694803111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQTNsRDuZ6Ep4/wu6ObBNkw0OLnVXd0NXLoJ9HJgOe4=;
        b=xKKCPy47t32Spzd9mf7iAvype6YxT1LNdw+f3Rg/FmitvvCu+dAWdaCFIr0ralMM/y
         ZK9OHobrN3f1/KELlVzWQGCoEb6zvsyZPwT5WB85U/wADVw/kqihcP8kTGolih6XT5w/
         hsRNWjEcbiEbFIE43JJOvOps7GDXVIJ+7TqXqQubSAQv8bBVDYLO91X9jbcxCOQ05c76
         ErE6tGXv2QZ8JDxgO/WYNKAO1cySmt+n2hEVj9hSlmrzU8x43n2nZJArAm4ukyNKeurO
         Tqw9Yb4DKRuG64+gOnBJVtpv6pc2P6vnnL6hUSIEpJMOd+ZIGmfoTF5AOya1mvV8yvRH
         F8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694198311; x=1694803111;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQTNsRDuZ6Ep4/wu6ObBNkw0OLnVXd0NXLoJ9HJgOe4=;
        b=ArZj5bL2sjfvLFLICQvdMxvA55k4jrgEbg17+yN9Xa1i73g0EXU+4HsI5GkwgL5inJ
         t/EEOlRLf9pSVjk6c/Geo8DHz8MmdhcPSTQ8SZCBqqoH4HJxRlD/I+lpcG3Xy4P/ABwh
         CYSwRPRueulQzHCMl3Oqi7gZV3ERdPIyXujcRnMS/8z5j+rZ38Vc7lUeBaOTf+gZSQes
         v1QlTZx4nOb0NR1Y4uIWYGO8yba6zWIew9gh5kjWzHCbyCJUZOL4k+zjKaBm7dzJlTL/
         GItScn82iSeReGyNKgYFXToSB/W3OpjFp0QTikdzNeYljN0S7vx2T7C2sddQZQc7jbmG
         aw4Q==
X-Gm-Message-State: AOJu0YzRBhCCCxKrvK7vfOOEOd0EEdfE7Js1reosOT33QUTEQGm0uNgY
	N4oAdnNSTjnB5h8MrhmSjc5SRjVHjSV3ST9LH0Y=
X-Google-Smtp-Source: AGHT+IFYUsR+dZlkmGKkLsioB+RXkT7Wbw2dW7AN7eckaTJwtgcrNabW1cYWsEP8/xpMfzdDQno9tA==
X-Received: by 2002:a05:6a20:914f:b0:f3:33fb:a62b with SMTP id x15-20020a056a20914f00b000f333fba62bmr3927014pzc.9.1694198310698;
        Fri, 08 Sep 2023 11:38:30 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x22-20020aa79196000000b0068bc014f352sm1612799pfa.7.2023.09.08.11.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 11:38:30 -0700 (PDT)
Date: Fri, 08 Sep 2023 11:38:30 -0700 (PDT)
X-Google-Original-Date: Fri, 08 Sep 2023 11:37:39 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 2
In-Reply-To: <mhng-32285c56-bd5b-49de-a971-e3b3628bbd39@palmer-ri-x1c9>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, akiyks@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akiyks@gmail.com
Message-ID: <mhng-efbeb114-26c3-4f83-b8e5-00b2dcbd67ab@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_113834_747450_6BE79CF3 
X-CRM114-Status: GOOD (  24.68  )
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

On Fri, 08 Sep 2023 09:36:53 PDT (-0700), Palmer Dabbelt wrote:
> On Fri, 08 Sep 2023 08:32:37 PDT (-0700), akiyks@gmail.com wrote:
>> On Sat, 9 Sep 2023 00:27:56 +0900, Akira Yokosawa wrote:
>>> On Fri, 08 Sep 2023 07:55:57 -0700 (PDT), Palmer Dabbelt wrote:
>>>> merged tag 'riscv-for-linus-6.6-mw1'
>>>> The following changes since commit e0152e7481c6c63764d6ea8ee41af5cf9dfac5e9:
>>>>
>>>>   Merge tag 'riscv-for-linus-6.6-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-09-01 08:09:48 -0700)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw2
>>>>
>>>> for you to fetch changes up to accb14aa1e699d11b8172283e8cb82a695b96c85:
>>>>
>>>>   soc: renesas: Kconfig: For ARCH_R9A07G043 select the required configs if dependencies are met (2023-09-06 07:20:13 -0700)
>>>>
>>>> ----------------------------------------------------------------
>>>> RISC-V Patches for the 6.6 Merge Window, Part 2
>>>>
>>>> * The kernel now dynamically probes for misaligned access speed, as
>>>>   opposed to relying on a table of known implementations.
>>>> * Support for non-coherent devices on systems using the Andes AX45MP
>>>>   core, including the RZ/Five SoCs.
>>>> * Support for the V extension in ptrace(), again.
>>>> * Support for KASLR.
>>>> * Support for the BPF prog pack allocator in RISC-V.
>>>> * A handful of bug fixes and cleanups.
>>>>
>>>> ----------------------------------------------------------------
>>>> The shortlog looks correct here, but the diffstat includes all sorts of files I
>>>> wasn't expecting.  I'm not entirely sure what's going on here, but I have a
>>>> little bit of a complex set of base branches here as the BPF changes have a
>>>> dependency on some arm64 BPF work and IIRC that sort of thing sometimes makes
>>>> diffstat go off the rails.  So hopefully that's just it.
>>>
>>> Hi Palmer,
>>> It looks like you have ignored Stephen Rothwell's kind investigation at
>>> https://lore.kernel.org/linux-next/20230908082625.487d39c4@canb.auug.org.au/.
>>
>> Aahh, Stephen used your email address at @dabbelt.com.
>> Didn't you see the message at all?
>
> It should go to both of them, but looks like something must still be
> broken with the email on my end.
>
>>
>> Akira
>>
>>>
>>> Excerpt of Stephen's analysis:
>>>
>>>> Actually, it looks like the merge
>>>>
>>>>   2bf3c0292f35 ("Merge patch series "RISC-V: Probe for misaligned access speed"")
>>>>
>>>> in the risc-v tree was resolved very badly and dragged a lot of stuff
>>>> back in.
>>>
>>> [...]
>>>
>>>> When I redid that merge:
>>>>
>>>> $ git diff HEAD^..HEAD
>>>>  Documentation/riscv/hwprobe.rst      |  11 ++--
>>>>  arch/riscv/errata/thead/errata.c     |   8 ---
>>>>  arch/riscv/include/asm/alternative.h |   5 --
>>>>  arch/riscv/include/asm/cpufeature.h  |   2 +
>>>>  arch/riscv/kernel/Makefile           |   1 +
>>>>  arch/riscv/kernel/alternative.c      |  19 -------
>>>>  arch/riscv/kernel/copy-unaligned.S   |  71 ++++++++++++++++++++++++
>>>>  arch/riscv/kernel/copy-unaligned.h   |  13 +++++
>>>>  arch/riscv/kernel/cpufeature.c       | 104 +++++++++++++++++++++++++++++++++++
>>>>  arch/riscv/kernel/smpboot.c          |   3 +-
>>>>  10 files changed, 198 insertions(+), 39 deletions(-)
>>>>
>>>> So, the risc-v tree needs to be cleaned up.
>>>
>>> Palmer, you are requesting pull without the suggested cleanup.
>>>
>>> I'd really like this to be cleanly sorted out.
>>>
>>> Of course, it's up to Linus whether or not to pull as it is...
>
> Let's just drop this PR, I'll go re-spin my tree -- and try to figure
> out what's going on with my email.

I think I have this one fixed up, but given that I masaged to screw it 
up pretty bad I'm going to give things a bit of time to test and such.  
Unless anyone finds a problem I'll plan on sending a new PR tomorrow 
morning -- I know that's super late so no big deal if it doesn't make 
6.6.

Sorry I screwed this one up.

>
>>>
>>>         Thanks, Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
