Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A402CF31B5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kUgAuKmJ6MbZRZ3xp+OnkZacUO4/ysNz6J+aS/fRw0=; b=kTF18yCl9OIOWY
	Gn9XMgNh1+qEj0BdMRo0iely252TnCay0xiT84XNSdkS0667ld1V5mHnbiQ2u1I4WJU64cTQfak0q
	XCY/cKq1vYVgUsboinO4qI+OYeUljRq8EuAWi8rCu1xxxXD1613xmr+oCO7LnQJOqyK+2Zva9L64X
	n59k5uGeS5S/Z1l/4C2NXe5Y/HTZ/2rKA76e0fZiLPJNuBlGmATCjS8K9bel/Bgfn/zvIA37m7FTW
	U20PXLbKRcEgADc2yOkK9SpDnV2QQqEPA72nJLROD5Le2JmT7coWZOOeccP8Mq/HjY6OWAOA1sJQn
	6q3kopMqw8raQ+HIfvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh1h-000000035mc-0YOO;
	Wed, 19 Nov 2025 12:11:09 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh1e-000000035lF-0gAu
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 12:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763554219;
	bh=bUQYuuw3y4ylwNNm7Ww+mTzQaIT4JX3LMF2wR4G9rGs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=E49KPFCXn0Bg1iNI7syy2aazbMnhvuCC2xOsPmE47MzAT+FtCVJ7vOt0hbDJylx4+
	 Ry8lSSLnpbntep+ivDAAuZRr3mj9hio0U7YDnjXqusvLgGYK9JmVzYffXQobbSa+Nl
	 181cJW09Lnm+m7POKjxsjs3Wm1YSSMkvDMEsKx9U=
X-QQ-mid: zesmtpip2t1763554212tc95165fb
X-QQ-Originating-IP: aGGf77+LuksBe9vkhr+82kA7Jz0VRutUqIXAUATstnM=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Nov 2025 20:10:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14706882879652884450
EX-QQ-RecipientCnt: 18
Date: Wed, 19 Nov 2025 20:10:10 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <676C7338FF05B310+aR2zoh1uDortXS9h@troy-wujie14pro-arch>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
 <20251119-i2c-k1_reset-support-v1-3-0e9e82bf9b65@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251119-i2c-k1_reset-support-v1-3-0e9e82bf9b65@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N4WhQbLQyIqSygHmBIqDmq+iB2BKjHgA6ta1L7S3xu7e5V4hQFJ7WYVi
	XsCaXMC9FMsZZfbRIVzvS29JRyB18nxw9Q6b0w3PoW3r5nNSH9CzhH/t1WVuUGq/SKr9L8O
	qQ1PcfsfWM91FZvBdCsQLiwsiDLQHj/8JG8PvACW9tPxSLlM3RtulUCghpBRbTrzVFdKNrb
	2vm08DsQkdKBupfXRLRCUPovgJKHbUW6eAlMEXNWzwJnb5OYB2/uOeprvKtwcLFpEbnMcGV
	vw7KY2tJNWABT/9E7T2L2P3cRF5YcU2T37thq9SFdluDhGdDTPwPRjECzGp37xKyDw+Pn+1
	4s10lbEXbcHhIE1MOOA1eIfFEDBAgRof0YSjnIY9k27lpVL8Vi41xVpKB+sUBosrf8gMSxV
	RBt8Ufxd+kNNw+dwN8CzE24rmntU9gaqAFPT3RbM9pzEvPvgLVP06xB41+ohBSlgxn2BlDt
	FWgA0jS5DcwIlSnwc8sQFaOGSSY/yHQh9VaWU/+NLuruIuye6vhyaPTeVbPiqvWsj7Lmuo7
	fyHRq2oPggT9lRDeIz4ZoTssgV8DAfWgD0WHS7AGi2lUG54nIUktItslp/g1co4a8/Cq2Br
	B86l1TM0uABxZ7Ag52R01Vu1RjdCtQUszrfyADrh4L5iMuNOZADaH9zCvgweFqoH1sINyod
	s0ey7YbNptNnlnnh7DEgt3lBnpeFQG5qoyfzsZRiZ8WNJoUMQOMfkRh4Ekss9+08VNXDanr
	fE/Eprsr0qJ/EEIyRZOC51Lgc3dIZAJVmFeSExIO/b7WLcND5H2oFuCDhXK/JpZU1Pyvxei
	E8tT4JguCcowx3YviyvNlshYgxrU0LeMe+F5SUDI+yXzri9jSCe5ll6AR1X0y5m4K/A/JPK
	sPqfuKPmEFExU7g7jolnqSkgsveBoySefbimVxU0QFQwMYDCWTbb6Yz2Xkz0rmP8AStZb+R
	rrSXZ1vq5mnl45WwYRgVc57CS6zWlTL5YOSkYTa9F6VXBuOUmzdxMcL8iEcukSdXEH6//i+
	L+NZFs04EhGmxSt7sS3vf6AR4hNZerO6CPeJFWVAdwRG4OmASX6Wb84pwwv9FGSRNvA531W
	3JnmmJPBF9qoV/EYviu5qiYFC3N2GxJqA==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_041106_574115_285509B8 
X-CRM114-Status: GOOD (  12.91  )
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

On Wed, Nov 19, 2025 at 07:46:45PM +0800, Encrow Thorne wrote:
> Add resets property to K1 I2C node.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index af35f9cd6435..2b84dc276ace 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -468,6 +468,7 @@ i2c2: i2c@d4012000 {
>  				 <&syscon_apbc CLK_TWSI2_BUS>;
>  			clock-names = "func", "bus";
>  			clock-frequency = <400000>;
> +			resets = <&syscon_apbc RESET_TWSI2>;
>  			interrupts = <38>;
>  			status = "disabled";
>  		};
> @@ -481,6 +482,7 @@ i2c8: i2c@d401d800 {
>  				 <&syscon_apbc CLK_TWSI8_BUS>;
>  			clock-names = "func", "bus";
>  			clock-frequency = <400000>;
> +			resets = <&syscon_apbc RESET_TWSI8>;
>  			interrupts = <19>;
>  			status = "disabled";
>  		};
Since this patch has been merged [1], you can add resets property in all
i2c node.

                                    - Troy

Link: https://lore.kernel.org/all/176294559674.467363.5417599191009488468.b4-ty@gentoo.org/ [1]
> 
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
