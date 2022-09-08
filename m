Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2DDC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKuJvlhEYGlBiiF01LRGHmHRc1SGzd6tZ+aZoZi6J5E=; b=0QiHBRu5M0UwzC
	Ye9o+8HEbrnYRjuUrAyWL0kDygsZCfzEoc+HDAWNHDO8TWilXJ5yqFDzvFEllq10oysjczFbZxFj0
	xJXa2cC5Q4LJKUgPUyMu0k8vqw+cGEBnnxLP0X0NPZUNY9tjkr+2dIyX9rLJiAqRPFhRP57ThFC+r
	wkR8DCRd1LAFWBtT/mSgQ4I+iv2n6DrF0HosmVqXSJLHLvOkTHBr0+A+YrWYVUFo/g19kXaSU7e2I
	de5Z8K5RIG9MXoaClAl8FC2Z3sI4bFE5VXy/NMnKqWKp7TWS2YRTGO5QiHXGkp2wGwaNvxCBJQbZE
	rJHqjZqSXRSPt3aFj6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFlo-002lGo-Rs; Thu, 08 Sep 2022 11:32:32 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFll-002lCk-In
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 11:32:31 +0000
Received: by mail-lj1-x229.google.com with SMTP id c10so10033888ljj.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0pPaTE7+rTEQhYbrukWxQzGd1k1hoKVerCCdYWXc3XY=;
        b=yRb08wNixx7dxR5s0MVCYiHAOQTE/8GAdPoWH81JxDGWK/y47WR8xqSeBN2dpOC4uS
         QM4GJgrxdzSFwuBuG+iW+WC9A4X8ebN9w93aWc3Hkgl/N5jj9wK2PEQO/JxNoKKN3GWK
         WqR2RhScBkyrk3OMnPYBOKPyUFqG7ozTYe+9srWmhbyzfD1gpZ39eirhK1FOiuEzCl55
         Fw6G5cDiTbYRq3s353RzlBPYGZTgP04IkBNkJjLKAQFLk5ljo0+JvS96LkFHtcAqzudF
         tPrI85TlCI8dFeKS4kU7xq64zv+Sov6lNVooaCBilF088BnytbdX2IJ+wIy7n7CRxVhj
         9qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0pPaTE7+rTEQhYbrukWxQzGd1k1hoKVerCCdYWXc3XY=;
        b=U7fH3ZTewSNU772+vYbXiHcnXiNBgHoyStsmeVbRIZyEpTvyxIMuu2hxaTZuyoF8e3
         RAB5FaBjbBkbP0/ML4sd84NKx+S4+kTuWjEz4h1NqjwWXcSk3ZwU/KIgJouun0Y9a/c7
         8F95Gtlp9GfxXIBa4QtzEFHZUFUioeUzcxeF9qa6i6dmBj1Q8pr2Rdie0WYMNT+tcegx
         pgee2GSxb/PgcZr+u+sZrQRlckY0RDucgErTwY7S4As4OtdmwFV1h2DPpX5ugaUngf+O
         o2dTUrb3Cv71jSIboZc/EyXMPrwYOHVpimCG1XF8h3q//h5+8SttxADKRnfOFTPRDr7W
         g7xQ==
X-Gm-Message-State: ACgBeo214fWp03z452No3EDpcwXagG71Td/ToCc20tK2VfTnxkuRBbol
	gpr76DYEOToiWTiJL6Pg0JXb/g==
X-Google-Smtp-Source: AA6agR7NtIwbPiok7Z34Q3UGjd8MuNuJBW5nPc1K3U1TM97DmobqBGc5R7i2jKq/7LB+eRKNLLYwnA==
X-Received: by 2002:a2e:a801:0:b0:261:91a3:bc44 with SMTP id l1-20020a2ea801000000b0026191a3bc44mr2295872ljq.497.1662636745890;
        Thu, 08 Sep 2022 04:32:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z4-20020a056512370400b00498f1eddad0sm126675lfr.122.2022.09.08.04.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:32:25 -0700 (PDT)
Message-ID: <1b50e92f-09ee-2f84-447e-01ff5b914e7c@linaro.org>
Date: Thu, 8 Sep 2022 13:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: starfive: Add StarFive
 VisionFive V1 board
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220902100806.2378543-1-cristian.ciocaltea@collabora.com>
 <20220902100806.2378543-2-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220902100806.2378543-2-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_043229_672258_D3332D63 
X-CRM114-Status: UNSURE (   7.88  )
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

On 02/09/2022 12:08, Cristian Ciocaltea wrote:
> Document the compatibles for StarFive VisionFive V1 SBC [1].
> The board is based on the StarFive JH7100 SoC.
> 
> [1] https://github.com/starfive-tech/VisionFive
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
