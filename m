Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6BFC54F2E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/7b6qSBkZSk7vmye1VQwD3xyy036LNhoH/AqN28cuQ=; b=tgKOaqTwCtBfGH
	zUj4hKvFrjL5FpSeHkO+ILEF92U429POwRADiqlSI7iwKJ5nBBMCSJFS1DF4+k2v739xKt6rxNebj
	fPW3sG4Vk0xQdgiie4c8MY1SqJHNFo8f5WC3g7O42lLTkOEC3N22tY5pU5TQZViLb/JZjaOeBIyG0
	8sdif46s1t7Khmvl/PhUZK7hhwkoqBJgdN6HkQ0oPgs6nGKeRf0IWWex6KQzAvZPqq/GxKZ2PvGsj
	MNXePxKKo4Z5G5qG7N8pITA504Yf597sxKoNBBspMCILaFTKWv214ogMW4dZTNFe9dZJ1mcgs/9Ep
	rpkZG9lug6PisUTENp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISYd-00000003yUJ-11Cq;
	Fri, 23 May 2025 13:35:31 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISUq-00000003xjc-15bG
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 13:31:37 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso2616895e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748007094; x=1748611894; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
        b=aWuxvYiguhPiVqddRe9ITBvF8r4rjy64XUYWh1yWPa+pKQKY99eSWcqPmH+DkM6bp6
         1wD21+cLj//1lQX/BZja0p0otlO+efKw3GfhEM5qvuTykBJanixNzRhXs97+doqV9buN
         rvlVvggYiDbnOrY7I9Xl7saxs8CvPvJkwOsyIgv3R0XZM5MpdUEU8sBpHNUfl4Y609wK
         SW3PFa9NqU6h9iCspWnQi4xQ+5qyr//+A8NuLMuZT0vfXcdR6jCUGNWyoleH/u1UWF1+
         iQORVQDYJkXzKJriJOHlxaDiew/xd+eFjln9kng8+9BpPvnYnFqC5cFtRP2Iw5wvN76o
         9FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007094; x=1748611894;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
        b=Zz1IKpQpNJKJ2tlw4VDA3uEiSMb4eprB+YcL4avghvqTde0hS3c76AOQcir2IFaaol
         ODK/U+qD/7OxeXP5dF43ELjFWBbrEGrVd7ELGw+pgEMEuhVtd6kcigYXBqX7+1yJGA5T
         5Safzl1crV4pRXMsIDJ8Wz0Q2UHsY57hFf7x9eKDXA5csDVMb0u5hK4aAD3yU15Wczsc
         B3wVk16zp0Ck6HA7tw8C0Vzg1f0Clm04Y2cRXe4jVZEZfU8scl26S7PXWdGCGH8NQ5g+
         hIPMcye6Of85NeaFshHyUXk6BwLH8gp1kJtxjSwe/1xFbGUf7IlKL0EfDHFaMaWL9zmm
         uWiw==
X-Gm-Message-State: AOJu0Yy0d6DX+ns+BgJEXCqHusmtspHxZD7uiIt2eeCCrWARAOzEZdBl
	UyPQVDUv9/wn92iA1MT1CoWQLGE5eE0e+75FkmygPuXdPwno/E2YdEyx9ZrqvWZHkjU=
X-Gm-Gg: ASbGncuc0AikGCHlfki++/MoaM7eAXEikpk0f3S3H1svP+GzaXNWV77x1T+WxZZ6gUC
	Mi7dDpzMhsRRbgdnK2aunGPPMcWs7f1V9fI6nlGLgdclUWQWsCreL1N57cG9z+tZgUmw+ZOm9FD
	6Cf5gHkZmzBwHO1iuOmk+nbMbIf/r3mU9vK7MkgaPtm1mJC1BynJC46oAlXySIG8Djn6RyX1Ynt
	dMFhlW8qsjgTQYy4cga99n7UlFSSUGOTW+9+I7kKdChhIt4pv7DPMzDyP6bluQ92AHg5obibl05
	EbYDb72ej+0LkVNn97oiyjnpMK15J55ASvgrQS2mzKpedhX54gZwV2rF0Q0=
X-Google-Smtp-Source: AGHT+IH4B5YjATsLpzFQConVuBPC8YzXe6dS/7DO0gd92eFJugpX4BslSSwZcD/zqo2WMw5EUo7NzA==
X-Received: by 2002:a05:6000:400f:b0:39c:1401:6ede with SMTP id ffacd0b85a97d-3a4c2b3a659mr992493f8f.3.1748007094151;
        Fri, 23 May 2025 06:31:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm27248141f8f.90.2025.05.23.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:31:33 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 15:31:32 +0200
Message-Id: <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_063136_288997_EE9C2FA9 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> Upgrade the SBI version to v3.0 so that corresponding features
> can be enabled in the guest.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> -#define KVM_SBI_VERSION_MAJOR 2
> +#define KVM_SBI_VERSION_MAJOR 3

I think it's time to add versioning to KVM SBI implementation.
Userspace should be able to select the desired SBI version and KVM would
tell the guest that newer features are not supported.

We could somewhat get away with the userspace_sbi patch I posted,
because userspace would at least be in control of the SBI version, but
it would still be incorrect without a KVM enforcement, because a
misbehaving guest could use features that should not be supported.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
