Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC67C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T28WnLtQ0ytsDX10dr7qP+h7VAxhdE0oUG5rVqfN6kc=; b=ThkFHOaHSpkd5p
	b4bCI9Hx7xNkUMJvLweP6H5Ar5IGPe+j5lbDXEsSBu0QCDw3pt9pY2QvL4Wyl09Kksl+bqhWX6bfy
	sqwQrOxJekdELb7nJ+5hH4Y9bjQu5UhkzSiOOjiifPtoaHpXukIWiSOpwg9qdkQ0lz/ZcWnZt4Gm8
	F4x5aXxxWtutSZnRZCvbiyxHfdGQ5F+wfGJ/udoNgmSJSitNHBaMXq23hD1tG3W5S7M9PKxX5WFoT
	+1b/M2yzvPRehUc+LrBMM0fWQrYIEMqD9Eoa9xRKFIL5ezFCsRhMGbEQuLiHta+JFlGYgAZ+B4V/v
	CDb//IMm9Gw6pGK7Mwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyXx-00EXOv-SI; Tue, 17 May 2022 14:51:37 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyXv-00EXMj-JJ
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 14:51:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id o22so21178690ljp.8
 for <linux-riscv@lists.infradead.org>; Tue, 17 May 2022 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fItPi4WH6eFny62sNLwk0x/dSWz/KeliSihrZvDBGCI=;
 b=SKZXvVEkhFni6NzylNm4G0Pn98ecOqHdH6IY3kqNwRU5BDemhZl6Sv2QTHDZ0+a3xG
 3sHhiJ5rmPPO3CKqKQ+qHC+LALgxaG8MIqca3q6NaME1w9oWFnt/T+GbOubX0JaGfbVo
 I14YjlrOIt8p9CeG7NNfLtfQyn7Wnnutw46/dJDMRe72Vm5F3esQbw5nNu6drp7I4XmU
 GGF7duSC0YFVk5pOpwxrXEATYaGLxRMYwkyZOLlSvH/0pTPrgcbN6hd8ihEWvtLRpivt
 OKirjfEO/QElSePc92GOVlV0B/ybygpT8Kr5aP6WO14zg4+ZQbcPb5rFNiDmwhUncKBh
 QPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fItPi4WH6eFny62sNLwk0x/dSWz/KeliSihrZvDBGCI=;
 b=JsrQCEaoUYqeQeMn/HqQN02/ZWQt+Omc2BjTDibum5IfVeVWM2Fe7yuKXWwpFlYcQf
 kTjLh1HX44tlnZ06evj+URFVgk94gr4tQn23yz97uKrngtCmeEXZvBHKRpgJPe7lM3bW
 tS2pRUGUadRym/PcSBH9u95v+lGL3N4vBRlOrECMRQUMGYcZR0OK0MGrJs8+ddkx9gKE
 zIxVa/voeCSK+r59uYF3cEm/RCm9QXWMXGzU+JSYA+UN/mvYQVMo4asTRxDOJBZJbXwN
 hbaK0ICdPDswhAwnvpFIKleqAtUc/DxotIq10qpLePiO0Vvv1n3XRTi3KGlvbpToV/Uz
 T8KA==
X-Gm-Message-State: AOAM531k3MgGAu9J839kLqhE7p5SRtxXt9V//er87Fy7SnrOKpYq74zh
 s1d6a4by/e9FCXYPQqFFNvrH0w==
X-Google-Smtp-Source: ABdhPJyWm2Zl9OZhnOZge8xJaNB/lSejMQtbBHoeyzWsyXYfqc/xhWPGsDcU2RUdb22zZ0kRvGkOIw==
X-Received: by 2002:a2e:8e84:0:b0:24f:1d40:ceb0 with SMTP id
 z4-20020a2e8e84000000b0024f1d40ceb0mr14890942ljk.292.1652799093975; 
 Tue, 17 May 2022 07:51:33 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d7-20020a05651221c700b0047255d210f0sm1607514lft.31.2022.05.17.07.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:51:33 -0700 (PDT)
Message-ID: <0f9398aa-ab7d-44e4-033a-e13bf57f88d2@linaro.org>
Date: Tue, 17 May 2022 16:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] riscv: dts: microchip: fix gpio1 reg property typo
Content-Language: en-US
To: Conor Paxton <conor.paxton@microchip.com>, conor.dooley@microchip.com,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Lewis Hanly <lewis.hanly@microchip.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220517104058.2004734-1-conor.paxton@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517104058.2004734-1-conor.paxton@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_075135_703330_A7586069 
X-CRM114-Status: UNSURE (   8.77  )
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

On 17/05/2022 12:40, Conor Paxton wrote:
> Fix reg address typo in the gpio1 stanza.
> 
> Signed-off-by: Conor Paxton <conor.paxton@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-

Pressed send to fast...

Please add Fixes tag, unless fixed commit SHA is not considered stable.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
