Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58322C25B7E
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBnCv21CSKG4Hj0r7qxNvxBM9ebgzD5R59IKeaKf2X4=; b=3p58uCvkUbXkUy
	FIvCmsz5XuBiU8SAQ7Z0hyjTlUxRk8BSzLjT7kWPxep2yrqL4QJ313EpgmDSxMy1DLduZl7RU96Zz
	eSb/h/XhY5ucGfMFJSpPPWc2HA1pvaTRB+TUogY38PklN3ZUgCzu5UGuU269UA7m1aRvFZ+Rq2mYs
	CAyLmyCqXr/yP060faBPZ3KXeG1CxlmBxKk0FijfQ/eiFJFYckTNM9qH4VEl2kEHoV5o2q15vRJpD
	EnFlEhD2NoeRnciDDjl4BAqor0cWvFEll0j85UzMtfSRTtMnimki90mStyfFU1mUxGWCGXu0F+CMI
	sN/bBgKcsRaDpYOW4Rig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBytd-00000001Gey-0eRn;
	Tue, 28 May 2024 15:37:53 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByta-00000001Gcz-23SV
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:37:52 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Vpc8Z2Tqjz1qsP0;
	Tue, 28 May 2024 17:37:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4Vpc8Z0lYHz1qqlY;
	Tue, 28 May 2024 17:37:34 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id Hg5p6M9piD87; Tue, 28 May 2024 17:37:33 +0200 (CEST)
X-Auth-Info: HpTRMRkMphHhCoLp09Dcf9TUvqKPwejy3RutzhJcbFthbpKdAzzewlMWKt91fpbJ
Received: from igel.home (aftr-82-135-83-75.dynamic.mnet-online.de [82.135.83.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 28 May 2024 17:37:33 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id E856D2C0F8D; Tue, 28 May 2024 17:37:32 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
  devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Emil Renner Berthing <kernel@esmil.dk>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100
 boards
In-Reply-To: <20240528-outpost-subduing-2e84f77427a4@spud> (Conor Dooley's
	message of "Tue, 28 May 2024 12:30:46 +0100")
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
	<87wmo2nmee.fsf@linux-m68k.org>
	<CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
	<87zfsy102h.fsf@igel.home>
	<20240528-outpost-subduing-2e84f77427a4@spud>
X-Yow: ..  I want to perform cranial activities with Tuesday Weld!!
Date: Tue, 28 May 2024 17:37:32 +0200
Message-ID: <87ttii54n7.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_083750_699435_20492451 
X-CRM114-Status: UNSURE (   7.75  )
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

On Mai 28 2024, Conor Dooley wrote:

> Looking at things to apply post -rc1, are you still looking into this
> issue?

I don't know what to look for.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
