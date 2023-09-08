Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBFEE8013
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USEvw609bOdSryslBslVtHRlR58CbQDRrByeSG7cJzE=; b=S17rzFeBX3ylhQ
	bJYoeypjyFe4Ml/egO9FMTINupKeL5j7qdrXvnxgt0V/MkFJEWpfre6Psh+DvgszT4nPTAgN3k98J
	o5vIw50KqRjZbw0BQyy6t7iMHvgHrjYJ+aKLPSMJVIU2u5vOzfqc5x0N5QtVaxqfusGlGZxWVKa8O
	PngxHSpiAE/sbd3vSVVGmclZfWS1cVZey54a4u4yabzQC7LzcpoteNo5wM3jTJO6mrXGfPMTwdXtT
	TDmlI5jGIO81CoLBDZD+csXRTQE9ejkBdvQLxnvdm5X/IqKw9qJ5Wao0mR3FJK1cbHm6WyxeB71v9
	i65LiYyy2KIf2OaBmlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedOx-00E0J0-2k;
	Fri, 08 Sep 2023 15:28:07 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedOu-00E0HF-0i
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 15:28:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bf7423ef3eso17463765ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694186880; x=1694791680; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISx/id5dNxIJh+29FXmKcEhK6YchpdLSErhaK4D3qNY=;
        b=kr7Y8KvGqMfRmuE/gZ6CICkIHv40cmICTHPe9eSapJcoT0uRoNqs8CPdwA2zf6njjB
         c3CPSa/MMk9h0IGPDB8a55b4vzLF4wUZ0VEhB0tc5AzVBSkNCION6nwwYZuEGXspQDwH
         wSzcsB3SlYC+xxgcfjigBX5iEgfZWgUjzLMpAh06NnQbFHpvRwDltbSaG0EG7oMt1BA3
         WOibDTfb9OyQSapblxHnW6//n+9GekKnHC+uIU9SU7W15ol0pWMS83S/6BnulOIDtzd7
         pw7LN+smdWX0Yb+4OifyQuEdQI63fzQkS2Ul/H7RMNX6GUgKEVlOxWRd/f4vIspEaeTZ
         3/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694186880; x=1694791680;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISx/id5dNxIJh+29FXmKcEhK6YchpdLSErhaK4D3qNY=;
        b=GM5S3UdOQXEnwOn4rKjNZ+3fLYQE3p2L6eCYnWFLGcflLtalfmX+m1htuTjB/BMtGG
         iayerUpSmztaqz5fosCWlJdmkOBw2FZmbQx/Cpc2CSdzIhxbTH7UT7HjGVs7KcqnNmsx
         I4XzUUjDxGLeWFMtA4wBpbHeu0MDX4EBdCTHOnQNR69DYEyal8AkFrq5bMSOCkSjCTSD
         6swQXx7+pAiKBhDf9oNdTQ0AG9kB6fVoub+SrfUyaFb12mERDYPUjG9RZEQa0OWjySDi
         u66ZQKr39gl/wiGWAAAzTfInRPQCn1xC6ruUQpieN6IcSOr4jSeHlTEabxzn6ANss376
         4ftA==
X-Gm-Message-State: AOJu0Yw1cxerOYXEDYAVz8Q3/V3b8qP5xIoLTpKZ6mM6yexCSX9RZcfW
	bXVwS41zpbi+MiTJLaWrajE=
X-Google-Smtp-Source: AGHT+IF9MIfnm3S/SpaSMf0cVr1lXP/iCqKNvT3gWWfIFlFwPRdCTkW7qTgIYcvFtTQTVhn6+m7UGg==
X-Received: by 2002:a17:902:6906:b0:1c0:aca0:8c2d with SMTP id j6-20020a170902690600b001c0aca08c2dmr2600278plk.67.1694186880104;
        Fri, 08 Sep 2023 08:28:00 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id iw21-20020a170903045500b001b39ffff838sm1737554plb.25.2023.09.08.08.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 08:27:59 -0700 (PDT)
Message-ID: <a21c80c1-533c-5167-8b0b-a6bc4953eec8@gmail.com>
Date: Sat, 9 Sep 2023 00:27:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: palmer@rivosinc.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 torvalds@linux-foundation.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Akira Yokosawa <akiyks@gmail.com>
References: <mhng-f4556557-af4d-4b6a-aa89-de77f7dacf2b@palmer-ri-x1c9>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 2
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <mhng-f4556557-af4d-4b6a-aa89-de77f7dacf2b@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_082804_262800_73768D7B 
X-CRM114-Status: GOOD (  22.82  )
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

On Fri, 08 Sep 2023 07:55:57 -0700 (PDT), Palmer Dabbelt wrote:
> merged tag 'riscv-for-linus-6.6-mw1'
> The following changes since commit e0152e7481c6c63764d6ea8ee41af5cf9dfac5e9:
> 
>   Merge tag 'riscv-for-linus-6.6-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-09-01 08:09:48 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw2
> 
> for you to fetch changes up to accb14aa1e699d11b8172283e8cb82a695b96c85:
> 
>   soc: renesas: Kconfig: For ARCH_R9A07G043 select the required configs if dependencies are met (2023-09-06 07:20:13 -0700)
> 
> ----------------------------------------------------------------
> RISC-V Patches for the 6.6 Merge Window, Part 2
> 
> * The kernel now dynamically probes for misaligned access speed, as
>   opposed to relying on a table of known implementations.
> * Support for non-coherent devices on systems using the Andes AX45MP
>   core, including the RZ/Five SoCs.
> * Support for the V extension in ptrace(), again.
> * Support for KASLR.
> * Support for the BPF prog pack allocator in RISC-V.
> * A handful of bug fixes and cleanups.
> 
> ----------------------------------------------------------------
> The shortlog looks correct here, but the diffstat includes all sorts of files I
> wasn't expecting.  I'm not entirely sure what's going on here, but I have a
> little bit of a complex set of base branches here as the BPF changes have a
> dependency on some arm64 BPF work and IIRC that sort of thing sometimes makes
> diffstat go off the rails.  So hopefully that's just it.

Hi Palmer,
It looks like you have ignored Stephen Rothwell's kind investigation at
https://lore.kernel.org/linux-next/20230908082625.487d39c4@canb.auug.org.au/.

Excerpt of Stephen's analysis:

> Actually, it looks like the merge
> 
>   2bf3c0292f35 ("Merge patch series "RISC-V: Probe for misaligned access speed"")
> 
> in the risc-v tree was resolved very badly and dragged a lot of stuff
> back in.

[...]

> When I redid that merge:
> 
> $ git diff HEAD^..HEAD
>  Documentation/riscv/hwprobe.rst      |  11 ++--
>  arch/riscv/errata/thead/errata.c     |   8 ---
>  arch/riscv/include/asm/alternative.h |   5 --
>  arch/riscv/include/asm/cpufeature.h  |   2 +
>  arch/riscv/kernel/Makefile           |   1 +
>  arch/riscv/kernel/alternative.c      |  19 -------
>  arch/riscv/kernel/copy-unaligned.S   |  71 ++++++++++++++++++++++++
>  arch/riscv/kernel/copy-unaligned.h   |  13 +++++
>  arch/riscv/kernel/cpufeature.c       | 104 +++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/smpboot.c          |   3 +-
>  10 files changed, 198 insertions(+), 39 deletions(-)
> 
> So, the risc-v tree needs to be cleaned up.

Palmer, you are requesting pull without the suggested cleanup.

I'd really like this to be cleanly sorted out.

Of course, it's up to Linus whether or not to pull as it is...

        Thanks, Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
