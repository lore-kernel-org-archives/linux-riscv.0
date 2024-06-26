Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC813C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vITEQUEVaTlHEpTDC8g5EXYWpoGpYc8aOdKnRAsRp9I=; b=zJFAT1sCnYJULy
	E0KZqQVNKxmIxdNDsxY2W+5TFcRKhPxzHXfHi5kptOUxnFGkST67GKDpHk11uHxI4GvqWGW2V1HDU
	8ILe2z+l0nTSbLv/UsuNSeNCNXX7xBXloGxPrdHIb81VE+W1RbuCkRfHj71sWG9Jxd41ErPHNeTgp
	lTxkEZ3/D83UL8Ucj7uUlYvATmXqNQZHrb4PngKljNF/HMDLHlNcS2ixm9z0dbboT1D0DZU/pW3RC
	g9Qked7KCUi5mYUbTfI/lzN//ufIt3gz1q7PEFkr4iuoP4IR1tk5OAYHrOvyFGp+wDW5JUlMo3pPY
	LmwBH6iDOv6XjrEtAaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVI2-00000007YN6-2x1v;
	Wed, 26 Jun 2024 16:14:34 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVHy-00000007YLD-2sYE
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 16:14:32 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-376069031c7so26377435ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 09:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719418470; x=1720023270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDDEvuft6YUbchcNAvdNgKui7TGEyIpJ9wmKFGBqMjA=;
        b=HimKOHkSWZHl56GXP11ymcuhUXS6NyGtU4QSJI3yF4lTNCZXRki5/v4363HTX+jyAf
         wywoWQxW2sqxdvzOXjIFSpbN+bpbTFPW2TtOAhPYECiBeSXOheYHGyLWdOMuzwZHwXbD
         BGFaL9z7IWt6UImXKx28//W6RvHmbHvpGLhrbWgbVZSnibMX+Zz2d0ozoH+mljxjPTqW
         S6v8U8sRXc+0MvclFPLw6Zs/kJHbutK4FtMCE/L2iHqtbcP4tWPyzdHW4uSe2dEr+mr/
         +mSJWliZNMSONx8R+kn0M2qvfxoFo1zu9CS0h/JGUwMvMgz7k0QikF/CTES0FjOqq73I
         Pq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719418470; x=1720023270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDDEvuft6YUbchcNAvdNgKui7TGEyIpJ9wmKFGBqMjA=;
        b=Y0x4ZhQBseoDB5pKWJymoCbNdB+oYolf6OcaHL2b6Yyn/kE0o263V7CLEYc8tGrpSx
         83olMp+qMKFTJKIK7PgtBhYvPFLne6W6Nbo8HirQdxsGtGNtD7yaL/bsMVaZ2t3sxHOc
         WtyxHQa2EJ2iS4TuqaU5HcVdDJWn0HixUxc2dzfeKetVvW7r9eyDH7neAZP9smK3tBAs
         V3VExIz8G0+KiNgeghWoNv5cSaYzyfpkQnN9C2+KGwDT+FcCv/whRFCq5IfWNOQHqQDR
         8cfH4X8l/1a4plCQqSb68UsZM8tNi5mmW3+FVTI40Bttf6fgwCRtbeJjNXTVNtyiWmHh
         qqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDwnuJCDGUu8e+d/RmQTmtkq9ZgpNuPmNQd0jHutScISibRp1+RkWxxhKYkBXXhYwqGMivMagRW8iVwJr9cejvKTurPbjoqcHzDG+Lq7h8
X-Gm-Message-State: AOJu0YzEAPpUrwnuE1mW6nURxbiDfhp9sKKwJgUCKtkgA5yOuWMtsv/H
	pD8gWQZqLt0VWDaJ9BFnotUuL9oNTT4igeZ7Jpo0wnB7LLP25vVRpLD8eBsTtwc=
X-Google-Smtp-Source: AGHT+IELKQLJZTF+x62RjW2AmmDAddWE/zXZ9jt/OXnsyiCchr7jyoc/sCxp83/vqAiFW8alxf17RA==
X-Received: by 2002:a92:c569:0:b0:375:c473:4a8c with SMTP id e9e14a558f8ab-3763e166c2dmr137718185ab.32.1719418469797;
        Wed, 26 Jun 2024 09:14:29 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3772b4c8b06sm5483315ab.53.2024.06.26.09.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 09:14:29 -0700 (PDT)
Message-ID: <acd4c562-1f4f-4cd0-8ff8-e24e3e70d25e@sifive.com>
Date: Wed, 26 Jun 2024 11:14:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] dt-bindings: riscv: Add pointer masking ISA
 extensions
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 kasan-dev@googlegroups.com, Atish Patra <atishp@atishpatra.org>,
 Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
 <20240625210933.1620802-2-samuel.holland@sifive.com>
 <20240626-refined-cadmium-d850b9e15230@spud>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240626-refined-cadmium-d850b9e15230@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_091430_786346_F75CC813 
X-CRM114-Status: GOOD (  13.55  )
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

Hi Conor,

On 2024-06-26 11:01 AM, Conor Dooley wrote:
> On Tue, Jun 25, 2024 at 02:09:12PM -0700, Samuel Holland wrote:
>> The RISC-V Pointer Masking specification defines three extensions:
>> Smmpm, Smnpm, and Ssnpm. Document the behavior of these extensions as
>> following the current draft of the specification, which is 1.0.0-rc2.
> 
> You say draft, but the actual extension has already completed public
> review, right?

Correct. The spec is frozen, and public review is complete. Here's the tracking
ticket for details: https://jira.riscv.org/browse/RVS-1111

I use the word draft because it is still an -rc version, but I can reword this
if you prefer.

Regards,
Samuel

>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> Changes in v2:
>>  - Update pointer masking specification version reference
>>
>>  .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index cfed80ad5540..b6aeedc53676 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -128,6 +128,18 @@ properties:
>>              changes to interrupts as frozen at commit ccbddab ("Merge pull
>>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>>  
>> +        - const: smmpm
>> +          description: |
>> +            The standard Smmpm extension for M-mode pointer masking as defined
>> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
>> +            riscv-j-extension.
>> +
>> +        - const: smnpm
>> +          description: |
>> +            The standard Smnpm extension for next-mode pointer masking as defined
>> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
>> +            riscv-j-extension.
>> +
>>          - const: smstateen
>>            description: |
>>              The standard Smstateen extension for controlling access to CSRs
>> @@ -147,6 +159,12 @@ properties:
>>              and mode-based filtering as ratified at commit 01d1df0 ("Add ability
>>              to manually trigger workflow. (#2)") of riscv-count-overflow.
>>  
>> +        - const: ssnpm
>> +          description: |
>> +            The standard Ssnpm extension for next-mode pointer masking as defined
>> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
>> +            riscv-j-extension.
>> +
>>          - const: sstc
>>            description: |
>>              The standard Sstc supervisor-level extension for time compare as
>> -- 
>> 2.44.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
