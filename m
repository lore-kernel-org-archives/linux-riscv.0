Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18840C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPfITBSlFX0nyB5FBnTFUhHY1naVCuGMqCoclK3qEBo=; b=sIQFXHZZWMXS38
	+hou1j0gS32gCI954r9dlU3Si5exIdEa174AWgsBmFRJsZutEWZahnY/a/IWbZtOkYPucr3cxs2zH
	F+mSMPfsg9nwVgkiwO+A4iRhErlUWbWFqIUHtF9Nx3/cuQIYROiZUkbmf6+SdzQEpqz9r8nV1zYpx
	BkUlkiX9hbzE4KBVGNbniSO7YuMaZ/kg+J019Hg5YM0+JnFfweLuqrRUSDNumc8TbLo71qdA6RPhu
	H5wTEoVEVmpvyEUZvhbwJ9rJ0WEd9NNXiKXQa0QjJYaggebnmi6ArztSPtq6vCiD7nnlPiUkCj6ef
	BqxYXY+y+TpzCBX2XKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzOB-000RP4-GW; Mon, 23 Jan 2023 16:09:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzCV-000Mtp-8I
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:57:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id o17-20020a05600c511100b003db021ef437so8912670wms.4
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5hrQIyqQuqAn7Bhek3gM4uIwIgMAVVwBp4GADSA+Cw=;
        b=c1kHzEEuAAohbfhkBYauOoWYNOawlKfZE5mlKQzgNOC0tEhGML4PgfJBlBbO4oIVVt
         bnMySVmUYtzmwF2M0HdPdtn/zUzt/+aaLsuxYY0IPSMPRiUoLcsrfUClQLZHK6Dh9EDJ
         bh0p3aTjRNvlkyShZD8iuPVSiv4NOdyWhHG1KfBCH4Jl3PxW7B04JXkWIF2pvLJx6UKS
         RS5fiEP0NfWZWpCKlNMdIe0m9oF43H3huXvD0+QOZdIx39jAcpyrYvhe75ele0pGQ3p1
         MMt62QlnZ39BLYOJ7QE2FBUOI+5cDm7SyF+twW7oL5P/KtQwlXNZZvOP/Rr5osNAYgXH
         g22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5hrQIyqQuqAn7Bhek3gM4uIwIgMAVVwBp4GADSA+Cw=;
        b=RSY1dJHiF9WW57T3GMApS4+rF7AqvRWEwIydVklBDvOMg9iQgcJxrk1OeMxqh3WSDT
         ujStdMaXHLyc54+67n56+8VNmLL6aapKDxUqvY+ihfHEphw0MTLDNfDGQbktsNg2heWd
         PJgazLAfaaar/+Ca2bo3PWJTNR/Y7Ohh9HSgwXtARDw/i9GQ2wnWGfVWuCfNu4Q6WxLH
         U/7e/LkiYy+aB4h+8e6rQXDAtaVAL1epYnLcW5tGwUFuZ9Sv3uMAgmQi36n9fez9yT4P
         WajEBnMiPBR8bXm+p8fAKx7g/yvHJSiks2k7goCIHW1FacN6wrtA/rpAfftmmtE/X9TV
         Jc1Q==
X-Gm-Message-State: AFqh2koTjZmyal5Xm1v7Z4uW+9fIKvqxHo7/5UOzgt5ziD100LEwuxGk
	Sj0gWlyjwHcxAf5Klre4vprRYg==
X-Google-Smtp-Source: AMrXdXtpUjl/JVLD08k3jbZH7A5k8ndahqsMDGXZjtXnPJIX3NQffVo7/cdQUFZDQ1DgUuif6F+ptA==
X-Received: by 2002:a05:600c:3b1e:b0:3cf:497c:c4f5 with SMTP id m30-20020a05600c3b1e00b003cf497cc4f5mr24792007wms.13.1674489454756;
        Mon, 23 Jan 2023 07:57:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c4f1500b003d98f92692fsm11715052wmq.17.2023.01.23.07.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:57:34 -0800 (PST)
Message-ID: <934c637b-9ca2-34be-ce64-2a7639de6490@linaro.org>
Date: Mon, 23 Jan 2023 16:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, g@orel
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 'Atish Patra ' <atishp@rivosinc.com>, 'Jisheng Zhang ' <jszhang@kernel.org>,
 'Palmer Dabbelt ' <palmer@dabbelt.com>, 'Albert Ou '
 <aou@eecs.berkeley.edu>, 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Heiko Stuebner ' <heiko@sntech.de>, 'Anup Patel '
 <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com> <Y85A+3MW2N/jPTHH@wendy>
 <20230123094405.2ageo63zauqt6g2n@orel>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123094405.2ageo63zauqt6g2n@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_075739_332941_666B3787 
X-CRM114-Status: GOOD (  12.09  )
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

On 23/01/2023 10:44, Andrew Jones wrote:
> On Mon, Jan 23, 2023 at 08:10:35AM +0000, Conor Dooley wrote:
>> Hey,
>>
>> On Sun, Jan 22, 2023 at 08:13:24PM +0100, Andrew Jones wrote:
>>> The Zicboz operates on a block-size defined for the cpu-core,
>>> which does not necessarily match other cache-sizes used.
>>>
>>> So add the necessary property for the system to know the core's
>>> block-size.
>>>
>>> Cc: Rob Herring <robh@kernel.org>
>>
>> FYI bindings need to be CC Krzysztof & the devicetree list too.
> 
> Thanks, hopefully CC'ing them now is OK (I just added them). If not,
> I can repost.
> 

It does not work like this. I don't have the patch in my inbox. How it
should magically appear there?

Also how do you expect the bot to get it?

You need to use get_maintainers.pl *always*. Please resend.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
