Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAA710AB807
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 19:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhinSXvlESOOQLdJeNgwf8TAzfTC4vW1i1bNeL3HVHQ=; b=f3sQ83jt5HUZK7
	66Uss1n6EyatQLNmOYsIefk+zBVMZs4SyI9Oy3emMeoohXXPMhRM51ga3um0jYIs2U3+lCe5SXGIx
	G2QkMcoR2hztqHOUZD4Gd24AC6HXmpH1ij2/O+H65ptRhDYguZubdGAS6cIDq8250Cb36DERVORdx
	Hx/tqYec/Ojk7a0OZFy+ui4hHXnbu0K2ujKUAvIdfbo+mmLqs6642REqEhCBLF4x4midtgGN2XVbP
	5Od1GsorH6eyIFeeDo1Qhs7ZmKoUTqzjOKlq3eAiOGJEB6MHWwRgEsbIE12CIVvx9hAZMI2npZ2EZ
	hp5E3bme+Az1o0GBMAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qMj-000000066xn-2HLP;
	Thu, 26 Mar 2026 19:27:37 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qMg-000000066x6-3aDD
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 19:27:36 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a42d3fb6bso1029431fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 12:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774553252; x=1775158052;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4U37jloRCxGaogcODaSOdFLwJV6DsZwdbebE3/dYeE=;
        b=YE5tsQKZM2idFn4syWUlp221IzXhjFxFf/yPqXfneCwLc8pMgDbHU7Kz7Y++hakFaS
         4jfVu1+Vhu14bZ7mYeP3G3AhwW/uy25Q5OzonDm1M6i4m76lUzImPs4zOhFtWJdNgdXG
         DU/CLf2VmD3loC7NoMV696a2zO0rlXJeXfszdy7UN8ucEprgPtYf0J33NidLsjQbLus3
         mvJjAwwuDempEbrlgqjCZ1W2IZ2as8RDnXY76IzP1g3sisbWmKI4JZfZ6LDq3i41D4Xi
         fBLmAPSRVwk781wuQDDvA1jlrnFn426vBDABxcfmN/OLvsN1z8vkq7142JIjU/iR0a72
         3ehg==
X-Forwarded-Encrypted: i=1; AJvYcCVKgWg9k7HIvkLWIej5K1itmAeeIHbIcjP5KG5tfiKIcTJzdmYzZ9ess8op0dKrvqk0XLzoNNn/o81f2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/gdpuJhXXMKBAwceVz+dhCjfzJq6jyjFT6ArjTjNwj4NXaEF5
	hNUEFaiHMRxPLBC/OrPfxAblD+WFjcEm7zjgKYvh1dALMeR/YVrpsvi/
X-Gm-Gg: ATEYQzye44RyJu+iXAlNj/Wi+HKTVjoXvMHlMf7PxeKuiho5o6L51MYg4yMpfN+61DS
	OBMn17aSkYYikrHSRiw83hhk732QH5VnZev+GQgVWcj5EUwQcKAoqge42pmJ49V5Nk9D2v2t3+Z
	5BzBkVdgY9C0NCTNXVFXl3u00Q6a7AabHpGG8U99y9/DILmlwNP/YKWGfZ9CmL1Db0WGTXnlgys
	oI2oiXmyWD6hcU9TTaKzSAaE6IJ1MaO8LsbQ0M50zau/4u+SuHXJj+1Nf6Aa6dsNsBXyxj1z9zF
	R1OZ0i65wGWXHU3omDP7tETStpQoCnilJmGXiGGX/vPFlEq3i+cowAZMXDV7Qrb0t3eamWi17aw
	EkxeUZAE5ty0yTtdLD0JndU6RQuHBXsu/hjeaJTozOne7fFuXrAvSCJerpoemaR71tk87i50FqS
	6L6ucMjzRdmr4GJrdiFhfUMA3QkN8K6ousMHiZhtzjzwMBrpk=
X-Received: by 2002:a05:6512:3090:b0:5a2:845e:9d9a with SMTP id 2adb3069b0e04-5a29b9a6f5bmr1894370e87.6.1774553251990;
        Thu, 26 Mar 2026 12:27:31 -0700 (PDT)
Received: from localhost ([176.106.245.85])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a06486a7sm791414e87.25.2026.03.26.12.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 12:27:31 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 26 Mar 2026 22:27:28 +0300
Message-Id: <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
From: "Ilya Sorochan" <k0tran@altlinux.org>
To: "E Shattow" <e@freeshell.de>
Cc: <soc@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Hal Feng" <hal.feng@starfivetech.com>,
 "Conor Dooley" <conor@kernel.org>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
X-Mailer: aerc
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
In-Reply-To: <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_122734_930666_E76E3647 
X-CRM114-Status: GOOD (  20.45  )
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

On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
> To be clear the "riscv: dts: starfive: jh7110-common: fix jh7110 SoC
> boot from SD-card." commit does not affect Linux whatsoever, there is no
> problem to boot Linux from SD Card impacted by having or not having this
> commit. This also is not common, so should not be in jh7110-common, as
> more JH-7110 SoC products by-the-numbers have transistor logic replacing
> this signal selection to the StarFive loader in BootROM and so
> precluding this from functioning.

This commit affects U-Boot+Linux ability to boot from SD-card.
Tested on StarFive VisionFive 2 and Pine64 Star64.
I'm not aware if this is the same for other jh7110-based boards, but assumed so.
 
> This ignores the wider discussion about StarFive both deprecating this
> capability (for Secondary Program Loader i.e. U-Boot SPL) of StarFive
> Loader in JH-7110 BootROM loading from SD Card being deprecated
> officially in the latest StarFive JH-7110 Technical Reference Manual and
> StarFive JH-7110 Boot User Guide documentation, and the ongoing GPL
> non-compliance by StarFive for use of GPL 2.0+ code in the JH-7110
> BootROM; the latter being important if we want to accurately attempt to
> support this deprecated feature set as a community (even when ignoring
> for the moment this copyright license non-compliance).
>
> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
> BootROM, and openly invite anyone that would like to help get this
> effort to 100% is welcome to so that we may publish and refer to this
> for technical competence. I do not object to the community supporting
> this deprecated capability if there is any real documentation not based
> on rumors and memes; but no one has offered to do take a moment to do
> this most basic of fact finding. Evidently the StarFive maintainer(s)
> have refused to support this, GPL non-compliance persists and only a
> rough description from Hal has been written to the U-Boot developer mail
> list that does not match my analysis, all while complaining about the
> capability not being supported going forward.

Appreciate the effort!
However I can't see how this is related.

I traced this property a little in the U-Boot repo:
- 503fc8548197 Hal added it to VisionFive v1.3b (with mmc pins)
- 6bbe95ef7208 Hal moved it (and other common things) into
  jh7110-common-u-boot.dtsi
- 27f617019dd0 E removed it with jh7110-common-u-boot.dtsi
- 762f85bb2e36 Tom squash-updated upstream dts

New device trees did not contain this property. This is how they were introduced
into the Linux: b127dbf9e1ebbfbcded4 ("riscv: dts: starfive: Add mmc nodes on
VisionFive 2 board")

I do not know if this miss is intentional or not. However it would be nice to
be able to boot from SD-card again.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
