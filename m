Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38538EC8726
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQT7Rqf+bmNOTxJq4W+LQmVaFKOqPMr/tCgUjAuTgE4=; b=2Spln5J3dKBIr5
	usxRj8Wt7NtfLXjdm+fs6GE9LYQXA0TXTasWZf7NKnZgA65GkCr5tSAGxzXG1O9bLdEKpwzo7f8uI
	vcSSyLp6i7cC8xfIRasxEl+rH4625Ii4Tpp1OpT7Jx0sNZLpG+5cBwwDTttWsM0teWaAKYArgPOYG
	HcxHEVPwxBav/6scV0h1pxYk/d89hKy6FlK+q2YrQRxsEwmErJ5e36vGc0zG2rhm3nhY43pzMeiIC
	knicVd66OTcVWZw+qq9stDQBegTybuilQBvT7BckH9s0Q3mO8LTNQ3Ly+350OgAV9XRrV1n+TCosH
	LBEA+w73KTaUFCULAU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeJ0Y-00CUcQ-2t;
	Thu, 07 Sep 2023 17:41:34 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeJ0V-00CUal-05
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 17:41:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-26d0d376ec7so935675a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694108487; x=1694713287; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zyb/Hvp8ra+4Pq/salkMBHtDnyRnI+Xyajrk0WeNia0=;
        b=zZFGpJXUbOaQ1HuQLNvjpzl45ST/2ZfACmpSgstfqyaxeed6Juofgc5ZMRj9NVN8gb
         pbIHxqh+ju6AAwt42Lik10mdffGE7c6XJVjVSDnjM3Rf5Vr6gOT+N5y0KxWgokTYcMJX
         f5dfjq73vN5yRdYHuehUuiEj00B3Lqnp4ON05qL/xZPn18hIV/t2rRwAps3hJ4JQbu9z
         HcCgkzISFzMDiF5BbtQWOfG7SiyWK1PbmBOiFqe8VBoLva95vUCwzZTZMfn1fy6SNE/s
         2hDuamjcW9OIlzCrZ2bt/50p5xB4lVj1FCX07FA+qxR7mFeZ4a40juaHU8VeXnvFxux+
         PcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108487; x=1694713287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyb/Hvp8ra+4Pq/salkMBHtDnyRnI+Xyajrk0WeNia0=;
        b=wSjYl5HdAEJM0/4Wre+aPFRQmBMw7d+5qC9uTwA/C1PEWUx1mq2wRZeprXshdCTFfl
         W9mSEdffM9Y558rTHKxD7vSIw2/S2zk8nVAchcy8DBqXa4/UhNFAdKBqvsdhudQlUdiq
         IcHfpGl0FhrCV+qmcnMm9weYIVRdz85mLcT+5jWYdMiMtopII+O/RwGKOoE4mvjC9d+r
         +wicZOHoRDCtrod96g+Yw3eY7MKsGz2JIy4Sb8BsWs7seEECSIA7OR0VfHeSBbpsDnND
         tk4FG3I04iQgTPjBGav4ojm666blByjkuSMY96uoPh/9F/JNjRAKQYuaVWIM0EDkUlsN
         jr5A==
X-Gm-Message-State: AOJu0YzmoBi7ffw5xr+q/4+ByTVNEriqfsMp9bSFSjqo2EZAl6eDfzXf
	HKg9bCAvbOFSksf1kjSa/LBMUQ==
X-Google-Smtp-Source: AGHT+IFvDm8mz7Low6dBUvkjvj/lz5WUHFf8+8LRuNq7GK2l8guCa7XwJvozegie9iJnbfGy1IaXUw==
X-Received: by 2002:a17:90a:289:b0:262:fc8a:ed1 with SMTP id w9-20020a17090a028900b00262fc8a0ed1mr290995pja.44.1694108487747;
        Thu, 07 Sep 2023 10:41:27 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:84f6:5055:9180:822])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a005d00b0026d4100e0e8sm1845358pjb.10.2023.09.07.10.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 10:41:27 -0700 (PDT)
Date: Thu, 7 Sep 2023 10:41:24 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 3/5] riscv: Vector checksum header
Message-ID: <ZPoLRHq07Ttgf7rj@ghost>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-3-ccd658db743b@rivosinc.com>
 <20230907-6ed9570259e770b6a472ee61@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230907-6ed9570259e770b6a472ee61@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_104131_068427_91675D46 
X-CRM114-Status: GOOD (  25.10  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 07, 2023 at 10:58:33AM +0100, Conor Dooley wrote:
> On Tue, Sep 05, 2023 at 09:46:52PM -0700, Charlie Jenkins wrote:
> > Vector code is written in assembly rather than using the GCC vector
> > instrinsics because they did not provide optimal code. Vector
> > instrinsic types are still used so the inline assembly can
> > appropriately select vector registers. However, this code cannot be
> > merged yet because it is currently not possible to use vector
> > instrinsics in the kernel because vector support needs to be directly
> > enabled by assembly.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/checksum.h | 87 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
> > index 3f9d5a202e95..1d6c23cd1221 100644
> > --- a/arch/riscv/include/asm/checksum.h
> > +++ b/arch/riscv/include/asm/checksum.h
> > @@ -10,6 +10,10 @@
> >  #include <linux/in6.h>
> >  #include <linux/uaccess.h>
> >  
> > +#ifdef CONFIG_RISCV_ISA_V
> > +#include <riscv_vector.h>
> > +#endif
> > +
> >  #ifdef CONFIG_32BIT
> >  typedef unsigned int csum_t;
> >  #else
> > @@ -43,6 +47,89 @@ static inline __sum16 csum_fold(__wsum sum)
> >   */
> >  static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> >  {
> > +#ifdef CONFIG_RISCV_ISA_V
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> > +		/*
> > +		 * Vector is likely available when the kernel is compiled with
> > +		 * vector support, so nop when vector is available and jump when
> > +		 * vector is not available.
> > +		 */
> > +		asm_volatile_goto(ALTERNATIVE("j %l[no_vector]", "nop", 0,
> > +					      RISCV_ISA_EXT_v, 1)
> > +				  :
> > +				  :
> > +				  :
> > +				  : no_vector);
> > +	} else {
> > +		if (!__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_v))
> > +			goto no_vector;
> > +	}
> > +
> > +	vuint64m1_t prev_buffer;
> > +	vuint32m1_t curr_buffer;
> > +	unsigned int vl;
> > +#ifdef CONFIG_32_BIT
> > +	csum_t high_result, low_result;
> > +
> > +	riscv_v_enable();
> > +	asm(".option push						\n\
> > +	.option arch, +v						\n\
> > +	vsetivli x0, 1, e64, ta, ma					\n\
> 
> Also, I don't see that you have addressed previous review comments from
> Samuel:
> https://lore.kernel.org/linux-riscv/0a8c98bf-46da-e77a-0431-a6c1e224af2e@sifive.com/
I added the check for vector as Samuel suggested, but then I
accidentally used riscv_v_enable() instead of kernel_vector_begin(), I
will make that change.

- Charlie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
