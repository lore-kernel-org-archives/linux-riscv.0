Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1yagnbxBD6sJKIh90CqSXJY+cVw7HtKNsjZr5pdGNI=; b=iWbbfATIm8aTzX
	07IUkeBLon4KXMByk9otY4Sq33F47bTDWQU6XEmpNTI2YlYhy7RlUawbaiC04LIRM2FXTOYkfoX1J
	0aRJsAIZpPd9Porgihmt3V8+ScPmF53bOfwss6ZP7T9nrXiGwB13KjftVLDZlsRpOM4/ht1jMeDFm
	L8ZqYqzRgIFIoi31cBNI6UBW6DKJz6Zd+lFF2V0+bsmSnjiq07iORfE0LYE6/uaTo6D8GVeNwfzXS
	R1Yq+GhXqNuxA6+OmAe8V/ld2V72Mz0B8BX43gtpdcLlqIJ7fwavZcF3gQHvehBCjk/rxMJBLMpEr
	LDaSsqO9tL6WF55XHWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXoW-009m4V-CO; Fri, 26 Nov 2021 09:46:40 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXoT-009m3D-QN
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:46:39 +0000
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8BBDC3F225
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637919996;
 bh=73zLuZ2dxcezwU+sKHs8KDJp3d/tg6MqvOIgw/POuyk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=C+c3MthWMF62xI64pVUveDZAOLcUx65UE/Tl3FylIjvisFld+qdMrBRZcpULlY68u
 mvYxHZkHVPyneo2VOGoYFfyzyO4q2K9iSvYrhI2UaPiucfxrn3v1b3d6TpHKcdlBn9
 GEOH0HygRwVGdDNjY44oI7p4py1NdqKzhRHBalKqJMq/gUZ3gqefGnY5rxEAf2Bkfx
 y95v/S33vIX/d0EZnNrxWaEUyYCHq1IqDV8fORBfrBjzHYJ68g5aPDY0LYs8v8LW2a
 6Ry8ggQi95QOsffSoOgHdyl3NodOk/PiMjONaRWLFU6ol1+03BRF0VkWxDKqT4GSCK
 1yRUke51fdbTQ==
Received: by mail-lj1-f198.google.com with SMTP id
 d20-20020a05651c111400b00218c6372b7eso2995433ljo.16
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=73zLuZ2dxcezwU+sKHs8KDJp3d/tg6MqvOIgw/POuyk=;
 b=uUPyDOXf5glzTpHj5jTobw0ovxK+ZEumGzCxdeBY0v70sccEHulrIXNKEiJBlY5l1A
 BUHsusi7mlvzJA8Iu16GG6FdaXFxUh7fO8rSQoNhbaOSIILyuNVyaO/U/6E8pLBdAtcx
 xhCcCsg/Ihiy8zI2Bjp3C3bfZ9PkGPLDlDvlKxkRX/dNLb1eK/Zzcg4AIcuB/Tn9Fkc3
 mV1u5b3yN0lgk+gietJd+uF4BfEs46by5R/93lZYP/mVGRyl3AiSsQi7H+4DBawD7pr6
 WBs5memh1zMEwdoBodrGoLrOF2j3fORdWrCjqgw8GbcibDtWS4B3LuwegLcXfmsZgyZ6
 9WLg==
X-Gm-Message-State: AOAM532K9r2UrcqVnqpmJIQExlSA6BMgrHYo9kUd6axCfkOd2Y7zT71G
 npNAVFC1fZO2N5/ZtI3T71wz/gxq5zqbj9Xu2bMZ4MpHDfdsXz3vWP/zfIeU6Vap6ksoiMjiVOS
 M6fJhd6TAgS/AVHKlLm/4S99QP5hr4CTxv/iX18UdcllpRw==
X-Received: by 2002:a2e:b056:: with SMTP id d22mr29955316ljl.470.1637919996064; 
 Fri, 26 Nov 2021 01:46:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyOKwmhOXNa9ykIhkMDMiAAfqcM8veJucWOyrO4Zd/fnAoKaJPILWDmpuU4zA2hTuoIe3rOQ==
X-Received: by 2002:a2e:b056:: with SMTP id d22mr29955298ljl.470.1637919995910; 
 Fri, 26 Nov 2021 01:46:35 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 s15sm462025ljj.14.2021.11.26.01.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:46:35 -0800 (PST)
Message-ID: <13128979-af88-6208-4d91-23950a285e95@canonical.com>
Date: Fri, 26 Nov 2021 10:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 8/9] riscv: dts: sifive: Group tuples in interrupt
 properties
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-9-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-9-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_014638_052565_1FFE1B22 
X-CRM114-Status: GOOD (  11.94  )
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

On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in the various properties containing interrupt specifiers should be
> grouped.
> 
> Fix this by grouping the tuples of "interrupts" and
> "interrupts-extended" properties using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 21 +++++++++++----------
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 14 +++++++-------
>  2 files changed, 18 insertions(+), 17 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
