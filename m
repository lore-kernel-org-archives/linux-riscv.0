Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CAAC35FFC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PnhenZMBTmAotjaeoNNboxRarIqFPyyias5lSxOpYo=; b=snCV911PtKm7bR
	6Ezsk2DGE7eqz4B4Z95iU1c+MMNcuw9mCzAubEnTQaRXdBBxC0STDU+Jk6vNEJzp9JAYzqA+BdGwR
	fQbhQl4QZ0VukOif1nA0IZbzR+4WJTVIvqx+5gPUsFI088LMZp+f5VYdf4fgYG3pTD5MQqw5b6noE
	mQiae5ohmeLi+J8z/5Zm6iuD6Le6t4P96rj4OIC4jylFukFbQTuT7nSHMYT5R4d9s+RivsMOi6Gb0
	vcaHN77iVbFcmh8pdOsUjoEBFFLhjZAUoIIJgqazcNwtexP0PhqwAO+3yk3WjW2lHGHL48fkIm03x
	prhvM3yuh/Uji+MLOwwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxhP-0000000HNXC-0K7u;
	Sat, 22 Mar 2025 12:11:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxhM-0000000HNWT-0ipQ
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 12:11:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4394a823036so28314545e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Mar 2025 05:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742645490; x=1743250290; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ziiq3UhvtJ6MupRnu2iXbvKb4C8ssOZnnAFtArF91s=;
        b=VBKAu9l75y2fmGgL7rPeS2vdPuqVfuWR5lU/VyT+IgNLHu4LFBAHKWgxdlhq2HJzkD
         4OML1Ky6RMJT09cUSul4f/IsDgvJuyibC3XyCrM0GOtP53q7y171qrFsj6x4xywFK/e9
         xNZZ4SF2JZ9Fg/Y4wUnSeaIQqLSABuTQGlvSDoei+rlJefU3W8uoRktomimRSpD1yJuP
         V0fxISMmdV3+gW55NfG4JSGf9mmXKELxZBs8hSf1Wi/FWBSbcBgm8dm4S8TZ1C0XjqJ5
         dAipBgxtU4em/fM3DPsUunJjh8gRi3PVH36HXLa4CffoV7TzYic/Foc039pQpbmnxFSf
         W/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742645490; x=1743250290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ziiq3UhvtJ6MupRnu2iXbvKb4C8ssOZnnAFtArF91s=;
        b=OD1ecZ21Y3MeKuQQmEBGQvSNrvLuPl2WiTzCkWZ06QdEfZ1iLJCVy3w1j+FavpHER4
         2b/uhXj+81YBZitLnTfJXSXpJupQDDCqJHGDtkyFK0BYGOo03OcVRgxUWtEO8hMwVa+N
         H2fzTCcy4MkPm6dAlCC5+EPeTvhnF94xi2h+n0N6Jc+ZuQ38XbIvHkSh6adkNAI/st7w
         YLSkXTsj7BZVo3B5RG6nNTtmLJ9f+u15r8NgqZmlt2V/DMatEOLJl+a8V6wuXx/HBb8I
         q38sQGBwbGc7OIbuT5JftLabekZQcI1fN4PyNRLxww2LxpAw1vgBqNRgR6D+CMmP7CBK
         QJrg==
X-Forwarded-Encrypted: i=1; AJvYcCUyW+qEOhRoxWz35J10xqxOSpCo/6+ZMs/J0gxUL3iSgnAFHE0R2a4F2pB4tnvGlSjhMnE3u0LRjKbsUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzElP0DYO5W+4Ko1396iq8hTAlTmQTQuk1Mlf2BXo2JEl92WQPt
	eeDWsYOXzPV2lnqmfASjoT0BP+6QPmQK0RBV+wI/4CI0OinXCmahwgmZulMTyXk=
X-Gm-Gg: ASbGncviz7JM92oDoqhmYHXaMKI9ymtPG/UOAT1+SWVA1JEtzjSgy100wGWYfo50YaT
	/W449BCjO64+vIgOj0fsuqgO0jR0RL3sTzGgJaDD1a276ZtTxULGaK2XhDTQQ+V3rmi65gzFQvO
	VtzVx0c3JSdPIfGg872bXCOfyHTsKAb+6q0O03e1zvXZs++9ahIuoPLH/vOf/rVxQuOoyiZTHLs
	+MhlDBDrfuMFtfHTU8G3OtYEME/O5c4ehjbEuU8OgnYjrHYiiJj6lziTZYAQqaW88CT1F6HGA5I
	/eqdcbWinXjo6EvTaoqHLL6D7wwQMoWXurjy1yy3ZxVrlxdvnSaEX/RrAm0ozedL4gnhcIN+tg=
	=
X-Google-Smtp-Source: AGHT+IGsHzS2CnUx6O6IJsZhddczC84GZPnNGQQkPB8/ybhQKGV2Kfjw2uDFE9TfCJR/LH0wxQtdTA==
X-Received: by 2002:a05:600c:35ca:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43d50873bedmr68826135e9.0.1742645490542;
        Sat, 22 Mar 2025 05:11:30 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f32fb3sm106377745e9.2.2025.03.22.05.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 05:11:29 -0700 (PDT)
Date: Sat, 22 Mar 2025 13:11:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 03/18] riscv: sbi: add FWFT extension interface
Message-ID: <20250322-a87faa18fe5b54b7cb61b353@orel>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317170625.1142870-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_051132_216545_1D3C2F88 
X-CRM114-Status: GOOD (  22.09  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 17, 2025 at 06:06:09PM +0100, Cl=E9ment L=E9ger wrote:
> This SBI extensions enables supervisor mode to control feature that are
> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> DTE, etc). Add an interface to set local features for a specific cpu
> mask as well as for the online cpu mask.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 20 +++++++++++
>  arch/riscv/kernel/sbi.c      | 69 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index d11d22717b49..1cecfa82c2e5 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -503,6 +503,26 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask=
 *cpu_mask,
>  				unsigned long asid);
>  long sbi_probe_extension(int ext);
>  =

> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
> +			       unsigned long value, unsigned long flags);
> +/**
> + * sbi_fwft_local_set() - Set a feature on all online cpus
> + * @feature: The feature to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> + static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
> +				      unsigned long flags)
> + {
> +	 return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value,
> +					   flags);

Let flags stick out. We have 100 chars.

> + }
> +
> +int sbi_fwft_get(u32 feature, unsigned long *value);
> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
> +
>  /* Check if current SBI specification version is 0.1 or not */
>  static inline int sbi_spec_is_0_1(void)
>  {
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 1989b8cade1b..d41a5642be24 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -299,6 +299,75 @@ static int __sbi_rfence_v02(int fid, const struct cp=
umask *cpu_mask,
>  	return 0;
>  }
>  =

> +/**
> + * sbi_fwft_get() - Get a feature for the local hart
> + * @feature: The feature ID to be set
> + * @value: Will contain the feature value on success
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +int sbi_fwft_get(u32 feature, unsigned long *value)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +/**
> + * sbi_fwft_set() - Set a feature on the local hart
> + * @feature: The feature ID to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +struct fwft_set_req {
> +	u32 feature;
> +	unsigned long value;
> +	unsigned long flags;
> +	atomic_t error;
> +};
> +
> +static void cpu_sbi_fwft_set(void *arg)
> +{
> +	struct fwft_set_req *req =3D arg;
> +	int ret;
> +
> +	ret =3D sbi_fwft_set(req->feature, req->value, req->flags);
> +	if (ret)
> +		atomic_set(&req->error, ret);
> +}
> +
> +/**
> + * sbi_fwft_local_set() - Set a feature for the specified cpumask

sbi_fwft_local_set_cpumask

> + * @mask: CPU mask of cpus that need the feature to be set
> + * @feature: The feature ID to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
> +			       unsigned long value, unsigned long flags)
> +{
> +	struct fwft_set_req req =3D {
> +		.feature =3D feature,
> +		.value =3D value,
> +		.flags =3D flags,
> +		.error =3D ATOMIC_INIT(0),
> +	};
> +
> +	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
> +		return -EINVAL;
> +
> +	on_each_cpu_mask(mask, cpu_sbi_fwft_set, &req, 1);
> +
> +	return atomic_read(&req.error);
> +}
> +
>  /**
>   * sbi_set_timer() - Program the timer for next timer event.
>   * @stime_value: The value after which next timer event should fire.
> -- =

> 2.47.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
