Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB1C4452F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uh9+2Og3u4er5+2b6Ul0p6xYNhvjPwnEYAtAmeD4ecY=; b=eV5//FDzQJhGDd
	MYRdadRD9NcPnSeIO/uOrlzt7Kt63E37m0Vhl3i4zMnCQf2S3N+pOi9Z617tKnXhllsgSUUnUM2RV
	0QiKuT6Aa9n576FFySURFSLRprXUp1NgM318IYAivLKTQ7pj/5TOehaUEiKurSgqdA5oudjCxmWFa
	Fhab4KoKJ1z2rUudYm0oF1EGQR/A+ULiCBYcGZ3CqEPv/2LEIrjninwcNUDp9wa1iMsqFe9+Hiezh
	DjyIUz1GfcaluwM58g+R53XHMlTEHaLK/NivrKiRv3ERuAp/iPIfnQLmV9JazslUwtrMhLy8UG1jX
	J7PDHzFbtfydcJzzQ4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9jO-00000009R37-10qe;
	Tue, 21 Jul 2026 12:37:54 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9jL-00000009R0u-0qHR
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 12:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784637437;
	bh=P6/1sr4qvixoiNkBTsBAYtxWyovt0dZLYXNq2QiK1qc=;
	h=Date:Message-Id:Subject:From:To:MIME-Version;
	b=TOoSss+vACADodypSEDUPuJVWCmUyvRPI8PJkLWycWiTFxFHbHvv5Km/ArMArSk8w
	 5J56bZBQOduKmM15G0aC64GfLymIM43mIOyI23gelQTj1D9BCAwhJiJxKdWKVl1GtC
	 uaoq4GOyOZX4aldF1VnXXsROsLB06eHFo97vxCAA=
X-QQ-mid: esmtpgz11t1784637435t47ac860c
X-QQ-Originating-IP: tntK1MQ1IUOg67b1uF/vVh5yYOC+UElvBpzgzBVoRVA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 20:37:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4120638745816220918
EX-QQ-RecipientCnt: 15
Date: Tue, 21 Jul 2026 05:37:12 -0700
Message-Id: <DK4966E0B5GS.3FTMQR43Z9LA8@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 3/3] clk: spacemit: k3: fix missing /2 factor in i2s
 sysclk dividers
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <sashiko-reviews@lists.linux.dev>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
In-Reply-To: <20260717073701.94A511F000E9@smtp.kernel.org>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
	<20260717-k3-clk-fix-i2s-v1-3-e95001a692ee@linux.spacemit.com>
	<20260717073701.94A511F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NqN/wpVFVRYX/G06CwSHiSlbcGwOKm01fQagEUdYtFVa37FudlzP7X/+
	SujzOGQ7mXk8B7TrBLOZYqGJ+C0g9JPUsH+gpPcDZ4N9FohUh0dcZf4qAumgaFVUDxf7rbW
	m5AU696zreSYJIv1V2xKkViv0sOhi7M5udnEMzbadPPy1LQe7wrdTLev8gFX3s2SK33wzQo
	neT1WslrHGHVPds4rQBDD51fLP51SSv0wmn/UD5OKASrSpre8TWcNMGrddnH5oM2J5pTOuB
	vDcHxRkxqYL0OnGhQ7OZcDIEOPrD5xOn/iqzdIntjpH3gn+aCzFM1HBe6wtQJxsiVMckBtY
	0ptXH9d13JpLms+iUAc8X1tioSPNZoK6FchpUbBh9M26sFEKSj54tLQGA3h0m5awr0gNWp6
	b4xkDWrorOxytG0vuFJDm5tG1gOY1y4h7q50JcEWxWok7tOofLq3lpSC8mNjyLVL8vT7XeM
	qj8DEEzimv2pZzgFXCi1jcGUfjL1ASbqrFpl8GSzYs0BViYqVeWPEuhRzcSUCIRusSVo8ox
	n7S0h32nEDej3sDC4PYethKjEj6NMyCK70LdgZFCncaklE9fQrpToqqMGQsO9Oex2GM1ri0
	15KyIowbY2C2nTAm3C/RDCtizeoTTYoh+wEfjFG2qBUBIumbluekK7nL/yklxLD1fFAacLH
	pn8m8xiEck9WYy6iOD6YeQ6z2Q68eqjCwibRUdz0hihw7DMfhCjvVRAmUrE+AqrpuuAMhR9
	Bz0mUCtNAhZehGw3ZEc3EMF+ZdMtN13/IVA8tlrDPmkRhXWXMSYZrr8UZk086WXuk1Yipnb
	pqY6U1pCYJbbacQrNUb94+iHie+Lmf2qAuiNw+8+cd4OxMjvWA3gLxeeqUfBBsJhJRW5+uw
	hLbKpaSJzs7kBGUnMssCyUBStUOmlljw89kRniLsEcV5BFEz5bjhpEtgaRE5Tvk8KRzDbGX
	t5B3Kk6o+Vn0zadGlCiARsY3kbTRsFkfkVzJKakQ5HpuLIi8tVMpW8sA471Cqe7lB+kGcW1
	CV7SCa3A6cPfBPm+Um19scwLA0EpbzlLLTZM7DhB0Q19sH3fbg22XVlKy+EB6pIt+rAQUI3
	Np1rYHk4HB4
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_053751_753391_B13A9F7F 
X-CRM114-Status: GOOD (  13.18  )
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

> The i2s{0,2,3,4,5}_sysclk_div DDNs have an additional fixed 1/2
> divider in the hardware IP after the configurable divider, so the
> real output rate is:
>
>     rate = parent_rate * num / (den * 2)
>
> [Severity: Medium]
> Does this formula mathematically contradict the driver's implementation?
>
> The code in drivers/clk/spacemit/ccu_ddn.c calculates the rate by
> multiplying by den and dividing by num:
>
>     return prate * den / pre_div / num;
>
> Could the commit message be updated to reflect the actual hardware behavior?

Good catch. The formula in the commit message has num and den reversed. The
correct formula is:

    rate = parent_rate * den / (num * 2)

I will correct the commit message in the next revision. The pre_div = 2
change itself remains correct.

> [...]
>
> [Severity: High]
> This is a pre-existing issue, but can this lead to a kernel panic due to an
> unhandled zero divisor?
>
> In drivers/clk/spacemit/ccu_ddn.c, ccu_ddn_recalc_rate() reads hardware
> registers directly:
>
>     num = (val & ddn->num_mask) >> ddn->num_shift;
>     den = (val & ddn->den_mask) >> ddn->den_shift;
>
>     return ccu_ddn_calc_rate(prate, num, den, ddn->pre_div);
>
> If the register contains 0 for num, ccu_ddn_calc_rate() will divide by zero.
> Additionally, ccu_ddn_calc_best_rate() can pass num = 0 when
> prate / ddn->pre_div evaluates to 0.
>
> Should we add validation to prevent division by zero in these paths?

Yes, these paths should guard against a zero divisor. This issue predates
the K3 I2S change and is independent of the fixed-divider correction, so I
will address it in a separate ccu_ddn patch rather than expanding the scope
of this series.

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
