Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C653C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZFOSIlLykKmvZEPgJ2c9KfIc2s0V9j0GvtOVsNyfu0=; b=0IsL3tv/TrPczn
	b49zFiifeoaoSxYbDsbjmpD9ev3obPHQYHwrhHCg8d9E78F8+ZsvCpK5Q4cah2/DTCwa2NfaFSzMZ
	i7EwL3sV5n3HpNIksHKeQ3wPQNSxBlpBN0QlRzC4CFJ+5RdWer1/yfA2Z8tFRPJGkXjof4G+uvpFs
	C8Y/UDVCOG/Bqgoh8Qq58Au6+CfgUAtGun5cV3EYHf+yc/ZZ/Qioxn/uWBZxyGEZcc2PQo+Xg+Zfj
	tH7N77u+4iqdYmp434VZJAqCfjzEy7PhZQzFgONP+o1wkODH1a39ulcO9IX0d17TfEcrh9RD+b+d7
	s+Xb3d/UVD+wthDF1pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCPv-002gE1-1W;
	Fri, 17 Mar 2023 15:54:55 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCPs-002gCM-1F
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 15:54:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id er8so10474316edb.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 08:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679068490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6MfDM7+OPKEruVq5Qw+tL9foQplTG2gH4LeyrZ6K0I=;
        b=J3OI5NGj9npu+foP+NF4EKylYoqNwBGWTTFoaBFl/rtJptvgmBqbgaaNwy0O7xtBZV
         OoRN0BmTI0Vf421lNAAHbcxY37muIyEDCYlutZBnnT5RsycZvFq/PuFUBlELpOocRsuJ
         K0xbCzcc3REibeoG9AcCeLCc+b1sQocdX11eHVM8JkPs4x/rdJcow6Ii+OL2asqAn6zf
         rFPh/33gn2hrfP6UFSb8aYJBRoSxMyXd5IrQNX/xxa37k91f2ZMBbsDpnJJM7Oepr39r
         v3SYngKEeCsRngXiYqXXSOEwTxlT71jNY/ehg8AgbVg5CxUKjNiBr60b6cJpnHThX7pf
         CoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679068490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6MfDM7+OPKEruVq5Qw+tL9foQplTG2gH4LeyrZ6K0I=;
        b=gfllrvF/KOqBV3MZOUFZBj+xK7hH9bOdWtYduD1SfkIb0Lk5COFebFQjrrrS22Jb2V
         GUfI5VPgeJLW5IbSqe/YRihifYgEGrP2UwdTlN0ZxLz2UPxc5Fkrn9ZcH4HFgRUjtf/t
         pA65e2UP3KZiyOrVh86D6wgMbv9J+Pul+7mHxy818oHAj6tdafRZDMsGehQ7K5IowfVq
         JQwkdnM2MrsVsllfgOEZK7Yty4qYwF6/icHVuJ9WVdZAN2wdjfvq7z+o+UiUfYdTCLgO
         VITXIGO8WxymFgGIykb9Wj5zHowyo4qIK8FOumsioszHNBD74SNI8p1BalGDMw/jrvPm
         cu2w==
X-Gm-Message-State: AO0yUKVpUk3SmJpVcLgm6qqX5gj3Jtg1OjveG1MrcIyBe4eB2pdsJ7Bz
	4ysvCnFMILJv7kcHPrHs+gyR+Q==
X-Google-Smtp-Source: AK7set+MZ5pmlFpN+w8RxZMV5gSssYKuD9NQ8ZrDbPdbH6ontcivRAhcm8upFtI00t/Upa7xjOUp1Q==
X-Received: by 2002:a17:907:cf88:b0:92f:7c42:8631 with SMTP id ux8-20020a170907cf8800b0092f7c428631mr10502230ejc.16.1679068489976;
        Fri, 17 Mar 2023 08:54:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d013:3eeb:7658:cec? ([2a02:810d:15c0:828:d013:3eeb:7658:cec])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0091fdd2ee44bsm1112929ejc.197.2023.03.17.08.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 08:54:49 -0700 (PDT)
Message-ID: <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
Date: Fri, 17 Mar 2023 16:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_085452_425861_8C7416A4 
X-CRM114-Status: GOOD (  15.79  )
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

On 17/03/2023 11:21, Cristian Ciocaltea wrote:
> On 3/17/23 10:31, Krzysztof Kozlowski wrote:
>> On 15/03/2023 12:47, Cristian Ciocaltea wrote:
>>> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
>>> dma-names properties") documented dma-names property to handle Allwiner
>>> D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
>>> the reverse of what a different board expects:
>>>
>>>    rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
>>>
>>> A quick and incomplete check shows the inconsistency is present in many
>>> other DT files:
>>
>> Why not fixing the DTS? The properties should have fixed order.
> 
> I was initially concerned about the risk of a potential ABI breakage, 
> but I think that's not really a problem since dma-names is not directly 
> accessed in the driver and DT Kernel API doesn't rely on a particular order.
> 
> If there are no objections, I would switch the order in the binding to 
> tx->rx, since that's what most of the DTS use, and fix the remaining ones.

Since we added the order recently, I rather assume it is the correct or
preferred one.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
