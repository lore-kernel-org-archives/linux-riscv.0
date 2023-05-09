Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCDBC7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7u1LG7jk7XXmhA/tKue2qw5df8Qht0rhjpad0G9Gyw=; b=ie+5OR8PJmnS7D
	/tTEA6MTjHz+UE9ON/hTgZxb1Gq9ny9qMx6cfbqUSkDwOwSmpQVljvjtmvuR+A7OzxU5EWJnFJk8h
	FBpdzqoh9veMPKZ5zb86P0a6OKZJ1KLqwtswZMml0WNOOzadRMzSR0UbM+bi8G3Rt4e5G+yroLmjp
	PBEOiAVUKCYqeSts0O9CfbhZ/VERXrDBOhvgaRmgEzm5PcRyRogWqUAJnU3d0yJcriSnu5SQZvsSV
	4ffxjBBoLJK4YUXerxQlKNUX/F1ljzma+Vg6GpLJmNDRklWbSH3FScWLUglzeVDi9HdtS02LoAvbI
	Qomt9zFp419unV5Sbp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwJSa-002i0T-2A;
	Tue, 09 May 2023 09:16:40 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwJSY-002hzt-1W
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 09:16:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96598a7c5e0so887884166b.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683623795; x=1686215795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ESRtU13Q20lhgeVgaqet/6dyVYxVu+bxM8k/smriowo=;
        b=Uk9yV9EyvHzhIP9kQ+L+aLwpbcYJw1tTqOttKI4POpX+hA4O4NDfUG3ka3/m2DtpdE
         Eemk7BJUMb9ZkBLuGazl6xBfCKUKmdzhHSuoxt4zDCLasBmsLizqoiHoneiIKLJJRyrW
         Y5tG6BAXpb7Vfr+1MhNPNxZECG1gZRQfOeUmmC9a5E8JM9rIKrQc7VLHMZxyWhnHeIFh
         2a8NTd4q3bNYASOU2Cac/W2zI0IbbvttC2d7h90vrBh8399jtsYp17ggv7ACRxEojd8U
         2sWeyh78aLiWJ+GjfzeajzPsZg1KKQgX4kRyeb3nojUihhVA1xRnLT9bWe3wfo5XEOL9
         yUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623795; x=1686215795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESRtU13Q20lhgeVgaqet/6dyVYxVu+bxM8k/smriowo=;
        b=AE4OESVOWcWzxzuR2cEAGB/4Yu29d9K+XPTPjSHh0D0UAPbIOkkRXGXhL7aRHxHKK/
         S68/ABvMMkhpSVAPAThCAm/3crXjb4O4KCfprzYSt0AhoLTNc2qA5wUPN/b4E0pWtRV7
         GrzU8ZxAD7Oyf+K/QGkufysB2wy2b5L1ihbxw53NCV9BG0KG/6DtPQwHHcJUtkyZJVbR
         NS0s0cN1mmL1VrCwUWcHk5kx69Wh1SG7/wGg3j7EpfSC/wOO/44Rbqvy1tuiWhrliCes
         tnZ0hdl7L/XrOB3L2P/EJ/lwws0eSAQlTegkMKFgDIpPnWhqPb6YMwWwrN04vM6IzwKu
         6ynA==
X-Gm-Message-State: AC+VfDzzsjny+lsRUuQgL0MVb1JLdDRaxHsYTYNMYGc+9Ws0kBUyw5th
	wZIFi7T2kVXQIbNZ77QwBRKCig==
X-Google-Smtp-Source: ACHHUZ7kR7bw/QdypkzfhJj3HmFGbVzTl2TetUM9WWyvfIlLdthtP8NbOw4V8SxZPoR7McpL7hnx9g==
X-Received: by 2002:a17:906:d554:b0:94f:e98:4e94 with SMTP id cr20-20020a170906d55400b0094f0e984e94mr11440790ejc.47.1683623795051;
        Tue, 09 May 2023 02:16:35 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7da17000000b00506987c5c71sm533721eds.70.2023.05.09.02.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:16:34 -0700 (PDT)
Date: Tue, 9 May 2023 11:16:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhangfei <zhang_fei_0403@163.com>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	zhangfei@nj.iscas.ac.cn
Subject: Re: [PATCH] riscv: Optimize memset
Message-ID: <20230509-b0dc346928ddc8d2b5690f67@orel>
References: <20230505-9ec599a36801972451e8b17f@orel>
 <20230509022207.3700-1-zhang_fei_0403@163.com>
 <20230509022207.3700-3-zhang_fei_0403@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509022207.3700-3-zhang_fei_0403@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_021638_509774_8BCB758C 
X-CRM114-Status: GOOD (  18.16  )
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

On Tue, May 09, 2023 at 10:22:07AM +0800, zhangfei wrote:
> From: zhangfei <zhangfei@nj.iscas.ac.cn>
> 
> > >  5:
> > > -	sb a1, 0(t0)
> > > -	addi t0, t0, 1
> > > -	bltu t0, a3, 5b
> > > +        sb a1, 0(t0)
> > > +        sb a1, -1(a3)
> > > +        li a4, 2
> > > +        bgeu a4, a2, 6f
> > > +
> > > +        sb a1, 1(t0)
> > > +        sb a1, 2(t0)
> > > +        sb a1, -2(a3)
> > > +        sb a1, -3(a3)
> > > +        li a4, 6
> > > +        bgeu a4, a2, 6f
> > > +
> > > +        sb a1, 3(t0)
> > > +        sb a1, -4(a3)
> > > +        li a4, 8
> > > +        bgeu a4, a2, 6f
> > 
> > Why is this check here?
> 
> Hi,
> 
> I filled head and tail with minimal branching. Each conditional ensures that 
> all the subsequently used offsets are well-defined and in the dest region.

I know. You trimmed my comment, so I'll quote myself, here

"""
After the check of a2 against 6 above we know that offsets 6(t0)
and -7(a3) are safe. Are we trying to avoid too may redundant
stores with these additional checks?
"""

So, again. Why the additional check against 8 above and, the one you
trimmed, checking 10?

> 
> Although this approach may result in redundant storage, compared to byte by 
> byte storage, it allows storage instructions to be executed in parallel and 
> reduces the number of jumps.

I understood that when I read the code, but text like this should go in
the commit message to avoid people having to think their way through
stuff.

> 
> I used the code linked below for performance testing and commented on the memset 
> that calls the arm architecture in the code to ensure it runs properly on the 
> risc-v platform.
> 
> [1] https://github.com/ARM-software/optimized-routines/blob/master/string/bench/memset.c#L53
> 
> The testing platform selected RISC-V SiFive U74.The test data is as follows:
> 
> Before optimization
> ---------------------
> Random memset (bytes/ns):
>            memset_call 32K:0.45 64K:0.35 128K:0.30 256K:0.28 512K:0.27 1024K:0.25 avg 0.30
> 
> Medium memset (bytes/ns):
>            memset_call 8B:0.18 16B:0.48 32B:0.91 64B:1.63 128B:2.71 256B:4.40 512B:5.67
> Large memset (bytes/ns):
>            memset_call 1K:6.62 2K:7.02 4K:7.46 8K:7.70 16K:7.82 32K:7.63 64K:1.40
> 
> After optimization
> ---------------------
> Random memset bytes/ns):
>            memset_call 32K:0.46 64K:0.35 128K:0.30 256K:0.28 512K:0.27 1024K:0.25 avg 0.31
> Medium memset (bytes/ns )
>            memset_call 8B:0.27 16B:0.48 32B:0.91 64B:1.64 128B:2.71 256B:4.40 512B:5.67
> Large memset (bytes/ns):
>            memset_call 1K:6.62 2K:7.02 4K:7.47 8K:7.71 16K:7.83 32K:7.63 64K:1.40
> 
> From the results, it can be seen that memset has significantly improved its performance with 
> a data volume of around 8B, from 0.18 bytes/ns to 0.27 bytes/ns.

And these benchmark results belong in the cover letter, which this series
is missing.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
