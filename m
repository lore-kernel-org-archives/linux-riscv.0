Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1460CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1Habf2doH8SPyTmUXSsqBPvqWxjNXpxoS5n/Astbas=; b=ZCUR/n5J/5XUdA
	yHvbvEh9af3pscFHyRU+rwYxHU3pRMBQkGEElx+BWkpQxsaAJJRLuo0fMnQK7VfTfRs33QFH4v8zL
	xGvFtnPxhVYmZUNe/89G1g4An8x7YCluzkH9HA7noPjfYOhiJn6U3396aaOHPqISjavu7uwgNe86I
	84+sTx5jifszIuh2w0Api2b7Lkmy4K4yctS4n76jFoO5wKcQQjeICmkGlzDIi2WZsjumfvx9k/DAI
	90maqTomt9AtSt7lRRCD5hrAnTnlg4PEncEUd2auxnMvWNj5q1Porb/uERFj9qYQSkzVmMzPtMKzn
	XZoaiKjb8z1KHtTTY/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLkId-00GyCo-0f;
	Fri, 05 Jan 2024 13:31:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLkIa-00GyCE-0v
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 13:31:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a26f73732c5so168635866b.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jan 2024 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704461500; x=1705066300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgP+th0N7B9odu3YvrC1EGNYppOPseXtnsirIxKlnzQ=;
        b=U+VbmKY89Ha+RT2qeuPFJoWgz53D4kHjsOcieZSmb+Mpp7m3RlwFBDJat2HZd9GowA
         VaSPxg39gOJjr5OQGssKm5mrEM59egc9/0qDp2hmthEjnVoa3Nidfe4y1rReSdBV+Wk3
         rxQs7GTkNe/FzX8QU36cBioSrvU30cxc1RsUTuWllW+SWKGpWmMIQTXZwlDVeEnivIwS
         +nExZcezuG+cYDre3KD/+/N7uiIvFxgZ2nGa2oefJIwUIJLmI/7yRr0Q6xLKVWX+mfOI
         6xN3h4pZ9WHaIS9239FHcmQuwSSQ0Ev/1rIBR9OPtJuGy8y4wslhKHI6it2Afk/U3uYe
         gQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704461500; x=1705066300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgP+th0N7B9odu3YvrC1EGNYppOPseXtnsirIxKlnzQ=;
        b=pTp3Cwkk1Lu47ckO8T4geb9ZzIhPDBN3DawypDqt4zqALHdDKbgmVFREF6f2MXRnYx
         75A34HaHtvBUf3758N+Wu34LX5v1sVlcoTunZPzlNZkpGObbcbsx+MTk04wHAYxqzxSV
         ZtKNSPXmN4UvI3LKCjwlFkZayG52dHsE4EIb2PFaV+KYr+NbPGSxYtqk7rovL589BIs5
         zQnHuW9egU8nWlYTcMme6OzMXvLziJctgBVDNkaoCZdFisAJf2lJo527M/70sm9RQ6fl
         GRUtB3M8UWadxdjoqqz68m8GYpWHDi8nbAxofWUEDyOcA/fu/G3kCrBlWAqH/QwdDQo1
         P71A==
X-Gm-Message-State: AOJu0Yy7BuF/w6UbFHIXzmWlurRN+cKbxCtR6n5TwLi0VOi1TQYz4wRx
	5uIp47JR/MYwu5sqPoVeRF6rOqJJMyUzQg==
X-Google-Smtp-Source: AGHT+IHsDn1zlEL9dKqlyookSTiwAgSDkb7D5CEkubKbDV9ro1vL62QGKpKBt5CAdUiG8cQsJUxVQw==
X-Received: by 2002:a17:906:aad3:b0:a28:b21b:ee5 with SMTP id kt19-20020a170906aad300b00a28b21b0ee5mr1051218ejb.75.1704461500565;
        Fri, 05 Jan 2024 05:31:40 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k27-20020a1709061c1b00b00a272de16f52sm885194ejg.112.2024.01.05.05.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 05:31:39 -0800 (PST)
Date: Fri, 5 Jan 2024 14:31:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Subject: Re: Re: [PATCH V2 2/3] riscv: Add ARCH_HAS_PRETCHW support with Zibop
Message-ID: <20240105-6dba80fb50413c0869b0beb3@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-3-guoren@kernel.org>
 <20240102-7e62facbd8322db4dee4b0dd@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102-7e62facbd8322db4dee4b0dd@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_053144_338337_B501572B 
X-CRM114-Status: GOOD (  19.70  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 02, 2024 at 11:45:08AM +0100, Andrew Jones wrote:
> 
> s/Zibop/Zicbop/ <<<$SUBJECT
> 
> On Sun, Dec 31, 2023 at 03:29:52AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > Enable Linux prefetchw primitive with Zibop cpufeature, which preloads
> 
> Also s/Zibop/Zicbop/ here
> 
> > cache line into L1 cache for the next write operation.
> > 
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/include/asm/processor.h | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..8d3a2ab37678 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -13,6 +13,9 @@
> >  #include <vdso/processor.h>
> >  
> >  #include <asm/ptrace.h>
> > +#include <asm/insn-def.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/hwcap.h>
> >  
> >  #ifdef CONFIG_64BIT
> >  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> > @@ -106,6 +109,19 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
> >  #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->epc)
> >  #define KSTK_ESP(tsk)		(task_pt_regs(tsk)->sp)
> >  
> > +#ifdef CONFIG_RISCV_ISA_ZICBOP
> > +#define ARCH_HAS_PREFETCHW
> > +
> > +#define PREFETCHW_ASM(x)						\
> > +	ALTERNATIVE(__nops(1), CBO_PREFETCH_W(x, 0), 0,			\
> > +		    RISCV_ISA_EXT_ZICBOP, CONFIG_RISCV_ISA_ZICBOP)
> > +
> > +
> > +static inline void prefetchw(const void *x)
> > +{
> > +	__asm__ __volatile__(PREFETCHW_ASM(%0) : : "r" (x) : "memory");
> > +}
> 
> Shouldn't we create an interface which exposes the offset input of
> the instruction, allowing a sequence of calls to be unrolled? But
> I guess that could be put off until there's a need for it.

If we did expose offset, then, because it must be constant and also must
only have bits 5-11 set, then we could add a static assert. Something like

 #define prefetchw_offset(base, offset) \
 ({ \
     static_assert(__builtin_constant_p(offset) && !(offset & ~GENMASK(11, 5))); \
     __asm__ __volatile__(PREFETCHW_ASM(%0, %1) : : "r" (x), "I" (offset) : "memory"); \
 })

Probably overkill though...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
