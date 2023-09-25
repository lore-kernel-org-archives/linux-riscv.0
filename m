Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F80ACE7A96
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UNPMz6xuXCOfbR4gjaXWzIhf1ak5rtcR3r6Edps0T0=; b=RX9N98hD0UUgsS
	Fy0i4hw4FE6SSZnRpgIMhic87DpZxF5zO0lG7ncGHz+qJXOcjmWX9PfAES2p8hgYaXR/Y6o8opJCF
	s0ntIxCd+wtwgvRgTCM0B0Yy3bRyh2ZgLgFMXWgsqnrjvrXs/+Bf2D7hKx6myXgjoIEAB3yFhcoSU
	h8GdaagY+gdnTHCPlrHZ9904HjmXMRXOFzXuy+M28vMPXEeYLDKzqUHrcGnBMDAAgjDiOx1EihIIn
	WKvBal9i0WWanKoCi9VwIEzREQIZtYxybF+7S29xTLLE5yRYFk5U29HzxPryDBSgeHpSMfouc+jTX
	m15dDM7WTpgTCtj7EgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmLL-00EPjv-24;
	Mon, 25 Sep 2023 14:13:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmLK-00EPiy-03
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 14:13:47 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so7599148a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695651222; x=1696256022; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w3Y94KioZ4lUB6KTiVYafyhITdpeQDnL5Ld1MTAmwrE=;
        b=NyD7ViPAv6KZ0ktEEXK7LrtLf7VsWgSQywJ3bHksF4gqryV/rjM/GUUy6jkiQIn8vf
         3QqoirvvOrBJB+c1Y6+h6oQxQhUkbEYxIPUpTAIsQRRtMc14kPP7nVhCzWZSRrj2Pn3H
         Fh64jawffw7eTbPJcOzFBEuP87DFxCHF3UFlpo16eRlS6uCyxaYZ33xbwTcmHnQyubtO
         JL77fFZo8yIrH/cI3X54DBmgNq32UmlIvo3PinC5AkQevS55nu6JnxH7B/8sC0Hb024+
         MMHy+xNNFUiq9PUsWqyox1qkGFkyzGur/ZM6LwP1JNCVwKOtZbM3uwnoEOAEIojGhbwc
         jdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695651222; x=1696256022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3Y94KioZ4lUB6KTiVYafyhITdpeQDnL5Ld1MTAmwrE=;
        b=UWOdQiEQ5U7xOlqFYOBfDt1BPs5jmNapmZWbiTpm3i0ld/e5sYA2Pe2awUljvKZ/8M
         Rw5SWESnrr3r6HbvwdkPQ5aqpWU975LahVoj43QwJvUsrJZEtJMt6MAeA4Mkakp7XFY9
         fr6njiOVhLeMJ6E0uyBEBlo3rSdI6h6NffObjFRdF1rYRey3Zn5KPIsPHS08cMMo2664
         NO3lH9vbj8UO/7ZEuEU5D64AIyCewjz4iVPQ7N6iRpqim3+TXZ2fAqcHRuEmRu/AhBJc
         2fjAiIgtQydimAtSzN+VeE6YNX5OYQb7DHl20PUJRRu4ywlzebkjhMzdW2UIDB9pqbFM
         er2Q==
X-Gm-Message-State: AOJu0Yz5rt4dXqo+6ii/j8TmLx5rEsbJuey9zV9JLG+FdNauMIHEXz+C
	X0H47AALvgVUhrJ2Zm57pD5aFQ==
X-Google-Smtp-Source: AGHT+IHN01Ha+0X82LArkbyFm3JD30PWtG77y/LlloFpNITht78xOEe93gDgtfpCK1tmqX0gcB9MJg==
X-Received: by 2002:aa7:c481:0:b0:52c:b469:bafd with SMTP id m1-20020aa7c481000000b0052cb469bafdmr4951595edq.41.1695651222046;
        Mon, 25 Sep 2023 07:13:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640206d200b005224d960e66sm5533135edy.96.2023.09.25.07.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:13:41 -0700 (PDT)
Date: Mon, 25 Sep 2023 16:13:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 4/9] RISC-V: Detect Zicond from ISA string
Message-ID: <20230925-434ad7cfaea0011fe0fb9989@orel>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230925133859.1735879-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_071346_052461_DADA50F2 
X-CRM114-Status: GOOD (  16.44  )
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

On Mon, Sep 25, 2023 at 07:08:54PM +0530, Anup Patel wrote:
> The RISC-V integer conditional (Zicond) operation extension defines
> standard conditional arithmetic and conditional-select/move operations
> which are inspired from the XVentanaCondOps extension. In fact, QEMU
> RISC-V also has support for emulating Zicond extension.
> 
> Let us detect Zicond extension from ISA string available through
> DT or ACPI.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b7efe9e2fa89..15bafc02ffd4 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -60,6 +60,7 @@
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
>  #define RISCV_ISA_EXT_XVENTANACONDOPS	44
> +#define RISCV_ISA_EXT_ZICOND		45
>  
>  #define RISCV_ISA_EXT_MAX		64
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3a31d34fe709..7f683916f2c2 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -167,6 +167,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> +	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>  	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
