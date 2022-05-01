Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8E8C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsGh/Aczy849PaQ7TL38MvnZE3xLkemW6do+nJaICaI=; b=B3lNPZMOzMBewB
	tx9+HLgEh7DtIg7IC5slioMn5YpctXK9iLF7v/QUyX9FF/F654zDDjG/VcfJPOSoYz8fU6cRzsdMO
	Ng+gaTR3EeQHBQUC235I3XwGagIU8Y8N7+noVxZBxjZwXTMhMihMTTE+gxwOzxa3sFHlkPSoRhRz6
	YNNT3xwiHVbePcY3DKDJv8nAj4OGJjYhW9lbX2luAdSDyTslSgG2FZBBo8uX1TOQGfjLMg5McHr7d
	ImmmKmu6QVDfXjLvHHOC9/YbwL07tJj2snxhYXgqS1Mv88140+U6BKhX/Xizng/YifWGwm8OVWn24
	fXe9IAPWrD61P6aDhaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl75b-00G50Q-85; Sun, 01 May 2022 10:46:07 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl75W-00G4zy-C7
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 10:46:06 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y21so13729708edo.2
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 03:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1BN3+xj6q/GJn7muBnvRtU8m6jK+R4V3lK2qkgBNL+w=;
 b=L3VkJR/D/nmQqWs010nBYQnXVhc0ZwGUufO0U0PMbzWEjEz1BR2oiE4Bs+5/xCI4Ej
 X+q+hXWlH+Uzxp56Ct27b0/QqKNyL858POpmxOqAdQQSymx1HqbA/QguKfwa8DRaGZyF
 TDBxbw64hwfxjscETjoBC3eNjo22IojN5xm/kAOt0qi8aJjH9HAioPUCEkQbFkq/bWAo
 D24lPuI7TIXMw3B93U3Zvlk5Od60jE2/5jeJuaTMOx9jBI5rSLVmtetcdlqu3CXCGA9m
 xWwA0HzGDQvHcy8yfQI4iYFjacyULGdyhiQMJIUUVindzwGq9XnjGRWlcDV9YRzYdhTj
 C3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1BN3+xj6q/GJn7muBnvRtU8m6jK+R4V3lK2qkgBNL+w=;
 b=mRB61h+sPTzAVPPjMF+rOTc0k+FD/k/fUGRhk0ZNtQymeI37YnuImkhe9mtXv+XmDB
 bpComFwEviOB00x0ycsTLBtkrJqMumtaGpio7yVzzip5m4ZKAvphWwZxVSzBqMEzj1nz
 MBhmcckFOLyKTrwi1V7HK482oODDt1MUjTxunbJ8sYzJZP7kirvfisurn+qU4VBs6EQd
 GRk0sv4RlviUmCHgMonYbZraUrQB98/m66XdRZg2mD1Eb+Xq8U5ODTpqnAkn5uA2U/wB
 tXnerPxwhsRXOWEo63e5vSgTv+RXSLIqVe4w08T0OKmqiFzR0i4lCNaaP1K3jR0/0FXI
 szRA==
X-Gm-Message-State: AOAM530FSF2R96vynCekAV4+QbeO0CWesl/sTod/vpIawI6vr88cVrKg
 fnps0ZOiARfxoPyDG8wYporiag==
X-Google-Smtp-Source: ABdhPJz5smgAwVqzK7oMSiqkJE9lgKLmFcDB8ypHTtNiluemXEtonjSPgytjkfb3js3/uhM+ryWplA==
X-Received: by 2002:a05:6402:1d4e:b0:423:fd93:6466 with SMTP id
 dz14-20020a0564021d4e00b00423fd936466mr8225515edb.304.1651401959893; 
 Sun, 01 May 2022 03:45:59 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 zp1-20020a17090684e100b006f3ef214df0sm2468687ejb.86.2022.05.01.03.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 03:45:59 -0700 (PDT)
Message-ID: <94bd3b92-fe6d-6bb4-8cbb-56ed52b9c4b9@linaro.org>
Date: Sun, 1 May 2022 12:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 6/8] dt-bindings: vendor-prefixes: add Sundance DSP
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, krzk+dt@kernel.org, palmer@dabbelt.com,
 robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220430130922.3504268-1-mail@conchuod.ie>
 <20220430130922.3504268-7-mail@conchuod.ie>
 <6fdc6da4-3a34-e67c-cab8-1c9570501a8a@linaro.org>
 <f49b1d52-11e3-1c8b-bb1f-324318a7f669@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f49b1d52-11e3-1c8b-bb1f-324318a7f669@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_034602_514648_139D1967 
X-CRM114-Status: GOOD (  13.22  )
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

On 01/05/2022 12:39, Conor Dooley wrote:
> On 01/05/2022 09:59, Krzysztof Kozlowski wrote:
>> On 30/04/2022 15:09, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Sundance DSP Inc. (https://www.sundancedsp.com/) is a supplier of
>>> high-performance DSP and FPGA processor boards and I/O modules.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Conor Dooley <mail@conchuod.ie>
>>
>> If your @microchip.com email still works, then there is no need to
>> double-sign it. At the end you are still the same person... unless
>> you're not. :)
>>
>> This applies to your other patches as well.
> 
> I thought that the last SoB had to match the email it was sent from?
> If that's not the case, my bad. The @microchip email still works, but
> it would've meant waiting til Tuesday to resend.

The "From" address must match the SoB address. The person, rather than
the email, sending the patch should be the last SoB. I almost do not
recall cases where two SoBs were added in such flow like yours.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
