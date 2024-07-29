Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10559C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRi5sVqwI8wSw6xnAKimLggNppEblhjxUwdtzrTKNdw=; b=zriksECmlia71L
	D6FxZUiHiMrQGQubz3YLXX7WzWQ0tZMwy1TO6f+b/6CO/l1qOmH7YKVJTPj0+reodKfwNd+rXqCMs
	Ta0KxH9bbO6zfmQwTR5p6kIXrQ7Ulga1JMIkvi2DrmltFoRgfMxLI8m3N/lxx7PuC9XPcuVoPClEe
	ylgqedREE5GWBLKHh44xpbzau3AVW3z4l4uC3VMj70PvgAk+IAE+2RWO45MPJFjsFS23Q+MvNAYrF
	JT96/b4fyfNam131SJAR53bZv2MEwH2K+buU7yS9wIJ6rizCy9UppEjhm0MK1aNBBIB5dkIHkM15M
	KvuRRZ1FsmLLa7YHQB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQw4-0000000BUzy-0OEd;
	Mon, 29 Jul 2024 14:01:12 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQvy-0000000BUz3-2yxK
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:01:09 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b827so5570957a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722261665; x=1722866465; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRx42WidhCHa/mOy4csLusW89dVnuN3R4QUa7EpMhXY=;
        b=JEv+VMsCuN+SCbQVMzhBmWrVwVJWzAK52GsiP0MlrdR5o2M7qtrk/PB9XgwbU7V0mh
         +KXcFYXEUY509l3XvwdqIurUL5tF9xlXi75pHJPZ9ndqkfuZfyx6GeJkh/9l+62Z5txZ
         IRhRkWWfIY/8tOJj+/s3QLg+NOMs+kKa+7IgOtsrPLZ+lVpqyR0p7waGDAx5h0FGjyS3
         yDgS5E58+XvheMEpqbNz/kUVxrB+cRTrZWTAA9sL7EQzxdzSznCkVLGR+MzVtvsB3Uru
         fT349YTZLeXVuykfsFu4Kwpa74KK3PaCdoova7SW0LGKwkJa/yeBeKGZJJsHXePNGT/8
         Br5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261665; x=1722866465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRx42WidhCHa/mOy4csLusW89dVnuN3R4QUa7EpMhXY=;
        b=VeRdx349Yrv1gVipWZPfJrVCFgPL3eBuy9VbXrbwm5PQGloaZCOqbX/dlL1gZsLU/R
         yVyjXfdv2Iqc3bMz37sNaxq78SpO6l85D4UsSKXOyfwkOq6QXE8YhCYvPeWhuumlMstU
         zg+DjoYEUhXJ22fkueIwXhIoqPx1GUN9gMMpKookLsXzkYgrEf6ZrnuBKUMmYXsWFTyK
         2xAmBv3wJnTTBi2BhdhE+e/XIolPJLwyqG0z1fVVXXqRVxZ0murmyAceApYZgFN7MeIF
         g8V/fidwqYm4+t0zKlR88F4dt30/fVulQ+ZmtTxaHhW6jDUBccHBK+gHv60y4z2MAhWw
         vaZw==
X-Gm-Message-State: AOJu0YztKQQSxykdfpKHGwytJbUjhl9QYGSuTu25wzwUssFTEPJEjB3p
	YwAnxkpUP9B0SVxn2n66hhMDdRQriF/KXCkNr2NQxYteFJhxMRv9GFeqR0NU4nI=
X-Google-Smtp-Source: AGHT+IEs0VcMT4QB/MhAZGUOY8bNgDqk49Prk5XfVDB64dnU5cyUVB6q+XHAXkY75Nv9kZUVsvmUSg==
X-Received: by 2002:a17:906:c142:b0:a77:e48d:bae with SMTP id a640c23a62f3a-a7d3ffe7145mr665969766b.28.1722261664647;
        Mon, 29 Jul 2024 07:01:04 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb807dsm511195366b.201.2024.07.29.07.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:01:03 -0700 (PDT)
Date: Mon, 29 Jul 2024 16:01:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org, 
	atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, christoph.muellner@vrull.eu, heiko@sntech.de, 
	charlie@rivosinc.com, David.Laight@aculab.com, parri.andrea@gmail.com, 
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v3 3/6] riscv: Add Zawrs support for spinlocks
Message-ID: <20240729-b6707d037c0546c2c2f8da25@orel>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-11-ajones@ventanamicro.com>
 <4de22b20-8a6a-47d0-a4e9-74343c45411c@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4de22b20-8a6a-47d0-a4e9-74343c45411c@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_070106_780248_6642CE2C 
X-CRM114-Status: GOOD (  13.01  )
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

On Mon, Jul 29, 2024 at 03:43:30PM GMT, Alexandre Ghiti wrote:
...
> > +static __always_inline void __cmpwait(volatile void *ptr,
> > +				      unsigned long val,
> > +				      int size)
> > +{
> > +	unsigned long tmp;
> > +
> > +	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop",
> > +			     0, RISCV_ISA_EXT_ZAWRS, 1)
> > +		 : : : : no_zawrs);
> > +
> > +	switch (size) {
> > +	case 4:
> > +		asm volatile(
> > +		"	lr.w	%0, %1\n"
> > +		"	xor	%0, %0, %2\n"
> > +		"	bnez	%0, 1f\n"
> > +			ZAWRS_WRS_NTO "\n"
> > +		"1:"
> > +		: "=&r" (tmp), "+A" (*(u32 *)ptr)
> > +		: "r" (val));
> > +		break;
> > +#if __riscv_xlen == 64
> > +	case 8:
> > +		asm volatile(
> > +		"	lr.d	%0, %1\n"
> > +		"	xor	%0, %0, %2\n"
> > +		"	bnez	%0, 1f\n"
> > +			ZAWRS_WRS_NTO "\n"
> > +		"1:"
> > +		: "=&r" (tmp), "+A" (*(u64 *)ptr)
> > +		: "r" (val));
> > +		break;
> > +#endif
> > +	default:
> > +		BUILD_BUG();
> > +	}
> > +
> > +	return;
> > +
> > +no_zawrs:
> > +	asm volatile(RISCV_PAUSE : : : "memory");
> 
> 
> Shouldn't we fallback to the previous implementation (cpu_relax()) here? Not
> sure this is really important, but I want to make sure it was not an
> oversight.
>

Hi Alex,

It was intentional. We can't easily call cpu_relax() from here because
asm/vdso/processor.h includes asm/barrier.h which includes asm/cmpxchg.h.
We've mostly reproduced cpu_relax() here since we're only skipping the
div, and, as __cmpwait will be used in loops which load memory for the
comparison, I didn't think we needed the extra div stalls.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
