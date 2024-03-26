Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43B2CD11DF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 22:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmVBHLzXFlDK/YAUdRXL7xle0pbZ6sWzI2WUCiQR+AM=; b=P4kLpmLG2Q5147oct0rx3WDslM
	/FpRlGdJSbB+HuavJ3EGfOP2+Mvz+9Ta3Dv95W0wKOdDUbgepwrCbGZutz1+UHwCvVBPQo6N9FQRO
	UaB2+fZvRzgeurHPKQRSNhn38kXop5M0l3VQN2XoBGj7c7PW8GgRLsQDWUDYjXwQlQgLG9ErKETTX
	+bn0yeSUwxi3qTKFl7dul11S5I+/l7CROfFjcmTj6jpbIvLRs5CF2pdz87wMe9NvklGGwTOXI4TGz
	jC79vRsprfHmxTsUXRIbwG+pBQZJerY+ofllkaA5/CxilfUB/TX4jn6Zw3gH5iGBiMGSneemZ45eG
	6ooIblTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpF1y-00000006doJ-2Cey;
	Tue, 26 Mar 2024 22:12:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpF1w-00000006dna-0a1V
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 22:12:29 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ea8ee55812so3658063b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 15:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711491146; x=1712095946; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bvrBpa6NIqmeIkXane8RW2BCIfL8oLVJSB/0WwZJE4=;
        b=lN4/hjMnCGVPqrqHr5hU3+xvAepboI8anPsTS2AIwlkyuhbxTJ/Anps5K6HVekgkWE
         FiLuvz8/z5SR1j6CkFwb0UahRfO6tdPl7SVVe1R/XpYhkUWUtvLSqryHHc+acRuVxZax
         CcG9l1vKFiLEVVuFnrcanFlFOrTMDu9RljhBE8AFiqdXN8wdQNYWGG3uxwByVYFvbGiP
         hzsIi4Is70T64SkY99MiSuh/jGnE3tlqS/r3G0SBEG2sVbUiufU9qi//48TCZdLcTcvN
         aknrtS6GPeDzRPnMpQVWMRklRnNLa0VojT28GCOFtK2/M2JEPo5KL06I3xTbWBVAtsUD
         OC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711491146; x=1712095946;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bvrBpa6NIqmeIkXane8RW2BCIfL8oLVJSB/0WwZJE4=;
        b=n99K2uPEQufe1V1OAZVP85Wj+w3YyA8dPtUhsvkKukcJowZyaoq/EmwkNR5PhScM3d
         OKgl+CTqX1wafetwMOYivflcCmt988cxNDiG/+FAKpaBtgVF3w8zJNa2JrzZbJOFtJbx
         cOcQHSgwmVQGrpKgI2+7euroJDg4ba+SyPjdxOLnVYJsL1SdnjUaM3WBqeie9bUTRKpa
         1zUjCATL2KwhirrlPgzJ08XPfF1NRNGXeID4yOXOFCE/mnU924KrdggPzHvIWYZeiosg
         4gde2FGJkc3oEYL9rmE/nPBc9kmyrIIMcY11s/ulGHi1p7s2hUoOUNqs33YwkU/OecUe
         8DtA==
X-Forwarded-Encrypted: i=1; AJvYcCWGWt55Ry2FeX/a/XqvsXISGQDLQn3l57QSM1uthTfoFld5waNjWaLtjf47Wep31zvCSeY4BFfl+J15oKeHNvPfs7DA5ddZo9xP/bXy2egw
X-Gm-Message-State: AOJu0YzzKSqvOTcPTpdKdbi0eW8XNawm1zgr00j9y+bqefashD64SHqB
	MUHzYvp4EBup4gg6e8TL+Q07uidpnKjtaRFVXCmFmuQT2vkHBhVC
X-Google-Smtp-Source: AGHT+IGGeFNHDlhY2bt27k9H3IoMCM376JL/pBz7c2YgVW0if7A3uQaiNEyUhIlMV5hbE/Hj95e6eQ==
X-Received: by 2002:a05:6a00:2303:b0:6ea:c42f:d75e with SMTP id h3-20020a056a00230300b006eac42fd75emr1855892pfh.11.1711491145682;
        Tue, 26 Mar 2024 15:12:25 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id r10-20020a62e40a000000b006e6529c7d75sm6516071pfh.3.2024.03.26.15.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 15:12:25 -0700 (PDT)
Subject: Re: [PATCH v2] riscv: dts: starfive: Remove PMIC interrupt info for
 Visionfive 2 board
To: Conor Dooley <conor@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: kernel@esmil.dk, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shengyu Qu <wiagn233@outlook.com>, Conor Dooley
 <conor.dooley@microchip.com>, stable@vger.kernel.org
References: <TY3P286MB26116B828A34D614C09F4E8898202@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <20240326-create-motivate-2792be1692c5@spud>
 <f472affe-d1ef-cbdb-b5c5-76f6b3ac78b3@gmail.com>
 <20240326-ladylike-retold-9034734c2445@spud>
From: Bo Gan <ganboing@gmail.com>
Message-ID: <222340e5-b5d7-9abc-57df-ad1478090177@gmail.com>
Date: Tue, 26 Mar 2024 15:12:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20240326-ladylike-retold-9034734c2445@spud>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_151228_213311_7C275CEB 
X-CRM114-Status: GOOD (  15.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/26/24 3:10 PM, Conor Dooley wrote:
> On Tue, Mar 26, 2024 at 03:06:33PM -0700, Bo Gan wrote:
>> On 3/26/24 1:37 PM, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> On Thu, 07 Mar 2024 20:21:12 +0800, Shengyu Qu wrote:
>>>> Interrupt line number of the AXP15060 PMIC is not a necessary part of
>>>> its device tree. And this would cause kernel to try to enable interrupt
>>>> line 0, which is not expected. So delete this part from device tree.
>>>>
>>>>
>>>
>>> Applied to riscv-dt-fixes, thanks! And I didn't forget, so I re-wrote
>>> the commit message to add some more information as promised.
>>>
>>> [1/1] riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2 board
>>>         https://git.kernel.org/conor/c/0b163f43920d
>>>
>>> Thanks,
>>> Conor.
>>>
>> Hi Conor,
>>
>> Thank you very much for taking care of this. Actually the PLIC may silently
>> ignore the enablement of interrupt 0, so the upstream openSBI won't notice
>> anything. My modified version, however, will deliberately trigger a fault
>> for all writes to the reserved fields of PLIC, thus catching this issue.
>>
>> Hope it can clarify things a bit more.
> 
> https://git.kernel.org/conor/c/0f74c64f0a9f
> 
> Better?
> 
Great! Thanks again.

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
