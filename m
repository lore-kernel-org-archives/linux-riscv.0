Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3373AEE6457
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQv3FoXdvt+zyfIJuLsJBS6jCgFjggTTfUuPWg+89uE=; b=zy3FVIFdSqqIE6
	1CbZFOiTmntaIuvLnOR5cblLV/6QiWaw9fiH9+Bvo9Ki3XSfqeC35YUKgAfeJ+zl5X/jAFjl+NN2K
	3bVVKVfmb0vm6T4yeRtMrk0GnOyuvTQZlODuuAvmSjsis54CWaLyzf1m4Add+RqmiMu1jRNm/rCvr
	TYgU7MJyVBhlqMhbrsi3K22AVyQOsCVjh9h7JqdFgPxiUKS/ROYiNhgueW3xppADzpvi9skg83aO8
	/h15qwkSB3JkHT9bzojGH5YkNBObBWhZiiQkE08U7fHqizq3tpBH78stBv22bhfOFY8vScAMaYA/w
	DwiCCTk8cwV7ZRcA8W/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh7q7-00AiYw-11;
	Fri, 15 Sep 2023 12:22:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh7q4-00AiXT-0b
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 12:22:25 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so2579339a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694780542; x=1695385342; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+sgd0SQIzfDYqArl7ZJk837xYiiqp8Hlxo1eN43ivow=;
        b=Ti35H6JmFSc1UPl+8m8wO7irBn8XFioyQghTtyPOKmoEhTcvgEppXPljHtWPN5uamS
         LctiD5Ytuf90TNbTy7iHyJO6S+6caeSuuHXY63dsy9u9/d4IZZ4XuNdaY3LJef3stZji
         TyzrOqXtNJHIJIjboUStGHxolAD2wdp4tMjw/Gybyzg7Xyq935lZG3mBXMup7imHvu2Y
         0eBFVEj32kPNCsnGEVuZb4WqjmrVi7m1Jj2mzRwX7MES5jA18TFw/Gu3OUPP/xfkzTG/
         7DejeK+glTW/7n/Phh1lK+9d12yzOFwG0dZr1q6n5Bv0XR4jDulSrMWDN3gLYe4y7fmk
         WP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694780542; x=1695385342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sgd0SQIzfDYqArl7ZJk837xYiiqp8Hlxo1eN43ivow=;
        b=kYzbZ8xzeqFDXxGzG+dFeTh2k1Xb74t0KfVDtxQS8lCz/2KPzrIcRA5xAyLB+guqX0
         /935FwqB7fr6VuO0riUb2AZ6P/NKbFPIjKj1ny3wj9deT3Ljp/cgpx2Kyo1on3kStCQa
         p/Uyc+Jtf0fPHPwE7cNtv/SN0CpDXDHk1QuOfhSVkaH6Iv1t6yOtQnIb9QIJCpzaplEB
         q/xNZHHGDVIu685C9nQYQ7iyJ0UjyXSRMYy1Zve3i6vzV+0D/GAN3Q7ntsSjQ0NB1kJn
         jQpjhiVufSbDuua0IIXdRMiDtq1NzXh1GqS3ZijcJmYXLlk0WX6duas80i0kBWeEHITr
         1bvA==
X-Gm-Message-State: AOJu0YwivSQjj5Y+a+sWxcvtSXsvokMgP2Tw15AYQYGVakPAU+GOqX6u
	E6oiJTvMXxJRtD1bnhnhkCfqIw==
X-Google-Smtp-Source: AGHT+IGQDixv4KWDUPWov7KbIiiYnnPGZejnzWBzk+C5wrXNyJ/XJxdD3iWD4oGpKAVkYFj5R24yJw==
X-Received: by 2002:a17:906:31d6:b0:9a1:c447:3c62 with SMTP id f22-20020a17090631d600b009a1c4473c62mr1220416ejf.49.1694780542706;
        Fri, 15 Sep 2023 05:22:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z13-20020a1709067e4d00b009829dc0f2a0sm2330135ejr.111.2023.09.15.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:22:22 -0700 (PDT)
Date: Fri, 15 Sep 2023 14:22:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Leonardo Bras <leobras@redhat.com>, guoren@kernel.org, 
	paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, mingo@redhat.com, 
	will@kernel.org, palmer@rivosinc.com, longman@redhat.com, boqun.feng@gmail.com, 
	tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, 
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <20230915-1c2b122672642e2cbcbaaaef@orel>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
 <20230914-1ce4f391a14e56b456d88188@orel>
 <ZQQUQjOaAIc95GXP@redhat.com>
 <20230915-85238ac7734cf543bff3ddad@orel>
 <20230915-take-virus-1245c5dfed0a@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915-take-virus-1245c5dfed0a@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_052224_231903_96665CF1 
X-CRM114-Status: GOOD (  32.09  )
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

On Fri, Sep 15, 2023 at 12:26:20PM +0100, Conor Dooley wrote:
> On Fri, Sep 15, 2023 at 01:07:40PM +0200, Andrew Jones wrote:
> > On Fri, Sep 15, 2023 at 05:22:26AM -0300, Leonardo Bras wrote:
> > > On Thu, Sep 14, 2023 at 03:47:59PM +0200, Andrew Jones wrote:
> > > > On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> > > > > From: Guo Ren <guoren@linux.alibaba.com>
> > ...
> > > > > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > > > > index 6960beb75f32..dc590d331894 100644
> > > > > --- a/arch/riscv/include/asm/insn-def.h
> > > > > +++ b/arch/riscv/include/asm/insn-def.h
> > > > > @@ -134,6 +134,7 @@
> > > > >  
> > > > >  #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
> > > > >  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
> > > > > +#define RV_OPCODE_PREFETCH	RV_OPCODE(19)
> > > > 
> > > > This should be named RV_OPCODE_OP_IMM and be placed in
> > > > numerical order with the others, i.e. above SYSTEM.
> > > > 
> > > > >  
> > > > >  #define HFENCE_VVMA(vaddr, asid)				\
> > > > >  	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17),		\
> > > > > @@ -196,4 +197,8 @@
> > > > >  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> > > > >  	       RS1(base), SIMM12(4))
> > > > >  
> > > > > +#define CBO_prefetchw(base)					\
> > > > 
> > > > Please name this 'PREFETCH_w' and it should take an immediate parameter,
> > > > even if we intend to pass 0 for it.
> > > 
> > > It makes sense.
> > > 
> > > The mnemonic in the previously mentioned documentation is:
> > > 
> > > prefetch.w offset(base)
> > > 
> > > So yeah, makes sense to have both offset and base as parameters for 
> > > CBO_prefetchw (or PREFETCH_w, I have no strong preference).
> > 
> > I have a strong preference :-)
> > 
> > PREFETCH_w is consistent with the naming we already have for e.g.
> > cbo.clean, which is CBO_clean. The instruction we're picking a name
> > for now is prefetch.w, not cbo.prefetchw.
> 
> btw, the CBO_foo stuff was named that way as we were using them in
> alternatives originally as an argument, that manifested as:
> "cbo." __stringify(_op) " (a0)\n\t"
> That was later changed to
> CBO_##_op(a0)
> but the then un-needed (AFAICT) capitalisation was kept to avoid
> touching the callsites of the alternative. Maybe you remember better
> than I do drew, since the idea was yours & I forgot I even wrote that
> pattch.

And I forgot anything I may have suggested about it :-)

> If this isn't being used in a similar manner, then the w has no reason
> to be in the odd lowercase form.

Other than to be consistent... However, the CBO_* instructions are not
consistent with the rest of macros. If we don't need lowercase for any
reason, then my preference would be to bite the bullet and change all the
callsites of CBO_* macros and then introduce this new instruction as
PREFETCH_W

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
