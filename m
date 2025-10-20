Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E4CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtZSH1o50tG7QVv6GI0NRMWxoMcr1OQLJBUJRkjbNMs=; b=x2Hpx3FewwXrog
	Y7UgAAiAR+iDZxMqbF0vKYCKcvtSFifAGP4qGo71aa/LETB3dc59/aFw0e5bZnjPJpgfdMbh0y6Zc
	zYB+8TQ4ZsrJCGijztw3FIIXql3gpW96od7uW7a9MJfCLvYIIfXtmquJi+uHDK8k8e0HKejFuure+
	eCmi5NPv+qd7SoNFRAYMomxyUEvYpj3ZsUxRdu+48bwUoRv1JukYB3Do/BaEExRhfy90rApxKuxDv
	/q8eyrLPX+ykXDu5NssNco596fL0iQsADdLxG+5NhLA6aSouYsTU8FgEva2EJU2gNCRdjYeFtUY7w
	TfD08iRzGMamcoHKL1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuHU-0000000EaKx-1OEv;
	Mon, 20 Oct 2025 18:06:52 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuHR-0000000EaKE-3Ewn
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:06:51 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-430ae09ea23so18156105ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 11:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760983609; x=1761588409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AQlGU0mYQ6QSlBwOOl9dIxsMJVc/9az/WvQw51SeIA=;
        b=DMDusdZqT53v01pQ30s12NWRO38sLbA/lojebKU6JZno5iFB/THqT4A7UhQ2gjqOa3
         ubvaCcrAOcGPoW8EVeZpD2iDPqtK1dSQAZt4Rroq+9weLJa7GeljRf86cSFIk2hc2Mql
         HQrUCwcnbuKiC+AUQ4ahJmGgY/3gsB/YYe7ovilMlIFqxoKzgSkPMvtsVjZcdXxMI2k2
         /HWkFTKvLkpvGpwnuSHEBBDGPxTmwQbywJb7VFlTMZ4OZEhv54u1bB8mmFSDsHr60x3J
         W2WHLN9uU12Xyu2TlkvTbh5baBzuv3mwxxzLHHdiNbWgT8V/DoHRuadFnjuNLqxva12w
         EC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983609; x=1761588409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AQlGU0mYQ6QSlBwOOl9dIxsMJVc/9az/WvQw51SeIA=;
        b=D59KQ2EioAvPy63uby9JtPyUbQNgfPl5EAWoASyUM3IC87lbD1Lo8wbUMae7hWhjBX
         5tA3XzhBhaqMRBmtHCc6SyQGa9W/qj/B5+CiD7t+B4pNlj1BBL0qcKahmmzG6yfKcPiE
         VTxLahqLOcLaiicYmN8AhXJLUc/8St9yaIOz0F177AaheNdEeXYN00lwQU0xgpXLsjuz
         OOxXq0MvPDvzRxvj3NOcEBVmK/wgoMTISzJBCkOVfmdawytaTFErPYXP3ICtrB1fdze/
         CsXJbznXOkkJTuk4Qs2Z9uIzb3mU2d3W0mxwh4V2zFh5UuPkdlYSAj5ycUpLbtHaZSel
         7D6w==
X-Forwarded-Encrypted: i=1; AJvYcCV2RCfG2ihwf9bQaIqf/8+6mzkgK9lW9919vwLmAvf2CxQ+Na9zD1r6vBm+X6TP/+ochiY/lYBA8XSjHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRBrKPjGKQQ0bo+z7klDAyOJyQHrJ/dilNDb25JyEPdhOa/zTI
	GbGYlhj2LlxEG0VmhJ/2gIYwfBn+WF2O3Qi/Snwjg2t3M0BuqgtKK6JFMzRJMmiRmnk=
X-Gm-Gg: ASbGncvki3n5yxAqXcLQccbiRaUIpugNklem4ckjyl31SZVRpsQ/Ay/l8lY93XW/PWH
	nb+76YNugGTHp2r+ah6kuclsB1nnfq2WyX8wKWqOp8YScfBox3YM3A2a35nqzjXe8YGqOvhm03N
	9sudZ73saymv1dZmEF2GJcy/VZIRWdjRcnYVX9nT4MQanZc0AzKRqIJV961jkkKd7qIAlBVljK5
	VmKT45KbTFVUzb5t9QsjLFDZ3byoCZzLk/b5GvqODTwY+eKCQ66EMotm+EX83ITuuAkhYNs4BZ5
	ldTDJABTj1BwolX38av6ETEigfmx3/p50zkRsSAjUmj2qov0r9CzFo8dlyEAu3NRoyIW7+pR6pj
	Qe+3MgdoXFPKrCB5J3bx/0YIMljZFSkm9xAFhHz4dhukF90zkhXTuJk4gBUnOZ2k77/HxUms06F
	zELJt2TkBhNanTtvR9+BqS1alCjNG0kj8tym313jY=
X-Google-Smtp-Source: AGHT+IHBHKCx2YHdGAi+SFpNeca9RlxGKdmS/mH/TPdmxuSdnx64GJbh4fpZfHVsL9gExE3U3dhRbA==
X-Received: by 2002:a92:cda3:0:b0:430:b4ca:2696 with SMTP id e9e14a558f8ab-430c514e290mr212982775ab.0.1760983608698;
        Mon, 20 Oct 2025 11:06:48 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a961e88csm3172542173.15.2025.10.20.11.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:06:47 -0700 (PDT)
Message-ID: <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
Date: Mon, 20 Oct 2025 13:06:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Conor Dooley <conor@kernel.org>
Cc: han.xu@nxp.com, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-blinked-primary-2b69cf37e9fe@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110649_991589_AC73D993 
X-CRM114-Status: GOOD (  12.42  )
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

On 10/20/25 12:39 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 11:51:45AM -0500, Alex Elder wrote:
>> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index 0315a13fe319a..5bbda4bc33350 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -22,6 +22,7 @@ properties:
>>             - fsl,imx6ul-qspi
>>             - fsl,ls1021a-qspi
>>             - fsl,ls2080a-qspi
>> +          - spacemit,k1-qspi
> 
> Are the newly added resets mandatory for the spacemit platform?

This is interesting.  I never even tried it without specifying them.

I just tried it, and at least on my system QSPI functioned without
defining these resets.  I will ask SpacemiT about this.  If they are
not needed I will omit the first patch (which added optional resets),
and won't use them.

Thanks for pointing this out.
					-Alex

> 
>>         - items:
>>             - enum:
>>                 - fsl,ls1043a-qspi
>> -- 
>> 2.48.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
