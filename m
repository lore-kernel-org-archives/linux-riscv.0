Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B99EC7EE2E
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJ++hSnD42mXJO/AE59kaHjbkBhc9gKE+jdqriZ8DC8=; b=yEQkwlboNcoYUM
	tr+pPN5WpzVAUXJu2aSNkudLc9R161I6mYpd8argzXZ4vJGwyBIjoJv8NhfpTBEC0/xaNE/n/Pwhq
	P7n8AnAsgxun4lZAMIalNFbbRP+jqbNQiX4ckYs6J5vgjSa1H7XodovXsPctzbtUAsQdCWg7+Ygpp
	YJM7x9kfKpyokbeL0sTjU2lnUwuh5a0in4y2SxXwmc6WRa1jq6yQF/bIVIlQrUxTr2J/b0AKp8N8W
	zue5c3FaBUooD+66Cf0VFl0N8YiowoJwtjk2Ahzg+5yNd1ZYnQmzs1TNG4iuqYOZ5QF4KEtnABtta
	ETeMmV5XmkI0Lzlyml1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MkR-0007uS-38;
	Wed, 31 May 2023 14:24:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MkP-0007sI-0P
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 14:24:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so61277015e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685543057; x=1688135057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UX4uQnFBny46FGtELxF82bEZ7MtHQbRmUfHqzbpy2lU=;
        b=IfZ/Ty5r3Rvqpyw7mbNjCMOnUMNLWEjwe+gPBeXaNQKgtzbrn43qBaFsQ01WG62yjv
         XME9SbyP0N5U1D9NoQRBkV9Zhqo1YGZZ53aXrSteaeilPxLX2+XbnbvtmK8KVitIuNum
         BTw0oVjDbhu+LZvVe9vwdVAdbPm6FM6OrfIGRXCfRJwEyWbKyAxPmC0AxCpZ/t4lXnVG
         ZEbjJhaOYnNF5I7VXOD2aSrPOgT/5V5ayPDbsai1cu/XzZW/x1EOnDPlftPM1zLUo5hK
         LpNd3f3eYdQgduYWjrWRqJHgEFVdyS9CpXr7n4tqRw18zRe8skA+G5OYnlILCzE7fCiE
         4hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543057; x=1688135057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UX4uQnFBny46FGtELxF82bEZ7MtHQbRmUfHqzbpy2lU=;
        b=jNKwCZU8rMYsTaW1i4Zw0B9Y5MwZv2qJv6Ucz11C7Mx8UvtplCiaeiLdfyoyu1ALr2
         Y1np2gg/XYCOos7/R1fSXpkyPmBCHsixIXAofYkr3WOaKYn3JpBRbqQJUQ/JB+yYcAyA
         UMQuFlfKYxjUA1H5BtMbDScyaFmCKRrc9mfFM2mFuScgeFnnAhZ4N1TQ25DBSY918q+8
         8wX8pCDPZ7pl6Gjp6Kzo4ClXfr0jsSNleOM2EY8TM3OGhQbnK93fyzY03May0KfWrbAT
         eJv+oIwDXM7lvS2U0LwsRY9mRvHXbFnpMhL+EroGeQdEOOasFZTiJwZirM10lddoZCJy
         egnA==
X-Gm-Message-State: AC+VfDysFyWrJxuwQF8D0mhUymsD4dvhuw9tAinCE1YMuqnMTxxTWvLw
	dGEA2ZQpiUSRONeid2VMBGsPG7V58nTnePMJT2E=
X-Google-Smtp-Source: ACHHUZ5dPMhB9kse11TIMIIwrwKdudQXmklhlG9pDb6dSrstXMUpAu5VAPxTeBjZUNfqusU9DTLd+A==
X-Received: by 2002:a1c:f30e:0:b0:3f6:e42:8f85 with SMTP id q14-20020a1cf30e000000b003f60e428f85mr4390658wmq.37.1685543057440;
        Wed, 31 May 2023 07:24:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003f4ebeaa970sm21044711wml.25.2023.05.31.07.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 07:24:17 -0700 (PDT)
Date: Wed, 31 May 2023 16:24:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/10] riscv: Prepare for user-space perf event mmap
 support
Message-ID: <20230531-107c91fd5c1926f7c8a2a25d@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-6-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-6-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_072421_165383_065ED1F9 
X-CRM114-Status: GOOD (  15.43  )
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

On Fri, May 12, 2023 at 10:53:16AM +0200, Alexandre Ghiti wrote:
> Provide all the necessary bits in the generic riscv pmu driver to be
> able to mmap perf events in userspace: the heavy lifting lies in the
> driver backend, namely the legacy and sbi implementations.
> 
> Note that arch_perf_update_userpage is almost a copy of arm64 code.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/Makefile     |  2 +-
>  arch/riscv/kernel/perf_event.c | 58 ++++++++++++++++++++++++++++++++++
>  drivers/perf/riscv_pmu.c       | 41 ++++++++++++++++++++++++
>  include/linux/perf/riscv_pmu.h |  4 +++
>  4 files changed, 104 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kernel/perf_event.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
