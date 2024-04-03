Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73711CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltPXd6K3SfAp8bPQU5lnIaEDNi4q7ke8ghH5+GdfSjg=; b=nmJPvyWCgVlpDg
	n4EOCkivmFg+iFU175/OjQXyRvobYhYHUamu3jjdyRSauT2UXqdLLT/Q+io7cXvMEnyJUahCwUEyu
	Yp4jxGzoV1yO3+DN0Nn3rL6APoxHZuVWal6L71/TB1mpD7Xs2vWrT57vR4o1pV73UkI4OuyCH334n
	j+ABwQlB3BgZOoVOGqQypUXTflYmdNWqT2CqsAadnPBbxl92jkajM1rcp9Mle5mPOu0xHtDcx8tqC
	N7sz4CCYCKEV2L+VuEonBzhlrB1LrcWtZPFZbEDKN00AYbpP4Q/zxOzTmSr+dshBa2t2LlvU2+yBK
	VYz/V09MLKfuQRc51AoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0dG-0000000GC5h-0Cla;
	Wed, 03 Apr 2024 13:26:26 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0dB-0000000GBzw-1SaV
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 13:26:23 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2a271c6d3f1so1091655a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 06:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712150776; x=1712755576; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kr5yQL8fx0u0tyLMbu3sLuMSllEG5G+mAeHccxYfdVY=;
        b=QgRJrPYfdO9Ou4FO3R9mSMMLTE5SE9CYhbVY5l1fKuZyCV8WfwmeGA+N4u90yr5HD4
         KoBGXbezJDMIqObmJ4RhrKQ1JVu363ppUdFufIQfhpL0PW+75d+F/5qEWRbZMjmuShO8
         4DBE1OtOGuLMscG/UOLCiNwWLaZPUCjYdSCCcbMFP3M/NQQoVaTEMWct123xqLXRZ0UN
         Q5prjnDE199iOmaqHIoXndAX2613xxFVrdxc02C9kgs68xsk7BRddF0J6SkWZLIaj6Ot
         uONHHzWSIEmIiHjryYvE28lmDjJAgppR9+cvh2UrfYTJT2R5w34RerYjtqNQIuzjUiLT
         ieNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150776; x=1712755576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kr5yQL8fx0u0tyLMbu3sLuMSllEG5G+mAeHccxYfdVY=;
        b=R86WKZhLwpFuZrR/wyTHTHZ1406CyGweAxrnbULMW5AHr3F0DjjKcx6OLLwF+/0syR
         WTtwVYq25iGZp18wHP7oySh62XJfazQeuYF1m5xMHXW9tll4c6zr+9ykIgnzr7Aud+Gk
         NQGGYvruoezkfJsnRLFC6xBynDIcJqK+QJI0tLu11DioOPgrMmLATqAjN603TomnTJJ9
         pX7tBCdp6wOYbGUCF4cSqO+p/k8Xd26l8gIT3VsAM3D8vRksLUUQEMzQWrS3U2LQyxOh
         Vi+GWqTLkRcA5idRB0FG4YLz0SF7X46HRDQsX+OlKUD7D8f66Z4urKSQKIMpqkydm9x+
         Xb3w==
X-Forwarded-Encrypted: i=1; AJvYcCVPYF+ah3+F+7ke9wSygDftlb7io7HWUQG5mSRrcN2KHfT8P+4tyhgXjTEXIANFSIxMclonm4OJc8B/uVLLssAZMxl1Ec1gOysWrXNvm+iI
X-Gm-Message-State: AOJu0YybxsCmIDQanYDLwl/KL/QuVC5QGKNTvAtxG9eYGdbf1gGbMkn0
	+x+bbG6vDxIMQVdiXs1YMVwEEARvf/oD8+svs9fPHn7Os/q9C2lETyqNtKudW5D/PIMcpYoqzhF
	61TnO+7SnvIcvTG87PcLVdF9lisjQ/CujDHlbHQ==
X-Google-Smtp-Source: AGHT+IEak/WLSgffbuVSjwab06JTulWpxWfMzkQ8I6F5L8nOzPRvaiqB048L3gfCz5mrvMfqk7JY/JqIUVyg8IDxNG0=
X-Received: by 2002:a17:90b:19c3:b0:2a2:a7be:3b5c with SMTP id
 nm3-20020a17090b19c300b002a2a7be3b5cmr1005626pjb.6.1712150776261; Wed, 03 Apr
 2024 06:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtj3aBdRreBmKZDQApEe2x8mugycPgN+_J5ebJzXDEq4g@mail.gmail.com>
In-Reply-To: <CA+G9fYtj3aBdRreBmKZDQApEe2x8mugycPgN+_J5ebJzXDEq4g@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 3 Apr 2024 15:26:05 +0200
Message-ID: <CAKfTPtC9YgbZgGNK82MhhzzsD3P6j64+w6oieJMDKQNOmrC4FQ@mail.gmail.com>
Subject: Re: kernel/sched/core.c:961:15: error: incompatible pointer to
 integer conversion passing 'typeof
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Linux PM <linux-pm@vger.kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_062621_455513_7655B5F2 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Hi Naresh,

Adding riscv people

On Wed, 3 Apr 2024 at 09:38, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The riscv clang-17 defconfig build failed due to following warnings / errors
> on the Linux next-20240402.

Could you confirm that there is no problem with other arch and/or
other toolchain ?

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> riscv:
>   build:
>     * clang-17-lkftconfig - Failed
>     * rv32-clang-17-defconfig - Failed
>     * clang-17-tinyconfig - Failed
>     * rv32-clang-17-tinyconfig - Failed
>     * clang-17-defconfig - Failed
>     * clang-17-allnoconfig - Failed
>     * rv32-clang-17-allnoconfig - Failed
>
> Build log:
> -------
> kernel/sched/core.c:961:15: error: incompatible pointer to integer
> conversion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node
> *') to parameter of type 'uintptr_t' (aka 'unsigned long')
> [-Wint-conversion]
>   961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There is no recent change on this code. Could it be a change in
cmpxchg_relaxed ?

>
> Steps to reproduce:
> ---------
> # tuxmake --runtime podman --target-arch riscv --toolchain clang-17
> --kconfig defconfig LLVM=1 LLVM_IAS=1
>
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264917/suite/build/test/clang-17-defconfig/details/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264917/suite/build/test/clang-17-defconfig/log
>
> --
> Linaro LKFT
> https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
