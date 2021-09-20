Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331F7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF46D61077
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF46D61077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BL+CeW/24+/D4ihJa+UMSPRCr8+CJEfizL4k5BusKpg=; b=prVqcklr5jU7FjYG2DGWrrt++I
	9Q9NTVO9+/72rZFS+Wykhihm43hxrnvYtAjvS7yDLQOm3doXuj4JYQpfC4k/74ZMFwTXchxBpsU/W
	L/Y6LFtW0y3NbGdsp+VDCjmBy3RPxwPIDNjSjrGCQlix4bP4pX71TXuA4h3x8yjoWGGbJ8IyFVAx4
	dTS4D1wtytX9sWW/SWk9/G0qq5cOhQE9JQimxowWuSTj7XipoOwGSB3oTCCD2VQP71Gmf5iFG0RLb
	SXKSc4jYqbcb5pKo7nR/0SSJDSezeaRwbsZd1Abr0YIwt3Ow2582ATyZ67oEu1WPlPK/xlbHVEiii
	1tN1VnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKmH-0026jR-LM; Mon, 20 Sep 2021 15:00:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKgK-0024Br-2V
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 14:54:09 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BEF8040197
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632149646;
 bh=V0X+3uidaeyp1K6mH5laK1N1lZeTwvHcyGOGgKbVfnY=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=iQ5jiAUZT3HUCVEfdHYiBjz5bV56hvPG0zI8zfqmetNVR57Cr+Y3N00m2IsbKKvtX
 At9kUYO/rQDdEngpaLiuavnLbDbglkSwXYxDk0p3IgnQ1SUvb7PM/JwthLKWxkbhkv
 2cMD5n0fyJt8AMytpHFxe7s+rbw+0s9k8QqH9TTtul4zGLIlK6xEQ5F+KHBeCSLE0/
 1oOa0SVKTauQ23ZB0G5tkuewocRPW7hNtEjIxGu9CtDAcNQqG+A0Ea3iNtqk6Y6KoV
 NYJWhHa9IXqCBYhyraxlMFXTkI9zrb924Wf9IxOa2pvf3yb9LOYo+2GCNygzG3S2wi
 Q1+zdY9tjq47w==
Received: by mail-wr1-f70.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso6324643wrn.4
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 07:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V0X+3uidaeyp1K6mH5laK1N1lZeTwvHcyGOGgKbVfnY=;
 b=dDlL4r8zHK/3/VBmQR8uVRzSa0JEJg7Tl6AfgOc23MEzT0z4g77pvfnmCJyFnB6vSQ
 s2K9hKp0oCuJuZVsgaWTdWRXWiskwqyweLOntcb/o244cO6Ki8QqBDm27MWj8B/nTKv3
 BD+2+Rgq/6Ayx1YqBnXND/igD50gg+D0K3z32tu5vRaygOVd9dDfasOGCnq5sqlhy2dU
 GP2sj0Cwx6UhNBT9AvwG0sEyXBnvCci72I+xGnYYXl2Mv6tkmjuDT6bsmV9IGbKCTjpF
 M9QndTsf2pRET6l2+nOA/8z5Dcib9WYcRiFoWifWWZ4GPfTqYHyiabjnPmQtbQGxLQBl
 RbFA==
X-Gm-Message-State: AOAM533gIXUSXsv4LiB271lhLjQGmAUIybB2Nh/MMjtcXVlJhSaV1VNz
 weShnMTaBIrRviQvBpRagf3wEHZh6FTxea4Ou0cT7pnd63SJ0y7CGEu9canq7u5vzGYY7XqOGsl
 Cq8iS2Sh8IAL2dpq29BgSee3TMEtjYijg5l8sypkiH/LspA==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr30489023wmi.10.1632149645795; 
 Mon, 20 Sep 2021 07:54:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKtZyLQklhvFP4E8CIP8/HFnNPR2fRGO1PTaijQfdrYO28OItWxsrb7LXGbo8xKOP7lAiUbg==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr30488997wmi.10.1632149645581; 
 Mon, 20 Sep 2021 07:54:05 -0700 (PDT)
Received: from [192.168.2.20] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id m18sm16064557wrn.85.2021.09.20.07.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:54:05 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] riscv: dts: microchip: drop unused pinctrl-names
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
 <20210920132830.152802-4-krzysztof.kozlowski@canonical.com>
 <CAMuHMdX5vhihbKrXh4x_VyA2Cc=nR+53g_fZPHsuHVF56rBvMQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ef5771df-86fa-524a-8a5c-c519e913330b@canonical.com>
Date: Mon, 20 Sep 2021 16:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX5vhihbKrXh4x_VyA2Cc=nR+53g_fZPHsuHVF56rBvMQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_075408_305990_4A313658 
X-CRM114-Status: GOOD (  16.23  )
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

On 20/09/2021 16:32, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Mon, Sep 20, 2021 at 3:28 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> pinctrl-names without pinctrl-0 does not have any sense:
>>
>>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: 'pinctrl-0' is a dependency of 'pinctrl-names'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> ---
>>
>> Changes since v1:
>> 1. Add review.
> 
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> @@ -33,6 +33,7 @@ properties:
>>        - items:
>>            - enum:
>>                - issi,is25lp016d
>> +              - issi,is25wp256
>>                - micron,mt25qu02g
>>                - mxicy,mx25r1635f
>>                - mxicy,mx25u6435f
> 
> This one looks like an accidental addition?

Thanks, I screwed up something during rebase... I'll send a v3.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
