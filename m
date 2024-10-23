Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE7CDDE67
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sg3SzqLjLR1gZzae791bw5s+2h5DJGlm48R/ByX31eM=; b=yVjBt/ZorNZti+
	jPzVr2NDtcTmdh4+7Zhhm7T8/YLbYr/AUKX7XJiqib3Kx+RlgRDtkIb3OzqM6UeqEkDhSMZyOsMzB
	6HaG06PDSvOX4KdjvW9XJTUx6nH0ImlEwqu8owpQEm4a5UJr5+bM16ET25eWeZAKgLg+La79e1dyq
	qQoVDtPFRnwNA7uWVf7xddTlcPQ8PfmDSQGrac4LFRnz3gE9foRWamh927/9+juJWu8uF6Z+cv6p/
	gSmWAzqfEjlFTb2io8lC+95UzRpTbIHrfs1i9gzIonv+w5z70kjcRD5CqRrJJrbwlSIci0EUqp2Wm
	EKCeO3H8HC0U9yqKFTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Z0D-0000000E3Sh-4AaO;
	Wed, 23 Oct 2024 10:54:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Yd8-0000000DzsY-0ksM
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 10:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17CA4A44925;
	Wed, 23 Oct 2024 10:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33056C4CEC6;
	Wed, 23 Oct 2024 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729679416;
	bh=1yMvsbqKKxCmPBDkUMt3vUIL8R4RjnBl2vB8/PDwUCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pEzpmZy1WbauAFljLYu5X2oUuavpPzogfbG3dvJHq0uRYEpUy5HPRo4Vyr3ZZVT59
	 Dpmgxb0X8TpTPJcxQqbmpChIdwace8Zxaqe9T/5BocCVCz6EbbRFgyTpQ6eNb7sQPV
	 UJhZoOOW/eNy0BB31qEtbSJ/kzdyUMNhHwF3Iqb24Xu0gdyc4Sx0TjWQH7yFtNYanC
	 Km8POoGWxxaFPqQM342sVLn5reVMpoowxkv2VJK/vSQa6jyvCYmVJZ+gvXXA4WoeWG
	 TfpbrlahDd5K1bxKh8K9fSYwMO8H9z+9tEzBBINPqs75DhUHUpvneD/2H4GGur096c
	 7tMHv33au6qxQ==
From: Conor Dooley <conor@kernel.org>
To: Henry Bell <dmoo_dv@protonmail.com>,
	E Shattow <e@freeshell.de>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: Update ethernet phy0 delay parameter values for Star64
Date: Wed, 23 Oct 2024 11:30:03 +0100
Message-ID: <20241023-guts-versus-1a2bcfdfbec2@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022061004.62812-1-e@freeshell.de>
References: <20241022061004.62812-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+Ekbc+eRHl5mRs0Lm29hCW/ghDBTMs/HMot0ehs2yl0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkSF7QL0ree2ZbMXZQlMCXr76OrQdvPHms5pi8w05kn1 rn2Y9iyjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkRw8jwzHbSR0bzPOnlKkv OVUq98LQgVHDZdnJL+fNwyYnhosaZDD8M3rfJsfbvHmzt57gc/bPn0I4xWaW3Diw78tsza7aDKl SPgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_033018_366213_AF3AA6E3 
X-CRM114-Status: UNSURE (   5.65  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 21 Oct 2024 23:09:51 -0700, E Shattow wrote:
> Improve function of Star64 bottom network port phy0 with updated delay values.
> Initial upstream patches supporting Star64 use the same vendor board support
> package parameters known to result in an unreliable bottom network port.
> 
> Success acquiring DHCP lease and no dropped packets to ping LAN address:
> rx  900: tx 1500 1650 1800 1950
> rx  750: tx      1650 1800 1950
> rx  600: tx           1800 1950
> rx 1050: tx      1650 1800 1950
> rx 1200: tx 1500 1650 1800 1950
> rx 1350: tx 1500 1650 1800 1950
> rx 1500: tx 1500 1650 1800 1950
> rx 1650: tx 1500 1650 1800 1950
> rx 1800: tx 1500 1650 1800 1950
> rx 1900: tx                1950
> rx 1950: tx                1950
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] riscv: dts: starfive: Update ethernet phy0 delay parameter values for Star64
      https://git.kernel.org/conor/c/825bb69228c8

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
