Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F60AC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QKzIXQ7E0JCqYgeWTiRSof6X1hDhGMwgUdEw54e3yA=; b=l0g254wX1xZwUL
	0boV+ESOaWFCUp5Jo1P5O87TxE0KzrDJk0vLwxEHTTVnEWj/wBh0by5+znsI1MtrRt5nSmqI1qUyy
	/HV4/wIc0bphp9wHIk0KEVo75A94e8eqyqx1m8ZYPpLPeXuZ5jbbgsRvETOC1tj1CkC12RahOFw1l
	zZBquXU/1B1XcRt3O+8IERAYpI09gDii1Sw21RZV08JwOyCJBPs7v1xZXzwfAuuCH4Mj36oLgjsxg
	iKQ0EeIhv6EmkmRxQ7Z4aZMIMWx+k8pUFKPytgyKG+VaclMzuZ+oJS5j4cb/JmssB1gcDJWv6Ukij
	9J5X2QGnc/LokkW14Mdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm51-0000000Ee1h-3hWm;
	Thu, 14 Mar 2024 14:29:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm4z-0000000Edyv-1PqL
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:29:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33ec7e38b84so448101f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710426546; x=1711031346; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbWbnFqFcxqkfsdDIzVbGRGYMN0ey69wKPUvvi1/HTk=;
        b=IsQsUs/Lt7GN28QukdPY8P/xm5ulrYDlGy3Ghk7hQYA9KojeejRu5LSOzn8paktojo
         tgvRaiK81DGtIyJFjk26P+l+y7khRWaFLQFGJtgVwWtQp7mH8T04Dm/U3sTRspTBFL+U
         uAi/Q4EyAJdIL8rjILFF0tFHeddkmc1csWu4ntSzLpJp3EJds4E5hnXDULD1xJSDWwNT
         oPePzGCQheyVNnU+SmO467+8+TvSxr5O4zCuWSJRpHSPYZ43V5WRB9yP63vzrTX6kgDV
         tfWeTXXbTLLck4DdCYL9srWGsiIR5BjsSq4Vyc08Hzbh1PHgkiUIu/IH6PnR26VLPfxP
         Qb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426546; x=1711031346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbWbnFqFcxqkfsdDIzVbGRGYMN0ey69wKPUvvi1/HTk=;
        b=iw4+qHkyUmfqjpTBMQcgflY39p9FtSPpsXINqhcZ5gDvsVR1EHck7ZGF1EUZKgKMg0
         tB+/CVOGLo/S8YhUzJpgrf7O6vdGGMoMeAkVGumOKFIodvNipFP82PCPDYXZQICCgq6L
         E1Z9l6qlmuPQ0qfytrMB2Lrt7h8MWfYzvod9ce8fGIIuB8Dn5YFme8UvSPao9ipAlxqh
         tvF3hQJztslvzBmgK5s5/Vqb760808YLwwdLlrpuVOTgykM1V4b/r6FONatqw7a0U3lC
         RVDW7+nkrLtPKlwgW1TUTme86y/Ol85HGlcbIdiedz6sXZNBxwAf/t2N48/2ShLYcllU
         RSPg==
X-Forwarded-Encrypted: i=1; AJvYcCWsbWiPT+hAgK1l8irKRb918ioFH2HstCNl10u0rdc9o3e4hcQo/8kjE3Ku6G+LyX9NkKVWcdWZq8859sB9d434PRLPnIuzZLJgotX7CMmO
X-Gm-Message-State: AOJu0YwqpHOPOslZxGYeuRnKKfnCqNJOCLIVaJitlJuMdiwX5AW1YYyD
	YLZmt//XmmBU5IyYy320/k6hcc5j1JJs9WM+q1h7aIkgCfv57+5RZxm3atZECS0=
X-Google-Smtp-Source: AGHT+IEFJC3eV05L1hTDs8HZhZF3XOgLBa8DjaxZxdayetOHeSCXloemj3z/yiRwlOTgnlYdqt77rQ==
X-Received: by 2002:adf:e7ca:0:b0:33e:c9bd:c965 with SMTP id e10-20020adfe7ca000000b0033ec9bdc965mr1089990wrn.35.1710426546553;
        Thu, 14 Mar 2024 07:29:06 -0700 (PDT)
Received: from [192.168.1.78] (host-92-17-96-232.as13285.net. [92.17.96.232])
        by smtp.gmail.com with ESMTPSA id q2-20020a05600000c200b0033dedd63382sm854067wrx.101.2024.03.14.07.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:29:06 -0700 (PDT)
Message-ID: <9fdd04e8-cc7b-41e7-a099-055f39b3b462@linaro.org>
Date: Thu, 14 Mar 2024 14:29:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Update Devicetree
 identifiers
Content-Language: en-US
To: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org,
 linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-mediatek@lists.infradead.org
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-2-git-send-email-quic_amrianan@quicinc.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <1710418312-6559-2-git-send-email-quic_amrianan@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072909_417828_68B93A05 
X-CRM114-Status: GOOD (  23.08  )
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



On 14/03/2024 12:11, Amrit Anand wrote:
> Update existing documentation for qcom,msm-id (interchangeably:
> qcom,soc-id) and qcom,board-id. Add support for qcom,pmic-id, qcom,oem-id
> to support multi-DTB selection on Qualcomm's boards.
> 
> "qcom,soc-id", "qcom,board-id" and "qcom,pmic-id" are tuples of two 32-bit
> values. The "qcom,oem-id" is a tuple of one 32-bit value.
> Introduce macros to help generate SOC, board, PMIC and OEM identifiers.
> QCOM_SOC_ID and QCOM_SOC_REVISION can be used to generate qcom,msm-id.
> QCOM_BOARD_ID and QCOM_BOARD_SUBTYPE can be used to generate qcom,board-id.
> QCOM_PMIC_SID and QCOM_PMIC_MODEL can be used to generate qcom,pmic-id.
> QCOM_OEM_ID can be used to generate qcom,oem-id.
> 
> Add entries for different types of SoC, boards, DDR type, Boot device
> type which are currently used by Qualcomm based bootloader.
> 
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 86 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 77 insertions(+), 9 deletions(-)
> 
> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
> index f724834..dc24151 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -8,9 +8,14 @@
>  #define _DT_BINDINGS_ARM_QCOM_IDS_H
>  
>  /*
> - * The MSM chipset and hardware revision used by Qualcomm bootloaders, DTS for
> - * older chipsets (qcom,msm-id) and in socinfo driver:
> + * The MSM chipset ID (soc-id) used by Qualcomm bootloaders,
> + * and in socinfo driver:
> + * where, "a" indicates Qualcomm supported chipsets, example MSM8260, MSM8660 etc
>   */
> +
> +#define QCOM_SOC_ID(a)  ((QCOM_ID_##a) && 0xffff)

How is QCOM_SOC_ID(SC7280) ever better than QCOM_ID_SC7280? What does
this mask give you? It's going into a 32-bit field and not being OR'd
with anything else...
> +
> +
>  #define QCOM_ID_MSM8260			70
>  #define QCOM_ID_MSM8660			71
>  #define QCOM_ID_APQ8060			86
> @@ -266,16 +271,79 @@
>  #define QCOM_ID_IPQ5302			595
>  #define QCOM_ID_IPQ5300			624
>  
> + /* The SOC revision used by Qualcomm bootloaders (soc-revision) */
> +
> +#define QCOM_SOC_REVISION(a)		(a & 0xff)
> +
>  /*
> - * The board type and revision information, used by Qualcomm bootloaders and
> - * DTS for older chipsets (qcom,board-id):
> + * The board type and revision information (board-id), used by Qualcomm bootloaders
> + * where, "a" indicates board type which can be either MTP, QRD etc
>   */
> +
>  #define QCOM_BOARD_ID(a, major, minor) \
> -	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | QCOM_BOARD_ID_##a)
> +	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | ((QCOM_BOARD_ID_##a) & 0xff))
> +
> +#define QCOM_BOARD_ID_MTP		0x8
> +#define QCOM_BOARD_ID_LIQUID		0x9
> +#define QCOM_BOARD_ID_DRAGONBOARD	0xA
> +#define QCOM_BOARD_ID_QRD		0x11
This replaces the previous definition of QCOM_BOARD_ID_QRD which was
decimal 11, now you're defining it as hex 0x11? I'm guessing this was a
typo.
> +#define QCOM_BOARD_ID_ADP		0x19
> +#define QCOM_BOARD_ID_HDK		0x1F
> +#define QCOM_BOARD_ID_ATP		0x21
> +#define QCOM_BOARD_ID_IDP		0x22
> +#define QCOM_BOARD_ID_SBC		0x24
> +#define QCOM_BOARD_ID_QXR		0x26
> +#define QCOM_BOARD_ID_X100		0x26
> +#define QCOM_BOARD_ID_CRD		0x28
> +
> +/*
> + * The platform subtype is used by Qualcomm bootloaders and
> + * DTS (board-subtype)
> + * where, "a" indicates boot device type, it can be EMMC,
> + * UFS, NAND or OTHER (which can be used for default).
> + * "b" indicates DDR type which can be 128MB, 256MB,
> + * 512MB, 1024MB, 2048MB, 3072MB, 4096MB or ANY 
> + * (which can be used for default).
> + */
> +#define QCOM_BOARD_SUBTYPE(a, b, SUBTYPE) \
> +	(((QCOM_BOARD_BOOT_##a & 0xf) << 16) | ((QCOM_BOARD_DDRTYPE_##b & 0x7) << 8) | \
> +	(SUBTYPE & 0xff))
> +
> +/* Board DDR Type where each value indicates higher limit */
> +#define QCOM_BOARD_DDRTYPE_ANY		0x0
> +#define QCOM_BOARD_DDRTYPE_128M		0x1
> +#define QCOM_BOARD_DDRTYPE_256M		0x2
> +#define QCOM_BOARD_DDRTYPE_512M		0x3
> +#define QCOM_BOARD_DDRTYPE_1024M	0x4
> +#define QCOM_BOARD_DDRTYPE_2048M	0x5
> +#define QCOM_BOARD_DDRTYPE_3072M	0x6
> +#define QCOM_BOARD_DDRTYPE_4096M	0x7
>  
> -#define QCOM_BOARD_ID_MTP			8
> -#define QCOM_BOARD_ID_DRAGONBOARD		10
> -#define QCOM_BOARD_ID_QRD			11
> -#define QCOM_BOARD_ID_SBC			24
> +/* Board Boot Device Type */
> +#define QCOM_BOARD_BOOT_EMMC		0x0
> +#define QCOM_BOARD_BOOT_UFS		0x1
> +#define QCOM_BOARD_BOOT_NAND		0x2
> +#define QCOM_BOARD_BOOT_OTHER		0x3
> +
> +/*
> + * The PMIC slave id is used by Qualcomm bootloaders to
> + * indicates which PMIC is attached (pmic-sid)
> + */
> +
> +#define QCOM_PMIC_SID(a)		(a & 0xff)
> +
> +/*
> + * The PMIC ID is used by Qualcomm bootloaders to describe the ID
> + * of PMIC attached to bus described by SID (pmic-model)
> + */
> +
> +#define QCOM_PMIC_MODEL(ID, major, minor) \
> +	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | (ID & 0xff))
> +
> +/*
> + * The OEM ID consists of 32 bit value to support OEM boards where they
> + * have slight differences on top of Qualcomm's standard boards
> + */
> +#define QCOM_OEM_ID(a)		(a & 0xffffffff)
>  
>  #endif /* _DT_BINDINGS_ARM_QCOM_IDS_H */

-- 
// Caleb (they/them)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
