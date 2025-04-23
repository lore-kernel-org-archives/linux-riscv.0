Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A72C369D7
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmV+1fgamRuoaiWsDQ3z3DOQPoNPJkNUomvZzjS3WVo=; b=Na4lueY4v7jDGm
	5SGJkXZtYgcfez/fJhfPwhZVTYC+qxreWtXrF9AmFwmdPb//oVdGMZYpcpmvjDFxEm97S7DDCUvDG
	mbiSjITXk/1TJAZ7y9HTydhAb+VIB0nYBmNuu+qUfGUfSsJtYX2fq6WuwIkFOqDbvlECBBlLwfiRO
	z6EjTFZCgwy0++6+fCpg48/YMQpct/OfFMJAh0HTMImvaaEVROVpkYyfI0lwrg23NdTe83im13dKp
	Ru2bSLewtVCJXPw71wbP8JPeej4MpqvbcJ138GMNwIX+Ur5AnpfuwitHgdVdObEOa8Oq6cmiJExCi
	e5LSuV7ktTfqr8wChUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8O-0000000BNHB-2YHu;
	Wed, 23 Apr 2025 17:43:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cDe-0000000B04f-1n62
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 15:41:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0A785C5EA7;
	Wed, 23 Apr 2025 15:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB82C4CEE2;
	Wed, 23 Apr 2025 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745422861;
	bh=ERyjr27hGL4DKu520p+lnJcSombmkSYoRmQUhyArPT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lF6z6ujCQiNWGWZ+GJRZCdwDz3m9udIxxNLIwteB6pkVucQDIcVL39LXdrkpgmcHs
	 NU3jd26BpNpHWjXuefwLSLmESkRcL2Lkkdtpg6o12onX6/4/nmuHLYA5IqtsrxFb3y
	 tzbQZRV5G6p9IJyf0c3EIe3y+u8SSKpjDgly2HBmGeanm7Qy7iGLlp2l6iIq63axpW
	 fWiEiieVheQeRkGCgVrVcH3nQ+9TcINtQ7oURNBy3eCle7ciRVvJWpLdYjEMX0b+x4
	 mbIn7BZex1D89baBOlK9kW8V3AldU4yIFz9IppzT9I6v/6R0wR2RO7qANgCsMLnnpL
	 xwiuePUNzpONg==
Date: Wed, 23 Apr 2025 10:40:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: p.zabel@pengutronix.de, hal.feng@starfivetech.com, elder@riscstar.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, spacemit@lists.linux.dev,
	conor+dt@kernel.org, dlan@gentoo.org, inochiama@gmail.com,
	palmer@dabbelt.com, linux-pwm@vger.kernel.org, tglx@linutronix.de,
	linux-kernel@vger.kernel.org, drew@pdp7.com,
	devicetree@vger.kernel.org, geert+renesas@glider.be,
	krzk+dt@kernel.org, heylenay@4d2.org, duje.mihanovic@skole.hr,
	ukleinek@kernel.org, alex@ghiti.fr, unicorn_wang@outlook.com
Subject: Re: [PATCH v2 1/6] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT
 K1 PWM support
Message-ID: <174542285923.570390.16199020429609870497.robh@kernel.org>
References: <20250420070251.378950-1-guodong@riscstar.com>
 <20250420070251.378950-2-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250420070251.378950-2-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_084102_518865_2105F3A6 
X-CRM114-Status: GOOD (  13.32  )
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


On Sun, 20 Apr 2025 15:02:46 +0800, Guodong Xu wrote:
> The SpacemiT K1 SoC reuses the Marvell PXA910-compatible PWM controller
> with one notable difference: the addition of a resets property. To make
> the device tree pass schema validation (make dtbs_check W=3), this patch
> updates the binding to accept spacemit,k1-pwm as a compatible string, when
> used in conjunction with the fallback marvell,pxa910-pwm.
> 
> Support for the optional resets property is also added, as it is required
> by the K1 integration but was not present in the original Marvell bindings.
> 
> Since the PWM reset line may be deasserted during the early bootloader
> stage, making the resets property optional avoids potential
> double-deassertion, which could otherwise cause flickering on displays
> that use PWM for backlight control.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: Accept spacemit,k1-pwm as a compatible string, when used in conjunction
>     with the fallback marvell,pxa910-pwm
> 
> .../bindings/pwm/marvell,pxa-pwm.yaml           | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
