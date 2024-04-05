Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4187CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTOcjTMTBu18Bb2FT1irVi3/XA07ZcVAAnBANUhExUE=; b=GNVYTGdKtUnHMT
	U+cc7AGXm+VWVKlHyvLDhW8W+F2qTuID0sWUQMDjXYXkbBwl9WYgNX+g7VmzIGZYXfyqsQPDoH/od
	hu+sYo3ZetsgD6ilaTgOxhHmuzTLdrTNRgc9EC+9k97FsMNos1eY6cww4riLhTOtIAwHFIpqNzayX
	kHGeLRANxTGCpNNolCrGc1HO0P5TG71ekcAbGiNXcWh7fXgtgXu46/CEYMQrmq4eUueiD7kEmTcm9
	gcwTR9Zi8VXOsnupa5VMS0iqr5TTQVHWn8GNDGZ/S5h8f1VDVPIUPMTNSWO2F18rICGP5HePkFUC/
	U7Tzeby1PpfrZd5g08fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rslSH-00000007jTW-1EXo;
	Fri, 05 Apr 2024 15:26:13 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rslSB-00000007jRo-3sJh
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 15:26:10 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-56e3e03b989so179702a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712330766; x=1712935566; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ed5x3XFfsBgZRAt34RC2mOQsGKeyKPo4QsC0c+Fqv3c=;
        b=A9daAKN5lZIaWN/GHhCxAzIUKJLFBPaVl3UI+xyycJF5WK/txNAjwmi/R0g4YFlu+F
         +dU+hD5+T0ub+SBaEHDeDuV1dCSnJI/4p0e9vv5LwAgG40Ao5gtW9lUosBaXVG0L1RHI
         QjPdYg9NUVMDV+SW1iQCsRcmKF11HemkXIwtpAQTQ7Spy8xhby4+nL2pnKNBuk8D21q4
         lQMV7y2rRzIjnjkWmQ6p7vszlZ1hr3WWolseEOHqfThlBQ2TLPTiLEohfm/yevkOQzMS
         2ri3E5v0xDYHEnqSnvJ++XoSTXcjovSg88jiWxu/uqBGm2VKhxMy6Uq60o/zr072aGtt
         /yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330766; x=1712935566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ed5x3XFfsBgZRAt34RC2mOQsGKeyKPo4QsC0c+Fqv3c=;
        b=VFi/4si6QRKx2mPlY8F9fI+RBUAoTM39NpnRz2TQ5xKdlHA7fP1TCnMwCtmq717xnA
         v/V/Pxl3H/kErfKugQHf43Tr5jjrn+OCaw/aDti41kD7dvyHJgYS6MxdTnMxQJtsSymN
         DnZwicrzYfS79IQIktj5hoTtqFWfoUUDNF/MJ8J8z6xzvJOdWHjCKZJQBDLpa3rWr2Vj
         ewxuBTyxIGfGZSr9FhTQgcnjUIpeL6NknI+WKW+J0DAmf5GOwjwMleY7MAVeq32nJRDH
         IgXSAgreFvIniajVjkdxUhWYQHMRcpU1ODlomlXoy7Gv/VBupGTdXaP5ZGwAzB8Y9CU4
         3mBA==
X-Forwarded-Encrypted: i=1; AJvYcCXQRsrqfOFWTMNBGJp7nOcbKx+oN5DDbzR9XPJgdGVORATQdZJlcYyIpbdavUPbQaWOLXnOABVu2dWoRuptkeM2OQPbpxHaQdsT+t/1J1Gr
X-Gm-Message-State: AOJu0YxCV4pEXQMXBP2pVLKHT27WLIBF32rPS+r1DjXrwZfJhpiOJzya
	gwXkbXTazHSD3j2EFkqQ2Yl5SuTXZ2uqsK/1+Ogq1aSfjShDPk6JPRm6Ax/h1i4=
X-Google-Smtp-Source: AGHT+IE6KiAsWau+yt3agpehbLfQdmB5U5LrPm1st7ROHU8ZRsWd/qG+KSVTOZ1UuqjphPekzLBQLg==
X-Received: by 2002:a17:906:684f:b0:a4e:2dbf:2eb0 with SMTP id a15-20020a170906684f00b00a4e2dbf2eb0mr2301320ejs.38.1712330765762;
        Fri, 05 Apr 2024 08:26:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gx5-20020a1709068a4500b00a4e579ce949sm950515ejc.51.2024.04.05.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:26:05 -0700 (PDT)
Date: Fri, 5 Apr 2024 17:26:04 +0200
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
Message-ID: <20240405-091c6c174f023d74b434059d@orel>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404103254.1752834-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_082608_011536_D2FC1E64 
X-CRM114-Status: GOOD (  15.23  )
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

I'm not sure we need this. Zimop by itself isn't useful, so I don't know
if we need to advertise it at all. When an extension comes along that
redefines some MOPs, then we'll advertise that extension, but the fact
Zimop is used for that extension is really just an implementation detail.

Thanks,
drew

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
> =

> =

> -- =

> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
