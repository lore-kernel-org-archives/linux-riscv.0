Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B37BCD5BAC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 09:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VD26g2aQ4ruerHmS7U46zCj8RnSJ3YhZviSIbYowZHI=; b=tw0wBJYPSIUKz/
	fNHPOvLh/m9VIaP2XPsTmbP51n7onUZdALfsGs+p9nxjp3RVJ4ZZdhAepMWacGY0dr5WrdQuaUl6D
	7pVLeBHrrl3SS1eacw0jRpJX7b4ClHq83EUoXyWj3kBDEenhTc+a6i9iLhxBVKHwSPY6SRVKPaYXZ
	Sxh/5e9C79cxd2y60sTlPkE4zRruByCxzYbD2Gq9OjR0bw/S+podmGVPlTq2nmQFQiaQ6i/MKjz7R
	P2Qx6LQItNVXnE3f0aZe3j8pSEdh9CjyNkMz872lWWwGGZd/wHkvSDShUpvq02PkJP/8b8UdMzaZL
	seymnVyYIj3aZn+uNPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLo0-0000000AGIU-1ciR;
	Fri, 22 May 2026 09:04:32 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLnx-0000000AGHV-3Cpw
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 09:04:31 +0000
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 85DA65FFAA;
	Fri, 22 May 2026 11:04:08 +0200 (CEST)
Message-ID: <a1e63aaa-1069-4308-931c-8140774d87e0@online.fr>
Date: Fri, 22 May 2026 11:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: set console baud rate on OrangePi
 RV2
To: Jennifer Berringer <jberring@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520111150.3300707-1-jberring@redhat.com>
Content-Language: en-US
From: Vincent Legoll <legoll@online.fr>
In-Reply-To: <20260520111150.3300707-1-jberring@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_020429_944768_3ECD196A 
X-CRM114-Status: GOOD (  15.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Jennifer,

On 5/20/26 13:11, Jennifer Berringer wrote:
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
>
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> ---
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7c49bce427f30..07dbd292eee33 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -22,7 +22,7 @@ aliases {
>   	};
>   
>   	chosen {
> -		stdout-path = "serial0";
> +		stdout-path = "serial0:115200n8";
>   	};
>   
>   	pcie_vcc3v3: regulator-pcie-vcc3v3 {
>
> base-commit: e2518e8cb1dde64af2d1bb246639bb7ef7523f7a

I did the same patch, a few days ago, and tested it OK, but did not have 
time to do a proper submission.

So, if it's useful, you can add my:

Tested-by: Vincent Legoll <legoll@online.fr>

Regards


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
