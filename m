Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91875C5ACB3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 10:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfqnSRPm4bnNtmLs3ULppLJSOg2CNL2VeO7B7+NVxT4=; b=IDtwvwjIC64iqN
	L3hevbNIzhDnUKmgW1X/LeUJ4CXdwLcf52YWpNxlzqajESi1KjYXh7hps8IQOrzaRDIBj7aBdJjw1
	6t6WP1EhXbpWuP8P+UMlVqG+IxM2crTVa8p2v8fcR9eT5WTVmLO4gn7UWqfyUtwz7BJir8DBvhLn6
	/y3/csQp3tiXeQdbIlDAasrLG5Diix9CJd9INHL2+thwtLD85+IaAOGOSwrzZVpRiCuyFv+G5QL62
	FRlV2WdtPyrzGYzTsYDB659vLwi1/s/9u5wAh6cfaw2Mw5B3LiwVnYwehgKHX9KTpqGIsy6suLhIJ
	F1zO9L+ssnoU2jisML1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OPW-00GKD1-29;
	Tue, 21 Nov 2023 10:55:18 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OPU-00GKBy-1O
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 10:55:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2851cc359c1so1332987a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700564114; x=1701168914; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzKhOUKLZx+pr4SVfAMWtXoFfmy98an63KyE2M6t84k=;
        b=L/qLOkbNUvFfATCOeehXdjgeZ0FaDLk0BJ95P6kRO2/EBd52nZ9OVO4je6K1ELIMfT
         981cMcVtys+ZiOU58ZYARNUxjzmkVFz3GRBBkvFadIRB6FlKmEPPFM9Q+TUEHIRyHcaL
         Z2LPAxPqWhl2NuZ5PHGacynUGGW3BRuRckUrSoWUUpItXke2zJ+R+aYcZ/uW0hvHwn6k
         hwE1UIA+BBJ3COhlfS6yLYtmnSap/pO91rMQdIjlVdqJqkBOQ7LWuYZLSXFm1ZJC2jyz
         3PjEXemNNjj1HLKP1G0dS3bCLGgaqoO4sMH3/Tai8++YGCThlnuDf5U+0setKApMqde9
         Z/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564114; x=1701168914;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzKhOUKLZx+pr4SVfAMWtXoFfmy98an63KyE2M6t84k=;
        b=bevl+4o5N1fO+k0ReOF5ROXnX/fQjEdl2t3KbmjZB9VGg5b2T7X2OedeH5vQeHnZsJ
         jmCVlVwiC94arK0eOD1G1a85KFbI2YJpIKsdLnkNy9FUjuT/xw0a110+mqpuHuMoevnG
         7cJie0FqHTK6UqVBGrJRhHEeHXNtCY4UPIDIWYNow1XE/oJgcUPLgKHZ5a6j7Gye3vby
         0pzpajqCsQkSXapeFgskeW1/TRB3Vd8OCiBbMoyaaSHLhWIvLC61XSVGEHtrn51vBdZ3
         BV44b3u6t1CvZwPXmiEmwT8qbJmT2r9uzUExbW1b+SEbeKwitgY+O+Ir5GILsBjxQUvt
         f/EA==
X-Gm-Message-State: AOJu0Yy5Wtv/gxlJcnHjomgbWAUvN6tVmXt6Ldpt6fvA48P0XPD8o05i
	J0VNsNb/5hvlndytyEj+IGYXkQ==
X-Google-Smtp-Source: AGHT+IGpo4GmETcpbWDFdme7zudYwMnFovLtMACr2PLZcHekMbKtafj/QTIGaeb+fzIx1InGwWUNwA==
X-Received: by 2002:a17:90b:3ec2:b0:27e:31a:2ab2 with SMTP id rm2-20020a17090b3ec200b0027e031a2ab2mr7901807pjb.34.1700564113881;
        Tue, 21 Nov 2023 02:55:13 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:5aed:1852:f03:f8df:692b? ([2402:7500:4ce:5aed:1852:f03:f8df:692b])
        by smtp.gmail.com with ESMTPSA id g21-20020a17090a579500b002777001ee76sm8937627pji.18.2023.11.21.02.55.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Nov 2023 02:55:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231120191856.GA964@sol.localdomain>
Date: Tue, 21 Nov 2023 18:55:07 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 andy.chiu@sifive.com,
 greentime.hu@sifive.com,
 conor.dooley@microchip.com,
 guoren@kernel.org,
 bjorn@rivosinc.com,
 heiko@sntech.de,
 ardb@kernel.org,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <9724E3A5-F43C-4239-9031-2B33B72C4EF4@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
 <20231102054327.GH1498@sol.localdomain>
 <90E2B1B4-ACC1-4316-81CD-E919D3BD03BA@sifive.com>
 <20231120191856.GA964@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_025516_524645_39471E1C 
X-CRM114-Status: GOOD (  17.69  )
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

On Nov 21, 2023, at 03:18, Eric Biggers <ebiggers@kernel.org> wrote:
> First, I can see your updated patchset at branch
> "dev/jerrys/vector-crypto-upstream-v2" of https://github.com/JerryShih/linux,
> but I haven't seen it on the mailing list yet.  Are you planning to send it out?

I will send it out soon.

> Second, with your updated patchset, I'm not seeing any of the RISC-V optimized
> algorithms be registered when I boot the kernel in QEMU.  This is caused by the
> new check 'riscv_isa_extension_available(NULL, ZICCLSM)' not passing.  Is
> checking for "Zicclsm" the correct way to determine whether unaligned memory
> accesses are supported?
> 
> I'm using 'qemu-system-riscv64 -cpu max -machine virt', with the very latest
> QEMU commit (af9264da80073435), so it should have all the CPU features.
> 
> - Eric

Sorry, I just use my `internal` qemu with vector-crypto and rva22 patches.

The public qemu haven't supported rva22 profiles. Here is the qemu patch[1] for
that. But here is the discussion why the qemu doesn't export these
`named extensions`(e.g. Zicclsm).
I try to add Zicclsm in DT in the v2 patch set. Maybe we will have more discussion
about the rva22 profiles in kernel DT.

[1]
LINK: https://lore.kernel.org/all/d1d6f2dc-55b2-4dce-a48a-4afbbf6df526@ventanamicro.com/#t

I don't know whether it's a good practice to check unaligned access using
`Zicclsm`. 

Here is another related cpu feature for unaligned access:
RISCV_HWPROBE_MISALIGNED_*
But it looks like it always be initialized with `RISCV_HWPROBE_MISALIGNED_SLOW`[2].
It implies that linux kernel always supports unaligned access. But we have the
actual HW which doesn't support unaligned access for vector unit.

[2]
LINK: https://github.com/torvalds/linux/blob/98b1cc82c4affc16f5598d4fa14b1858671b2263/arch/riscv/kernel/cpufeature.c#L575

I will still use `Zicclsm` checking in this stage for reviewing. And I will create qemu
branch with Zicclsm enabled feature for testing.

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
