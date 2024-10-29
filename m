Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC4D3A696
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 19:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve8ywwVyz6RMelQXT/mKGoV/1Wxs6ZXVCW0Cl6EHi5Q=; b=VaK7PtPhGs9LLAapEoNi5rQQyZ
	IXTxB5x3fFkP+fwTnBSgajc3GCQRmTe+k6jgnCK2zvNRMGgIjv2/dM+ve2L9X9Coo5G/oyNMi5QkJ
	Ar8aJrWpyfK0ZaJByvxqbgU5wl0sp8aaeFYSmF78uKf+Azx8mf3jPUNczNoLsOVkqY+i44uISttWG
	4AVAOLmHTRpN6o3jjCMoMTvW4wNUKUkWVPL6fpA8zVS7haO+Cg/+RdUsH6iBdneG1W0MQ+eOzkK0V
	b7ykMhFjqOmERk3+n4FY3k3XdZ0ChLIVb6+kCw9Qmgvl5J5BikQW93yvST9N5W69+jzyElLIqL/zH
	zKA3r0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rmo-0000000FeRy-3bm1;
	Tue, 29 Oct 2024 19:21:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rlC-0000000Fe6l-1IWm
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 19:20:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c805a0753so57959795ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 12:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730229608; x=1730834408; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O0vFHoWbrSRR2ES8L3I6DovgTdFZvj8y3um9C03AOTM=;
        b=vRakZEBZuwpwz8/ywkTQbe2dZOva+29LSZr0yEkhk2ODFXEWSK3RoZwHV4o1LJa6Ie
         LPLLADlFmBPNteQJLf6dhavdXDyprO5bdAj3+y1Gsky9XSeJoG47oRXJ8M+FM+HtDWyW
         j8R16RTfGwET7+sfFYIlYCpUwNhxWu2nhgo4s5h1f3LUFSeHp+9oGIOAORunFlOer60g
         EFzMtTZfy5DCdQLa1DjnO5VR1tKyeEZsK9SCx4SiDOPmfd6e7dg18uBWU4xkTckCyW6y
         DeKIlS3DUAo9iG9eJ1coH8fls97au9igw/hO6zhu6y9HX2BRRWN2bqpB5+SZwiW5Fe3W
         bv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229608; x=1730834408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0vFHoWbrSRR2ES8L3I6DovgTdFZvj8y3um9C03AOTM=;
        b=mLB+WEuyyDdibFt3wj0wkDs3ViGDvAHkQS9uImLRjYYvW1dbkuI/DqQTcyQq62BPww
         iHLp3jT/uCYLDJnYzQt+sKa9wStTC6ZhuNPyPPpxlKq8pd3iQ7OnDLAisoONdLSX+Q3b
         s3aJV6qn3cbRvSUYT11TejyVLseYq3mf2QkYA0ya7E/ntfrf69Dlhr3+kCXKb3+2X4uk
         VUAo0MkpcR8yo9gdCzOwnHkawypChHw7Xjk5quKPUiFE/rfCrfA5akaTxZY/ZW+IUq2E
         HX9a1r3DaHPG3jzPKuf4WW2F8UzsUt47ijUps6NVsexmBLMpv7RC05H4ky2grZsAThG4
         xMCA==
X-Forwarded-Encrypted: i=1; AJvYcCU6b15wTkGwihMCYNeFV/oiM4xFhmEwcGsP5ZCGFO33Z8PCAB/8UqV2dRZDbHOzBtGI9WLoFQ6DHa0iEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg6X7CbDCGF6PGCsMbBOUzrAPSoMaTSi3l3voXgdE+eNl5feTv
	myEqhRGTjpkNnY4UkyDACfYS8SPM74bPbzVu9Svzjlo44qdXVZLmy3mwFlBdObU=
X-Google-Smtp-Source: AGHT+IEz1Nei096nISYhbzUC6FRMXyKTS7dZH8MtzqB+gzpPW7BJsfK7Sdp2yjSlqcl2PqbelWFqkg==
X-Received: by 2002:a17:902:ce0d:b0:20c:da66:3875 with SMTP id d9443c01a7336-210c68eac77mr182841805ad.24.1730229608560;
        Tue, 29 Oct 2024 12:20:08 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc082f20sm69567585ad.299.2024.10.29.12.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:20:08 -0700 (PDT)
Date: Tue, 29 Oct 2024 12:20:05 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	cleger@rivosinc.com, charlie@rivosinc.com, evan@rivosinc.com,
	samuel.holland@sifive.com, andybnac@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Enable Zicbom in usermode
Message-ID: <ZyE1ZVCI71sLUeqm@debug.ba.rivosinc.com>
References: <20241025091527.57825-1-cuiyunhui@bytedance.com>
 <20241025-puritan-sank-b8a828ef5872@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025-puritan-sank-b8a828ef5872@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_122010_420163_7E9BDE00 
X-CRM114-Status: GOOD (  18.46  )
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

On Fri, Oct 25, 2024 at 11:16:44AM +0100, Conor Dooley wrote:
>On Fri, Oct 25, 2024 at 05:15:27PM +0800, Yunhui Cui wrote:
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
>I believe we previously decided that userspace should not be allowed to
>use zicbom, but that not withstanding - this is wrong. It should be
>checking for Zicbom, not Zicboz.

Additional comment:

It would be good to have this (flush/clean/inval) disabled for seccomped
process or at least some sort of user abi to disable it (whenever use decides
to seccomp current task). So either

- by default disable when task is strict seccomped

OR

- introduce user abi (prctl) to disable it. so that any task trying to
   lockdown itself should be able to do that.

This is particularly useful for sandbox hosting in same address space.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
