Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C1CC3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 11:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijFDgkt2EqWrpwnWzMfN4fFiRdTSZDTxB8WPFucXrRs=; b=rS3btdwqFPLMSv
	MtWlG5FqmgQ5bOA6GQK/pNGQmKYkaqcJuCzXLxAtBNdb4fblA5ybgh8j7zgOV+lUqpcvb14TidNcW
	i9n6Imajv7WKf50PErFhBZKnUmVvOKmRojU8q8hG9BdTUFt7yINFnCc9uO+IAg0/56hplF/QnaRTx
	X6oDfEV3dfgLmN7CEpSYLz1tH4/jbpgwq6JcUZoPoY1bNKKtyAQj6E+N9uS0keC0FZ+LV/4mS7cOF
	sn0+6GjadFzq5aqlsXbcRmcerCI2WwEtbeasdWW4Pd50dV/Xv4GRY6bOwMnaKbH1mPFsPIlphvwtO
	xlKzpy9LgpIvB9y6te/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzbn-00000000Vjw-0ttD;
	Thu, 08 May 2025 11:40:11 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzbk-00000000Via-0laL
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 11:40:09 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-861525e9b0aso77268639f.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 04:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746704407; x=1747309207; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gCgDIEvIXJ5HjkEoan0OBOu/905mhsNatvjj6Ubkh0=;
        b=SatBaC9hoel2uulNJHNJhRm7c1rzWaF2aT6r3Z2Q3qHb/6gGN+mZXUaFAS0pKsgVUc
         SbV57rACQ2le07+/80+IRIuLg10gPYWc1RPc2warkPj/ce/u5GKE+wnBw4JXruD7rHJM
         XvkxpK+A4DS3SlSP+xF6nN92+UFzDHhmLMD6g4wcRfi44qdaDWJZuNjlYx6MJqigiIHh
         JEAj3/wzWLPa9YrS/Hfz7XCQBmE/KGvEkD36fCicPJZ1aLBKgHr6WjXUOOE/9ZMN7g8a
         4kc4Xx8UgjF8MQFTtrmsgIDjk2iFifN2rPTS4+0rPOGKUD9ntK2dhrFgByu2Cbvt9ge/
         bWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704407; x=1747309207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gCgDIEvIXJ5HjkEoan0OBOu/905mhsNatvjj6Ubkh0=;
        b=IZbcWoylFD3PUHdAq2rA5zK3VdUVdiG+6vPpLGzFwfDW7kTJLzeqS8W38jZAiPDwSz
         2P7oOq/6YJdY31M2cz4S+AeGbZY8hdPBrACaKnyRCn2BecanqMrhpOIhCQkbn79agUE0
         5R77rfsxTSJHCztH13ad/jbUREhWSjGgsPfAsh/Uc3TDC67WhG8P1lYgRhHtAEWes3RE
         T4gkN4LoAjJncM+lxuIoZxgTTU9w4nDk3yMKSjKRV+0sOjCDLRv9jxAznZ7esVz6H6hY
         D194LXGgOxcTzLthUe6EMpjYRfbEiEsgCDWvz5gF1VALCZ5Gif6UjunvGLzX80e0naaW
         W9wA==
X-Forwarded-Encrypted: i=1; AJvYcCXFXqHrxsElCGl81mef9lWaEdANqTEBdRknI8ljanutqRMaOjI71VxsH1nWxN1i3WgkZt3O/u+KxHx0/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnLkKlPF/OrOd3QOGXSvd0CmMLBptPnczsQylV3Lzla1Q/BpdF
	MJBMwz2v77YtUUu2ppkFqMddBWW3ievslnPt0GwMg3gIuAGGCuBO+wFdmQ75Ipk=
X-Gm-Gg: ASbGnctrb3D+bDSXofjQYQezRwJ5zP7NpitZ4Jv7WWWSdNRVKA2jL5fznp7BwHn802v
	Bd6kk+k1NYjFW9Sbq6rW6ZIIdJEyEYcLBpe6Cm0kbWtQ8IP7W/+J5sr2fA76gWrEKgtKpyYDmZn
	4lWbynwNe4DWuzuHY3wvWhumLy1iI+rXGxguPID8L47S6HjuYCKNPTjDwXQ+n0oajjy4sLkEeGp
	J3XdaS4NWEmFyZ0jqe5Q2NlkRBswIFM+kUF/GgKzTMhnAVsKQT8V4xqtE3LaMn39pfayUgka4Yb
	/JBAns8MwDtPhUn/u5H6K4yBYHhrNVdFdgmBwTohSccng/J6MLGgelhOhUxkRCaDzWtGOF4Zm80
	LjrL0
X-Google-Smtp-Source: AGHT+IEgQbpeES+TFJhbzId8HdAIkJfo3yOl1pgxcIDfMs+gyDWkgbwTLja1UcaM/Qo0ZByBfH3ZrA==
X-Received: by 2002:a05:6e02:3805:b0:3a7:88f2:cfa9 with SMTP id e9e14a558f8ab-3da7390856dmr72096535ab.11.1746704406737;
        Thu, 08 May 2025 04:40:06 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8e1f7sm3145496173.121.2025.05.08.04.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:40:06 -0700 (PDT)
Message-ID: <d6649f6f-574d-4ba6-8db7-d3087f421386@riscstar.com>
Date: Thu, 8 May 2025 06:40:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] soc: spacemit: create a header for clock/reset
 registers
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-3-elder@riscstar.com> <aBwwBSfnkw6XUOLA@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aBwwBSfnkw6XUOLA@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_044008_222597_8EC5C6CF 
X-CRM114-Status: GOOD (  13.09  )
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

On 5/7/25 11:16 PM, Haylen Chu wrote:
> On Tue, May 06, 2025 at 04:06:33PM -0500, Alex Elder wrote:
>> Move the definitions of register offsets and fields used by the SpacemiT
>> K1 SoC CCUs into a separate header file, so that they can be shared by
>> the reset driver that will be found under drivers/reset.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 111 +--------------------------------
>>   include/soc/spacemit/ccu_k1.h | 113 ++++++++++++++++++++++++++++++++++
> 
> CCU is abbreviated from "clock controller unit" thus the filename seems
> a little strange to me. Will k1-syscon.h be a better name? We could put
> all syscon registers together when introducing the power-domain driver
> later, which could provide an overall view of register layout.

I'm OK with making that change.

To me the "CCU" was the that IP block that offered clock and
reset controls (and maybe a few other things?).  But renaming
it, given we're separating the functionality more clearly,
is pretty reasonable.

Thanks.

					-Alex

>>   2 files changed, 114 insertions(+), 110 deletions(-)
>>   create mode 100644 include/soc/spacemit/ccu_k1.h
> 
> Best regards,
> Haylen Chu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
