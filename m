Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7665C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=podjcZXm46eIh7KY3y5FOVsfUt13XafQbg6v4hXTeuk=; b=3mucHsY+afSt6T
	bYLMq0uF5sEypZSFKdUwzW84QbrKDoyRzN6Am1WO/D0QlaqtEXq1q5/20usAcA/JC5ikUGfruAqvJ
	A1diVp9JaOEVrprX7BHlRZLpHx1ovpaHuMsAN5jl10dy+9vEu/0g/A95IGK2T1oEe/nMUzR99w46M
	jR8ZEFKhz/HNi/dPA6TsUXb1W4PoxfK3fBQtfn0oFepcx1HYoSMi+nsNhqpbR/3O6PWmHYpXdsjxw
	OimBDDlPPcur4wBcvP1yFv/yGocYIvi6y2EaKrKlT3btUtQ2boY0ciTfwfhbKbHmOs7pMDLh6WIz/
	ROhfwcEUliKPrNTlLfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pf-00000005r8D-3XP2;
	Tue, 24 Jun 2025 14:14:15 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3zk-00000005lfI-3Mn6
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:47:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4530115f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772847; x=1751377647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ycq0kX3Vn1ZpP7yxI/jdDggIlJCstgVkDpgaYIcdwgY=;
        b=gcoHkq15RRXCuJ19UwOdDmcuBQEhZei3RubzsGZCKQxCB4Fdgld0OMukw+D0WXewSS
         mnR2cvooIDxSf4or2cJamrLP97nIVDfbm7DtjLrx8iV+urMN8nIEmcgHlzY6wEd0RTCL
         WDEFfbBEhlQWJlh4v0+P3wh7qmfd24jiY2Gz/gvMU6vJfadbW7sWf0K34qRBAItpnaen
         VBFeneOZb29GMnnapiRJ7zqluNMvXPE6fw+RqJ41RVbjtOin6082RFSvmxc3nWpuRLSd
         SVCyUGwhyA63zs38+rbs6nDoR7OgCbHMDJB4AFvqXhKWYijVdhkn8lAzqL0RoSZVuVo3
         /zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772847; x=1751377647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycq0kX3Vn1ZpP7yxI/jdDggIlJCstgVkDpgaYIcdwgY=;
        b=E0cnuaZa2UxfXQfiYr93OdH8qBBY1kjwijgiJDWNYTZp7kjO+llREx1xvLDTOfbWcq
         zrK+K1roGAwcixUzmVBuPOuSdYZJtKSe9ZC7o2kkj9e8Z4bkfFZD9xFko1U3KPpfSCTw
         ORr27+bP/cHCofnsLCoIKM1wWlbTir8vvXcu07xfKysMEuDY4DWnkCsgUsWy3pIMqdYL
         TFMYdXHPY5y/kjKU1BRcZB98+BFi7esC12nqW62sHN6f6ZCGCUFA/BwGlMwJTE0xUDbL
         DJ+tx8Yl/orMBRkYHOYyWeJRaLv5wLyHtNirg33Oxxrm7fBWnmzWZzkPgte1/M4ButDm
         ztqg==
X-Forwarded-Encrypted: i=1; AJvYcCVTpi2NMOJeffk4OnPz3pYbqRnLkW7y39dBPovet74cuT9odafB62QJwN0MZMHD/WLf0TD0r6YIHs1UEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtKMy3Bt8OK3MOxR+J/Vqo6/33wTT4JiVyoxLWW4BxYeCZN5Vh
	kuX+Vcy+X0kvsLJ00kO48cQ03PEtv3cMRaLGWq9lOZjDpbb9udTgE48LxVO8f6Zupks=
X-Gm-Gg: ASbGncuIuCMsSmBhEYX7MSxtWwg6IHYfx0fxIIrh24QRFKjCBJ2xmtYQI475vsBvRd3
	OggvKKoHlQWuUWilqC0KD4OXBfHveNvOQrzNwwZxBi960zVep/GOhXzKGTBJUFu8bb6kCW5Yn4N
	39QCr/77n78Dcn5Y7y4ivhv9ta44HDtrNwQZpffUyMpiVELqKbsbfJBtCA2DGf6nYZTSdVK74FS
	Ap0dQqmp7Ld2WMXn6dpHHezDpxAp+axBcyFAP8tIggpUUzTSJfe36v0GnnH5ov7xhyCEbpHeRNi
	T/nzn1Pd+FVh2JkKN8nbrIYgNNNwCnPRnGzTseYiiSLeyCd0xQ==
X-Google-Smtp-Source: AGHT+IHb76B6ik9Yt3pkD/SAdLPqXg65db3i1R0WxXLtr/BPlZTDKztKX7BSnwY0vPSiL+IcBDUqLw==
X-Received: by 2002:a05:6000:2211:b0:3a4:ed62:c7e1 with SMTP id ffacd0b85a97d-3a6d12c455cmr12967179f8f.12.1750772847157;
        Tue, 24 Jun 2025 06:47:27 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f259dsm2035419f8f.50.2025.06.24.06.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:47:26 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:47:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 5/5] KVM: riscv: selftests: Add bfloat16 extension to
 get-reg-list test
Message-ID: <20250624-044127e80c3700d93f114280@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <65752029ed1ae331a9ac867a6fef2e63a797569e.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65752029ed1ae331a9ac867a6fef2e63a797569e.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064728_858345_307AEF4D 
X-CRM114-Status: GOOD (  14.83  )
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

On Tue, Jun 17, 2025 at 09:10:50PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The KVM RISC-V allows Zfbfmin/Zvfbfmin/Zvfbfwma extensions for Guest/VM
> so add them to get-reg-list test.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index ebdc34b58bad..e5a07e000b66 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -80,6 +80,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCF:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCMOP:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFBFMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
> @@ -104,6 +105,8 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFBFMIN:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFBFWMA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFH:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFHMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKB:
> @@ -535,6 +538,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZCF),
>  		KVM_ISA_EXT_ARR(ZCMOP),
>  		KVM_ISA_EXT_ARR(ZFA),
> +		KVM_ISA_EXT_ARR(ZFBFMIN),
>  		KVM_ISA_EXT_ARR(ZFH),
>  		KVM_ISA_EXT_ARR(ZFHMIN),
>  		KVM_ISA_EXT_ARR(ZICBOM),
> @@ -559,6 +563,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZTSO),
>  		KVM_ISA_EXT_ARR(ZVBB),
>  		KVM_ISA_EXT_ARR(ZVBC),
> +		KVM_ISA_EXT_ARR(ZVFBFMIN),
> +		KVM_ISA_EXT_ARR(ZVFBFWMA),
>  		KVM_ISA_EXT_ARR(ZVFH),
>  		KVM_ISA_EXT_ARR(ZVFHMIN),
>  		KVM_ISA_EXT_ARR(ZVKB),
> @@ -1138,6 +1144,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zfbfmin, ZFBFMIN);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
> @@ -1162,6 +1169,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(ztso, ZTSO);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zvfbfmin, ZVFBFMIN);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zvfbfwma, ZVFBFWMA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvfh, ZVFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvfhmin, ZVFHMIN);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvkb, ZVKB);
> @@ -1213,6 +1222,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_zcf,
>  	&config_zcmop,
>  	&config_zfa,
> +	&config_zfbfmin,
>  	&config_zfh,
>  	&config_zfhmin,
>  	&config_zicbom,
> @@ -1237,6 +1247,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_ztso,
>  	&config_zvbb,
>  	&config_zvbc,
> +	&config_zvfbfmin,
> +	&config_zvfbfwma,
>  	&config_zvfh,
>  	&config_zvfhmin,
>  	&config_zvkb,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
