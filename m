Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E738C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/UVDxSWNIKNRvumS5q6i/a9cfVOcPXBg2+Ykzu+W4M=; b=4k7iRo8//ulHIl
	3yAeyrfCveGYYZobFJibnDOmoornYOcRsjk4rKiWDJI6HxgjpmTJWTGGgjOj6d/UoF6yvPY8Z0wdW
	WdMgi5W8pi+HCGXvyxvRxceQaI+NVZ3EfrBGP4TH0JzeGKKo2+3W4EJer84ZJxkD4tZQv33VO8xBr
	uZaU3dXvzVaZnL9YstGuvraDghGAFgSNxtGMr2BKwxANcd/nFfY8Wq+M/Hr7ZedWeC6LLSEZ7s6CP
	/WmpD1EBcz0/1zOiJNnw1Goxr5UOWUiKRBMdQKIfhI6FGmDsbJhiAMoIucu407NWcsU24nqqXP3ly
	BEmpEV7DU7U8Dl3AqcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPez-00Eu6Z-0l;
	Wed, 13 Dec 2023 13:52:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPex-00Eu4r-1Y
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 Dec 2023 13:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PTROWi090VipJqK8OYHPEAxaQ5DHXWxJFjKYJmaz5R0=; b=WMwNx0nMjyNtxDqOZOMeDTv9OH
	2+kpKHWOTjFUKGXq/Jlf/FMfyrjx7/wlzfZFgyrom3ajG9fV2Yrp5ktXKWE9uiH+6RoopkiaF3M7I
	Xpky+Ksy1d2RZAPZgjPx0K9BCnSdZwhpI4ZmFyI9Qbl/TJZGQKsHwz7IgU79AL9lZdpW019Zz06ap
	e+BKH8zQHXK8pCDb1fL/L0MI5K0H5I16Z5EB667j2w3gdvPWtsLrd8tbUZE/aqYwkvB9GID73Llb5
	pKxV1SVQtcYpO6g1aySpXJCMK0mJUSmNnpzUEUV2EM4kIjTKHa3u/TPH0N6io+ZowlHb0ueQsQD50
	H2HS3szA==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPet-0096qk-0g
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:52:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c31f18274so65112095e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702475536; x=1703080336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTROWi090VipJqK8OYHPEAxaQ5DHXWxJFjKYJmaz5R0=;
        b=i1iCvLzn2rN+hJXlxUA1iZBV1Z7tXuWO68h1ThDgv69DUf6ho3o+FKkhzhyPPSygoR
         HcXfd+SNl72lxwq3CGMM/YxVZ5VvY+UB5CGf/zGFssTP+Y78QSSX24QlAmNXSQzpjIAb
         W7cs0JEnV+LjfCgAA3VIQ/mJbRgvg+68VzRW9ScAryU1QrrqZTL5xJxdpU57zLNhjud5
         b4FsM40+dxYh5yYd+7m4ojkSFp9XFRgvh+KhBVOArnZ5CwDqxVpdI1yPaIS81qZt9nlU
         mBDugL6KKMUqsBqHa3N2BsitIg+x6eEmCNL/9XV/HdY0t7qJhUNCxwIXB9WI2rJNY+Dz
         NJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702475536; x=1703080336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTROWi090VipJqK8OYHPEAxaQ5DHXWxJFjKYJmaz5R0=;
        b=wUfxP5R7lozrQ2MtwGjgdpMzUnX+UGCMBuqkpEWu7sdXZvyWTeBnskxYQMOR/vbcu0
         cjApXDU++Y/F664k2mToDcYN0tyHUJymt6A90Sq+mPva4aw85wJH8Gx3JzGPAsMFdDoF
         hINIEYt4uKnrJmzzhTMJW6Q2sfqm0yY0+ADoCp8eMMBrYsAYLlR7/l6RUMNf8LFuP2rm
         K2oMZU+KzvnqmlhfAsgPXN1Lm7aqmzNUR/zIp8nuHjvBKla1iKPSzkcI+8Q8uw2Sd4nZ
         HY8IAZSlpta8r4q1CRHhacWwKJtwcU725M2ho5PmNM7bDotcSlgDPtoSybsoJP6JcgVO
         chdQ==
X-Gm-Message-State: AOJu0Yx5o4A4QwnoySZJ631XQo70Rnj0piLIG29e/e5bVQzpRlMiDEVc
	rtiEmUDtIjPm4EtmeSOrD0Owew==
X-Google-Smtp-Source: AGHT+IF5kmk8LVZ85W7N3gISbpDLPY8LvD+Hn6K1kJJ6Gm74g8cpX+vaNl8XPZV2r1+Itxbw0xZgcg==
X-Received: by 2002:a05:600c:220f:b0:40c:2100:60b1 with SMTP id z15-20020a05600c220f00b0040c210060b1mr3672409wml.178.1702475536469;
        Wed, 13 Dec 2023 05:52:16 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s13-20020a05600c384d00b004030e8ff964sm22836432wmr.34.2023.12.13.05.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:52:16 -0800 (PST)
Date: Wed, 13 Dec 2023 14:52:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Greentime Hu <greentime.hu@sifive.com>, wchen <waylingii@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Sean Christopherson <seanjc@google.com>, Like Xu <likexu@tencent.com>, Peter Xu <peterx@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/11] KVM: selftests: Add CONFIG_64BIT definition for
 the build
Message-ID: <20231213-b7a894416841716b792da2d5@orel>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <227b86955b24583b5cacedc8480e8f5d7e4fabf8.1702371136.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <227b86955b24583b5cacedc8480e8f5d7e4fabf8.1702371136.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_135219_515312_98FF2529 
X-CRM114-Status: GOOD (  14.16  )
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

On Tue, Dec 12, 2023 at 05:31:12PM +0800, Haibo Xu wrote:
> Since only 64bit KVM selftests were supported on all architectures,
> add the CONFIG_64BIT definition in kvm/Makefile to ensure only 64bit
> definitions were available in the corresponding included files.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 4838ea899bbb..bb03e278a163 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -225,7 +225,7 @@ else
>  LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
>  endif
>  CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
> -	-Wno-gnu-variable-sized-type-not-at-end -MD\
> +	-Wno-gnu-variable-sized-type-not-at-end -MD -DCONFIG_64BIT \
>  	-fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset \
>  	-fno-builtin-strnlen \
>  	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
