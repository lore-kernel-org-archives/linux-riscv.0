Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102EDC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 08:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cK/n9KWQ0xrzWUIBz6ld8BRjQ9aozlf4yICThctG9BY=; b=ZSEuVJD42EUbUa
	DLgGonXVez8OQvXizLJCXZRnvsjhtEJGPpN/Ul05/YOa73+5HUjxCoLfW2Q+RAtTJLmETWtNG3JUV
	/nGpOhemS0w4HAJGxrR/k7MGIP7QT9cPOyrfLJ1+7pSV6aTtlww43lTFgisJxyoV9ZR3ebbc2N474
	JiR8bsRxgi4rQGvVA9GkPK31jUafveaPZ415oCVREMdgyZcuWUINYM+cDrWBD8DbC6lhDakmdAOt5
	8n2K/kjqcg84SRpuDck2ZYYgCcXYzbd+6JblHvDUKJNbDoH8KjIGYHykVIANIZWJDfO93Srn4w3tR
	m8BeuspBZtxDzqWAvKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5VA-001V6j-16;
	Fri, 17 Mar 2023 08:31:52 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5V7-001V4x-1I
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 08:31:50 +0000
Received: by mail-ed1-x52c.google.com with SMTP id ek18so17353223edb.6
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 01:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679041907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F22xKzaXQ16zz1R+nPdvOmBcImJHM2RC64dPlAyscLI=;
        b=aWHmZxuyjKoQeJE36fh5yBR6stqa3XOEzB1SVT5U3CDiWrUEUqd2msGm72CQst+RK/
         Vkvm0winBTSa9GH01ItcF++wZbeu9Ca1O3OtCD+slaX2sfyNvwLNaP1kIkpF3YZUMRQn
         HfvmrKvHVhT+8utKUDchex+GgFH/jLaIYm4bbhg36sw75vbB0yaziDmmZIytqIRMJ/g7
         is+q5vtZXQM8KHDf43TQvE+c6zwdlCIA18cenpVd/XaOf8fvgq8Nh1BPceGza5/jL5BR
         uck6vWW5VahlzU7RL2fq2660WI4kK3wtWgp/dcDhr9zyW0GxJp9pXvMbmxOhPThJ0YhX
         8BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679041907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F22xKzaXQ16zz1R+nPdvOmBcImJHM2RC64dPlAyscLI=;
        b=sR5H0r+GN01cGH/ShOaVjCcd5+zzJzxJcHyBhsSkB3pZJ3MEt5H0IGAm9IrOVZ+s1e
         S8hwwFBgrquD1X8SGbkTk8jqui7mr+DC0sn1S/SVyr5n2keqtDQiHxwQ9jiYNYmEQY97
         vCPo6+2Pghwr55mg9YsJSf6TApV3EMKYz+MkIYjX06sb7tOTzAYAh/Yds0MDbk6fy8TS
         i0gOKbzlToff556oDEMs0kvSyCCQ7CTeZhPmWE4z3gc4bcyYHbr2SqVc2prizL8Y88PJ
         fsxE+I9QAR8zJCy0JwJJF+l9b5L++lWIAl9den2geqd3r8K32IYaMyRf4eEcrO5cfqha
         0l1Q==
X-Gm-Message-State: AO0yUKU44h9PXZtvn58ckIdTRUwq2TiPozV72wQaDv8RJr5IPTYxWakh
	9eyGuyZYB+tok1me99doVSensg==
X-Google-Smtp-Source: AK7set9P1SuFct7TKYsl2uFH88M5Njs8psB88aLuEx8C2MfAzct4blZqPVjveqZ3ledMk3g6rAb+8Q==
X-Received: by 2002:a17:907:6eab:b0:932:3942:f28f with SMTP id sh43-20020a1709076eab00b009323942f28fmr618319ejc.61.1679041907355;
        Fri, 17 Mar 2023 01:31:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id e18-20020a170906845200b009222eec8097sm692325ejy.75.2023.03.17.01.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:31:46 -0700 (PDT)
Message-ID: <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
Date: Fri, 17 Mar 2023 09:31:45 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_013149_446023_B430FC57 
X-CRM114-Status: GOOD (  10.16  )
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

On 15/03/2023 12:47, Cristian Ciocaltea wrote:
> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> dma-names properties") documented dma-names property to handle Allwiner
> D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
> the reverse of what a different board expects:
> 
>   rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
> 
> A quick and incomplete check shows the inconsistency is present in many
> other DT files:

Why not fixing the DTS? The properties should have fixed order.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
