Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AF8CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/wpncR7v1xFzVaulXS5A7u7mt5fYIYKldi3v9o2VZc=; b=HUVhO0A9OUYTLU
	iBJN8ZvIrCd063gPiKyoqUv/OE4BG8YqrkssHXZqDwd8rLNeahoG/Yndh6mWeTNNbVYkR9AN3EUOY
	pMGmJGqTS8IZG08/ukZZHYT2Fx4OpoyQWUriplOPCpJmaVtrZqdmxGLPCSXWNXnR9e49HbDtQOOwX
	7zNCU1blk8MBgiR7JMaa+h2W2FLkbyZjSlBxvlL5AGcP7961jXNKYHJlxZph27yJHJk3lGMhmKVK9
	6CrwTEap7Of1O17AVLBsyaBT5l4e8+guuq1LU0dhJwV/HZ3e43EEucAG1UdMonoKFNL3La1TY6Rh0
	XYth5cZy7cg+n0vpzDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAukx-0000000Ee1k-07w2;
	Mon, 20 Oct 2025 18:37:19 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAukv-0000000Ee1P-0ixn
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:37:18 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-430d7638d27so18144235ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760985436; x=1761590236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jr/vYXNnHg5mvV0vPYpieCO6Isu4juKQ+h7apsb/fSI=;
        b=FWyndSp968Mi3QImzZQeoTYJdAPFKpbut3/9pP9RWRkxU29KUSIG73GcREI5OJ63hy
         HAcgstPhAx2a2eQfr2qWUXnkGffsVtAyzULc7fPqQJ9Ot46ljnyPAfxw3jYo8kDlMMaO
         SL4Li52A/mVL6wQPmZBvdr8kOm1BzqSocQbiTkwfjFGJ/JzK41x2hdGK0gXVNv7xjSGO
         HALq5iGE8yf/L4XIumzpsstlUfDZZoe+BgZFsoxRaexxqwYlJBD3BZ2p5pQ+ObAJJECs
         mwQuNozAmv1XGNBLYvXjc1grswJHB+0agFj2+cYXicbGv4yJ7DFkrHvA962z+2dIbXrV
         OoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760985436; x=1761590236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr/vYXNnHg5mvV0vPYpieCO6Isu4juKQ+h7apsb/fSI=;
        b=HgExjYgITMGExhanK1drUIGvjWjXUl1byrwYwdT79RHOjiEgQkBPFcSGxYfQSvnl4r
         ATTg7h3urFkWv5deGOBCJDpvhk5yIqKZvnX4v2KGD0SmlH8GyD12GbA2+PlArTzXUedD
         xEhpP7yozXVbneoRDA4SWuchlOyB8z8x27OT/4fALsqAtcEtngx5mwBL6fB6nKVehAnM
         MwRN4dxJcEM+TfYdIYoRb6BHeMN2on1Y/j2ktr+0kRBIu0oqw8PMCRrRGeq0JoMgVQoD
         /p+qW8lkFFcakFO4WKyUA7hARNPrcMkO7FUVtvENLIPccwDIDWuCImGxUDNnayUyMbgd
         PNWA==
X-Forwarded-Encrypted: i=1; AJvYcCWkfHxMN3P/RsLhfAFlP5rZHNnYXc/X79riofvPI4lbBZw0fIn/TsBHvc0T8L5gB6B4lvgHf2vh8xM3BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgDNoFNn8MWWWBZtAWzCsl5I9WU5biM20/Csgmw+9kPfZmeMm6
	x+kKl8jRsdTEwdTrpnv+GvodWkoo6JKOey9eY3AXzPn+3JwWMCJ3kwOAIxEPnNvJReo=
X-Gm-Gg: ASbGncv88QUHmZXYi4oghfOwLu5NI1gks3VgABYZbe/9xBLRnMW5Mva8HAd8/1gFd92
	GYvEY+X/C0uu3FQle8q63imikgFDwBiDDvrunm9NcTRTJPH7Zkg5UZ1IjaNgW75376GlJddcU8x
	fDqAWLUq0hPZiRExghHg197dNrsySjGGgY/v6jV80Bn42vxxv20KcVwPumljZ8/LffkILmdaLM6
	PKwtDeCrWBcxQqHFI7A3ofIPmkAo7sd6NbfqDa+MhJQeG2Zreg4/Dw4ySkLw4W+vcWgrpga7zQt
	UqQmiWH0PdEHcYbMKLTzYe/mxVTn5XNCbfL+OGRSf018eG3KHIzx7SLveMZ3+7XTqFGm6Owc7eh
	W7btuqXwcVNyiMwoMhFTckUF2YqB4TWPJaHT7tlQbZ9jDNHAwIA6PQrc5CLLjXxIBKBOCcmrB5v
	I2eY3+iIuNZbQ6+5kutbf20UJWh4nya6xjNkOF+vCQ+H/F53xD
X-Google-Smtp-Source: AGHT+IElNLjj7kkxLdaR/W624I/459FfOH+dYJAUUw0iEYH3D4Q87WRcXxpP//DJVpw9S08uE/P7Hw==
X-Received: by 2002:a05:6e02:1523:b0:430:a973:7e53 with SMTP id e9e14a558f8ab-430c5294ff1mr183507015ab.21.1760985436041;
        Mon, 20 Oct 2025 11:37:16 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d070ba35sm33475995ab.10.2025.10.20.11.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:37:15 -0700 (PDT)
Message-ID: <e40f28a2-960e-4002-8384-d99343b4fdd1@riscstar.com>
Date: Mon, 20 Oct 2025 13:37:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Mark Brown <broonie@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, han.xu@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
 <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
 <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_113717_240669_B1468F95 
X-CRM114-Status: GOOD (  13.19  )
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

On 10/20/25 1:26 PM, Mark Brown wrote:
> On Mon, Oct 20, 2025 at 01:06:46PM -0500, Alex Elder wrote:
>> On 10/20/25 12:39 PM, Conor Dooley wrote:
> 
>>>> +          - spacemit,k1-qspi
> 
>>> Are the newly added resets mandatory for the spacemit platform?
> 
>> This is interesting.  I never even tried it without specifying them.
> 
>> I just tried it, and at least on my system QSPI functioned without
>> defining these resets.  I will ask SpacemiT about this.  If they are
>> not needed I will omit the first patch (which added optional resets),
>> and won't use them.
> 
> It might be safer to describe them, otherwise things are vulnerable to
> issues like the bootloader not leaving things in a predictable state.

I mentioned exactly this in my message to SpacemiT just now.

And yes, regardless of their answer, you're probably right.
It is *possible* that these resets must be de-asserted, so
it's safest to describe them.

Conor please if you disagree with this, please say so.
Otherwise I think I'll keep them in the next version

Thanks.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
