Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7679CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ufs7fs2eHvINJQlXSgYx11H/oxliMFmUi106x7ov7uw=; b=e8O4Emq0ruksW6
	zoD8C170DNfZoMKkxD+I1KXCYgMEUTRpPYhgJ9ImVzdcguQ6PSMACmSXo6CVJejO4mwoG7GX8XDkw
	yE7aSOJQaivgRkbtxIYP+a9AiGBDUgfcK/YsuJtLvC68MMRRQ+A2CGRrlMgChYBAwErliOiDzMXyJ
	yILlADFHWdcmGgsTcDKYkVzxYS0aGphprI4ZR83eLD3PlBI1TcX1rGj7L3SibK9DOxSgqG2DYCImX
	hmiw7DBRvIR8wSpYKY3Ua4jndqxJ1c3oNW1sqx2BEAU0vgpU8/FRkkgmZiAnyTG4TjOLvFWGAwiMV
	DvpLz0hnSBJCfpWGzNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtmnl-0000000FKbq-2ZGK;
	Mon, 08 Apr 2024 11:04:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtmnh-0000000FKZV-11QG
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 11:04:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a51d3193e54so109558166b.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 04:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712574271; x=1713179071; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2JMfbQnsZCy4AZnv2rKGHbXHeobClNfn+hJCPxhuGCs=;
        b=c00sOr98Brzfrp+fLDxUMuQUfrQA8EBLO0g/wWRqeB6Trbl/haX4GpBkxzTabHzrvn
         Z+xw+yKFW8PF9K2pQSBvufJHXPR6xWiF62B9Fucnte+VpxG/B/HDYIg0xhDITJTwWxpy
         BWNl3xIyPpSmoaBErmPnZSb3taYIPfdpUr8Wt4ZptH+z+670eBK4tNaTSCtlHMsHrjnm
         H804hYS3pDK8vm3qg74e5ZStyfSoGG3cF3KeoudL54HsuWADmRUTeRyOn+MzDpkYhRUF
         1EQJZnTCeYAFTd1G153uRukplW3DCmF8KH97J/7vJhZyh1lCd/Xfuzglo0JRAgVY3nB6
         YkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712574271; x=1713179071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JMfbQnsZCy4AZnv2rKGHbXHeobClNfn+hJCPxhuGCs=;
        b=IljGXFiTYuNZl27yeR7JDkCFe/qB5w9TwsmgOPiBAkd20v8J4mfjyy68nMeCUcx1QK
         drqnYkcM4gOfVklKy+4z8/0ugenrLFy5g4CJITKbzNPPFO6eFRVNXMc1OpbMj86OkZXa
         8W7C/4zHAK9MhmI3XYRLbq5/G6YbT/th6EypQMIIkN8ijR916uUw0LbvULFTWlrALfjD
         kwWP4G+FzOZR1E70EhjdbjfvHwD08mhMSiSpOMwNEh/3BaiwBLD/W7X/oxnXYHZJBCsc
         Bq2JT4DrNl/yVFQGjU12EpN8Cr02mgg672vIlHqoJtHCCa192YqLyjIIUFjDYjomPM0u
         BLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeuFlOnjjL01a5MYOqJ/Bo5dtQ25SUX1ua4cbH41sKfEP0KZpj4evjuG/M4ZOgXQbKpO382uTOzhU5p8iXeMWBYBuJnmCFRrwPRE744znm
X-Gm-Message-State: AOJu0YzMKqCLrJ6nsncJ5acvUEtYiJyTdoHdPplX78MVqfEVTgTSrAWK
	IuBm7qwt9E7fy5P1GEAbDZ5CwLajLGA+vFpCMBnduAposx+iTq29omnXd05MQnM=
X-Google-Smtp-Source: AGHT+IHu3NL1dqCrQipR9WBG7yHccjiSJMRW2XQ02zqZv9+xdvjF/qhErQbKJL/weMoN3GTlL7Gjbw==
X-Received: by 2002:a17:907:6d0c:b0:a51:cdfd:8ef7 with SMTP id sa12-20020a1709076d0c00b00a51cdfd8ef7mr2804880ejc.39.1712574271061;
        Mon, 08 Apr 2024 04:04:31 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n22-20020a170906119600b00a51d113b320sm1674891eja.110.2024.04.08.04.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:04:30 -0700 (PDT)
Date: Mon, 8 Apr 2024 13:04:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
Message-ID: <20240408-0c3a1c3e3880a67a631f9f14@orel>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404103254.1752834-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_040433_327896_9EE21A4F 
X-CRM114-Status: GOOD (  12.99  )
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

On Thu, Apr 04, 2024 at 12:32:46PM +0200, Cl=E9ment L=E9ger wrote:
> The Zimop ISA extension was ratified recently. This series adds support
> for parsing it from riscv,isa, hwprobe export and kvm support for
> Guest/VM.
> =

> Cl=E9ment L=E9ger (5):
>   dt-bindings: riscv: add Zimop ISA extension description
>   riscv: add ISA extension parsing for Zimop
>   riscv: hwprobe: export Zimop ISA extension
>   RISC-V: KVM: Allow Zimop extension for Guest/VM
>   KVM: riscv: selftests: Add Zimop extension to get-reg-list test
> =

>  Documentation/arch/riscv/hwprobe.rst                    | 4 ++++
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  arch/riscv/include/asm/hwcap.h                          | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h                   | 1 +
>  arch/riscv/include/uapi/asm/kvm.h                       | 1 +
>  arch/riscv/kernel/cpufeature.c                          | 1 +
>  arch/riscv/kernel/sys_hwprobe.c                         | 1 +
>  arch/riscv/kvm/vcpu_onereg.c                            | 2 ++
>  tools/testing/selftests/kvm/riscv/get-reg-list.c        | 4 ++++
>  9 files changed, 20 insertions(+)
> =

> -- =

> 2.43.0

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
