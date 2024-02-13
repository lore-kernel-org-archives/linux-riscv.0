Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23516C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOHMJeKRAoj11W/PdaCJcb0/kPg2Q8J0NJtnVK3ynfE=; b=29GI9Bv5nhb13T
	nTmrM2EUlihMESlHbpVO/gOnUd32nbp/fxMlbkQGLUN85sEMBkN5Xl1q7uBajg6iUNJcpa4g6vApN
	Fs2795pAMaI4yo4nrwkgVtzNKaHX4Kfv1vFqrjZnrFGjwLjR66YMdNSahKDSXkyZhPHEYZN6WkHBQ
	2AAITk6L7OwcsjismDWfMmUPiSjPgAkuU8gWNOUu+VRQa7Vkomxk9A19VKC5MH6Ajpdieq13FybdS
	hEMbw3JJNKvzQIfenE66zFKvgSK9WyRtA4rwdBKOmW+Pj828GoI+1sF7Th/ynKAxkdqJ3dpFa6wOg
	B48zEbuziPlqnTd6Wckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZx5K-0000000AFBZ-0UUP;
	Tue, 13 Feb 2024 18:00:46 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZx5H-0000000AFAZ-1sbU
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 18:00:44 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-68ee2c0a237so6713566d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 10:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707847242; x=1708452042; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atTRAR3WiDZllnXca94/PS9XVGRFpcFq4mQfGVPnvIs=;
        b=K4ZVGi3XIUagzQta0GwT/1drUqaTyKNAY86l3Ttc/5OOD6nMjVzKRMd8lN8zM1Qnb/
         oaxYaYXGXZizgCdEf2DOx/zxO72L5Qi3xXd23a1PIr5r4F6NmIiYX/jwYg9x4w93MYXG
         MU0o1SmKqs43h3301PmeBE12luCzvjKlb4CqlD0jn33pr6LbEMmLqCKPLNWt/Y6XH/qL
         0VE300XRUFTMY3s8nS42C4lpRpk92oK/rZGWtZoGgg3MPEqXiwoO0tKFvTKf4NXKUFQD
         HMFcvHVEvUK2rlN8tJ6A44xozAxAGOhbBMYi3t21AJrUyHndjAak0k5ZzN7XNc7rAIg7
         3VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847242; x=1708452042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atTRAR3WiDZllnXca94/PS9XVGRFpcFq4mQfGVPnvIs=;
        b=DSC/Nqf+CrtLzVaSHqf2+B2/3ZknKYz5L72STAeCfNu9jJIEatbbwJgWC5OClC/RrS
         IDG1u5aSRmUUynYpoGP+HdMqTrNH+UBtTewEUC3x7yknO9v1dhiUIVaUY7mPRUMW8WlH
         E4rq6bPdIoqEclbDTnUATGBGPTMkboEABc+hiMs2R5LEfv7c84JkTwY9zFgSVjiJ25TG
         9fZnLQpT/lyVQ8pXdTLQgrp4KmA4iJQ7yjPTFdC9+ky61toRhH+sZjWdNdBQqqwTmOsS
         IBoKXMroQeOkCRBW883QLBWmkNx5ExOXryrBf3QCewXzuQQyEBn5ZBJBGYhsDErQ11Xj
         nmpA==
X-Forwarded-Encrypted: i=1; AJvYcCX16M6RkY+jBIWAWJh8xUb5FNG/qZ4QAdl3LcCdG92dqc/9zQ1/b+AnvimhVRpkMsl5IMFK2gRfeo69hw/ulyMnBg9AJ80wRh0v4FRnHoOH
X-Gm-Message-State: AOJu0YzUy7Z0wlcy0tyo6fTecOZNyOe6mX+Nz9RSRSIKKwdvYsBV64YY
	fg7mf/lZ7b+VRSiX5Sf+kTb+K7sq5hJ9//HkSbmYxOOgoFJ40gFHiL3h8KWlw9k=
X-Google-Smtp-Source: AGHT+IHjIJggQmfLYLCqtNotwhVFUSiFfAKVRQBvVL0CG8VCtYKuGX9E+ARrXv1Nsqcp//YqFjIviw==
X-Received: by 2002:a0c:db03:0:b0:68c:cd9c:2fa7 with SMTP id d3-20020a0cdb03000000b0068ccd9c2fa7mr348845qvk.5.1707847241984;
        Tue, 13 Feb 2024 10:00:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzlOhDjdNmp8wxOO2+Q3DAFt//V4xe71Ne7/dMq+bpaQ7ScJLfKHdkqMgFAk/3eERY23JJEw69hAB1gKl1E+WjY2hUfuXSCw11T/cgS+wkgqaeVkPhvVHacLlstElhHq22gOgPaMujSHbJ2r/EeBoLOJ9C3M+zZczBw1zf+VrlTP7xoziwsYfSC+P8s566p7oCw4nD/0OD0w==
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id mv5-20020a056214338500b0068e540c8ae9sm1214457qvb.59.2024.02.13.10.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 10:00:40 -0800 (PST)
Message-ID: <ac30412c-9eab-4014-b4f1-0844bdfeefc6@sifive.com>
Date: Tue, 13 Feb 2024 12:00:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes v2 2/4] dt-bindings: riscv: Add ratified privileged
 ISA versions
Content-Language: en-US
To: Stefan O'Rear <sorear@fastmail.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-3-samuel.holland@sifive.com>
 <20240213-limping-ether-adbdc205ebc6@spud>
 <31024f04-e3e0-4bf9-beca-ebcd4f6fe51b@app.fastmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <31024f04-e3e0-4bf9-beca-ebcd4f6fe51b@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_100043_545481_D3901C6A 
X-CRM114-Status: GOOD (  16.08  )
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

On 2024-02-13 11:42 AM, Stefan O'Rear wrote:
> On Tue, Feb 13, 2024, at 12:03 PM, Conor Dooley wrote:
>> On Mon, Feb 12, 2024 at 07:37:33PM -0800, Samuel Holland wrote:
>>> The baseline for the RISC-V privileged ISA is version 1.10. Using
>>> features from newer versions of the privileged ISA requires the
>>> supported version to be reported by platform firmware, either in the ISA
>>> string (where the binding already accepts version numbers) or in the
>>> riscv,isa-extensions property. So far two newer versions are ratified.
>>>
>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>> ---
>>>
>>> Changes in v2:
>>>  - New patch for v2
>>>
>>>  .../devicetree/bindings/riscv/extensions.yaml | 20 +++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> index 63d81dc895e5..7faf22df01af 100644
>>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> @@ -121,6 +121,16 @@ properties:
>>>              version of the privileged ISA specification.
>>>  
>>>          # multi-letter extensions, sorted alphanumerically
>>
>>> +        - const: sm1p11
>>
>> Why are we beholden to this "1p11" format of RVI's? We have free choice
>> of characters here, what's stopping us using "machine-v1.11", for
>> example?
> 
> I'd prefer to use names that are at least somewhat recognizable, e.g. in
> the profiles spec, rather than making up something from whole cloth.

Right, exactly. My two immediate reasons for choosing this are:
1) this is the exact name used in the profiles[1][2], and
2) the same list of extensions is used for the riscv,isa-extensions property and
the ISA string, and this is the expected format for the ISA string.

If we want invent something brand new for the DT binding (which I'm not sure we
do), then I would recommend adding a property like riscv,privileged-isa-version,
because that removes the duplication between the Sm and Ss extensions (since
almost all implementations would have both).

On the other hand, there will likely be other extensions in the future that need
version numbers in riscv,isa-extensions. Adding a special case for the
privileged ISA doesn't help with this, whereas deciding on a syntax for version
numbers in the extension name does.

Regards,
Samuel

[1]:
https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#rva20s64-mandatory-extensions
[2]:
https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#rva22s64-mandatory-extensions


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
