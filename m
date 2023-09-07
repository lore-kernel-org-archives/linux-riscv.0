Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42C0EC8726
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnHOgre6qgtgoETrH9T7OEmEb5CH72NlAY0GBLWzpVE=; b=YF1apPm1lr+sGg
	NKHVeNq0kYOcIp//pvAhdd1tmXop86098wdDF+ZN2BxlW8Wo8rMQQ5jnd8rLseXg70pJlKN++F1IV
	aOq0a+qGsTlfFsY7ph5XiCMWFwo/B+JkbBixlApXN+TCjV6Ya5dKgOliETWqCxvGdo7YlBSPg/GdN
	P3PHcgKGUSqdeLTHYvI5PXZ/HKLq/Vgm7KhfuOJhANQmlqlIDzDXq7iOZnu6ZH8JVYFijBfBjhxbu
	jiaS6KbTvPJjJRUC68UvXFXAwW3wh9lSQto72NAtMDM174uPwX6tIEIqdCSB6KP+vMkoVz6PBM+HS
	U91doCy6NC1j4k/DxR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeJ2S-00CUj2-1r;
	Thu, 07 Sep 2023 17:43:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeJ2P-00CUiL-1K
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 17:43:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c35ee3b0d2so9210335ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 10:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694108606; x=1694713406; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7AODGgzjO594taBwmHKz6HitKdIGx7cKUiDd5WwWPc=;
        b=f1u0bUKoIEp1bQ6TmYkgIXBvc3INDAtkUubHoNDS1rgkG3hKTk1mF3dWY8qqF48iOF
         +zNnSXsgMpzJcyzzuq/scnVCr4j7Vq66HT/pvqfuYcyO03B8Xeq1dnNjuX1XiPZSlvMj
         Y+HyEujT5vaOyWvC1Mps3yYAmsIYHeUFidkgGBI1k8DEcCuhIt/0g+s1yJfIzGJcxUWR
         VsFl2VHsr14WKnmVxNR4gt/2Qa9OtvqmVgBJz3F8sN1EUv3jWIEUj088RhF72h9xDcHG
         5V/HTliUnFi/uZDYXMw5jZsEo9StDPr66vZn0U111EtzB0cXRBSi/L/0DaRnYR6eBAu8
         6gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108606; x=1694713406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7AODGgzjO594taBwmHKz6HitKdIGx7cKUiDd5WwWPc=;
        b=PkShKmyWkpBV2VaddyhvmhdB3Iior/W3/GgstWJviPz0rV/7+hkggqCJ4Qzzf2G/HK
         05CZlwPm66sv8HWJl9dDrC1oNpZ8QZ/imIZ2vvS4E9UMuRO3j/8f22J29krBlnTo8TcK
         sH4G2sUhwtuV0elUXKX7rdPeVFMOJ/aAdQ/iLi9t4yz+jkUuCFeJ7vNFld2z7kAEeUjm
         Nt3RAOvcycpW4+lwdPiaCXVgulAHsw3Ph5QBxzJ3PYl6UWWNtRaDFKYSerexI4peDwOZ
         Z8WiN58sTecPbvkK4U1dXkgR1jARNGjjgyewFpnlh25gXUCS7hkRVlGS+xAtRK1WemKF
         /a7Q==
X-Gm-Message-State: AOJu0YwXY0VlH/U66Tp+7iVD+asDQ1f04GpHS9xvbk7C0r8WSlYuOUS0
	4LkwlbX/KQx07DJjLXXafpejaw==
X-Google-Smtp-Source: AGHT+IELdY5HocWspofgUiKEy8mrH49mxLIfYe85ETbBPjkDw6EA7nQSGCz0/uIln6eL4c/jCu1RhA==
X-Received: by 2002:a17:902:d4cf:b0:1bd:c338:ae14 with SMTP id o15-20020a170902d4cf00b001bdc338ae14mr409104plg.12.1694108605904;
        Thu, 07 Sep 2023 10:43:25 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:84f6:5055:9180:822])
        by smtp.gmail.com with ESMTPSA id t8-20020a1709028c8800b001b80d399730sm34077plo.242.2023.09.07.10.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 10:43:25 -0700 (PDT)
Date: Thu, 7 Sep 2023 10:43:22 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 3/5] riscv: Vector checksum header
Message-ID: <ZPoLuvJooH4W4IGA@ghost>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-3-ccd658db743b@rivosinc.com>
 <20230907-c23868a1016a17299a470120@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230907-c23868a1016a17299a470120@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_104329_452773_F39FAC78 
X-CRM114-Status: GOOD (  32.11  )
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

On Thu, Sep 07, 2023 at 10:47:55AM +0100, Conor Dooley wrote:
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
> 
> Silly question maybe, but is this complexity required?
> If you were to go and do
> 	if (!has_vector())
> 		goto no_vector
> is there any meaningful difference difference in performance?
Yes I should use that instead.
> 
> 
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
> > +	vmv.v.i %[prev_buffer], 0					\n\
> > +	1:								\n\
> > +	vsetvli %[vl], %[ihl], e32, m1, ta, ma				\n\
> > +	vle32.v %[curr_buffer], (%[iph])				\n\
> > +	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\
> > +	sub %[ihl], %[ihl], %[vl]					\n\
> > +	slli %[vl], %[vl], 2						\n\
> 
> Also, could you please try to align the operands for asm stuff?
> It makes quite a difference to readability.
> 
> Thanks,
> Conor.
> 
Will do.

- Charlie
> > +	add %[iph], %[vl], %[iph]					\n\
> > +	# If not all of iph could fit into vector reg, do another sum	\n\
> > +	bne %[ihl], zero, 1b						\n\
> > +	vsetivli x0, 1, e64, m1, ta, ma					\n\
> > +	vmv.x.s %[low_result], %[prev_buffer]				\n\
> > +	addi %[vl], x0, 32						\n\
> > +	vsrl.vx %[prev_buffer], %[prev_buffer], %[vl]			\n\
> > +	vmv.x.s %[high_result], %[prev_buffer]				\n\
> > +	.option pop"
> > +	: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
> > +		[curr_buffer] "=&vd" (curr_buffer),
> > +		[high_result] "=&r" (high_result),
> > +		[low_result] "=&r" (low_result)
> > +	: [iph] "r" (iph), [ihl] "r" (ihl));
> > +	riscv_v_disable();
> > +
> > +	high_result += low_result;
> > +	high_result += high_result < low_result;
> > +#else // !CONFIG_32_BIT
> > +	csum_t result;
> > +
> > +	riscv_v_enable();
> > +	asm(".option push						\n\
> > +	.option arch, +v						\n\
> > +	vsetivli x0, 1, e64, ta, ma					\n\
> > +	vmv.v.i %[prev_buffer], 0					\n\
> > +	1:								\n\
> > +	# Setup 32-bit sum of iph					\n\
> > +	vsetvli %[vl], %[ihl], e32, m1, ta, ma				\n\
> > +	vle32.v %[curr_buffer], (%[iph])				\n\
> > +	# Sum each 32-bit segment of iph that can fit into a vector reg	\n\
> > +	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]     \n\
> > +	subw %[ihl], %[ihl], %[vl]					\n\
> > +	slli %[vl], %[vl], 2						\n\
> > +	addw %[iph], %[vl], %[iph]					\n\
> > +	# If not all of iph could fit into vector reg, do another sum	\n\
> > +	bne %[ihl], zero, 1b						\n\
> > +	vsetvli x0, x0, e64, m1, ta, ma					\n\
> > +	vmv.x.s %[result], %[prev_buffer]				\n\
> > +	.option pop"
> > +	: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
> > +		[curr_buffer] "=&vd" (curr_buffer), [result] "=&r" (result)
> > +	: [iph] "r" (iph), [ihl] "r" (ihl));
> > +	riscv_v_disable();
> > +#endif // !CONFIG_32_BIT
> > +no_vector:
> > +#endif // !CONFIG_RISCV_ISA_V
> > +
> >  	csum_t csum = 0;
> >  	int pos = 0;
> >  
> > 
> > -- 
> > 2.42.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
