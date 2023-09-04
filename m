Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C613C83F33
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 04:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=1W2sVSsgc7QnM6IxG+q2Ggkxp2ff5V8qb+8HEqu6nK8=; b=CPxdDTr2Nt1Kup
	hixU2fh7/ENrKLRGwhJ5BDulCqcf214snQcaWH0k4tKe6NY0VKY4Sp7h0Zqz5KtxJK7lZtcmhdjOh
	W06UKkEhpn1nCwXeASIxWBdtHK0FRnO9Xb/dbPcOmDc8dThginXBzpbZcpCAafaUSB2GrWBR0tNRl
	cgmMGgvcrBzEzkE+7pvrBjnD1MeJ6Wmgo9tioRiyaMf7DRzwNdk+g+DDKnFTELPLCl7Q7sf65yI4b
	fHeb3fQbzDJ/muvB8TOQX7u0643vwXxUA2kruErODNJR3eClo59qRADtXBMFjNx5FTfgl3jTUSJ8g
	AmdgpSFiyq6ul+xNzRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd1AK-003FQx-3A;
	Mon, 04 Sep 2023 04:26:20 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd1AG-003FL2-2P
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 04:26:20 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20230904042605epoutp0240372c9c8a82e888e9ade97cebae7b0f~Bl4zGRca-2288622886epoutp02l
	for <linux-riscv@lists.infradead.org>; Mon,  4 Sep 2023 04:26:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20230904042605epoutp0240372c9c8a82e888e9ade97cebae7b0f~Bl4zGRca-2288622886epoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1693801565;
	bh=OSy5o9yX85w5RQCPwAL+giA9DSBSLLh+5TEdeJJKcaw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qdwTjDwnRRG9qoat/FV5LIRKBX+R5642zisXHExBBMisnjamDOKzjufC7mgXvggVX
	 zEJ1PoAHu6l+l4nQjWaTkGCdYoC6roeJUaaRRyV4nDO0ljyUIIeqKii0brpMoN8FD6
	 2T4ChNwIn+2KeCX6RmJeARo/33FbOUO1TTafHNQU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230904042605epcas1p10333c599d6327646552f97e5a7d53e17~Bl4ynce752952229522epcas1p1g;
	Mon,  4 Sep 2023 04:26:05 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.134]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4RfFv00XnXz4x9Q7; Mon,  4 Sep
	2023 04:26:04 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BB.D5.10012.B5C55F46; Mon,  4 Sep 2023 13:26:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20230904042603epcas1p40f732a0ac7871371126d229945cc0849~Bl4xG1t4P1347613476epcas1p4T;
	Mon,  4 Sep 2023 04:26:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230904042603epsmtrp24abae42dd979b0b36f1d697465a82f59~Bl4xEIMdD0179101791epsmtrp2G;
	Mon,  4 Sep 2023 04:26:03 +0000 (GMT)
X-AuditID: b6c32a35-50fff7000000271c-0a-64f55c5b8c57
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	06.1A.08742.B5C55F46; Mon,  4 Sep 2023 13:26:03 +0900 (KST)
Received: from mediaserver.. (unknown [10.113.111.131]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230904042603epsmtip1dd79326365cf6747ba5b3ce823db0b4f~Bl4w0Rkjl1856018560epsmtip1e;
	Mon,  4 Sep 2023 04:26:03 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/3] Introduce reset driver for T-HEAD th1520 SoC
Date: Mon,  4 Sep 2023 04:25:56 +0000
Message-Id: <20230904042559.2322997-1-k.son@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmgW50zNcUg2VfbSy2/p7FbrFm7zkm
	i/lHzrFavNjbyGIx6f4EFovmY+vZLPpePGS2uLxrDpvFts8tbBZ3751gsXh5uYfZom0Wv0Xr
	3iPsFi37p7A48Hm8efmSxeNwxxd2j02rOtk87lzbw+axeUm9R/9fA4/3+66yefRtWcXocan5
	OrvH501yAVxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6
	bpk5QPcrKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMC/SKE3OLS/PS9fJSS6wM
	DQyMTIEKE7IzfnxtZi+YwF1xfelPpgbGExxdjJwcEgImEoueXmPqYuTiEBLYwSjR0D2fFSQh
	JPCJUeLDOheIxDdGiesLf7DBdCx5/40NIrGXUWLazWvsEM4bRonlZ/Yyg1SxCahLLGlbC5YQ
	EfjPKPHmTysTSIJZIF7ixLVzYEXCAq4SLz//BdvHIqAqMfPjOhYQm1fAQuJE6zRmiHXyEvsP
	nmWGiAtKnJz5hAVijrxE89bZzCALJASWckhc2j6NEaLBReLZxY3sELawxKvjW6BsKYnP7/ZC
	/ZAtcfQjjF0icX3WIlYI21hi/9LJQIdyAC3QlFi/Sx8irCix8/dcRoi9fBLvvvawgpRICPBK
	dLQJQZjyErc6yyGqRSXOPP0INdxDYv+d+UyQEI2VWP7iH9MERvlZSJ6ZheSZWQh7FzAyr2IU
	Sy0ozk1PLTYsMIRHanJ+7iZGcBLWMt3BOPHtB71DjEwcjIcYJTiYlUR45bQ/pQjxpiRWVqUW
	5ccXleakFh9iNAUG70RmKdHkfGAeyCuJNzSxNDAxMzI2sTA0M1QS52V+1JsiJJCeWJKanZpa
	kFoE08fEwSnVwHRt0lvbAyqlVV8uqXy4Oe3m2mVS22Wav62xVCkx18vqFRA4F7mznFejZqft
	GiUre6vMM8b3ldl8+q4XS9741pIQwfKQo336vWu+K9aJbDtc3GD59tyBZI7a+9FBOWwHfIsV
	lBlm3KjLjr359uBtba4jL/KahU8nXb98allV3j55h3d/fx14fbqm8dw77dU7Ii+d25jxz3el
	nbQPo0S8V8tzrisR8g0snAcvMq7p8Fw7Uft18J+9m9r383If4DzBlnUiYF29ybGyFQ/mVpfF
	bgjVzdeOD59/UbHFy+b82U0aLwy8Y19kq/BVtW6f92irxL5wp78/ugstYvYL7nFZcr8j8ZxE
	Q/v3Pz8/iWyRVFNiKc5INNRiLipOBAA1tvkVSwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnG50zNcUg7ObZS22/p7FbrFm7zkm
	i/lHzrFavNjbyGIx6f4EFovmY+vZLPpePGS2uLxrDpvFts8tbBZ3751gsXh5uYfZom0Wv0Xr
	3iPsFi37p7A48Hm8efmSxeNwxxd2j02rOtk87lzbw+axeUm9R/9fA4/3+66yefRtWcXocan5
	OrvH501yAVxRXDYpqTmZZalF+nYJXBk/vjazF0zgrri+9CdTA+MJji5GTg4JAROJJe+/sXUx
	cnEICexmlJh64gUzREJUouNyI2MXIweQLSxx+HAxRM0rRon5fa2sIDVsAuoSS9rWsoMkRAR6
	mSQ+fFzCBJJgFkiU2PL1NdggYQFXiZef/4I1sAioSsz8uI4FxOYVsJA40ToNapm8xP6DZ5kh
	4oISJ2c+YYGYIy/RvHU28wRGvllIUrOQpBYwMq1ilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dL
	zs/dxAiODC3NHYzbV33QO8TIxMF4iFGCg1lJhFdO+1OKEG9KYmVValF+fFFpTmrxIUZpDhYl
	cV7xF70pQgLpiSWp2ampBalFMFkmDk6pBqb2xrVVWXNap+3Z9u/+hnVxIQWKiSWnzXXvL5Ji
	O12lI7Qm68G81TcKrh2J5V1Wev+TxDPmg4pccgd2Xy/+dS0yy0rI7nLFmi+yh5Y5KCql6/w8
	yqp1wdY8QZ3zypaUBbOmFxj/ZDpyl2f771lfxHcqhhXtczrutlmhcEtBlZXMrdyTMhbFPFvc
	losmbVllH881MzZFMuHorNMxBQ+6XvfeizkWXH1UX1En00X1m4x0nNShCfEa6xojTnfW2mm2
	3Pbfv31FYpbZm6arjFyT1xrcvKu4qlz17Zdcy2dXJgdMsF0lUXrYmNU1VPeC2JHwTzHZq9Rt
	ePLPBN93l/lqsuPBt5sxXgVXL/3jMTW/YqrEUpyRaKjFXFScCAAQxPSu+wIAAA==
X-CMS-MailID: 20230904042603epcas1p40f732a0ac7871371126d229945cc0849
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230904042603epcas1p40f732a0ac7871371126d229945cc0849
References: <CGME20230904042603epcas1p40f732a0ac7871371126d229945cc0849@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_212618_275126_05CACAFD 
X-CRM114-Status: GOOD (  16.74  )
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

This patchset adds initial support for reset driver.
Register information is from vendor kernel [1].
I sent an e-mail to get permission the original author,
but there was no answer. So I upload patch since it has GPL license.

This patch also can be tested with watchdog simply with 
```
		watchdog0: watchdog@ffefc30000 {
			compatible = "snps,dw-wdt";
			reg = <0xff 0xefc30000 0x0 0x1000>;
			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
			clocks = <&osc>;
			resets = <&rst TH1520_RESET_WDT0>;
			status = "disabled";
		};
```

[1] https://github.com/revyos/thead-kernel.git

Kwanghoon Son (3):
  dt-bindings: reset: Document th1520 reset control
  reset: Add th1520 reset driver support
  riscv: dts: Add th1520 reset device tree

 .../bindings/reset/thead,th1520-reset.yaml    |  39 +++++++
 .../dts/thead/th1520-lichee-module-4a.dtsi    |   4 +
 arch/riscv/boot/dts/thead/th1520.dtsi         |   8 ++
 drivers/reset/Kconfig                         |  10 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-th1520.c                  | 109 ++++++++++++++++++
 include/dt-bindings/reset/th1520-reset.h      |   9 ++
 7 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 create mode 100644 drivers/reset/reset-th1520.c
 create mode 100644 include/dt-bindings/reset/th1520-reset.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
