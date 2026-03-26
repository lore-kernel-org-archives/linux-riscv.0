Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E7410A88DF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3z5Ub05fJ15jXJUkBUAZBSuMUlfTYsiEqJI366DtRdg=; b=hWyAmu3n1ctszt
	ZmEeBenWGP2UEzbiRyJbAUyQINGXUNhl/gt3Txz7eHeMPryZ+WOLlczmpNadAHT8HGbjUdlBrUooM
	3LHUd4jUFjFdHHPv4pSDqcCgpqifWTFROHGXSWdCT7GP4QrQLJ6GUBNHlaX2FIMDuzNVdtOSWUtPb
	YOzV51bNKpzXr/MXDAk8jT5ZEC9hheKQS6fSPFNzvTmhiGJ1hJ/y0t/pS96/UTf4i7+ZMrAB5XJ+n
	W3Fi3zMD5xDogd/EdanmDWNb8E+xgUDXT39G3yH4VoVSdXQXEN0uOywkTbz/nw/Vw36CTBsTkYJUF
	yc6poWAPsAv82AiUtUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5msy-00000005n06-0IsW;
	Thu, 26 Mar 2026 15:44:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mst-00000005mze-0p0Y
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 15:44:38 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EDDCD3F624
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1774539870;
	bh=v1SUD2/RxGmhieWQs46q6VAPxE1rsiRhxrRLY8jePYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=FuvU/xiuCbXNzdaE/zBNlbv+CuTkcdWaqgLquD68eiWxehsseBurqZnMprxivPaz0
	 46GmImzc4BUZ+qG2KtcJXYjkKcIuDvotEDt+qJ5BAUr5NILVakiGj9+ZQOGIzi3GRe
	 lUKNSea8u850FHDEafJn9j5/iDNNs+n+93EEx9EliLvLaUS+6JBYGW6bDlYLUR/XNT
	 9de8Wf6YauyzTRxgCZ1/DaYQVTOctrJCFXlCac9I3ORH3eYe8nXmPwa28ka4v6Bcer
	 vEoXD3JEbEgmOK9g+O3Vf92KUfqUbi5S7fyqxHQb7clsfdqUUAP4KQrWiXcacZALYr
	 dgwf7x+YNh6xyFowPGgjAC4CxtKUnqnZ+sKXqK8BDjYg63vMNq7SJybdnTwX91B42C
	 wCbSvRQ5LIce8Nw3Gqe6Q5t0zGP49PrkWeOM+Kf6nYMwd2VFisc0sGhF+4mkRUkUKJ
	 CKRRfAth0BtCuUy0xaE7AVETcO+2YRGoFG8V/fjKs9x0ybB5QWNhegcrErldZALdxF
	 eVZETAUZWo4U0K9B+41ZzPdnp7kBX/sW4aRODjWQDc3ysy5gLQOL6nGBc7VLYoOGLD
	 Oo1dZXPr+NKvf0uYgqnLnnZS44bWkoMVJQX5NVs1xHYgaxc1jenP7iHEuFj+eR8/yp
	 exbo17wSzcOW1IgBOq2Uxhzw=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43b86de58d9so938046f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 08:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539870; x=1775144670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1SUD2/RxGmhieWQs46q6VAPxE1rsiRhxrRLY8jePYc=;
        b=MJqI89upE5tJ8jKipoPyzeDsIudroHvRfLXFdXf26/rHFtG+p//C0x3W+HW7ul+jIf
         OYxt8WsB90BF01J9yrH1I3z9p37rtOT2WISY1mG4JVpC6udfOgfIe3WbLetiruSO6jh7
         IZMrX5InJXlh1RQmernOoR5g1IJbYVVcXjqqdL7dpOJXPhVTOXf8CLW2RxeMmT9DHy9Q
         75R4bMEqYw9SJJtMoexWg5rE88SFM3Ypk7TIAuF8lXuMjHdQga9fOHyFx8//hFfI7Gs6
         +A219Sz4S6TIV4VPdEJDw5CagsENsI0ZAY+a67ayQo2ACuYZGZ6PrdqHXTVIVZw+u5x0
         rx2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfz/ffHUq9cDVqYDEQauZGDvz+ZGHizEBa7pSL4PDF1XJuUPfHDAnozxnKU1HwJKw0HqvQivzofzwUfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfA9PcTcGMqFU22EsfZ2nwy0QwkmpGL5WtC5U5Wlc2Qnn3vXI3
	Q/JD33K7t0pEGFH70faunkv/TP1V2Pj0Kyxi1P7nlhtm/yAZH3ZrbZFI7U0lLgOg2jMUNtjHw1C
	I9u8wewhyOFvbS5v+qX6CjIJLK/pAY9PoIH5tZTlivBz203RR1pZy3EKBi32LVZ3QeTL/7p2/dO
	yPGnMXurne9Q==
X-Gm-Gg: ATEYQzyPTh/gQEFIR5+Slkyh1rZpzjNODG3cY4BdU3YjhoG6XOjlydclGdFu4b3x//c
	bPfUARM8Ok9FHHIjaV3vy6QzWArBpwwtIvfdLOpVgdnhg2eB1/NOlFEZR1b026xmbXft2RyK2cc
	SSwObHwccdJw/NWQhdJpLxVHnzfkuDiquJwiby8obHQfCPBzPIxKC5cJcxbexaN6XUUr5VqgqHs
	NhfN11As2nhtacNJLXQ3/LSWJZSGj8J+6/yv6O7AlmL3pLm8EpXZVdR7Xyzkqnl9IAJTfwCEoVU
	U0HWgeJGtTUV2SkzpeN7zJpBLesMgkng8PmYDp02sacDSde7MpEHEy28/LfFGL6ONNu+WravUVB
	+4+DlQXUIEPZyDoWzq8mLs3Lk/TekWGL/FoDeXwX0ubU21/JOOgiSN1/mwVzJQeERkp7i6ZGRGs
	R+6gBFm/KYXcsTXiOFW9VDe1WDH4+xyIsmfFpUq2iEfyG/L91nrwQ=
X-Received: by 2002:a05:6000:2dca:b0:43b:4312:2ca9 with SMTP id ffacd0b85a97d-43b8899932emr13350517f8f.6.1774539870408;
        Thu, 26 Mar 2026 08:44:30 -0700 (PDT)
X-Received: by 2002:a05:6000:2dca:b0:43b:4312:2ca9 with SMTP id ffacd0b85a97d-43b8899932emr13350459f8f.6.1774539869831;
        Thu, 26 Mar 2026 08:44:29 -0700 (PDT)
Received: from [192.168.103.137] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm8746077f8f.17.2026.03.26.08.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:44:29 -0700 (PDT)
Message-ID: <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
Date: Thu, 26 Mar 2026 16:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: E Shattow <e@freeshell.de>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Ilya Sorochan <k0tran@altlinux.org>, Conor Dooley <conor@kernel.org>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20260326-viscous-rigor-4beb18f77eec@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084436_607515_45CDAC93 
X-CRM114-Status: GOOD (  34.56  )
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

On 3/26/26 16:14, Conor Dooley wrote:
> On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
>> On 3/26/26 04:13, Conor Dooley wrote:
>>> Hey folks,
>>>
>>> Please pull a small fixes PR.
>>>
>>> Cheers,
>>> Conor.
>>>
>>> The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:
>>>
>>>    cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v7.0-rc6
>>>
>>> for you to fetch changes up to 305f2865bd034146b2eebc77c27fc50d8d79778d:
>>>
>>>    riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card. (2026-03-19 16:00:13 +0000)
>>>
>>> ----------------------------------------------------------------
>>> RISC-V devicetrees fixes for v7.0-rc6
>>>
>>> Starfive:
>>> Two fixes for the SD cards on the Mars CM Lite.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> ----------------------------------------------------------------
>>> Heinrich Schuchardt (1):
>>>        riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
>>>
>>> Ilya Sorochan (1):
>>>        riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
>>>
>>>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi           | 1 +
>>>   arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-
> 
>> To be clear the "riscv: dts: starfive: jh7110-common: fix jh7110 SoC
>> boot from SD-card." commit does not affect Linux whatsoever, there is no
>> problem to boot Linux from SD Card impacted by having or not having this
>> commit. This also is not common, so should not be in jh7110-common, as
>> more JH-7110 SoC products by-the-numbers have transistor logic replacing
>> this signal selection to the StarFive loader in BootROM and so
>> precluding this from functioning.
> 
> All the patch does is tell bootloaders what stage of the boot they
> should should pay attention to the node, and the link was to a big
> mechanical deletion, with a reasonable comment from someone that
> has a track record.
> 
>> This ignores the wider discussion about StarFive both deprecating this
>> capability (for Secondary Program Loader i.e. U-Boot SPL) of StarFive
>> Loader in JH-7110 BootROM loading from SD Card being deprecated
>> officially in the latest StarFive JH-7110 Technical Reference Manual and
>> StarFive JH-7110 Boot User Guide documentation, and the ongoing GPL
>> non-compliance by StarFive for use of GPL 2.0+ code in the JH-7110
>> BootROM; the latter being important if we want to accurately attempt to
>> support this deprecated feature set as a community (even when ignoring
>> for the moment this copyright license non-compliance).
> 
> I'm sorry, but I have only a passing familiarity with your work there
> (as in, I have seen you talk about it on IRC and paid no attention), and
> there's no way I would have associated it with this change.
> I definitely was not ignoring a wider conversation by merging this
> patch, I was not aware this was controversial at all!
> 
>> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
>> BootROM, and openly invite anyone that would like to help get this
>> effort to 100% is welcome to so that we may publish and refer to this
>> for technical competence. I do not object to the community supporting
>> this deprecated capability if there is any real documentation not based
>> on rumors and memes; but no one has offered to do take a moment to do
>> this most basic of fact finding. Evidently the StarFive maintainer(s)
>> have refused to support this, GPL non-compliance persists and only a
>> rough description from Hal has been written to the U-Boot developer mail
>> list that does not match my analysis, all while complaining about the
>> capability not being supported going forward.
>>
>> I object to this PR it is NAK from me on the basis of stuffing this in
>> sideways without technical justification or review. Also I do object to

Concerning technical justification it is clear:

Distro images have been supplied with U-Boot on SD-card for years and 
the recent work in Linux and U-Boot broke booting them. This needs to be 
fixed.

> 
> The technical justification seemed to me to be multiple people saying "we
> need this added so that u-boot can use the sd-card". The patch has been
> on the list for over three weeks at this point, so there was definitely
> opportunity to comment on it. I don't think I have been unreasonable
> here. If current U-Boot needs it, then I'd still like to have it merged.
> If you work pulls through and this becomes no-longer required, then I'd
> be happy to take it back out again.
> 
>> "riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
>> wrong way around, it does not describe the hardware; if some external
>> carrier boards cannot deal with the capability of the Mars CM
>> system-on-module having card detect line then that should be dealt with
>> as a dtbo per-carrier board and not be replaced in the dts by a
>> broken-cd, although at least we had this discussion and Conor made a
>> decision with all the facts and discussion available.
>>

As my patch points out the CD line is broken because it does not conform 
to the standard established by Raspberry.

E. we know that by chance you have found a base board that ignores the 
standard.

Your patch 4cce8b2503ab5 made my standard compliant baseboard unusable. 
My patch in the pull request does not stop your board from booting but 
re-enables mine.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
