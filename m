Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EDBC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bt2FHhOURnmdFWqzO2yqNcHTKLcoirDYQn/2sJHko+Q=; b=tuo3ZEbCEWh7Ac
	owwI8YNet8L6SMZuUYIw3n6WYC4yPOC/vXy4lhcoIYpxqpz9le7YR5uk/bZJbmcf8OOAlxRM7KIht
	tFKdsQZOFzM1cWQSWbt/Nay+HvjCiudqSbzftNl/8dxsgjRMuPiHmHXq4Tb6VmTwkMQr+xHxMkOOV
	C13Bt/sOJZEFLZCk6OVXzRmSO3rf68E4/2Y1LPEyPdB2ZyeB1cL8iY6tj+19TlPbSdKgoiyO6pNE/
	QhHPx8h60fnleLAEJCQ6+MdSWQq2Ev7+bNbxDRn6ORGvqLsh5lRi0eTWE8bvVjMR+qdmgDm8rjv7N
	LFv3LlEFrJspyluIsEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwz9E-0000000Eujm-0A3Z;
	Wed, 17 Apr 2024 06:52:00 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwz99-0000000EuiB-1yBz
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 06:51:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6639560008;
	Wed, 17 Apr 2024 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713336710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnAkFwabSvQqJ5fy96uCIw7AemYXTiam1ydoNeKcxcg=;
	b=fgwdHmYU2Un1HbJPA78aRJGNUGreJ9Uq03yVEK3sNgS24BRwznN0Cr0GBg/8zTv6CgSIE4
	Pb58xOKXGMkeXlH1vCCD5u6z3r1nKtNnwg6qSyBcRwrljnZ5VzzpmvW2EQJ7F6JpiaOqg/
	n6hNl2ZhMRMPUVboSZtObUhg07MTM/WUy2tHqGJ6mb5hwqobqLP2Z75gBfycnLPa0vsES3
	RVD9NyFjmrGszIANPMr6Z1fc8CEbOdvo5HoEnWwo+4sbM+Rp6ZOrcLS2ZgfFgwCssjxGU+
	FdCJy38ulcX8Yrkcii+StgesUL/Av8M6+dhFMAUq3XXXrOQ0l8opLRphWEpSZA==
Message-ID: <46721dfb-904f-4f66-93f1-e12cb912fd2b@bootlin.com>
Date: Wed, 17 Apr 2024 08:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] riscv: dts: sophgo: add initial Milk-V Duo S board
 support
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>
References: <20240417064626.3880187-1-michael.opdenacker@bootlin.com>
 <20240417064626.3880187-3-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240417064626.3880187-3-michael.opdenacker@bootlin.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_235155_689205_B806B0D1 
X-CRM114-Status: UNSURE (   6.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 4/17/24 at 08:46, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> This adds initial support for the Milk-V Duo S board
> (https://milkv.io/duo-s), enabling the serial port and
> SD card support, allowing to boot Linux to the command line.


Oops, this description is incorrect. The submitted DTS doesn't support MMC.
Sending an update. Apologies for the noise.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
