Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F1910F3DD3
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 09:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:Cc:
	Message-Id:Date:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFojW2Yz23IzUMFHNB4JoNJYMTatSBLzUivTtUZ1OZI=; b=aVb9FvnE9sowpY
	n8AIF8482pbJemfDFghrhNOPTzLtvzpFLRm96XiDbIsWWgUJb5Sau1lq/6FMaOtOTaJr0kL4BZszu
	nwtNOhM3nSlXAmRPVRwzn9NwXnIwQjVaBWcMoCSWaD5CYuIhJDGN/52nNxLonfCrO08nMcD5M95K2
	5CckydBM59Hf0mskNwOjwaDWQ/EaL4E/VqiNVOHlXuzzYiW5WRDfA6/nI0AaHtnbXdKdBbfi6nqKp
	q/7eRztcxGI0pntGREFEsQOMAxagFE0+nwAdX1DRyCy16spPyvzS1ivDj/Jwm+l/breSqhcpghzdy
	ggnd3t2GCg68eO8TMlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QFx-00000008nFB-3Fuc;
	Sat, 28 Mar 2026 09:47:01 +0000
Received: from mail-dl1-x1243.google.com ([2607:f8b0:4864:20::1243])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QFv-00000008nEq-3OAy
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 09:47:00 +0000
Received: by mail-dl1-x1243.google.com with SMTP id a92af1059eb24-128e4d0cc48so3592599c88.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691218; x=1775296018; darn=lists.infradead.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm84PKI95ws94X4le7u52sogEFGb/3XJpC4WJ7nzO9w=;
        b=I3TagSCeA9JQVZSoRGK+wmXGYvA/kbtmysBhk8/TTlvet9d5M0KGnD6XU1dLO5hetq
         +0LCnz+UbQh9BIatQwBrG1bP1rZYi4023NRJNHYwTNiq5yFxShT2zQTyHPCWdhekX0kJ
         BKL5yliNzSNyW+Bh6SPS9+BjJw9IJG2upGUZOXGdZnNcjGhYkGnt9j5V6qu8qE/RldWs
         Afhkx77bn3jO00ZnnGixvLsizYGNimiogBGx8HoQZbyViOs5iB8WSowRNJ2qgOMJHpA+
         N056m+htTGj3dbsuS5yh8FuL0OYsZR0d2oTJ43gEIeNtqVG+UjtKIF4hdPS95zMtRukO
         NCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691218; x=1775296018;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm84PKI95ws94X4le7u52sogEFGb/3XJpC4WJ7nzO9w=;
        b=LbcZst5UrkyMjFwzZ7olYbH0f7PrHm99D4bHxdJOwKTcDyBV3waUYLZDhvX1AdpXlu
         Pr4S76iBF4lUKRi32pVe7ZOZ/+cBwXmMGgRFc1XY0+EiNRbMM9zom6k8kx3tRKyq33pP
         L78s8FiQMpvhno6ncayEz9jBBwDYbnxjgjaCLcWU9/VhNsGv8ztpjNn8EZvxFE5921CL
         +8PA5w6ILOLdBVCOzuDF3kk6ILcpgE7wRKdC+FCrHBMewn8Fx88381NgTycwKOebds+L
         ZpnyBSkBi86b1cFzjIvlT5PTIRPdPPHm2eXOxqRdEuXqoT9mZfK2Cxqm1bNPmrgIIkzd
         7uAg==
X-Forwarded-Encrypted: i=1; AJvYcCU9FvAUmdkn7YFAzCepZf6ejRDD0yogLUe/qeZwHHYfNaCn41jSyUfZQOCpcjCe6va5BIPe7LP54xJOnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4sriFW+iG8xQC7F3kmLFO/4Tu0LfJlefIFbKGovYWiJ8CRwzC
	xPdS5X6yQfB+3pNs1dH7IyTnNh5iNKda1JZMOqgC9LSEG2xFKOV0KkbN
X-Gm-Gg: ATEYQzwlhZFeRyNJ6XaNuV0D9hDC8tM4n2SInKgt/46Rhtmmd1cwi8atOHGxNsp0weK
	zar3eFHGb9oiHE4JWeSxqc5/lWIvbkEK/75mJSEnIgFxQyVWK5fu0Jpd21TVl8s8VCDGYgfRUU6
	9gocEAsLT3R2LogeZ3kHZP83uVQgwKE6Mn0t/pIhQNdFDNcNzBL0/ydnQs3ki7tq3x9AqfJYXBH
	VcQF/aQYNpWJFGQ8+X5Gctl6BhtyuqLSKvJxc6Qf6XI9qloElFz4s2FVUdF8foflWx1b3KotDuM
	KAVaV2e1/2seA0DSNpAT1Eo7A4mhrdRwFj5FD302kexpTgXoyEuhU5IJyFXESAfSULc/gsGoaNx
	2jvblJ4bOO0y7EQ+t86un9p1I6y7/O4R6tE1cEIP2HoEHcKkURNvSKO1md2DCRK7K25YIIXIh1e
	eDDWV0EzZYK8JlO+x0cU7t9Atj2SalW4vyV03ELg==
X-Received: by 2002:a05:7022:6085:b0:123:345b:ba05 with SMTP id a92af1059eb24-12ab28cb38cmr3135449c88.22.1774691218233;
        Sat, 28 Mar 2026 02:46:58 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm1773856c88.4.2026.03.28.02.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:46:57 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Mime-Version: 1.0
Date: Sat, 28 Mar 2026 17:46:54 +0800
Message-Id: <DHEBJ4VVDDY2.2KRIW6EP7EXOL@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
 <20260327-fancy-nondescript-mouse-cfd6f3@quoll>
In-Reply-To: <20260327-fancy-nondescript-mouse-cfd6f3@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_024659_877831_F544D4E1 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

On Fri Mar 27, 2026 at 3:27 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>> 
>> Add the DMA request numbers for non-secure peripherals of the K1 SoC
>> from SpacemiT.
>> 
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>
> No changelog - neither here, nor in commit msg.
My apologies, patches 1-6 were added in v2.
I missed including this in the version history..

>
>>  include/dt-bindings/dma/k1-pdma.h | 56 +++++++++++++++++++++++++++++++++++++++
>
> So previous review applies, no? Was there such?
No, since it's a new addition, there are naturally no previous reviews.

                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
