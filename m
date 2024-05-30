Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E920C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3FUkHX6MM6AvJqngTJ6T5k0O3NZZ54EVmjs4lot3zo=; b=kIq8Lw1DbRw0Fy
	ArWZbdTW9T2C0QfP8YQDg6F2DS6Y2QtLCXybazrG6I+WVwk/XXXCoaHcm60rHN1AAXVnEpX9SxGRh
	uyPEhHZktI9x3hhKKPmb4QT7iaZlyZOwUXkiWL3/Sxo9lxkfPP6NAPqtIYXbmZWVh7J0HDPSyCsP6
	M/hc8dWnO3VOS1hSIpPdA/ZUEb5g7sJWb6Ar3XOwTooRSVXOBjaBUKPyetUggPr8PifabxFlOiAWp
	8xXgFRvaY2SRTdzHJ3QliyMUCsU5oeOLEoxe2WMakEwRtZrNJCitmeTKFv2ggaBAgER9iBLg7oTZk
	4iZt4bUGhLKxyC3vbvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCi0u-00000007lPt-3IPd;
	Thu, 30 May 2024 15:48:24 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCi0r-00000007lOS-18oD
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 15:48:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f6262c0a22so3033045ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717084097; x=1717688897; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2/9YXup/8RbMNmyLIVK+PNdaz2WPXgvrHbc/uuCS+s=;
        b=M/qvwO91vsfAV58EmPdcLQq0sKwEXFapSF/aitOMWHDXA8yW5/Ps4HGvMTrEbsh8sE
         n8bSOpmE+uaBAgokpfBLdTVSH8pqVkW8dh/icavexavt937AAEdy+Vn0CFo8d/pp9FM1
         xUzlmgjwINDv4OLOBTs6Egf/EyuZN4zVFIrAH5Mv+u8jER176vB1PGk49SjKysNwdS5F
         jUY5ayjulJxfcTPUuZrWcYhrTNYK9OgSUBiJ2lQZi1OjPqnZoI1jsbwt2so7zkDzGitZ
         TOcm6Oe3mLJB5PPhgF5nj+3P6JP6jvlb5Rf2F+XUV9hoIDZcLwRYYk4pXlvJnExlTQyo
         ocxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717084097; x=1717688897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2/9YXup/8RbMNmyLIVK+PNdaz2WPXgvrHbc/uuCS+s=;
        b=wVE4eP1VNc7Q+RKvFSSiONVEsH2w4s0fE1kFvt7VGxz69S5Xeug9fwwXFDr5NMyrmF
         MuqfzHXhSoIPwI8oh+5E/M68F60B10ZjmBbu8S14BLayCaO7shoZ+DU76Ck/Xv80MWhX
         PB5p9i5XisCjspiFqlDnqNmBvVUmeL3pLg4eTx6ykmkiyQ7ngOJKfClQ6IBFvOErQ6BR
         OspsC71Lg3lQVxHaX6kdA82IYfK81U1O/GVXAM9nRBey4JYebIL+qP0i7lQ0/SWgXrb5
         l4siTZ7P9kfCT8w53SgsTfzE5aA+ylYESX+82ysVjlcCCzNqx6pPu3nn4DJePggO4CIy
         WeiA==
X-Forwarded-Encrypted: i=1; AJvYcCVpr1Cx7xG9GOfPxojDbvrsJDmuggcixwnB49HZwsjYhmlk/9V6gR3QxelJ7JflY4eVUMYP90wdm8tVzja3aS25yCB9TdeFEuUptGDvSLx2
X-Gm-Message-State: AOJu0YzADuA22HFcANpx7PWj1bw8b16GZboIxapwr+gV3WkAbcoQ0qY6
	W+7w2BLzRebRx8C1iOkQ+xnhbL7Mk+ZMLxAuQWHtvQ8X0P0g3wwejI77QnejnTM=
X-Google-Smtp-Source: AGHT+IFEoPjpm6Eoux4dPoJuolosadGpX2I41dVnCKtavoFPe5puywtXMZkqH8FzHI7me3wq7SDgqA==
X-Received: by 2002:a17:902:db09:b0:1f4:9468:38b6 with SMTP id d9443c01a7336-1f61c1ba67dmr29549475ad.34.1717084096975;
        Thu, 30 May 2024 08:48:16 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f4d6fe4775sm49803095ad.257.2024.05.30.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:48:16 -0700 (PDT)
Date: Thu, 30 May 2024 08:48:13 -0700
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
Subject: Re: [PATCH v5 13/16] riscv: add ISA extension parsing for Zcmop
Message-ID: <ZlifvXUiHeNnEJqq@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-14-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517145302.971019-14-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_084821_447171_21CA3873 
X-CRM114-Status: GOOD (  15.58  )
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

On Fri, May 17, 2024 at 04:52:53PM +0200, Cl=E9ment L=E9ger wrote:
> Add parsing for Zcmop ISA extension which was ratified in commit
> b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index a5836fa6b998..aaaf23f204ac 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -85,6 +85,7 @@
>  #define RISCV_ISA_EXT_ZCB		76
>  #define RISCV_ISA_EXT_ZCD		77
>  #define RISCV_ISA_EXT_ZCF		78
> +#define RISCV_ISA_EXT_ZCMOP		79
>  =

>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  =

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3bb2ef52a38b..0a40fa1faa04 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -290,6 +290,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zcb, RISCV_ISA_EXT_ZCB, riscv_ext_zca_dep=
ends),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zcd, RISCV_ISA_EXT_ZCD, riscv_ext_zcd_val=
idate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zcf, RISCV_ISA_EXT_ZCF, riscv_ext_zcf_val=
idate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zcmop, RISCV_ISA_EXT_ZCMOP, riscv_ext_zca=
_depends),
>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
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
