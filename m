Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B382BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 05:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4700960F11
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 05:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4700960F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UmG8mV398Ri6zix8NSg4cW6mzxQ6IH8h2U9FwPXCO7E=; b=hN1nNf8iu222YKUcIO/xQxitHh
	5okJVG+zqrCi1vqruTQm3PUS2Aelw0hc+2zYhpaRZbi3zzmzcLx6UEyWjvt6lyvBwi/DKoxJgzbGO
	QoRp95IIElI1zPH+iKlvuiQO7jngQC54nyPt+w8tEvBO/YIwV6H4QRrc0VFEXdyN8E54BrLs5VjYY
	k/gn9nKT8IP1suatwYSM7jCttv2O4ptQOvUG0sfREizofYhPR4anPggKQqHcmLqxtmi55oRdm7R8h
	v7cB52EXIcQbnSteGLSpsksTl+mRdaP6d6dsKxF6YA9wTu5IsTSFCZeXzsTL4n5nl4dsBk32RvvG0
	Rgf0Qw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ0ns-004Ccq-N4; Tue, 14 Sep 2021 05:16:20 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ0np-004Cc2-2A
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 05:16:18 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D640258056A;
 Tue, 14 Sep 2021 01:16:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 14 Sep 2021 01:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=i
 Fscvg2UAmpuVVdpXjvJG379QTvu2lO6GFxJggs3RVE=; b=I05XragjQlJMB7LRR
 5CizImRNGMqqoIFF8kK/pmXDYPh3Nu+iXAat2zToipMPQQLNmFGc/JNjQuGMbALw
 H/8/f+sPhhxtgqwjaMkpHRNnlfWFKT6C7P88PAfCIWE3Xh9LiX8I/y0WIJMkiGfK
 /K1Ek5IWGPhvKDhTqeqaz/A9OcLk6iODRRytF1x0sLNdGxgQU+TOH2Q8hXSGD6Rj
 rri81ebspvSmStei2FjqNIOMA3+NWMisL0eG3UqihmFcLtJwsBNnK8vjlTF+csuB
 Q0XcIiLvSkuLJq4ESznaeK/3LWVG3aAcY4dsZkTJcibkWSKOWSVaT/Juq7cSK7SB
 NEz7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=iFscvg2UAmpuVVdpXjvJG379QTvu2lO6GFxJggs3R
 VE=; b=W6gik0BPSPSkR6ki9N4KEg7nH4fCeP5Cna/Ow1NeHjRTCULEzNBiUIIpI
 poYDa2jLaTExav3o+BmUqt0L48ulTLkaqJ0gScgxp5zIyldce4KEyNW0uzdyKoJP
 CbukXRVFbY2zJyIj/8Y3xBFBDDtBR2lNizglfzubpoQS8vGJEsxwVuCSN+ER082x
 wKhLiGh6TEoU6EACkYAXuFgkLHQcEbvwZCNEZnckQg5GerCEnd5RJGgcrkf+Qbsx
 l4c/i5ClieyGZy4P8kh/+R2XfzUN745tRpUVInQ+6oizDlgqYxFF7FIy6T0QVEBd
 lZVnaZrHtAKOKWAfdSdhRn9gT3hcg==
X-ME-Sender: <xms:FzBAYcDQGB5pEQsfEXeZFlOYLjuKcfA_yPfCVWqm22AaDnEP9n9UFA>
 <xme:FzBAYeh9E1XYcSyqtnPG_0AgRZ8lHJZ2daOjYO0tCsCFHMRPjeEmQT-jySIx5m9cT
 3ka-DY1OooNP_UBHA>
X-ME-Received: <xmr:FzBAYfljq_Uy6hvHgIcalvmN73bZ4f4ppsnw65CJyEyxM7YmDmBip6zkYLYHohz0tbNU_oNfuVNqB-YHiVTROl2oybiZOOdCGz3dVt6AKYDwoxtypWCPrI16Ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegkedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefheenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepieegffeuieeuleevvdelhefgudefffdufeetiedvffefgeehfeek
 teelffduffeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:FzBAYSyzOvLx2dbyDCNWvUw8Vp5bVMJ5N8N-wpml3sl3uXK4IuTqxg>
 <xmx:FzBAYRSWy3CS9g_MaIhpqO7RD58d87bqs7WKXd15z2N1nxAMgQgkAg>
 <xmx:FzBAYdZ62yJy-LB7pd3afaq9qdqnbnkGzyC9XT4IRROKdDwEB92Z4A>
 <xmx:GzBAYSJRRf7PJ4xlF_gZ698ApS6ESobUVD2_O5Xq6nk_EPgIVAQofw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 01:16:07 -0400 (EDT)
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 guoren@kernel.org, Liu Shaohua <liush@allwinnertech.com>, wefu@redhat.com
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 lazyparser@gmail.com, drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <e46bb02d-961d-672d-76c7-9844d76ee69b@canonical.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
Message-ID: <9cd8db15-7431-dfec-6e48-dcf6b30d4f6c@sholland.org>
Date: Tue, 14 Sep 2021 00:16:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <e46bb02d-961d-672d-76c7-9844d76ee69b@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_221617_221164_A992F01A 
X-CRM114-Status: GOOD (  10.63  )
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

On 9/13/21 10:49 PM, Heinrich Schuchardt wrote:
> Calling a Kconfig menu item "Allwinner SoCs" which includes all
> future Allwinner SoCs irritates me. How about CONFIG_SOC_SUNXI_D1
> instead?

Would you want to have a separate option for each new SoC? That seems
like the only way to split things up, if you want to be more specific
than than "sunxi" (or equivalently "sun20i", which is the codename for
the RISC-V series).

Except at the very beginning (sun4i-sun7i), there have not been clear
generational boundaries between the various sunxi SoCs, so most of the
32-bit ones already get lumped into a single symbol (MACH_SUN8I). And
there is a single Kconfig symbol, ARCH_SUNXI, for all 64-bit Allwinner SoCs.

There is enough overlap in peripherals that you need a common symbol for
the peripheral drivers anyway. How about... ARCH_SUNXI? There are 90+
uses of this symbol throughout drivers/ and sound/, and I have found
that more than half of them apply to the D1 (see e.g. this commit[1] and
some of its ancestors).

RISC-V has so far adopted a CONFIG_SOC_xxx naming scheme, which is
different from arm/arm64's CONFIG_ARCH_xxx pattern. But now we have a
case where a SoC family is split between the two architectures. I'm all
for consistency with the names of other RISC-V platform symbols, but it
seems that reusing the existing ARCH_SUNXI symbol would be better than
cluttering up the driver Kconfig files with a duplicate.

Regards,
Samuel

[1]: https://github.com/smaeul/linux/commit/7841e5c32366

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
