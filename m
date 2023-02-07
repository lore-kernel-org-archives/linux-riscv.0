Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34217C636CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BRu+8G1lMC4vEwI02dxhtDrzaRHGC/slBTfwLjV4JA=; b=CCfi6lMA1h/VJO
	1l/Vn2Ml85w9VZHLDTqYQlHMZmcCZZh1V9x1nOteudEicYP5MDtTgFeDuWaTNW0EeYQMGdhnCamkG
	kwcvzhOeYOfeg9BT7tDD93VRyFqd619J1KxZfpU4OmxAwyGWUSKKNKiXNYY1kdL8uaA5ILuBepH0a
	s7ZqrsPluHamZT7RwGWzZ3xKauLN9dSx3HNoZpMmhH4IrvDYdD6spf/qP1vv4MGUiB7FQD7zZXrsI
	hEL3+Klv7eVst+d/u+Ec7By2b4//3f1rOVcp+JXjRUvZdo5yF7bkfhORkm4LcVvWLIRw6hmrLCCTx
	VNIWLDSXo2seEfOcndXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRPq-00CsXS-9P; Tue, 07 Feb 2023 17:05:58 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRPn-00CsX2-N6
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 17:05:57 +0000
Received: by mail-ot1-f46.google.com with SMTP id g15-20020a9d6b0f000000b0068db1940216so578696otp.5
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 09:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjJO3OpBUSTO6OYkxL9DTxtzb7K3YxEOsZ3y6y3+V9w=;
        b=Bcp/vDAGO1lXUfee3VoBYaL0+MYagwPNbmhuQf/11Omvr3ihLCN2hZPRWn/BdXusu6
         Kt/yXHsJeGTOUA28PbROMqml5UsgrS9VD91LpVQ2TaW1FukKWQTj+9NNSUmt/vJgpYEb
         EfmHT2EhEckFRemKDCOYXtv0hlyDBZ6eHPeofGiHOVVuE8O2u7H2m2/zWdlJAkAAnKyc
         aFfnbCf256FkjK5YLMldwTi7U5CVDsx/aYtrhkDPuO4th+zQA+H3TJloL0fiflSLsWwW
         ctL+Sr3Unyez/IN2Q0AUYBz8Xw8+LgDSKTjQZ6VlamgQ2/Ki/QB3Xh5dXwynpNv/GJPX
         AcVg==
X-Gm-Message-State: AO0yUKVCAQgr7UDLozT/GDLoTM53JHBr+nnQFIEovJ3JkjcMUICxmzTB
	gkwspfRZYVciHgQbfyl1TA==
X-Google-Smtp-Source: AK7set9x87GYzl8leh2Lg0sAbmIgU0U3bLD8+yGCibPjPr1q8G1W6tSreTRbK881CDXdQ76Zxpq1zA==
X-Received: by 2002:a05:6830:690c:b0:68b:c8e1:4f44 with SMTP id cx12-20020a056830690c00b0068bc8e14f44mr2412395otb.1.1675789552218;
        Tue, 07 Feb 2023 09:05:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j74-20020a9d17d0000000b0068bd04b4292sm6696702otj.31.2023.02.07.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 09:05:51 -0800 (PST)
Received: (nullmailer pid 3750258 invoked by uid 1000);
	Tue, 07 Feb 2023 17:05:50 -0000
Date: Tue, 7 Feb 2023 11:05:50 -0600
From: Rob Herring <robh@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>, vineetg@rivosinc.com, heiko@sntech.de, slewis@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access
 performance
Message-ID: <20230207170550.GA3719881-robh@kernel.org>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-5-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206201455.1790329-5-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_090555_790652_EFFDAF6A 
X-CRM114-Status: GOOD (  18.39  )
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

On Mon, Feb 06, 2023 at 12:14:53PM -0800, Evan Green wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This key allows device trees to specify the performance of misaligned
> accesses to main memory regions from each CPU in the system.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index c6720764e765..2c09bd6f2927 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -85,6 +85,21 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/string"
>      pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
>  
> +  riscv,misaligned-access-performance:
> +    description:
> +      Identifies the performance of misaligned memory accesses to main memory
> +      regions.  There are three flavors of unaligned access performance: "emulated"
> +      means that misaligned accesses are emulated via software and thus
> +      extremely slow, "slow" means that misaligned accesses are supported by
> +      hardware but still slower that aligned accesses sequences, and "fast"
> +      means that misaligned accesses are as fast or faster than the
> +      cooresponding aligned accesses sequences.
> +    $ref: "/schemas/types.yaml#/definitions/string"
> +    enum:
> +      - emulated
> +      - slow
> +      - fast

I don't think this belongs in DT. (I'm not sure about a userspace 
interface either.)

Can't this be tested and determined at runtime? Do misaligned accesses 
and compare the performance. We already do this for things like memcpy 
or crypto implementation selection.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
