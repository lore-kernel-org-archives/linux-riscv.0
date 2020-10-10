Return-Path: <SRS0=zN9r=DR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F30C433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2020 09:04:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4CF6207C4
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2020 09:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbOTXEPK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrufEpvA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4CF6207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0CqdgHNuchQEEZNuHCErrmL3TeqFk3s3Ee3jTHYQz6Y=; b=CbOTXEPKoY+vlNFa9kQ4m4EY3
	WrM325Y1wQ0FEl/meml+R9jN/TwIR69KmCD7n42DIYES62+Wt92oHAA0gzxJwCfFsThcrrR+mmHMq
	NBx27TTSMMufl3uiEjqYWfMFEHpc36TY+bJ5pgpF5ZyLqmxj/ykssiVN8ao4JaDgl9Kiiayg2X9u/
	bmwrMyT2Ovcbq4p3j4LC8Ihehyo6Cnw6XmNiBOq/IqmjruDjVcxqRwWWVHlOh5HW9OO5db6/kow/u
	b49FkLUCm0LMjgUTmR9KKtr+Zbuk6HnCGs1Lfey4FGUzgwBmYdhRTj3sYTYAYDgvjrL2YNmRQFU85
	GkULkpFrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRAnw-0000yZ-Gx; Sat, 10 Oct 2020 09:04:40 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRAns-0000yA-QD
 for linux-riscv@lists.infradead.org; Sat, 10 Oct 2020 09:04:37 +0000
Received: by mail-wm1-x341.google.com with SMTP id d3so11997493wma.4
 for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2020 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=obzmRsA49+kN9nLLhhuvco3Uy76XSh6EQ8QxAczkyH4=;
 b=UrufEpvAYBZDtrrcoVOX9u4Pa8c9JgWK9jAKhwQTprgcMonbFk7+1RbceT8lkr9kIP
 fuYTOjjvCMYDqJAhfkfTRmeC7Zc24xCU0nUPruSBeKcsfxCOEtGvyxfXjxy5jmR5lwkc
 4IHuLX5zzEcBwqiI9DYmt7Pnvio6PlgU1NAglSmkpujqdrFo/ydqKh+ij/ZepBzukj84
 hEjvDSIdfZEXIbNilmASTz0RkWI01lmk4of//xPRrWpPaQkU/TMtBkX2spLA4s/Um91P
 2ocQRU5XcfHhddSN2aL7H10MrzrCho9B6bdiky5yTbOlyEYG0NheJgihs109l6jO1/yV
 gJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=obzmRsA49+kN9nLLhhuvco3Uy76XSh6EQ8QxAczkyH4=;
 b=fe9PevO0BL9Kgp8mA3occEQTwDGv5uXI4SaoLcIRenGEbl1S2J4uiId1uPeUkTjgCT
 Yq1OCuFdwU8p1RmGffyjhj+kdz3esOkp62+CNDVQLs02KzLV0UVvj+0yZxEusUKRgHPt
 td22IPjlSk28Qxjuo+gLl06HUg3x5aCFzVwXi3tNcCOtY1YJ3z85GTpHpQzhrtNm7hQQ
 qRJmc2SuWsDY9Y8JcbPd8kNLn86TvHWuTE/xTtmMgQgHs1t7RTYNaRadnTEGNSijW5St
 LltBo24fOA8MDsbCCcIox1kijh4N3wJHyfCd3fAzHf9/puL5pan7T37hoOerLLlUTuYK
 aswA==
X-Gm-Message-State: AOAM532S0dc0d+SNF74sYcbOE5B35GkJ6DiIJP3c6jQCWsg+5p1YC813
 H2gTfRFdtW7yuHbKujbrI+k=
X-Google-Smtp-Source: ABdhPJyOWCYq8HTIrJ10s9a6rJjjy3r0hgPGOb9G/M5AN/JBrJ/WFJZVlbpWRluU+DZIwA/MsjWUNQ==
X-Received: by 2002:a1c:2c0a:: with SMTP id s10mr1920266wms.103.1602320673727; 
 Sat, 10 Oct 2020 02:04:33 -0700 (PDT)
Received: from [192.168.0.66]
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id j17sm15700595wrw.68.2020.10.10.02.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 02:04:33 -0700 (PDT)
Subject: Re: [PATCH v2] PCI: keystone: Enable compile-testing on !ARM
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Murali Karicheri <m-karicheri2@ti.com>
References: <20200906194850.63glbnehjcuw356k@lenovo-laptop>
 <20200906195128.279342-1-alex.dewar90@gmail.com>
 <20200930182138.GA3176461@bogus>
From: Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <91c7c7b5-fc97-325c-7cba-520d99eede9a@gmail.com>
Date: Sat, 10 Oct 2020 10:04:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930182138.GA3176461@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_050436_875917_57CDE0FF 
X-CRM114-Status: GOOD (  15.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Dilip Kota <eswara.kota@linux.intel.com>, linux-pci@vger.kernel.org,
 Jonathan Chocron <jonnyc@amazon.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Vidya Sagar <vidyas@nvidia.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-riscv@lists.infradead.org, Thierry Reding <treding@nvidia.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/09/2020 19:21, Rob Herring wrote:
> On Sun, 06 Sep 2020 20:51:27 +0100, Alex Dewar wrote:
>> Currently the Keystone driver can only be compile-tested on ARM, but
>> this restriction seems unnecessary. Get rid of it to increase test
>> coverage.
>>
>> Build-tested with allyesconfig on x86, ppc, mips and riscv.
>>
>> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
>> ---
>>   drivers/pci/controller/dwc/Kconfig | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> Acked-by: Rob Herring <robh@kernel.org>

Ping ping? :-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
