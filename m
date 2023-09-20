Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E34BCE79CE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWEThlLKCLEXGYpuO5hBY5sJaK466dVBrD5AdFeBzPY=; b=F9WoZCQaxeg4Ap
	pBPzWMSU7IBY2yayFb6nZO2gecllh2bAnILGMNvfVGsGRy4ZtABv/DdEi7yZYvK2V9vjTRtr70ocI
	maHL27jnJg5GPmYKBnv5yAqQiC/gtslVuo5Lv0OjlOOW9BXuxUkWD1IBFnJTfQhiLjLs6X1RoQAUY
	XV5mwxVFevaaF1iBaTLnsRU7wTyJ3kypTR+vvI6YEsgHMGx8J0IbR0i4s7jM0IF7i1SphUWipH0bi
	YRyMTbZ6ZmCFzX7QND1JCPdDOQh23cgALjWabUKYMuBLqMRnFOs5qRRjQwmLZHpXrh1THkvFIy6+c
	RX+Rcmf4M6CnDrkfVPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwLx-0031eh-0j;
	Wed, 20 Sep 2023 12:30:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwLu-0031de-13
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 12:30:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9adc75f6f09so751882966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695213044; x=1695817844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ3gWCgaztMYxFnAMNrtqdjgXM+bJh+ntMtoT8Y2h/4=;
        b=n5qm2Mo4CBOymWaNsx5uqmt06db3fabDRLpy7z9b+5zEs/y/CzbrktzzkLjyESfL7f
         A+XsuNtMNULNyLfQNE6d+WXNwdXMnnwDdxsjldHaf9bgfB9x2NidDk0VzCtGJtRuYY9u
         TZ/L+fSp8Vam0eqgmH1Q4dd19jATZBGZE85UqX1zle+aKK34oVBXcMx0rgUppsGEVWiT
         kgGMMLUpiNXNrr1ZHx3b/VXQrwFHiIiMHfnn/BNPGyTR2lDuLsvauWLYLVGW8DyIIjUw
         H3BJFvAalG6lMw2DGzeXOZVg7d5WGB6EEEu1NTEHdepv2VfvNhGDgsIf9zc0IboAlm++
         JgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695213044; x=1695817844;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ3gWCgaztMYxFnAMNrtqdjgXM+bJh+ntMtoT8Y2h/4=;
        b=lGo6sVYEXJThQLlaofmDoC+PdNZWXFeULRamdqHdxwPGEwxoyOnLuFmjWMxz5sJIlH
         q5N8lj+pbZ0aG/5RiELmq2HABk5RgAR9nU3uL4atvBqCEjR5uCmB1rUMNdQdAhjyEmby
         l4x+H2ak/crVJpz+d8GRqBF3Jc1pW0EtjPetaXMvrjkm2Rk1xBA9/jphHMdPFlrv09rq
         7Fq6ZilNlv3EeCVDWCzPJ+01XNc7Wr4iHM+gOl9KKsPGjSb6PrAOq/rnJOnPubU7IaB/
         AQltFRAE/3J2fG7kfCG+rXi4bTaS4mZdEIk4OxnryWJHAaYBubhIy3fUsQStRq2yXDTp
         ZxuQ==
X-Gm-Message-State: AOJu0YwF9I0R7jTQy6gM2PtKJY/u+K7w69sApPwaqrcwRKpPw+qFy4iE
	7GUfu1Gdm3ilwlOXXbtIVDreFQZFBw5v1PERWiySZg==
X-Google-Smtp-Source: AGHT+IG8CKEIWP/OfpZQP7e91vQw36N6TjapDi739Gf8g3hmlpL4db+fqvvNocVe0zeyxjUzbpHznQ==
X-Received: by 2002:a17:907:78ce:b0:9ae:4978:ed8e with SMTP id kv14-20020a17090778ce00b009ae4978ed8emr1452101ejc.13.1695213044454;
        Wed, 20 Sep 2023 05:30:44 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id dv7-20020a170906b80700b0099b8234a9fesm9337948ejb.1.2023.09.20.05.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:30:43 -0700 (PDT)
Message-ID: <66b988f0-39fc-2ed3-8f38-151d6a3c9e52@linaro.org>
Date: Wed, 20 Sep 2023 14:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Content-Language: en-US
To: Inochi Amaoto <inochiama@outlook.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 evicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
 guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
References: <0b84ef92-f6b7-f3bc-fd51-8f61cbc91ff8@linaro.org>
 <IA1PR20MB4953117947BA7DAA60C1F435BBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <IA1PR20MB4953117947BA7DAA60C1F435BBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_053046_381158_FC4E8CDB 
X-CRM114-Status: GOOD (  12.36  )
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

On 20/09/2023 14:15, Inochi Amaoto wrote:
>> On 20/09/2023 08:39, Chen Wang wrote:
>>> From: Inochi Amaoto <inochiama@outlook.com>
>>>
>>> Add two new compatible string formatted like `C9xx-clint-xxx` to identify
>>> the timer and ipi device separately, and do not allow c900-clint as the
>>
>> Why?
>>
> 
> If use the same compatible, SBI will process this twice in both ipi and
> timer, use different compatible will allow SBI to treat these as different.
> AFAIK, the aclint in SBI use the same concepts, which make hard to use the
> second register range. I have explained in another response.

What is a SBI? Linux driver? If so, why some intermediate Linux driver
choice should affect bindings?
Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
