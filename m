Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A2BCA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 06:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnm2uYFPzavA7rz0duYoff/wnDrjuxvLcmPJU4A27qE=; b=hNbZw1EjXlI7g5
	KR8Gcq90Eq9u8bFY+SEQF2EQO41Khm5ZFLk+tNxjPNMGXv6orRLeB8xBAhWDkEPjspVyL3YmtgJto
	z78HaJEWrNH7tKj45a/32xoPZ8Xp9j4XrmzShqFEhU5ylOsbjrKW2F0aoDAHxbDnytKxNjo/cwRAj
	C3dyBj3/W9/+f9bdkot0ZFmHsHNkKCR6rT31asFpNPtkO+FVKzhBCq/wFNseHa++IP37zasA2oTdI
	iXY1PjbkzGkiD84sYBe0GBbKEiHUDjZPR8CvC4NHGNStsFD7NC3Hh3JooUV2sypjE+CWcCcspo/ho
	5qlIhozeBRa03BanLnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnX7-00000001ZrE-2Y9q;
	Fri, 15 Aug 2025 06:03:21 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnX4-00000001ZnB-2Hvc
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 06:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755237723;
	bh=x1N3D6/VxKcATBuZmB7CNiYmp7p5XE6OMaGosmRFbxU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ZvQMBdcEO+BeAq58t7Ki5/Y5ETbfy9aXNH7S2JN68Aq7S3AsR9maUmPxErnIOMV8d
	 KN7lEvC5gWdAbX+slW5kO34eKpVwTa7PKyuX8t9nKvbsbnw6jTtxV1ZTYi+V5M0Opt
	 EMr7b8EFg+SCZFCazr1gZN5QHsB+3nfBILL6/IZA=
X-QQ-mid: zesmtpgz1t1755237720taae2885a
X-QQ-Originating-IP: Awd2VcLVbmDqB933ZLJHIsPxY4Y//B/JRsothqN1eyI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 15 Aug 2025 14:01:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2894032038564909273
EX-QQ-RecipientCnt: 20
Date: Fri, 15 Aug 2025 14:01:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Guodong Xu <guodong@riscstar.com>, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v4 6/8] riscv: dts: spacemit: Add PDMA node for K1 SoC
Message-ID: <34485B93B03EAD10+aJ7NVbe8aqjWBFd-@LT-Guozexi>
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
 <20250815-working_dma_0701_v2-v4-6-62145ab6ea30@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815-working_dma_0701_v2-v4-6-62145ab6ea30@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nxus3gvQm1zh1qhgHl/I8dXfdXxSf15MEYxWIWXsiVl2sIxWs1+dUg7A
	98YcWasqCRSYqOU/mc+RbNAAYblebdW71tONQzeCqUAl8gGBRVPsm4GUtQNoiLKoziCnN9o
	oFuKDo3z1z0e44NKIhR7IQ9Ulqm3VMPiLJWx7dJqK3fNKsU+Y3s8eywkxI0odvRkn0POYVe
	D599FjxDIAguTKHZnle1yYwTFxS8L1TAmCMxrusI5UI0Ja3MKZaOEY+pivuQwiVjlna2JNc
	Ob9G5g9czAV29w4AMCKqCfYg6S1O9u5KFrjI6vIIVSNQhxtBO+A8tSwCchG45HuYijIVa5x
	v9Xa2zloYXS1D0ikIjlNmk6zeehNzbS0IJME4x3wFXrseG/QRufiMarGlTR1LI9dZCtxnof
	ORYGwQII0vqMj2ghKDQMznCKlesd/lYwMALXxfxF5Cl2PZG9rNbUuj+a6sdJ1D8ldZRDgfZ
	zWcWzftZXMD6ahYNoW8WR21h3juszGRgEtiaf5y7Xnwm41I8goa2X/fjDZ7jTsheFnecBpy
	iSMAipqD8Mz3R1SAxzxBoDiEorJpbystJWdekk38nX2dMDKx3/GRJrxA9V93Zat+xZagkbs
	HNI9EdlH9EaDgKiPRWV4Paatxq30qP9LCkmXE7T02kFbc1J8O4+E6tp/LNT35ampRZLK2x+
	y5z/eql6VjScPT0d7g9esyjOMY+r32YIbGpzubV5zE7L0qNdbYwOq5uqSQPnCGWvcYIsI8q
	QxXniZfSzxz1c7paqNzwWvY4SmHyKjN/jW1YR7HhTms078TlIpW99HnuePn3ClTDmlD06cL
	1gQKa2H/VKVxJ/wwd09nT1uBCBKYQnD4C8WeStkBsDRniDGKwdnCgL5qmISALdHqoU2kwBh
	VcCRI9ldQhTJmuoI1bX+AW5LKq0EfAi7s2ndy6pXNcsOIm53zcghx609aFQNB+KtVcZMriV
	IqhrLNl+eMWrkFMvnZKiCFjqQZ8SOEgjCpsOaFBtt4cbbDeCWyLUkJenImfAcYyCDHDloXT
	LGI3siaImWcCFH5oNXxgaCPSxMADoDusCoUn945NoIvuZpckuOKGrdUvaO4M+LscYLTtLIe
	tzb9g/gyolu2cWLeN0KXvg7UGFjt8yc005h9eI9Gr9HEmc2HsxDR4NA7gRGVckYOkfJYJ63
	pfsz
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_230318_976579_54BA7792 
X-CRM114-Status: GOOD (  17.47  )
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

Thanks.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

On Fri, Aug 15, 2025 at 01:16:28PM +0800, Guodong Xu wrote:
> Add PDMA dma-controller node under dma_bus for SpacemiT K1 SoC.
> 
> The PDMA node is marked as disabled by default, allowing board-specific
> device trees to enable it as needed.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v4:
> - rename the node from pdma0 to pdma
> - for consistnecy, put the "interrupts" after "clocks" and "resets"
> v3:
> - adjust pdma0 position, ordering by device address
> - update properties according to the newly created schema binding
> v2:
> - Updated the compatible string.
> - Rebased. Part of the changes in v1 is now in this patchset:
>    - "riscv: dts: spacemit: Add DMA translation buses for K1"
>    - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..861f0fe18083fa158da51bd3be2808609f6233f4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -660,6 +660,17 @@ dma-bus {
>  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
>  				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
>  
> +			pdma: dma-controller@d4000000 {
> +				compatible = "spacemit,k1-pdma";
> +				reg = <0x0 0xd4000000 0x0 0x4000>;
> +				clocks = <&syscon_apmu CLK_DMA>;
> +				resets = <&syscon_apmu RESET_DMA>;
> +				interrupts = <72>;
> +				dma-channels = <16>;
> +				#dma-cells= <1>;
> +				status = "disabled";
> +			};
> +
>  			uart0: serial@d4017000 {
>  				compatible = "spacemit,k1-uart",
>  					     "intel,xscale-uart";
> 
> -- 
> 2.43.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
