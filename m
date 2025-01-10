Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC0DE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+U6kYN9cvRoKq2JHJ9qggVQ5zia3pt/7rLUZJfEaAio=; b=WZG9klTwGye7TX
	tA8ovMp6DJKBsXyf3SPcguCclxjB4thz2xCWUdzENLjdyuPdQVDB/g75pOx3VbRaKQdvItwOoPC6e
	6Lnf8nd9LUIW/xW3fyLhfHTNgQ9npyAhBLmTC7VY+tAVBxkwhV2D3kAss43Rwyo+3ZT3nLLNwcws1
	lqLKRZm5Aj879Tw471r/H3mmkAlQFNKKkHKtyOiHJHoehYCtdpQSZn8FSG90/3y3epG/H/syVxR/3
	S2H4YzgerRd7m9LskvJnF0NRe1oNpaB+VqWLZ5Rfzd9tU/f1AR6qZaqFpgOjuiIXf7rB77dpUAyUa
	a64isGLqCe5FAI+EJQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBoT-0000000Eqtl-0dVG;
	Fri, 10 Jan 2025 10:00:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBkk-0000000EqFc-1ghy
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 09:56:31 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436a03197b2so13413545e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 01:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736502988; x=1737107788; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gr3QW35l+ROuCXllxyigQs1tyTlV+AXBbBIdlycxIm8=;
        b=DcvGetaegoNp8tsgmaqGf3cf/gpzI5eTTJLpYmwbX2zmIj10YB51mE4oUgrzubSCsa
         s4XJs2ZkKrHESTfjLQbvWWWiO9moNcGFrO5rpY/8ImbcEjOUBuqoytJKvgzw23eGD339
         u3LWKBD4HJx0yM8frLJ7USOv9qLejyYaS7oAgYVbZN/YtsKBf2014yzeyPHKBrHtQ8J7
         TR2zeFYCXsucLZWp5VbQbiC8JGSG+vzt75Ccoo4RlJZx00nLkZGkSRPWxL1Oa5Tu2ZpM
         PRoVaRnWJbaKfnqxExDeaqy5//VDNV7msllB6aJPzmNuUNCUlYAfiVs4VXswvcL0XRav
         Y7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502988; x=1737107788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr3QW35l+ROuCXllxyigQs1tyTlV+AXBbBIdlycxIm8=;
        b=s21jAqpsUhgYVYiWfRfuWHORbfWGziXjSHm24OcKRu407r0QGm8JY44mwp1akJaNMc
         xLIHrzkijFAbqivnr+J6FGUxHAlNDFfw2yFnWvQdC4mX4LZGodvO01Hg8HFtU7OPgGmA
         dASFuG9h4TCVPnup4G7PbWVe0jPxGyYcVHf50sif1JATqtatjaL+U8Y8+8Q/B5UvSUid
         b9cJFvlmiMJN17N8AhptA6wcy4nPLvAN4Qa3Wi8/uHljvEK4FYgI25C4tSgc/F2woRhy
         lA05w03Mpy6kVxt+vYjHAmf9JBWetMOljwTv3btw93mipwkZ02iMFNyjGRjKZ1/LCg+P
         2RDg==
X-Forwarded-Encrypted: i=1; AJvYcCUdHE4fr+egANNMM48zLynqI9IbqViIr9hEV2OAt0bHP+LjRSQUj8vhpI2zejQHKSkYQaAS83K6FZoqyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwagtkWfhmW/LmohoWz7c6pGjzgJWLyyuST2KnVIa361luGdYWW
	A1C2q8skSs33HvcqZs+y/LW4Sk7AgvFWbnunGocJT0gRq0+3WXsa
X-Gm-Gg: ASbGncvzup4ZijARzP99zYnzNEcZI3qDc7fxLUnBzBzKE4uus1ovajUx/XRxzsqGPg7
	IFqWj/HdSB9fiZut7zPBXvG1bEqOfROjNHQQ4yruXcsS8zkFFVR65BNWhkxfhBlqGXztKWYk7zR
	yXLxXGo5GV7jaAbwwHVIN2PHAWEJpWE69uW9x7HoVkysX2QcamDYr/us23zjQCpPmPUc+kNn2E4
	5Dg0Q8i6kanhxo7v2X1ewhOwzxP96e79NbYTH7F94DZemSn7JVVnwROx4dzDTdCGu03EQskM9M1
	G9zqrt3bIm3e1EJIOnaF
X-Google-Smtp-Source: AGHT+IEkNTbcIJFheJyZEh1/rHzrJsKyjAhfpTWKLLwfc4/boZ17G9rXbHjSeAgYDysRbgB3eu7aLA==
X-Received: by 2002:a05:600c:1c1a:b0:434:f2f4:4c07 with SMTP id 5b1f17b1804b1-436e26bd126mr98549175e9.15.1736502987960;
        Fri, 10 Jan 2025 01:56:27 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da66e6sm82271455e9.4.2025.01.10.01.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:56:26 -0800 (PST)
Date: Fri, 10 Jan 2025 09:56:25 +0000
From: Stafford Horne <shorne@gmail.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] rseq/selftests: Fix riscv rseq_offset_deref_addv inline
 asm
Message-ID: <Z4DuyWhXlI---tQR@antec>
References: <20250103040326.2603734-1-shorne@gmail.com>
 <Z4CF7a89_eCkAMNV@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4CF7a89_eCkAMNV@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_015630_446936_44D1816F 
X-CRM114-Status: GOOD (  30.87  )
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

On Thu, Jan 09, 2025 at 06:29:01PM -0800, Charlie Jenkins wrote:
> On Fri, Jan 03, 2025 at 04:03:26AM +0000, Stafford Horne wrote:
> > When working on OpenRISC support for restartable sequences I noticed
> > and fixed these two issues with the riscv support bits.
> > 
> >  1 The 'inc' argument to RSEQ_ASM_OP_R_DEREF_ADDV was being implicitly
> >    passed to the macro.  Fix this by adding 'inc' to the list of macro
> >    arguments.
> >  2 The inline asm input constraints for 'inc' and 'off' use "er",  The
> >    riscv gcc port does not have an "e" constraint, this looks to be
> >    copied from the x86 port.  Fix this by just using an "r" constraint.
> > 
> > I have compile tested this only for riscv.  However, the same fixes I
> > use in the OpenRISC rseq selftests and everything passes with no issues.
> 
> Thank you for these changes! I suppose these tests hadn't been ran on
> riscv before... I ran the tests on QEMU and they all passed :)

Thanks for confirming.

> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> This should also have a fixes tag:
> 
> Fixes: 171586a6ab66 ("selftests/rseq: riscv: Template memory ordering and percpu access mode")

Right, If ok I think Palmer / the maintainer can add that when picking up the
patch.  If requested I can add that to a v2 though.

-Stafford

> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >  tools/testing/selftests/rseq/rseq-riscv-bits.h | 6 +++---
> >  tools/testing/selftests/rseq/rseq-riscv.h      | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/rseq/rseq-riscv-bits.h b/tools/testing/selftests/rseq/rseq-riscv-bits.h
> > index de31a0143139..f02f411d550d 100644
> > --- a/tools/testing/selftests/rseq/rseq-riscv-bits.h
> > +++ b/tools/testing/selftests/rseq/rseq-riscv-bits.h
> > @@ -243,7 +243,7 @@ int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, i
> >  #ifdef RSEQ_COMPARE_TWICE
> >  				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> >  #endif
> > -				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, 3)
> > +				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, inc, 3)
> >  				  RSEQ_INJECT_ASM(4)
> >  				  RSEQ_ASM_DEFINE_ABORT(4, abort)
> >  				  : /* gcc asm goto does not allow outputs */
> > @@ -251,8 +251,8 @@ int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, i
> >  				    [current_cpu_id]		"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> >  				    [rseq_cs]			"m" (rseq_get_abi()->rseq_cs.arch.ptr),
> >  				    [ptr]			"r" (ptr),
> > -				    [off]			"er" (off),
> > -				    [inc]			"er" (inc)
> > +				    [off]			"r" (off),
> > +				    [inc]			"r" (inc)
> >  				    RSEQ_INJECT_INPUT
> >  				  : "memory", RSEQ_ASM_TMP_REG_1
> >  				    RSEQ_INJECT_CLOBBER
> > diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
> > index 37e598d0a365..67d544aaa9a3 100644
> > --- a/tools/testing/selftests/rseq/rseq-riscv.h
> > +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> > @@ -158,7 +158,7 @@ do {									\
> >  	"bnez	" RSEQ_ASM_TMP_REG_1 ", 222b\n"				\
> >  	"333:\n"
> >  
> > -#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)		\
> > +#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, inc, post_commit_label)	\
> >  	"mv	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"	\
> >  	RSEQ_ASM_OP_R_ADD(off)						\
> >  	REG_L	  RSEQ_ASM_TMP_REG_1 ", 0(" RSEQ_ASM_TMP_REG_1 ")\n"	\
> > -- 
> > 2.47.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
