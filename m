Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC294CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxqHvTeOgkDDN26zcV6mBku3M6tVavgWlb/Epo+z+yg=; b=m9cbH48aGUm7eq
	QgonVL5BevBAV4jCh2/eGXB/djfoiBR6QlC8Y0WUMQv/qCdH4XKPMyXi9encyALgKClXTx74AdqSi
	d9Ngk1JXLdDNKLgC4vWTTz4BHnH20pGG0aJubbEJ3D7Gg7bYaDvRH/ZlkMJ8QMcwvgURXGZYH+b7W
	jyncvgD52EGIqrqt9Z3DHp6VM5cwuh/HgA8rU1LlLZdsAyVJexyb0a5z4rwEaooj9eeeuVBTsIF+K
	XlT5hrGs2pa3t5PjWrV/I/tbWveOurvWGYWmLzphoKY61vyi3B2PGzm1dcoXkCmWVBKJZwc92xzKp
	VhM4fk8uij4OO+a1njGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLix-00000002TV5-01GI;
	Thu, 04 Apr 2024 11:57:43 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLiu-00000002TUC-1Vh2
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:57:41 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a5193f56986so33990266b.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712231857; x=1712836657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wWw71C7jU1cEwI+5ODGcknLMAR0yYHVr8hihh6Lqglg=;
        b=EtfU4c9xkisAmJ5HfsdrebX+RUV4o5rbxrnJ7zDAuh4v6kNX5F5eZ/v9cauxM8lpmv
         6H0D58fSnKsY9F7ryNzDGc/kbkfM25eo7xtSpvvJHbCU6emjqK7yIGDhNQvtE3QvAmOn
         srH3CiR7m44SD2XhOCM3oiT/PmGilz58x9u4EdR/U3Cnr7LHIoiJsRoP3HhO6WT461pt
         yWjdWBN8foZ8NPEvvgTW6faCA8LNeGIWcXvE7D66RBQq0Q8Ad3NfppKvlfBFXyckgJBy
         GdWlpgcvE4MhhUeE5Z/DLmD0reX2lGvbdNp/uoy7YVy8gQ1zuau0hCc0ZN2u5vbPMdgn
         GHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231857; x=1712836657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWw71C7jU1cEwI+5ODGcknLMAR0yYHVr8hihh6Lqglg=;
        b=r9IiT0MlgOwiD0tab5OfHfeMO3T6atF5UJW7gHZzVzdY4IR9/d+R2xseD7I1hohqRM
         nHXHEM/K3z8rN/cN+quUMV+GTXAdf96f2xJwLq1ISarf0F4xISGdGE3gZpp8Ph+d4Gxk
         k7JZ52y5xv98FWMytpra4liTZB10gnBfo5Oba66FX7F4MV1uMAz9qTA8QwtiuqoEzFUk
         Sj+te4xuobljGRuom+8B3fqXsErIRnsZN7J1tA/Ps0FCJrjvjxdwHO6fdSGs6u7KVaL0
         Z2oVsqulBmPqoeX9PhQ6AC97dNpaMG1yLEh7nAID4wXb6cKErNU3pLRwZQEE8J71LX5t
         O5JA==
X-Forwarded-Encrypted: i=1; AJvYcCVTqc8++e8E8Lxybvpe1PXYwywpEOe/oqWyjz8hKd+XstPjuI9jE4FAp+XPawU6txtHEr8W/NPeVmUjDtApAMkbHPjs4rFHKDjvoTV9U9iY
X-Gm-Message-State: AOJu0YxnNf0BAig3DEFWlvTgi+bWaormqwPWdLErLtAg23xzWYdbx6VF
	7rrDFEHa9Y97BfG2ymTaWfuAk2ZpVxEqKEHNY0jvMXQ1ttFEKjdjHwVCDLjQufM=
X-Google-Smtp-Source: AGHT+IF8SdqZ3HyZZ91FGKimTKayOc7UTusAbOGT6GeUZ2TkAX0/2dzA77WUR8ICDxbEhjc/oE44yQ==
X-Received: by 2002:a17:907:c0d:b0:a50:f172:6994 with SMTP id ga13-20020a1709070c0d00b00a50f1726994mr1816047ejc.73.1712231857594;
        Thu, 04 Apr 2024 04:57:37 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g15-20020a170906538f00b00a4e98679e7dsm2355698ejo.87.2024.04.04.04.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:57:37 -0700 (PDT)
Date: Thu, 4 Apr 2024 13:57:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 08/22] RISC-V: KVM: Fix the initial sample period value
Message-ID: <20240404-1c3dc9b63f80fc451d3a732a@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-9-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-9-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_045740_430765_5766E1EE 
X-CRM114-Status: GOOD (  16.38  )
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

On Wed, Apr 03, 2024 at 01:04:37AM -0700, Atish Patra wrote:
> The initial sample period value when counter value is not assigned
> should be set to maximum value supported by the counter width.
> Otherwise, it may result in spurious interrupts.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 86391a5061dd..cee1b9ca4ec4 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -39,7 +39,7 @@ static u64 kvm_pmu_get_sample_period(struct kvm_pmc *pmc)
>  	u64 sample_period;
>  
>  	if (!pmc->counter_val)
> -		sample_period = counter_val_mask + 1;
> +		sample_period = counter_val_mask;
>  	else
>  		sample_period = (-pmc->counter_val) & counter_val_mask;
>  
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
