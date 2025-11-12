Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B88CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 06:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGuROsqzX8z24jpxvJKRUCU7S4Dm+4smY+tmon2NOiY=; b=bVY4ME7XqPUqO+
	agg1NXN3C2qhaTWvp9WgiYDcrIYiq3VVGZZT6V1YPLIgJexK00jP9KCVhASUToNqaMmhF6QIeF3dC
	QzYv2Jhfxz7ztyEI2E91ytWEA9c8mKXoyar1nB+mIAO/3DDUx+Dh+cOoUtTWcXVI/iCKKWCuLDaZH
	SanT4hUOuo0Fe+4BnwMdTAYepFQKRroulWRlXSdVEUjWpY1UZazUeuazPHsL/dixnyUnv9nzdCV2I
	uNFVLd2j8+ywx0BqvaMQ22AldaTwNpWuJ558138M4fqqbgcHan9FzEkFsrIa4GMEoIl/1wpl3+JMi
	g99dW6cNa5l4GexP6bDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ498-00000008BYV-3nki;
	Wed, 12 Nov 2025 06:15:58 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ494-00000008BXu-40j3
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 06:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762928090;
	bh=T8n6eKWtt9uTv/6xGBgqlzn+awiCOgVLvVexDCR5CIA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=BGpKj4G1/PmwCdBpSZ1rYyFYn2RdiO8QhKEatFTm1PNHG1wPQCaNeLRu5ds9tXwdg
	 qy4793GvRyXmy/TSu0YOq6892woCBAYZLq+v/epbcojeyGIN1eIQh+QwyWd8H0PkOe
	 vuIF7H/qofSqEMvgJw6N+Z9T5ymUERQjuk47bYM0=
X-QQ-mid: esmtpsz10t1762928081t5c587094
X-QQ-Originating-IP: kbEYhoF8GacQU0UCEfUev11PykziyM/ntLfoFyAF7Zo=
Received: from = ( [120.239.196.22])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Nov 2025 14:14:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12126374271057103050
EX-QQ-RecipientCnt: 13
Date: Wed, 12 Nov 2025 14:14:38 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2 2/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <01C031AEFDAD4CE5+aRQlzq76t3huDaLg@kernel.org>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
 <20251027-p1-kconfig-fix-v2-2-49688f30bae8@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027-p1-kconfig-fix-v2-2-49688f30bae8@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MijavZDuOhz7bE/ElR+jNrA/dTIV1tVGbqbsNFgB2HmIBKErA6uKGCF2
	tAoseYW/zJ1ETdp6nw3J292jqD7KBU1GJCCEJCPtq6Z6eHvMGzyy6BKsCCEL5uclkyS9ZFk
	w9+IjcL0W/CQIxaNXcg01GKxsi7URvxUJzzdP+sq7UtrmOGF1iWqAZ3EONwAervWgLnFyEa
	6nO9x/yuZ4joaqDclQJJzMMMxF5l9ETICsFAvqkxEnbFtHe4znmYlnEeNAt/KVgKcqjJsKX
	RM5YRGso85Ck1kqOtd2nhrw5Oudj4bV0k1zLHnzuoDvagmELqjkzcnLEBG8koqtbep1g7Gl
	ng0mHIcLsXLxYAwKOnjTR/1t3/dDf2Lk4jnRid/171TI3sHu24Ixj4uI8TBSdwh1SxIdqGd
	pDzz2pZo6CVK1ZyhB4aJP1VdZIfvzWAlaY520OpHfRwA3YVhGSTgbZ+S6o6R9HCH7ib0a06
	9ZK45C4lEWfU80pz12m5+rclkU3NVUjEEyeOqcDhDucKMRaJ8MASppweW7LdlbaTGWdp8gA
	BFhyoxrxa5DC9MJNXXhflqz2DWBkZfzvN2RoXqmvjIghZxPJqO9FORLBz+j2ZTTKxnhM2TU
	jbn0cFBVB/qRc3H6r8hV5uHXJXqxSH0zLN9Vv4L5NshIB9KRIllSk+yyKKTA1t1azWIGiUP
	MuWkFcE6aDQXsPKVsgm8axLSzukQbUO11LCSbBp13DnNDdnstycT+2s3XBheGnF6HZOlNrE
	ztX4K0ZLQvgpe/5VAQhXHauykmiFTGfkYKUXp5k5JqmWnpr8YITMqXGqYcQzXozq2DRW3Na
	YolAdKafppd5NXeUfhwKbcyHuJLDPkuSWlABBdGoRqs4W6O2Gp62rSq1LKPxnbpbcGocY8j
	6fPBhfKmGUQJE9wtA8xVU4CWPlCmyTsu0k4G9f/qg32w52nhs/SGPeonTubkXqF5KEZoSGZ
	FD+XZwz4fqhnZvOvUDkoDN0BfTLCBLuen1gJQtW0mqbP3oWlLSzWvwmnk6QYK9D8XO7+ahQ
	mklHfedVngMD5eK1YKcxzVO0OfOJVX0PSVmy4FkI6GKRGUjws6r3q0WKTi/xCFzSAQy71Dl
	TKwiRpqC7k5Q6YPMcrlXU1ozxAYgeyUU3wnQaQxmTdx
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_221555_894544_39C758FC 
X-CRM114-Status: GOOD (  17.03  )
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

On Mon, Oct 27, 2025 at 01:48:06PM +0800, Troy Mitchell wrote:
> The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> master mode operations is determined by the ILCR (I2C Load Count Register).
> Previously, the driver relied on the hardware's reset default
> values for this register.
> 
> The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> frequencies lower than intended. For example, with the default
> 31.5 MHz input clock, these default settings result in an SCL
> frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> and approximately 338 kHz (fast mode) when targeting 400 kHz.
> These frequencies are below the 100 kHz/400 kHz nominal speeds.
> 
> This patch integrates the SCL frequency management into
> the Common Clock Framework (CCF). Specifically, the ILCR register,
> which acts as a frequency divider for the SCL clock, is now registered
> as a managed clock (scl_clk) within the CCF.
> 
> This patch also cleans up unnecessary whitespace
> in the included header files.
> 
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> This patch was affected by the P1 Kconfig, which caused the maintainer
> to revert it.
> The current commit is a direct cherry-pick and reserves the original changelog.
> This note is to clarify for anyone who sees the cover letter marked as v2
> while the changelog entries reach v4.
Hi Andi,
Since the issue affecting the I2C patch has been fixed [1],
I think it should be ready to be merged now. What do you think?

Link: https://lore.kernel.org/all/176244506110.1925720.10807118665958896958.b4-ty@kernel.org/ [1]

                                    - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
