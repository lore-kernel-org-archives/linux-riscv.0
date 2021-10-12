Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27832C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 07:27:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19A760C49
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 07:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D19A760C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=41pn/OBjK9Ntp/0+FHodMJjKX6sW6N9eB+N5RYUngqM=; b=nngxMOEZTemgUj6yqgXzvE3xTK
	4BFlA02yJKlIOBlI951+IpmImxWmzxOLiW1vJkZcPuAi28zVs5BxIi8Ha7f5BOh584Yw5s85An7v4
	YMV0k10O3pkPni9R7xvI2EZ/hqJsBLl/U8HDBgHop/T8SMchEH0y9aXVNrsPetoQhnjRokCYHUUli
	zBEzt9v16bbtRtgXIj9eq6iNX+nverLwBpEBO1zTq6KPHZq+0TWxAX9rx5WVhebzqXhGlX0HVVeXS
	6mK34L/m/v/YAUfGzQ9LeweSc+qCfVejxXrecyBsZrj3ZDu+VsyizNL9QXYUO4GLGPuSAJ+i1SH7+
	iPLtYA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maCBm-00Blw9-7L; Tue, 12 Oct 2021 07:27:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maCBk-00Blv3-4J
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 07:27:05 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6DC2E40000
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634023618;
 bh=k2NEwJTMkdNZ/mQBT62GUXF45y2w4za6ULFuaRm133M=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=hsSCYjtcroyuxwL45MBHQ8y2l8rmaE3oNDx9hQuhmxxzodwUd2XlbApModygJLtcz
 qTc3wwEGdpCOKIYEUwcKcEvWERH8Q6Jvjk8whx3khfjkt6vwyTrd+eXbz9pyNg+pWW
 tEFoMqdzs3lfzU2+0wZMV8gipxqKj9nvNpyYVs1SuV4IV5NB52SW1IG+HEAi5e1vhh
 zBUk6kiX0DK8PrIYLXjwW701qZyXB0tyVDMZzXPIcY1AqAfSdl1OyTPbk3U4JmB8Zz
 aFIOzvRvc56dSPkDMXPuIr9sxGnuLxx+7AbYZaxfMAsBAhn6Pl6CW1eTnPjcIT7DSW
 S1fuHK8eSOrHw==
Received: by mail-lf1-f72.google.com with SMTP id
 bi16-20020a0565120e9000b003fd56ef5a94so13381954lfb.3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 00:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k2NEwJTMkdNZ/mQBT62GUXF45y2w4za6ULFuaRm133M=;
 b=MG/TfZUbb7RQvduPStien8EZBJAj/poAtmljRp8qAjZlHt1MCEQMrdpggw407Q+gEE
 n+enE1puOlsFhwK1nU6yKCWp+SAYAuIUOkTJ1DSAgzD4EJK1wTbvh1PckHdkNPIVt7/W
 XZcOAWPUEYrQQFMd2ZLWhWs6nRRGQQCNkCg7byLv20InGb39v8pICH/1qtN0GsDpCvwr
 418Mdcw2jbVhVIQB48jS7hxlSm89hcwONBFbwha0tCVM8igylKKoD9vDOx5/MEALlFxk
 tCnNVH/Go5kx7FxNV7rs4CiQf1vuQOk709PV/LOikyifgUkb1Azll3X54NgDDZ0vJAYb
 joGg==
X-Gm-Message-State: AOAM531NQO6RgBr0VKXDWUwQVTrRUMR4qw57ivTn6YEwb/QLZj4cuN0L
 0clL2oJDVKw0C7onPwaX22+4CbQXnwbl4dEij1ri/h7XvFQ0LdfJcSHpmh+uMGu0pqkadkOrqV1
 F+t2yFUeCgZeLOLoynBUTp3+0JoYVbQFoZZFAPHi3hf3J+Q==
X-Received: by 2002:a05:6512:1196:: with SMTP id
 g22mr8857292lfr.661.1634023617755; 
 Tue, 12 Oct 2021 00:26:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4GFs4SsQ3dTIrIIjTkzK2fCPWl1cJOA8SGQyTyUrED6DMlpgotr7qOq4gqkacaBZsg7BKGw==
X-Received: by 2002:a05:6512:1196:: with SMTP id
 g22mr8857282lfr.661.1634023617586; 
 Tue, 12 Oct 2021 00:26:57 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id d26sm1185415ljj.45.2021.10.12.00.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 00:26:56 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 1/5] riscv: dts: sifive: use only generic JEDEC
 SPI NOR flash compatible
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
 <CA+zEjCtTbJnvmrM1g-CR8ZUtT375Wd-4dt0YR1zLG5nOvtDyGg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9a2a01af-3e34-b454-3ec5-930eba8b435e@canonical.com>
Date: Tue, 12 Oct 2021 09:26:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CA+zEjCtTbJnvmrM1g-CR8ZUtT375Wd-4dt0YR1zLG5nOvtDyGg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_002704_340104_DEA74E3C 
X-CRM114-Status: GOOD (  14.13  )
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

On 12/10/2021 06:29, Alexandre Ghiti wrote:
> hi Krzysztof,
> 
> On Mon, Sep 20, 2021 at 3:05 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> The compatible "issi,is25wp256" is undocumented and instead only a
>> generic jedec,spi-nor should be used (if appropriate).
> 
> Why not do it the other way around? I mean adding this compatible to
> the expected list: don't we lose information using the generic
> compatible?
> 
> Thanks,
> 

We discussed it:
https://lore.kernel.org/lkml/ae4c58fe-0af5-3f1d-cc16-27b78772cbb5@microchip.com/


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
