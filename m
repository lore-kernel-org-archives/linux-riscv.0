Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC87E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wU6b9du4KzpP9/3mmpVHVxjsKA8ovnuiHjfwylI2mE4=; b=it47W25R2/En8Z1roVyaGdhL6a
	TJnNkHeWFExCCsq4B6lLgVoH4a1c8q0fQuvcmLU6Ajop2OtZmdWoOQU7qZIT7YmstfkWke4CGd8hO
	NX2xxTI5O5r1pjSdjHTdJ8S+aofAB4uAY0/5yekHI8sIPlu1y88X+OYs4EhwZxRwtaYugwfNRaqds
	FpjXNcUiQUAF/O3oSlf8/nVCOwfCsL0VfyBd2i5cCk5gahTL3a8YcEBRMHp9Bn6e2h+c8zI5nnA8+
	G1QKWw5KvfoqgFjvWA/fVwR64CVJ0UVef8UMaZRwM90oBi2+kVnLHQjP5cSgqSA0xcq0gNyDSa51Q
	pyA+xs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLSfS-0000000Fxa6-1utE;
	Wed, 11 Dec 2024 19:46:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLSfP-0000000FxZa-2pGm
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 19:46:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so915064a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 11:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1733946398; x=1734551198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTiBfu3LCijHwOIB1klB+vWcYLMQe6opMPGWa86HSek=;
        b=IDaHLa1mX+7URoRnRMPC/iQhWO0poR6QU3I5tQC0ImLgCMpG1GflvUnNeTxGi9GkuF
         1phLPDQDJ8/1zKVAT2uEMM9N0ITXf+QriR9e88Y0TVUa5xOtunCBLDhZvIdO8TbMzCtT
         azhdq56n8aalBnCjbhjGmqdWtRbKSkzMGBk4yF0iAvGEZxWa8w5urM5s6t5QZ+ag/5lq
         QuYmMWOJJZnpLNxFuC4S2NGNEhO74MwHYHByKM4bvm/itYE3rq3jswD0MfhqR6KdXMTa
         cPHz2prGxv1WJqXVjTc+GqIgTrN6h37mPodC1NwZ3RW+DxMRQBQmtwgWAn4fNO+wgJ3O
         l5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733946398; x=1734551198;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTiBfu3LCijHwOIB1klB+vWcYLMQe6opMPGWa86HSek=;
        b=rd/iDjdgnI8Vq5IAzDmFqroTKgGtaECFBLw9lJSXfO71dHcoZGLMt0rSZiQ0KzqqQq
         w/STJ5XCj7R/4owHhKxXxFyDEGE/F9prOWRYpJqQ6t4KXlNa/G6dlFldZcSEIqR+bQWG
         6LXDXS6LzncEHRbBN0QEZoh4zUhOEagdWjq0crqX+K9kQHV6p95P5mp28oAgHR1s6hdS
         Ono4KEJvE09BX0NGOetGFFZX2UXBqoChByXymEDkmHVFEswqvEWkIGZdgPpQVQWpRiES
         agtogZ3dXXkL7e32JhScyZhTQTDcbfjYHpKzv++e0tkgK/574PJbd4a030WNrr5bQqTU
         DYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKj+2G3+cNbGLYFeCFmoY1y9mlExmMPwwInCnPJQvtn6j6fuyTXibxG1NbcJPHIWzhQMvH5R5IYV0EKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx516zUne1JOMb8KGVhknbT85/tA3v2GM3oqtcY9SUcx1SpbRyN
	kIB7mA7b1YJ4HSSI6pYULX+5PQLdXKSYkE46aCe1AIVl+aCN0J0OvG5G4+JP3fin0Oxd7FEJXIU
	A
X-Gm-Gg: ASbGncuRP4b3IHbV+uWoK51ZSPxxBhz2AzfDKtqBF0Es+Wo2+/9kXYa/xAE5873IGJV
	Bmcj5QKfGPYpl9lBTRqoVJNvnGzAgdaEtWR8TofgbzxD8FbPhga5Stmk3R/XJ8Gv2Mb5LayRCq9
	KkIsv4cCp2hklRgKGlJfowdrte4baf2ypIkVQ3VYhbCozHsEmxDb7iulqv94Uv8++TIm7LkkwLy
	3RcRjowmPZuol1Cs3T3Vy1oHOg9oA27ZLZurAw33nFxIBE=
X-Google-Smtp-Source: AGHT+IFnTOMb6O5sg4/hZzOJTSZlpikmzRhprbval79dvoemRTgwDyiy/kr+8d0qfhl4JQpSLR1kZg==
X-Received: by 2002:a17:90b:3c02:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-2f13abee2a2mr834848a91.9.1733946397459;
        Wed, 11 Dec 2024 11:46:37 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45f7eaedsm11923684a91.2.2024.12.11.11.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 11:46:36 -0800 (PST)
Date: Wed, 11 Dec 2024 11:46:36 -0800 (PST)
X-Google-Original-Date: Wed, 11 Dec 2024 11:46:35 PST (-0800)
Subject: Re: [PATCH 2/2] drivers/perf: riscv: Do not allow invalid raw event config
In-Reply-To: <20241209-pmu_event_fixes-v1-2-d9525e90072c@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org,
  anup@brainfault.org, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
  mchitale@ventanamicro.com, samuel.holland@sifive.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-1c6ec679-02bc-4aa3-9b23-bb4c5f5f9b81@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_114639_978025_38B4A9F6 
X-CRM114-Status: GOOD (  26.01  )
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

On Mon, 09 Dec 2024 16:04:46 PST (-0800), Atish Patra wrote:
> The SBI specification allows only lower 48bits of hpmeventX to be
> configured via SBI PMU. Currently, the driver masks of the higher
> bits but doesn't return an error. This will lead to an additional
> SBI call for config matching which should return for an invalid
> event error in most of the cases.
>
> However, if a platform(i.e Rocket and sifive cores) implements a
> bitmap of all bits in the event encoding this will lead to an
> incorrect event being programmed leading to user confusion.
>
> Report the error to the user if higher bits are set during the
> event mapping itself to avoid the confusion and save an additional
> SBI call.
>
> Suggested-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 3473ba02abf3..fb6eda90f771 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -507,7 +507,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>  {
>  	u32 type = event->attr.type;
>  	u64 config = event->attr.config;
> -	int ret;
> +	int ret = -ENOENT;
>
>  	/*
>  	 * Ensure we are finished checking standard hardware events for
> @@ -536,8 +536,11 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>
>  		switch (config >> 62) {
>  		case 0:
> -			ret = RISCV_PMU_RAW_EVENT_IDX;
> -			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> +			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
> +			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
> +				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> +				ret = RISCV_PMU_RAW_EVENT_IDX;
> +			}
>  			break;
>  		case 2:
>  			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
> @@ -554,7 +557,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>  		}
>  		break;
>  	default:
> -		ret = -ENOENT;
>  		break;
>  	}

This doesn't have a Fixes, is it 

    Fixes: f0c9363db2dd ("perf/riscv-sbi: Add platform specific firmware event handling")

?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
