Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA58D606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eFgdrqym;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=u+vVcdZW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UmM3fEGB5ShVg2Cy4WQtxCFTrZq4qHJOXsHlzcLSrt0=; b=eFgdrqymTbZjERKzRAZaA+IQA0
	wEgNa2Kazi+BIsN8lO53AlrwiU4Hs7L9h9V7O4/ueXGAK4vzaxSOp779aadmee/p6lM+6wsid/e6p
	crJXTYGqBAysiWbg3v/tKZWU0doBpPZgX65aRviRrYc2QhQ794iEp4WlRUB4JsU8irA1WuletLrHI
	wpkcaX5B2iSgWhMTUU+6taxOSENYX72leAHlRgDjxExB73JXpxLsUjqkhI0n4aLJOswmNegOQSoFa
	kYQpfkz/itOi7u0kt+gcADP6bPnBlTp2WnZSDWPkY6ugdXwL20eOzMP24menJQOOmNOlIXb/8KK8I
	m3WyWGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC3d-00000009oq5-0rIC;
	Wed, 25 Nov 2026 12:25:05 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC3Y-00000009onm-2T4D;
	Wed, 25 Nov 2026 12:25:03 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id DE1744C930;
	Wed, 25 Nov 2026 23:24:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795609492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJaA1oVQlfD3Td2+HTDf6tsxtXlDuEgeg0sbDdSaIuw=;
	b=u+vVcdZW4+pQIvPMqTSScUsB2Z1KVWtGuyYxTL6kPLXAXgewuFltXTlahkwwEKTpQama05
	t1wosTGBvOYsvck0FOAtpOIseOvoTHPnFlMH3qF4SY/IEf2li+X7AbwWtOe0gKIsW9UznD
	u4Gn8UItfKrV7kTpQoVKUpecD4wsRIrh3yg68MBMSu/j/StiwcuBLL4hI9YoL/IP6x2lEI
	zYso/XIDmQP97v4Cwi1afQCtMPrj+cmBrC2SI9HkhpxsMcHx3cRH788kzElMcalgldVvm9
	fgSpC7adl2DxgZyvYGfRFRauvnqrFpZFCmy6akE+cuEnFdDhPeUZLPmqVZf4oA==
X-GPT-Reason: The email is classified as legitimate personal correspondence.
	The mailbox (alastair@d-silva.org) perfectly matches the sender
	domain (alastair@d-silva.org), indicating a trusted personal identity.
	The subject line "Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support" follows
	standard technical/developer communication patterns for code patches,
	and there are no phishing red flags, urgency tactics, or suspicious
	links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Wed, 25 Nov 2026 23:24:52 +1100
Message-ID: <20261125122452.3966873-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042500_878010_76575BF9 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Junhui,

On Thu, 12 Nov 2026, Junhui Liu wrote:
> static struct ccu_nkmp pll_ref_clk = {
> ...
> };
> ...
> static CLK_FIXED_FACTOR_HWS(sys_24M_clk, "sys-24M", pll_ref_hws, 1, 1, 0);

While testing this v7 series on the OrangePi 4 Pro (24 MHz HOSC), ttyS0
switches from earlycon to garbled output with:

  2500000.serial: ttyS0 MMIO32:0x0000000002500000 (irq = 414, base_baud = 1384615) is a 16550A

Because the hardware bypasses pll-ref (0x02002000) when HOSC is 24 MHz,
sys-24M physically runs at 24 MHz from HOSC, while pll-ref remains
disabled with reset/unprogrammed N=12, M=13 fields. Since
ccu_nkmp_ops.recalc_rate() computes parent_rate * N / M regardless of
the enable bit, pll-ref reports 24000000 * 12 / 13 = 22153846 Hz.

sys-24M, apb-uart, and bus-uart0 inherit 22153846 Hz instead of
24000000 Hz, so 8250_dw calculates base_baud = 1384615 (instead of
1500000) and programs divisor 12 instead of 13 (+8.3% baud error).

If pll-ref is disabled/bypassed (or if sys-24M is physically fixed at
24 MHz as the comment describes), either pll_ref_clk needs a recalc_rate
that returns 24 MHz when disabled/bypassed, or sys_24M_clk should not
inherit an unenabled pll-ref N/M ratio.

Tested on OrangePi 4 Pro (Allwinner A733).

Thanks,
Alastair

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
