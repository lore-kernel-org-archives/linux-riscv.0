Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADBCD6DDFA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfPNu7A/AYXTRk/CFag9+SfSu9w6gv+AlL1sh5pDWP4=; b=HBPdjL2HQ56ROY
	ZKPXAP6QfIvJ6Tl3tF977YATdeIGS6hg8BF0ydP8K0OT0H3yHKGe32HnZTSDk+NLeUPj12q+b4IXt
	adCgx9QdyEwD3ds7HLiNcG5c9mGF9GOeajCZ1b34umgB1MnKLPNBJU2mUxOv00QH2Tf1gQGW4d2Lo
	aA+vOYcJpSSkJVBbVkHxXy0nc2n3DGHiDrGvzPUJDxb8ltJlxS2GwVKyylhfV9PRfdS2vKeCZvGRD
	wdtg9oy/OlBD2IiY91BV6hmoxyplreORmRXmWB8s8mdHJ6eeIj23yEULdkO6ti32qqnJDWpZLlkkw
	TQR2m4Aab4dnvnPbokeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwJZ-00000002msx-0MtA;
	Fri, 15 Nov 2024 13:24:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwJI-00000002mnk-2mkS
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 13:24:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43158625112so16052215e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 05:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731677066; x=1732281866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JsmYkfI9SAlOdysNsS4+loYZlaU4nZ+pAyan3DcICaY=;
        b=hhWrXZKZgw7HPat5wrJgXEZ4o70D0xpHKDJjpGxBYVjaL+0hpr4HFWs84R402jHrNn
         xJ/0qw7zCUdOMWqeiGSYiVIixU0IaPl4D0pbsB6OfFew6jOqsRslU7WyLrXx+HNus2PN
         Ak2OufHxztxwdsekbg7lhwvNuIzAK5v1moIBlzaP6mRWbnWF16ZKYkVKuCj9zbkpYUAR
         UeaSzd93dHaTtgMnJC5MYhcLf1a3r5+PZGw4FYccQBcGbr9/iRezITU3FN4NMe+712P1
         QcCrDSxq5JonM+hFJNUSqQzyC6rBwfEvAkafw7yfnRwTj4giYH2gbEXyWJeD56gwnfWg
         4lKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731677066; x=1732281866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsmYkfI9SAlOdysNsS4+loYZlaU4nZ+pAyan3DcICaY=;
        b=VbmBwUWkSx+FWg+YNwQA7oeKqt5bd0dLJZ569Kg1O2zM0ZVZoeN7y+SlLZcO0C2nO0
         u+2R/uEFOo2/jlSi2mmIBh7jTU3zGhxFhhcGkVx+2bV+EKhqZ6jlPf9Z5YVDyCw6P7K6
         SmQ0faRELAeNdwbGLQODs/v1lx3yq6gubB+fs19W/+6bdx4CTVPhFg/uD3dS3su9kua3
         6gR+Dmy2cg4y6ZjfHY9QblJa9s3jxSZctQ/Ib8kk3Z2OH8zbmOAIIqh7ikkXpgUe6pFx
         /4waXUZ2LhtVn5G4V7MAeDLkNhAYz5s0zBZn2u7nj5SGdWhrrADPnC1msRvlHKCUQ3lh
         gXzg==
X-Forwarded-Encrypted: i=1; AJvYcCV7VENY4QNuZA1Y0i7aO/Utj77iFVgxvsilI8sf4Qri0mBXMhQwm3y6iKN4pAHAiGGAIZUR705yj2EC5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvmVWpsAFvrVGQCl9nGMxfTBmt8cmYexGoCgnKLCw3Ru25Z5zX
	1lqAL3UJATzCA7GdBAGNOiHKH1wcqG9mh8RnZ0+1M9ZeSBt4XCjXUs0QvFCmIJE=
X-Google-Smtp-Source: AGHT+IF7XUW+P100edaXbGSm//he90Ln1D8fWPVA6iuq6Xwn8rQ18Ry0V4E1cmRJmi1XGnVwJ/UreQ==
X-Received: by 2002:a5d:598d:0:b0:37d:4e80:516 with SMTP id ffacd0b85a97d-38225a2163cmr2191863f8f.34.1731677066346;
        Fri, 15 Nov 2024 05:24:26 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821d0ea3e2sm4023804f8f.109.2024.11.15.05.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 05:24:25 -0800 (PST)
Date: Fri, 15 Nov 2024 14:24:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpuidle: riscv-sbi: fix device node release in early
 exit of for_each_possible_cpu
Message-ID: <20241115-20b5e02dd05173bfdc3a7d7f@orel>
References: <20241031-cpuidle-riscv-sbi-cleanup-v2-1-aae62d383118@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241031-cpuidle-riscv-sbi-cleanup-v2-1-aae62d383118@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052428_710462_2DDEFF5D 
X-CRM114-Status: GOOD (  22.74  )
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

On Thu, Oct 31, 2024 at 01:21:17PM +0100, Javier Carrasco wrote:
> The 'np' device_node is initialized via of_cpu_device_node_get(), which
> requires explicit calls to of_node_put() when it is no longer required
> to avoid leaking the resource.
> 
> Instead of adding the missing calls to of_node_put() in all execution
> paths, use the cleanup attribute for 'np' by means of the __free()
> macro, which automatically calls of_node_put() when the variable goes
> out of scope. Given that 'np' is only used within the
> for_each_possible_cpu(), reduce its scope to release the nood after
> every iteration of the loop.
> 
> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Changes in v2:
> - Squash patches for mainline solution without intermediate steps.
> - Link to v1: https://lore.kernel.org/r/20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 14462c092039..3a78d6b7598b 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -504,12 +504,13 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
>  	int cpu, ret;
>  	struct cpuidle_driver *drv;
>  	struct cpuidle_device *dev;
> -	struct device_node *np, *pds_node;
> +	struct device_node *pds_node;
>  
>  	/* Detect OSI support based on CPU DT nodes */
>  	sbi_cpuidle_use_osi = true;
>  	for_each_possible_cpu(cpu) {
> -		np = of_cpu_device_node_get(cpu);
> +		struct device_node *np __free(device_node) =
> +			of_cpu_device_node_get(cpu);

nit: wrapping the line is unnecessary, we have 100 char width.

>  		if (np &&
>  		    of_property_present(np, "power-domains") &&
>  		    of_property_present(np, "power-domain-names")) {
> 
> ---
> base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
> change-id: 20241029-cpuidle-riscv-sbi-cleanup-e9b3cb96e16d
> 
> Best regards,
> -- 
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
