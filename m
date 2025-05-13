Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E30AC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 20:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8ExJQcapWpQgRKLXjvsBQWxbE0dgzh+CMHjI3wRGJU=; b=jXNBJwY4KjGAP8
	byITo/nEbY9bWQhUpDzAVCp1KCnQyHFTpHcI0x9lPnsLubtsWcvckdFX1sSHEW4WXqNttQp+Ds2N+
	/8yrOYlHNvdY9hcTNzuqBi3S4+TaWfv1AR4IvhZrsUZEyFGRzMLLsYC7H0G4RZzlGFVuKH3UlxhGa
	3Gd4eDa6Tz4daaEaflBy4nmyYGoX9RW+H4MAxeRHZiy/R8dhS/xPgo65WHHHA6NGDw1J3oxHsyUFC
	AF8uIRiHH+RVkSwlTZWyBnRb95RrK0XC4pQWJl84m6tK6/8TITCFCqZOn6UeQKOWAx787na7jn7yS
	Nu21Z8+SfDu3AVDhivJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwMW-0000000DU7k-2F0z;
	Tue, 13 May 2025 20:36:28 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwMG-0000000DU5A-2DFq
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 20:36:28 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-85b41281b50so192388039f.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747168571; x=1747773371; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQAC3le+BCYy2YLab53jAJm9W1rrEw9K9lEKqtin1Pk=;
        b=cnv3olfw4OtlJI2Afz5qKErF+wjll1za3scRTe2dErG8bzMcxbSg56xMSaGvSzUj3n
         qH7AnLl2HeAa/TS+EKbJAa6IjzjdzVheb6b9Lm+Bumz8mnYfkMhXvaZm1FuidOFAq8vX
         YwKrnyqfBkXEZO62CdsEVTbROoLMNr+C5f4npQ+8mOxgFR6Ilq1TDJTmQfBHOPVn0QGe
         hGPGSmtPmCtv2DTxYgFtNNFKvFwz+Ra245s+IBrMvsEKUDsO8JbJLKCQf1ELPjOR17UL
         3O/B5EkhvO6p2u7lcPFzIAQuYb1aorgsp5ni1PS2b++niuWSgbLUjbSaQBAbVZG9cLGz
         5XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168571; x=1747773371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQAC3le+BCYy2YLab53jAJm9W1rrEw9K9lEKqtin1Pk=;
        b=sjbZmEMO7EQenaBza1DOTsIFUJ75w5LYyooazqdjQIr/9jh9aUZsM9eSu4f4jpk9uF
         Zi1kF8OKNxKX1W9R0ep/eGaU0aRNfau7jQdyNGzHyqmiPNSr8w8SjcqZgped2dqeSJhy
         0oRcGBxPgOkNnx5Uy7ed4kdTyvjHyn9QvjRzZPacdqQageaD1WRW/PWGdvXNKCsklcVl
         PA38SndOuNVM/TWlAJTZvBlVKVrRLN/fZn2HyblOBo2UH5+PCD5O1ogL4XD37Yi94W8p
         SQIATsFuo4fBDDk5PB2slky6owTxNrP3meQoe53SbxAjoL2BXeQCfgZWb2+8W9ridORY
         b3jg==
X-Forwarded-Encrypted: i=1; AJvYcCVM11qrZVaahnT1Hai9pvHPnE4xy9I3J5ttMXst/pBYTZ3g8iOHMkmab0I//pkIi/8IS26tHFk6HeIXUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz637Vgn+QwgX/I9hrpZq7KjMRVjToUN/QrCWVnZtZ1L6ojSHEO
	aKSso+QhGFdpSpW1C4pyggO0SCHIcn2OaSq4pCUfFVC+qOQWxCChYwCNJw8MurQ=
X-Gm-Gg: ASbGncui/qTFyrbz1vTOjPPyFm/YPz87sRVM5sYLBB1M/Xdpf/j601tP2Y1NE1QGFqT
	0mCkN6XKj44AT34mwdkK72OYaRU8LuwRu94ELj3o+552MQMBKZn2hfBqqYghbDz1ScqpZnrKaqs
	5vyq5znD7sEs6oiwstilaoJYdfBH4a01OyOa5Onpr3eju/V2YunGA3R04ZAuttNBLBPRCah3/qd
	aAj3Er9l3uH1ARMF2Odwc/eAxHnoLdTjGl+mVPEVZ1Mw7JG6QXMpVt5BSzyX88zFGn89CjYGR1L
	n0JOnuaQkK/lQq0HMDPnjcq4c1+4CxjKkKqTPCPG/kdFFC3EVGrZNuKedUI2OV1SSzQ3CGO1B64
	kKsL+kSxVgUYRYfY=
X-Google-Smtp-Source: AGHT+IGmcYzrawJPrdx830TjmfHvKcMCTm3YWEkQZLVMVtIRd+wF9lEoF07B//54gt57mIaMgWnBSQ==
X-Received: by 2002:a05:6602:6ccd:b0:867:237f:381e with SMTP id ca18e2360f4ac-86a08db2c12mr94293839f.2.1747168570986;
        Tue, 13 May 2025 13:36:10 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22524b94sm2255602173.63.2025.05.13.13.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 13:36:10 -0700 (PDT)
Message-ID: <62b44c17-442f-425b-bf9a-56c9d4eb2468@riscstar.com>
Date: Tue, 13 May 2025 15:36:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] reset: spacemit: define three more CCUs
To: Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-6-elder@riscstar.com>
 <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>
 <20250513201208-GYA518096@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250513201208-GYA518096@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_133612_833735_0E5815C3 
X-CRM114-Status: GOOD (  15.69  )
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

On 5/13/25 3:12 PM, Yixun Lan wrote:
> Hi Philipp,
> 
> On 11:21 Tue 13 May     , Philipp Zabel wrote:
>> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
>>> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
>>> Define these resets so they can be used.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
>>>   drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
>>>   include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
>>
>> Could you split this into clk: and reset: parts? The reset changes are
>>
> Do you have suggestion how we should merge the patch series in future?
> What I can think of
> 1) take patch 1, 2, 3 via clock tree, and provide an immutable tag
> 2) pull the tag, and take all driver/reset via reset tree, and provide an immutable tag back?
> 3) take the split part of drivers/clock/ in this one via clock tree

I discussed this with Philipp privately this morning.

This series builds on the clock code, which was accepted for this
release.

If I separate the clock from the reset code into two parts, we
still have two header files that have updates, shared by both,
so those headers need to be pulled in first.

I think the easiest thing to do--if Stephen is OK with it--is
to have the entire series go through the clock tree for this
cycle.  It avoids any need for coordination and will just
get things right.  I think there might be a trivial merge
conflict, and I'll call attention to that when I send the
patches.

I will explain all this in my cover page for v10 of the series,
which will have all the signoffs.  Philipp said he will give
his ACK.  We'll then see what Stephen decides to do.

					-Alex


> 
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> regards
>> Philipp
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
