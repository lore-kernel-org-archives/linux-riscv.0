Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871A2C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/8I0pzoXb+ur6e/QsLoK2aF+8s713Dl00GoElaTpAI=; b=chI9X7vNaVnlvw
	2xEco+MIznTaL3dPiQTHYtHRGfHuhR4ls+E+2DXXu16lKzM6HwLVWUWtOS6pxBZxfS/iRWcceGRJS
	iRZ0C2/iIvP0SFR6vFWcXLb6T8BwAqDBEi+fAQMgVQ6yPFs1I+fGfxJTGDkntqFw0qjmOKBf9DNZD
	1bf493cWKYGb+qctJdsaykBPb36m7K3p8LKIec7hlCo4Mj6P13QzlO0gXQkbDgj6dSHW8Amo2/doA
	nf0kKNg+1xRYQAfJvjMrVqp7kDKBlU6YpkPZCk723aGpnKyc9SYw5IJ509nPD1DeMXL/MrJFXjxCg
	1ZZTLyGfYL9PLgAGmY9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweVL-0000000BV7A-0uxs;
	Tue, 16 Apr 2024 08:49:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweVI-0000000BV63-2VSO
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 08:49:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4189a6a71dcso1445025e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713257362; x=1713862162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mvwae8C2beujv4aHEun0iITe/+EHhljfurmTw9uDoMY=;
        b=fFjl8NjPi6FivySi2IuOspMHlS+bijRQNZx04Y8MMVxPSibnn4swds2IJrFtmFl/9D
         xVToYKtINY02bLe+ccjLFz461O/HwmnHDYpwUR4CIrSMehMj/D/0tTdOAw/5Zf6/pIXf
         3SGL15YTKPHzKned7sT3NB1ArjxpGEsDQ8TugT1iaxwFlrCnCDwQ+pTxSCBTSevjXqkX
         2s2Nng0yJmL7GKreRNIJiGMOzLOMtd6enOjcXHFvCjw1arRQ0LFRc930FbqUaBRhmRW/
         ofdZKdTKEum8YfbtdqmzGgpuIshC38kcyNZQMNzE7Nauw084FTjVUEbhM5YVzgOM28SZ
         Mq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713257362; x=1713862162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvwae8C2beujv4aHEun0iITe/+EHhljfurmTw9uDoMY=;
        b=RKzH9BosyBn0RiZxhRHHOMNXeHtLQk3HCQowyEgy46LqI0w1GgR7jjK1lNjhZWh1qi
         /Un6OGs4lsZyE9CkI4c36daniyrLysu4i9ayvhoNo5JfwX8ZEJcehoOBzo91bSKZtWG8
         StnulnwGYLhkD6XWR7kwbyWVzIExZgrSw1/qnzmc6wnauvDIHXsIQaNKaLQNVBtcqJzs
         1eKtemA/dD7upPHxxbrS9z2gVfjfPpQCA6jjCy7cM57gsNwn5sxTyqIPm/6CQVP5rPjK
         6zPTBKH92DgfLQl2JRm1+oEtNhP+MkZgyV2nwTxZ+j9I7Sf7jUL2NG58h351WhWNeGW4
         P/jA==
X-Forwarded-Encrypted: i=1; AJvYcCXSkRKCX2PU6obb9K/I3iYP4JVkn7OiWC7xa+AZ+oFGfUb9/gCKr3FL7QXi1dprv3DsVr/GngaC6HmfSzrB2ym2ezNuHz37Zip+Q50BYmky
X-Gm-Message-State: AOJu0Yy6xtLcdprjf61pfzEs+VWclxXOBzDl2IoQu0/1Ae97V99rbs3y
	CVIgfkc0Jtv7IqrRFyZFvwU3RIi/uIdPGIjYd6/ks7hWt5aGtCuGKjGBV0sdW/Y=
X-Google-Smtp-Source: AGHT+IERQO7yDpvVx0Ze29NzNiatXbTnAhDW6vGus8ihCC8tUM3/GY995t+6Bsj2kugS44iI1F1GAA==
X-Received: by 2002:a05:600c:45d0:b0:416:3317:5951 with SMTP id s16-20020a05600c45d000b0041633175951mr8879758wmo.6.1713257362109;
        Tue, 16 Apr 2024 01:49:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b00418729383a4sm5208029wmq.46.2024.04.16.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 01:49:21 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:49:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 07/24] RISC-V: Use the minor version mask while
 computing sbi version
Message-ID: <20240416-1a9f7ea9700c4c6c3e52a1b1@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-8-atishp@rivosinc.com>
 <20240415-e229bb33ad53ce43e3534f5a@orel>
 <2a63d7da-91b6-496d-9966-e6c0a0aa6c6c@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a63d7da-91b6-496d-9966-e6c0a0aa6c6c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_014924_666159_74FCECFD 
X-CRM114-Status: GOOD (  30.52  )
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

On Tue, Apr 16, 2024 at 01:31:27AM -0700, Atish Patra wrote:
> On 4/15/24 06:06, Andrew Jones wrote:
> > On Wed, Apr 10, 2024 at 05:07:35PM -0700, Atish Patra wrote:
> > > As per the SBI specification, minor version is encoded in the
> > > lower 24 bits only. Make sure that the SBI version is computed
> > > with the appropriate mask.
> > > 
> > > Currently, there is no minor version in use. Thus, it doesn't
> > > change anything functionality but it is good to be compliant with
> > > the specification.
> > > 
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >   arch/riscv/include/asm/sbi.h | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > > index f31650b10899..935b082d6a6c 100644
> > > --- a/arch/riscv/include/asm/sbi.h
> > > +++ b/arch/riscv/include/asm/sbi.h
> > > @@ -367,8 +367,8 @@ static inline unsigned long sbi_minor_version(void)
> > >   static inline unsigned long sbi_mk_version(unsigned long major,
> > >   					    unsigned long minor)
> > >   {
> > > -	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
> > > -		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
> > > +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR_SHIFT
> > > +		| (minor & SBI_SPEC_VERSION_MINOR_MASK));
> > 
> > The previous version had ((major & major_mask) << major_shift) | minor
> > (parentheses around all the major bits before the OR). Now we have
> > parentheses around everything, which aren't necessary, and no longer
> 
> We have to use parentheses around | to avoid compiler warnings
> (-Wparentheses)
> 
> Are you only concerned about the outer parentheses ? I have removed it.
> 
> > have them around all the major bits before the OR. We don't need the
> > parentheses around the major bits, since shift has higher precedence
> > than OR, but I'd probably keep them.
> > 
> 
> Is this what you prefer?
> 
> return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
> SBI_SPEC_VERSION_MAJOR_SHIFT) | (minor & SBI_SPEC_VERSION_MINOR_MASK);

Yup

Thanks,
drew

> 
> 
> 
> 
> > Otherwise,
> > 
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > >   }
> > >   int sbi_err_map_linux_errno(int err);
> > > -- 
> > > 2.34.1
> > > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
