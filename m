Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC88EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 00:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u22PNClsZ7Kq4N/emXYYNkTc7YUCovlNehlfIBuvDUw=; b=GTlDVFsrEG0ibl
	+jlHsakgAE/t986xVUgb55tIYHfPV4HImQBs7cZp+oG4llq+Iav5PjtgCCIOIErA2xrFVEVaK+29R
	1BDBnMmVB7mSjGiz5s7fhb9U0/oZKRp+OMeJIkiyX9iHYfnsy+kBsZO7hGX12MTW+F5gcL2WO7ekO
	U299he9HgHCpKdp2NSPqLTH/h3ogNH7ZUaTa3+Jmvr1C/M+FC0BBsqI1SBa2qZhAEfFBBF0T0HlMA
	zqx0jAbGaIS/Roq8OIwLNVCG9CYEgEdm1zlnYdnrIz0IsrVvhEEiIWow5wPHCD8YMz2ElQmeaD/cD
	WasnT9qOCkJOfVKv1BQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPXtj-005cAw-2R;
	Sat, 29 Jul 2023 00:33:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPXte-005c9w-36
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jul 2023 00:33:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bbd2761f1bso21408995ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 17:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690590804; x=1691195604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahyJuXZ5mL1EHkAmnBhtpjxq5pGjH0m9c44cFqu9RR8=;
        b=xpUdgokS5I3D2dS83HRiHhZiG56m5FAIJgE/jlbqlE+gYcIRkpxvSi/pZSlUi7sy2z
         bnqqAIfSeRVJ95s1lcZAuogwJigMtlZdlSs+YHeoYBnYTHfZR6Zk4ahWvPG1AaLULQhY
         gO+eJNi8wd3w5WbQ9DO9D/sOeD3bA9T5kHZwOM7wmJcQvePox0iYtRM8wYAC7n/dDaqK
         X7P0sDk/dcUAgQAqq7D+U55LcixXdO1mjn96aqshgDPBbaKb46v56++fUbVWhXcdTM5a
         esvqsFXNPN843wzsRhz3BzbNQN9oUX4Gbmjl8FepRs+P4u+4Q+dnrBblDHu1hpf9MbwM
         y3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690590804; x=1691195604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahyJuXZ5mL1EHkAmnBhtpjxq5pGjH0m9c44cFqu9RR8=;
        b=OJy/711vFEKKylzaq1brBsHKe94gYpxByFbfw1MuflII/mGv4afKU7alIooWlKRNU/
         LIfWu0gL2ROG2ZFMZMujaaspSiA/HmC7iGhxcZxlxw6Sn3roRI6iN3j5MOAestE4cJvr
         JJRXab4N+2/ZpqisU+b36QRMOBR2XwrW8Wh8lh6qsp8omVelfxODduK5G6ZUJ8Rs/J1a
         lRDDGobC3BGrzg5ngHs8RCXC8/WkWnFMV3pU3uhsVqTl/NGOyp1EfrxS1br9EZXHEgGY
         5mYJBRlJy2bpm+63yx1FiMd8h5nmk89pXOlJ2VoaLJKds2t6BEGktdoZkhuK8WiBcjGu
         MTvg==
X-Gm-Message-State: ABy/qLYMkxRKr3I+mRn1BSlNapZnUSM5Rh864RM3Mp1o0seDwm0hEuck
	+5vGgdtd27dgklGldl+kQOIvMg==
X-Google-Smtp-Source: APBJJlFS9zLP1c6phrba+UHvupDG9E3d4F06JGpS2iM7oXYYOuggQ3ope9iTdf44U6BdBCqfanr6PA==
X-Received: by 2002:a17:902:9a06:b0:1bb:edd5:4644 with SMTP id v6-20020a1709029a0600b001bbedd54644mr2869632plp.68.1690590804391;
        Fri, 28 Jul 2023 17:33:24 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:ab2e:71c2:3a28:319c])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902ea0d00b001b9be3b94e5sm4140174plg.303.2023.07.28.17.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 17:33:24 -0700 (PDT)
Date: Fri, 28 Jul 2023 17:33:22 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, falcon@tinylab.org,
	bjorn@kernel.org, conor.dooley@microchip.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 0/2] riscv: stack: Fixup independent softirq/irq stack
 for CONFIG_FRAME_POINTER=n
Message-ID: <ZMReUsAVmwcDwEhe@x1>
References: <20230716001506.3506041-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716001506.3506041-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_173327_213082_89B70D00 
X-CRM114-Status: GOOD (  16.12  )
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

On Sat, Jul 15, 2023 at 08:15:04PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The independent softirq/irq stack uses s0 to save & restore sp, but s0
> would be corrupted when CONFIG_FRAME_POINTER=n. So add s0 in the clobber
> list to fix the problem.
> 
> <+0>:     addi    sp,sp,-32
> <+2>:     sd      s0,16(sp)
> <+4>:     sd      s1,8(sp)
> <+6>:     sd      ra,24(sp)
> <+8>:     sd      s2,0(sp)
> <+10>:    mv      s0,a0		--> compiler allocate s0 for a0 when CONFIG_FRAME_POINTER=n
> <+12>:    jal     ra,0xffffffff800bc0ce <irqentry_enter>
> <+16>:    ld      a5,56(tp) # 0x38
> <+20>:    lui     a4,0x4
> <+22>:    mv      s1,a0
> <+24>:    xor     a5,a5,sp
> <+28>:    bgeu    a5,a4,0xffffffff800bc092 <do_irq+88>
> <+32>:    auipc   s2,0x5d
> <+36>:    ld      s2,1118(s2) # 0xffffffff801194b8 <irq_stack_ptr>
> <+40>:    add     s2,s2,a4
> <+42>:    addi    sp,sp,-8
> <+44>:    sd      ra,0(sp)
> <+46>:    addi    sp,sp,-8
> <+48>:    sd      s0,0(sp)
> <+50>:    addi    s0,sp,16	--> our code clobber the s0
> <+52>:    mv      sp,s2
> <+54>:    mv      a0,s0		--> a0 got wrong value for handle_riscv_irq 
> <+56>:    jal     ra,0xffffffff800bbb3a <handle_riscv_irq>
> 
> Changelog:
> V2
>  - Fixup compile error with CONFIG_FRAME_POINTER=y
>  - FIxup stable@vger.kernel.org tag
> 
> Guo Ren (2):
>   riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
>   riscv: stack: Fixup independent softirq stack for
>     CONFIG_FRAME_POINTER=n
> 
>  arch/riscv/kernel/irq.c   | 3 +++
>  arch/riscv/kernel/traps.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> -- 
> 2.36.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Tested-by: Drew Fustini <dfustini@baylibre.com>

Xi Ruoyao noticed that the mainline kernel crashed when using a kernel
config with CONFIG_FRAME_POINTER=n. I was able to reproduce this [1].
Emil suggested I trying this patche series. I can confirm that this
resolves the kernel crash on the Sipeed Lichee Pi4a [2].

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/ZMNojqwLxcG8FcHN@x1/
[2] https://lore.kernel.org/linux-riscv/ZMQAqUfb0y%2FigQs2@x1/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
