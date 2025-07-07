Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C01EC8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uw3fdlt9dn21dkEm/Q3o1qpvBg2hSU+qIIVgXPbBS8Y=; b=QE5XcGybop1oyI
	vWz6s3d5XoozDzH+PrPx+5N/Ieai9sxIQLC99VQDuQrJXohAP9NxV2edz7Vgdm56EzgOybSDVqhej
	Dit8JrIwt4NhEeEei+F6xVVxN0+xj05GhA00BBd6p+f+wEFanvKFjW3oCuImcCqJAAhP+J6Xj8a1Q
	LDK7RTioMMTDFTSluncWnV1IXdriVrEBhMhXxRqfCgnNIum3Nu2dN5FXBTrIie8oq4wee1Oe8Kt/c
	W5npSGia/+8Sij4JNrVLJR069n2DoVmtLWtzfFlyomRQ87Huz0zGxRnyso4T06xAhaw2UO5B4uh3n
	E34Niy4QQwbOpIj+NYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnj9-00000002qyF-3SQA;
	Mon, 07 Jul 2025 15:25:55 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnbw-00000002pfK-0trC
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 15:18:29 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-86cfc1b6dcaso109744539f.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751901507; x=1752506307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yx5aXg6P6SNdPzRe+7UpHrkN5msdFi/K5+r1J0CI3l8=;
        b=2mAz1pPKqLFD3DafZD0l0csdVpvTeIUwICYg+XSpQhnjLTupVO0ZWgCk6tJM1pfOiK
         wpvFepGzrJvIxZWdowKycgA41HzolRytgILdk4CX9u58PSJHo//rDpNSRvimodQ0xIXi
         IxtL4Rcto68WtcgPUKoQ1+XKiB/G0O9dYIx3Ny/b7x1CNAAenjib4Ba3c2r4tUjZ61N7
         B7i3R5z9GpwDCVrn9/2L90xNLCFKFQDtSphU2vMJjtN9CZ/lMlOzsuSTwr0O0oRLpc3q
         6uoNf7dGYjgKuR2jS2w5rCAg84W0b2kSv2bPfl0vJ9R2GNME7CAMfj7kEQhJX5YRCjCt
         TS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901507; x=1752506307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yx5aXg6P6SNdPzRe+7UpHrkN5msdFi/K5+r1J0CI3l8=;
        b=xOv9F0if9KCG4KQL+96rh0429dyVeFT8iv9u6PXaw3f77PZl1hsN6DLXjnWQLCg0+E
         LL/XAbijYxBGMFyEbXz1vLSIX+NefEbLI8KhBC1KyewDF5RIPBZflD/cbKiFvS+8PejI
         D13UiDUmgWqsbOaMeS/jtw3YthbTWQeSo/YLND5us9Tm88yqppXp/AvrLNcV9QTHqX+s
         QwY4vU73+TAiKx4zzadFschsZVWHGYKbM1PP/ihlZKXFnh2iIWiGipTzzUPDmzRSEFvJ
         i8DxxPplrHjHBkiDHeuRBUrE+rpLiDl+BHyZe2DKUjRp7PPA0ylhWHNK0ukmwNYF9f7s
         SQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCWR2ufaXCseHZUulYXG/PC03oVb3kdWuHorbW178I3at81fvfTgqbayUQJgxSINDwXB+GRsSrsIa36QKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/hbeuJ/69P8rH3ftJVttTJbQDzFvtXqoYHfv1SEFHR3t102mm
	2yEOU3T887QzPYP1pBFyzQq2iw6PtHHztOsfNnq55hpHewJH8kC03uPISD8bAmaDOXQ=
X-Gm-Gg: ASbGncuFWhW2vjx8FSkutsmsuOg9lg5g6ArfiFf3szHXGJVPGjCUIYldGMRm+3KU3n+
	HdG2+pb8qvrZ9tkvF0NwG6nqiiEDnpH1uN+815bQ0SkMLqFQK4lZpWHJLu+RFDtoVIil/8mHnwG
	d1u+J87Jltf+F2JzhGvWEtn54POjaZSE1Et7n9Ij09IEBrx51jX3Gv9v91NdAI+0nF8lg2E9SW5
	s3IIfez32sa3MyzeOhUDKBhee7eJ96I52Tbzc5Qp4Q3xHsE3sNmT1GIp1EtRkRnAn8peWHI6xMu
	+UDW+8xHRy5AaW1Q4HUMRFPqRpIS7lUuipmvBUO8TGm/wewcmNwTtt1z3piwGDIs0i0tPnrWXuM
	Rc0td09foIP5KifVf4yPjndQh9Q==
X-Google-Smtp-Source: AGHT+IEcpAKi8rMSKDtA341deu1ji4vXPPPi4MsMqdh1gMhGYZ+finPoZ6kUswodqeMPhgepaUG+Cw==
X-Received: by 2002:a05:6602:1606:b0:875:bbf0:8bf with SMTP id ca18e2360f4ac-8794a3ae0bfmr1164439f.5.1751901507273;
        Mon, 07 Jul 2025 08:18:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-876e07ba3fcsm238619539f.12.2025.07.07.08.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 08:18:26 -0700 (PDT)
Message-ID: <7e652d26-ffae-4bce-9952-4061b2799095@riscstar.com>
Date: Mon, 7 Jul 2025 10:18:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
To: Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250612224856.1105924-1-elder@riscstar.com>
 <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
 <20250707142846-GYB408198@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250707142846-GYB408198@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_081828_414489_B576A5EC 
X-CRM114-Status: GOOD (  16.91  )
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

On 7/7/25 9:28 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 07:19 Mon 07 Jul     , Alex Elder wrote:
>> On 6/12/25 5:48 PM, Alex Elder wrote:
>>> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
>>> parent for numerous clocks, including those used by APB and AXI buses.
>>> Guodong Xu discovered that this clock got disabled while responding to
>>> getting -EPROBE_DEFER when requesting a reset controller.
>>>
>>> The needed clock (CLK_DMA, along with its parents) had already been
>>> enabled.  To respond to the probe deferral return, the CLK_DMA clock
>>> was disabled, and this led to parent clocks also reducing their enable
>>> count.  When the enable count for pll1_d8 was decremented it became 0,
>>> which caused it to be disabled.  This led to a system hang.
>>>
>>> Marking that clock critical resolves this by preventing it from being
>>> disabled.
>>>
>>> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
>>> be supplied for a CCU_FACTOR_GATE clock.
>>
>> Is there any reason this bug fix cannot be merged?  It was
>> first posted a month ago, and although there was some initial
>> discussion that led to revisions, this version has been waiting
>> for over three weeks.
>>
> Ok, let me explain..
> 
> I've queued it at for-next but haven't sent out the "Applied" reply email,
> it should be eventually merged for version v6.17 if things goes well..
> 
> the reason that I haven't pushed it hard for fixes branch is that only DMA
> is affected for now, but DMA isn't fully activated in current mainline
> (No DT, No config merged), so I think it's fine if we target for-next..

OK, thanks for the explanation Yixun.  I've been working in the
networking subsystem for a long time and they tend to push bug
fixes out right away (once reviewed).  But you're right, this
particular bug fix does not affect any currently upstream code.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
