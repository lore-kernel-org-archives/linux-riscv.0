Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B92CD41C31
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gjAg5cKOpu5inAyjbF+oIHD0RsZuEzMuS7+se7bKTM=; b=YI4+TaicNVNdhF
	0MunUhaK/a92UX70Mdxq4ghU8aTBrOtttKoS5At4kdbWOAz5pWWNxrXFuLg/FuCcftHWbNsREisTW
	dXnbz6ngD3ZrY/HNOrvj3b8B5uHkEO0aQK6/yVsZ8jkSaJt558YFwuw0+hqUL7Q3PavgKmu1g+cne
	REUavCniOvDD16+sJjTl2klWKrKxfBqyuD8zoPsYVn2zyGHUOLc6I8khybPAJOy4AJQQPrQEbH6Mh
	4TWN/PvUWEIPRAx7ax2lPN6fkeMIVSimSlWERxAr9g2ekfeZS08q8sd77xGvvokfTBxbTcvPNoj7t
	qRqLuZDP7YoGQ/i7PaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAf1-00000006S3U-3V5W;
	Wed, 13 Nov 2024 10:31:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAQz-00000006PU3-0tta
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 10:17:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43152b79d25so56336755e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731493031; x=1732097831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AxQc/6JzX+bVntyRqks8Ynj98edYqN+3zKe8bi5kzlU=;
        b=JF/lN/c+zFR20fvphWCj6dMnEbWB2vw5H77tXzJR2PR4hTgfEYw7XwER6exombl3pW
         mVhtdZIS7ghM4IlmXm4iSHueBpEAsI3qX02gMbBzN3jrQGlziueAaw4qJLn0Ibnm3lXs
         MnwlslS0D82VfLyxOwDL746QWzv/nteoq/25VgDwfRQc0vhKsbRni7dyiq6NTZiEnYel
         R3oUBbrQy4U/MgrVAwM5KT/OI67IVwaQ9j2nCBa1RbNf4pSsDPniedW+IaybzAH7mpME
         B0QoYkG5AZiHDi00vjHLhbi0f2OzUXUxtXUqtRqXOwkYiV4v+q2g/A8cq5SfbHz2PRAt
         EKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731493031; x=1732097831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxQc/6JzX+bVntyRqks8Ynj98edYqN+3zKe8bi5kzlU=;
        b=dwGmOmxpxWIxbP3lSilCr0wUMap0bR/Ock8TC7QaTsSDcPS7Fz3ztC6o6EbbHkeAtO
         na+wDJBI7NS9jC24P3wwFtFVhupMGZ7aeWGtXgmwKnCyAIlIgSXfq4Bl1wFTJV2wiXr0
         6x37BGW0DkOxxO89T2UK1aL2JsXA/3sDIjtbGvqZXrHa0IE/BDPVgD9GlY0RvzWFhiNU
         Tv0qMIpZElrRKPf4dkEr/IbE1b9xMnrzgdK0mLfssSQMkfgdRuNmuZmJjAf9P+RR70ZW
         CQU6o60u+ig0ckAHriOigPqlAQPXeFhlYj7caeotB600VnowIKeSoOg0K0jPsskQc3FG
         C7FA==
X-Gm-Message-State: AOJu0Yz2UZXLCS/OTBJMB6XfIJbHRt3rQGlNmdgVk209MuSp8wmpgl2v
	oFaK8EWhPggaOXY8gdIbzr7rA9yzkxWKJlP/nmhmsZpam1t0vWg3xmHYvgtSj5qrX1j4uHHzk0b
	K0Tc=
X-Google-Smtp-Source: AGHT+IG7oEciMK4MhHVevETRhf7AJ6uAKDnwOVrD06tLU5RETzW+R4Zk5MMQHJMXJL7RnCESQjT51A==
X-Received: by 2002:a5d:5d89:0:b0:37d:4f54:f9c8 with SMTP id ffacd0b85a97d-3820df6761amr1845914f8f.33.1731493031089;
        Wed, 13 Nov 2024 02:17:11 -0800 (PST)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99681csm18334860f8f.49.2024.11.13.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 02:17:10 -0800 (PST)
Date: Wed, 13 Nov 2024 11:17:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [PATCH 3/3] riscv: insn: add RV_EXTRACT_FUNCT3()
Message-ID: <20241113-c53841e015159bbf656643ae@orel>
References: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
 <20241113091703.3133017-4-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113091703.3133017-4-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_021713_276186_B066A87B 
X-CRM114-Status: GOOD (  16.61  )
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

On Wed, Nov 13, 2024 at 09:17:03AM +0000, Ben Dooks wrote:
> Add extraction for the func3 field of most instructions
> for use with anyone who needs it.
> 
> Note, added this for decoding of CSR accesses for
> work we did looking at the RDCYCLE v RDTIME calls.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/include/asm/insn.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 09fde95a5e8f..c67f44ff2066 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -299,6 +299,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>  	({typeof(x) x_ = (x); \
>  	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
>  
> +#define RV_EXTRACT_FUNCT3(x) \
> +	({typeof(x) x_ = (x); \
> +	(RV_X(x_, RV_INSN_FUNCT3_OPOFF, RV_INSN_FUNCT3_MASK)); })
> +
>  #define RV_EXTRACT_UTYPE_IMM(x) \
>  	({typeof(x) x_ = (x); \
>  	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
> -- 
> 2.37.2.352.g3c44437643
>

It doesn't hurt to have an unused macro and there's a reasonable chance
there will be a user someday, but I'd typically wait for a user before
adding stuff. Anyway,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
