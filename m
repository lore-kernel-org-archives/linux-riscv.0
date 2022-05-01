Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCC7C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJflbudeYKfAgoBDX2WIXoLukGlgWHRgIGMC0KJ1gH0=; b=aLJiDFK6TnD2NS
	AET915TqvgWvf9c5XwaqNdiy34Xv86PJ4okOmkTHZPP8uFbw2/0q6MnTz9v5zc2MAoZdYQc5UB8yB
	oZyhOOpqoD+RbnJInGo9OiYkeFAi07D21ECK14MBkVF0OvYzjRCaPrpKjhQbTbHy6zzUjV2d7lh7C
	0IABBz4DDI2b5INHmLaX323r4G4z3VIErC//7s5iEqWStHjfWFOPdDiSImkMXevq4r29kO1dUBjq2
	eCGEx0OzHHaYIoyTHhqmGOd2CYyxLfr46NilTTYRry6snZtJ0iw7zH9cy5aSNmxTTFH2Th3eW6Zk9
	pS948UO7U7mV9Y1POKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl75y-00G54w-Ko; Sun, 01 May 2022 10:46:30 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl75v-00G542-Ci
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 10:46:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t5so3079796edw.11
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9qOu9Cvk/rQS/773XlxjM7JnBslFeXLdPBuq74VV3jg=;
 b=nlPKmT70hbR0MrjNXx2aySew2ZrKPYMjoF1vO0zHZ5m03q345amsb4c9O0ADsfdIBW
 LgPuoG8YJcKYumhBSO14hIUki2NIX597SDoxnM6/SodzPRloOXv4PoE2IeaQQ7REO/Ne
 HGrzwJucMi1iA58JZTXoNI5BzbaQF8p4BPQpQ2oWJpnyHbUKip0v9v/mzBpPLVKSHwMP
 Ce6NMKMDq1j+KNu8oRc0sTKa5g0LCacWgGWnllXJpoLDUYhkJvnxTOxzPIiegbfZAGkV
 en/PAI3uEapvtRoMeHNouI+vH6UPV1fVvun5Jpfl/VVwzlNJGmjXWy2wxO3MjOYrUC70
 Js8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9qOu9Cvk/rQS/773XlxjM7JnBslFeXLdPBuq74VV3jg=;
 b=76S46HdkX5Wff/FUXo4hsEtkavEcTYvaSaPPWELoaS2+lOI6FI5aR2Ai82zjivskOB
 ce/Hoeqpcyh7w12uY+akgqdQBnLE/D4QLf7hUNXFO8sakfiEdRpp+VFASe9vtKWp6hV2
 ot198+asAYhTXTWp4JXzRLvsEXGi+6HDIoZaJMUrUvXqoUZaEJNWehpApBItTvA36Iyr
 hdbTHOh7w6p8XZIoKc1f1IthngiCfU6NsT0QtLuVqjWPPMU90sWyGyCrG4qVBTCNgQDX
 7+8SxASp2qLwlnfrdzpq/D7mzjsi4FgENh21uksdMGXvSgW6P8CcuM3IwFit4s1hF3zE
 ypmQ==
X-Gm-Message-State: AOAM530D4SG3Z773p2mhpUKqe5E6WUO/o0ar5q/dgm4bfV8t3xbv+HUN
 USvWNvHmDkTVvxMJN41tifkf0w==
X-Google-Smtp-Source: ABdhPJz6vw3rvue9OR5zhB2gQ29VJSBr9KsSJnbuRO3PrO76PesRzgpB5WI0ENM04kL9zEeN40LN8Q==
X-Received: by 2002:a05:6402:2291:b0:425:deb5:73be with SMTP id
 cw17-20020a056402229100b00425deb573bemr8197311edb.392.1651401985401; 
 Sun, 01 May 2022 03:46:25 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 dq10-20020a170907734a00b006f3ef214deasm2484120ejc.80.2022.05.01.03.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 03:46:24 -0700 (PDT)
Message-ID: <00577fde-9c13-5a4a-006e-8bbeb3ebfb11@linaro.org>
Date: Sun, 1 May 2022 12:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/8] dt-bindings: riscv: microchip: document icicle
 reference design
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, krzk+dt@kernel.org, palmer@dabbelt.com,
 robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220430130922.3504268-1-mail@conchuod.ie>
 <20220430130922.3504268-5-mail@conchuod.ie>
 <258640cd-01e3-2a9f-b2a5-79b2b6cc4f59@linaro.org>
 <6477d21c-206a-f062-793a-7dfb801aadd7@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6477d21c-206a-f062-793a-7dfb801aadd7@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_034627_480170_FC265126 
X-CRM114-Status: UNSURE (   8.39  )
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

On 01/05/2022 12:41, Conor Dooley wrote:
>>
>>> +      - items:
>>> +          - const: microchip,mpfs-icicle-reference-rtlv2203
>>
>> Why is this not compatible with microchip,mpfs?
> 
> I guess it should be, I'll add it. Thanks.

Then it should be just part of enum earlier.

> 
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
