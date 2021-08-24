Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211ACC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 19:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D365F61178
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 19:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D365F61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ctVOg9reJVG8EQFl1LEfC19pDEmJXobwFViTvWZj250=; b=KSEHtLRF2qPDUFvhX/FwmpyZD9
	eWg1GolHIFeMpEBzs3YOjMu8lwgK9jsSURPl7iDKpEBm67ddmVMTUDeXWK0flMysijn13IML/eUA3
	9TUF12OjuqWSGm44szR6GbYeuYunJ53AP+4l9BHe68Pr1fufB23GEDbMa5caLiEou4Zbxoeaz6+mF
	kwWiwLnpvgwNbacQoi21G6WkFddWDWuOH6Qn1zslTxCNQ7dtQj7jGYTku+mmpseb3/+db7+P/omYB
	HQbz1xAX4NDfgePxv1D/msmuFWi4dqQRMsP+gV7SUtnPbs0sNZRQmR/fIoOi10loFHkCGG5RrzxwG
	GvKCmjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIbhX-004SZc-RB; Tue, 24 Aug 2021 19:03:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIbhS-004SX5-48
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 19:03:10 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 297434079B
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 19:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629831773;
 bh=tXo6FALvM7TQ/HZAw0MdLp6mungZZc7pCeMeJQgnDkk=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=PBsNzdle4RD6PSXjopYhhOTB87CN7E6iMJlPj+s2SVwLa7+aWS8+MT5IgW9GeHear
 nyaPAgcc7s4Ix+by4lj5Ajr4hU5SaziKUrK1HD97tYrbstLQ0d3PdyrC2Cti/16reN
 4ksbLUaN2O0K2sK2sQltxkU4EV3spfaAQ2uoKUgKmK7QU1ozoJPaqM6BlJjGIh3c6W
 bHg7Le8ftFUYVIwXwx0AytqAWYqBB8qrZykZpvcu1uP2IbMVc2okNe+q1DJ1HO4kgB
 AB5t0zUhhxh1wOLqSAmtTLT/NQ4Kv7bAzDXtk2WcBHPBOnM+LODEdrD0pkYFhd/Loj
 gziHKiFr31feQ==
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so1633242wml.5
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 12:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tXo6FALvM7TQ/HZAw0MdLp6mungZZc7pCeMeJQgnDkk=;
 b=aXBHy7OuwvY6GaZpu4l1TmYiPD4X+2+ESgzGPOdwrGmNFSFAabpmY0z+gMbRN8dhHD
 IvI2zKtjcl2utbYBgB6Wh6nYvE6oQ+VlzNraTeQ8Pk7thEUZ9nv1SNgVJ4vPpGCEtC4n
 siOJdF/KJ63MJq4R9z8IJNl66VtIV74u3T/e47K4Nx5GWdTm91YFrImyHgDw9qOOHjQo
 eF63QxA2uOFSh+9ZdvpjvfX/rGpe22pFge2e6nApdWLQZx9vEPocbKGaLkzdLLLcFjT0
 nSSQvBy3gMxKkIrQj9WLul2+fAKh9IGkUD0N/BYhz/8HNWQGR5EtSvhSf9DSzcwQ5mcL
 gogw==
X-Gm-Message-State: AOAM530QzVL0Wl4shyzADuf+64scUB+osL4XpvFPABMvIoQq8vLGMRTG
 +S+gsWZRTLvQKxfpzcIs6/DTqPskBp4bOPdMxyZO9Zd7GsIAnT4PDbsmGycOFlXVvf58dMX8tlf
 hTHROCh4nRDZYja3CLAjCJQfg5vsDsXCRCSmYkpiDO2/XYg==
X-Received: by 2002:a05:6000:1081:: with SMTP id
 y1mr19755873wrw.415.1629831771808; 
 Tue, 24 Aug 2021 12:02:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/Nq9ck+jffd623Tc7f2vLQxJV7O8vjvKSyxvbiu6imcb5omWNkifvBcdaBd6SM5xESLiGyg==
X-Received: by 2002:a05:6000:1081:: with SMTP id
 y1mr19755866wrw.415.1629831771683; 
 Tue, 24 Aug 2021 12:02:51 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.31])
 by smtp.gmail.com with ESMTPSA id t14sm7449255wrw.59.2021.08.24.12.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 12:02:51 -0700 (PDT)
Subject: Re: [PATCH 2/6] dt-bindings: mmc: cdns: match MPFS MMC/SDHCI
 controller
To: Rob Herring <robh@kernel.org>, Atish Patra <atish.patra@wdc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-2-krzysztof.kozlowski@canonical.com>
 <YSUDTSuNlsOmu/G+@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9423ddab-4635-ea15-7a9d-dbcf1bc215dc@canonical.com>
Date: Tue, 24 Aug 2021 21:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSUDTSuNlsOmu/G+@robh.at.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_120306_360546_376A9FBC 
X-CRM114-Status: GOOD (  12.84  )
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

On 24/08/2021 16:33, Rob Herring wrote:
> On Thu, Aug 19, 2021 at 05:44:32PM +0200, Krzysztof Kozlowski wrote:
>> The Microchip MPFS Icicle Kit uses Cadence SD/SDIO/eMMC Host Controller
>> without any additional vendor compatible:
> 
> I think the lack of vendor compatible is the error here. Experience has 
> shown that vendor specific compatibles are needed for licensed IP.
> 

In such case this could be:
1. a specific "microchip,mpfs250t-sd4hc", which
seems to be on MPFS Icicle Kit:
https://www.digikey.co.uk/en/product-highlight/m/microchip-technology/mpfs-icicle-kit-es--polarfire-soc-fpga-icicle-kit

2. or a generic "microchip,mpfs-sd4hc"

Any hints here?

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
