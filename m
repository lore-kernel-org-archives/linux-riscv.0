Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92318C531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:Cc:
	To:From:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jNma1W3VzonowumCM0beXgmoR26lWMT0CZRHW6YFnM=; b=eh+UFtF6Pi2O0z
	FTY0C8yv2amd4ZLZfxAPLjNIN0EnA1AuwoQwuEBXFa4o0dMFZer7mZu0CLN9aopXm8xgkVCGIay5h
	F0mTc2ZuxXlCP5S/u6aIHNAra1hPobgNRFSYl0IJf2Wr5wenZRSBGLpXUHFlKBPsTAqGwOl0hdblT
	BJb3J4Miozqut53U/Zl57AYpbaTiZ/fbJPrb+9XKepTPdTpnozzUjdrUIzpac026zLkapwsY4oH6z
	thDLDkWCaxDI7EKngfYIpgwO5p4ZsRQ5MLrrgJIdPVYw/yeCo32kRLtaln3uEhOIcOte7OCmTe/ud
	5z79Dh0tMHrO8I7UmI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFsG-000000028Xa-3Hrz;
	Mon, 27 Jul 2026 07:35:44 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFsB-000000028UY-0pXW
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 07:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785137695;
	bh=KL5Fp4IzwiE9LqVjgJfa2uxTnxpNuxSkBa/EiDxfGg0=;
	h=Date:Message-Id:Subject:From:To:MIME-Version;
	b=P4zNKVEP3Okc/WRUWorLIztzEzn/LAraM+rLRcufTKRftRFu7okd/cmchwt8bIQAb
	 MXrpsCxFK+G5/T60wCxrPkgPDfmoZxqzwM4xIFjmM29u/wtvDdfpNdJDqoAre5e/eg
	 mxzm7J/gIWKKKc1IsJ2IfwdX8dlHxNXOioHvrWv8=
X-QQ-mid: zesmtpgz9t1785137692t0e7eb53f
X-QQ-Originating-IP: oxpuJSqOZbD9ourOjfZ/7tJPx64hRJQIcJ0XgjKrej8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 15:34:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7053956593380550659
EX-QQ-RecipientCnt: 10
Date: Mon, 27 Jul 2026 00:34:50 -0700
Message-Id: <DK96HXIOUUHC.1K9YA51CG882V@linux.spacemit.com>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix wrong extended DRCMR base for
 SpacemiT K3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Guodong Xu" <docular.xu@gmail.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Guodong
 Xu" <guodong@riscstar.com>
Cc: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <4wo2ylvv2v2kmec4vzycgide3orx2zwjzdjunfm23t6pclknbl@pqtb7lw2parx>
References: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
 <4wo2ylvv2v2kmec4vzycgide3orx2zwjzdjunfm23t6pclknbl@pqtb7lw2parx>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MM1NxodbN5/S3Fulun2AzcU2bwsSubPRAS/8dmW9D7c/cEviT0q5xYDx
	PMm9NzezV3HDd685eHE+lXz6SrsB1d+umo3UTE13xg1frobpcrAbbJ6fpUvEJSDzR7tAasD
	wcatugMYSxmbzyd2a2ASHVKsRRMTDQ4EMNXLC5SHkgNNlk/Mnsgt3WdIPlU0qlRaQIPI41B
	KDQ0myh7K3HTw8h3apOmkxoWfnImrbx0YaLB1SRG/bDaEIJ6a0WLGO1sJ/Gsj9Z7zCohEWl
	zzB/7cpoqbZwHNzEHc5XCF1Rf3kONGAEW9U0+fxxqMQQSHfU6tK0V4WSjrwoSiQRTwJT+Lk
	dkBr8TbisNzHbOAEsK7y8AIlWZjZf1XbpXqn1vBs7i2JWoqsWLvroclUA8mXXwqbDoAxFid
	cr0hb1GMQR4lNcJsAUFQYe+pM7UBo5jpMKWULpTO9ys52aR3xEdZ0PNW7F+IJOr+8Ci3YM6
	Fb05B1CKltwp9UQdbRQGPePywvQrwOG+1AGCxv6Oq/gR1ihA0XHXzeLdP3fAIspLHql3vy3
	GMjzAShQk0/WxOZ1kljc8BNTfJl0So+WSn4gVftPHgJ6YVFLwm4m0o7Sy+t+XvDLcJ+qDtm
	3udoHMWqmVcIMA9myhEbRGqMZipuPJeuvW2dPlR37QRvG5qWq6p0lY6rHv0Oqt28gyas/tf
	/C8YWE5ljA6+BnpLN7BoftkeVQP6dkPv8Cv14qQ12cQqwtYKG5u6cPFmb3N1FoiZi7pmEDH
	bcDGSnrOhLOb7wETVRp3g/nUyTrF4ee+G5neP6iZlUMkKvmMOLkKpU1beGUP8Yx+WyOySZy
	NJkZ+u3PXquZ4Qhfruplpro0dIEG9NmyKpxg9gdi8JVArs31cRoTFlJPxuvXYHYRul9f9RM
	MJpR8foPpFFglu2m5jqN/0NLI0/eEW6mtQJ6QEqfsETe/lXSUJdWb0+c9X2XtNdI+6/ImZN
	pIEHj/AwpOvu7Auni4Z8hEU5soWAFx+PNm8ujvxvpvuhkO8FL8qFMOdQsOaXL+oX41vEf0+
	u/MkzF6Lvid+MoS58hc0pT+dIYO322VDTI8olgjTiJPZ6iLYSaygmknERwutaMBY7Yf+MzJ
	6oXPuoz1wxEkRHhfqM3ldoeApLBQuMYsQlsool0V59LOC10XBWCqkZqZ+sFqnjDnw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_003540_738558_E02715CB 
X-CRM114-Status: GOOD (  11.01  )
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

> K1 never touches DMA request numbers higher than 45. It's not K1 who
> needs the extended DRCMR. PXAxx needs them.

YES, K1 does not exercise the extended DRCMR window. I will
update the commit message in v2 to avoid using K1 as the basis for the
change and describe the corrected K3 register layout directly.

> The SpacemiT K3 datasheet still 'incorrectly' carries the base 0x1000.
> Refer to [1], Section 16.1.4.6 DMA Connectivity & Assignments
> which still states 0x1000 as the base:
>
> 0x1004 Request for SSP0 TxReq 0xD4040000
> 0x1008 Request for SSP0 RxReq 0xD4040000
>
> I would recommend you double check with the SpacemiT team to make sure.
> It's better SpacemiT can fix both the online document and downloadable
> PDF as well.
>
> [1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/16_peripherals/dma.md

The online K3 DMA document at [1] was updated on June 24. It now lists
SSP0 at 0x1104/0x1108, SSP1 at 0x110c/0x1110, and QSPI at
0x1154/0x1158, all in the extended DRCMR window based at 0x1100.

> Before we flip it, could you please confirm your source fo truth:
> did you confirm 0x1100 on k3 silicon with a real DMA transaction,
> or from the datasheet? It would help if you could share your
> test setup.

We confirmed the corrected mapping on K3 silicon with real DMA
transactions for both SPI and QSPI. Both were successfully tested using
the extended DRCMR registers in the 0x1100 window, so the change is
supported by hardware validation independently of the documentation.

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
