Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59C8C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HT+N3lMbz5kWuSciwZIr9lDAshYvaheqQQpnkjtvD5w=; b=Y+HfHZFokq1fvz
	yKcOkmaW0CcDGJ1S5GAj9/5dQ4r5BtpFxdrO6qTCpq0nYmChmRWitrmdNhmfjWMTZi/uB1JxCl01X
	Hef1wAFXW7Lulgx48Rzch9IS6odLvool+9IPNpa7YM/PsFmWhX0gdKXgGUhyS/lfTcOoyxX9Xr6jx
	UE1G6nYJQDgPrquvuK3pSx2EVu+Vg8r1URn3F83aICk0IjQzpfLKPMfySFukmTOR0z14YJzC5Pjmg
	7yKcjUKFZjnKZq60pefH0Wj5h/BT0Ii6Ox9Pf0R4COr4Lj8a6ta3MHwkcWAPX9jd+InE2trh4TrVh
	C152pZGNSZF58wEUIa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trz3d-00000005jmN-26Q1;
	Tue, 11 Mar 2025 12:50:05 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryoG-00000005fOC-3PS7
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 12:34:13 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c3bf231660so558493785a.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741696450; x=1742301250; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1ZxqjyMUd+isnYc/2JZqNQs5zU7eDZecHhSMewZT7k=;
        b=XJiVj73OmcSktmznnIakZknns4E9hxB2IAEN/uvgv+RPpHm8VBE6YKiZbYzkf2hH7R
         ZRCAF67Rtcop6BPPG0sofg5dzKLpNadeN+bSwhfoyMCIpQhjkPBIM2Vn7cK2JrCSSgHg
         N7IlQOd3fUnMEZv0vDmVap2x2kuAv8WxhE7y9HtDPsYDNcmx2udoZOhSCTI5K/pu/nif
         bf9O/Z+rLW9K9yf7OBhGymUZS7q3CxYnuHpr5YmXRm9PgRllFOYtvI9E/J43OMwN3eH5
         5dFbX2knFvcoihCQZIpWuO6AfaGGEUSVncr9MPk1DlksnpYsqNzON4FeC4xOio7EKgoF
         cymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741696450; x=1742301250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1ZxqjyMUd+isnYc/2JZqNQs5zU7eDZecHhSMewZT7k=;
        b=Fi6oXKlciKkm8O1QSOy5ci3M8zZLc3AjwDWdu4isH9s6sEv4H67jTdeK115HJskxR/
         TecdZdQirytmGdjVDpGdUjHHIhG2WM0vLxt6D3q6uklXdFzivfPnuwys93UEOwWyV1CA
         Q6+t7ZW4aDn2Rdstx+GbrQn4uJmoomtxALc194QUzKuyFZDUv+6IOwczfarCdaPKWfmP
         AMUZQ1MeIJuUNFjq0D+hiI1I4m0KTKTvahs2b/r9t5DjoIYccL3Bt2dLTf9qtzzUF0zH
         JpFwhgIy0qHFovXMzGPqf1vcIpt6xLk3NqXrRHL5MjVUX7YZLDTMzyjQ82Ntpa9iuCWR
         i0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTrt3yRXhzJSjXMVImxhB0Rw9teS0GVm7w38Of7aFChwlJEufkS3T21T5ZMY+ovmCM4n2t4OTJP/FyOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCwReFeKAV3ZXDcGpJVyvNkIGDwNIk/HekxA0kj9kDXSAi6yE1
	VracQ9Kq/OdnF+K6maxZpplB57G154kA7eios3YS1qLhYQw7wahk
X-Gm-Gg: ASbGnctrOFLtCE13xk+68RTMMpSmAyAJeROXfdu8NMxkoWKryp3Z0SoJ51beDH/TMqV
	74j1A43ATqbrA0YfHxoVIvxnQJlcPFffK+YOUPfy8WlY+5AG5R06cgrtgoVMpwz2tWqv3r+wNpW
	GlzhJLfs8gcAzk93q8JbncnDLpoktp5hDKPGasVSGmOybSAynjkFHWlDB1RY6y2EfxgP1jTUdnX
	4NOFP6LKLHLNP8IocqkK9LXRe8gsiC1Z1iYeN3vh5DI+OTtTxIisnbBWBhV0Oue7LAbJhDr1F//
	gDJKLlo8HQFr23+OSIeP
X-Google-Smtp-Source: AGHT+IFU2cAqaMeCXlZ0Hqy6Zv7mfjOYRy5JKPusGv2guBlnRHiq/LPliOv7yz6eaX2PsMQjmuIglQ==
X-Received: by 2002:a05:620a:26a3:b0:7c5:55f9:4bc1 with SMTP id af79cd13be357-7c555f94e42mr850962085a.42.1741696450372;
        Tue, 11 Mar 2025 05:34:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c56630e44dsm34135885a.86.2025.03.11.05.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 05:34:09 -0700 (PDT)
Date: Tue, 11 Mar 2025 20:34:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/3] riscv: Add bfloat16 instruction support
Message-ID: <d6t25jmcf57sqpjqwykhdf3ju6v3wwpyaiumll4x6bjfhcohl5@oikmnpusjn6u>
References: <20250213003849.147358-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213003849.147358-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_053412_848738_173AC39C 
X-CRM114-Status: GOOD (  12.82  )
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

On Thu, Feb 13, 2025 at 08:38:44AM +0800, Inochi Amaoto wrote:
> Add description for the BFloat16 precision Floating-Point ISA extension,
> (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
> ("Added Chapter title to BF16") of the riscv-isa-manual.
> =

> Changed from v3:
> 1. rebase for v6.14-rc1
> 2. patch2: add validate for zfbfmin, zvfbfmin, zvfbfwma
> 3. patch2: apply Cl=E9ment's tag
> =

> Changed from v2:
> 1. rebase for v6.13-rc1
> =

> Changed from v1:
> 1. patch3: add missing code in sys_hwprobe.c
> =

> Inochi Amaoto (3):
>   dt-bindings: riscv: add bfloat16 ISA extension description
>   riscv: add ISA extension parsing for bfloat16 ISA extension
>   riscv: hwprobe: export bfloat16 ISA extension
> =

>  Documentation/arch/riscv/hwprobe.rst          | 12 +++++
>  .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
>  arch/riscv/include/asm/hwcap.h                |  3 ++
>  arch/riscv/include/uapi/asm/hwprobe.h         |  3 ++
>  arch/riscv/kernel/cpufeature.c                | 35 +++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c               |  3 ++
>  6 files changed, 101 insertions(+)
> =

> --
> 2.48.1
> =


I wonder whether this patch could get merged? So I can
submit the SG2044 board dts without this as dependency.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
