Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BBCC28B2E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWNwVYjn1+JrCFskQnoojnEo6YjFGgML+DSzXtBeIb4=; b=At1qbOz2jjPwVV
	3E5JGUVBrkuPnJWnFSBZqZ/pCUNReeU8ISLWRFU/LsTNnhmdD/pzeY3tqk2Le/MLjkeFFrFqq8Y0g
	kmBN3tnLuQfSR1TExspV9p2mJSFxB+lGrbBCv9MCF7QL0JVfY74KsODwNs+0FIL/W+LsdubnjkW3i
	C0MLZz589vgvmVASPAzEVhzwULckO3GD2P7TnXrJNzormU67wSNdAzRzJI+3V2MO+1Johp07h9zX7
	6CU4cxlDXTDwbpqBrNwLLOV3nRiBzOHsEb7ur/gYNxmCdml/NmQvSs6wBQdkfTPAlDzCe3TcGFHM+
	xBSyt4ziOz9KSKHZwPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsi84-0000000BIwQ-20Is;
	Thu, 13 Mar 2025 12:57:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsi7z-0000000BIv8-3KN2
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 12:57:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-394780e98easo611005f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741870654; x=1742475454; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oU2CWGwDlIJhGLUqCxoni4cHhWUsK2iDFsgYYpF/oTQ=;
        b=CnG0HB36bE2FGGiBdzn0H+DiohO0cwaNzmdsKiRJkXn7wjHIq0bXnODdwJe/Tv3NH2
         n2r70QdUsoMux9Sb0+FlNb7Y7QZl5f6CmxSiUbI9dh+IRdz+0GyD5YmHOFJ6SyfG+pcP
         YMhIK6VEPR0nLvpKlCYqjXdFADLY7SaPM3uywKfBA4SGG93J/zHNEYMnavSMVgzmT6P6
         QyCXfowmsUjMLVXqPpekQO+CcCR4WuzTHwpTVSRR3ageR0ixdzwUgiBj5KwwbhG5ps8z
         9m8xQZoZ0cwqtSZagU3pRdYx0RihsRwJpnwIaknXTKfsoF1XEY2e1L+YyACz2WwpABxo
         7Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741870654; x=1742475454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oU2CWGwDlIJhGLUqCxoni4cHhWUsK2iDFsgYYpF/oTQ=;
        b=NRmCGyvYCOeArf4xvVk5/MqaocRNBoClBFdlp1hNfc2ouzm/xBuu82KXWtu8To7i4G
         cxTFDK/mOajCpSNndMRlIDfZWWZRt6yjB25OpCpou+D8ZUZzf9HTu7RnFVPLVVboeqRh
         0Qf8+/IDiwyGeADFKCqiaTvq7jQCdnzUnxfZQgOW8RpB3AHQ2DBQZ0pt737WPQcYorKe
         xoBCqLLfPi9NDDTry56RL6kL5WnPBZGXIWzKrriJ10vcy6wuJXyYcwuffw4wL2wlHxay
         LsrkkutRL/UaAnPO46YnXvK5SW2+PV+opgGVMUG1INbO0dvyBz4zkBtzdWWqadQVVpHL
         6wzA==
X-Forwarded-Encrypted: i=1; AJvYcCWhYCzXqpvK1/w4Ji4GzJrFSQ0ZcrEnt7yJTYrlCUp6h+/B2nUTFWAcQmsaU5CBmMYdwFcI7hcuE4SfIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDVwMtoEcd+qD/JD6IWYFtOatTqFjlIrVEJZ4L1g9yalQSDYM+
	hVANLAB43d50ERHPFujbO6RZviYH2cJx9LGtttc5x4m5k+3vOxkrtTysObhlNE8=
X-Gm-Gg: ASbGncvKG58f73PNcNfDMTYjk5qca1aoGSXj6l5wT0YI3JkwDm8ygxc6RECowHz3nsO
	X72Md4bySSc3KNm/k3Mn+6rLXl4fGX+NAHvAqstqxe1nsqDj1s1pAy4krzsEpnDgWf10Dal4Sud
	Rg1U7QMcpzTX0XctrEkPNae9TgX4kOl1vNRMK3HPMJ05WATOgr5YEP3b0md96SQ+MN1f/15oH6U
	jfLgUht6pLsaXOwsJvAgkgRL47LvL7c37Q+zeAKViNtd1cAqy1Bs1whJfNjsQBLCU/td0mKU3r3
	Kd2gl3lGfIbz7DO5aSDAOKtbHMIedjOm
X-Google-Smtp-Source: AGHT+IGM1DblGtxykFocIp33D2K47p5ADdU4DE4GFvOo3U3iDj70FwK79o4wmAKz0GgKu55I89czxg==
X-Received: by 2002:a5d:64ac:0:b0:390:e889:d1cf with SMTP id ffacd0b85a97d-39132dc561cmr20667619f8f.37.1741870654174;
        Thu, 13 Mar 2025 05:57:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm2044096f8f.25.2025.03.13.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:57:33 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:57:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 05/17] riscv: misaligned: use on_each_cpu() for scalar
 misaligned access probing
Message-ID: <20250313-311b94f9bafe73bcd41158a1@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_055735_833686_2054809F 
X-CRM114-Status: GOOD (  19.34  )
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

On Mon, Mar 10, 2025 at 04:12:12PM +0100, Cl=E9ment L=E9ger wrote:
> schedule_on_each_cpu() was used without any good reason while documented
> as very slow. This call was in the boot path, so better use
> on_each_cpu() for scalar misaligned checking. Vector misaligned check
> still needs to use schedule_on_each_cpu() since it requires irqs to be
> enabled but that's less of a problem since this code is ran in a kthread.
> Add a comment to explicit that.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 90ac74191357..ffac424faa88 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -616,6 +616,11 @@ bool check_vector_unaligned_access_emulated_all_cpus=
(void)
>  		return false;
>  	}
>  =

> +	/*
> +	 * While being documented as very slow, schedule_on_each_cpu() is used
> +	 * since kernel_vector_begin() that is called inside the vector code
> +	 * expects irqs to be enabled or it will panic().

which expects

> +	 */
>  	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
>  =

>  	for_each_online_cpu(cpu)
> @@ -636,7 +641,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(=
void)
>  =

>  static bool unaligned_ctl __read_mostly;
>  =

> -static void check_unaligned_access_emulated(struct work_struct *work __a=
lways_unused)
> +static void check_unaligned_access_emulated(void *arg __always_unused)
>  {
>  	int cpu =3D smp_processor_id();
>  	long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
> @@ -677,7 +682,7 @@ bool check_unaligned_access_emulated_all_cpus(void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> -	schedule_on_each_cpu(check_unaligned_access_emulated);
> +	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  =

>  	for_each_online_cpu(cpu)
>  		if (per_cpu(misaligned_access_speed, cpu)
> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
