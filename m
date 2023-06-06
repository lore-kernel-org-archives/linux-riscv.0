Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69AC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGRThQ5e0bILBY0MfjH7DVbGXVTg/uRagsVQa6QtdEs=; b=T3ojhSy0JEwRGv
	kElOqBrNYu4B1lPwN3HGWET/rjall5HGecj8RkR/rEvb4j3lPXRokrQkjvRyIrDmh/I4ne3r5O8pu
	v4Cj41nYeZPI19+Wyfkvfa8sM+McyMUrYNXmIgcjf9GtjIWZMP5fQy0XQ3uY2IShxUxvpCJapXWP0
	H8XNJEGEEiWBdTWhTWF+SoejL5614ziwcikcw89ScRrykTS8XkUKHit3v/B+src11Wl8qLsoYj0ng
	apEMMFc/EDLs6aufOyJGE6omKeHyWxyfvNdKjfD1vy3We5WacHz59qAZzv5f6hXr5S9hbSzheIO70
	1Ws2kznGnGay4YvE7FgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SKA-000rPq-0q;
	Tue, 06 Jun 2023 08:45:54 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RLt-000cQ4-0o
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 07:43:51 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 1A32E5C01E9;
	Tue,  6 Jun 2023 03:43:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 06 Jun 2023 03:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686037416; x=1686123816; bh=Xb
	C9/ZJsyIVmFJp4mGLTr8jvjCdL2TCK3DQawloAt4U=; b=l/AeFc8cnima6oFCpY
	aTyO/Qw//gP2sp7798e6WT+nQqwl2hVaQoxpqeJK8dfpjGaRJQDEHEgCAHulsl3Z
	zurlYPSqa8nO67JRO3bDttgaWpBTan9RLR1M/ezlrzrgvsjqc4SoIn1heCiMFZWL
	GcSnnMd44J02UMx0H+ImIrk1r3BDeB6eDsY7zmjVFL74n6M/rF2X3F4KYgrsqsOR
	kyF6ZbO3yG84T8tIdCEPfJ74R/V5RBQm0fQE9vm8EHvEdCyFz7hgs1p5F/UHPpZh
	AS9ZObaecw7mcs0aPij31+q+0FbpQ+UroSaLpKmSmcn6dcOsDJ+PYdPtHsK4gjdY
	WUhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686037416; x=1686123816; bh=XbC9/ZJsyIVmF
	Jp4mGLTr8jvjCdL2TCK3DQawloAt4U=; b=aMSMJng5E85P/3QnS0KURaeEEFCFu
	Ohi1LRcfthTAXYU2kKgiF1uUkLUH1q7+vLzIgcqnDjt4ddJ4LzdZqabxCWUD/AiT
	HELNUYrMZuox3rP779Al1ynm0VRPnm2TZ4D2lm38qWszH9aLtsKlYz1GbmpmemMs
	+rOX2p9QQsJAgLD2Di3/zUvm0S29LhuMOhhhIRzS8BCn6n1bC6DdqONUZQYHPMgS
	gzKDUGNHmvsXExgY7LF7q6QCTAEU9i+TaibGtDeqp1LAj4BT6paTjKlMZwgakjm8
	FZmPjqH+wRRJc/T4bf8EGXqNMIZmzADQFHaqiP4nycv3Yjn+gQ7FtI+5A==
X-ME-Sender: <xms:p-N-ZJugtFdtRiuKtI3ValUKAbguK-s-IgrHMGT1R3CfCM4dH5n9lA>
    <xme:p-N-ZCfADWH3BlB_8LhKXTImzG_5xQ8NpYk2pa4pXjHmPQUUKI_3ynTN0_vlEX2vL
    1xaglzg_QvLSac5ya8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedttddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:p-N-ZMwy0prrz-AL-tx_9FEGK6xtqM9qzxodLRFIupOrCzsTMReKPg>
    <xmx:p-N-ZANVFsa_gGvZJ5OifJqu44cF0xAnlMCC5d670gJX1_Y7hZiEnQ>
    <xmx:p-N-ZJ-o6pz_tOd6IgKIhpIWBC_-8xfimrdCjaoacGl3XCNxGlAeBA>
    <xmx:qON-ZEYDrkZDzz1HzvOh013I0H8XfARvcDa5-kybIAuzzHzK50vRfQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D196BB60086; Tue,  6 Jun 2023 03:43:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <d1c83340-af4c-4780-a101-b9d22b47379c@app.fastmail.com>
In-Reply-To: <ca162c288c3eeda309c33049711b5272eb80f8e2.1685780412.git.falcon@tinylab.org>
References: <cover.1685780412.git.falcon@tinylab.org>
 <ca162c288c3eeda309c33049711b5272eb80f8e2.1685780412.git.falcon@tinylab.org>
Date: Tue, 06 Jun 2023 09:43:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, "Willy Tarreau" <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Subject: Re: [PATCH v3 3/3] selftests/nolibc: riscv: customize makefile for rv32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_004337_372751_E4651C42 
X-CRM114-Status: GOOD (  16.66  )
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

On Sat, Jun 3, 2023, at 11:05, Zhangjin Wu wrote:
> Both riscv64 and riscv32 have:
>
> * the same ARCH value, it is riscv
> * the same arch/riscv source code tree
>
> The only differences are:
>
> * riscv64 uses defconfig, riscv32 uses rv32_defconfig
> * riscv64 uses qemu-system-riscv64, riscv32 uses qemu-system-riscv32
> * riscv32 has different compiler options (-march= and -mabi=)
>
> So, riscv32 can share most of the settings with riscv64, there is no
> need to add it as a whole new architecture but just need a flag to
> record and reflect the difference.
>
> The 32bit mips and loongarch may be able to use the same method, so,
> let's use a meaningful flag: CONFIG_32BIT. If required in the future,
> this flag can also be automatically loaded from
> include/config/auto.conf.

If we use a CONFIG_* symbol, I think it should be the other way
round, for consistency with the kernel, which uses CONFIG_64BIT
on all architectures, but only uses CONFIG_32BIT on mips, loongarch
powerpc and riscv.


>  # kernel image names by architecture
>  IMAGE_i386       = arch/x86/boot/bzImage
>  IMAGE_x86_64     = arch/x86/boot/bzImage
> @@ -34,7 +40,7 @@ DEFCONFIG_x86        = defconfig
>  DEFCONFIG_arm64      = defconfig
>  DEFCONFIG_arm        = multi_v7_defconfig
>  DEFCONFIG_mips       = malta_defconfig
> -DEFCONFIG_riscv      = defconfig
> +DEFCONFIG_riscv      = $(if $(CONFIG_32BIT),rv32_defconfig,defconfig)
>  DEFCONFIG_s390       = defconfig
>  DEFCONFIG_loongarch  = defconfig
>  DEFCONFIG            = $(DEFCONFIG_$(ARCH))

This feels slightly odd, as we otherwise have a fixed defconfig
per target, so doing

DEFCONFIG_riscv      = defconfig
DEFCONFIG_riscv64    = defconfig
DEFCONFIG_riscv32    = rv32_defconfig

would seem more consistent with how x86 is handled, and would
probably be more easily extensible if we want to also make
this work with other sub-targets like mipseb, armv5 or ppc32
in the future.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
