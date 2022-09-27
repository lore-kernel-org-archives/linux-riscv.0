Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05934C6FA86
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 18:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2sgWeeLc6z953OhUlQZWtPLCBI42TR3yqV7rX7o5YA=; b=S0J+9j4bPYqZjX
	OXfDTkYCfrSZ/hwudZ3U6oLoTKDaATSrrAM5H/y3bAtrBdkl6o1jDxXmzm9lzki1mkGQq+T9Nc3SW
	75Ho8g0xVHdvrTapENC+wgFurvc5AwZ8NcXpI3Wp6fB5qMf/kbp34u78MJM8rk9I9TDRwcjdG5p9x
	ejkDu9Yr8u8E9OwLLtZM58u4uDuIEw2Aj2defofE0/EvHUEVgdFHtHTv9pWO2hv71+qefV8wLMH84
	AE5G7dUeMVyDttZbbd2eZrGt9XH+BbcidaLgk9OfwjnZht1VAMKJlpSBh42F61OybnOvNNqURYcdG
	paWvcFcTQOHV2R0NYyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odFPC-00CAyw-30; Tue, 27 Sep 2022 18:34:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odFP5-00CAyL-8s
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 18:34:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94264617E1;
	Tue, 27 Sep 2022 18:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9909C433D7;
	Tue, 27 Sep 2022 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664303636;
	bh=p88RSSMmSULebAyngf3hc6AaDM4Hg67OZpKwETod/JE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzAHVK2Al7ph1LUauN9QbFsX5mqgFWIUCZYAFZWoQAlBU343bPfyeRDVXOWvsY1U2
	 nSK6Gnfwz85W8wxOJMoWFbI9mF3C13ZLF6LgDzs2iv+t5doQPwDW4FJLHSszZaX2Or
	 LBqPyekmnxoA6QqG2nwcDoz5c5nI0A27wlLX6jAkawLmIHwEUvKhb0MCYyUfzy8RNj
	 35k2XxUMmVc3aCsY/Av4VnWXBUb6pQo0Yoi4RHhKVqgihgcdv+nga96FWnGCPxHbpg
	 ckHjXHdagq1GdH7xInqsaXrMu/RHJIl3VmYxgnNKebif4SsAWwyE3H5xsg2Dvhw/fP
	 pxmZB5Xbg80fw==
From: Conor Dooley <conor@kernel.org>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Hugh Breslin <hugh.breslin@microchip.com>,
	devicetree@vger.kernel.org,
	Cyril Jean <Cyril.Jean@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Wolfgang Grandegger <wg@aries-embedded.de>,
	Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [PATCH v6 00/11] New PolarFire SoC devkit devicetrees & 22.09 reference design updates
Date: Tue, 27 Sep 2022 19:33:32 +0100
Message-Id: <166430333467.135094.14015061795483453798.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927111922.3602838-1-conor.dooley@microchip.com>
References: <20220927111922.3602838-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_113403_404305_33FDACF2 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue, 27 Sep 2022 12:19:12 +0100, Conor Dooley wrote:
> Resending with an extra patch making some more memory map changes that
> are to be introduced in the v2022.10 reference design. Since the
> v2022.10 and v2022.09 reference designs both indepedently break
> backwards compat, v2022.09 is not compatible with <= v2022.05 and
> v2022.10 is not compatible with v2022.09, I am doing the jump directly
> to v2022.10 rather than putting an intermediate step at v2022.09.
> 
> [...]

Applied to dt-for-next (in place of v5). As I pointed out earlier, I
will not make a PR for this until the reference design is available
on the PolarFire SoC GitHub.

[01/11] dt-bindings: riscv: microchip: document icicle reference design
        https://git.kernel.org/conor/c/a0d49a8f77f2
[02/11] dt-bindings: riscv: microchip: document the aries m100pfsevp
        https://git.kernel.org/conor/c/0ebdc51787db
[03/11] dt-bindings: riscv: microchip: document the sev kit
        https://git.kernel.org/conor/c/db3d481698ef
[04/11] riscv: dts: microchip: add pci dma ranges for the icicle kit
        https://git.kernel.org/conor/c/f890e67f292d
[05/11] riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
        https://git.kernel.org/conor/c/99d451a7db16
[06/11] riscv: dts: microchip: icicle: update pci address properties
        https://git.kernel.org/conor/c/6fc655ed4986
[07/11] riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
        https://git.kernel.org/conor/c/ab291621a8b8
[08/11] riscv: dts: microchip: reduce the fic3 clock rate
        https://git.kernel.org/conor/c/fa52935abef4
[09/11] riscv: dts: microchip: add sevkit device tree
        https://git.kernel.org/conor/c/978a17d1a688
[10/11] riscv: dts: microchip: add a devicetree for aries' m100pfsevp
        https://git.kernel.org/conor/c/d49166646e44
[11/11] riscv: dts: microchip: update memory configuration for v2022.10
        https://git.kernel.org/conor/c/6c1193301791

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
