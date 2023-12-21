Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D50C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 21:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ir3zDi020Q1cBCGMxvxgWTG22qJ4c4Uk42McuEaidfo=; b=0Qw/xwtbjDVJXm
	YR25Y94Iwzfx5M5l7uLS50K8Ow7I41SNzgH4Pkb2XLYiDn4BP5HdTMshOcLtQl3ngQvMK7PGQXKOp
	Rz46yiYfDTaco5R7hvM5AnhGJwkG1Sfd7dm2inPcsasicYufsKyslLefpNeJ7Q96mqnaJDhRIriie
	nlp8N2ezZfNMLqrbdOT6VEP815KY7EH89/6b/jqLwKcUC9x4gaR5mmdYekNSCr+0/L6bkLpB/fHeN
	yELBe5AP6EkHlLjA2gPQ40AIe1dPaCMYZsWgQNF2h6hwxv6aBhLNPGuSvm7Vq2UpYZ0or6nHkl8iI
	O0qP3Esj/AupFP9176HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGQC3-0045se-0S;
	Thu, 21 Dec 2023 21:02:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGQC0-0045sE-2a
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 21:02:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 343E0B81FF4;
	Thu, 21 Dec 2023 21:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA92EC433C7;
	Thu, 21 Dec 2023 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703192574;
	bh=Pch3cUPPm9M2grj1J1SCcBO1AYY7StPUOGyR6OF+oHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlyodUzc/Wan56wBQ5rCTP9uWqL+Gs7D/9jGZ840oOnuCGjVJXRQs/pgoIhpNmBuS
	 UBg/IcR4MZN1Jn6+M/+HguLkz9R1f4pZghLUwcdOhfdxNwrsaPLKNDcKCzRqnmyDwd
	 EmuCGEOzYGYvJuBOedtzQtVdjBqpShPcFNO9/rFEpNjiclsNQm+Pp5Twu4vjLRLNOP
	 CdG52mNlz1/pYzQqIdtKXxAHKwq1TkyK5uS+PaoXGaGWdqk/o/axrkNVGwAyKjDifY
	 bTGfba4bnOu53QFmEtceCEH7fkCdDPfK/JTGw4KbGrCBZFccTCNk2oyO2jRrCR7SZq
	 wJgadbNSMB+UA==
Received: (nullmailer pid 88422 invoked by uid 1000);
	Thu, 21 Dec 2023 21:02:51 -0000
Date: Thu, 21 Dec 2023 15:02:51 -0600
From: Rob Herring <robh@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: linux-watchdog@vger.kernel.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, Xingyu Wu <xingyu.wu@starfivetech.com>, Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/2] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Message-ID: <170319257135.88357.1722653226891421278.robh@kernel.org>
References: <20231221084358.3458713-1-jisheng.teoh@starfivetech.com>
 <20231221084358.3458713-2-jisheng.teoh@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221084358.3458713-2-jisheng.teoh@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_130256_985361_D0459724 
X-CRM114-Status: UNSURE (   8.06  )
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


On Thu, 21 Dec 2023 16:43:57 +0800, Ji Sheng Teoh wrote:
> Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> watchdog.
> Since JH8100 watchdog only has 1 reset signal, update binding
> document to support one reset for "starfive,jh8100-wdt" compatible.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> ---
>  .../watchdog/starfive,jh7100-wdt.yaml         | 40 ++++++++++++++-----
>  1 file changed, 31 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
