Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E8CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znmotS4O7bomtrcNdw1o4RInVd0CcYTpSulh7pTXcYI=; b=1bHiys15DPvd0I
	suPxIjhekfx0sD74lxbevEmpzHuXbg+dUukSUnqpAb0Kht2+v71gPrVKt11O8zYBS+7UfGUh5nJBH
	RcOccL5XQhJ/82ew2MsiO6NbDbW1EGvQeg7QGCmmi1sF4hpT+JqHu78xhM262d2RPuE8Ka4j07h0C
	nKp1haoCOCTe2B/BCoNcCBP1/+iV1xBcGdfvGYhAAERRblBpaEfvytniiorDXq7UIf8l6wtqze7UP
	JDkUec/uC5HUP3CgS7kQa3tTpHpuSzJr1iuomLDTggBVrygQyhu2cHxCrtTstivmGHcutbdnAVfSa
	PZkRCevnX0z6syvnAtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKmt-00000002HFr-3EOv;
	Thu, 04 Apr 2024 10:57:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKmo-00000002HDi-2wRR
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 10:57:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-343b92e54f5so401944f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712228256; x=1712833056; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NfiVdFmLV4FF6ye93fatZUexM6Nb9SSia8q2nnOXyFw=;
        b=bMhWgChTLwjxzAMYaFtT37VUit6FY/NPBzsF/8RSCm0mH+sq2DnROPfxisK+Lld7XX
         YD8Igpf3TyxhguY+gRdcD9OCg35CZbTydfA5XIuG4fbKQD5FQ26ZYO5W2KiDz3ayLNaq
         gM4WCQmxF+IvezMURwh3n4OzJ2iEPn4nS3lHINFv2aXzpVUYlbVUCVPlXEEPJQQm7cfR
         oxRDRZmhvB8sEoyrqNVbEnuy7uz+t5/qSJ93MH/k4enCsD5xqZ5Jd3csLB0H+WXCDDXE
         qVhs+61F0ucD8CKbkj6zvUZ1xr04LvZIX6ixSldq98+Dsg47msgTyELCaSQjGvAaRNWs
         Auyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712228256; x=1712833056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NfiVdFmLV4FF6ye93fatZUexM6Nb9SSia8q2nnOXyFw=;
        b=ewHtXviGeW+QwKJNj0Gj6u8RGB4YqkcbZZcw3wLOxvFLA8v6Yjrc42nQ7jjzvUNJhD
         9LzkJAlaK7p+PcbpSnX9tGWIG6GdN5jmxqJ742hCB/0jUVUSJmXjzfMwxjwn2TPT+ske
         7ZJ4zGShxjllsERRzfL7Ge+rKxUEX90eiJoNxvMlObFMpl6y6d1QnLj+zqQbm8VNMxGe
         gruvcQfvRzJTUJXh3mBjUWx4BB6brNZeU6s5DoaTyNJHIqqAwFguG0t56sB0LKp+jA5n
         0DAnr9SRcPdHqN6DNFZBfzk3cSozLcVNUasqsnb65kSFt70BPaffiDVFenoW12o6NXcK
         wEYA==
X-Forwarded-Encrypted: i=1; AJvYcCWb7wcT7NZmq71PMImgr1xdOhpAfg3qNVPBX6YV9IXGWQljoPm4I4VPPpSADAQAM2OECjLqoYKu/kwurlIUhIJIga8rRN7/qJjO2EGln/eO
X-Gm-Message-State: AOJu0YwzBNTmmRhHnxryYnQllf2NhKxSUTnPDrzvBK81PSBrjDqEBQDh
	41xJzd5XCPc4CfYvmpcyEfVJMXmUWMYkOBhQVT9XDO5fIHVL6hBShq9BFfDZFOo=
X-Google-Smtp-Source: AGHT+IEnFxataSYbqmGau+kOJUtlvfE0YzrGrXzfyVqVkslxmfUNW4m89ij6/Ce78ACjrYhuGGGyAQ==
X-Received: by 2002:a5d:51cf:0:b0:343:9fec:eb35 with SMTP id n15-20020a5d51cf000000b003439feceb35mr1526223wrv.24.1712228256052;
        Thu, 04 Apr 2024 03:57:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bo15-20020a056000068f00b003434c6d9916sm11436771wrb.110.2024.04.04.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:57:35 -0700 (PDT)
Date: Thu, 4 Apr 2024 12:57:34 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 02/22] RISC-V: Add FIRMWARE_READ_HI definition
Message-ID: <20240404-6fc14e149cd82bb0ee8f088c@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-3-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-3-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_035738_844996_56B90A9B 
X-CRM114-Status: GOOD (  14.08  )
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

On Wed, Apr 03, 2024 at 01:04:31AM -0700, Atish Patra wrote:
> SBI v2.0 added another function to SBI PMU extension to read
> the upper bits of a counter with width larger than XLEN.
> =

> Add the definition for that function.
> =

> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 6e68f8dff76b..ef8311dafb91 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -131,6 +131,7 @@ enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_COUNTER_START,
>  	SBI_EXT_PMU_COUNTER_STOP,
>  	SBI_EXT_PMU_COUNTER_FW_READ,
> +	SBI_EXT_PMU_COUNTER_FW_READ_HI,
>  };
>  =

>  union sbi_pmu_ctr_info {
> -- =

> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
