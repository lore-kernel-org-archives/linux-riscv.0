Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C0C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 05:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OB03G2tT4+O/IMVqbmyiH3SS1E8LO2ihWsqA+JdBB+o=; b=Sin6o7dwrYT+ZN
	2WEoj+qtjaQvgPDlp0WaMf64OQ+wS1bOawnDkYAS8oA904dJELJwcz7Sp4DWRvrNqNRguRmT/Xs7d
	pGPBj5FnAWeasuMWQYmyJtFrD8gNtokXmj1Oe78ZXesmtaC80CFqd4BgNJFD6JrhzEy6eRC5ukWup
	tnkrdroag0xaxT1+8LlOgPJN0Em9NF1vnuoFoVaYirbCMxWf7f22o5vIDKA9Bz6EfSnty4QdUW4v9
	ZnUk4qnDEjUc3wbQ8WeyU7FT6Gx6P/k9MDUMnSbWp2ODOqyfsEZjqW+UIsLC0FNGYh9+uP8gbfBuD
	muKUZn6yeWMxdCoTkR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwyZj-007qN4-0L;
	Thu, 11 May 2023 05:10:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwyZh-007qMJ-0M
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 05:10:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8645563442;
	Thu, 11 May 2023 05:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA92C433D2;
	Thu, 11 May 2023 05:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683781843;
	bh=iFUpQ4D07YSZNO0RTuCRy1luLl+VzUEaBiyc3WJiu8c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=UE1segLWGdZbdEoQ77McrCIOz+FbLlRdwBaCxQsiLp1itu+lnIlvUf5VtI77lCHJH
	 UZIG/AMgKf+Mtt7cGCwyIddO8DVWEZL6Mb6UCzo5n8QRNgpW42hKNKPmMpPMgNo09d
	 Sf8UNSMDpYocIjWpWS/nUWnqa37xWTlUKMPDqEf3eEQ/8CzS454nCsE5SVacdf5XTt
	 StKTJyYJI8Zjf/giCk01Z4zfiHAxTrpGRf2ja174uFeXSq2N7Z7r25cCKoRUFTxf/j
	 rDaAu8kquFwDB5pugszTWO5t7y9KnOxA96dK6ycKIm8yJ1Q0nWdk+WhWEx/W09ggdp
	 GmdWVFzf+fNow==
Date: Thu, 11 May 2023 06:10:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
User-Agent: K-9 Mail for Android
In-Reply-To: <ef13177a-2028-9fc9-628a-e3d287758207@starfivetech.com>
References: <20230506090116.9206-1-walker.chen@starfivetech.com> <20230506090116.9206-4-walker.chen@starfivetech.com> <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com> <20230509-overheat-pliable-00d60523637e@spud> <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com> <f27b7ee7-f23a-35a2-3b82-71f50871dfcc@starfivetech.com> <20230510-riveter-ridden-3f056251e623@spud> <ef13177a-2028-9fc9-628a-e3d287758207@starfivetech.com>
Message-ID: <CE38599D-24DF-4FD4-8CDF-F1A70673B972@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_221045_215105_4416C9AB 
X-CRM114-Status: UNSURE (   9.16  )
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




>I'm trying to understand what you mean. so the conclusion is that I need to drop the file
> 'jh7110-starfive-visionfive-2-wm8960.dtso' from this patch.
>When I submit the next version, just keep the TDM node and the pins configuration for TDM in patch [3/3],
>need to drop the wm8960 stuff.
>Right ?

Yes.

>
>Best regards,
>Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
