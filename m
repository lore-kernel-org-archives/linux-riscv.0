Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0B8C982CC
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 03:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AT02L7UG7EFUqEynpatIjUbfx1FTiKLIT/pA9ukOYdA=; b=hEvInGa7h5gk19
	5bzboTviJ2rpKIgdQRQjLgk8ZQNjRFXI5MfmTG/0OG3SSy87ni0ou+IdQb3m3liNNPmg2JSl4BOz9
	DM14fycXlcs25gaA9Pu5ZaAM4CGDxe9wpeEwun3E4sISPlI4GVI5qKG7vq65HlbnIFdiMeBV0kC/i
	CQaGee6jsHNCOwSPFFnxOyWdGjKwoc+AyV9s1HeDZAJGAGQ6Q3iWANtwMpQKi7Zphh9dirrmuGck7
	VEBem/BYpvp7KpXNiq7mDYL3Xi5qxHRc5jdjWkiysDXq5BSL6MHnLVQd9Xy30c5Vet47IfnSzsyz1
	7//iHcwHe15QI8OJuZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72mB-0000000AWEK-0M18;
	Thu, 17 Sep 2026 03:27:07 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72m8-0000000AWE0-3RKX
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 03:27:05 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so2420185e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 20:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789615623; x=1790220423; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfZ+gBA8a1DG0OUmX7Tsw/OgchSGtEjjMWjZU8Wx4UA=;
        b=P+5wDkPgyXBiDziYuKETXoavkm68EGUNAsYYpXqgCkn+bGdcJjUjKYwbu7SEB4p4oy
         1ujzBmXCY8n+c7BXS7PS22NWBT9ph9krTJtPOIeqKXHrR/fo+57WBE/3YbSVe8LgDS5o
         H+54ACLgAfoShYDTJW6h/f3qL3CigtXRFOMcgmtMHSb0RL3Pn4RPgj2QVmwTzfC0KPMZ
         GxDZpII+5/J8RkCLNShJ54eQS8xtuTcLMBH+eupapZINwBe/yU9l17cwRqT/eSCRuo4A
         o7E2myuf2/Gf16r4AaBsqHB/NhW0WXzbT8k9rZWTnTu0XfyNLdwwxDXIDUaz6unEKOco
         d1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789615623; x=1790220423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfZ+gBA8a1DG0OUmX7Tsw/OgchSGtEjjMWjZU8Wx4UA=;
        b=ynjSDloOp0cRTzubmbHI+mFA3ZNj4rHoUUBylDcfHb4md1QPLE6RnZ1T8PqgJ5kwq5
         c4IcuMR6TtdBAu6vu1ZaJXlUzjEjb7qHfS24hO/BP/G5bnF7gyU7Dp/s/zXF2sMm3bDt
         YazzUlMqxSkrkihluBbAC2gFIz5bp/PcS3ffNmnd42WzBcTD8Ghox89PuetzOBP6TjkH
         rqEmfW13Ofj6KNs6L+f2MnYMM/nhur7VCnEsIpT5QSKdCcMas8q/eViGgeB+tafRiU39
         SSIdTb6qF3SWdQaJrf+nTqrOicAmzi0OWTEfXYurQF2BR397MD44vMSPH1kcfge0BGuc
         fjQA==
X-Forwarded-Encrypted: i=1; AKwUvBwejL91m6hDgnSZWBSq6IvJZu+pP0bf0k3+EQ0eqV6PB4AdnUv+2liyu++N4DgUPnIV6OREFj0ek9ZI1Q==@lists.infradead.org
X-Gm-Message-State: AFuF++lCjtIHlw5LuCr6Zxdvj8H5SM5NoFQ+ijLp+KapOk4wnG8m3l73
	ydZhewzs4uUrAzJa5MhOTdmAHJkzoC7WPigt9lhW+3ie+8TC4qaJ2ViM
X-Gm-Gg: AYBFou3UwKPcTljd2gMyLtw0besXJfnpau6XzmSa1XnQyfi78iQXhGeLn9fVNlksQU2
	Eow/gEUDk3rkPn+GL84BIDvHODwAtO25hRl3SPdM2qz+laOdi5R2sULnAGAkKZcrIzfrEq5kgJ3
	LkpBdV33qb7vlnEjqQocmnvmIW0UKaMFtKXUTiITOmK6sNAvXUPg2P2OLfMwsk7WpOb1jiZWkqX
	eHgwjWzvsuci4H97uVRZbjHJntWG8AQUCK20UKoT7xSlVEzqm+BQdqm88V7ng75arzMZiaRv2uT
	mHbAyL59tWRkViN+Y04L1Xgvu1P2Bxl/Pw9NeT5CYpmGMpc6NQecrsR1BT3nC4EUFAVb0kCxu2d
	heP/yI0W6/SjSZ1ePWi61njm8/OXtmKtni6JnCU3/PtgpFpXqfVbpbO+/fj3znc1BR9GvNOxVeZ
	qUUrVWJUJ+qSoncEEXaX/lBKo7ukB5eQKQB/EYCwSB0nbz475kAzPVVcPPmtkt5EUlmso5iI9lJ
	AhP+XXoZcQaftBtnMPzbYjZy/E+9MkL2nAOfaieU/RayaN/DiDnThl07Nqv5BZ1AO4cncf+Pnm4
	NbjHIc6FN/5P8/XI8kl0sSacX69G3YSFh2aFzn7iCKSQq2yNPprFf8pOQahk+98RJ0KK2c0PxWO
	ivoc=
X-Received: by 2002:a05:600c:8b78:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49ebb4297c4mr61135065e9.24.1789615622470;
        Wed, 16 Sep 2026 20:27:02 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e6ca:5780:b097:7d16:9a11:ca28? (2a02-8388-e6ca-5780-b097-7d16-9a11-ca28.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:b097:7d16:9a11:ca28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm11432549f8f.35.2026.09.16.20.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 20:27:02 -0700 (PDT)
Message-ID: <e2c853c4-34bd-4f2f-8c8c-a05cc4442a98@gmail.com>
Date: Thu, 17 Sep 2026 05:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
To: Inochi Amaoto <inochiama@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yao Zi <me@ziyao.cc>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
 <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
 <aqtKAuoVSCxcts52@inochi.infowork>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <aqtKAuoVSCxcts52@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_202704_898201_10105448 
X-CRM114-Status: GOOD (  16.48  )
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

Hi Inochi, Samuel, Yao,

On 17.09.26 04:02, Inochi Amaoto wrote:
> On Wed, Sep 16, 2026 at 12:10:23PM -0500, Samuel Holland wrote:
>> Hi Andrei,
>>
>> On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
>>> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
>>> Reserve this region to prevent Linux from using it.
>>
>> If the FSBL wants to reserve some RAM, it should modify the devicetree at
>> runtime to add that reservation. Adding the reservation here creates an
>> unnecessary ABI surface between the FSBL and all consumers of the devicetree.
>>
>> Regards,
>> Samuel
>>
> 
> This is fair, and the fact is that the current fsbl can disable
> coprocessor in its configuration. So I will not take this patch
> and maybe do a cleanup for existed devicetree if I have enough
> time for it.

I guess you are right. Just thought that it might have been mistakenly
overlooked for Duo-S because both Duo 64M and Duo 256M have the same
node in their DTSes.
If it is okay with you, I will try remove this node from the DTSes for the
64M/256M variants.

Thank you for the review and sorry for the noise.

 
> Regards,
> Inohci
> 
-- 
Best regards,
Andrei Lalaev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
