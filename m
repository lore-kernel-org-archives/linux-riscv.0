Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045F2C48BE5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 15:59:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D65613EE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 15:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D65613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hlD0HbQufdLX2FIUPa3PU6J0g/J9X3tOIomdahUd8MI=; b=D+oBOqeFnfFdSMa0HiYupVPbBB
	dxuUMiE46l7KWEcCnSEyDaBHSbEsVqUc5DzfZWssoGRNF7GhpE2zMn9ai0HcGMGqzt+Q80H9waddE
	FfZmfHkFC0wxN+GyOwWcXeCMC3OiGVVSkuVwvNWEtgq71VnAn8ahPxlLu+kplSAB/FeKU8b0xView
	9vCk+/eNpu8dlpi9I1SwSUjrKwz2arsid6y1Bntk4XvSG6eKe+/0fjNSWgivIm97yclYCeMSUs+XW
	oWVb+HC8tEFEtxNInko8MMMMrEz7Rcm/g/7vENs02kIKsndHoiIYe18o481R6Zq42YVpLQobwE4uC
	W9FFMv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrjZ8-005ts5-9w; Fri, 11 Jun 2021 15:59:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrjZ1-005tqo-3r
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 15:59:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 go18-20020a17090b03d2b029016e4ae973f7so5136959pjb.0
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=x9qSsaUpAFB/Os6BI/777CG9rv8QKiWSWRmE63/8Qoc=;
 b=iN0kfoPJsC9htZDrNNsAvtfPxKWBlM0vLridABPJLYY74flGCHlHVhyKDirOrZqh+S
 QPTKGHb8Xr6aI0CPfi4ef8sG9KNA7ydPVnMbNYms5PSq7S6iygrAQOhSdZSl7nejRF2z
 Yh3i283fhOqUhAAj226/UocjpC93SLLUS2PYIj/n8T70iNNfn0ssazErdEgaKCA00vC4
 2oHqtPV/+srocer93sn8sKjQSlgH9hpIYY9bMThT5unWrRRwpgJYKntWOUPWNsjowFlp
 eAs++xIAsZCmpJ+f0mr/5J9MXhopgVmi+1oBA6lNrDtJw+Py0Vv1TlYknqpCB4XXekKM
 xB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=x9qSsaUpAFB/Os6BI/777CG9rv8QKiWSWRmE63/8Qoc=;
 b=tU+BcnfmseeC6RUCOIOgkcyvX/BKD+RLmth/gRnDxqLbhZqP207qz4Q7A6LhMXyxFB
 9yVBQUMRd3TJzJf6DmCyHcUzrBsFA532DHjtVn+5JOF/gd45RtK5uiQM4apvHILkTYKo
 DkbJFIEJMenAkkRHtxxR0ACvC1nJQblKC/2N+EfPlLeIyUU8a9ZlXCedVFTBpnC6tQf1
 P7Osx2KXxSDl06TzyoHlshm+BGCBsltP0MAqnTGvgYsi96wS5/hsLPuTfln2dmRx/h/D
 Eztzs9QBlSFoIdq7i2VSRbnPO/KCMope2+zomYkzZ7PV7WoI4hgQA1szTaLc0vpfTLKp
 bjhQ==
X-Gm-Message-State: AOAM531rRyzwJYdjLlCt1g9dX39B4vrRria99AVkeFGc1ICiWvoVcm2l
 6RcLoekRNAAQEF5dIfl8OGpX4DVnklO26N0y
X-Google-Smtp-Source: ABdhPJzA/SBq1mxT2RCyyv3iaAg+YzjgZigNd7S+fF2gh0cCM4NVDLujp0NQQVvSCF8hRZTjo3dBOw==
X-Received: by 2002:a17:902:7792:b029:fc:e490:ff9f with SMTP id
 o18-20020a1709027792b02900fce490ff9fmr4466941pll.27.1623427155123; 
 Fri, 11 Jun 2021 08:59:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o24sm5805240pgl.55.2021.06.11.08.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 08:59:14 -0700 (PDT)
Date: Fri, 11 Jun 2021 08:59:14 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Jun 2021 20:34:58 PDT (-0700)
Subject: Re: [PATCH] riscv: alternative: fix typo in macro name
In-Reply-To: <20210531093310.17848-1-vitaly.wool@konsulko.com>
CC: linux-riscv@lists.infradead.org, vincent.chen@sifive.com,
 vitaly.wool@konsulko.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: vitaly.wool@konsulko.com
Message-ID: <mhng-fa02f293-4e19-4549-a89e-1e052b9f4298@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_085919_218485_E49F55C2 
X-CRM114-Status: GOOD (  13.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 31 May 2021 02:33:10 PDT (-0700), vitaly.wool@konsulko.com wrote:
> alternative-macros.h defines ALT_NEW_CONTENT in its assembly part
> and ALT_NEW_CONSTENT in the C part. Most likely it is the latter
> that is wrong.
>
> Fixes: 6f4eea90465ad
> 	(riscv: Introduce alternative mechanism to apply errata solution)
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 88c08705f64a..67406c376389 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -51,7 +51,7 @@
>  	REG_ASM " " newlen "\n" \
>  	".word " errata_id "\n"
>
> -#define ALT_NEW_CONSTENT(vendor_id, errata_id, enable, new_c) \
> +#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c) \
>  	".if " __stringify(enable) " == 1\n"				\
>  	".pushsection .alternative, \"a\"\n"				\
>  	ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
> @@ -69,7 +69,7 @@
>  	"886 :\n"	\
>  	old_c "\n"	\
>  	"887 :\n"	\
> -	ALT_NEW_CONSTENT(vendor_id, errata_id, enable, new_c)
> +	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
>
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
>  	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
