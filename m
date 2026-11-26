Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E3606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 03:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4tSU5E7g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=FAvk0CBL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/PKuxz75uT8Uq1hvQHsvZ4jd3s9WVnAmw5RZMmjIfls=; b=4tSU5E7gAhw7bNbBkjI2aSzIBV
	kpCaJWqbSPYodsIJnl6tBNCfv8Q96QtBhnlFVV6w9s2ErQh9TtOivI7hKhDEEAlPTiRed3NMovnfu
	fk4brbbwuZpFx68NxYUtFtkEnWNTdAn3z0Yp6gCamUDaZGVvQ9y5lshHgvH3Cuxfl+5ZINuo1pgpk
	2U9JqHaNLW5S07rOQjbVanr/EsLpNR8C5RJh2EGXyb3h5m+OPon27KJKnLnAdOHOoUrdvOnUqB0AW
	/d4Nb2z1kg4Ff4WrbJseHyKogwmPiz5J69TLE0lax7uNUQv54+jXBv+KZL7BTTRI3lUnuLxti5y+n
	QhNv+CYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQ2G-0000000BzlC-3Ybm;
	Thu, 26 Nov 2026 03:20:37 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQ2C-0000000Bzke-3DSB;
	Thu, 26 Nov 2026 03:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795663192; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e4FII9bZdXIdBe8LYq4IGbMGRvCRAqDjcHw9c8PyTsCwtiVOHVX5/o5BFvRZq0JzdHw4je5tOQNaP8jVIjuVYUPUqGGHM2gbGyvBK9FyNT8Kycg4BOOHwfPE7RnxlVPqV/ZCxlxkMgRkxdSOsnV7mkREAb/knXDALPMCKk0t7ks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795663192; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wl1zFrlH173HoV75rMT0wWjqW6vBAlxFdSbEFwWvJuI=; 
	b=UUDe5cwvt/PXWuIAvUf7gV10dD720xJ276dIrDwnydvX0vcdz39b+TOiVIzKwtv0rWTBNc/hcSoszBNxJ9fhCrI6J3p/WVjxBu6hbPq+8o10JwFbnn0+/tb2RocfO8quJzYOua2SEEyGmP2fsWdF29PJKqhh0Ky4UKSiB+zECkA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=FAvk0CBLjnz+CVdmsl7/q3o4Fp2VSiuJJI4sTMUqqnfWurQhA1S0J/y6uFnL1wO8PJypOYhxEbmZYB28yoWSeEefIUxMG+jv39r2SBJ8lcFiQVUpBH0wno0yeu97zQDXIRopUT3Fgb/Kqtzd5SFHi9F9OFc6dMwE2FASRbwLjHQ=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=wl1zFrlH173HoV75rMT0wWjqW6vBAlxFdSbEFwWvJuI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795663189418348.39520229037566;
	Wed, 25 Nov 2026 19:19:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 26 Nov 2026 11:19:39 +0800
Message-Id: <DN4TH0CNAM11.2OA7W5L11W78S@pigmoral.tech>
Cc: <linux-clk@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Andre Przywara" <andre.przywara@arm.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Enzo Adriano"
 <enzo.adriano.code@gmail.com>, "Norman Herms" <dockseed@proton.me>,
 "Vinicius Pedrosa" <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Alastair D'Silva" <alastair@d-silva.org>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Richard Cochran"
 <richardcochran@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
 <20261125122452.3966873-1-alastair@d-silva.org>
In-Reply-To: <20261125122452.3966873-1-alastair@d-silva.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_192033_155956_F60AFB41 
X-CRM114-Status: GOOD (  16.22  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alastair,

On Wed Nov 25, 2026 at 8:24 PM CST, Alastair D'Silva wrote:
> Hi Junhui,
>
> On Thu, 12 Nov 2026, Junhui Liu wrote:
>> static struct ccu_nkmp pll_ref_clk = {
>> ...
>> };
>> ...
>> static CLK_FIXED_FACTOR_HWS(sys_24M_clk, "sys-24M", pll_ref_hws, 1, 1, 0);
>
> While testing this v7 series on the OrangePi 4 Pro (24 MHz HOSC), ttyS0
> switches from earlycon to garbled output with:
>
>   2500000.serial: ttyS0 MMIO32:0x0000000002500000 (irq = 414, base_baud = 1384615) is a 16550A
>
> Because the hardware bypasses pll-ref (0x02002000) when HOSC is 24 MHz,
> sys-24M physically runs at 24 MHz from HOSC, while pll-ref remains
> disabled with reset/unprogrammed N=12, M=13 fields. Since
> ccu_nkmp_ops.recalc_rate() computes parent_rate * N / M regardless of
> the enable bit, pll-ref reports 24000000 * 12 / 13 = 22153846 Hz.
>
> sys-24M, apb-uart, and bus-uart0 inherit 22153846 Hz instead of
> 24000000 Hz, so 8250_dw calculates base_baud = 1384615 (instead of
> 1500000) and programs divisor 12 instead of 13 (+8.3% baud error).

Thanks for testing and reporting this. This is indeed a problem. I had
assumed that PLL_REF would be used on all boards.

I also tried manually disabling or bypassing PLL_REF on my Radxa Cubie
A7A, but have not yet managed to establish a working bypass
configuration... I currently suspect that the selection is handled
automatically by the hardware, but this needs further confirm.

>
> If pll-ref is disabled/bypassed (or if sys-24M is physically fixed at
> 24 MHz as the comment describes), either pll_ref_clk needs a recalc_rate
> that returns 24 MHz when disabled/bypassed, or sys_24M_clk should not
> inherit an unenabled pll-ref N/M ratio.

The issue may affect not just sys-24M, but also the downstream PLLs.
According to the vendor SDK, their control registers have a PLL_FREF_SEL
mux at bit 24, selecting between HOSC and REFPLL. The driver currently
models these PLLs as having PLL_REF as their only parent, so their rates
could also be calculated incorrectly when they actually use HOSC. We
should model those muxes as well.

However, my A7A, A7S and A7Z boards all use 26 MHz crystals, so I cannot
properly validate the 24 MHz case until I get a board with a 24 MHz
crystal. In the meantime, if you have a fix in mind, please feel
free to send a separate patch.

>
> Tested on OrangePi 4 Pro (Allwinner A733).
>
> Thanks,
> Alastair

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
