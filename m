Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FD3ECAAD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCjOj+8fyJcyE34NAQx78gJWycWXwap1Sx/asSS2RE0=; b=xC+Pt1scBSwphh
	JVLhlXDJCdeIA9GuVCuEIBP2QGdOVekerN7y/b+PS5cBOho53+LHPJtjOLn+Et31YeC7f1pl9mzw6
	+kY/jMwniq1VfmAmyvSnNTUpY6NRo8n9iLO5tkREr6U/z/7QDzVo7qbiTxMnVwmbBUNxM9sEHK5N1
	Jy8z1Ep51M9YyUEkAuGF41GGMm7tg3j+Ngob19zgPLTo+4EUrzSLw9N/a4Avc8zVGH4+1WMSi6Sju
	jE9Rj3w3h4xBgqHu6qYuOt9lXcUZxhT48i0ZBkc4EESrqvwfwm7mns/LsJVdM906ntB1weN38ovEx
	s0qUiPtjTLKFNBhJNrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRs27-006liy-02; Sat, 27 Aug 2022 09:23:15 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRs23-006lbo-Gs
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 09:23:12 +0000
Received: by mail-lj1-x22d.google.com with SMTP id q18so3595128ljg.12
        for <linux-riscv@lists.infradead.org>; Sat, 27 Aug 2022 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=nhQRAKR4zHjEdCb0JVELtrGk2wyQLykl6TatRm0eanw=;
        b=FZ6G0Dbx+imj+WfEdZ5oIvV3nFXHxmMjXXxuZOnoiBTegvtYnT5zYj9chduYPwToA+
         lEaHcuAutIBJIcnG3aVaGE8nT7ejSTlQbAHTt6UZ4pC/Jf1XOOHbxXKwqegbTEg5rLNW
         IhEdCQgTxoOFnqWiVgDsU2NoDA7g+m7ErjvCReMo8ptaDwUUSmD60A9Y2PWBui7i6f4F
         CuPL+odQ0sJ+dXDK0cXkoL7kORkBzaVB3p2D/a3LOZlbXIOjee11HVv6C09L6yS+W6XX
         +9pl1gQ17c5H68VeQbCf+Otk3mAaEeG28PLFOzyEnvBTrOR4/KXMx3LtkA0pTxtJ8CQX
         ULWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nhQRAKR4zHjEdCb0JVELtrGk2wyQLykl6TatRm0eanw=;
        b=jVpDeDarE1/yE4LvdGgtlrZJWSV9WTHJ06VexmWNmVM1eci4C1ZR3KX2zVcvJGCmTa
         WPphEuEv80IO1wLxhhovVTQNg9WJL0aAnDwzRoixCIZhvRtC2FiSYivYLidOF+dT4RKj
         NpxYF3ryafpx5vOquIDWpBQDsO9CmBMtxgLg50wetSH0htUctDtUrnm2SPF4rr1fleiO
         ty6GKhEawrQVVMgAbb6LFN8WllR6oEFn8lcGqG3kTgAhJsH7j5kf7ZCXZIcfjl8tBPfV
         z0lIRH8Ha/e6p6uOb4bmZUEyJHFWMlcmsZsmrvewq3TJbcHClQt1LXDg0Ha10/YEn9eW
         zhjQ==
X-Gm-Message-State: ACgBeo2Db4FVQk3/rJ9oA93TI5tzULv8H3cF6kARuO/ByKGDGdYv3cDt
	PjHAPP+lVKX5RWfYRNXvrhh1rQ==
X-Google-Smtp-Source: AA6agR4IOei6b7fi96xie1hkpHeN51u8OsJV5bD52jcUaGAHsunyWj3db6JHei0L9njsv+peuxbAwg==
X-Received: by 2002:a05:651c:1149:b0:25e:6918:22bf with SMTP id h9-20020a05651c114900b0025e691822bfmr3242922ljo.258.1661592189285;
        Sat, 27 Aug 2022 02:23:09 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id f14-20020a05651c02ce00b00261c30d71e5sm682410ljo.67.2022.08.27.02.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 02:23:08 -0700 (PDT)
Message-ID: <715c2639-c94c-259c-f6bb-cec80afa30ed@linaro.org>
Date: Sat, 27 Aug 2022 12:23:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/9] dt-bindings: riscv: microchip: document the sev kit
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Shravan Chippa <shravan.chippa@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril Jean <Cyril.Jean@microchip.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Vattipalli Praveen <praveen.kumar@microchip.com>,
 Wolfgang Grandegger <wg@aries-embedded.de>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220826142806.3658434-1-conor.dooley@microchip.com>
 <20220826142806.3658434-4-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826142806.3658434-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_022311_597079_8FF83FC4 
X-CRM114-Status: UNSURE (   6.60  )
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

On 26/08/2022 17:28, Conor Dooley wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Update devicetree bindings document with PolarFire SoC Video Kit, known
> by its "sev-kit" product code.
> 
> Link: https://onlinedocs.microchip.com/pr/GUID-404D3738-DC76-46BA-8683-6A77E837C2DD-en-US-1/index.html?GUID-065AEBEE-7B2C-4895-8579-B1D73D797F06
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
