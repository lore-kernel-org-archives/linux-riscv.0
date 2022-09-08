Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9C1C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVqxjWO4HDmb4lfWEnrpzhdSJx+vmiq+ya9rfGnpw7M=; b=ueOw9V3B/91Adp
	JIoPogJwYDK9ln5Dq108x6Mj30rstZiEOrRDds1/uDxuw2ubE9LSG4PjNmXVWd49k1pmgC7tLF048
	I9RdjK16kg4FDPk5JG+cHwMyCCSzt5JHL3exLuibqbXnG8Xvf7ug5PV5nCsfBaufPRbu40FxohXi/
	F8mmlRevvehg/P9GiEWisa5RKLP4WK4fAkfgQwfPWRxYFlxvoXsbJruobiINETuf2oVPnlcC4r4/X
	mO9ERj+72nY+9YyVIoo/kd5e/9RH8pmVQIlVUlY2Km2mu0W4ziLgFN6m/ruSWmarfE6NVisb55ilK
	iAU33Ry8a1J+uwP6XBMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFnE-002m8O-JB; Thu, 08 Sep 2022 11:34:00 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFmx-002luu-VJ
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 11:33:45 +0000
Received: by mail-lj1-x22a.google.com with SMTP id z23so19556142ljk.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=SHyR4FRu6T2HcLl5xmxY+V3df7MUMDZkcL9KsWa8P/M=;
        b=ajrcOYDhY0MqBe/iaQtMLbZEPnCvrEafzbHJbHN8ZmpWM5+jlPx+THqBtLgXc4zyUP
         XBzAEw0BSVPADegegOOELR0XtOjbnpjpvd2WTcJkY2i6WMBekK84YX8YtoTANf/qOfH/
         nnGlsRwLMAh5/4yO8vTksgjLVWi+4+3OrJK6UlsnqWtOaol/hhcJ+B1I5Aw602UbbcbU
         D74kae7ZKme3o3GkOam8vxKsKWfGjHtUqn5F6RVleihYURNJ4G6ICgBya2qykY+szOhn
         LNH+iaEgv0u5mOu5ZN8qkuz69X7IOe1sv/eRaYyXoyrohrjNX8QXkZFk1p90QEfaRVJz
         xdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SHyR4FRu6T2HcLl5xmxY+V3df7MUMDZkcL9KsWa8P/M=;
        b=PndPG6YncZaWpmkLoFa6nTKWwCpCvP4a1DXZGpo4M5cC8KOK9vzl/QwUS591B3Hg0A
         0oS9oe10W5yjFWONaKzX/FVRCYnGubYyk5lyHEKHAxU4ezqGON3q2zHIjPywUnYOWPth
         S3ixUQyxAqRziq1wG/AQ30eHMrs35GWI87oNRdcUNwZcsI/DWil/ZB+stiycvBMSoprU
         SUqtnjDP6iVuuveTzar3T5RRDL0x2uVJTRlJPrEDIwFu4VFwk7Fod18TYOCn0iVp6wEY
         SvPWGRYMEy/QEytGjuK++2Zs/0Vwt5HwUjcJ3oXYkrCquyiylTUzaTPDZcwdTSbKKRxH
         O8Ig==
X-Gm-Message-State: ACgBeo3WlFB9QLM/oP+TdpRe0e/+z3yWf5tW5gJWOEm23Kju5oa3a0p5
	Vr71lCD7BShof9oyNW+mQG08Mu7Xp6S8bg==
X-Google-Smtp-Source: AA6agR7YNjVF4CnQ3ndSgVJn98vT9qcDXD21WnxwPbPRgvbQ5LtOMNyq4DAjXdcJVDjXT/qdR4EpeA==
X-Received: by 2002:a05:651c:245:b0:261:caa7:5be3 with SMTP id x5-20020a05651c024500b00261caa75be3mr2195487ljn.334.1662636820680;
        Thu, 08 Sep 2022 04:33:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f18-20020a056512361200b00498ebd60c35sm247928lfs.165.2022.09.08.04.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:33:40 -0700 (PDT)
Message-ID: <8528d39e-c03a-7d83-d8e7-5191d3110015@linaro.org>
Date: Thu, 8 Sep 2022 13:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/3] riscv: dts: starfive: Add common DT for JH7100
 based boards
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
 <20220902100806.2378543-3-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220902100806.2378543-3-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_043344_058029_C604821B 
X-CRM114-Status: GOOD (  11.20  )
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
> In preparation for adding initial device tree support for the StarFive
> VisionFive board, which is similar with BeagleV Starlight, move most
> of the content from jh7100-beaglev-starlight.dts to a new file, to be
> shared between the two boards.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Use proper arguments to git format-patch, so that the copy is properly
detected.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
