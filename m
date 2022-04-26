Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D435C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 07:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0dIEzRB+FiOKWOh3jWgDKgjoudzvKyb7v27z4wUmYE=; b=sknvd8V3DwThg1
	jjmKBfsdG91NKXSUH3d3UN3PU/uswiHlCM08XHLZyclREJPskioNGeGEOuDpE34hnkhJcbON245ZF
	3iMp/tk1yP6cdZBTHsljW1g3A0cTTTWQL48U5Ju+ZUt8MUnVJ0hC37VYvjyx+FNN346TA9GMF082n
	Ns9zKHMaSeccZNZKY1LWryMaCoTFYC823ESwHNURLkXLsQqDiZ+3gQLYQPEmdnzuP/ERXwjutwHZH
	HxZQ7nIyXhbTblLxOx1osHevslrTflH8KU8DVHLqAHOvzpLz9osNshlN9T8mTdiGrZQmVJQkSwoGc
	hOifmvNzEZLooJCb/JeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njG4E-00D8kr-P3; Tue, 26 Apr 2022 07:57:02 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njG0u-00D6nM-8w
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 07:53:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id e23so235438eda.11
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PKj9VZlz+AF0K6JftzV4xbwDLiquD/QBKxhzqnv4Ff0=;
 b=NGxAKj6s7aebO/0U7Pd48rc1TNzzmZdRw3TonawDq2937wPb9wkBAgNvmics7f7BMe
 4eLBr91bnVk8HakLRiCV7EkiAoNV1bscLmWNySym6w8LZ3bozjbW174N+7edjLdmZphW
 tmXt/VqVyMAWa8y6xx+5k574gX+UuCTgCmar677kSgc8VuUCKu4i5AqEaCgM8r+VRg04
 qC01eN9IwF0szYWIk3Kc+BYF9poOK079x2S/p0VUsDMNceiJYW5fLiDhokYzxdvOC5em
 TznPDAXTPcKSbPB9i/yWHXThCys1G6uWMIIaXnSwMYf/bBFCUcO+8ywO5aMDppJkb0En
 ybtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PKj9VZlz+AF0K6JftzV4xbwDLiquD/QBKxhzqnv4Ff0=;
 b=yqQUVI68ofLqlilgbKq8Juo9Ah8kPHuGkJtCynjgiXL9O+kgbsNt0uLEGbvA1oB1wK
 m/n5s5IA5AQnZR/gK6Yve81w1cLaxI6w4E5uAMHYZTaYc9bntz+P/3Pe/AbBVVeLqstf
 Vbf2HNYAceXxdNVe1BKDx15eFxo5p7Y9kJ4rgCYtUCAqXR/QOKkEDHqgpQJCNICy6TfS
 oJESmU5GYN6j1UQuBLO4vFWlvGDpg/mMx2ZlYJiVS14Twx84sMYWrKHfe1gk1RbsMB6f
 2y0h4Nrbsj9myrB06atNHTmUxNZ3il7N20ynA2/GBwEdfUvnQYudb5G61kIGYr8bKY66
 fGDg==
X-Gm-Message-State: AOAM531WWZoKSmcdNkivuj5v40gw2uxm4l2Jy7hovB7GY9iBQjzRyZGf
 ODtNdJj1ICb4F8IUZIc7Lks1kg==
X-Google-Smtp-Source: ABdhPJxYaJZLHrMQjNCNIJfKmbEHJjkyAxu5VhPrvFy/d9Ii5GCTjzTtqd7dDPISmzCigYAHJMWeOA==
X-Received: by 2002:a05:6402:d0a:b0:425:d455:452 with SMTP id
 eb10-20020a0564020d0a00b00425d4550452mr15490565edb.259.1650959614307; 
 Tue, 26 Apr 2022 00:53:34 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 lb26-20020a170907785a00b006ea4d2928e5sm4437809ejc.218.2022.04.26.00.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:53:33 -0700 (PDT)
Message-ID: <f822fc7a-7c47-d8f9-8ef9-fda2c7832926@linaro.org>
Date: Tue, 26 Apr 2022 09:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] riscv: dts: fu540-c000: fix duplicated dma compatible
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Bin Meng <bmeng.cn@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220421065401.9303-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220421065401.9303-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_005336_415808_A7252C40 
X-CRM114-Status: UNSURE (   9.01  )
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

On 21/04/2022 08:54, Krzysztof Kozlowski wrote:
> Remove duplicated compatible to fix error:
> 
>   u540-c000.dtsi:171.4-42: ERROR (duplicate_property_names): /soc/dma@3000000:compatible: Duplicate property name
> 
> Fixes: 7eba954a8de8 ("riscv: dts: Add dma-channels property and modify compatible")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi everyone,

This is an error which causes compilation to fail. Such patches should
be picked up faster than later, because it breaks various builds.

I'll take it via my tree.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
