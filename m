Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F22AC77B7D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 00:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyAQK0CmWk4L73C3OtyvBlqRKrT5GHsXpNZSO4hXY1A=; b=ZrFwULQl7AGG/4
	W/2sLSKg3ONa8aoCeuXru+ISe7hC2muSHlhMUuIIlQZIoU6r3veDlVXBREEL26ZXZN42YKdyviIBQ
	Z+UqCdFOP4mhwAx5twHk8Ik0LOvw7vv01V4q9JigYzGvyqDPii79rv0Imvygc8SkfrOw2KARcl6CX
	YOES9w5Qy/730H1azMzEP3oVas0/XQZpGWNNZ913VSahDIXjtSZh871Ru5d3pvs5yoxPpHrxRBjK6
	P0PFLVkjQCQZSzkvtp4LsRy0BclDZzw79qjtTwgNjVqtzlgbGDJNPrKUY8toFbX/GMTFPkUJAPKoz
	WdlQ8V+xWuVMQRhJCG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzo92-00Ea4N-2d;
	Fri, 19 May 2023 00:38:56 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzo8z-00Ea3Y-3D
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 00:38:55 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-33114404c9cso963715ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 17:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684456732; x=1687048732;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7/jPM0KnH+FwZjtmXcaKFjOjxDtUtKIRA4syAmgc008=;
        b=fmjVDjbt+kVlfJJwbXQK46gG++Iuw6KXHsivhDuvDS1k3OJpQOQpec2T2c0ma/iqQN
         9WeSajyeQsFTZLYH+IeZpzrbcJzTbvXie0lgLosHMSjhrMgYpvYY00G4EHMPgrvi/Iu7
         tenMCSZl7X6Sx3vKHFEsDse1sK6aOo9BlIjqXMsUfRbjFkGXnAzDm9lEdyUKq9mlWbah
         zASFPie7alKP0oNfedYyG7FvDteT1lmEtAWg4J3HHFpfWvz6xut2TzwAIjl2xAf9qhFd
         ud+gIUTwV59X4gLBAG8ikBAGXop4+zMT79TM2ItusYqCkJffT4YMR2Qhr2yOj532k4Uo
         p0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684456732; x=1687048732;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/jPM0KnH+FwZjtmXcaKFjOjxDtUtKIRA4syAmgc008=;
        b=PURhaydPWH523T1v7auBMOUthzaJrYkJIKsdKCUZtVrkj/BMmMDzLbYrqNQ2UrbiXT
         GmCTC0JTXYJBErOKIVSz9VImxrFuekMe3o/JDCsNU5EJ6fo2MznxA3f9tctvvgcJIZFp
         VQvaCQ4nbpYjpMlcUXiFFxFjcbHkPud3iMu+BEqrzZumOpT7ZIXxPLk26Y1q+JehpyQU
         LycZsHqmvjIkistPq5H9xt6WcDtggOD/pstPpxOfCxOY1qIiYLhXbFynqKWd0Inepg+K
         ypZbgTAYk7Eq0Xo4sc+a95IYrUKjIOKBo3l2oWwbckzAdHuvOFpquwZD8uU0SXu4hAmk
         dXmg==
X-Gm-Message-State: AC+VfDzYq1kE3/TW3FeCBEK1KIVSrGHU104W/gBBbWcoAVvKEEq6szGE
	4a0ExMIABFn57sbyDlnSHzv3sQ==
X-Google-Smtp-Source: ACHHUZ5LcaA26lj0MuLputKQFfYR1Y7nG2KPFDIiKERvOLPuxhn7bS0bUuvXzticQqEP+j2ZkW7d9w==
X-Received: by 2002:a92:c707:0:b0:335:8542:440c with SMTP id a7-20020a92c707000000b003358542440cmr530202ilp.12.1684456732398;
        Thu, 18 May 2023 17:38:52 -0700 (PDT)
Received: from localhost (c-98-32-39-159.hsd1.nm.comcast.net. [98.32.39.159])
        by smtp.gmail.com with ESMTPSA id m20-20020a92c534000000b00337b078ce44sm669216ili.0.2023.05.18.17.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 17:38:51 -0700 (PDT)
Date: Thu, 18 May 2023 17:38:50 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Arnd Bergmann <arnd@arndb.de>
cc: Palmer Dabbelt <palmer@rivosinc.com>, guoren <guoren@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
    "Conor.Dooley" <conor.dooley@microchip.com>, 
    =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>, 
    Jisheng Zhang <jszhang@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
    Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
    Mark Rutland <mark.rutland@arm.com>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Mike Rapoport <rppt@kernel.org>, Anup Patel <anup@brainfault.org>, 
    shihua@iscas.ac.cn, jiawei@iscas.ac.cn, liweiwei@iscas.ac.cn, 
    luxufan@iscas.ac.cn, chunyu@iscas.ac.cn, tsu.yubo@gmail.com, 
    wefu@redhat.com, wangjunqiang@iscas.ac.cn, kito.cheng@sifive.com, 
    Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
    Greentime Hu <greentime.hu@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
    wuwei2016@iscas.ac.cn, Jessica Clarke <jrtc27@jrtc27.com>, 
    Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH 00/22] riscv: s64ilp32: Running 32-bit Linux kernel
 on 64-bit supervisor mode
In-Reply-To: <556bebad-3150-4fd5-8725-e4973fd6edd1@app.fastmail.com>
Message-ID: <454dede3-5f20-74fc-975a-e11e4d8b5648@sifive.com>
References: <mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9> <556bebad-3150-4fd5-8725-e4973fd6edd1@app.fastmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_173854_030032_40DA713F 
X-CRM114-Status: GOOD (  14.01  )
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

On Thu, 18 May 2023, Arnd Bergmann wrote:

> We have had long discussions about supporting ilp32 userspace on
> arm64, and I think almost everyone is glad we never merged it into
> the mainline kernel, so we don't have to worry about supporting it
> in the future. The cost of supporting an extra user space ABI
> is huge, and I'm sure you don't want to go there. The other two
> cited examples (mips-n32 and x86-x32) are pretty much unused now
> as well, but still have a maintenance burden until they can finally
> get removed.

There probably hasn't been much pressure to support Aarch64 ILP32 since 
ARM still has hardware support for Aarch32.  Will be interesting to see if 
that's still the case after ARM drops Aarch32 support for future designs.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
