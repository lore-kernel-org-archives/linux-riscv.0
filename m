Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEB7C54E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 03:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVkVGaofzb5DPai3ocV/bEJB6ivfF6/pjIi7EyoSJGM=; b=R6swqC2zCJADoq
	UJl/cpcX4RdjDTcyzlr+yjUZgLudsHw6y/UjUIQcJZDZaNcxJ6fSNQe1/7eSTk3TQberplOwJGk1l
	iWiYIC0hf9unO7TXKzM810bp0i4BFWIghzLG7cfbNGrcydBEubVKg5HDx5bihGorPnJfHhLNOIpr6
	oH7PxxdZRLKjMFBO9XH2cM98LsoPYAIQemdU4IRRpzzzkrN4KfDdkAorBsxQUGPoVnXJydmLY7hdq
	jZRMqrnMGIflfYPpW6dO4hyKDtRL1hn2ZDpjQ2JlpS/WHyj3WRflryHq2zhwawRswwKkDSiAxaXFR
	SWTSnclj/RoEc4n3GRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkFC5-00000008e29-176B;
	Wed, 13 Mar 2024 03:22:17 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkFC2-00000008e1V-2i9n
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 03:22:16 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5e4b775e1d6so363416a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 20:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710300129; x=1710904929; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrBUCaeV/dwaHFNXHKFwRp9ZoTbxAso4k6A0KIx30Kw=;
        b=VpmwLHNyhRGrjReEuoEYUtQM2fEfHzACNCM3C9sAaFDLMCskV3q4bpM/mMQSxSFEWq
         Cib4cWqCzTW25Z9MhXzEPB/TB1dCU6tSpdYO7l8VOANIZH7VpCfgeTJbSMjJtU9SN5Ni
         TdYBZUijcKmd5WiC33etno4+WCxp9Ad8t4hohMcfkPrwEWhMrooweE+Wrd84x/1AUwwX
         d9bXMAuBfXQkNRzOmUr+t1Ld2GEhw+m6pmHhrm/4REbVHLKU4h4Lxa1Xvs4LFfNB9YVA
         ZrrGKFBnfUHqFNdfAE71Dcc+3n46ZztuqJxSk36yhzyIDEqkW7qfvgosdOfjmt3qUaar
         z2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710300129; x=1710904929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrBUCaeV/dwaHFNXHKFwRp9ZoTbxAso4k6A0KIx30Kw=;
        b=QCVjZJz5FSmJgXC/W1S3Xc129dPsZIhoWXoPNMHV2tODZBByz7L0xWMs2oaZy4/+zc
         IWVKufWc6biHGwi2yEchW4WL21KLahAIcJyoeTOh4MULpmX3V7PP1ipcWwFio7ELrQVD
         IWrgE8rf1s56+/ro40PMGQIi7IgeQ52kMP01ohHYGyrjj/JyCsdJmKvY5SlJiTb+6wL4
         G/9LQqvMOjatXpkjtwVO1NmevcKoFdqIcay2j4aXtbHP1pqOo6vrhYd6FTKJABhps6jt
         2pIxgnxr6KF0Px/Hag+b0dsRvOCRPWU8HtBkulSyXKs+/SlAGpnV/Q6NOWtgCKPp4vJK
         Ccrg==
X-Forwarded-Encrypted: i=1; AJvYcCU9zk4Y0nNvpw35jabdEiNogVAxWInGSEUr5xkuOUeMTSKt3FWeeiuNslFXLnsI27P2uu1lkg60GrQYjDkiN7uyDWQwB/hCh7mrcJqyuhLx
X-Gm-Message-State: AOJu0YxEB5Q9Dpv9QEV3pXfLFVghnoS7EkqtcVMSQnmk+pwU792l7nI5
	20VUMJ4BP9z8wZz07D1EYb7gu2nQl2du+eUiTEqz8TA2vuvFbDBaUIuyhIR8otI=
X-Google-Smtp-Source: AGHT+IFKhNUh1ZNzl325ce9f/jj/4HvlL+NSmK1isj6lq+0XGv0m2rrdpwNhKz7ZPF9fQSmUeSmvTA==
X-Received: by 2002:a17:903:1c3:b0:1dd:8a51:7b49 with SMTP id e3-20020a17090301c300b001dd8a517b49mr2048372plh.15.1710300128657;
        Tue, 12 Mar 2024 20:22:08 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:733c:479a:4b7b:f77b])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902ed1500b001d9a42f6183sm7466890pld.45.2024.03.12.20.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:22:08 -0700 (PDT)
Date: Tue, 12 Mar 2024 20:22:06 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix spurious errors from __get/put_kernel_nofault
Message-ID: <ZfEb3tCCcXjAfgbU@ghost>
References: <20240312022030.320789-1-samuel.holland@sifive.com>
 <ZfEVNbt9AMeVJS0k@ghost>
 <06ebe952-c872-4406-bcb9-00b0b892fb6c@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06ebe952-c872-4406-bcb9-00b0b892fb6c@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_202214_715032_45637D1E 
X-CRM114-Status: GOOD (  38.18  )
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

On Tue, Mar 12, 2024 at 10:05:37PM -0500, Samuel Holland wrote:
> On 2024-03-12 9:53 PM, Charlie Jenkins wrote:
> > On Mon, Mar 11, 2024 at 07:19:13PM -0700, Samuel Holland wrote:
> >> These macros did not initialize __kr_err, so they could fail even if
> >> the access did not fault.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: d464118cdc41 ("riscv: implement __get_kernel_nofault and __put_user_nofault")
> >> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >> ---
> >> Found while testing the unaligned access speed series[1]. The observed
> >> behavior was that with RISCV_EFFICIENT_UNALIGNED_ACCESS=y, the
> >> copy_from_kernel_nofault() in prepend_copy() failed every time when
> >> filling out /proc/self/mounts, so all of the mount points were "xxx".
> >>
> >> I'm surprised this hasn't been seen before. For reference, I'm compiling
> >> with clang 18.
> >>
> >> [1]: https://lore.kernel.org/linux-riscv/20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com/
> >>
> >>  arch/riscv/include/asm/uaccess.h | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> >> index ec0cab9fbddd..72ec1d9bd3f3 100644
> >> --- a/arch/riscv/include/asm/uaccess.h
> >> +++ b/arch/riscv/include/asm/uaccess.h
> >> @@ -319,7 +319,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
> >>  
> >>  #define __get_kernel_nofault(dst, src, type, err_label)			\
> >>  do {									\
> >> -	long __kr_err;							\
> >> +	long __kr_err = 0;						\
> >>  									\
> >>  	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
> >>  	if (unlikely(__kr_err))						\
> >> @@ -328,7 +328,7 @@ do {									\
> >>  
> >>  #define __put_kernel_nofault(dst, src, type, err_label)			\
> >>  do {									\
> >> -	long __kr_err;							\
> >> +	long __kr_err = 0;						\
> >>  									\
> >>  	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
> >>  	if (unlikely(__kr_err))						\
> >> -- 
> >> 2.43.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> > I am not able to reproduce this using Clang 18 with
> > RISCV_EFFICIENT_UNALIGNED_ACCESS=y on 6.8. However I can see how this
> > could be an issue.
> > 
> > Going down the rabbit hold of macros here, I end up at
> > arch/riscv/include/asm/asm-extable.h where the register that hold 'err'
> > is written into the __ex_table section:
> > 
> > #define EX_DATA_REG(reg, gpr)						\
> > 	"((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"
> > 
> > #define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)		\
> > 	__DEFINE_ASM_GPR_NUMS						\
> > 	__ASM_EXTABLE_RAW(#insn, #fixup, 				\
> > 			  __stringify(EX_TYPE_UACCESS_ERR_ZERO),	\
> > 			  "("						\
> > 			    EX_DATA_REG(ERR, err) " | "			\
> > 			    EX_DATA_REG(ZERO, zero)			\
> > 			  ")")
> > 
> > I am wondering if setting this value to zero solves the problem by
> > hiding another issue. It seems like this shouldn't need to be
> > initialized to zero, however I am lost as to how this extable setup
> > works so perhaps this is the proper solution.
> 
> extable works by running the handler (selected by EX_TYPE_*) if some exception
> occurs while executing that instruction -- see the calls to fixup_exception() in
> fault.c and traps.c. If there is no exception, then the handler does not run,
> and the err register is not written by ex_handler_uaccess_err_zero().

Hmm okay I understand thank you for explaining that. It's interesting to
me that in __get_user_asm 'err' is set as a read/write variable even
though __get_user_asm doesn't write to it. However, it seems like
changing it to a write-only variable the compiler incorrectly optimizes
err, and the kernel fails to boot.

> 
> If you look at __get_user_asm(), you can see that the err register is not
> touched by the assembly code at all -- the only reference to %0 is in the
> extable entry. So if the macro that declares the error variable doesn't
> initialize it, nothing will.


Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> Compare __get_user() and __put_user() which do initialize their error variable.
> 
> Regards,
> Samuel
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
