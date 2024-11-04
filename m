Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB73D132CF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7z+NBsW2TC4rH5g8HmFOOYPiqwbWon9NMgGObF0IPA=; b=mnPlFJmIOmi/V6
	KvLiNWPCNAAXTMMm6MZ8oPQ9XCrRnTMTfONr28A6FFl5wD1E7PIVik/dWWe8p6GJDBUZs/yfS8s80
	If6c7eYwmNxHNLR3ANND0/RZmM+riFt4/6QrXdfyT4e1+CublOcM9ldxk1k7AKa1W6npQ3Kmx3Phc
	kg6sBM+1jh8ouYIlpDwyUYBjj2LxlAHj0mfhhEoZGys+YJhFBAVVGEITIATTEoY9C2pTQztv93DSG
	z4KeUn9b1AdMKyuta6/PihDePc4m5wAdVIyRqXKHzuyHfvAnMVNdkkGSsMNJiaU2vkiWNGcJP4RDk
	J2Uzbx9i9H4PScIKs9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xsH-0000000E0r3-3zpz;
	Mon, 04 Nov 2024 14:16:09 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wiM-0000000Dm3u-1MiZ
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 13:01:51 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-20c693b68f5so43744345ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730725309; x=1731330109; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bggMuP0j8I4Cl2VFvczgvzqyg/UZ6DBjAMKce4D1IhA=;
        b=lW0fmDpmxIh23Qc2Q817RUok6mmMmrMy/eO1lt5YLY9xR05sCfSDXET8ugylyjk2Z9
         jVQVDmuGgWrmHnnVXdnKLU66m6BqwnXwwB+IFKi5tXzpUmQ47aofCaklUeJeVsdJjSWW
         4wFoYXBB+hgD6dXIZaCWEjrdXNDLGLa+E23HlmEBUY1U7x24EE1gsbMJN2OqWTMocWzw
         NSy7xNSl7u8ExHs0s4ZVH0FgxMs37yCKpZJeoHO9sg/l5NxHomGatYtk4sVMmOMXUsAT
         Rb53Vfq80fIYV5eLK6ps5mQeOZr/NucaPQ7BUuc0fmywZWpUZ84tJ1546lBg8oZwPIf8
         2mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730725309; x=1731330109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bggMuP0j8I4Cl2VFvczgvzqyg/UZ6DBjAMKce4D1IhA=;
        b=HSVlT7dWVtY50D4E0GloyGjRsD/IV4q/Y76+fEeSHZFQM4edi4SiLRjitdWgFpGxXF
         iGcR7kf8LDdVV+8Os/9Jwhgo9sthDAP4V1HksbUYD+csOSodC2ii3kynsCZmPQH1YKTo
         Y4pj9EeqxSCpEEHfQA1331vpaFFXqpwtqL3yflHOuGyjKH53QW5vDSUks9olLrbKxmmU
         ZPJVQXCIC5SSjSM5j5rwxWi3PYnztNfC/9mW5V3vcbNZKJyRyMBrLVITlq1rlBxAAISI
         k+rLKwpytFNXFXc+I5WgtVb6AgOUoOBjhQKJvZ+N60+YzZ+RqCYttay0ewaLVV/5N4Zq
         +i7g==
X-Forwarded-Encrypted: i=1; AJvYcCWCB8I7ePAWqUmZgM/1SYdKYHdm2bvEzOSR21Etri7AbgrFmJ+096MTjo0VOohMeThU7Vux7y2uPFBXyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyERTND/yAXjm/ToVOIJQt97LlLs5zGfa2dAUq/b8J3YaK4GTVT
	dXx0aD3YrDjp9zHIf1RoqTTnF1HRnUOTZ3m+PHfM4CiYJegWp+9j
X-Google-Smtp-Source: AGHT+IGp9W2hxadwgRNmNykF2kMJxHkLvqXSziQp7OTyn0xuMYqTlQh0Q/87CZjhUI3SSdhNoev0dw==
X-Received: by 2002:a17:902:ecc3:b0:20c:ee48:94f3 with SMTP id d9443c01a7336-21103accfbbmr208730745ad.14.1730725308712;
        Mon, 04 Nov 2024 05:01:48 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2bf7sm60238765ad.173.2024.11.04.05.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:01:48 -0800 (PST)
Message-ID: <6cce463e-25cc-4a07-971f-6260347cb581@gmail.com>
Date: Mon, 4 Nov 2024 21:01:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
 <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_050150_402575_224A2593 
X-CRM114-Status: GOOD (  15.11  )
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


On 2024/10/31 16:00, Krzysztof Kozlowski wrote:
> On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
>> On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
>>> On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
>>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>>> and supports FIFO transmission.
>>>>
>>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>>> ---
Change in v2:
 - Change the maxItems of reg from 1 to 2 in properties
 - Change 'i2c' to 'I2C' in the commit message.
 - Drop fifo-disable property
 - Drop alias in dts example
 - Move `unevaluatedProperties` after `required:` block

>>>
>>> Where is the changelog? Nothing here, nothing in cover letter.
>>>
>>> I asked for several changes, so now I don't know if you implemented
>>> them.
>>
>> I deleted the FIFO property because I believe your suggestion is correct.
>> this should be decided by the driver, even though the FIFO is provided
>> by the hardware.
>>
>> Apologies for missing the changelog. To correct this, should I send a v3 
>> version with the changelog or resend v2?
> 
> Reply now with changelog. Your binding has some other unrelated and
> incorrect changes, which I do not understand.
> 
> Best regards,
> Krzysztof
> 

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
