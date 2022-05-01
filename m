Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F1BC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbHQ6LnplM9vC1T/id5hJiFbaNQN+cE2SptPxN6cn9E=; b=Xf4f31C7DUvkVG
	cJlvUONBfcfTJUz19dl/sL60ENAqSGnyIsVOrCpHSEWaAZpoVTu0k7kQtLGXGWb6wWZmJ9fNffuRN
	OrvmZw0VxPb/YUh3Sllcyt/Fh7NSnBdwBpouJfqTtDoDW1bmMTgj9qYh1oiZPXYjITFv7FPauedZC
	s0IMCNB/MBB7y0dbgmGT/NoROeWuv74PzgRh2UmNhTJttW/hzPCdtdGNR5GuXAJZt3N5qiMxFvIKj
	mCIg6drzMQwk5LQ9NGnVz7Dtlik2irWMGEovTINjRGtDwOUpOyMPl9pMWr2BxaMIbWD1Z4q0NrT/r
	3q8aosj85c6XPnVNDFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl5RQ-00Fy28-Vm; Sun, 01 May 2022 09:00:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl5RN-00Fy0k-Vx
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 09:00:31 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z19so13542797edx.9
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6PJYh3sqWCa2tY+xYmHfq4tYwHtME+g6YPSvwa+jv18=;
 b=iYnEeSkcA8rwx9awPjZp4TwwrB9ShZpaik4sjxmebuZm3eYl9jJwYfh/oU+Olt3R5v
 ZWRtvxXkKsgDPNb+tl1CohYbxWwxADiSrsbTr8Y3yGBb1rU7Hyy6y/9zf2H5iyeKHa3E
 Y4glAe6N96lOOxJg49nS/hxtAKHv6kwsdsHc24VLud5RSLhOmH2c4e2mAliIuBqHC+7q
 8p5NSHOPetKtEmG0eMJV0+ZtJ1oXhiNSwEilHZTsUxN+xokeZF4yZ2wvPfSL3Ai4HoO+
 pUCz9zgAy+6YgpUrFNY4e6NMIrts98JwLfdcTZ9mXvxYZaY5/2EHoeVDrksoEqxdVJyH
 aKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6PJYh3sqWCa2tY+xYmHfq4tYwHtME+g6YPSvwa+jv18=;
 b=eOVLhigjT9tCxyv7s+ahbTKJe0YN+8aJVnCLRUQuH3mKDdFG/Y6QUH0YvfgUxWF9eR
 4zn/oaGbJrTP07n9nEEw9bzJK2MZv4oerdB15PaagjnIyTHs0bSHzraTbCBhlh+b3IA6
 c1bPu22PvPd00blhpkF63eKWqI/v/NrzmtVTjo7Z/0Y7nCG0U46BJSGui8NEQUzhLJpD
 MLH5StHG+ihjm3Uu5mqw6AjQm8TOh3ldsRB/um14f1VypnToe1S5E+5/7PtZz8Qm/s20
 ssh8rfoAuLd326hUoKfm6XN9ERTFAsjkSGD58VHDdQTtRaGgTepciDH0tsYCQbCDQ4gA
 ev/g==
X-Gm-Message-State: AOAM531U0dUbxnJ4RAQPnJsMi2F7Aed4xKJ9HOB1Vm8ln1/uOiubW+L4
 7DNpv2/2Jr+D3jA/DXLJvTY/3g==
X-Google-Smtp-Source: ABdhPJxYiFTtEL0B6CFg5y01ly+P2Zt5fKvhJ4uNpRacgPB2/Ls81VKRj5S1Po2G/xoB8RyNM+DVNA==
X-Received: by 2002:aa7:d549:0:b0:425:fc06:60d4 with SMTP id
 u9-20020aa7d549000000b00425fc0660d4mr8058735edr.300.1651395621804; 
 Sun, 01 May 2022 02:00:21 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ig11-20020a1709072e0b00b006f3ef214e2csm2504094ejc.146.2022.05.01.02.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 02:00:21 -0700 (PDT)
Message-ID: <884d9546-4e5a-df04-bf03-eba2fe0188ba@linaro.org>
Date: Sun, 1 May 2022 11:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 7/8] dt-bindings: riscv: microchip: add polarberry
 compatible string
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, krzk+dt@kernel.org, palmer@dabbelt.com,
 robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220430130922.3504268-1-mail@conchuod.ie>
 <20220430130922.3504268-8-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220430130922.3504268-8-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_020030_097162_067483D2 
X-CRM114-Status: UNSURE (   6.76  )
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

On 30/04/2022 15:09, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add a binding for the Sundance Polarberry board.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <mail@conchuod.ie>

With stripped SoB:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
