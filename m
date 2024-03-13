Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C5C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 04:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xv8WQRy4fFJJXeuj8Q5HC1+noWup7PnWMLQV+3jAxQ=; b=h6AiiUdjELZrf/
	z4hwPb3oKE1YHUtL8JcxdQQkXrQMoakUlHrSDockgY5RweGLB6X3NzPuCPt3yyvSimxpq9ZSFUVYX
	rfKZeDgfxY0ILFq6rXJ8W9z9+1s83bHc84GoyEDKzTwK3Skqc1HoeEttgfa10gGWRtjoq/jzdN5fE
	SsFX/juwitZI+tGQHk0IwcB4eqUVKmcwA3BNRe9k13e6iTHSFK93QLkRznmRA/dqWzBbPizAu/jtI
	GkayIkkjJh0kVvqI6eDPhxpuuRLI9hh1hZuDLTpJOBJ9i815oSnmQxHD1OCc0t5FNuVt7rk0iNmHj
	qk6gr+gHiMnTIl08Y7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkFns-00000008jCn-0nRT;
	Wed, 13 Mar 2024 04:01:20 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkFno-00000008jC3-3oJJ
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 04:01:18 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7884a9a404fso347856985a.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710302475; x=1710907275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Rzr+bvZgdOj5tYFQZyjeoMw3eFJ1jSQieYWC1Vh5ms=;
        b=HJ/emohvqaTGth95xIVEStVT2X7HbDo/xlopqESU7nKMO+WfCT60vGOxwrrf2fJdi+
         TjwEezyRvPXHO8eKuL1Me9zh3hQL/gg9d0VOt/w4PnpSp0x2C6L6xzr+lFzRDXS400R5
         HwobSYLTiJQCW/Sfn4fgl8V0EKaXk0EiOmIjN0CM2+i3wwfgvwQRNKSv5lA1jOPhDRsc
         E2IHzZ4qyZExb/zzNyvv8QZ71RfkU4NhyTOsW6QEr+yT7Gr0rgt5+hHD1gWx89Q38Dsh
         SaVBg7w4TYoCQfhFGeXh4bqA7UBuaC+pXFYhAVk9Hgj/8r5ekG4X4p2HEf1IbmqoP04f
         CWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302475; x=1710907275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Rzr+bvZgdOj5tYFQZyjeoMw3eFJ1jSQieYWC1Vh5ms=;
        b=dpk7OPe8sAY8cYhr8nXGnml/26/lIIyzPUBdumNlKMdAz5KtHHyMMBjaa9g0Kxgy7k
         lMRg2O/I5OyH1ad2agNksXgw1uzCfGh580p/Giw2LE+5TD+EEtDAy3/XLxoHkxSBu9fv
         DToFY+SeABh7teZpNYHmXkFZ/8agsJz2ufjw93sLgq54Db1Fw5wUhMSvrubAyZNGazDw
         mVkLtEvT7jb7T80VscG6eS9stFodZ8B7pGfAwbIm+2r23uS6VIsPVfYjKz2YYvY5VXeT
         0i9jHz9eoOdvgLltZNy4KuAnfLCE8O+UPxIVz429p0DHFVURjPbhNDA2axa9BLYz96cY
         6pyg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9U1Jv41SzFY/TsxgsYj+tn2OtN2h+u4GEtz6ESsOTpKgR5vBipPEkptsLA5aVD94hQFVsiwbn9iPDLWl2b/eVuxnG3t42gOoj1a3DBy2
X-Gm-Message-State: AOJu0YyjQVQz/JiavZGDCT9IXJhzmf3rtLJYaQltg9y4405rAX3oVOk+
	e7PvzdDYGI4OeJVEIRDmntqGorIQyl9Xz9C0Yx2ijhLIqzaw3o9ufUrcPPK94pc=
X-Google-Smtp-Source: AGHT+IFzDOtdRF9fWBMVmCgTTM/aQwvp9k62fzH/7nbkfyxZ4A3ZCA/MH653nTZAfYtNfNMq+10QCQ==
X-Received: by 2002:a05:620a:40c8:b0:788:2c33:5694 with SMTP id g8-20020a05620a40c800b007882c335694mr17272383qko.78.1710302475147;
        Tue, 12 Mar 2024 21:01:15 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id w23-20020ae9e517000000b00787ce45ed49sm4328337qkf.67.2024.03.12.21.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 21:01:14 -0700 (PDT)
Message-ID: <ca9e6689-4d7e-4428-8b2e-e732923d1001@sifive.com>
Date: Tue, 12 Mar 2024 23:01:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1, 4/6] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa
 detection
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
 <20240312123627.9285-5-andy.chiu@sifive.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240312123627.9285-5-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_210117_004962_3DB31C9C 
X-CRM114-Status: GOOD (  16.78  )
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

Hi Andy,

On 2024-03-12 7:36 AM, Andy Chiu wrote:
> Multiple Vector subextensions are added. Also, the patch takes care of
> the dependencies of Vector subextensions by macro expansions. So, if
> some "embedded" platform only reports "zve64f" on the ISA string, the
> parser is able to expand it to zve32x zve32f zve64x and zve64f.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/hwcap.h |  5 +++++
>  arch/riscv/kernel/cpufeature.c | 41 +++++++++++++++++++++++++++++++++-
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5340f818746b..24efea44f1ab 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -80,6 +80,11 @@
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
> +#define RISCV_ISA_EXT_ZVE32X		74
> +#define RISCV_ISA_EXT_ZVE32F		75
> +#define RISCV_ISA_EXT_ZVE64X		76
> +#define RISCV_ISA_EXT_ZVE64F		77
> +#define RISCV_ISA_EXT_ZVE64D		78
>  
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 8986ceb58188..3aa0df3f3b41 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -201,6 +201,40 @@ static const unsigned int riscv_zvbb_exts[] = {
>  	RISCV_ISA_EXT_ZVKB
>  };
>  
> +#define RISCV_ISA_EXT_ZVE32F_IMPLY_LIST	\
> +	RISCV_ISA_EXT_ZVE32F,		\
> +	RISCV_ISA_EXT_ZVE32X,
> +
> +#define RISCV_ISA_EXT_ZVE64F_IMPLY_LIST	\
> +	RISCV_ISA_EXT_ZVE64F,		\
> +	RISCV_ISA_EXT_ZVE64X,		\
> +	RISCV_ISA_EXT_ZVE32F_IMPLY_LIST
> +
> +#define RISCV_ISA_EXT_ZVE64D_IMPLY_LIST	\
> +	RISCV_ISA_EXT_ZVE64D,		\
> +	RISCV_ISA_EXT_ZVE64F_IMPLY_LIST
> +
> +static const unsigned int riscv_zve32f_exts[] = {
> +	RISCV_ISA_EXT_ZVE32F_IMPLY_LIST
> +};
> +
> +static const unsigned int riscv_zve64f_exts[] = {
> +	RISCV_ISA_EXT_ZVE64F_IMPLY_LIST
> +};
> +
> +static const unsigned int riscv_zve64d_exts[] = {
> +	RISCV_ISA_EXT_ZVE64D_IMPLY_LIST
> +};
> +
> +static const unsigned int riscv_zve64x_exts[] = {
> +	RISCV_ISA_EXT_ZVE32X,
> +	RISCV_ISA_EXT_ZVE64X
> +};
> +
> +static const unsigned int riscv_v_exts[] = {
> +	RISCV_ISA_EXT_ZVE64D_IMPLY_LIST
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defined in
>   * chapter 27 of the unprivileged specification.
> @@ -248,7 +282,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
> -	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
> +	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),

You can use riscv_zve64d_exts here (or #define riscv_v_exts riscv_zve64d_exts)
to avoid allocating a duplicate subextension list.

Regards,
Samuel

>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> @@ -283,6 +317,11 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
>  	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
>  	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> +	__RISCV_ISA_EXT_SUPERSET(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts),
> +	__RISCV_ISA_EXT_DATA(zve32x, RISCV_ISA_EXT_ZVE32X),
> +	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
> +	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
> +	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
>  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
>  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
>  	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
