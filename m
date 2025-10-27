Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EC1CCF9E9
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 01:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AOlxRbe371nncUxGF1+lxyyiXyZU7+b3u+8DT4KK9w=; b=OYLnwXoqNxlVwn
	+kyxHM+AmYTkCcpk1g8DuLhpReE8ZhbKQjbzWHMPAQcnASwKd4JjOKIcB0JlqNSDynTq3sDdDWDV0
	K5YBabHuD5exAh6rgzpJtemXv6GLfBrP6Hmen5HEzGaAF57yMGJxhBTe9fQHQPZero+6rc9hdCcfy
	4EIOsYKuEvtqK7p3KvZgRn5w5l/G2R9Qb+5N5pfcZMeLYz50LTRiPEf1eEb26rp0JwDzJXhI2l2nP
	dI5SkJJ4Inb3So9gvmoRo5c/vjnxM5Gt6Rs0LdEsPuybNOwi3rWItrVXwUghNA9odTN9kf2xC1F3i
	y7TE6LPifcYqaunhw+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBxV-0000000CwmX-2xDK;
	Mon, 27 Oct 2025 01:23:41 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBxS-0000000CwkA-33IB
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 01:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761528146;
	bh=YFqnaQXbGn6xdpcNOP814zAlTHleVU+KgUL5SVGaMpQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FfDbqCD6wwYPlWagWvX0VZuwa17F1vbKPQzklYw/m+XPgYkR86Owauq/AIIIVdFez
	 VjIwSI74wordNJ8wOqd0xb0L6XNqw3iyLE+v6ogv6bUejViQwElDO9f/UWGSmMbsSH
	 MBGfvzvE1cqDXaQLo7VOKBymRzR1p4//pGZGu6yw=
X-QQ-mid: zesmtpsz5t1761528136ta7becb60
X-QQ-Originating-IP: Qzn6Gh3dF5mQyqK/6O3ihXXcFnqBQdYjHjd+FkTWnwk=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 09:22:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13636534776712087437
EX-QQ-RecipientCnt: 17
Date: Mon, 27 Oct 2025 09:22:14 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Message-ID: <0E60AA15166FED21+aP7JRmPzDIq2WhWw@kernel.org>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NJYnAvh5o174hOhmHtQvFOAC5jUOxenedJJUtDkgVySssxCiOaYXvPTY
	S5iW/83e6ZWDFfsrz8/h7HY6iit3ndkAOxWHQPt9paHi++eBS4x/YTpQEC83F7yzA/qHr1L
	FuFCiTVMzV9F0srfDD8L2dmJ+JbZPHGFtlqD7FyKDfI3735Xi84167TRSEOljOO5z3gnxtC
	PiNNxM0nYYUgVzitbSLbMhxLPQL33El+Vlh+dS35mlWXE8zHzr574U53+TcD9+hlO5rTMyK
	uSbwOw5NuBxM/YY0k5IUpxi8DwTnt6mVbrZdZot8l4MGwgMijM724U9dbHKo8z+ufdB8vUT
	D3zy1QtCkzrXOGffBrR7R/r8m5TVG5YbeGR4jwbPmAQpDAjLpbotowxxr2OqFL4em4r6iuf
	torKYVs6aS6vqIH1dVpXcxMgoMxwbPxNcwR1g8qU2uL7zDHXDoXH/R4NP0zw6Dk9HIroQlE
	WMk+jeh4Zya+cHqEOwFeDxQtp/+gzxlcIF39Ja2qvwa2PhHPGT8/1BgbYjeuoIJDh6YVWDb
	qYygMuJmFmhwbDMmWd+I9o2m2T8X10TkQWuQkiBImKd45ljNp3tz48mO5+sgHzC6krIYXcd
	NQXcC2in3yTtZ8MMSoYD4GBQ7jBgs49B/W25Mmpkyb9rUC3P8KEfPZl6P7IGE6z/jYe+CYm
	HwpP+hQrACKbDhaoptC5j6dj9js0DCcEmoif0ESonYpB7RfRKp4e5rgnKSWU9zsolszERnX
	26RapfmAmRAXSdtSkZI10lFAV4kOVAxieT99xgqeNNGyXZb49zpIYscxkJMCo/XBPhDiO8d
	FFR3a/C9cVcUtbtVUKg0B0Ypr4W3zU6vNwV0Aoz/VbQYkSWhIcKqodhOWHC7JduQA12Nx/t
	XIb8Lgu6eQgycVNXiott1Oy/CU86umJ5fTPq4RgTpNaougwVnskAt+xB2xYbZcciqLLSHEE
	3hPxFsaFAGhozJOKOBsiCJb28I3HXgdHKD63Y5dL3hgxMPeG4u/FKNtKRXvTDVA9jB9u0AO
	D685a2tLop6iBY4gFUNsrMpz+cP9qzqk7CmyEVC5H9GTj45RCsA8QxG2OD9Gk=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_182339_220047_880993F3 
X-CRM114-Status: GOOD (  13.14  )
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

On Sun, Oct 26, 2025 at 10:00:40PM +0800, Junhui Liu wrote:
> This adds Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC,
> as well as corresponding dts bindings and dts integration.
> 
> The CRU driver framework is built around the clock controller as the
> primary device, with the reset controller implemented as an auxiliary
> device. The clock part refers to the vendor's code [1] to determine the
> structure of the clock tree.
> 
> The Anlogic DR1 series includes not only the DR1V90 (based on the Nuclei
> UX900 RISC-V core), but also the DR1M90 (based on the Cortex-A35 ARM64
> core). Most of the clock tree and CRU design can be shared between them.
> This series only adds CRU support for DR1V90. Nevertheless, the driver
> is structured to make future extension to other DR1 variants like
> DR1M90.
> 
> This depends on the basic dt series for DR1V90 SoC [2].
> 
> Link: https://gitee.com/anlogic/linux/blob/anlogic-6.1.54/drivers/clk/anlogic/anl_dr1x90_crp.c [1]
> Link: https://lore.kernel.org/all/20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech/ [2]
> ---
Do we really need a cover-letter? Since you only have one patch, Is it
better to put the above information below the --- line in the actual patch?

                                      - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
