Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C9FCAC5AC
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 23:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4HZBHY2cdQCxdolaBNk0R55lGtxAj0ul+VN3WD9NxA=; b=lC/3Et9Azz9LuVcz2hT6SJjCZM
	sdoGP1E3wQ79tJBo5FidM4yO9K4EiQc6u93ZbliZdJKWvnQ3VqWSUdRV8a0bAyFGgyLGHmmlx+qpq
	Rq16gfQfp3817//ClEBtuMckq+Tvxt+mA9oOz/i6blR4m8UALvC0k4DdT0U4FMMm5OJFdY6azcgNN
	sC0AB1eovToXLkPWELp4sWdgErL/eJN0102XTjER2d2wCcDWaZTi/duz8+16RYcyUcpCxxZ+cvVTz
	hz61zTKAqotVFR/DACZwKBWtG0wIphYKxDO3t+JcDydaWdLOUJyUASbtgKgWdlYRTCrJCtEJpZWeB
	xO+nefaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0qPE-0000000BrPJ-3gGM;
	Mon, 22 Sep 2025 23:57:16 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0qPB-0000000BrN7-3idm
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 23:57:15 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b5512bffbfaso4523497a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 16:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758585433; x=1759190233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IODUA9zga0m/nOGRKLCJjuNE/B+/uoV/AOO8W3swHIU=;
        b=TLJ8FlQ56a3YKCjxltmIDWZOUgk1ePtJ0DZznYgrSEz8PDBD6J8Gxg3B/iVx5f5FPw
         e4Y92KJHq2IMFQcXrvvmpdiy7wbiA8c7ETPrW2j0yQh1ldryfgK749N36sqUis0oTSrT
         DfXPmw7XA12x+DNG4WqKQH+vVBmdNwxuAMJ51vPKPYoiuMOLRqr+bF0sRRDxi1kb+mBD
         K2Z9E3pgtvQdc+3zRfFawZybpeTXG7pk/mvYnZ821rn5/iqJWA8vZ6GE/rNKbUbHc4H5
         ui+rQg731xBDfMAzcR9twDO1VNiZe6Es5Vq9uDjbhg+SDM8Qr8MEMnKYVcmSCQ8wHJWT
         CaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758585433; x=1759190233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IODUA9zga0m/nOGRKLCJjuNE/B+/uoV/AOO8W3swHIU=;
        b=ckqre5vSccVvxaAgUzLci/rBgPPsOXhsJZGPD2IPQ51bVx+FhTbmJXKnRic/GbUWO+
         TfT5hVNzWUM27NQmYMn4U/xxUF5joP10spVYqWTwtVUJAGJ8C7kOCFeNRpUy1w5R+h/A
         l/iFPAn41CQP+0MIsubZbUdwYKcH0msf1SFU8SzSgNQFs7M1Ev59OJUwoQ8tguBscMu0
         99s0r522ktnbPjB3wC54KUKhDTcbsJOUD0niN95jQE8AJQ7VYkur7mgr602FMjTFv3L7
         /gSq5B3B5eSd8DI9gvelIMKTofVurT5zARQyTErUoAvQ0ne252C9jdF6LOG/pV/oulXH
         nLpg==
X-Forwarded-Encrypted: i=1; AJvYcCUFjyQpedl6XX01ylOrz8OcSiIv4vW8QePSbhKrSLA9Oi1i+Cj4FhHJxEs3JA5lqUHP+/UVSn7i18dsyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2uz6SZzN/JAOaKSg5XLiEfghNnt/FOnjViT/Gl23ATQKn/sR1
	vch4wqiy890GyRoQoyrrZNZib18vTYfhT8PFrzjscHrJpbXlSRaMJ1iJ
X-Gm-Gg: ASbGncu91QQb5lNAcBC9hVOqLPQlJLqfhVF0rkmesAKPElXy/EgvzAbnPwejYD83WxZ
	99xnyFHXtj1naQ+pbGmHVadluviiEYexOYXMta3phtBN+O313Pn8kFOBcROOFXkb0ZEyz/sDuqf
	s0ijt4p7RSWMAnOV/KknzSFtgF4e/04gOd9JFGX6npeQM8HQobHrEkxS7Qd5pU+5Q4IcaAJN6nj
	RhgwVMI1ACCtcYXy1PqLrXgZ3LLRikjqFclrZ+3wHtacDLjclzOFnVCZBCDWVJnHchgshBhbHRi
	qt79oNfPjWFj5E+9+viy43gX0tfR36BfmSLh6o4JWyV1SXjMGiQkQpGq56hQ+jRjaXiJDK6iaV/
	gDe1JUjnIw8SNkQe+Igt2MvCd
X-Google-Smtp-Source: AGHT+IFLSQPMmtJG7J8JigPkcsPkbNvPUMLxpyd334NCh2UapNWwuDV3lLZRY3JDLwxXh9eDESpAQA==
X-Received: by 2002:a17:90b:55c6:b0:32e:dd8c:dd2a with SMTP id 98e67ed59e1d1-332a8ceaae3mr951669a91.0.1758585432510;
        Mon, 22 Sep 2025 16:57:12 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77e0bb98790sm11669657b3a.9.2025.09.22.16.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 16:57:11 -0700 (PDT)
Message-ID: <8ca8192e-ccc1-41bb-a913-dd633d65ac54@gmail.com>
Date: Mon, 22 Sep 2025 16:55:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] riscv: Memory type control for platforms with
 physical memory aliases
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20241102000843.1301099-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_165713_932072_6A3CD9D4 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/1/24 17:07, Samuel Holland wrote:
> 
> On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
> RAM is mapped to multiple physical address ranges, with each alias
> having a different set of statically-determined Physical Memory
> Attributes (PMAs). Software selects the PMAs for a page by choosing a
> PFN from the corresponding physical address range. On these platforms,
> this is the only way to allocate noncached memory for use with
> noncoherent DMA.
> 
>   - Patch 1 adds a new binding to describe physical memory regions in
>     the devicetree.
>   - Patches 2-6 refactor existing memory type support to be modeled as
>     variants on top of Svpbmt.
>   - Patches 7-10 add logic to transform the PFN to use the desired alias
>     when reading/writing page tables.
>   - Patch 11 enables this new method of memory type control on JH7100.
> 
> I have boot-tested this series on platforms with each of the 4 ways to
> select a memory type: SiFive FU740 (none), QEMU (Svpbmt), Allwinner D1
> (XTheadMae), and ESWIN EIC7700 (aliases).
> 

Hi Samuel,

Any update on this? I see ESWIN has started their EIC7700 upstreaming
effort, and it'll likely rely on this. Is there any follow up series?
BTW, Icenowy's working on upstreaming the Verisilicon DC8200 driver.
His work also depend on this patchset in order to test on JH7110/EIC7700

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
