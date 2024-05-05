Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF0AC4345F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 22:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BrUYX2i05PMO1RCo/Qmjiwm8H+sRaBnfePUVdzhnhk=; b=QK6gNzijIeoSMZ
	C7dbdWxNNhG1TAcibdyRIao/Rruaz4C56ss2MkcrzJ31gZhAlGd3/NUM1//CgU/+6otol4Rfbjqbv
	gA4U+hKkueiqTS5FcX7WOMDn1AosZ0nTQohIRGnRCxRaSZVvqHyIlS3z6RDgfc9UpZUYf9FMNnGNB
	KryFlEDL6GVzD1fVu3VP0pgFnXR6vVcSDlFGin+4tjlowahAI9v/IpGEARq17crZhG1XyLh7Qm2D8
	FpSRCJfATpCWy7Ou1nnN6Ns5vmGLviZB3ORPUjCT6YJiW1E+jLZUOzjXk1IqgvQRPhgb/z4NskURo
	bdXDdLCflFFusFlUAGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3kcY-00000005SzY-3fpW;
	Sun, 05 May 2024 22:46:14 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3kcV-00000005Sy9-0wrU
	for linux-riscv@lists.infradead.org;
	Sun, 05 May 2024 22:46:12 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a59cc765c29so89830366b.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 May 2024 15:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714949164; x=1715553964; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=er8OR4CkvYPSBm1vxvC1YRmn3HecSea62NIpaFm00EE=;
        b=f32pljVbVHmxZBJyJY0IqssTpv1facDQ31qQ5f+lUnTz6TYEjzZCi3o7j6vLNF9Ydd
         lOs13bJ0MuLeL7MXqP5rjRFzXYaVdqnYbccMePKsZDuWDjQJW8T3DdIjw/I02BE8gHKQ
         p6RvfUbtbB7sCNSZzre3IDvRwX8+m0xgCRiYX7kiczIqNrpFhgfQfUcRQOtMI2gB9Bmu
         b/zq6bHiw6NLECBDNEVonxYNrSiTs6kXW3FNYjf75nEWo6UjLc9CXlehL2zCwtkdxRKY
         kTrrxjMISe4mvyx3Qq3E7hBVEgLvWZ3uxl3796VZptq//6rIXXoTBRtM8R8X6kagxhDq
         ezmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714949164; x=1715553964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er8OR4CkvYPSBm1vxvC1YRmn3HecSea62NIpaFm00EE=;
        b=jogKIoY9CcpaT2H6tdkXUaZoFpUwWQlZhlSa2PhTxoA95Gt8hT+aGvqjmIWg+CZsR+
         P6P4/+2VJxNPHskUhntIU28t1AFB+XB3U1s658gae8LZxQm/L/Ky2r5/QyEiLvy4ZNQ/
         I4Fag5j+SrAXxEM3EH6iJohGzZOx+vU/aWYSi9M3YCfNc9euBMKrjfaqzkGWSzzFZJOZ
         qg2AgXgSHSeCDjlneVwBVdg2cAqMZD6rLSLCgNe3/WnSNKdy6qBSoCR1a+Nw1/qiZZgd
         nFUHNXTjsxXdniRmBNZ7VWxqGKNXbfv+ifiLgfQYQ1MI+Bp1OHvLq6IiTjR155Z1Fake
         tiTg==
X-Forwarded-Encrypted: i=1; AJvYcCU4g2ZJovUQ0CRgVnLJVCTMD42na0EadkGvHZr01Lovx4vc7ZZvRdjVfJDOiHR5MG947APgPiQDlF/Y5j84ES+OFE69/U2M40Aec1hArNqZ
X-Gm-Message-State: AOJu0Yw4By8n3WK2IX5B8pnUJbex+sgjW9Gq6gufVSrVuQ3xLp7qedjx
	a37b9Yd6AEWEHt9ODkmqY2eErfclR3NUfrBvnktt7oWn3alxTb1v
X-Google-Smtp-Source: AGHT+IE1/6e5myoOflXf6PssbMgp2B8PrKhMe36vaBg4y3AUfAz4FRqToTD83Ld+f7kcxPFP/Aalpg==
X-Received: by 2002:a17:906:b806:b0:a59:ba18:2fb2 with SMTP id dv6-20020a170906b80600b00a59ba182fb2mr2137235ejb.35.1714949163495;
        Sun, 05 May 2024 15:46:03 -0700 (PDT)
Received: from andrea ([31.189.114.81])
        by smtp.gmail.com with ESMTPSA id a25-20020a1709064a5900b00a59a9949ec9sm2188379ejv.118.2024.05.05.15.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 15:46:02 -0700 (PDT)
Date: Mon, 6 May 2024 00:45:58 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, puranjay12@gmail.com
Subject: Re: [PATCH] riscv/atomic.h: optimize ops with acquire/release
 ordering
Message-ID: <ZjgLAKlWC2HQzWfU@andrea>
References: <20240505123340.38495-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240505123340.38495-1-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_154611_289090_C040DE51 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Puranjay,

On Sun, May 05, 2024 at 12:33:40PM +0000, Puranjay Mohan wrote:
> Currently, atomic ops with acquire or release ordering are implemented
> as atomic ops with relaxed ordering followed by or preceded by an
> acquire fence or a release fence.
> 
> Section 8.1 of the "The RISC-V Instruction Set Manual Volume I:
> Unprivileged ISA", titled, "Specifying Ordering of Atomic Instructions"
> says:
> 
> | To provide more efficient support for release consistency [5], each
> | atomic instruction has two bits, aq and rl, used to specify additional
> | memory ordering constraints as viewed by other RISC-V harts.
> 
> and
> 
> | If only the aq bit is set, the atomic memory operation is treated as
> | an acquire access.
> | If only the rl bit is set, the atomic memory operation is treated as a
> | release access.
> 
> So, rather than using two instructions (relaxed atomic op + fence), use
> a single atomic op instruction with acquire/release ordering.
> 
> Example program:
> 
>   atomic_t cnt = ATOMIC_INIT(0);
>   atomic_fetch_add_acquire(1, &cnt);
>   atomic_fetch_add_release(1, &cnt);
> 
> Before:
> 
>   amoadd.w        a4,a5,(a4)  // Atomic add with relaxed ordering
>   fence   r,rw                // Fence to force Acquire ordering
> 
>   fence   rw,w                // Fence to force Release ordering
>   amoadd.w        a4,a5,(a4)  // Atomic add with relaxed ordering
> 
> After:
> 
>   amoadd.w.aq     a4,a5,(a4)  // Atomic add with Acquire ordering
> 
>   amoadd.w.rl     a4,a5,(a4)  // Atomic add with Release ordering
> 
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Your changes are effectively partially reverting:

  5ce6c1f3535fa ("riscv/atomic: Strengthen implementations with fences")

Can you please provide (and possibly include in the changelog of v2) a more
thoughtful explanation for the correctness of such revert?

(Anticipating a somewhat non-trivial analysis...)

Have you tried your changes on some actual hardware?  How did they perform?
Anything worth mentioning (besides the mere instruction count)?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
