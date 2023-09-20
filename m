Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208F3CE79D0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6htviFFXpFDiVJFipE5Qcm+2N0f57HYl8Xr7hpx1Vw=; b=PKzOBbdGMS9q3G
	TS5EI/w8Ws/tuvqc2NL3TDPcxdES+Oxdxz59pjirfs3xitz2srhJKRlDBmGzzX8teVGEkuj21qoUS
	jkEaV5AvTx6+Htdnzmx1uXRG9bNfVIX8pfj6DywpW4mqLu/m/5eRl32J3+RnvNqRR+k095zKYaXZc
	zx68Va98gvm5ItJgkuNiom8vLm3ESFwrqHbR2Uwf6tG+vOczde2RaV8SGhCyWry5Y0VgvJqGvY7l3
	eyVl8jJ1/HH0Yst6HlL1Muh1VtGqMT3KtYNZSCYvZ5dVy8ll5l3bN7QKoWG2sv5OMlm0sS+/oOBAf
	wK2eMJfOWlAanrxmLehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qivnv-002w7T-1I;
	Wed, 20 Sep 2023 11:55:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qivnt-002w5z-0w
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 11:55:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a21b6d105cso860163066b.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 04:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695210932; x=1695815732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UW8N+KeoRBbtzYhOGJomwLmPo9kvmA2DLIA6YpijZTs=;
        b=XCmx3QGVKKhnjQEv0L/flZPXBXni24l2xtbKeC+K9HsPRSjQX8h7VVhj8dZSHwiiGW
         J7K1EdzoxBJ5Nepsxt/X5L3THb5A108SRSBNAvYs08TnAoiWSfv1iQZYqOaIibBNYyfC
         It/9kZEnunKLO6k2r12ug41yE0TUFev8WiPOXbklU4uiRe29FxMp94uOcEPgaxmhmFlW
         9CMUSjWDp7kbrY5oWrjny+ZucAqGXaO09MWshNTDDBfo5mSYJ4vWZqtV1rfgq/Vu1kiz
         75Ea948DJAxsefMe5u6nxD4ZhBFkrTKKPEvhmVFi6jvs+9ZX7xSlTnm+q+wjGoZ//c0L
         39UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695210932; x=1695815732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UW8N+KeoRBbtzYhOGJomwLmPo9kvmA2DLIA6YpijZTs=;
        b=wkF2DMAPoD2R2u/7k2O25lPkjhnncANufrRPR3f66E7Po8wlQbVmf6ckQhbOSL5MMS
         QGxLKWb1fDd/FSmRUjFkSEwh+qkSK9NnWeKYZZamJffqfLHjHprPntK3SgADOguesjcM
         I337GGbMNOcnOfQ3Aydsved1K2d1v4Wy6lJuxp+gUMNsXJKPFRoNTV5OlgwACNeGu7QH
         ivaYVL44PXJuuaVX/AjThtRVldM/83l0qMLSt9Qt/Lb4hmARumDcFrFnRELwHLvwwNPB
         ZR+eY8NMLHV9Jw1jPyVlX1O55ramcBO+RRY6DgnQkte2dwHxBuHlkLpjlLrmdLSZrUUn
         0xEw==
X-Gm-Message-State: AOJu0YwMCDvp7lhHadUngQYPwwIqRJsomHXGAelkdBZ1Lsir4eJtl13T
	Hjy23iEY/d/rChqykVxhoxcqJl0zydiB9gvJ52qjRg==
X-Google-Smtp-Source: AGHT+IHdCynh+x46AKAMnLAwGdoI29Wy7NyQlaXU6tFEhUkwzwooMPkfiZE8Hj3OCNEur1xDIctNjQ==
X-Received: by 2002:a17:906:b1d5:b0:9a1:e233:e627 with SMTP id bv21-20020a170906b1d500b009a1e233e627mr1862460ejb.42.1695210932442;
        Wed, 20 Sep 2023 04:55:32 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id rh1-20020a17090720e100b009ad8ba6976bsm9307629ejb.9.2023.09.20.04.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 04:55:31 -0700 (PDT)
Message-ID: <ec11eb6a-c37b-08bd-5997-8fc390fd58c8@linaro.org>
Date: Wed, 20 Sep 2023 13:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
Content-Language: en-US
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org,
 emil.renner.berthing@canonical.com, guoren@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_045537_376010_D3294BB4 
X-CRM114-Status: GOOD (  11.80  )
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

On 20/09/2023 08:37, Chen Wang wrote:
> Add DT binding documentation for the Sophgo SG2042 Soc [1] and the
> Milk-V Pioneer board [2].
> 
> [1]: https://en.sophgo.com/product/introduce/sg2042.html
> [2]: https://milkv.io/pioneer

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
