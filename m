Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F4AEDEBF5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 22:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXm0tedy0WkXX/Lmql+px9IP3wpSNkLBmACpE2huhwc=; b=oDQYpb3L9NrYs8
	q9nSPLfjXEfBHuJa9eS0PE9IF8Ewv/Q8nNofz/qUTIM+ZdYe75yOGhuyjXZrtFsnqGjwBL940lwU1
	ZLQXYzFipT3sDuAYqmxawMNNPOkcqa4TzaCLFiiTQ0HI/K0bXrpdhzOVy7rpYBit73+ySHWB3pjQM
	N+FxEbFaqJKx3h7i2qEIsDgwrfg3ssRL3bUwDjygGPdvrWleYe/3RNAL5UgV3YiD2i1ty3QsHSN8C
	BnZMeOzykvxiwg15YPITvaikeuEY2/c/mMG04bM+yh/f3syd9raeE5tumpESN+k179ZJoo9SjieIr
	wZE06bOu8iaYgu9V7xnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxYDp-0000000G2Hh-09ih;
	Tue, 03 Mar 2026 22:28:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxYDm-0000000G2Gz-1P3a
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 22:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0871A40792;
	Tue,  3 Mar 2026 22:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB3EC116C6;
	Tue,  3 Mar 2026 22:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772576882;
	bh=h+MB5FEoZuD+ObXgiTN2r18cSRl2AQklGvm8fstFmSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2+xQMzVkzxSmK97R5uyX0710fC2BS5mmL0zXKOzhhQhFXaaTyw+uHGX2l8iQ13bo
	 v1Vbr8eGAdaM0qR3yoILry64iGddqsLSZWL0II9nqzE9B/5TcaPgJdddl+lsOrLI8y
	 F2gRvJ5fxbWJ2aS1qeJNfuM6R7vIWTxeeg/LXRSoZC3bMbG+7fWmiPiNH/e/4UtAO2
	 e9YORGzOrk6jQ+e7XoePD5qj/sHE3nmE5p/H/7K8fBneBOlO6v9PmiKkuFpvINwD7r
	 0Yle/A2Ju2NwhRrM2aWa1lVF1KzlXXfhn6Jffr5Q27rCR4fkD/IBTn9Iigqf0jPMmz
	 Nei0CJblySrVA==
Date: Wed, 4 Mar 2026 06:28:00 +0800
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: mmc: spacemit,sdhci: add AIB voltage
 switching registers
Message-ID: <20260303222800-GKC289813@kernel.org>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
 <20260302-crewman-faster-9fd00b62e30c@spud>
 <20260302223803-GKB289813@kernel.org>
 <CABdCQ=Nd9ZW6OBnAiuki=2+DhVraW19bh_m8=LLQGUKN8TkEdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABdCQ=Nd9ZW6OBnAiuki=2+DhVraW19bh_m8=LLQGUKN8TkEdQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_142806_414743_260D8361 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Iker,

On 14:51 Tue 03 Mar     , Iker Pedrosa wrote:
> El lun, 2 mar 2026 a las 23:38, Yixun Lan (<dlan@kernel.org>) escribi=F3:
> =

> Thanks for the pointer! I missed that these had already landed in
> mainline. I'll rebase the series, drop the redundant properties and
> patch [5/10], and send a v2 shortly.
> =

Please wait a little bit longer before sending next version, give me or
other people more time for reviewing, as a quick test, this series will
break emmc driver as tested on bananapi-f3 board, I suspect it's probably
duo to clock related issue, but want to confirm later..

Btw, I was also preparing sd part driver, mainly target K3 SoC, but since
they are mostly same IP, the driver can be shared..

-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
