Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521E6C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bt8QKB5oaQ8shK8W3mOFCoi4d2BreAWxGGNa14MFe4I=; b=CtAN34cV4oPsju
	BzM8K+XTqhczPhHptznHA7vymXRf3aRQEZqoE/cmkfG7w1+0bTIfyUj8EHLgU5juuibcuY94zChsG
	K6LHRDkaTt+NIinTCuhrYHEkqWqnVUloX4dO/mIs1QP0DRfKPlSHqo5r1g01NOWJa3Or5fPEfzQS8
	TVraDbT/QBCHiJwFHo3woYb41s41Y34eUKNoEpG1fh3HesWageo/kYZiUNvnewR4er63tz4O9//ua
	36fRGr9OK7tEvzCFE6RuinQk/JRYX4xnrGf+fXIQH0RqSN+BFRCYucNuAOAfs2ozsNLevdIC9UGlN
	uaBn+Ou7rxSABFY+hp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiS0R-00000006JA0-26QO;
	Sat, 11 Jul 2026 07:20:11 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiS0N-00000006J9F-324L
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 07:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1783754367;
	bh=ngWbz8DrOWdmcWpLkZogRY7ab+fCnSeo75BW8o2EQes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iQSoRTtQZRu/nW1sc6xNC538QoXSWRk9gIIv9Cp3eRJ9B2AIb+II9nmI2QYNYcGJZ
	 nATa6FvHJO86pldUgN2951/HhzAw6O5l3h2RKu6gsWvoNdDC3kWLt74trNQL3w4/6j
	 dWhG/bcZ2VxuQYPlkBBILuPsCrOpjDHlgXprU4Y6B/BU/vcxuoZs7eOPeOnIY8Taap
	 lRk09eUVROo+3p0S91KVd0UaQrz9IH/c5fzz4IGXvbHC15fBfWuflAtwfd+owb5cXB
	 ZpAxTcMkpOFhpeeaVAUdTKVFkwwJoZtrS9hBPjC9zwaJtoNL8Wg46WFlAnDfSVA6zC
	 mDgdgi/kjvA6g==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id DFDCCB2215A9;
	Sat, 11 Jul 2026 09:19:24 +0200 (CEST)
Message-ID: <65498313-582e-4891-9468-a38a76cb4626@freeshell.de>
Date: Sat, 11 Jul 2026 00:19:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260710063314.1030249-1-inochiama@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_002008_226275_40F23CFA 
X-CRM114-Status: GOOD (  14.98  )
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

Hello Inochi,

On 7/9/26 23:33, Inochi Amaoto wrote:
> RTL8211F require at least 50ms deassert to guarantee the register
> access, 10ms is only enough for the PHY reset.
> 
> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index 1eb5abbc61f9..b2a7d2d0d3a8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -200,7 +200,7 @@ phy0: phy@1 {
>  			reg = <1>;
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <10000>;
> -			reset-deassert-us = <10000>;
> +			reset-deassert-us = <50000>;
>  		};
>  	};
>  };

applying this as vendor pre-installed u-boot runtime command modifying
Fdt as...

load usb 0:1 $fdt_addr_r
/debian-installer/device-tree-custom/spacemit/k3-pico-itx.dtb
load usb 0:1 $kernel_addr_r /debian-installer/riscv64/linux-custom
load usb 0:1 $ramdisk_addr_r /debian-installer/riscv64/initrd-custom.gz
fdt addr $fdt_addr_r
fdt resize
fdt rm /soc/ethernet@cac80000/mdio/phy@1 reset-deassert-us
fdt set /soc/ethernet@cac80000/mdio/phy@1 reset-deassert-us <50000>
env set bootargs 'initrd='$ramdisk_addr_r',0x'$filesize'
console=ttyS0,115200'
ping 127.0.0.1; bootefi $kernel_addr_r $fdt_addr_r

...before booting 7.2-rc2 and debian-installer initrd is successful to
allow debian-installer hardware probe to continue with the network
device, on Sipeed K3 Pico ITX. I don't know if that is a full fix for
the problem I observed with rmmod/modprobe cycle of network module but
at least it is resolving this trouble observed from debian-installer
usage with K3 Pico ITX.

Non-functional values are 10000 25000 30000 35000 39000 39750 39700
39600 39585 39581.
Functioning values are 39582 39583 39580 39575 39550 39500 40000 50000.

For this particular hardware I have thus observed an exact minimum
required delay value of 39582.

Tested-by: E Shattow <e@freeshell.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
