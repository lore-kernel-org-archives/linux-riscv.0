Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75673C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouKQb0jiYeut8FSUHtI2UQt3jjf/qL6G7oZQ4B7QFGo=; b=mVTDefAiF0uva9
	0qqQlI/Kp01NW+PEvPls8Zfl0hD42xgCxa6ynGH/bkiEiFIZGce5GHKHl9U7BrOA4+tB6x4S+kxJA
	Km1xmCO8pf29Ej2BlF8FHffpjim7tth/pv9qqq56TfBFfSQW+OIsbDjMeW+YxuxugMvVj4ETR7u/m
	WdRuTIdeud2PSYbt4JCbP4PRgYblj/1TFr1W4SxHSNGXfQecyOb6nEWTUd8ZUiHTrtfzbm9/cuYxJ
	jo45PM7dkwQLOWapQaIhhdsMpuNQ2bEl//55jqalwz29tGBKqC7e/FsX9LC27HAXXVd5llCaFTxe+
	QcWCdO/PrA/bbWBtsM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMRy-00000008Ugp-0Oe9;
	Mon, 15 Apr 2024 13:32:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMRr-00000008UeH-3gDB
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:32:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-416a8ec0239so17641495e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713187958; x=1713792758; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YfFnCtrCdaYweGdW7b/X7wLS8PykVIhbaLaFH/3RBKs=;
        b=pcANpXJp/Y8ns0wo8glNFdO3G8bqsaWZnLPacmgwMDD7Xao9gEVDTW/N/67qevHb+j
         1S50p1VsvNoqsBZ5IdteRJk42i1lDHwC+JYeCfM6ZXDqrAcF9whFz3x4F4NZQUywMlcg
         bS4j/oW3SlTh9XrVDyBK8vcgj3JsZZ3T8Tb5eFoB/VtfX7OeBZ2zf6xEBG+vMcd+hMx8
         8whzvLsD59eRSp8k+Gqd982YbYBe8ygE+/iRZvAzwwSxCAxxxMU82gR0ttUY4+1nxNLD
         gRmY2T0TyfgQ2v4LFBQL2YexQJwqwikx1x9V5A3bU9odKAoWOPS/XNInfxWxA2FnSSW1
         neVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713187958; x=1713792758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfFnCtrCdaYweGdW7b/X7wLS8PykVIhbaLaFH/3RBKs=;
        b=OyJzEdD4RdgrwOk0rxc/IsVWrGYclITxm2PuojWJdu3njWzGDTmy7w2gSPc6VhKGzs
         BBtOwS235q03dTykXfQX+mwuEI7BnPQxyFZhq381T+Ydv1SIspvDwWOK1HL7Z17la8Kz
         gxFDBnINwZsPFWchCgKXCe0Bppd16E5WpstW2R2EZUmttlT+TX9+iDVsbbG63t3udYtA
         1/3mCui8Oly+HpYPJde6cooz5ZwK8XWU9/GySvknpgMRicSKMBluDbYspJ+NOZMjkOVu
         8a7yxne9zejGjoPCCqSa8pcmC0D+2z3n1gQNzYi0SgXzue8dHC09yo9gj78bsESU+acL
         GPpA==
X-Forwarded-Encrypted: i=1; AJvYcCXBMFiyzNElnYY/k7wObpa0jEYsoeWJgEQ8cAxsyh7uzhkd4yTJ5gKUvErkmA5f1Kfj53IKhw1YslsV/5RQH5xItEFCR6U5ceLjRyUYD6PI
X-Gm-Message-State: AOJu0YwQCJ875zGorDQU9llvPiVjwyK2AKdZxiTjZGyV2cK7MP5c1IUi
	94A7xWhwlGYSN2PFFlYz24gtKxeqerYZnOd24fXrLn4b35tOjYc/+ySLL6bx4Y0=
X-Google-Smtp-Source: AGHT+IFoZFoMz1NB27raXr0+F36UbAh0bYI/huPwqdYpnuJ5dY1VU+ZBhab3Ez4blLLhX5Tys86QcQ==
X-Received: by 2002:a05:600c:5115:b0:418:5e81:415f with SMTP id o21-20020a05600c511500b004185e81415fmr2552795wms.14.1713187958349;
        Mon, 15 Apr 2024 06:32:38 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c4ecf00b00414659ba8c2sm16357094wmq.37.2024.04.15.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:32:37 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:32:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 22/24] KVM: riscv: selftests: Add a test for PMU
 snapshot functionality
Message-ID: <20240415-f6d8638ff922ccd58d1abf41@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-23-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-23-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_063240_007719_5853BF0A 
X-CRM114-Status: GOOD (  20.10  )
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

On Wed, Apr 10, 2024 at 05:07:50PM -0700, Atish Patra wrote:
> Verify PMU snapshot functionality by setting up the shared memory
> correctly and reading the counter values from the shared memory
> instead of the CSR.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../testing/selftests/kvm/include/riscv/sbi.h |  25 +++
>  .../selftests/kvm/lib/riscv/processor.c       |  12 ++
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 144 ++++++++++++++++++
>  3 files changed, 181 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> index 6675ca673c77..1b995481a3fa 100644
> --- a/tools/testing/selftests/kvm/include/riscv/sbi.h
> +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> @@ -8,6 +8,12 @@
>  #ifndef SELFTEST_KVM_SBI_H
>  #define SELFTEST_KVM_SBI_H
>  
> +/* SBI spec version fields */
> +#define SBI_SPEC_VERSION_DEFAULT	0x1
> +#define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> +#define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> +#define SBI_SPEC_VERSION_MINOR_MASK	0xffffff
> +
>  /* SBI return error codes */
>  #define SBI_SUCCESS				 0
>  #define SBI_ERR_FAILURE				-1
> @@ -33,6 +39,9 @@ enum sbi_ext_id {
>  };
>  
>  enum sbi_ext_base_fid {
> +	SBI_EXT_BASE_GET_SPEC_VERSION = 0,
> +	SBI_EXT_BASE_GET_IMP_ID,
> +	SBI_EXT_BASE_GET_IMP_VERSION,
>  	SBI_EXT_BASE_PROBE_EXT = 3,
>  };
>  enum sbi_ext_pmu_fid {
> @@ -60,6 +69,12 @@ union sbi_pmu_ctr_info {
>  	};
>  };
>  
> +struct riscv_pmu_snapshot_data {
> +	u64 ctr_overflow_mask;
> +	u64 ctr_values[64];
> +	u64 reserved[447];
> +};
> +
>  struct sbiret {
>  	long error;
>  	long value;
> @@ -113,4 +128,14 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  
>  bool guest_sbi_probe_extension(int extid, long *out_val);
>  
> +/* Make SBI version */
> +static inline unsigned long sbi_mk_version(unsigned long major,
> +					    unsigned long minor)
> +{
> +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR_SHIFT
> +		| (minor & SBI_SPEC_VERSION_MINOR_MASK));

Same parentheses comment as the other patch.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
