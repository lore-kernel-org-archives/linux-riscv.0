Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75B4C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 01:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3sFOfDSMVDoUPKa/zj3d9qlJd7wO2rtD/hv+/GHlVJU=; b=TE0QeYurViCShCrR4mvI2u2pn+
	Sf/j5DkQOx8VmXjBYXImhfXoiBYMhDP6WvYwmiT3gWrj2AtMf4TIGAqa5H3IA5mNp1DQIH8D15nGX
	OYVqnemf/Tfw6IJAuEXiaqzfbZeeaOr0IWyedOJqwDAV5XMNhPbRS0l1cZ73yJ4TNY7xfxoaHGZkJ
	XCatKr6mQ+rkkBxpoBzeMqIQr0sDBaFfZIg99UPt9/2Kh9iyXc4t8U3nWjXXHd+Yh0YxUpIf4Ge1W
	kIie3xbc1mO1d7oe4wVhPDs9gl3366Fqu4+pYrmX4zfCuDijVlAUe/CL+Nj9xzuevVcPmIgXekB1V
	1NUrkJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ1vm-0003KL-1d;
	Fri, 29 Dec 2023 01:44:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ1vj-0003IS-08
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 01:44:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d3e6c86868so50995775ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 17:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1703814289; x=1704419089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNCVR8SMHnCHeEQ/yMeXXkUdP9Bs/RTaT2/RSyEx1Tc=;
        b=sKTgutQ6VZUQS1uG/2Krl8C37NCLjCnesD4QxzuafD9Hcd8ecsDaxhwsiFM3rsZHzZ
         58I1riqCO4eCLcKLaCjDYbB9/84l8fJYOXLZFi8AJPdjaXsl++OaqHd1R7PeOvG8x0pr
         7I3NLN2rhQFM7ZWl3XP14EeVB10k8rlOCxEzp3X2ImQYzDyHusqDsfRYT2u4iBK+mhOU
         qm0MFUrNNx3dQ4Y+O14p9QTs5wo3iyjeYIdW4HNjJLQRjOeo7abliBjSPmGINiQD412W
         /CvmOFCNgKzKMuBEFBMIFBnLQYbID3RErht+/SPfGRM6mIauN4e75clouaBdriVdQ6um
         rw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703814289; x=1704419089;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNCVR8SMHnCHeEQ/yMeXXkUdP9Bs/RTaT2/RSyEx1Tc=;
        b=fUQcg03Z/1d67uB5iVpEMtYJrifYOmbo++Wk/GEIDW1ZtSQQRI8GOHkVXOyfswgbc2
         VTSFAm+uxmee35zfyju9SVeISykFen6qU1xCOnme2mnZogUrhe4WO+HIvl/y4QYFkrBO
         fMnSg1ch2r+873wyx4IRCdrfby4rpHpWced+Ena9N6KkTk/KF4G6QbYDOuIxGrcTtd4f
         r/V0Grqz06JSGe3//JsYPO81MCoD4IyowO2Ipt4t/xrGydrxXsSiprowNPIb38ItvbmW
         4ydVC8OaBSLsFjYj6THWOP1VIufc4EYVPEcVtZwmQmvaITIJ1txpHAm7jFxBYwNiNECG
         /jmA==
X-Gm-Message-State: AOJu0YzuieUFIyZ373Ex839xMSqTmUX7ucKs9Gx102QMcKmXnSw5IFD4
	AQM0ccUVYbZBBR4I0aRWsvPXohIxffq1uRs/OyJLCBkL9MQ=
X-Google-Smtp-Source: AGHT+IHJ97SDIMc6/L9jYSipHJSv37tASQguwy1/ne3mvPNbcopocbR96EShTn3HW49dMkrd1Sk0UQ==
X-Received: by 2002:a17:902:f7ca:b0:1d3:f067:a3f0 with SMTP id h10-20020a170902f7ca00b001d3f067a3f0mr11108857plw.107.1703814289238;
        Thu, 28 Dec 2023 17:44:49 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id pl18-20020a17090b269200b0028ae9a419f0sm19000570pjb.44.2023.12.28.17.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 17:44:48 -0800 (PST)
Date: Thu, 28 Dec 2023 17:44:48 -0800 (PST)
X-Google-Original-Date: Thu, 28 Dec 2023 17:44:25 PST (-0800)
Subject: Re: [v1 03/10] drivers/perf: riscv: Read upper bits of a firmware counter
In-Reply-To: <20231218104107.2976925-4-atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-94cdfcf4-01c1-493c-a23e-32bc8b391aad@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_174455_674490_DDB99D3A 
X-CRM114-Status: GOOD (  20.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, kvm@vger.kernel.org, anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, kvm-riscv@lists.infradead.org, atishp@atishpatra.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Dec 2023 02:41:00 PST (-0800), Atish Patra wrote:
> SBI v2.0 introduced a explicit function to read the upper 32 bits
> for any firmwar counter width that is longer than 32bits.
> This is only applicable for RV32 where firmware counter can be
> 64 bit.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..646604f8c0a5 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -35,6 +35,8 @@
>  PMU_FORMAT_ATTR(event, "config:0-47");
>  PMU_FORMAT_ATTR(firmware, "config:63");
>
> +static bool sbi_v2_available;
> +
>  static struct attribute *riscv_arch_formats_attr[] = {
>  	&format_attr_event.attr,
>  	&format_attr_firmware.attr,
> @@ -488,16 +490,23 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
>  	struct hw_perf_event *hwc = &event->hw;
>  	int idx = hwc->idx;
>  	struct sbiret ret;
> -	union sbi_pmu_ctr_info info;
>  	u64 val = 0;
> +	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
>
>  	if (pmu_sbi_is_fw_event(event)) {
>  		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
>  				hwc->idx, 0, 0, 0, 0, 0);
> -		if (!ret.error)
> -			val = ret.value;
> +		if (ret.error)
> +			return val;
> +
> +		val = ret.value;
> +		if (IS_ENABLED(CONFIG_32BIT) && sbi_v2_available && info.width >= 32) {
> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +					hwc->idx, 0, 0, 0, 0, 0);
> +			if (!ret.error)
> +				val |= ((u64)ret.value << 32);
> +		}
>  	} else {
> -		info = pmu_ctr_list[idx];
>  		val = riscv_pmu_ctr_read_csr(info.csr);
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
> @@ -1108,6 +1117,9 @@ static int __init pmu_sbi_devinit(void)
>  		return 0;
>  	}
>
> +	if (sbi_spec_version >= sbi_mk_version(2, 0))
> +		sbi_v2_available = true;
> +
>  	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>  				      "perf/riscv/pmu:starting",
>  				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
