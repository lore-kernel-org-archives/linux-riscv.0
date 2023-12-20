Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A3C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQFA7T42Ot24mtjMtjB2nOY0MwWFfgxFqyKirm7NXX8=; b=0soc0BlhB3cBHG
	+OhB6y1baGw2MAUz4skZqvfOxh8Z0WijPbQ+Dubi63YbNLFwPknkFY4G80J0L0/kC0HpCtQrB3Awc
	zg2roRxazkSg+MgUuAk0t1iA0MhUG8iZGFxRbDZdDFWcdnEHfj7DJJJe/vyK4/cay0mFhIU0KvPjw
	Zg4srvpwS2u1SQnvAGwpSviZm50HTR6l1J5+PAZ7DUvlY3ix2Uir8sCekamNiPWJtBVIQ2RyWA//L
	5R4+XAw0T3XYfQg+pUzW9O9jTaHqnsQjMyAnfoc7QR1ps9ihj12ysBzPGLaK7hNTuiU67WkneY1tl
	neqePWofEqu94P4VxDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrJs-00GTKM-1p;
	Wed, 20 Dec 2023 07:48:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrJq-00GTJl-0C
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 07:48:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8CF4614EA
	for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3A8C433C8
	for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703058519;
	bh=t3YYKmMkhn2PvmtI3Y6LdZx4/HrW+mVrwx/MbVQrYg4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sOQhgx7qmFaesOhw+FvYOkkNU+kfM6wXWFzoeODcds2rQyaYN0qHdDpUg1vv3zk3V
	 Dd+H0NGdrVW1jV7hMVeykc6B1D5HipMiQK3oT1QY9Lgy/iQZ4FZSpLHMOuMT7FacLT
	 qUJO3AnTAi4EBf3u4ABOkWc/U3ePWJO1vj0Xz2skhEphp2GNxEFk5g1Yi5YNdD+BIS
	 ujN9MB5RCh0xXNMoBq/kM1GNOdEYpNVIK1zQyyD47JvqMr5lefYNbIpjN8d2uyyNJU
	 XKVXJ8FePpyMptAb5czh92jSUUAYFo9xGG4uAuBNBdJ1nBEMvPi5+mKeDEzqHBnrXr
	 Mov+YrkINppww==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e2786e71fso5291771e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 23:48:39 -0800 (PST)
X-Gm-Message-State: AOJu0YwFri0rUYOUDlLYTeY+LaE4A2UP7s3JR5AmQ6mdhNmAbjFVEv0Z
	nIFsV8P4rKkwG6pzdpdpV58qgQ8PdyWCeAe+Ikk=
X-Google-Smtp-Source: AGHT+IG9XuBZ8g9MHc8X54C4ejhYoE6mFRzIuItshsKB1XkfrLcCteK3PdaKiegncPNuTc8Vh9MaaKaOVURh55/awEw=
X-Received: by 2002:a19:6408:0:b0:50e:556e:d241 with SMTP id
 y8-20020a196408000000b0050e556ed241mr71868lfb.100.1703058517690; Tue, 19 Dec
 2023 23:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20231220065648.253236-1-ebiggers@kernel.org>
In-Reply-To: <20231220065648.253236-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 20 Dec 2023 08:48:26 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGHOTHi-LjEX=HWMrQwcthAWVN-y2YZ0T2s3_-22eh5dQ@mail.gmail.com>
Message-ID: <CAMj1kXGHOTHi-LjEX=HWMrQwcthAWVN-y2YZ0T2s3_-22eh5dQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: riscv - use real assembler for vector crypto extensions
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jerry Shih <jerry.shih@sifive.com>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Christoph Muellner <christoph.muellner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_234842_164393_DCC61A5B 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed, 20 Dec 2023 at 07:57, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> LLVM main and binutils master now both fully support v1.0 of the RISC-V
> vector crypto extensions.  Therefore, delete riscv.pm and use the real
> assembler mnemonics for the vector crypto instructions.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Hi Eric,

I agree that this is a substantial improvement.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>


> ---
>
> Hi Jerry, this patch applies to your v3 patchset
> (https://lore.kernel.org/linux-crypto/20231205092801.1335-1-jerry.shih@sifive.com).
> Can you consider folding it into your patchset?  Thanks!
>
>  arch/riscv/Kconfig                            |   6 +
>  arch/riscv/crypto/Kconfig                     |  16 +-
>  .../crypto/aes-riscv64-zvkned-zvbb-zvkg.pl    | 226 +++++------
>  arch/riscv/crypto/aes-riscv64-zvkned-zvkb.pl  |  98 ++---
>  arch/riscv/crypto/aes-riscv64-zvkned.pl       | 314 +++++++--------
>  arch/riscv/crypto/chacha-riscv64-zvkb.pl      |  34 +-
>  arch/riscv/crypto/ghash-riscv64-zvkg.pl       |   4 +-
>  arch/riscv/crypto/riscv.pm                    | 359 ------------------
>  .../sha256-riscv64-zvknha_or_zvknhb-zvkb.pl   | 101 ++---
>  .../crypto/sha512-riscv64-zvknhb-zvkb.pl      |  52 +--
>  arch/riscv/crypto/sm3-riscv64-zvksh.pl        |  86 ++---
>  arch/riscv/crypto/sm4-riscv64-zvksed.pl       |  62 +--
>  12 files changed, 503 insertions(+), 855 deletions(-)
>  delete mode 100644 arch/riscv/crypto/riscv.pm
>
...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
