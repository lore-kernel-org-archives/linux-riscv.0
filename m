Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A028DC28B2E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMGxffRnsyGHQnseyZGiXrLiYZ25cDicM6Oyo0QBc2U=; b=syEjzT8Zsrxcs0
	P/FFBmIRoq6T1J58FEBfHTCrgmEo2u4s3LT9SCOJahuvz1+tw9D9FzJS+IpQrDWAMIduD3kivMg2E
	cqPmbwY3VtVSaf/Wj2bLTPb8texrqUmFoswYMkix4kn5/LIE7R9W6rgS3vnTAgwr2rSt2NhVHSN6y
	Tj909JTMhxEL64xa4pHOraWYxIVBp17NTde5NW918/AQ32KbLkdIAxHhOCLzyimEBvqlwLZgMOG+k
	QkDuP87w2gcAnxNTEI7JDQzGq7CGl5IZyZ2EP1CmUj+2FJOXQB2lBrM+ewHcl7rBg6WwrzZHcT817
	o3DacxUsqt24yp50D6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshfb-0000000BEwT-3AeM;
	Thu, 13 Mar 2025 12:28:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshcE-0000000BEM5-16fG
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 12:24:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3913b539aabso549720f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741868684; x=1742473484; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jdwK1Zh8ZZo6rwDf542VaxRAlTlQ9sZFdzOTXwzDIRU=;
        b=ZMdDd89jXKSsU0HjLaq9TiARvdvM08O+m2tb2gqX9p8zRMdCH6b35g5e86zlGJkYcw
         Ik3wzitxaNHOMMgLAnmmiAuLYlbi8I/QvCYYjsSnY6Jn2WcJFqif0zYxQ0cwEyzc3K2o
         mxz05+JlmKMmvmYlq65CcgSMfm+ZImoMFo1tqbYIVGIlS+oQrgSQv1POkcNgx8LQ9jXr
         Ss+66ffWfe1F9ETAiI/i6+PY0GeRv6lCh8HUXybthh1d+A7GHJ45PudmMZ4hwNLFKwR9
         ML1/5k6BCgG1gQLSWhmHkCSdooGCIJ7Lh88nG9Sb7FtKL9Oe2F2vA65f2bxgyLS8Wt6l
         +5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868684; x=1742473484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdwK1Zh8ZZo6rwDf542VaxRAlTlQ9sZFdzOTXwzDIRU=;
        b=uScImLIYc9q4QkulceK8JGU0I3zN23Cg9XeYsFXsKq5zXyIb4Paeg82Ljf/VKHHI/I
         07Kh2kE/9T3m2Nx3rL5c0nJp3tbAuGLY2AA+OkFwv4ROVVVdrlA+M6m7HowE40pE97tN
         z3/uDDOKZ3SKWBmPvZvAarixTMikw3mF/SsFCa5u9v8AIL/Q5AIOP/fzx/7ObAN5+tnp
         YqRK8HiqX+QZsm9dO9y0woczA+7qKJyDv6wHQVI4yUBglips0fn5ylGgHuwQnrzY48Md
         g7Ly29nYPZpuR1D6HysV/MiBijLPosiBV8gsjpyQPZybXRh3M7RX76EbLw1bVXlA1uKb
         qocg==
X-Forwarded-Encrypted: i=1; AJvYcCUbXoTBfpaFJgDV5AYGEFdHhi6/KO2ZOhYwsmazzQ9C7r0h/CxKXGolz5yYKj5iS+GshJX/BgM4IiOb0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxWjqw1eFo1zsjvLrErqbnPYZ1E/HYg9gacStUuBzFDXQe9PSO
	Qk3W3RhidJ0xv7LfctU32wVu43q8D0o4YXIeFXz126es4eVlf0CQsAlYwSr0PKE=
X-Gm-Gg: ASbGncvDewMHjc1b7bxC1k4MTfYazWBA6BKa9I7EBxWt4LWAU6pLgVA4lYsN6nejkSH
	MrqNxkskUBmActAFpQaY0HhiVVmFnNUvOAnrkiSR2pS9p7H56mAjuk1O9u8NhHxunZsFMYJOFbG
	gKa7e/2Z2cwaK2Nq9I7+uEfopnq1yDeijHvknWiWbgNX+sEwE8t1LuunDrimIBdKw64PJyj9ajI
	8ToCeqbb1nQV/v5B7M/RjLa4P1jkB8DbGltZulEBgh7i0wR3D4TNmqYO2itA99ZkyfMFh4e3aso
	ZwdRSCTRwuxQbm3NKytYAIISNIe9pJxJ
X-Google-Smtp-Source: AGHT+IHTTFdUMyPE8J6/FJ/Tz2TmgEnvUPiqAP3Vg4LJA9U623EyzHKoPA3QMg0KCVbZ9Z4v0fkfMA==
X-Received: by 2002:a05:6000:402a:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-39132d22aa7mr18761264f8f.3.1741868684583;
        Thu, 13 Mar 2025 05:24:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b90sm2006325f8f.53.2025.03.13.05.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:24:44 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:24:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v3 01/17] riscv: add Firmware Feature (FWFT) SBI
 extensions definitions
Message-ID: <20250313-924c6711597160f50c4cf90e@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-2-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_052446_305389_50627E76 
X-CRM114-Status: UNSURE (   8.73  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 10, 2025 at 04:12:08PM +0100, Cl=E9ment L=E9ger wrote:
> The Firmware Features extension (FWFT) was added as part of the SBI 3.0
> specification. Add SBI definitions to use this extension.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
