Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B392DD462B9
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Au/wMJcTD4GpI2QKZkvp8kR1WKchntjlT55pXxxRd0A=; b=L9Ak7m45xa9nvtUJ7gdKBAf2L9
	EXy10TELi1PkkS6bDOWEcYnnQvyV2l60bjqrvQLKXG/Dd19dgdk0yWrsrE3i3+SMGuohK4oaiSU6i
	kP672jDmaW6wpALqCEtw/aPAB+evXLnQL403r1LENgBv3nL+xqbSZbYATFe+3ADQ9+T9M1/FRvEne
	1wSpgeN3iG1q62tdNSUEHJYpiX1j8EOeAZxJWwiZMDSz08Q6u6eARb2qZcyUTsKrdVMwo69ItftD6
	1yFJXSOp03VerPev5pHkZkYQyZx3v/BGZkrygFqTq0PDSf4IDzvzYqesEU3DMm66y2mYajwrGcRJf
	MsNuHYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBF2C-00000007FZ2-3WtM;
	Wed, 13 Nov 2024 15:11:56 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBF2A-00000007FYD-0jYW
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 15:11:55 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-723db2798caso7075041b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 07:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1731510712; x=1732115512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEevrCGgnCHKu+tn27c1hkwB55o+zkSlf6ER/b6dXcA=;
        b=WFuFrrfLaN/+1+tBTUn++5hpzbtoZCv4z24UStCIM8KuocZUyxY9BLOblNdRbRC3RH
         Gpgng0S+wTjJTgI1EoTDtnofMeyRPeCXAomwM8/rWyMylOBNlvmJ43Y7sGnHsIGkX6da
         lzHwAaI7YseQcYkUPPgZbX2ACCwoHz5EQz1kB3+TJ+fB86FQemo2EXjABZdPyhBzq1PD
         5+31VmxOxThBwqIgcGHI46Wyxe2rCTt3G5IoPVm4yVk2AcfYf7qTe+9Xaer2TLMdxttV
         23U/KLja2/bDPK3lQIqxp23SZLwa+OYApVrAfSffY9bpgvpscdlD17o6wFd0fFmOv6Bm
         0iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731510712; x=1732115512;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEevrCGgnCHKu+tn27c1hkwB55o+zkSlf6ER/b6dXcA=;
        b=SnJ0VIkxHr/HiY08yCTYzbk3ts05bskEkZZv5DTiE9r2i/LWYl33Eapu+YP03sk17N
         iTmoXbUy49sC8cjA+YwdI5JLkzc9FHw3eNyf3mzcnuQ4Cb+QCUJoaHzLtAzDGONq4tcP
         0Bihq1EYv8hfeU1/B1jQeGcuzl3G96BjAbYADOMMHQYv6d1759mijnuetklz2PBFSXUz
         iINEyEU4rYCpNGcHZDiGWgRt7hfABBdpiSpfb8wVnTpOf6iPanvT3UUQ93t8vlvxlBWE
         K1zJ3/Sk3NN2PbTZ1Vw3RsoKrtfWqRS/9hiOOEDYDbUpAjJHkYzXdXRPNjuzE5Me/EID
         Ac7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXb2TXVeO+o2o+1Mwzf+yEE+rPGhdgAwbxMLNo2ZOJjNNXUFzeXElw/UZlAlKBfTS8ZL3MzaaE8X8nrXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzwmTfO+layfqe4o4LQp4d1xI8iwkmKipLONrrLQLo86+nhuIn
	7qrjb6CEFWceHWrClhnrGoK95rXWVkDJTCIVmBZ21HFwjjyulr6dE5s6TTCle8k=
X-Google-Smtp-Source: AGHT+IF6dAQuXHH8zuadNr4w3nttjCNk1A405ajbo0+ieSOKAPOHNFkbBktOyltiO9TJiFCXE2hQKg==
X-Received: by 2002:a05:6a00:3c96:b0:71e:5b4a:66d4 with SMTP id d2e1a72fcca58-7244a516913mr9121240b3a.9.1731510712360;
        Wed, 13 Nov 2024 07:11:52 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a1a87bsm13098811b3a.158.2024.11.13.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 07:11:51 -0800 (PST)
Date: Wed, 13 Nov 2024 07:11:51 -0800 (PST)
X-Google-Original-Date: Wed, 13 Nov 2024 07:11:50 PST (-0800)
Subject: Re: [PATCH] RISC-V: Enable Zicbom in usermode
In-Reply-To: <20241025-puritan-sank-b8a828ef5872@spud>
CC: cuiyunhui@bytedance.com, punit.agrawal@bytedance.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, cleger@rivosinc.com,
  Charlie Jenkins <charlie@rivosinc.com>, Evan Green <evan@rivosinc.com>, samuel.holland@sifive.com, andybnac@gmail.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-cee266c4-3485-423a-b769-aae7ae034a1a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_071154_439407_E5571B63 
X-CRM114-Status: GOOD (  20.05  )
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

On Fri, 25 Oct 2024 03:16:44 PDT (-0700), Conor Dooley wrote:
> On Fri, Oct 25, 2024 at 05:15:27PM +0800, Yunhui Cui wrote:
>> Like Zicboz, by enabling the corresponding bits of senvcfg,
>> the instructions cbo.clean, cbo.flush, and cbo.inval can be
>> executed normally in user mode.
>> 
>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> ---
>>  arch/riscv/kernel/cpufeature.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 1992ea64786e..bc850518ab41 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -924,7 +924,7 @@ unsigned long riscv_get_elf_hwcap(void)
>>  void __init riscv_user_isa_enable(void)
>>  {
>>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
>> -		current->thread.envcfg |= ENVCFG_CBZE;
>> +		current->thread.envcfg |= ENVCFG_CBIE | ENVCFG_CBCFE | ENVCFG_CBZE;
>
> I believe we previously decided that userspace should not be allowed to

Ya, we didn't want to expose this because it opens up a can of worms.  
Is there a use case for this?  It's not like this is entirely impossible 
to do, it just requires a bit of thought (and should probably be gated 
behind some per-process disabling).

> use zicbom, but that not withstanding - this is wrong. It should be
> checking for Zicbom, not Zicboz.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
