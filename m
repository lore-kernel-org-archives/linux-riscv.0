Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3240BC27C44
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFiulG/oE4WkEfX/fA3fzsjubbcUrGrz9gGYvxkZA8g=; b=lXVwXrw/vGO9Ws
	A5QYsQts21UzdLcpkzpyYnWlezRlrHbhgy7p5TWntUjUSenAWa0lkGgDe+gX3fLlNwudzb1DKc9c8
	yBtozoFYO4l38gfDYLMasaV6dE6xB6qcUhipOy/rk5+0ukIORdEVrhuPmyedNGhGl8A87C7woJK8H
	q4jzbYTo3bVbYhfkdstdUiOAA15W/zzCNlrKYMc5a3ScBNqOqwZy5828AQAXep3dnyaLPjTEFurU/
	H1T7VjedQBDrcwO4UqeWAdTFP11FTvtjjma57tmqKwoEdka7NrGTlQSDiyW+GiUXKPPotB3dLjovD
	JBXnHnhGbsd2A1Az/Yaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChfD-00000007hte-1LpZ;
	Thu, 30 May 2024 15:25:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChf7-00000007hor-3LKE
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 15:25:57 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-70231ac9093so758599b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717082746; x=1717687546; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpRgYa4dwqPbFkBgIi25CyTHChxu5ecl64Veh8E6qX4=;
        b=rkWa90+iZYA7e/Xd88bpQKH7hFPphh/c4oT5YBsaMQfWP0a6WcNKjubxknX6fgj/nJ
         kIlhT+3qUCR8/1o+uzbfuUoyMyXkMnUQSjrcCa7kvmqiMCVn5KziQSnd2jPlyIPcGWlM
         9vd+ncDBi2MGPjI9sDZuiDBXirCNbF7byeBt5lmuXkTq8u70VuVjLkFlxuuYj+ZeSIFi
         6pstFzrceMwFaFKlGfBPwNSOi+ZJGOEOGued2NjgarKbt1NnM/wB9eOUzp0pW/8GeZhA
         VNbKglZAFtBsgc574mTXCHzH1kJ16f/Ft268ehHKzd+R+kcdLhLpitypCw7EcMMMu7kI
         +upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717082746; x=1717687546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpRgYa4dwqPbFkBgIi25CyTHChxu5ecl64Veh8E6qX4=;
        b=pDvbWDSDSMUFxgcqwHtjxeMVd6/9ELmHasKse9P2EpehiMX7THNXLqpBZ9NHny1Kr2
         J1bTQP3Gil5SKgrnSlEXIETa/jlh6VYZDX9k8GJ3rS3es6isR07lchQ8ZoNYnAawuSgz
         FDdxtiqDXRsL4AzMaJcsziK8t3eJAiZ6izY3sBo0x+ROZZL3QATrg8ojxNeChePb94Pm
         XRPJNAjrxYcna/KWWldlBqXe6ShB8ApgUW0/l/jJzOCqkzn9VXKWnER/s1NFGUz76JYP
         hy88c0lKw2U3F5jAAuP9VMGv5iTrayT7YUi82zNYq+VGmj7Uu5EQcCnG9TvgyH8pXIPd
         H+3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZQH5holqEPMJxYf3lruneWb1zaDqptUBB6iMxLxFEzRc6KBcvnUKYcm89hObcaw6AdUJmXP/fUAoDbSNyRACqcAqibZ3JwLaR5ovIDSws
X-Gm-Message-State: AOJu0YwvJnXNV5tbynNKIzq9OEtJyS/jxxfvui4rmI7u+mAoxEShx8aR
	MP7L+lXmLK3qrM4kJCTPolIZ2si0cAIa2BZAJgXGjh5lQVYWN/ce0B6KI9XN5UY=
X-Google-Smtp-Source: AGHT+IEborn6L609viyJY6HL00IRTeefiOYqFrtGZGbG+Un7sype/7J809TXJhOL2x2fa0cmRNR4eg==
X-Received: by 2002:a05:6a20:5647:b0:1ad:5325:d9b7 with SMTP id adf61e73a8af0-1b26460b6bbmr2226154637.52.1717082746244;
        Thu, 30 May 2024 08:25:46 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7022b6c6047sm1848587b3a.46.2024.05.30.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:25:45 -0700 (PDT)
Date: Thu, 30 May 2024 08:25:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb
 ISA extensions
Message-ID: <ZliadoA5v5obWNYn@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-10-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517145302.971019-10-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_082553_849678_E1AE241B 
X-CRM114-Status: GOOD (  19.38  )
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

On Fri, May 17, 2024 at 04:52:49PM +0200, Cl=E9ment L=E9ger wrote:
> Export Zca, Zcf, Zcd and Zcb ISA extension through hwprobe.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 20 ++++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
>  arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
>  3 files changed, 28 insertions(+)
> =

> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 48be38e0b788..cad84f51412d 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -196,6 +196,26 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         58220614a5f ("Zimop is ratified/1.0").
>  =

> +  * :c:macro:`RISCV_HWPROBE_EXT_ZCA`: The Zca extension part of Zc* stan=
dard
> +       extensions for code size reduction, as ratified in commit 8be3419=
c1c0
> +       ("Zcf doesn't exist on RV64 as it contains no instructions") of
> +       riscv-code-size-reduction.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZCB`: The Zcb extension part of Zc* stan=
dard
> +       extensions for code size reduction, as ratified in commit 8be3419=
c1c0
> +       ("Zcf doesn't exist on RV64 as it contains no instructions") of
> +       riscv-code-size-reduction.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZCD`: The Zcd extension part of Zc* stan=
dard
> +       extensions for code size reduction, as ratified in commit 8be3419=
c1c0
> +       ("Zcf doesn't exist on RV64 as it contains no instructions") of
> +       riscv-code-size-reduction.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZCF`: The Zcf extension part of Zc* stan=
dard
> +       extensions for code size reduction, as ratified in commit 8be3419=
c1c0
> +       ("Zcf doesn't exist on RV64 as it contains no instructions") of
> +       riscv-code-size-reduction.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains perfor=
mance
>    information about the selected set of processors.
>  =

> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 3b16a12204b1..652b2373729f 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -61,6 +61,10 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
>  #define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
>  #define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 37)
> +#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 38)
> +#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 39)
> +#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 40)
> +#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 41)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index fc6f4238f0b3..11def345a42d 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -113,6 +113,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTPAUSE);
>  		EXT_KEY(ZIMOP);
> +		EXT_KEY(ZCA);
> +		EXT_KEY(ZCB);
>  =

>  		if (has_vector()) {
>  			EXT_KEY(ZVBB);
> @@ -133,6 +135,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>  			EXT_KEY(ZFH);
>  			EXT_KEY(ZFHMIN);
>  			EXT_KEY(ZFA);
> +			EXT_KEY(ZCD);
> +			EXT_KEY(ZCF);
>  		}
>  #undef EXT_KEY
>  	}
> -- =

> 2.43.0
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
