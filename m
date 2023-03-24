Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B94EC6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0K00l5HzY+naVqK+KDGWmKp6zSYJIphcwVmmjC0p/4=; b=z+JXfKxDrcSmMP
	3JxyTyMI6KC65ba66dvAmOtAbKqsRsR0+u2PewWzn1fLofUSJawVZg6MYfV+u4K7EN83QpB5BX7ZR
	X76R5rOAXRaOBYXcFHqet/bI1sThFGBxXVpSe+eKc8s8rqg9n4Sp7FTymiw3gcPmfbATxD7zJSDcB
	kuJCCHxq/r2viZZ2EQHc5xbq1SEyEv/K7NaWhvlincYzuSzrU4rmTDNl7rppEr3g3Jh1uguTIeXqX
	AIxHokhUdTjnJ4lR2qakioDNc/+OZdn9suxmjN4X/ZCxFngrIqEqFFAVPAxwCAVjBcsgwIg9I6ZrZ
	LjLSArZZ5jKFSTMzggDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pffdb-004Fbl-07;
	Fri, 24 Mar 2023 11:31:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pffdY-004Fax-0f
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 11:31:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso794610wmq.5
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679657468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3f6o0AI12RH51u4tiMa8ok8ddso/WpX9mlrkI0ZUu0w=;
        b=P7MGoAM/2B0An/hP4AHitapxcPDSq7vRUPNE7aa6gf7AlO5KgYVw+iE5cDl0nuxNSo
         bIuB51BQrVxtU2a4mNCgfg83mSVWjTaQ77YrAXbp0XAxUVYmw13/gTqJHrXjeLULyhMr
         VwkkvDVEuOIwU8zDdX3oArtR1Y2DbHZgol4F7jxOWDpZ7OPqVO1qoJendXyLuRuZWo7B
         c/tmZmE9sTFrpqbKUaHIFHI/mLLV9MrDxdKglqmSJ/rOXAzucYQ1hNN/PqsGiweulo9T
         DZcTdkjbBdLZHmRePmljMUiN9NBi3KjAKSx9YJr2TuQqFKCqhTK/ZZV30YBYJJDEj7DU
         /QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679657468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3f6o0AI12RH51u4tiMa8ok8ddso/WpX9mlrkI0ZUu0w=;
        b=NXptnxTMuC/AmhaowGhfQ8rOI8ZJZPD7oxmpJHeuo4oOG29cZ9agsiVkjbZJwl+p8g
         u07ICbflfBIz2zyj6HrxS8KR+V7vK4fSViBC3ZaKvrod6Mb1g231FYbOI2UN8VagwVqU
         PUvIKrUUAVZyVBs1LYLiB3S8sCYJyBpYsJgyPmvXjfcqO2gNsThzRCw18V9Wx7v6H5z0
         627OvBlt+KriQUHviHdBcJKl1onNvqLFCdlGnb3/HusrdVRxx4IcdbOfr0OhsvMwAjbJ
         43/Or+mfl7GPoikwcCLLD3SocBBcby0mX5R0DtAN1yRd0nBLYQ7GE3dTnLiMfgKUsJIp
         0cmg==
X-Gm-Message-State: AO0yUKUdtM/pOykfgovJmiTlK+baPQoj/Ey/QUucNy5Z/b+ogYpA/tOE
	VIjinm0fCydZmhewi3SRbF6hG9KKvGp3Hpijpsg=
X-Google-Smtp-Source: AK7set90HHQGOSmYwIhfXbBeLYZ6w7qAmsMo8qC4WtVE1IN71eLboJgV4HF2Ym6aKBH6h674mWcsdg==
X-Received: by 2002:a7b:cb90:0:b0:3dc:4b87:a570 with SMTP id m16-20020a7bcb90000000b003dc4b87a570mr2381902wmi.35.1679657468483;
        Fri, 24 Mar 2023 04:31:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f24-20020a7bc8d8000000b003eb596cbc54sm4724396wml.0.2023.03.24.04.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 04:31:08 -0700 (PDT)
Date: Fri, 24 Mar 2023 12:31:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] RISC-V: Fixes for
 riscv_has_extension[un]likely()'s alternative dependency
Message-ID: <20230324113107.djp4ejnlpzn3qzrb@orel>
References: <20230324100538.3514663-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324100538.3514663-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_043112_245020_014832F0 
X-CRM114-Status: GOOD (  22.91  )
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

On Fri, Mar 24, 2023 at 10:05:37AM +0000, Conor Dooley wrote:
> Here's my attempt at fixing both the use of an FPU on XIP kernels and
> the issue that Jason ran into where CONFIG_FPU, which needs the
> alternatives frame work for has_fpu() checks, could be enabled without
> the alternatives actually being present.
> 
> For the former, a "slow" fallback that does not use alternatives is
> added to riscv_has_extension_[un]likely() that can be used with XIP.
> Obviously, we want to make use of Jisheng's alternatives based approach
> where possible, so any users of riscv_has_extension_[un]likely() will
> want to make sure that they select RISCV_ALTERNATIVE.
> If they don't however, they'll hit the fallback path which (should,
> sparing a silly mistake from me!) behave in the same way, thus
> succeeding silently. Sounds like a
> 
> To prevent "depends on !XIP_KERNEL; select RISCV_ALTERNATIVE" spreading
> like the plague through the various places that want to check for the
> presence of extensions, and sidestep the potential silent "success"
> mentioned above, all users RISCV_ALTERNATIVE are converted from selects
> to dependencies, with the option being selected for all !XIP_KERNEL
> builds.
> 
> I know that the VDSO was a key place that Jisheng wanted to use the new
> helper rather than static branches, and I think the fallback path
> should not cause issues there.
> 
> See the thread at [1] for the prior discussion.
> 
> Cheers,
> Conor.
> 
> 1 - https://lore.kernel.org/linux-riscv/20230128172856.3814-1-jszhang@kernel.org/T/#m21390d570997145d31dd8bb95002fd61f99c6573
> 
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Heiko Stuebner <heiko.stuebner@vrull.eu>
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: Anup Patel <apatel@ventanamicro.com>
> CC: Jisheng Zhang <jszhang@kernel.org>
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: Jason A. Donenfeld <Jason@zx2c4.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> 
> Conor Dooley (2):
>   RISC-V: add non-alternative fallback for
>     riscv_has_extension_[un]likely()
>   RISC-V: always select RISCV_ALTERNATIVE for non-xip kernels
> 
>  arch/riscv/Kconfig             | 12 ++++----
>  arch/riscv/Kconfig.erratas     |  6 ++--
>  arch/riscv/include/asm/hwcap.h | 50 ++++++++++++++++++++--------------
>  3 files changed, 38 insertions(+), 30 deletions(-)
> 
> -- 
> 2.39.2
>

LGTM, but if it was based on for-next then it could also immediately be
applied to zicboz. For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
