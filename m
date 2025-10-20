Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946C9CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6SZizcEnb9v+ebg38GBQTKTyyCW1OB6VjhJyRi55FM=; b=mMyLr0zYxL0GXq
	Fv49BYMWe/da6Tqz9Ky+AbHBFYS2ruqCBCrQffxEhPcH1gghooTxo5bIVJWNNfldeAeQp6+7Bi6nf
	jHGBWuL5qjAOES3J6uWzcYDIwRxWECyJ3mUrYjOcH7u9C+a2JiSxCUhzB4EbJl5dDwc9NQZsSqAsd
	yB8kb8/whr/CLHphayBOSCz7nG4X6+b+HQ8t7mqzZq+7WqH47uOUwzh+9eFzHgEX0CmoKCM/wLYQy
	yZXRXL+OgiOLqQtFcuC8daT0gaGAflDQ+uY6L05zuS19UWOemQTEIbYE1OUyFZLlNhYbo0PzDhtQS
	NkohRKTaKB1/KDdjn0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlrr-0000000CW16-1k2U;
	Mon, 20 Oct 2025 09:07:51 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlro-0000000CVye-12M4
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 09:07:50 +0000
Received: from [192.168.0.107] (unknown [114.241.85.109])
	by APP-03 (Coremail) with SMTP id rQCowABHknzW+_VoMALlEQ--.23805S2;
	Mon, 20 Oct 2025 17:07:35 +0800 (CST)
Message-ID: <002e0b15-57b6-4433-a9fe-8b7ce4b8dcd9@iscas.ac.cn>
Date: Mon, 20 Oct 2025 17:07:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
To: michael.opdenacker@rootcommit.com
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
 <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
X-CM-TRANSID: rQCowABHknzW+_VoMALlEQ--.23805S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4ftryrKw15JF45KryUWrg_yoW8Wr45pF
	W7uFsxJ3y7Jr4Iqw43Xw1Dua95WFs5Jr45W34a93s8tw1YvryF9r1xKwsxGF1UKryrXayU
	uF40g34Skw1qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8IJPtUUUUU==
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_020748_670905_11EF29C6 
X-CRM114-Status: GOOD (  15.36  )
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

Hi Michael,

Thank you. I had meant to do this after v6.18-rc1 (which is now), but I
didn't have this hardware to test.

On 10/17/25 18:02, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> Aligning with k1-bananapi-f3.dts
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 337240ebb7b7..2a75ca93b499 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -33,6 +33,56 @@ led1 {
>  	};
>  };
>  
> +&eth0 {

Please add eth0 and eth1 to /aliases so that U-Boot, udev, ... can
recognize them. This is used by U-Boot to set the mac-address to the
same value used in booting, and by (systemd) udev to set the interface name.

> +	phy-handle = <&rgmii0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_cfg>;
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <0>;

The hardware design of OPI-RV2 is not the same as BPI-F3, so the
parameters here deserves some scruitiny. Same for eth1 below.

I would appreciate at least iperf TCP tests in both directions on both
ethernet ports. The expected speed should be at least 940 Mbit/sec - if
it's much lower than that something is wrong.

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
