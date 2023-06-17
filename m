Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E054EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25pqOpqaWLxRWAxUKYTXZe9VMmdJFPkdLEQl5AA9Wd4=; b=M7Gdh6jSGyTqgp
	4JZ6b0roQZlI3x9D+nFKCSrN2dKe8n7xjGxZRsRDMI3nLylzzTqeBiZrRM1iVUA/+9O9oHPOsbOj+
	L2+kK3DLLbhNDYLV1lQa182XzEwM7A5sQVEYjgyBONupPWSC7NoM73tDwd4jH3sLYEgeCixkaZXvR
	JUhTgFYaoMn5KLXIqCPGbJvEJOXfVzpa89vcB2SLSRLkrNfs8zMNe3jae9YTs0YGqUzf9OutOiZQ7
	njgMldLM+UIcPswXKZCGzRSXU7Qaw1z6Uhu2ovvZ6tiLjG+w3Knj+LePwlqBNsoAaYnT3roTG8mJX
	IRUCGADAFVBWoqzslhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAcYY-004IsL-2G;
	Sat, 17 Jun 2023 20:29:58 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAcYV-004Iqx-2B
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 20:29:56 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-519274f7b05so2836029a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Jun 2023 13:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687033793; x=1689625793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WotXs+XtzzrhlYB5laz6cnJm1VOdwaPgisww3kS+BtM=;
        b=lW9fTA9v9HxxmIHFjctBcM5mJ8sibJgQJFs7a+noaiQ3kf+VggSz3rxCQS77BYbuKj
         ibyDg5uP78O5Ypgznaqh1Y8JVeE+0649VRACesm/ssk3yZRpIKxHwqt8sBiR5QwvpnrQ
         ym94m87zIjd+jps/yrzwuUFHyyz/kBbeYTQM3IDQlWp+Tuyek65gi3/hZHV3GwZL4dFA
         4muMUlITlw2uO8ywZPtFhKoIdbzxUc0+4qaAbl+qdxHOu4ExleWtWpUpqCpIDKJJEmGn
         5T04eLpsuGKo1r2rRhWP7VBJL7dSFL9qcNT32JOCE8QXZpu94h2rTmVHE/QlafnT4wXm
         beog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687033793; x=1689625793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WotXs+XtzzrhlYB5laz6cnJm1VOdwaPgisww3kS+BtM=;
        b=Cp5E4pZvNkrylV2DMLzwR8XMRbnflrG75Sh78KKskUYWK0dpb/yKqokR1u9eD38HVk
         mV1+ttEC2alNdhQYb9ebVGspgsg+WfwL6B4Q64YQlRNjAWyRTVajvGLy5IKTOSUwTDJX
         A70+wqcCRm++q9UCSfpbnI01YQu6IRO2F6nZLAkmw3PCuPkK05GO+eNJwuhPBszNTpDA
         3IkSz1r6PrRdmBZRzOaU2fQuOGms3Oc5biPiG83qeP2h5MmoTA9EiTEBYOquVh+Eycvg
         u3FnPdw73iOxb4iCZTJUCKIKAyockSarF3PfxCh91H1uIXhRKesr7/IdoF9bCCZOEAXe
         UT2Q==
X-Gm-Message-State: AC+VfDxQXJW7tYRfHYDL1fb38V5ds1Qk/66/4N38spfOKxFS0gWjQxZg
	+65l5a3mBhX6rbVAk4F/VOkFtw==
X-Google-Smtp-Source: ACHHUZ53sBLPaVvnnGgxK0nUyl1GvLMLow9cJxFJcPNV2oyhFecpAq7IGFCYchBcJkCqaWuR6eSlkw==
X-Received: by 2002:a17:907:3187:b0:96f:c0b0:f137 with SMTP id xe7-20020a170907318700b0096fc0b0f137mr5548380ejb.16.1687033793351;
        Sat, 17 Jun 2023 13:29:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709064ac200b00977eda0ea29sm12728337ejt.14.2023.06.17.13.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 13:29:52 -0700 (PDT)
Message-ID: <fe1f44f0-3c6d-4375-6aad-286d6d539d73@linaro.org>
Date: Sat, 17 Jun 2023 22:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3] Documentation/process: add soc maintainer handbook
To: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, soc@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Olof Johansson <olof@lixom.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20230606-escapable-stuffed-7ca5033e7741@wendy>
 <05c50d10-080b-43ab-9131-98f71508ac2d@app.fastmail.com>
 <20230617-succulent-surgery-3dbbf9454737@spud>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230617-succulent-surgery-3dbbf9454737@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_132955_750069_764E296B 
X-CRM114-Status: GOOD (  15.68  )
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

On 17/06/2023 20:32, Conor Dooley wrote:
> Hey Arnd,
> 
> On Tue, Jun 06, 2023 at 12:23:26PM +0200, Arnd Bergmann wrote:
>> On Tue, Jun 6, 2023, at 10:27, Conor Dooley wrote:
>>> Arnd suggested that adding a maintainer handbook for the SoC "subsystem"
>>> would be helpful in trying to bring on board maintainers for the various
>>> new platforms cropping up in RISC-V land.
>>>
>>> Add a document briefly describing the role of the SoC subsystem and some
>>> basic advice for (new) platform maintainers.
>>>
>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> Changes in v3:
>>> - sort out a rake of spelling/grammar bits spotted by Randy, apart from
>>>   the one noted as a suggestion
>>> - drop the refs for document filepaths
>>
>> Thanks, I've applied this in the soc/newsoc branch of the soc tree
>> now, which is where I'm already queuing new platforms.
> 
> Having cited this document for the first time, it came to mind that I
> never mentioned putting the submaintainer trees into linux-next. Should
> I send a follow-up patch for that, or do you think that that isn't

This is common maintainer stuff, so every maintainer - not only SoC
related - should ensure his tree is in next. I would trim all such
common things from the document and store it somewhere else, because
otherwise people will just not read it.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
