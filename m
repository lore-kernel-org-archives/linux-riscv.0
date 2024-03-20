Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12428C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 23:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vindyeSBIi0+tARGzh1EfFacGt+Qnlva0WjfaaUa5tw=; b=rU7Gbyhmojl/Ye
	38SoxOafHXFJjBMttBWz5XVHb9SCB1RGoZf6ZktnpB+kP1QBCbkc5Gtq+cz72y9D0h+G1lkLJbUtm
	BYzKnLhFVUKkjhzO7tOh7MAxUHV7WKv8GsAkdk6m/+icDk+pSQ/s3vjPmov87iMtvi6DBM8+y8Sc6
	ceuK2HgSnJtuxJBimr3CWYnXajoxeuZQ6t9nV1g7VGh7TxNZhXQhqhWPkefsAqsF9ECh62W0hHaa5
	dsr2Cva8yhSsDGaVK4XwWLuij/OBjCKPnY7fpCWrzwHoLqM8YKJcvNxXXOt6v5QQ8Hic3ffFpTrp/
	nVBwM1M59cBl326nNjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn5L5-00000001FcM-3PSS;
	Wed, 20 Mar 2024 23:27:19 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn5L2-00000001FbC-30MB
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 23:27:18 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so358074276.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 16:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710977234; x=1711582034; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q6wHVvQOpEVBe9GN/RDfS0/7UHobpz6yHjFxam80y4A=;
        b=oGTueUn7XAQtiyY68liNFCTxBgFIVvmfM2aQITlKswhcrAS3PZuUrQP2Tp+nG2kiFX
         kKRgsGXS5wHv1v7P29bLvxruqDJRjHe4uKoS5PZyOK/8VEjzKu61hF0IhldJRbp2gy6c
         /7psOKXRXUMpUCvpioQr0WOZFCQNj+dLI6zmwz5rgJ7KGFkiYo1hHHP6m8CAOkuYwORy
         e3J7ouQ+cNoz/CT5pN+aiHv4MvOwiN/p3LWj6nOwkQ1StHOEWYB+JGCwh8e3vGKtUTum
         SJjsG0td92nbUD8nEt5MtVmhkSec+xppCQSIvFCcCV3uwrdUq9OkdkWev5LD302B2wl1
         BAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710977234; x=1711582034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6wHVvQOpEVBe9GN/RDfS0/7UHobpz6yHjFxam80y4A=;
        b=Itvr1oGj5of2uNGzoV9dziBsnDrrUrKxfcHKSEXj+zMfSM267xGpwJplLm3DAtEZyh
         0en30nSR7Iwi6+9xS0RufCByYHRPIoq6cAduoYQAkYzXg3Fl5EO8dokvczmVNLBmIWVD
         tHvFktYb5HTSDpxxhqG7PtzxSKWCQ63ty+WFWib/QBj4jsRTiUh0OJcDVjVcmlyFV/tV
         JWVmlupJVPcslAtJhislm28XRpr+HfdJwMBiIpZafwsOkn0jl7+Je+/8tMyaSFZ4elFa
         EzAAIyX6V5NmOu/l+09EoqbQhywWb1F/kcwLeJkV7bUdpW2651EMUua2mm0+L9NlLua4
         s2qg==
X-Forwarded-Encrypted: i=1; AJvYcCVnOP+yhnf0P327nXcyDnl9YHiiN4pQPol1KIwJDxd/CZLostZWdtlM/iJXa+PaF4bIvdb03uM0mj0n6s6pkTshwAwWZDLGzz1JfZU0urIL
X-Gm-Message-State: AOJu0YzxuHz+RpuSEeoca8BGxLbSUFjl9Ca3wNiyYxhCE3ThN26DUDdn
	nBKcbf/4OXajuPkV6V7YhzdIwGYAQZjdZ/R6RuZxeMqJ9Xy/MGOBSxfAQvAsxXFn08C2xetz2Q5
	3pFNQPDbXG6yuvJpGQfsETOMN3D5NvPGwv+1v2w==
X-Google-Smtp-Source: AGHT+IHMZiJ7GkUOJyGqjV4avkqTTAvlzqr7ytyomStzfgostSKHBO29LXnvCAgrpDc5T+ElSP6cMdrouh2QdUXOToE=
X-Received: by 2002:a25:b847:0:b0:dc6:da83:88e6 with SMTP id
 b7-20020a25b847000000b00dc6da8388e6mr3262598ybm.32.1710977234540; Wed, 20 Mar
 2024 16:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com> <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com> <17BE5F38AFE245E5.29196@lists.riscv.org>
In-Reply-To: <17BE5F38AFE245E5.29196@lists.riscv.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 20 Mar 2024 16:27:03 -0700
Message-ID: <CAKC1njTnheUHs44qUE2sTdr4N=pwUiOc2H1VEMYzYM84JMwe9w@mail.gmail.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
To: debug@rivosinc.com
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	tech-j-ext@lists.risc-v.org, Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_162716_901926_E77A78D0 
X-CRM114-Status: GOOD (  19.66  )
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

> > >
> > > And instead of context switching in `_switch_to`,
> > > In `entry.S` pick up `envcfg` from `thread_info` and write it into CSR.
> >
> > The immediate reason is that writing envcfg in ret_from_exception() adds cycles
> > to every IRQ and system call exit, even though most of them will not change the
> > envcfg value. This is especially the case when returning from an IRQ/exception
> > back to S-mode, since envcfg has zero effect there.
> >
> > The CSRs that are read/written in entry.S are generally those where the value
> > can be updated by hardware, as part of taking an exception. But envcfg never
> > changes on its own. The kernel knows exactly when its value will change, and
> > those places are:
> >
> >  1) Task switch, i.e. switch_to()
> >  2) execve(), i.e. start_thread() or flush_thread()
> >  3) A system call that specifically affects a feature controlled by envcfg
>
> Yeah I was optimizing for a single place to write instead of
> sprinkling at multiple places.
> But I see your argument. That's fine.
>

Because this is RFC and we are discussing it. I thought a little bit
more about this.

If we were to go with the above approach that essentially requires
whenever a envcfg bit changes, `sync_envcfg`
has to be called to reflect the correct value.

What if some of these features enable/disable are exposed to `ptrace`
(gdb, etc use cases) for enable/disable.
How will syncing work then ?

I can see the reasoning behind saving some cycles during trap return.
But `senvcfg` is not actually a user state, it
controls the execution environment configuration for user mode. I
think the best place for this CSR to be written is
trap return and writing at a single place from a single image on stack
reduces chances of bugs and errors. And allows
`senvcfg` features to be exposed to other kernel flows (like `ptrace`)

We can figure out ways on how to optimize in trap return path to avoid
writing it if we entered and exiting on the same
task.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
