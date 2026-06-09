Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBDCCD8CB2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmKDwpfpfqfIhv11o3Yvwshaw0dH3ZAnqNknM28T29A=; b=PqS+Uu3r7tS9nJHM6AoOTvGgSA
	EcBZWUBAogQ1HHHWEwf5bnx9ibeIQFYEaDmXyMc32cl7kJ39r1iet9MdInUGue4k0XURJkSf8ULG7
	ByQlKJLUypewrk7eMuB0a09G+S0EX8t0dLtyln0oTvzRGE4rbevEK9Y51lBc4LmaMoHPN5mNpcEdr
	q0/DD72V4/E8vM9VSl5gYVK9WSoQeuqZ/hk56JU8JGKBoxpq5w/K+k1i7OZ7LBI+c6fYpMdgt0hi2
	y2/J4oEZlfZrZMcmBTusewvbeKtx2DXRio0uGGqcql/JsI+T9dVbYspbCScnt5pAH0GrIt0SWz2Or
	yOIlELBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1cS-00000006ECY-1se7;
	Tue, 09 Jun 2026 18:56:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1cP-00000006ECE-2Gnz
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 18:56:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so42635055ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781031368; x=1781636168; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G32fw+YDIkyZWRzyQasWU1L7Th532AaegrDAEvejK28=;
        b=e/0HhvDPzHA+porH1W79nQw2VeMPdg6bDAFW43PHDmKmdmLtTP4AFFFJduzyWQzG1p
         6N9OxsSwKt0Vd2D8N8n54lM893RKO58cFTLGzkox1sCNtOXYhvFpCxdVb3SE+0RUyhbp
         Ckaz9DeCSciT+tCVFcxyeCm01oGeU9P9295TRerWLhglwLiVIIV9ARKAWIwnP862RK4T
         Ww6d69opdbhDjppJf9MfESql5PNr5nfVGJ8+O3UUizzUrWg1NRMU9ZUdbiAasnIHRBfV
         YltiG0oSlPI+bSWxRQJPaRKYXWeun5epLo4xOoCClxuKoXS//i9A7bvF/3F2uBxtn5Pu
         jm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031368; x=1781636168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G32fw+YDIkyZWRzyQasWU1L7Th532AaegrDAEvejK28=;
        b=GWE2a4WRLoLNykpuDB+OgJ0EHZInvOdWtamCLEVlU1hc0pLvabr4srPAFfot9TiDBH
         1wS/uezZ6jRKBmQX9fZSizM+jmGq8ss57iiDOFOL1zKbPDnkjIz9vryX84BVzPAsBxr2
         PFRql7sWbadjfUtpAra7S/iNvRTVq+imdZWMyirpBhLwLfg+Op7hjG+5qoatqEo4H6Mn
         ZRLWKz3FGsf4B6nj5pZ8JkLShnlQ9A3gyKDGY1BZ2sTvUm6dGBxq/EiSpdSRnl76ydDl
         d1vB6d+DE8mcbLHi2xi6+QtMI9mjnbL8E2VpW+duUZ9Nob/ivHGYnM3e9obo9AO+ONqe
         A+Ig==
X-Forwarded-Encrypted: i=1; AFNElJ/LmUUE6+TFoWZ9/9BwDBTBGtRFISVSz0CcRDwIqcgVp1ojdN0Nyxu+NsZMGQcIiils2/Bo0WLRz4KysA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzRs/cp8CoDk9VOWu1byxZJnaf7BCoQLBT+BA6MqbRSMHL2kA1
	w7En76Ctd4BwWYh92rQ545wWHLitnNudsE2JbAvKAJq9gz6RmBln9evdeDm3JQR9fSo=
X-Gm-Gg: Acq92OGX7M4dvil4bWrQPJwBicBOwU1ZL/LdgO7pyVbk8bg3Wps2nDLFQOETMYvk9aJ
	AtGcZsh5n2F8WZRfvstMq4d772wNUm64zfEwN2itHDEMC7+Ch3r7fAX92FNPKtT79rHNlf8jK1T
	BBRiRE0YoghqbbyeyLkp+3m1BGn/o2esjjIPR+4SDAOPTWZAlVWOsQxTFkYHWuLeB0u7wSUlo4M
	norQEQsMs+fxKUwQKxditaG1LRPOfO6n0ypact9h92CO6cRSGO3J4B7xYlmLVQ/jami/5rCDfL2
	8FTkzrnJQ0aoGmZIcznrxriSMquVGew9kiZ26n9/AOGxWKVpZ64jv7mSc+vYttCgx+0hdtIlL20
	jta4XnaFrZvw0rOrfYsCa17fap0oBgQXjyGXQshDHd1WH+lEOzolMBFGTbS2kCqyJZOPPfUMJS/
	C6udTfAA==
X-Received: by 2002:a17:902:ced1:b0:2c0:fa4e:91f6 with SMTP id d9443c01a7336-2c1e7d41eabmr240045285ad.13.1781031368012;
        Tue, 09 Jun 2026 11:56:08 -0700 (PDT)
Received: from localhost ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm95637445ad.81.2026.06.09.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:56:07 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:55:59 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA request
 numbers
Message-ID: <qxcpvj3eseclgonwuwx2szn2tj4uxci27mvpqwotj6uaiyj65p@7sx5tyzbfs2g>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
 <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
 <20260608-dazzling-hacksaw-dbe84766ec76@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608-dazzling-hacksaw-dbe84766ec76@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115609_583628_E5187DAB 
X-CRM114-Status: GOOD (  22.54  )
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

Hi, Conor

On 2026-06-08 18:33, Conor Dooley wrote:
>On Sun, Jun 07, 2026 at 01:41:30PM -0400, Guodong Xu wrote:
>> Add a dt-bindings header that gives symbolic names to the SpacemiT K1
>> PDMA request lines of the non-secure peripherals. Device trees can use
>> these K1_PDMA_* macros instead of magic numbers.
>>
>> Point the spacemit,k1-pdma binding's #dma-cells description at the new
>> header.
>>
>> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>> ---
>>  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
>>  include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
>>  2 files changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> index ec06235baf5ca..0d4ac9849e27b 100644
>> --- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> +++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> @@ -35,7 +35,9 @@ properties:
>>    '#dma-cells':
>>      const: 1
>>      description:
>> -      The DMA request number for the peripheral device.
>> +      The single cell is the DMA request number for the peripheral device.
>> +      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid request
>> +      numbers.
>>
>>  required:
>>    - compatible
>> diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-bindings/dma/spacemit,k1-pdma.h
>
>Why does this need to be in a binding when there is no use of this in
>the driver? May as well be a header, particularly if these are numbers

Thanks for the review. You are correct that these are not referenced in the
driver. My change to k1-pdma.yaml should be dropped.

>with a set meaning that are lifted from the TRM, rather than made up
>numbers to make a driver work. The former seems likely, given you're
>indexing from 3 not 0.

Yes, it is defined in the K1 manual [1], see 9.4.3 DMA Connectivity &
Assignments

Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]

I will fix that in v2.

BR,
Guodong

>
>> new file mode 100644
>> index 0000000000000..491976516550a
>> --- /dev/null
>> +++ b/include/dt-bindings/dma/spacemit,k1-pdma.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * This header provides DMA request number for non-secure peripherals of
>> + * SpacemiT K1 PDMA.
>> + *
>> + * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
>> +#define _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
>> +
>> +#define K1_PDMA_UART0_TX	3
>> +#define K1_PDMA_UART0_RX	4
>> +#define K1_PDMA_UART2_TX	5
>> +#define K1_PDMA_UART2_RX	6
>> +#define K1_PDMA_UART3_TX	7
>> +#define K1_PDMA_UART3_RX	8
>> +#define K1_PDMA_UART4_TX	9
>> +#define K1_PDMA_UART4_RX	10
>> +#define K1_PDMA_I2C0_TX		11
>> +#define K1_PDMA_I2C0_RX		12
>> +#define K1_PDMA_I2C1_TX		13
>> +#define K1_PDMA_I2C1_RX		14
>> +#define K1_PDMA_I2C2_TX		15
>> +#define K1_PDMA_I2C2_RX		16
>> +#define K1_PDMA_I2C4_TX		17
>> +#define K1_PDMA_I2C4_RX		18
>> +#define K1_PDMA_SPI3_TX		19
>> +#define K1_PDMA_SPI3_RX		20
>> +#define K1_PDMA_I2S0_TX		21
>> +#define K1_PDMA_I2S0_RX		22
>> +#define K1_PDMA_I2S1_TX		23
>> +#define K1_PDMA_I2S1_RX		24
>> +#define K1_PDMA_UART5_TX	25
>> +#define K1_PDMA_UART5_RX	26
>> +#define K1_PDMA_UART6_TX	27
>> +#define K1_PDMA_UART6_RX	28
>> +#define K1_PDMA_UART7_TX	29
>> +#define K1_PDMA_UART7_RX	30
>> +#define K1_PDMA_UART8_TX	31
>> +#define K1_PDMA_UART8_RX	32
>> +#define K1_PDMA_UART9_TX	33
>> +#define K1_PDMA_UART9_RX	34
>> +#define K1_PDMA_I2C5_TX		35
>> +#define K1_PDMA_I2C5_RX		36
>> +#define K1_PDMA_I2C6_TX		37
>> +#define K1_PDMA_I2C6_RX		38
>> +#define K1_PDMA_I2C7_TX		39
>> +#define K1_PDMA_I2C7_RX		40
>> +#define K1_PDMA_I2C8_TX		41
>> +#define K1_PDMA_I2C8_RX		42
>> +#define K1_PDMA_CAN0_RX		43
>> +#define K1_PDMA_QSPI_RX		44
>> +#define K1_PDMA_QSPI_TX		45
>> +
>> +#endif /* _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_ */
>>
>> --
>> 2.43.0
>>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
