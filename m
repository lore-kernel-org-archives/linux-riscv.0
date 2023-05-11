Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317CCC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 00:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0jqBoV6M1RXP12x7gw61N1ffV6HfvZo16CbDBXzzzZI=; b=ZnQVqYlbFZlf9cW85jD7wAQyzp
	9bjKW/5tXl6udQtslGwtbS7QIAWaqEjh1NF6j6iGySx1XB5lpDHLclxlZXxJeZWIJoY1ZV3cJTzbU
	eJWZsMq/1vBNvYGGaEHyCgoBLbOTfetwAlsNId99+6wGPLyhd5+P2eDkcDViiHCDv9IAiOh6TNYon
	u15KFJGvX1tdN+982u3GuZAPEbgr25MBJnM6T12M/BMHgjZYHLkpSdgnsCedvj2fZ7YS/HF3V41Sv
	Avpm5KNy5gZFeNHB9q5198OxEbAv7STrqNVNKko8QOmjM+cpdSMI36tWUXVh1G6uSDbgoHApBtnKN
	t28B1t4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxGDj-00AQWq-0D;
	Fri, 12 May 2023 00:01:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFDD-00AGaP-1r
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:56:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64359d9c531so6944657b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683845797; x=1686437797;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g32l86VlbBpmE6n5rf0sdhxv94KQRlfB8e5whYpMZ+o=;
        b=jcFT25rQ6v6RvN2QLECiOC1IK/LczGtjCtk6QrCXkb+PZAtqKNknB00Kqv+FfvZ3rQ
         GpFqo5imEAVdAbdP7DcuQ++zyQd3CXTegnsQbplLJ4fUVdKs2HXKDLhNVlCG8rb0SyD0
         OHgR7J4h2NcVZgyB+yp3QmT0FRnXv5m4udyaDJxcdF35u4DKy5v29pLABmkguFrD4I23
         V1j3XsxUdYITDXvxY4WfR+2vAxyqPMtvihq2rMjPLt/LteTWS+Mwo8zb93Ff4yWDOQ82
         ONU/0ais8VW+w1vAtcnFiQQRasapbElWODz31jMWP8GLHeZMPxv51qab0+Emp/Sr31Zc
         ng+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683845797; x=1686437797;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g32l86VlbBpmE6n5rf0sdhxv94KQRlfB8e5whYpMZ+o=;
        b=IoAtHYBkMfT8TZOWWqIZ9BhZE1sQ+9FfJVQ4vLdR7AhnnfZ32/TdSQnXPh5k7FGRDo
         Z8vc5uPPd2uyvaEjerdb0Zw5eTKm+LHMJwfI8B6egNVwxLdjt/PMb4HPudp1KUJcKNG+
         OSZENcBCdJgQlbMbmfptNWPMGlhn0OuOSfpdSQttCT9hPPwXLu3NXQv3sY4kdvYQR0Zv
         xt/eql1nr170l7SE8Jg/nzIgUSStQRgsof4nXzElMy36oraU/g+4043g4p73Rh5l87Uv
         I63ekn1WDgigJJnc73ov1FXOXzExVc6/m1KOm4unzio3L6vvjTeAvOCKYba6+sbl5acN
         tPQg==
X-Gm-Message-State: AC+VfDxfd+9Tb+agCZ1UI0E+KpRtp9I6eKIkESUkwxUvV8OkTlHd5qCj
	Vui8F5xgdT0q7fwpWQIJO4mHaK+7V9m5tJUnpag=
X-Google-Smtp-Source: ACHHUZ66CSa9VhqS1Aiii6WTwqwoJANRTdZgceyto+F1I9aEq7TVhTb/R0r/oe+DaGg1qA6H7Y8W+g==
X-Received: by 2002:a05:6a00:1acb:b0:646:8a8:9334 with SMTP id f11-20020a056a001acb00b0064608a89334mr20106119pfv.20.1683845797443;
        Thu, 11 May 2023 15:56:37 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id k4-20020aa792c4000000b0063aa1763146sm6008689pfa.17.2023.05.11.15.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:56:36 -0700 (PDT)
Date: Thu, 11 May 2023 15:56:36 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 15:40:02 PDT (-0700)
Subject: Re: [PATCH -next v19 04/24] riscv: Add new csr defines related to vector extension
In-Reply-To: <20230509103033.11285-5-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
  kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com, andy.chiu@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, apatel@ventanamicro.com,
  Atish Patra <atishp@rivosinc.com>, guoren@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-18df71ab-832b-4312-9319-52ae8b3da0d8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_155639_614626_FE43372F 
X-CRM114-Status: GOOD (  13.38  )
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

On Tue, 09 May 2023 03:30:13 PDT (-0700), andy.chiu@sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> Follow the riscv vector spec to add new csr numbers.
>
> Acked-by: Guo Ren <guoren@kernel.org>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b6acb7ed115f..b98b3b6c9da2 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -24,16 +24,24 @@
>  #define SR_FS_CLEAN	_AC(0x00004000, UL)
>  #define SR_FS_DIRTY	_AC(0x00006000, UL)
>
> +#define SR_VS		_AC(0x00000600, UL) /* Vector Status */
> +#define SR_VS_OFF	_AC(0x00000000, UL)
> +#define SR_VS_INITIAL	_AC(0x00000200, UL)
> +#define SR_VS_CLEAN	_AC(0x00000400, UL)
> +#define SR_VS_DIRTY	_AC(0x00000600, UL)
> +
>  #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
>  #define SR_XS_OFF	_AC(0x00000000, UL)
>  #define SR_XS_INITIAL	_AC(0x00008000, UL)
>  #define SR_XS_CLEAN	_AC(0x00010000, UL)
>  #define SR_XS_DIRTY	_AC(0x00018000, UL)
>
> +#define SR_FS_VS	(SR_FS | SR_VS) /* Vector and Floating-Point Unit */
> +
>  #ifndef CONFIG_64BIT
> -#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
> +#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
>  #else
> -#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
> +#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
>  #endif
>
>  #ifdef CONFIG_64BIT
> @@ -375,6 +383,12 @@
>  #define CSR_MVIPH		0x319
>  #define CSR_MIPH		0x354
>
> +#define CSR_VSTART		0x8
> +#define CSR_VCSR		0xf
> +#define CSR_VL			0xc20
> +#define CSR_VTYPE		0xc21
> +#define CSR_VLENB		0xc22
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS	CSR_MSTATUS
>  # define CSR_IE		CSR_MIE

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
