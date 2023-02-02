Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256A3C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDjRec3IePFJ0x+IbXWLX9NJIOlSSQHVuvMv8sQNspA=; b=hLpt4e4JCInJPQ
	sc8KBV0lfpBTFd/l9/M5OerqL9Is/ss10YDvPSO8y3kDCPeuLByZXAaxiQZ6tBps11qgQ7ZwRIl54
	i3Wt7l9kRQXUoqfxcD5ivSDeicc27Y2UXtYJtlmWhhj0zya4nz5nPZxrHq/F1Gp7+9/Z+9xOn5JVF
	ioAjCmiw9fCaH5zJGH0J3oTyfDHSOCRVPrj5o+Y/7kn34bjRjFrBlhYSNGpGbAISIWY2qNVxLDcIV
	XdiqiRDpIwziOnd+71srZOd59QQLfxjgaSEBPAfUPfRUcT4r6g9VVqac0mnJMHF76IGuRF8/6OA8Q
	R52s9/R0gl5++EYBZcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdQ7-00GnTd-FI; Thu, 02 Feb 2023 17:30:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdQ5-00GnSC-JR
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 17:30:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id n13so1994461wmr.4
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 09:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJsqO9ccDg3aYN+Xes+xxvWd7JmlQmKL6WOcJpU3hP0=;
        b=j7OZ4lA5kyRDqd/Ve9ZS5mhmccpKED8txw9QQIbn2dkpo5EHkEpAtYDMZoZxuHc4l1
         CqAr4TJEFP3zC/zjUFQHOCUCVwcM08i+1/rqed1uuIR1OWVRXZbwGAN0loj+0wNV5b64
         TcpvC3jeLTvv89Z8rT554aRhfDmfGFJzCkOH6RbAwrCTI6aLjVKKFIfCZNcCsFC6y5Vm
         2ye87VjA7LvMWGSbYOo7nx18qj2Lw2qJYVLKhMTl4Dj/GKX8cINsXzL5w5Tv+ck3cr3D
         OWdSV357F8BTC6MBd7T9NTx0TKLVG5kFKFXVVpZvY9GDwlzPH/2EaEwHvTOGY79cX0g4
         F4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJsqO9ccDg3aYN+Xes+xxvWd7JmlQmKL6WOcJpU3hP0=;
        b=K7PCa8R/45flWPjUg4ROye13gf0Dj07bJ4XExc6C/QYwJ/WEuoXL89fCjlsABgNXVQ
         ZHgy3eJ1EREMvdCh0xlHEgVP5pOLckwBTUkEH1Fy5tSHUaB6IBpdJ/3y9C4bT7uOKuJk
         //R8bIPduYBhq/DyptG9aJ9XqATmgXfWpeUZ5HqRw5DaypeV5EwBVb4GnTIYs8wuaLzi
         d59fDV3UT/SlC/W1MtQj5xF85TSs6JmikgTZ9zc8tHuyzpOaP0WdNOGh6js8FwMV4O6T
         5zOn5eTjZBcmz5m8Tvy8kZUOaxCrNVCK7LFY86vmE4a0v56qA6fiYQ6t3ff6XyrExwNN
         uAMg==
X-Gm-Message-State: AO0yUKVdLtDgAdxcFXS8v0aOISTLf5KhZfupdqdQRC28ZJt7J+OiCKSH
	tyjLWwHYts3EQ16UHiLyFXTKWQ==
X-Google-Smtp-Source: AK7set9osSFbUU6g5UAhijUC/OgzTgoLxZ2rnbSppOUaU/Z9jpz1s5SRnhCKmJL7Zv6kjIfTcVbzoA==
X-Received: by 2002:a05:600c:1987:b0:3dd:1b5d:9b18 with SMTP id t7-20020a05600c198700b003dd1b5d9b18mr6479641wmq.29.1675359041941;
        Thu, 02 Feb 2023 09:30:41 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c4f0800b003dec22de1b1sm477996wmq.10.2023.02.02.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 09:30:41 -0800 (PST)
Date: Thu, 2 Feb 2023 18:30:40 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 09/14] RISC-V: KVM: Make PMU functionality depend on
 Sscofpmf
Message-ID: <20230202173040.e4rdrkdeuq7vdauk@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-10-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201231250.3806412-10-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_093045_666033_ACF4D2C4 
X-CRM114-Status: GOOD (  18.68  )
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

On Wed, Feb 01, 2023 at 03:12:45PM -0800, Atish Patra wrote:
> The privilege mode filtering feature must be available in the host so
> that the host can inhibit the counters while the execution is in HS mode.
> Otherwise, the guests may have access to critical guest information.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 2dad37f..9a531fe 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -79,6 +79,14 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>  	struct kvm_pmc *pmc;
>  
> +	/*
> +	 * PMU functionality should be only available to guests if privilege mode
> +	 * filtering is available in the host. Otherwise, guest will always count
> +	 * events while the execution is in hypervisor mode.
> +	 */
> +	if (!riscv_isa_extension_available(NULL, SSCOFPMF))
> +		return;
> +
>  	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
>  	if (ret < 0 || !hpm_width || !num_hw_ctrs)
>  		return;
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
