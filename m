Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05BFC25B75
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 12:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UiHeIr1RDgqIE1MmD+DcQYON7me/6tqSzcMPtLJ7X1k=; b=lTJrvmLFAtOu8y
	xsyUnXcJH54CjvxfUCvl17re9pq3e7mUy2Ysf5lpA9KJA41lKFU7PQADoL1u+5cfqQw4W5rEBzDfH
	TVf8hSNfom9TFI5aQEErM8ouxkX6l3sYp5g3u7a+9X90SWSy4vFyUBYGaY6JFTvrTDUBk03N39NIk
	ucupGO6iV89aveLi2SNIq6BoPTFx/nBns8Lp2EcgKm8tXEHU2VAmupB96q8qOC4DENAkHAT+pm+HQ
	iLpGmbyxzD33D5DODNgcFP74Nt81F/FOnRMb4s8lcELC9+Kv8aeQF6wKdQvjQbA2vBvkoDOXJnXsz
	ANbXxOQwEVbYqqGfT+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Uec-0000000Cn3w-3T2i;
	Mon, 13 May 2024 12:19:42 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6UeZ-0000000Cn2h-3eeo
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 12:19:41 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5231efd80f2so1330463e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715602777; x=1716207577; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8L/LGEdbYWy3n/pcSAT/GyWHwJx7dxF0kLj8R+dCsB0=;
        b=TJZohvkescB4FmVxnAxYqKhvfCuhzZ9tOpG6SlPYj5c4qvzQvPjw/NoomGcD3+2HdA
         xFNYY4rGGy03nEtt0TjoqP01rHwtzRRRribdwAL+sAIlaz9yvbDFA7/IimtlrsrJlPCd
         lBwE/NlF7WG/ioRX2ujq6f4iWBxr0baJ3xSASCkMGFqwh+aLyOAczGltS/AQdvcqJv6h
         x+CFEp1XPAAe3b00iXekJ3sTgjLJuhSkZ3fZOvb01/2fYBsvhusXVnPWIam7IjVBMCLk
         1PAFsv9VpmEKFgo/01klb/buHXU5QEwskNJlMDaTY1zjLfJbGAHIMNx4hGtfLNzZcVyd
         Gklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602777; x=1716207577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8L/LGEdbYWy3n/pcSAT/GyWHwJx7dxF0kLj8R+dCsB0=;
        b=Ar8OQKTfGB5XsjdCz23T3EMkbRFufr6g/9GW6eRjCNz8KHEHZWnopXt7GYmAmfDKyU
         QbI1Nk8hHrlpnKA7B4woCqMaxO9yrR6FC4JYVzPxuHajK67hwuui+OqANScKfS7jmet9
         sEzxHGxw6DkOGYwv0hEfVM71le3/s+RilvvMh2fEI3wmzgzH38IzKRSQ19bFHGY4KAb7
         I6jSFP7PByeUNKVIz9JhcMQYv1mZkXakScyFKQ/cVxdou7p3TlH98FJD9w4nKMx/4P06
         6wk5SwiqTLtJ0klSui8X8A2f+ALmKZADU5eXgeeAuUQ7a/VNOf+jWDONDiO5Pit2aqO+
         IbiA==
X-Gm-Message-State: AOJu0YxonfaySCjoeHhQMRprJHgPMMbFHRoo9Ypyb2go1s1YTP9hyXY8
	AEEM1X8VL6y+wti1+54NouNpU7HVaw2ZRFTrAhbO5umwqUnHVFdFkL2TNA==
X-Google-Smtp-Source: AGHT+IHuoOCEsuuNr9KrnLv9p3r8Mhs8s29YWJn5PJnOT3FZCmiVNVLYLg9FQp1cubrOUPhZyOyh0g==
X-Received: by 2002:a05:6512:290:b0:522:32c0:bb6e with SMTP id 2adb3069b0e04-52232c0bbf6mr4582288e87.23.1715602776449;
        Mon, 13 May 2024 05:19:36 -0700 (PDT)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d3396sm1721134e87.132.2024.05.13.05.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:19:35 -0700 (PDT)
Date: Mon, 13 May 2024 15:19:34 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: Re: [PATCH] riscv: prevent pt_regs corruption for secondary idle
 threads
Message-ID: <ZkIFVtHKRKE2Zm9n@curiosity>
References: <20240424221927.900612-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424221927.900612-1-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_051940_089455_AC92D399 
X-CRM114-Status: GOOD (  12.13  )
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

Hi all,

> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> 
> Top of the kernel thread stack should be reserved for pt_regs. However
> this is not the case for the idle threads of the secondary boot harts.
> Their stacks overlap with their pt_regs, so both may get corrupted.
> 
> Similar issue has been fixed for the primary hart, see c7cdd96eca29
> ("riscv: prevent stack corruption by reserving task_pt_regs(p) early").
> However that fix was not propagated to the secondary harts. The problem
> has been noticed in some CPU hotplug tests with V enabled. The function
> smp_callin stores several registers on stack, corrupting top of pt_regs
> structure including status field. As a result, kernel attempted to save
> or restore inexistent V context.
> 
> Fixes: 9a2451f18663 ("RISC-V: Avoid using per cpu array for ordered booting")
> Fixes: 2875fe056156 ("RISC-V: Add cpu_ops and modify default booting method")
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Friendly ping about this fix. Any thoughts/comments ?

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
