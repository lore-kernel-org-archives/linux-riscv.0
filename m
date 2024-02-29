Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B51C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Li/39E9PBQ+H0GQvHMqYEtWjb1hGrhFSALo1k7qFCgg=; b=YPi3azDycxaTdZXY0mNjbeNT27
	aydLENl1FiosyE5pP6Let32Pfqy07uPjN1lyAOBPEpdSUH+gCzcvBRzWN/fpP4stcNqF3VVZQqwTc
	UFlRV+sXCWBIQiwmyv8JmFQVfWH5FESYVGtiT6+LhLKJ+wKT4NqiEThng0CPUOrWdEURBHnO4LHbP
	UHZBA2tmqvB3v3sR5g6y/54ZuAYF0t1Eb43OG/jbwLhfWOsdHmAVJUYk1a75QJGfhTwYpv/lRJ0S8
	7fuZVoctzbEWlzdFDuU+fsoGvrIHiKUp6VG1aViPpg0nXqifD53nLhEWoMvTQurbaafMYcMgQr9cA
	i5ygcktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfl4K-0000000EhMB-2xkJ;
	Thu, 29 Feb 2024 18:23:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfl4H-0000000EhLY-1RlB
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 18:23:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dc1ff3ba1aso10829525ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 10:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709231020; x=1709835820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbYjGWbVPUoMA9yoLV4Bq9DdL9YDbwpcvfQ5i1IxNJY=;
        b=aOv/PG+23y449Xrx5vwCfy5wKdMx36NQwK/ZtylVyvKhPXiYQ0K76ZbrQHrQ1lYMwA
         XVD//aNvTEuHkh/ew4UqBqdHBWbW9B5McB3nWIXhIivYzrlBe/0gc+nuvtcsbsouT2EE
         tGRoFw4ZLQ7Jn5tnB3wjrVOpUAG/AXZs2/F85BowsYfuc4LrELDEIV1Fn2QNKSwEdslp
         SZaEGLEiuDbp5go86uywwsYrKa4mXU8Wc7YexhVv9DrsOgs7mWJtCmKL0l0Vp8fb7v8S
         KcAsYbYlyjPOJ49YbTPedagR9N887wyMua9CENmy47lti/Nrzo53kWcQSe3yw8geItj+
         aOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709231020; x=1709835820;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbYjGWbVPUoMA9yoLV4Bq9DdL9YDbwpcvfQ5i1IxNJY=;
        b=EeWW9s3oeuk7IKvIah4m0Q1F7K/6CKpi1LWaGPDYCBYyDmYz11FPBeVWgwhXzjwjDn
         6+Dllyjm0svldvdWgJv1lK5/s4/18A6q4HDEleucmol0afDZiw+CO7AgGOaChGzEebaS
         uAia23axEuSgV6qcrguGU7eW0janeYz103DY5OsHuUBu/Jyp1hfee9YiNqxBNF8KQsIG
         ABGGFlYZvA4ZZilZO22VIlU8HQgRvVov7RknPpmE+4PwUmzhBo9VSZCMFC/c+5ux1lNP
         dpKhg0Y8aD62bzx8a71AIojO8xqtD5JUQjPJ4hxvD0XyWiCgOgtCNuZSWQhWzxm0JSkd
         buVA==
X-Forwarded-Encrypted: i=1; AJvYcCXATnji5M7An88v7BKZbBHuqEWYJPs74GgeNxdCNYRya3EEOae7swjSokOOWRqeNAKi664jyel9BFXz463Yhhrrx7q31qRKSwJkaeqlLGXV
X-Gm-Message-State: AOJu0YyKA1w4yGAHr56QE+8hp8t9eZXnDH1WQgPUDJZwxUjLF5gh29YO
	RD0qeQF16rkd2I41DnZp0C6oPDRn/5ns06D3wVz7FzGWuZwFJ24lxebCJqh0meE=
X-Google-Smtp-Source: AGHT+IGQTeBXjtlyAuNzBCl4pxIJl5lxn1BCm16ZbGfviqXJmKWQHlcF7bZ7LSjJ4SHO2MxyFQm++w==
X-Received: by 2002:a17:903:2284:b0:1dc:cbaa:f5dd with SMTP id b4-20020a170903228400b001dccbaaf5ddmr3655020plh.39.1709231020032;
        Thu, 29 Feb 2024 10:23:40 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id u17-20020a170902e81100b001dbcfa0f1acsm1810677plg.83.2024.02.29.10.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 10:23:39 -0800 (PST)
Date: Thu, 29 Feb 2024 10:23:39 -0800 (PST)
X-Google-Original-Date: Thu, 29 Feb 2024 10:23:34 PST (-0800)
Subject: Re: [PATCH -fixes v4 2/3] riscv: Add a custom ISA extension for the [ms]envcfg CSR
In-Reply-To: <20240228-goldsmith-shrine-97fc4610e0bc@spud>
CC: samuel.holland@sifive.com, ajones@ventanamicro.com, linux-kernel@vger.kernel.org,
  alex@ghiti.fr, linux-riscv@lists.infradead.org, sorear@fastmail.com, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-94e8034f-eda3-45df-bcf0-1bd5bd9cb869@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_102341_559137_8C57853A 
X-CRM114-Status: GOOD (  34.06  )
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

On Wed, 28 Feb 2024 02:12:14 PST (-0800), Conor Dooley wrote:
> On Tue, Feb 27, 2024 at 10:55:34PM -0800, Samuel Holland wrote:
>> The [ms]envcfg CSR was added in version 1.12 of the RISC-V privileged
>> ISA (aka S[ms]1p12). However, bits in this CSR are defined by several
>> other extensions which may be implemented separately from any particular
>> version of the privileged ISA (for example, some unrelated errata may
>> prevent an implementation from claiming conformance with Ss1p12). As a
>> result, Linux cannot simply use the privileged ISA version to determine
>> if the CSR is present. It must also check if any of these other
>> extensions are implemented. It also cannot probe the existence of the
>> CSR at runtime, because Linux does not require Sstrict, so (in the
>> absence of additional information) it cannot know if a CSR at that
>> address is [ms]envcfg or part of some non-conforming vendor extension.
>> 
>> Since there are several standard extensions that imply the existence of
>> the [ms]envcfg CSR, it becomes unwieldy to check for all of them
>> wherever the CSR is accessed. Instead, define a custom Xlinuxenvcfg ISA
>> extension bit that is implied by the other extensions and denotes that
>> the CSR exists as defined in the privileged ISA, containing at least one
>> of the fields common between menvcfg and senvcfg.
>
>> This extension does not need to be parsed from the devicetree or ISA
>> string because it can only be implemented as a subset of some other
>> standard extension.
>
> NGL, every time I look at the superset stuff I question whether or not
> it is a good implementation, but it is nice to see that it at least
> makes the creation of quasi-extension flags like this straightforward.

We can always add it to the DT list as a proper extension, but I think 
for this sort of stuff it's good enough for now -- we've already got a 
bunch of complexity for the proper ISA-defined extension dependencies, 
so it's not like we could really get away from it entirely.

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.
>
>
>> 
>> Cc: <stable@vger.kernel.org> # v6.7+
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>> 
>> Changes in v4:
>>  - New patch for v4
>> 
>>  arch/riscv/include/asm/hwcap.h |  2 ++
>>  arch/riscv/kernel/cpufeature.c | 14 ++++++++++++--
>>  2 files changed, 14 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 5340f818746b..1f2d2599c655 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -81,6 +81,8 @@
>>  #define RISCV_ISA_EXT_ZTSO		72
>>  #define RISCV_ISA_EXT_ZACAS		73
>>  
>> +#define RISCV_ISA_EXT_XLINUXENVCFG	127
>> +
>>  #define RISCV_ISA_EXT_MAX		128
>>  #define RISCV_ISA_EXT_INVALID		U32_MAX
>>  
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index c5b13f7dd482..dacffef68ce2 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -201,6 +201,16 @@ static const unsigned int riscv_zvbb_exts[] = {
>>  	RISCV_ISA_EXT_ZVKB
>>  };
>>  
>> +/*
>> + * While the [ms]envcfg CSRs were not defined until version 1.12 of the RISC-V
>> + * privileged ISA, the existence of the CSRs is implied by any extension which
>> + * specifies [ms]envcfg bit(s). Hence, we define a custom ISA extension for the
>> + * existence of the CSR, and treat it as a subset of those other extensions.
>> + */
>> +static const unsigned int riscv_xlinuxenvcfg_exts[] = {
>> +	RISCV_ISA_EXT_XLINUXENVCFG
>> +};
>> +
>>  /*
>>   * The canonical order of ISA extension names in the ISA string is defined in
>>   * chapter 27 of the unprivileged specification.
>> @@ -250,8 +260,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>  	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>>  	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
>>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>> -	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>> -	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
>> +	__RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts),
>> +	__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts),
>>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>> -- 
>> 2.43.1
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
