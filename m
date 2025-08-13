Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82978CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhrUJM0XzunW5X0919KQv5u37GgWUTlSm3xzOJnmE9w=; b=sTbF7juKXsLd9L
	gIfxIsaMZHmEcdnE/cBTOO7bEqpv5dc/CsiUosKnHZX4Z5R8JPwVr5DelQjkpT/+dFBhj3fSp2irl
	67l5Swduqz1EmFJ5W1i5RLmoj6VgmPnjU3SDENRnNX6UcpCs7NKUM7kkrzD+UzuLLIiRuepZbd3Ke
	2l88uh/wnY7VuH1BZe3xGoTpp1vJc/16sQBLSo2QyhDqIMHqzzhGLv+Il89lUCuaZAsE+5a4NjEjK
	7dW2CYPN6wfrlwxzzs2NK0BW8h1YsHqo46rPqba7xqyZFczwqHBb4V26XLBXSLBRULFprdXLKHH5N
	Hb3djD5LrBs14elRWwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6gn-0000000D4Gw-2RNZ;
	Wed, 13 Aug 2025 08:18:29 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6Tl-0000000D1wD-0AG0
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:05:03 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9EC9422C21;
	Wed, 13 Aug 2025 10:04:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzpl8vKaCdHJ; Wed, 13 Aug 2025 10:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755072295; bh=k2quWAYJN0mrhO2L7Dv5sP0satmZdXbTO0q0ocGDgtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k4ogtrMRjSJ5MfXdfmM5BKOEHMD5g1sbgCnqNumpW8UxbDKtqGIMwc2bx7LVnpas3
	 lAEcXvaOTtGZP4eOXLlSTRdNPuvd6HkZgc4EFJcaE7V5vAPOhGtbzsZVocRlOu39dl
	 CsfzFUbpEm7ny8K6kStxfq8PMLOVC3H7sIG6w+leI+P1cCuhPVCbHNio/Mq0lFSJ3Q
	 On/CBEUQZdPS7GPWgftu+PlPFEUqjh4uoosC15CTZfQP7O8qtLikL5vRyFsNoTpqKR
	 g3CA3+mN1JFVjcS6P0dugxfce8oERJfekAVYqX01bv3DyHn/TDtn0SVyaP6DsNxPgv
	 LVJI+xPSfDtfw==
Date: Wed, 13 Aug 2025 08:04:40 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] reset: thead: Scope TH1520 reset driver to VO subsystem
Message-ID: <aJxGnnwlE1sWarXa@pie>
References: <CGME20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6@eucas1p1.samsung.com>
 <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
 <aJrTq775sXTrsepl@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJrTq775sXTrsepl@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_010501_496085_FB0D194A 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 11, 2025 at 10:39:55PM -0700, Drew Fustini wrote:
> On Sun, Aug 10, 2025 at 11:14:19PM +0200, Michal Wilczynski wrote:
> > The reset controller driver for the TH1520 was using the generic
> > compatible string "thead,th1520-reset". However, the current
> > implementation only manages the resets for the Video Output (VO)
> > subsystem.
> 
> Looking at Section 5.4 on Page 451 of the TH1520 System User Manual [1],
> it does seem like we would ultimately need 6 separate nodes for reset
> controllers:

Yes, this is true. And another six nodes for clock controllers (there's
already one).

>  0xFF_EF01_4000: AP_SUBSYS
>  0xFF_EC02_C000: MISC_SUBSYS
>  0xFF_E404_0000: VI_SUBSYS
>  0xFF_EF52_8000: VO_SUBSYS
>  0xFF_ECC3_0000: VP_SUBSYS
>  0xFF_EF04_0000: DSP_SUBSYS
> 
> Maybe we should take this opportunity to document the bindings for all
> the resets that the REE (e.g. Linux) can control?

It's worth noting that with either mainline U-Boot or vendor U-Boot, no
core is configured to run as REE. IOW, AON_SUBSYS could be accessed by
AP cores as well.

I think introducing read-only clock support to Linux could help us to
correctly describe pvt clocks which are now replaced with a aonsys
placeholder and resolve issues like what is described in 0370395d45ca
("clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED").

Futhermore, there may be downstream projects, e.g. U-Boot, make use of
these TEE-only devices, which could benefit if we have these devices
documented and described in devicetree, too. Thus I think the AON clock
and reset controllers should be documented as well if we're going to
document every reset/clock controller in a batch.

> It seemed like that was overkill for the 2 resets needed for the GPU,
> but, as Krzysztof noted in this thread, problems arise when bindings are
> introduced that are not complete.
> 
> Thanks,
> Drew
> 
> [1] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
