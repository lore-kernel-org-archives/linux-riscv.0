Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C51C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 10:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C278160F5B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 10:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C278160F5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEa/jUjrTSS8ULB+s2Zx30lCbbWAFbyS8RMKpu5hVWE=; b=LoWXZ64QekH+fb
	S2ARTk+Dqrza4j6iIl2QM1ilsr1tJ8C77jB/OozPDzOqDa15QX4q4sJw8RbHwUhDoEFTDdjv/0OXE
	PuwuGvmqMlIKkCYfW7d6fPUCeufsPTc1768fGPaH2TAStIH33A6y3rf/BTAJA6O33/PYUPHP9BBNY
	+WqZLbWB+nEo6HyBRZjAPe1rSUUmq3v+Z1RwUNUeSKQJzRVy+5Jh/pLC2wpcd4eBWZDHfywxlKHIU
	u6Unu+K8DKgtw5zmcxZBIv8T7DcXkW980ltCHi5rCXaxrbWABXWGvtCsJ4o2d+TlVAvKf0pz/pAmq
	hduIIxXp1ZN356/dSMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYmhi-002Jec-5V; Fri, 08 Oct 2021 10:02:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYmhf-002Jdv-Oc
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 10:02:12 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mYmhb-0008SB-JP; Fri, 08 Oct 2021 12:02:07 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: krzysztof.kozlowski@canonical.com, robh@kernel.org,
 linux-riscv@lists.infradead.org
Cc: krzysztof.kozlowski@canonical.com, zong.li@sifive.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, mturquette@baylibre.com,
 Paul Walmsley <paul.walmsley@sifive.com>, sboyd@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] dt-bindings: clock: fu740-prci: add reset-cells
Date: Fri, 08 Oct 2021 12:02:06 +0200
Message-ID: <24526929.Pe8KFHSfS2@diego>
In-Reply-To: <mhng-b9e6d8f9-b9be-4651-9649-3378d227eae1@palmerdabbelt-glaptop>
References: <mhng-b9e6d8f9-b9be-4651-9649-3378d227eae1@palmerdabbelt-glaptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_030211_835341_94C18985 
X-CRM114-Status: GOOD (  17.41  )
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

Am Freitag, 8. Oktober 2021, 03:29:17 CEST schrieb Palmer Dabbelt:
> On Thu, 23 Sep 2021 09:59:32 PDT (-0700), robh@kernel.org wrote:
> > On Mon, 20 Sep 2021 16:49:44 +0200, Krzysztof Kozlowski wrote:
> >> The SiFive FU740 Power Reset Clock Interrupt Controller is a reset line
> >> provider so add respective reset-cells property to fix:
> >>
> >>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml: clock-controller@10000000:
> >>     '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >> ---
> >>  .../devicetree/bindings/clock/sifive/fu740-prci.yaml          | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> For some reason I thought these went through your tree, LMK if you were 
> planning on having me take it through mine.

Normally both driver + binding patches go through the driver-tree
and actual dts changes through the tree carrying the dts files.

So for a clock-patch this should be the clock-tree aka Mike Turquette
and Stephen Boyd - already in Cc of original patch, so I'd assume they'll
pick it up.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
