Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF4EEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEP6hnqW5HtV3zkq/3DQOlcpr5uTUEabZo8KM1aYBQE=; b=fMnveO3SJongsv
	b8L+IMjQfl6w0aq5zdiH+ITCQ8MIkE+dsOnv9zrhAvCOhfBU2j64QGr5WJaxnnL+/iMCl8ULpzMMF
	ciV/7xjchabby4iMrPJ6DJIxuFV92EfkRal1sLe5jWQGmaCcU3IREXHbnVqXOcNSvpgfsW9K30bwi
	KTJ9C4eZB72SSf8jI7EamRUNI1Eb2FN3gufhqcr5wQBBURlo0vaL4FAPio+Sk8pAKhTWZ/pA7C73D
	v4zSeczIypxgyCwWXAOTjTGPa2DjJog0XoTGUXR8P/e77YrzICEPpheeb8WuceCPfPjtxfTZaNFGP
	l35kouNuxgv3Yuogq7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4oD-006nyo-1S;
	Wed, 19 Jul 2023 10:53:29 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4oA-006nw0-3D
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 10:53:28 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-992b2249d82so943446666b.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689764005; x=1692356005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7UsnPJAlx+zJvjW7NPUxGuJZcFft7FkawPhO4cPS6L0=;
        b=D7rQYOCWkih5eVlFXleNpL06gLAZgJqJerQzOvXhKfktsHfjx24qwJx+uG/L2p+OXv
         yzrhseE9fT80PjT662zAq+5L6fWYbLvYO3ImvJWgVotHNQCeGcaGcIN1ZmxGvXRkVS1M
         ZliL2YrU4f6hYAQw5th2V9LMESb2o6RxW0muNWM8QWLT9P7U1eXG796eoRNLQKTe6j5G
         8XERIMFcwcvq4p1kHi5ceclOpsWIjzMguicGOTjijM2l3JNxOiXzSIJ+RwYR3RvQEDyl
         aMeujQdGEMfySMtacz9WzXxMa4ILKoYjnOOx37adgApMky3ASieAB23g25T/i0YNe2UK
         BhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689764005; x=1692356005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7UsnPJAlx+zJvjW7NPUxGuJZcFft7FkawPhO4cPS6L0=;
        b=VCbBYfcc1idKn+qxrHjmBd/fA5qJq8J2JFE2yc7cIkm7VEa74xcca5J8FVU6XNBfGw
         x12HVEdx31n/u3S7Gr/FsS3gXwJa06buS4gDPdvd4XiYPGPyZMoaPEAO2t6avSsJV1sn
         ut7JMM8racHFU/gG4wLAm47xICkt4ojKyJBa2HOmTfplBTw7G3ZBV7z3BSI+LxwekV+p
         AW3jAfcmkgNi1RbvvICnuqZPCYayiwre3SR79BEmwr/69rkHOiZX9FJp4o/B9qV5W4Ip
         zOibIAWHxanqzGxOLWPdLgnMGDjMkRpxO7FXYkSv8cC7AOlzqATvVbYyHrd+NHzS3e+v
         u3Rw==
X-Gm-Message-State: ABy/qLZl5Tx0e5sfaNIMzGIhXqwxSkgSpKTgWvYg09Z2eMNR0c5TVLrt
	LM21yb4h/hlnuKwMaGn+QCiQHw==
X-Google-Smtp-Source: APBJJlHeDzULHdm46nMp8fn9qzD8PjM/5gM+DuBigu3bOrq4KBv2hSExaHh8IBlswZWOt5RwDBQiRA==
X-Received: by 2002:a17:907:7fa4:b0:988:bb33:53b7 with SMTP id qk36-20020a1709077fa400b00988bb3353b7mr3000006ejc.60.1689764004961;
        Wed, 19 Jul 2023 03:53:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s17-20020a170906c31100b00992d0de8762sm2157060ejz.216.2023.07.19.03.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:53:24 -0700 (PDT)
Message-ID: <a1f60fc6-f150-0cca-2685-daaba82af20e@linaro.org>
Date: Wed, 19 Jul 2023 12:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 2/9] dt-bindings: PCI: microchip: Remove the PLDA
 common properties
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Huo <mason.huo@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-3-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719102057.22329-3-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_035327_035673_056B5055 
X-CRM114-Status: UNSURE (   9.99  )
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

On 19/07/2023 12:20, Minda Chen wrote:
> Add plda,xpressrich-pcie-common.yaml reference and
> remove the PLDA XpressRICH PCIe host common properties.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

This should be squashed with previous patch.

> ---
>  .../bindings/pci/microchip,pcie-host.yaml     | 45 +------------------
>  1 file changed, 1 insertion(+), 44 deletions(-)
> 


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
