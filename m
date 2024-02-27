Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67232C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 20:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kv3Ogxd7hjuAk9BD34AXAHiySsIo+6VTpIHZD3nEj1I=; b=QnDWrSWEcGnZscTzyMrALMNsQG
	CqPIIdPhCVZAHACkdD5OzgaerdxSqD8Fu1FrdnnJV5bM1X5qxfokxzrdCIji7oBniHnBrrw60k/g3
	vPJRaRArs+CMps4wIa43aGlUg/2yMaeEnl7XFPV4g8+xtPKDIJ2rqJlvvlXRkwc54C7+apI1cZMPf
	XJi99ydGcWUHMuMW3mUeKmdw7CZtCVJQTKQGRL8UxKDJUERjj9XszW00rtTOXaPNirXF283y8Js9i
	O38riBwvt2pUeDTWoLCVcacDdkr2zJlyXthrAEcrfqdthXLM/qClgxxy/GasCY5u5yX7vyoZtorsJ
	6wUH3ssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4Vc-00000006pNP-3grC;
	Tue, 27 Feb 2024 20:57:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4VY-00000006pLd-33ly
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 20:57:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d7881b1843so36148225ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 12:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709067420; x=1709672220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOB62dL9qN724Ecj/YLdjEDiS5KjiWcStv5/TyEIX7s=;
        b=EBBIBooGH9bmedD7CsWkza8ajfvqepj5vyKlKjsEiGyHDdCgyzHDop/NPRUhLDXKTn
         p+TDr8N4Lr7ESc4AdThadlT65IXly5tLHoswmq7FjKLYG6AIoE+0qj1rJ5gU0ZejLD2V
         jGUiPFJyv3KGTNOXTA09YB48nrC5jgrozgg7kOCfEB7G6NJI4aCcto2Ri0h0DxRpK+t2
         27kjWzbYdnLuoMOBFIOvbulzSws91E29D7zqhZXvMR7pXuB5Dhp3olmcxq8IYRijaWLl
         m9Jcb/pgW5Yf1MF9mqwd+vNOg24HGdTiIoefadh4gnkp4+ViZbL86NmTA9MgX4zCP93L
         64hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709067420; x=1709672220;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOB62dL9qN724Ecj/YLdjEDiS5KjiWcStv5/TyEIX7s=;
        b=a6GlqUzfGsOvWkydY09OqiCTnhXt3matHWg0l7VI3c2CRgt5vinQQDeXAzeb8gAZLc
         DlCl89rg4bhiqCo3aHZJA11e0y5T4WugBHJwHe0tQq7gzRFcp4VhrYqvzM8Yjsv0oqp3
         HxhI+f2B0mzPnZI3yp+e9zlZShDG9GxZ3YfxxtifI8nL0Hv1ZTQ91GacMmOhUr0kFsRd
         IH+vBG6/lpy5R/K5kNzp6eU5G8nZino26Wt/LEg3NXsd+4kNUuRDhEfunDXPXdXjxRT9
         Iy6UHoG7MwJqxsya8JFTL+SaDZf/j34VZPp1YlVHNKbJdU/SclZ6lQMtyW0k8Zxsmq7Y
         TJxw==
X-Forwarded-Encrypted: i=1; AJvYcCWkKNxKBBIc4pZ16OJP2rM9bzs3sbWrH2IsKD+zDDrotzjs0ZyWiRSSMmtU9zCVkiLedFCspPIUUwtxQhvOx7bSlRkDoEMEsv3rClRxKMU2
X-Gm-Message-State: AOJu0YwCmnz3J2lZUQLRDs0MUU5KjSWfWovO6o8jD81BAC0StSM0Zl1+
	dAwM3hn43d81u3H8M+lRgrH1jq7Fggjl4fL3c5ktHU+cDLrz3gKb+jDNmjm75qQ=
X-Google-Smtp-Source: AGHT+IF0DxTx3AxrLX1ryR9GF2gpsn7xPqrDvqd55MwEJEeBh4CVMCZzNgNnxt9s/ka4wUYMDn5FYw==
X-Received: by 2002:a17:903:1212:b0:1d9:3bb5:2819 with SMTP id l18-20020a170903121200b001d93bb52819mr13900313plh.34.1709067419669;
        Tue, 27 Feb 2024 12:56:59 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id ja9-20020a170902efc900b001dbb06b6138sm1940276plb.252.2024.02.27.12.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 12:56:59 -0800 (PST)
Date: Tue, 27 Feb 2024 12:56:59 -0800 (PST)
X-Google-Original-Date: Tue, 27 Feb 2024 12:56:51 PST (-0800)
Subject: Re: [PATCH v2,RESEND 1/2] drivers: perf: added capabilities for legacy PMU
In-Reply-To: <6ad96656-3cf4-4e22-8a18-cfde5c31cfc1@ghiti.fr>
CC: vadim.shakirov@syntacore.com, linux-riscv@lists.infradead.org,
  atishp@atishpatra.org, anup@brainfault.org, Will Deacon <will@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-320add25-610e-4e86-a266-55a5f0b52087@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_125701_054540_FF2BE3B9 
X-CRM114-Status: GOOD (  20.06  )
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

On Tue, 27 Feb 2024 11:26:20 PST (-0800), alex@ghiti.fr wrote:
> On 27/02/2024 18:00, Vadim Shakirov wrote:
>> Added the PERF_PMU_CAP_NO_INTERRUPT flag because the legacy pmu driver
>> does not provide sampling capabilities
>>
>> Added the PERF_PMU_CAP_NO_EXCLUDE flag because the legacy pmu driver
>> does not provide the ability to disable counter incrementation in
>> different privilege modes
>>
>> Suggested-by: Atish Patra <atishp@rivosinc.com>
>> Signed-off-by: Vadim Shakirov <vadim.shakirov@syntacore.com>
>> ---
>>   drivers/perf/riscv_pmu_legacy.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
>> index 79fdd667922e..a85fc9a15f03 100644
>> --- a/drivers/perf/riscv_pmu_legacy.c
>> +++ b/drivers/perf/riscv_pmu_legacy.c
>> @@ -117,6 +117,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>>   	pmu->event_mapped = pmu_legacy_event_mapped;
>>   	pmu->event_unmapped = pmu_legacy_event_unmapped;
>>   	pmu->csr_index = pmu_legacy_csr_index;
>> +	pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
>> +	pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
>>
>>   	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
>>   }
>
>
> I see here that Atish added its RB:
> https://lore.kernel.org/linux-riscv/CAOnJCUJ-eE+zbXH0yBX_QBK2ep779q=wNCSrc+BJfzUb+zBCaw@mail.gmail.com/
>
> So I add it here (hopefully b4 won't complain, I don't know):
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

It says

NOTE: some trailers ignored due to from/email mismatches:
    ! Trailer: Reviewed-by: Atish Patra <atishp@rivosinc.com>
     Msg From: Alexandre Ghiti <alex@ghiti.fr>
NOTE: Rerun with -S to apply them anyway

Should show up on fixes in a bit, assuming it gets through the testing.

>
> And I'd say the fixes tag for this one is:
>
> Fixes: 9b3e150e310e ("RISC-V: Add a simple platform driver for RISC-V
> legacy perf")
>
> Thanks,
>
> Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
