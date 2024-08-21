Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD0EC52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgdtXRx6BshInQTLup6K6qXZOXH/C8hSxX67BlmRuks=; b=kwdul1nI3YoMdM
	e6JPrBVcKXPKG8wNARbugh/WUtRE9jwGnzxC9ed9G8Dzn/frgNXk2poboHI1j8KoVN3bo7+IwOfkc
	5KABIuDpfF2M8seG14HJGQandksGc0PCYqtQkkDPXWo8aLi6W5y8oYsQ6R7QT53KXghjO4WXruw6i
	dQshnzl+5VBn4vCQihoX1l/EMtkVFLE2T9azFwH0PKmVz8xlWnp7HVDDXdBy22G+RqGX3uFsBUqEq
	7lKhzxFshaY5/CVk+8ywB2tR0N25yYowFEGoPCiV8d9T0N5tpIZ+hqnMKxv9WkCJlm4UvB2WDF513
	xDQMVyin/6oxNwF8Xd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmPp-00000009KaT-3XLp;
	Wed, 21 Aug 2024 14:34:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmPB-00000009KMX-2erL
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:33:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3718e416297so3153327f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724250824; x=1724855624; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9tHW42Po+Ib5k0Q3nPS22NDuwkRpcoidbcVdb+7z2w=;
        b=pKjXoDfIP+UBz0YDPlE5OJ9Mazn9S1aMmJo70L5LZ4DxNEdWi3p1w86WmL5S7mBXqs
         0pExpM+7YnwsM1428JuWP4UehiZG/pA9a4NsH0Co9IuqCGJ3C+S/duD5S4Z/ssN3KW10
         ynt9WjxDPY7e0QAa5NAg6MCqkTRvFq8sC7y4HWhIvlGzwWstrmcMiE3fz9BT1iQFBteP
         H/x0f5/mUq5T2lYUY4L0Pv0ajS63UBF5oUechFfMpu75wMf56AsWUqVixGGEsa8LeCQr
         wtMn2BwzWG3VYcAbUVdWU+I7qeWNyMFt3mKxKXp7Drxapf5TjP5r2wnrKrf8xTFJ5EUQ
         hPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250824; x=1724855624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9tHW42Po+Ib5k0Q3nPS22NDuwkRpcoidbcVdb+7z2w=;
        b=VqTN2jG+p8wxw/ErifaaLicXg5s/9Yg1xDkm1XzJ+CTJRUX4U8ld5aIco7xCLLvlqv
         Z5/MmKExLBnG4l4pAt7JGey31MsCBY1kRX4OZg+DXqBt54/I+65z/7q3YzmtEy0XI/GA
         C6Z8D2TD1QaDIpNFLs292bFQNV/axoZb9Ua36ZfySjmjjkugFqnRiXXnS0pKHx24K6Ms
         f6VQcxPa61ECaVHZMYHZMK4YqLsTY+qALjPWrPW4Ru7ALqDTG8mFn3fQDzoKSoeTWr3U
         lvqsbpqa0L67W8Oy6+O6E8QSqZq1ika9xATQ59yUwOx8cenbdIcjGqvuatmUf4azLkf+
         GJuA==
X-Forwarded-Encrypted: i=1; AJvYcCW7VNeNHCaGEmzpAzHQOfFLXuOHPG88e8LflztA/67qz5bWGBxXcgu5dqkr3rXZQJeP1RS1Gc6MhVvn0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0h+2nCMA5bx8sX8lrPjoloEVVYjKr1MqazebnTOah8ckgkggl
	RLexq2wUphOHttgX/ga8vMFkMB5pkzBvfH3jTsCy61f/d6kEpBlViFwKDk9NqN8=
X-Google-Smtp-Source: AGHT+IH9wrX/Y8Nt/Ytz/H+chcDCsKBski8cEHnVtJWJ2XVH9qv8rzTIl9oZNGy8046QXNH1fJUWNQ==
X-Received: by 2002:adf:e8cf:0:b0:368:255e:ab13 with SMTP id ffacd0b85a97d-372fd71f43amr1466494f8f.50.1724250823523;
        Wed, 21 Aug 2024 07:33:43 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371a937a5f4sm11539433f8f.51.2024.08.21.07.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:33:43 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:33:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 11/13] riscv: Add ISA extension parsing for Ziccrse
Message-ID: <20240821-c0a013faab7e36290a658543@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-12-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-12-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_073345_728260_2C935C13 
X-CRM114-Status: GOOD (  15.76  )
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

On Sun, Aug 18, 2024 at 08:35:36AM GMT, Alexandre Ghiti wrote:
> Add support to parse the Ziccrse string in the riscv,isa string.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index f5d53251c947..9e228b079a6d 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -93,6 +93,7 @@
>  #define RISCV_ISA_EXT_ZCMOP		84
>  #define RISCV_ISA_EXT_ZAWRS		85
>  #define RISCV_ISA_EXT_ZABHA		86
> +#define RISCV_ISA_EXT_ZICCRSE		87
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 67ebcc4c9424..ea9c255bbe3d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -314,6 +314,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  					  riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
>  					  riscv_ext_zicboz_validate),
> +	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> -- 
> 2.39.2
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
