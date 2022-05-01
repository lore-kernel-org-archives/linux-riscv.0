Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB98EC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuFD50Jj5kGVafp4ofRNGZ6ou8fCloqxA6bKkqhYvxM=; b=k5He1scTgNfFmb
	tKQ2HPFwBHpdD1FvOfMFJPxIEAfHNqw0ZIJ31+NAVfsS2JImhNEy7PyyxhLq82mFD/aQUNr0gWg7d
	bkRn1Tgzub9ul5EkYXxfmESV81eCf2ZJ12LrxNilCAeL2CiIn08Kevl8W6wYEbuE6V9M3Eylg2gsl
	X4c17ZapfoTwsBzSCynh9tiRttV4+fgqh/x+4cF/Vq0p+Yus0f0eqes16p052RFfT2EiHloqsQuTV
	ipdvB/h3Gf4xut+v5AwjKErih1IGgqYHW+RV3agTkdwwy3t7D0+SdPIw5WrDE2K0pxFrbrd54g/oi
	FMWUrrFYOu5gzA++kvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl6zj-00G4JK-2X; Sun, 01 May 2022 10:40:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl6zg-00G4I4-7S
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 10:40:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id bg25so6877138wmb.4
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RTGIJr8n1HnWrIYz7FUX3oY+TZmLoliMXiiWkrwJcVc=;
 b=oOIYfmAJY8had1t3RSEMLF2NflkyowPvGVXM/UsXmwKV3bceP2QAdefPgIizOfbf0R
 aHcSEKfgtGV0oUrp2xyhXCkj6oqVkfrtBRlwVkNZ3S5ztDMTQ1+1E++LjxLTHYzbFIQU
 VAVFbHu6thS9m73XJlYUF+YkHfcJDOfRyX6FCQWoWTCVe8i2EzXappopj835Qx6sB5Nf
 DJb0Mdys2jzIVoJpC7INbiEgU+hNJPP2H+58DG16/N+0Lv4Ol88HpjuYQTBbD49huGBt
 rEFN31ugFE+eTt52cH3Co8so7mpZPY95/AVkj/gWMnfsbB0xd+mX8LqrYGgKwMCVq1ai
 5b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RTGIJr8n1HnWrIYz7FUX3oY+TZmLoliMXiiWkrwJcVc=;
 b=ffP2GCFoAuEA/CZd+qKdYHTy6NCab/VVCoSmLQFJJuMi9uozGD7qsgqJjAea9TRfpt
 UmB8wNQULCIXeejQHhTl9Px1niGiQCYndefahs14I5YL+JnWSEYpeWUDM41NkpVEqjE9
 8Wx6Km0BVd2ofIkazce9GyZf1/IdlluIV6IyniiwcYBhRasis8vndn0SNW9VU+qn+Vx8
 QKe2o2UgD8kgjoc61/GVcjR6wqBH/ZjrAOkXwRm5ozbvbTJsdzjcJTMQeMBMFedjvz9h
 Q/+U6squUYa/RDRllLlRTS36J7UKNcR2Mqu52XheIiPUXPJ1UNwP1fvHKo+NZF7nq0ob
 gZQg==
X-Gm-Message-State: AOAM530qKgZK/bFmIifPrM7NaRJgCCUKLMuLE0iN8mVqbADlZjn9ccc+
 6guO7hU6ldFoW1LKa17gSH07oA==
X-Google-Smtp-Source: ABdhPJxqjmcGta0K+qX3qvW017jiTDcRJd5RI/21DEtcW/tWJ74Bm5KsRvxS39O4Z9lahd3YbKc5aw==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id
 m4-20020a7bcb84000000b00382a9b92339mr11156660wmi.91.1651401597453; 
 Sun, 01 May 2022 03:39:57 -0700 (PDT)
Received: from [192.168.2.222] ([109.77.36.132])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a7bc194000000b003942a244f48sm3660528wmi.33.2022.05.01.03.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 03:39:57 -0700 (PDT)
Message-ID: <f49b1d52-11e3-1c8b-bb1f-324318a7f669@conchuod.ie>
Date: Sun, 1 May 2022 11:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 6/8] dt-bindings: vendor-prefixes: add Sundance DSP
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, krzk+dt@kernel.org, 
 palmer@dabbelt.com, robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220430130922.3504268-1-mail@conchuod.ie>
 <20220430130922.3504268-7-mail@conchuod.ie>
 <6fdc6da4-3a34-e67c-cab8-1c9570501a8a@linaro.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <6fdc6da4-3a34-e67c-cab8-1c9570501a8a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_034000_534696_576D30B6 
X-CRM114-Status: GOOD (  12.33  )
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

On 01/05/2022 09:59, Krzysztof Kozlowski wrote:
> On 30/04/2022 15:09, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Sundance DSP Inc. (https://www.sundancedsp.com/) is a supplier of
>> high-performance DSP and FPGA processor boards and I/O modules.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Conor Dooley <mail@conchuod.ie>
> 
> If your @microchip.com email still works, then there is no need to
> double-sign it. At the end you are still the same person... unless
> you're not. :)
> 
> This applies to your other patches as well.

I thought that the last SoB had to match the email it was sent from?
If that's not the case, my bad. The @microchip email still works, but
it would've meant waiting til Tuesday to resend.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
