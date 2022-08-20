Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2359C25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAIMjs3FQKvREgS0XAgXTR9E9JaaF4qKrffBInYn/Ls=; b=QvU22zKNhRPEpB0OyOt7ZajYDg
	NauUV0mpCXW0ZFX/qww0yRShEIGlTaXXSCxfYUyG7aObIQy/T0g0O6jVydqiTFM4A5xRFKS3REE4A
	w42aX0WtWoQF2PAgC3WqPA+xXcF2w9AcWNpTh61EuXKKTlPJzrPEiis0gGnzYLvHSamF2onql+tdw
	2HaPBPlj1TMSAc5WnPsTs11mT844DPs9x/67cLEcpUs4O0yal0dhzDHZY27UvJMF2mkrXTUlYAmM0
	EPnO1GaWwFSAG3FIGtLe4ywxZZGgXVTryvJXZ+VA+3BNSy0loVSeAj8cBX6991on3WbZnjAZQ9qXd
	KL+I8mEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPPXm-00Aer7-Eb; Sat, 20 Aug 2022 14:33:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPPXj-00Aeoa-8r
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 14:33:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54C3AB80CDE;
	Sat, 20 Aug 2022 14:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E952AC433D6;
	Sat, 20 Aug 2022 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661006018;
	bh=/7B/Xs/HCL3KwHGK4v8gKrA+qwU9VsmeusLYvJqdSBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pYA1RNwP46Oqkl4EvxCL/VVLLVJ6SXm1Xo9I897g3uyZ+Y2f7a86kcbLRMsYOMlDo
	 1fM9SkM7uvbsSbbCormVLazdZfOfxVnbD3k417++h3CdEbt4h0ptK066T0VFtGQrt7
	 WnzmwPJRzL21+MmBBGNmSApBBiMoMQ1gvJHHjrTU6tQt6jBHhXrvm8F17SUddtPDjH
	 4dBzSYMPrvy/kSHPjgmOSSaV9TJPwFWzp014kIZG4mkU1ZH8bEoz1qkcvzG5Emo6gE
	 XYC62n8OH6f14eywKUEkQWkWh49qSM5ojIJG5K/Cr6aGxcEYQBSGrRAC2fl7QeksFM
	 VUcMtQB3UpaCQ==
Date: Sat, 20 Aug 2022 10:33:36 -0400
From: Sasha Levin <sashal@kernel.org>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	gregkh@linuxfoundation.org, Brice.Goglin@inria.fr,
	sudeep.holla@arm.com, Daire.McNamara@microchip.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.19 08/48] riscv: dts: microchip: Add mpfs'
 topology information
Message-ID: <YwDwwEXgGundXB1X@sashalap>
References: <20220814161943.2394452-1-sashal@kernel.org>
 <20220814161943.2394452-8-sashal@kernel.org>
 <eeee7a72-8200-a374-8038-405605e0c290@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eeee7a72-8200-a374-8038-405605e0c290@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_073343_500581_0DF4C669 
X-CRM114-Status: GOOD (  12.41  )
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

On Sun, Aug 14, 2022 at 04:31:08PM +0000, Conor.Dooley@microchip.com wrote:
>On 14/08/2022 17:19, Sasha Levin wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> [ Upstream commit 88d319c6abaeb37f0e2323275eaf57a8388e0265 ]
>>
>> The mpfs has no cpu-map node, so tools like hwloc cannot correctly
>> parse the topology. Add the node using the existing node labels.
>>
>+CC Greg
>
>Hey Sasha,
>Technically this is an optional property so I didn't mark any of
>the patches as CC: stable as they not really fixes. The plan to is
>to fix the hwloc problem at the source rather than papering over it
>with the dts:
>https://lore.kernel.org/linux-riscv/20220715175155.3567243-1-mail@conchuod.ie/
>
>Those patches are delayed until after -rc1 as they weren't reviewed
>from the riscv side prior to the arm64 tree closing, but the plan is
>to backport those instead.
>
>I suppose there's no harm having these too, but I'll leave that up
>to the better judgement of others... What do you (plural) think?

I'll just drop these. Feel free to send us a note when the fix is
ready...

-- 
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
