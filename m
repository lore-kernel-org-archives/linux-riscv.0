Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A12EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydm1gVYHPjfCcxcLhpEp09Idbg/CFSLJiwJbJLrsPy0=; b=PaCl/Il1691X/p
	iQNuhhAg+9fRR03uLhhHfbOYQMiAOXkxqQRoEvl14U+y83UzU7QayuMbQwSaJL5CwYBBuMZ1oRTkB
	u1x+RT5NBkclZ9A65jlkAeujjbT/YU75zWwcw84Ws/ah+4///OsiVctEUc2XuECMBJx1DhgLgh66a
	vKlLtbfekZEEKK3DRmweTQlWzrMVG8sLhp60IrRqlAPWv+sSOIbglFZHWHsyzuKbjJ/6YsAdWV38q
	ZXqZ7eLlgGxuqeV4+lUH4Vdi1nhDijq9swKJk2f49BqjDR2OUWwR/TooDhnOr1ZKfh8+e4cFdfOur
	97evcJ5CZ8xVSyscF4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOAmj-006Jha-1m;
	Tue, 25 Jul 2023 05:40:37 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOAmh-006Jgo-0u
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 05:40:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so876231366b.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690263633; x=1690868433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfroF1JF/XJ6mPsu87A6GDB5zqWzLmB48tKx25k/bTA=;
        b=yrI4YLBQj6H0kT0aJ0MtbeCd1lVLBgOvIhkGL/uktBODBu9jESbkvGWjzjEFqZw2Co
         bIf9/SUWvye+uV+6HH5p3rKLCAxU8GKxlidhyGivOc64aRIAYDXDhbh51QSA/bhm16n3
         8akc3dCcyyTfBjqtU+ZlIAuYXY1+k8YUfMQakFOrolJGiTO6CkW34FarX0i+cwoD5u4j
         gKJpXxfxEmLVffIVTTeGUYKsvXEGAG8jdyvbY0vt3FUDCbj0tL5c5471dhmmPKNvDJwR
         m4cODdWrYSx5MxjVUCIkUOIR2h4kuQG67nWfCvJSmLxOmbhATuprr581KHkOx3n0O5RC
         QOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690263633; x=1690868433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfroF1JF/XJ6mPsu87A6GDB5zqWzLmB48tKx25k/bTA=;
        b=I6CjqeZ2wtgFr0NqfSs6ogiFjcpxx3y0k1q0GcVNs+2q25Qw3aAlTSth0C9nxysiM3
         YY1JNNVMgUxhxVRHrtCBbmkTblTEWbgTMM1eryuxJPiR+ozAwJJXkbtjK2CYOW4hG8RX
         nPkXctbeI0PJT79Ptah0q5jnnnXuW/NgGIDyYuSKjKLEzjiJaIPzebJJ4bJgMCIWXGPF
         wkYSufPg7T+4LB6DeK2PkNqbRBD5lJh8INTNEdTpKr8JPgpLhAyYBBZuYDyymecmWZlU
         KYDQna0TgmCO1d64tz6qBa468Hr7UnXGVXkLfJ8KGzrlwDLYdaVkzbKMMM1fp4tzaE5c
         zx2Q==
X-Gm-Message-State: ABy/qLYIq0NqvOIdr6Dh51z556WUIngzeuLXMFT/98LuJ06+OG3n5qFA
	74IFllOed7mfMqb66EE30GtTEA==
X-Google-Smtp-Source: APBJJlEW/3ztfXZS/OG3QYLoj4rG16uxGq7HMDWca0xP36s6SbxzuY4oqrIPd+ZX6loTBq0oGyJ65A==
X-Received: by 2002:a17:907:7759:b0:992:630f:98b6 with SMTP id kx25-20020a170907775900b00992630f98b6mr11680527ejc.37.1690263633124;
        Mon, 24 Jul 2023 22:40:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id si1-20020a170906cec100b00992d70f8078sm7729498ejb.106.2023.07.24.22.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 22:40:31 -0700 (PDT)
Message-ID: <2385928f-1cc1-04f2-7a56-18eb99bf90cc@linaro.org>
Date: Tue, 25 Jul 2023 07:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC 1/4] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 compatible
Content-Language: en-US
To: Drew Fustini <dfustini@baylibre.com>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Robert Nelson <robertcnelson@beagleboard.org>,
 Jason Kridner <jkridner@beagleboard.org>
References: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
 <20230724-th1520-emmc-v1-1-cca1b2533da2@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724-th1520-emmc-v1-1-cca1b2533da2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_224035_317900_81731E3F 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

On 25/07/2023 02:59, Drew Fustini wrote:
> Add compatible value for the T-Head TH1520 dwcmshc controller.
> 
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
