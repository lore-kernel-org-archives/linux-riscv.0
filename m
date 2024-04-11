Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F4ACD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CH+rPmOtmnXgQBnul+wLl9IrVtyKRso0Lku8KhBB8qM=; b=dFVdm/06idJC7t
	Y8ivw9hAQhWqVacJIjQuPKr1C7iMQS+nVr2/N2X71WROD0yGqNqpgP1mW1FAO7tMrqucgJ9EwtCGI
	cuwd8cSdUb4vCPFmbu6GHGr7BYsvPxSEkKOYFJlcAUsiGY2DdqzAkv3CB88xZ+WOwgyvIw6e6taB0
	rJIhuhmpJunLSRtDrfgHG7dPW1qSM5YZK+paD3DK1a5XA+qObcRSHf1q3ku/KMuEQy1icXnwDl74L
	rbGhejRrwX5WaZ/dFQ3C6iFabnmdTi1Od1PYAog/mUSoOEWlwtG+Psz4/6mRp9TaTddRKTXvmx2cY
	EJVOJp1sMAXFo7ZxIQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup7d-0000000Avab-38dn;
	Thu, 11 Apr 2024 07:45:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup7a-0000000AvZv-2thQ
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:45:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a450bedffdfso1034544566b.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712821521; x=1713426321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aH2Dc8j8I8xIvPcUDdCDU7Xxp8EkAEDRyp5XNqYeoic=;
        b=L9kLnuzDMREEEg8svt6llIjfSqhbvlcxZzzpEItHiBHHmQ60hDRRbTfNf7Qedsu7xS
         nPf6wIqSWIkc56tSWDRAuAq2VrS0psB6T90vMgRqNWf4KZUx3o2KIf4HY86kRn7ByMbx
         nzR4mo9pwmM3SV0z1qh5DyjQYu7CV1xg1ko9VYGCIqgss8FLQA8Gvsq/aAlBCC0bCPjM
         TLHNNW7K7UqdzueCDBvzWcUCgK8sKNhP1CqbGSV3o4h5Ako8KybMq4mJeJzt+GX/ZycV
         GkvdgNHkFUZM276hIwv1z452kytkz1bnDOY9bF3Mh01iiSRYPZELvTmG9r094YibsOVY
         b6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712821521; x=1713426321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH2Dc8j8I8xIvPcUDdCDU7Xxp8EkAEDRyp5XNqYeoic=;
        b=pP1tevCgXT2O96z6flFRTmmhEhoV9R1nqkGV13KUfHIhfM5YYTyJs5TVotgSOmJeFH
         V/E+LZMz/EukuNyrJFQdgWYnJ7vPBJI7GpGwFOYw2E5SKky7CGfzZ8hpfNVEmrEKiP+T
         Yo1IQpjjSdxGp/jkqxRKGLwM017JaJoyW+qyyiSsHUZ0HuRgNtZ5KIURhwIxRJ/56cDH
         j9I61OUAGQv55vWTfdApdGg2aOKiUp74XOl2q/FpSdamuSMd2OvDGTIdX4PznuTz6RKh
         Y7fwABL5m+5vGVE2SaIQ3+PQmBGvIcN+2/Q/cAVeFXNHfFfOaVgELyRngygRKmUv/Gwn
         bXlw==
X-Forwarded-Encrypted: i=1; AJvYcCX/gY5xxB+O6RGqJgLByuH2YybeJhj/jEDrWOMZ+AEGKTjbppzIaM8EdKUpA4Z28rKGRdLeHqeQ311G81gZdtQRN9vlnlvSxuTGt5XCZzSV
X-Gm-Message-State: AOJu0YyXxQ1wYZihkPArdyKHS9gdKxeo9XX8AMgTKAafEW8GDkYYLYcq
	YbZfUevMW498ScXXV2OsdtK+dLL3fKmdmpZYe06TSwvBXxD7WdXQXHrvzPUaprY=
X-Google-Smtp-Source: AGHT+IGXjQgcemnZ/eu1Pazqcv6W8xDCpaPihHKrZ7vRNQjLlX8nqWL204fGLinJDjejI9EZkPgjUg==
X-Received: by 2002:a17:907:7f87:b0:a4e:6b81:49db with SMTP id qk7-20020a1709077f8700b00a4e6b8149dbmr3626235ejc.8.1712821520961;
        Thu, 11 Apr 2024 00:45:20 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f25-20020a170906561900b00a5223233b4asm278978ejq.117.2024.04.11.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 00:45:20 -0700 (PDT)
Date: Thu, 11 Apr 2024 09:45:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <amakhalov@vmware.com>, Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 06/22] drivers/perf: riscv: Implement SBI PMU snapshot
 function
Message-ID: <20240411-688dc97b08bb3b63511dcf6e@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-7-atishp@rivosinc.com>
 <20240404-4303d1805800fad18b6d9768@orel>
 <170cc87a-5b55-45be-a0de-213aabd852dc@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170cc87a-5b55-45be-a0de-213aabd852dc@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_004522_757253_06A75BD4 
X-CRM114-Status: GOOD (  22.37  )
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

On Wed, Apr 10, 2024 at 03:29:21PM -0700, Atish Patra wrote:
> On 4/4/24 04:52, Andrew Jones wrote:
> > On Wed, Apr 03, 2024 at 01:04:35AM -0700, Atish Patra wrote:
...
> > > +static int pmu_sbi_snapshot_disable(void)
> > > +{
> > > +	struct sbiret ret;
> > > +
> > > +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
> > > +			-1, 0, 0, 0, 0);
> > > +	if (ret.error) {
> > > +		pr_warn("failed to disable snapshot shared memory\n");
> > > +		return sbi_err_map_linux_errno(ret.error);
> > > +	}
> > 
> > Also need to set snapshot_set_done to false, but I'm not yet convinced
> 
> Done.
> 
> > that we need snapshot_set_done, especially if we don't allow
> > snapshot_addr_phys to be zero, since zero can then mean set-not-done,
> > but ~0UL is probably a better invalid physical address choice than zero.
> > 
> 
> Agreed. But I don't see any benefit either way. snapshot_set_done is just
> more explicit way of doing the same thing without interpreting what zero
> means.
> 
> If you think there is a benefit or you feel storngly about it, I can change
> it you suggested approach.
>

I don't have a strong opinion on it. I'm just reluctant to add redundant
state, not only because it increases size, but also because we have to
keep track of it, like in the example above, where we needed to remember
to reset the extra state to false.

Of course, giving invalid addresses additional meanings also comes with
its own code maintenance trade-offs, so either way...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
