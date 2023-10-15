Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042C2CDB482
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Oct 2023 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jO8RAdvYNAja3+okfm14eZmi9exXNlSzhLQYw0bLjgw=; b=fxufHG90au6EPl
	m3VBL12Kc5jo6GnCmHlyI0yeoTfcgL0eTjHh0UKCw3rZDSQJP6ePbgW5DG1YqM6LyLFCqr522iM9i
	TUeYfgblOohuUX5xf+Ejy3rks46aJAy0K9AOoEoWG9pnITHoO/I1KlfUNzjdueeD3GX+gpAqGIYUe
	6vC+Orki0PYLUwAy0HhLafwBScy2iZMhf/AlKvBWLb6kK6bK0uyC+lW8Z+erFcZRc/rC/v4CZ53qf
	z4/RHL7byeUHSux5C7PoJPvBpihTMejSPphOSNMICuERJUiPrsiQgt54W5u9hopKoMNIpGi9w3pyX
	8/NFDctAY/1NLjg6q0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qs098-0079NR-0K;
	Sun, 15 Oct 2023 12:23:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qs094-0079Ms-0n
	for linux-riscv@lists.infradead.org;
	Sun, 15 Oct 2023 12:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 01D11B80D69;
	Sun, 15 Oct 2023 12:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35753C433C8;
	Sun, 15 Oct 2023 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697372571;
	bh=Vq1x8fNAr/F5R14kzqqNRk9z6bIRBIK9ilwYC/Yu/n8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KUUIcofa5nhhHisGxJQ1HY7JhZZ8wEN/koWoaRST6AsmY13ju+N3Uih7pphdxf8Ck
	 TfP3h7NaqakIsIVlHTC3Aw34UuX0iPjcL0Jw7c3sceNbf7qfUEOAH+3NHz5bAS2T8n
	 1HYGpgModnd2INeLjnamqfCSqa+jhfmJ4khpqgWEQepmUjiOHlsUjGSl0p/+GvbIqk
	 fLjfVlEKB+zrMui7gpV13nIlDPisHHFYZ2lTkkrCFLmLuZOvIn3ibiR52HXfATT3V1
	 IyDF3p/GtG1qSC3/GEfiE/qoD0mzPDEGbedNFcgfyq3Jyxgj9AUl9OD+Hidw7pG07J
	 Q2QkkavLa0bZA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.indradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] riscv,isa-extensions additions
Date: Sun, 15 Oct 2023 13:22:02 +0100
Message-Id: <20231015-qualifier-campus-97bf09059d51@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=JxLsg/nX2rHAa/nDvg2BonZ/j7ra8ax29aRGRmkFUGU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnaN9MXZh9OfZttW3bgD9O9h39Tj8kd+3X1nVVa3eZTJ Yyh/zXzOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRacwM/93VTu1Mu3pe8cfd nZ0eCnMezgzT645bJ35u6ZRQL6/Pi0IYGVbu/cq9Z+JE6QsdR6fxuVx5UaU/rTfZWmCVugDX7tA 3fOwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_052258_451351_6A3C7B0A 
X-CRM114-Status: GOOD (  11.29  )
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

On Mon, 09 Oct 2023 10:37:44 +0100, Conor Dooley wrote:
> Now with the RFC tag dropped. There are no changes here from "RFC v2",
> other than the addition of tags that were provided along the way. I have
> not added "Zfh" to the T-Head based stuff, as I can't actually read the
> documentation that would show that they're encoding-for-encoding
> compatible with the standard extension, since it is apparently only in
> Chinese.
> 
> [...]

The first 3 applied to riscv-dt-for-next, I expect the rest to go via
their respective platform maintainers.

[1/6] riscv: dts: microchip: convert isa detection to new properties
      https://git.kernel.org/conor/c/561add0da6d3
[2/6] riscv: dts: sifive: convert isa detection to new properties
      https://git.kernel.org/conor/c/a54f42722e49
[3/6] riscv: dts: starfive: convert isa detection to new properties
      https://git.kernel.org/conor/c/81b5948cf1a7

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
