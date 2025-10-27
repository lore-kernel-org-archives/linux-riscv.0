Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C6BCCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mQGIaNqOQtZ+nyXhQG6BwvgRhQYYW1xBP9DLqzQkz0=; b=ZNIxFeK63PGdcJ
	wvONQY1R61iQa4ueHQxaY+Sq37nICup6AkiYLA7gqaL73E6CEF//TcA/2Sgmgw6+5EkdRAisNwogK
	7RgTTripNB9rqfj9s1RlWvcje4iaI3syzqtfokYAaLr39+HM6/sOS1dSCdZ9nSz2p7zwchgZlvtmm
	CVoXA8IJhH/GggmZmInl4ku5sxRCl5z/MPXo+DuTex1G64NhK8y16uCU6xjvbID+kOF0PZxJH1equ
	G00Vw3/kYrcPYas6OoxylkXDyJ17q+vN6oQWmIiAltrklc59xYM82Q7JtVisiztRcZ+YSCR5l3y9k
	IlYcgSPV3koWLcjXH3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKP4-0000000DeVF-3VoY;
	Mon, 27 Oct 2025 10:24:42 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKP1-0000000DeU9-1Jpz
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 10:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=LNaVRs2nb2TCpZYcKwloTHzyssBQhUNg2F8D04En2RM=; b=hZjW6izf5L5wREd13n0lMqkcRE
	H2U7GyJB5y/eTg21mhb7eRy57Npj8PhsoX5y6y/9cKnbeV/edYmpGuCWkVQL8I02ejHV9yC1Hn78I
	WO/nEJIjbAJf+vM/Wy3yFr5KUtqZNX+40RfXh28TgkBGDh9KEUdOFtncOjNXTFsh/DP/nRS8XvTP2
	zdZwGbf4PDmwQP8+6i9+XOhg30PD4oJxYa8O9QJmclDczhHw1yxjGk/9ZYQsFJyqStpnjWTwkw7cm
	IfzZlQdgMyx+5DloRIsJs6xyk40yOcrDt2pU9OvZzjQb5BU12AhGE7koBMqSEjkTB01xRO57vRw8n
	XT9eNOUg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vDKOk-006ms6-1Y;
	Mon, 27 Oct 2025 11:24:22 +0100
Date: Mon, 27 Oct 2025 11:24:21 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <aP9IVckJT-k2_O4K@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_032439_805875_D52BE990 
X-CRM114-Status: GOOD (  12.78  )
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

Hi,

On 2025-10-27 13:48, Troy Mitchell wrote:
> Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> merged, the driver would fail [1] when COMMON_CLK was not selected.
> 
> This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> patch has reverted by maintainer [2]). In addition, the Kconfig for
> P1's two subdevices, regulator and RTC, has been updated to use
> 'depends on MFD_SPACEMIT_P1' instead of 'select'.
> 
> Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
> Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

I think this series misses a patch to add a default value for 
MFD_SPACEMIT_P1. Otherwise it doesn't make sense to define a default 
value for the ones depending on it (RTC_DRV_SPACEMIT_P1, 
REGULATOR_SPACEMIT_P1).

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
