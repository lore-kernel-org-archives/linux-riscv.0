Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2629BC46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 02:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLT51ODJPKO94xxaNOnU+0qLEMNn3ttFvFSW2tTXHok=; b=bzxTBQucfdO3e2
	MT9enEMHdAa6lnlmFJ1MeQOxhkYyejQtaFW7MvHajol7zdvRrWcj1AZQ7wR2bQXIXvrtKwrwUxcTp
	gWJRBuj6DArtFsvT5my/l6RYT2a67mViP9sxNIj4yRZplrR+wa/8HduZGMnGYvmRuZgw6zks7lLbq
	8aDkyZfreGhK9zfefswU+XUySI9EKPtg1sPSjZ9kFKVlCLc2WKFCoh7PZrroHf9+a9y1I0mNPA+LF
	hg+bwPYkWr1w+MK2I8m5bncTsfZCnNy9V6sBXHg9yCKbCS4lMMYZH+i9QRDt4lShHgyYceOVOSjVm
	fXocQC9Pp486tGfMdw4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGV4B-004fJq-19;
	Fri, 22 Dec 2023 02:15:11 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGV49-004fIv-0o
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 02:15:10 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7ba903342c2so47723439f.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 18:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703211308; x=1703816108; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GanUfZ5OO281UHDSAl+g80nfHe8/nHv9cA4rNmyqZrc=;
        b=apj91tnFlrA73SJ1jSdxyM5EXs1w/EsSb28kmd8iyyK7zKElBEt5PuhbNgF7jE61Ge
         sGpe3L4bHNnr0Lg9GXq/f40f/Jos5cBFxljs/Ozc+/lXFU0OjnmpmV8dqlwkDcpVS+HR
         ljOUdJrw5C2xhZtzY4ZDv8YHF2zUtgraFWB/Qozm7JxCSExFPMum7/WJUipS3aCxxGnT
         0ya7Xlj2k0shAPXR0H/fDmQgHgED/BGEPHj0FBfzvNn7VOPDc8wECXegBaALa6aSfT1t
         VQXQs6JOQS/XqVWcYRl4zhGml/hddKZ7KvB1Y6H+tVAahjemz+b1ReyT5zqJ5opKK0E1
         LNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703211308; x=1703816108;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GanUfZ5OO281UHDSAl+g80nfHe8/nHv9cA4rNmyqZrc=;
        b=rUQ5ZPN6J5FLYxOaUcsLaWPu0hvaSptt71PfCjTynap7YoNrCce8lM6hXF3IF6Ozvz
         maKHZ7R9J/io1lyY+cgggcFtR8yAHtV1flcSoWFycvuUI2zQpqxSdYfXQOijUoxZiySU
         lI/EZKRw6VC7EBn+R+zWpl2XBvQh3Zy181OqkYrFZY3i+JQCgLqqSkMDXIR7+5cBNpFq
         ceBlV198NYiK9TAavO/PkXa6SyVhtIdV2xSOr0KNsN3okEG7nE7Am3bWoI453FktWAq0
         6frbq5R/+VjtZ5feU9mH2rYHIHORlCu/TgxnEcAMz1qlx7CVuNb8GOvssJ2Dm7yUrB+o
         9pFg==
X-Gm-Message-State: AOJu0YzIx//lNtkimgQ0N5j08r5HFr7jGY++hIGshbHMK85XV694IVQl
	umM7fFsMvhud95bDhhuA/HJudYBKYnqrmn3W0l8vQ8q9Tlo=
X-Google-Smtp-Source: AGHT+IEhcNGVQJDHPyDZIIqhJmZJlW9G8h+PZjwVen1gRm/ymjfOlRDTgRKMvZOENc3bdKlBT/zBWQ==
X-Received: by 2002:a05:6e02:144a:b0:35f:b047:385d with SMTP id p10-20020a056e02144a00b0035fb047385dmr699309ilo.125.1703211308076;
        Thu, 21 Dec 2023 18:15:08 -0800 (PST)
Received: from ?IPv6:2402:7500:5d5:b5a6:112b:fcd:68ec:f43? ([2402:7500:5d5:b5a6:112b:fcd:68ec:f43])
        by smtp.gmail.com with ESMTPSA id w6-20020a636206000000b005cd8866cccesm2243473pgb.27.2023.12.21.18.15.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Dec 2023 18:15:07 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH] crypto: riscv - use real assembler for vector crypto
 extensions
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231220065648.253236-1-ebiggers@kernel.org>
Date: Fri, 22 Dec 2023 10:15:04 +0800
Cc: linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Christoph Muellner <christoph.muellner@vrull.eu>
Message-Id: <3C51992F-B8F8-4023-81EE-3C95102B072A@sifive.com>
References: <20231220065648.253236-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_181509_316358_D8B44C97 
X-CRM114-Status: GOOD (  15.51  )
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

On Dec 20, 2023, at 14:56, Eric Biggers <ebiggers@kernel.org> wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> LLVM main and binutils master now both fully support v1.0 of the RISC-V
> vector crypto extensions.  Therefore, delete riscv.pm and use the real
> assembler mnemonics for the vector crypto instructions.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> Hi Jerry, this patch applies to your v3 patchset
> (https://lore.kernel.org/linux-crypto/20231205092801.1335-1-jerry.shih@sifive.com).
> Can you consider folding it into your patchset?  Thanks!

Thank you for the vector crypto asm mnemonics works.
Do you mean that fold this patch or append this one as the separated
commit into my next v4 patchset?

> arch/riscv/Kconfig                            |   6 +
> arch/riscv/crypto/Kconfig                     |  16 +-
> .../crypto/aes-riscv64-zvkned-zvbb-zvkg.pl    | 226 +++++------
> arch/riscv/crypto/aes-riscv64-zvkned-zvkb.pl  |  98 ++---
> arch/riscv/crypto/aes-riscv64-zvkned.pl       | 314 +++++++--------
> arch/riscv/crypto/chacha-riscv64-zvkb.pl      |  34 +-
> arch/riscv/crypto/ghash-riscv64-zvkg.pl       |   4 +-
> arch/riscv/crypto/riscv.pm                    | 359 ------------------
> .../sha256-riscv64-zvknha_or_zvknhb-zvkb.pl   | 101 ++---
> .../crypto/sha512-riscv64-zvknhb-zvkb.pl      |  52 +--
> arch/riscv/crypto/sm3-riscv64-zvksh.pl        |  86 ++---
> arch/riscv/crypto/sm4-riscv64-zvksed.pl       |  62 +--
> 12 files changed, 503 insertions(+), 855 deletions(-)
> delete mode 100644 arch/riscv/crypto/riscv.pm
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index dc51164b8fd4..7267a6345e32 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -531,20 +531,26 @@ config RISCV_ISA_V_PREEMPTIVE
> 	  by adding memory on demand for tracking kernel's V-context.
> 
> config TOOLCHAIN_HAS_ZBB
> 	bool
> 	default y
> 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
> 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> 	depends on AS_HAS_OPTION_ARCH
> 
> +# This option indicates that the toolchain supports all v1.0 vector crypto
> +# extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
> +# binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
> +config TOOLCHAIN_HAS_ZVK
> +	def_bool $(as-instr, .option arch$(comma) +zvkb)
> +

Could we rename to other terms like
`TOOLCHAIN_HAS_VECTOR_CRYPTO/TOOLCHAIN_HAS_V_CRYPTO `?
Some ciphers don't use `ZVK*` extensions.

-Jerry


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
