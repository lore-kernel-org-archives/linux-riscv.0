Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3F2606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 03:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1NkyBtIG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=EQ9IfgrN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/x0zdxBIChhc+Y6Ck5bx5KkVu8I3rNFvEts8S9X6lkA=; b=1NkyBtIG967vNdEU0l/62MH8gm
	UWVmJ5rBefsI92t25mbnXjHG6+qyW5K6Fg3QNoyDxJGITELxEaMYj2g3yw/YxBLzcZSfE8soViNCG
	+lxutCkvZwYa0k3xETyX8aIbuQozdLTkWcVPgOwOQ9JjCKgQqCHVQ510jfZ7kjW0cvoP1K9I2h145
	ROXTHxzWObv8zlKa8E/E1thKqMzlMCR37BuuNCCWASKg5hcGiWMJ/yB7fyJ7d++k3ptKaPYnkoQbF
	KtkPvEh3UYzniEXY8WAdQJ+dYMB4Ab0YQ5mNisWf+mgiK7e8h+VL+oeoHcLC4Ks2FwVK0kL9HuPFS
	E2wydEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQJX-0000000C0tY-1zUt;
	Thu, 26 Nov 2026 03:38:27 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQJS-0000000C0se-2abU;
	Thu, 26 Nov 2026 03:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795664266; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DCST9ByL27Upx2hl0RzcqKcwt9Z7EVBalVed5KTX5p0dqKgovEq5o1KKe0YRBS+WcivtXbO2HcSsag7nrcXRTvRkdF4ReXXxt9iz1s9PoVOFQmi11LbzT9r9B/kIjmriAHMWtZhI0m0IKdtNWOgQqyyY7Juu1hLpt/ZwF3YvN7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795664266; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4FiZB15xhKIOJGy2ZwbI3s6k8WVaPRsBBgY+WA+DbhU=; 
	b=lf8eHZZofR8MSZAryQsfxNMzo5nZCqRPrbimNdazOKSxaVgEnEWR/uLPY3JABWWMxEx00UTdHuMZsxS+SSV4W6jOFX1Pi4Acpks+U4XjEI1LxRRFyOdmOv9gBhq8shkdbZAH5IRd82yXsBpFzdPm5yALBN6RiHDsEb5EArE4SAE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=EQ9IfgrNgxR+Fh8LE3AvioVr5xbMX20L/NC1Z/s6ccpmAAcOkqIZk9M8kr1WRakP3rPB+5QW3B8Um0A1PiQPrZg5YshCazvMMtRztBSlhCuqO5kYenDFYKWtlDV8c8ZnJ9wfsjd94X0fu1WcsaTvBvnW5SygE1tQv93AXACAkOg=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=4FiZB15xhKIOJGy2ZwbI3s6k8WVaPRsBBgY+WA+DbhU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795664265088521.0475713937745;
	Wed, 25 Nov 2026 19:37:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 26 Nov 2026 11:37:34 +0800
Message-Id: <DN4TUQIL3J9N.XYYN5MTODT2C@pigmoral.tech>
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
X-CRM114-CacheID: sfid-20261125_193823_150984_893607EA 
X-CRM114-Status: GOOD (  14.57  )
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

Before ordering an Orange Pi 4 Pro to investigate this, I checked its
schematic, "OPI 4 PRO V1_3_2_20260109.pdf". Y1 is marked
"26M-20pF-10ppm", with a "USE 26M" note, and the CK-SEL resistors are
configured for 26 MHz.

Could you double check the crystal frequency on your board?

> switches from earlycon to garbled output with:
>
>   2500000.serial: ttyS0 MMIO32:0x0000000002500000 (irq = 414, base_baud = 1384615) is a 16550A
>
> Because the hardware bypasses pll-ref (0x02002000) when HOSC is 24 MHz,
> sys-24M physically runs at 24 MHz from HOSC, while pll-ref remains
> disabled with reset/unprogrammed N=12, M=13 fields. Since
> ccu_nkmp_ops.recalc_rate() computes parent_rate * N / M regardless of
> the enable bit, pll-ref reports 24000000 * 12 / 13 = 22153846 Hz.

I also noticed that your DTS in your U-Boot patch sets sets the
oscillator frequency to 24 MHz. If the board actually uses a 26 MHz
crystal, but the DTB used by Linux declares 24 MHz, the PLL_REF N/M
ratio of 12/13 would give:

  Actual:   26000000 * 12 / 13 = 24000000 Hz
  Reported: 24000000 * 12 / 13 = 22153846 Hz

This would also explain the reported rate and UART baud error.

Could you check the oscillator frequency in the DTB Linux is using and
share the raw values of PLL_REF_CTRL (0x02002000) and RTC_XO_CTRL0
(0x07090160)? That should help distinguish these possibilities.

>
> sys-24M, apb-uart, and bus-uart0 inherit 22153846 Hz instead of
> 24000000 Hz, so 8250_dw calculates base_baud = 1384615 (instead of
> 1500000) and programs divisor 12 instead of 13 (+8.3% baud error).
>
> If pll-ref is disabled/bypassed (or if sys-24M is physically fixed at
> 24 MHz as the comment describes), either pll_ref_clk needs a recalc_rate
> that returns 24 MHz when disabled/bypassed, or sys_24M_clk should not
> inherit an unenabled pll-ref N/M ratio.
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
