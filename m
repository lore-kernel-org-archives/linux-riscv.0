Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D05CD1299
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 19:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=A6JQxAXNgzkHsiSUTJjjDKEGk0ou/mn5YI14sEnoe4A=; b=l/6s5xlRz7A8UBJCQ5uMm7PaRc
	CeOYOhHynEyy81ufWvMMz3lzCvwnTOKKqUwajEXNfZC0arbNcOrgkYQcmRTeFBzNAQOp3j6xwH6X+
	HGVTn2jYncoNLm/fjLHikQFCDlit1qbWFNnk1eFRjV0YGQelGAJpCrFYgK29XAuKXIJvsF2plua/M
	Oo8LPMXX1iBhDEpvA5Snfz+quoRozW71YtdxOU8t/aK3EO25V2crSwYiVqYTPFvRfCOd6S+yf9hok
	4280mQ9Qn5mP5oC321uFrlEs1wrzukbo4L4GIdPeNU68aXgEf8Fj+PtvtF+v5SStDvDTB944ioAuV
	dKjCyNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruHNu-00000003aMn-0pNv;
	Tue, 09 Apr 2024 19:43:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruHNq-00000003aLm-3uWX
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 19:43:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ecf3f001c5so4931017b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2024 12:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712691832; x=1713296632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h53B27ecNHID1eXdf2FDHGt3AvdzJKoL8em24LSk0zk=;
        b=DpPCpp3FNegyi1rQ6f1wmXLbXvnTgkkGCHlMFEfyFHsYvCLCL7iG1wn9psK8XE34c7
         UU5PE5dU7c8ytOVNxBr7USncsG6rjef7ncNP85O/TNFSMSVJ6CDEHDzQHXb2s4ktXf/M
         aVU54mKgUnDjgJjR9+Qi6h7tRU6RZEJSdufSt1/M1/ed24jUSuOuxIzt9woC3XjFMxqr
         6jiBG4aTgsSgJsu8/wWxh+MFOWt5jC4dZLdTlseuJHy9oJLm3v82DC522ly32EUXYI7d
         MJUylm5/yVB+uLflEdhYb40XWYcxR4/rzcP8GjTj36y36XutViFJK64vxSvdmqr9Dpqt
         hU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712691832; x=1713296632;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h53B27ecNHID1eXdf2FDHGt3AvdzJKoL8em24LSk0zk=;
        b=vGura04HIbg6l3knx8ODlF46+CT19bOihpFtoZah+/4XUUp5Gl0m7vDzMYSBOTkW8d
         +5ufwUtKplnJN33rlsGHzNFgtu97lbUzu5KSByp3mtMi9mx6gT3lfpzgIp4Ajdc8Yp0H
         v7JMFmCPUffi1fvBJsEhG2K/owUCpQoAz1V2a/rBGGQ2i6pYEpnz/1A/VbXrfCxUdzbX
         BMLYvBnAyp6S5tzyLjl8VXcyl24/ITTUS9h5XLvM7O4RZf9sFvKPN16+5fZl0tWla2HB
         mfTK923UNB1qn1QznLh05TXD72DrHvXYe1bazdv+mr9CU/X3DQo6Ncsocw56fMGUKBJv
         rf9w==
X-Forwarded-Encrypted: i=1; AJvYcCW/mYBPpBsjEdFx+ZhA1aQbIdXrcFYKUYUgW9QmU6L6b5mYsQ72nUWmm9ykk2I/Xl6Xukia2ibz/A7RxEHxX6pbW3EDpnclz1w3F+Pb7f4t
X-Gm-Message-State: AOJu0Yw62qTbfkkamsobnoDLNyLFTTXfqqpmt3qVSyWfKZESXIXpWFdi
	9jmXC8YsPzskFXCwG8loWhrrxZ6PStYj9/I3C+ehlBUHRQ3E2V32wfZloRCoOPc=
X-Google-Smtp-Source: AGHT+IFBDhalit5CBUtLdP+oCW6gPaGZXDYApBZDPMr2GixfOhzhLUtkHUNZ/dpRhZzvWQ/JDO1haw==
X-Received: by 2002:a05:6a00:22c3:b0:6ed:1c7:8c6b with SMTP id f3-20020a056a0022c300b006ed01c78c6bmr588864pfj.1.1712691832230;
        Tue, 09 Apr 2024 12:43:52 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id y10-20020aa79e0a000000b006ecf217a5e1sm8655966pfq.189.2024.04.09.12.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 12:43:51 -0700 (PDT)
Date: Tue, 09 Apr 2024 12:43:51 -0700 (PDT)
X-Google-Original-Date: Tue, 09 Apr 2024 12:43:49 PDT (-0700)
Subject: Re: [PATCH] riscv: Do not save the scratch CSR during suspend
In-Reply-To: <3010bb57-c13f-494a-9e8c-0ae6393b1eee@sifive.com>
CC: jeeheng.sia@starfivetech.com, linux-riscv@lists.infradead.org,
  aou@eecs.berkeley.edu, ajones@ventanamicro.com, Conor Dooley <conor.dooley@microchip.com>,
  leyfoon.tan@starfivetech.com, Paul Walmsley <paul.walmsley@sifive.com>, pavel@ucw.cz, rafael@kernel.org,
  linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-fa663ef4-be7b-455b-b467-f4d331a269ea@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_124355_131047_7A33F947 
X-CRM114-Status: GOOD (  24.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 21 Mar 2024 16:51:31 PDT (-0700), samuel.holland@sifive.com wrote:
> On 2024-03-14 11:55 PM, JeeHeng Sia wrote:
>>
>>
>>> -----Original Message-----
>>> From: Samuel Holland <samuel.holland@sifive.com>
>>> Sent: Wednesday, March 13, 2024 3:57 AM
>>> To: Palmer Dabbelt <palmer@dabbelt.com>; linux-riscv@lists.infradead.org
>>> Cc: Samuel Holland <samuel.holland@sifive.com>; Albert Ou <aou@eecs.berkeley.edu>; Andrew Jones <ajones@ventanamicro.com>;
>>> Conor Dooley <conor.dooley@microchip.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Paul Walmsley
>>> <paul.walmsley@sifive.com>; Pavel Machek <pavel@ucw.cz>; Rafael J. Wysocki <rafael@kernel.org>; JeeHeng Sia
>>> <jeeheng.sia@starfivetech.com>; linux-kernel@vger.kernel.org; linux-pm@vger.kernel.org
>>> Subject: [PATCH] riscv: Do not save the scratch CSR during suspend
>>>
>>> While the processor is executing kernel code, the value of the scratch
>>> CSR is always zero, so there is no need to save the value. Continue to
>>> write the CSR during the resume flow, so we do not rely on firmware to
>>> initialize it.
>>>
>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>> ---
>>>
>>>  arch/riscv/include/asm/suspend.h | 1 -
>>>  arch/riscv/kernel/suspend.c      | 3 +--
>>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
>>> index 491296a335d0..6569eefacf38 100644
>>> --- a/arch/riscv/include/asm/suspend.h
>>> +++ b/arch/riscv/include/asm/suspend.h
>>> @@ -13,7 +13,6 @@ struct suspend_context {
>>>  	/* Saved and restored by low-level functions */
>>>  	struct pt_regs regs;
>>>  	/* Saved and restored by high-level functions */
>>> -	unsigned long scratch;
>>>  	unsigned long envcfg;
>>>  	unsigned long tvec;
>>>  	unsigned long ie;
>>> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
>>> index 299795341e8a..3d306d8a253d 100644
>>> --- a/arch/riscv/kernel/suspend.c
>>> +++ b/arch/riscv/kernel/suspend.c
>>> @@ -14,7 +14,6 @@
>>>
>>>  void suspend_save_csrs(struct suspend_context *context)
>>>  {
>>> -	context->scratch = csr_read(CSR_SCRATCH);
>>>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
>>>  		context->envcfg = csr_read(CSR_ENVCFG);
>>>  	context->tvec = csr_read(CSR_TVEC);
>>> @@ -37,7 +36,7 @@ void suspend_save_csrs(struct suspend_context *context)
>>>
>>>  void suspend_restore_csrs(struct suspend_context *context)
>>>  {
>>> -	csr_write(CSR_SCRATCH, context->scratch);
>>> +	csr_write(CSR_SCRATCH, 0);
>> If the register is always zero, do we need to explicitly write zero to the register during resume?
>
> The register contains zero while executing in the kernel. While executing in
> userspace, the value is nonzero. The value is checked at the beginning of
> handle_exception(). We must ensure the value is zero before enabling interrupts,
> or we might incorrectly think the interrupt was entered from userspace.
>
> We don't know what the value will be when the hart comes out of non-retentive
> suspend. Per the SBI HSM specification, Table 6: "All other registers remain in
> an undefined state."

We're also not setting it at all in `.macro suspend_restore_csrs`, which 
I think is just a bug?

That said, I'm kind of seeing bugs everywhere I look in this now -- what 
about all the other registers we can poke, like timers/counters or the 
V/F state (or anything from M-mode, though maybe that's just someone 
else's problem)?

I also think we'd break on medlow kernels, as a bunch of this relies on 
medany-as-PIC for the SATP-off transition.

Maybe I'm going crazy here, though...

> Regards,
> Samuel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
