Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7329C19F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnmGD9zA+w9V3uehG5UD7OVA0eM6bKdCGT/8R4O3l8g=; b=RtIEvcHypL+iD+
	ns5fvZ8lO0FcIPtLdUDieqzNBy8yc0umXbYtiDOoZja3+mB44jqIV43reaDi496qPXfPMk5TlS+Me
	XfPSI2+wrVUtUQzd9C+ZiOCXgc0AEwdsXuVCYZ+HArQHJh1jGv1wtgc8nSp1J66WDH8/F1u6/5COz
	IotT8ddFJiiEEzwvBh1KRcfD6vWQZuYSKeSLpKWINcVob5nuhC7rKClgVuEPdXb6JQzJ6je8YCUn5
	LX1R5UXbh7DXDEJfnnnqQEJMOj5f/NdMi1iMi/o6JF9ZoAxxylxp3UrLuysciF+Mf6/rJwGOQrXQk
	ZAfrT5u9ZWxfa+oe6HrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZaP-00000006lT1-1apN;
	Thu, 27 Feb 2025 08:49:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZaM-00000006lRf-1HUA
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 08:49:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso4310155e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740646176; x=1741250976; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xwt/QS7TwZTYg2MTdoUft0EF5h6WRYVihzhqZrEMa0=;
        b=Y5FsVQeueZDu3gEiFQHGu7Bv+/DCXsvk0BQk4M9+lZvAYTdPyDD5f+H4fJFT+D9VoQ
         KA0gDlg1JjPwU5HyCJ9q3yWP7cTc1KhjmZ1Gz4WSnbHkP5/UlxkXXlXAMesOlU8J70Jl
         TFWT4vRpQ5NNYSDFZ20rsmNxz/Id+B0SCQtKZuNVB9A5jMxs06pfxL8Rd1lX9+lv16T1
         mzJhZBYFKWtYLNEixh0gdmNpcTZSLZpf72mI6Ru4GJKK1R0BGZKHiVTw/tki4Yb0RVwm
         NYd57bmqNbnHk29e9OxUNn4Yeb3AzQkV/VhNFQvgD0GyQuZ1LiNuKVJ65ea54zpvpFbM
         qZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646176; x=1741250976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xwt/QS7TwZTYg2MTdoUft0EF5h6WRYVihzhqZrEMa0=;
        b=Fb0EhUj7VkgbnOGFQ4ue4wL88EYtl7jzlEz9hXvRsXM/0nkB32Y7LvylZ+UMwDFzAz
         rPV0+ifvZ6Fhb0sSvlMXNbUzLKjn6GFw89fgZ5XW7yCOOPzP5rvGm04vFR14/1tkGqQs
         ksyXHielYNMeq5rQPKtNT0vBH0o4CfDwmWIfb6AFnRQA6+Q/9SkUD8m/DVH7/1F+GbPV
         381alI4mRAhzg1dy9edwcwXcQ8XuGJVMmrWhD+ayzrzoFh253KDXoypIfUqVHQX0Pey7
         0p8CvQGqm3lAGQRSPGUvU6/eYzpcHtf3jxGD9Ep3+akUBqjfJkTVcNGoa/KHpwBqaZRF
         iecw==
X-Forwarded-Encrypted: i=1; AJvYcCWHbjdjevJF4QYJvZ0873JWBiq4H2dcLKZ1oJTr2VNI+D9OVilqtsG/2Dkfrl/1BmXYjLuJrkintKjcQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYV28ywFaKTIr6sSooMyvlv+/moXdBVxoAo2VLZZguefbIY0CN
	y2uOi2LFWJV78giq66+IuePIbl9zdZnZjnC53GD7C/W4y3UsWTKtMcXy+UIlZz8=
X-Gm-Gg: ASbGnct4JRiMYef41+sXo+bwyk/WBnjsEx20meaUlM2Ed9//wFeCh+Aa3ZOV7Ki7bvJ
	B8TI6SFrKJTkxVWsTAzBp518eZ6qGDa5Y8/xzHu25+s5yHwDIV1voqA0Iy/MjKsEiaglNav2u2G
	K+D6Ebl6gNiQc9EEnSg8qd6hvu9vyyMLv4MygRal7k9mJ/v/CExuagRTej7YwNQTXiWJ7LcoPhZ
	h6ZnmAMmaNUsaVdIVu3Kzawoj0xDxZnTe3Z87hgtmf4dhYMdty2Y9FnDKMIHkBXrghBbZKJRQTg
	xeVY9yPV2QbQbg==
X-Google-Smtp-Source: AGHT+IGsBt36A+nA64K8jmDgdrsH+3epzXLzR2VIcO1N8jO+7h2K8GwaLjrguW+gS8ljkw0FbuPM+w==
X-Received: by 2002:a05:600c:4f47:b0:439:8bb3:cf8e with SMTP id 5b1f17b1804b1-439aebc369dmr183762555e9.20.1740646176499;
        Thu, 27 Feb 2025 00:49:36 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::8cf0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7c43sm1308781f8f.49.2025.02.27.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:49:36 -0800 (PST)
Date: Thu, 27 Feb 2025 09:49:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/4] RISC-V: KVM: Disable the kernel perf counter during
 configure
Message-ID: <20250227-d64f688ee1df2811528ec2b9@orel>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
 <20250226-kvm_pmu_improve-v1-1-74c058c2bf6d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226-kvm_pmu_improve-v1-1-74c058c2bf6d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_004938_347813_E5C7F8BD 
X-CRM114-Status: GOOD (  17.76  )
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

On Wed, Feb 26, 2025 at 12:25:03PM -0800, Atish Patra wrote:
> The perf event should be marked disabled during the creation as
> it is not ready to be scheduled until there is SBI PMU start call
> or config matching is called with auto start. Otherwise, event add/start
> gets called during perf_event_create_kernel_counter function.
> It will be enabled and scheduled to run via perf_event_enable during
> either the above mentioned scenario.
> 
> Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 2707a51b082c..78ac3216a54d 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -666,6 +666,7 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  		.type = etype,
>  		.size = sizeof(struct perf_event_attr),
>  		.pinned = true,
> +		.disabled = true,
>  		/*
>  		 * It should never reach here if the platform doesn't support the sscofpmf
>  		 * extension as mode filtering won't work without it.
> 
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
