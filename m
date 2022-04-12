Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696F6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doZ1FCvRqh+yj+c/Kz+PMW6Tbmbs/TmeTDcR32KdEVs=; b=AXvzH2aQWEpGl/
	F3PclP5vVPWip0VQt4NUQAn487+17rn4mWAPvEYxiT5rUTk9C4oyHFMFbliw/uPZVE7N/yszcsdZA
	4AnFu0nDVzD7ff0FwYhbySLAkl2a6lLNJ73sN/DB45KGPFJEPEcrhVIxH4Acd9J4ulCgb30K8f+DE
	llUEfhZCfDqc/H5wr5xeBuMIe3NMei/8UkVDQ6LH4YrGigDx90xOmGoR81urWmqs0ALDwE89ldOzD
	2q8aqFD/4BkFjPL9Px9uy4OPqwJa4T85WaUZVYROgfaMCcy5gn6G48m6YT/DOksB4dgeK556T2FoU
	r7WUW6iw0Ib7qZpMmXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neF0U-00DpXe-GW; Tue, 12 Apr 2022 11:48:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neEyS-00Dobi-58
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 11:46:22 +0000
Received: by mail-ed1-x536.google.com with SMTP id z12so9432282edl.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 04:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CAzofaR9FtDRM+wFckGofjwaCdLcN5fw9Tp9Ja6KClQ=;
 b=FkbM4k1L25VdLH3C5Axv+jI5HXZbnjrOgB1F9cfIlW0SFn/s0XwgchhjQhuYd75ZJp
 l0ggFoX54olXCeWc9IzSamo3CubXGiIDP55x5LX57Oel5PZ6NkUUm+4iB6bxPS06h1HV
 jqkEqowlNp00SUqof2j7njrdAHS9lNKcWcw0+hK0oH76kh/zz7TXHOhjEzqHRkoEK63j
 wO1YON+EMja2U1zcYlojaB+aSh99hrGAmHupapX5VwM1ApVn7t0eydmPo4tc7UI95+FQ
 +gfIaKkp2SSYX2kGa83T2AdSPTyLQfdvQg43BJ6dDbQbRLGtNCrf+SgoVy+4l2QQV06/
 p+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CAzofaR9FtDRM+wFckGofjwaCdLcN5fw9Tp9Ja6KClQ=;
 b=KbOBPG2dri1PRrqGiXeT+cJPmP93z1/fzkGR805idCcm+Hksn6+j9rqhIELQZcqLwQ
 wrUUVap+Oj9ONxMllKE9LVu6vOwGmrPweWL710hnH/VRNB3/o5QSxW0UiZgr+Fj27I3T
 eJT8y4bkGf3pNSQ3p2Y9Z0/h5L4AkgwRR8QF6u8Yn19iRVrUKDK6YRsTGWCgPHz5rqRD
 10f4tgi6UjxYmSD5iZGjAZRxCQtbV+G+eq6gw0FZolHgTCvyZWSLi7Kvd++oJL15/x2/
 Z0DA0v8cLh/2VksfT3qUe5ElrRRREIQLOxGIankGzcaH50nT0Tw2fbI3OIqsO21cjW6n
 CkCw==
X-Gm-Message-State: AOAM531brzPoh5rbkCEYSNw9mDv32daAD1h6CnK4KVEvru5qhBjsKjcL
 FamT4ZX12RkYemhb4rC5+KQqrw==
X-Google-Smtp-Source: ABdhPJzgTthKDvyK5jkgahd3jA3ghr8ocxlOO81cPS3FfOff0qgYSswuAkilr5C24AhAfauBQLOBDw==
X-Received: by 2002:a05:6402:4302:b0:419:4be8:6493 with SMTP id
 m2-20020a056402430200b004194be86493mr38525636edc.294.1649763976885; 
 Tue, 12 Apr 2022 04:46:16 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 q16-20020a170906145000b006bdaf981589sm13012850ejc.81.2022.04.12.04.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 04:46:16 -0700 (PDT)
Message-ID: <6bd0ef3e-5e50-9207-375d-088167131a9e@linaro.org>
Date: Tue, 12 Apr 2022 13:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/9] dt-bindings: clk: mpfs document msspll dri
 registers
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 palmer@rivosinc.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-5-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411085916.941433-5-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_044620_265050_15BC9689 
X-CRM114-Status: GOOD (  11.36  )
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

On 11/04/2022 10:59, Conor Dooley wrote:
> As there are two sections of registers that are responsible for clock
> configuration on the PolarFire SoC: add the dynamic reconfiguration
> interface section to the binding & describe what each of the sections
> are used for.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/clock/microchip,mpfs.yaml     | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
