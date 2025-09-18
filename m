Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2374CA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrlSMmGTYkiYDe91sTz7AHPI1gSh+UP73IDM+9oCncI=; b=mM6uX20ppbDSG+
	FDIOV3lsY2mbch1B4/CMYOmwpEgR/wBPmPkoy6w4jJ/NNxB/WewXKlZrhHusZamFV1KjT+YZVGRiq
	geOUKgG/hT3gMXzAO3zICT8dNLubkkkPyllN3lU4mCKM4jmL/+WkN2vsmPM+XvVe4LgOWF9YcO0sy
	RPullyhn4DDzTSZVqYyL+d8kHqbVD/7hPhDzo8RovvboWeZXiF26U+xzpwHKpcjCwjDllnnWVhH8z
	Vwm6grQOMXw+YSoOtwqtg1uTZu6gdmWcJWf5vdmaZjG5ImLAEZ64SeWgWyRLIqhT1lZswMbPHEUqy
	z80mDXCYN0TVDWF5Cehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM7b-00000001G3Y-1gZo;
	Thu, 18 Sep 2025 21:24:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM7Z-00000001G2y-1MqN
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 21:24:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ef166e625aso60426f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 14:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230691; x=1758835491; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlFCbhCTpOXXCa+leD0aC1fFvORDxKQ+b7Z61x2UmGs=;
        b=aOnIjrL6POjc4KKZvDkVWElmLJslRN1y1BH8WT+4FBtAsBWdwZ1J6ESuWnmiEZb5od
         Oq2ItrbgT+0To/xXm0YveO8KnwRFKLvFmB+EN7Od7qPkWcYt1bMCXPOQrB0D7wX2t7S/
         wCtSxvyb6i+bGFPardP7QYlivtZbrj43hEkzasagXDxyJW9H/WnhhcajnF7Y6ci4mFkV
         mVR7IPoYB/GYRf0RjYaDB4WH0h3/YV39KZXWaXmRkjRMO3oL0Kn3Jjl+tXc5FNhlRIk8
         8ke8rjZxdGUsWI2YByXp6//a8/WgjZUpUvnP+BBYCCfT/aCofcjaNq6gQZzCFBFVAcnC
         2JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230691; x=1758835491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlFCbhCTpOXXCa+leD0aC1fFvORDxKQ+b7Z61x2UmGs=;
        b=w15ujsFWk4Od565cq/Koy8kv25K2kLt6GPeirrcnLjAFyhE3D1Gw16PHhl7daem41k
         n6dntNUPUZZbuvlMYHjyKj+5j7W8LGcxOomCBSD66QzQ0TvixkkjSRzQP1pESor4S35N
         OEpy32gARwJrP23rEMM0qZUZisZ0+n9TpSb3hN1dUZJDtUGkVjVC0tDdNM9NDu9p8bNP
         OdK5ELMSd3idKgiJP7iHpx/0/O78okKNbgYpnCxt+rOfae8pVA9MUckKtQaP1O4F17is
         eluWkRSh4DtsC04zjTpoxcx9NIxkBCSLqP4/JCdijG5EOEv9sILQVqrVoEI+MmkHpbfy
         mfjw==
X-Forwarded-Encrypted: i=1; AJvYcCWcBdP6s41ldCBhshuPepdb1sbfHfEgmphumZ2+wnCZDPeFmxjEZwtYkSQ34nGdzvHdksHlsBobTX2XTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YziwTwlTeMC+CAawlRrbne/fIYwY8fyk48aU5Uheh9XiegHU1GZ
	NQRbyFnD5ch+/G2qh+Ftc5Gno+s70niTOpuddh5hCPCF58mQGfdgM7c4
X-Gm-Gg: ASbGncuoBYGiimccPbSBH9ggbogEQk1cVljh/oIuA1TCAisJvuh6SfFy8j5EOWUIJPK
	uRRf4WWoNUE7QpaMZVyAJKnSWfc7dCodcgImeFvrQtF2/R4MglLvacSxFiCasFimD/5HPmiQW/u
	jUlTdjhtek2tRM3PiulOBDmcoalrD62fnZS/6BFtadzkIekkO5aq9GCPVZ4dH6MkFG9+D7qIq+l
	o3j1ozl1gf4Me+CaT5twZhhPmN4ZMm9bfjtUnSBodQhyZOfqzG/hVTvy5tS0EaAdLr6c/W4e2wi
	vC1A0Rj5N7GaBObbWKvuNCcKHqt+4ZnW7ISmrTkyM41+xxORgibvRYuHIjvJOOygJCfal5VaR4+
	gbHcI1YEYbSEiI1bvHm1RiPghW0RQoRPU7MtbzrU=
X-Google-Smtp-Source: AGHT+IGVI9rYSUJl9pXRwEIpExb/jYBmQ2Wo2Ykd83GR5P8ke+XLU8cSqFTa/VqojplpA7DbaQTJvw==
X-Received: by 2002:a05:6000:2910:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-3ee7c552a02mr532419f8f.12.1758230690687;
        Thu, 18 Sep 2025 14:24:50 -0700 (PDT)
Received: from andrea ([176.201.192.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e849a41sm96925155e9.20.2025.09.18.14.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:24:50 -0700 (PDT)
Date: Thu, 18 Sep 2025 23:24:41 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Xu Lu <luxu.kernel@bytedance.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
	brs@rivosinc.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	apw@canonical.com, joe@perches.com
Subject: Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
Message-ID: <aMx4mS0K8f_aDV_q@andrea>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <aLciY2putG8g2P9F@andrea>
 <aMoyntAydNMtcl+3@gmail.com>
 <aMw3504EwlnDOJI0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMw3504EwlnDOJI0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_142453_379043_EC29DACB 
X-CRM114-Status: GOOD (  11.44  )
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

[merging replies]

> > I prefer option c) at first, it has fewer modification and influence.
> Another reason is that store-release-to-load-acquire would give out a
> FENCE rw, rw according to RVWMO PPO 7th rule instead of FENCE.TSO, which
> is stricter than the Linux requirement you've mentioned.

I mean, if "fewer modification" and "not-a-full-fence" were the only
arguments, we would probably just stick with the current scheme (b),
right?  What other arguments are available?  Don't get me wrong: no a
priori objection from my end; I was really just wondering about the
various interests/rationales in the RISC-V kernel community.  (It may
surprise you, but some communities did consider that "UNLOCK+LOCK is
not a full memory barrier" a disadvantage, because briefly "locking
should provide strong ordering guarantees and be easy to reason about";
in fact, not just "locking" if we consider x86 or arm64...)


> > asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",	\
> > -			  SB_RL(%0, %1) "\t\nnop\t\n",		\
> > +			  SB_RL(%0, %1) "\t\n fence.tso;\t\n",	\
> > 			  0, RISCV_ISA_EXT_ZALASR, 1)		\
> > 			  : : "r" (v), "r" (p) : "memory");	\

nit: Why placing the fence after the store?  I imagine that FENCE.TSO
could precede the store, this way, the store would actually not need
to have that .RL annotation.  More importantly,

That for (part of) smp_store_release().  Let me stress that my option
(c) was meant to include similar changes for _every releases (that is,
cmpxchg_release(), atomic_inc_return_release(), and many other), even
if most of such releases do not currently create "problematic pairs"
with a corresponding acquire: the concern is that future changes in the
RISC-V atomics implementation or in generic locking code will introduce
pairs of the form FENCE RW,W + .AQ or .RL + FENCE R,RW without anyone
noticing...  In other words, I was suggesting that RISC-V _continues
to meet the ordering property under discussion "by design" rather than
"by Andrea or whoever's code auditing/review" (assuming it's feasible,
i.e. that it doesn't clash with other people's arguments?); options (a)
and (b) were also "designed" following this same criterion.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
