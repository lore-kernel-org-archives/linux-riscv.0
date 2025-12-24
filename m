Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AF5E74905
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 02:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+o80ITY3Ul6Bn/NGM3rrlNfjbL9+IHxe0H5ev1Bl9w=; b=RHNngSVNqMA0xw
	e2EcxzBNfli6R00N9vDsG0DwtaGL6IqF/GBso9OyCshCn1xp+I+8fb2M8adzghP6xVU89AoHm7XDM
	LJQrw5vatd/+ij0ME6zpjxm8NTfpMdu2L9VqE65yAI3WqA6f2p2WhHiC5HaA721RbUh+4XH7DwG/w
	rCoVHswtWpOpRMmEmNRD1gIu6GvJOQ+n4/AEEoGc58rDe7Q1K77gbhPHkDpBLJCT+YoYe4gqUFFra
	yMxXSTTu8Vw5Krb70e/xbOOXNZ2HEC8fOLhFFUE2XGwNiLpldTllJ9/3YjxeRIZBf25dn0yhmh8mf
	jNADdjMFG1zhVR4l8C1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYF46-0000000GL0b-22pH;
	Wed, 24 Dec 2025 02:57:30 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYF43-0000000GKzi-0Eqf
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 02:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766544994;
	bh=kqmD9KzPofpBkzhYXj3pS9Rz14dgYcaXw+mdYqkGSmU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=OQoHIOspfBKFLmhjKkTuv/gh0sTFRGK5Q2nEbbos0BPNKxk2DBJfDO69ZWI1Ec9Vd
	 jmAra/QY/HDExEoYbxa3PEvG2k/4zLv7mHyDtxKbVWirChOsCnlxXTD59Xi7zPDgfN
	 FyFwyGpoES7QGFpbKzRohuLi3yrm1AYkqm8hoIM4=
X-QQ-mid: zesmtpgz3t1766544992t73a38fc5
X-QQ-Originating-IP: rtoro2YV/3fXqeddsOLVmiGvuBnIxcaaNAkjFCG+GJw=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Dec 2025 10:56:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15150131563580533562
EX-QQ-RecipientCnt: 11
Date: Wed, 24 Dec 2025 10:56:31 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC
 support
Message-ID: <8840B91CE3D9278B+aUtWX6fizXnheGMl@kernel.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MfJtHqZtrd+ORU4zn6lBUs2gKRknHpX78VxNZ/1kWuCzh6l+l2WAA+/T
	fad2+uhblq41A5eaTtRDLaAQRcfOeqIp7zcaPTSL/gac3P2n4O1zhCgXSd713Gcz7WKiOLa
	kXmXqiEq1x5zNYEIrzfsbQyaU2HfdqSVJFhUYfvFkarkXMqdS51Qnr8t4VfeQDpVocu62Qe
	9/rEg5f4iL49FGvxbIYtNlc4/O+CDuQTS/iXXmr66J/vl42+doHIY5PBQp0HrOWs98k+CM1
	qfpl21DKr/oZBjB9JTBv9N3YPy+xMq1WE6TDdtHUo4mkyEsGZfjQvK+vYM82WtNHa0vBlmX
	c4dQBiFsohqzLj/QMDlfHET4h4SNqTcM2y8LqV4VJFpb+17yPwLaXnrHhDDLrH8cgen/vI/
	vofbcufut19cQq2ueMhKBqZwlV45aEzpSq+vnhqLvK8MhMapeSHjxVlWQ74aCEleAWOwdES
	TEKZ1XRNCapQhImZJdum3+vp+iPA3xDDjIUFLAJ5CxZ/SbF2SOpB1X8zFTv5CBD46/D4r68
	NmS1W4mkta5uneU7vg1Af/K8Md5xM2LrtVa50ftxY4Kr0u67DZeDoHsn84exRUq77mkThAY
	WxZaWMDhd8SBJDPk953AltRx4VTdKfTljgzm8fwnBhJiDAM3d3d5tRVzx61Z/GA8GtF223A
	2aDRiiYaHXyUyTdEcnc1SuTkN584TX8mwgnmzrE/Hnd+GHXYokmJIuTyqX7T1HhwqamHCUa
	S2jE11ovs2HzRSnVkZPsgJCMpWEKhFvQ7driar/i0UgXlWedHrsaIMrOfbXaPl/J31YRBbq
	jO5jbrgsJ0huj2Ohqj1wZt7SQ+cmWuhn7uUA2+Xo5sUOfNs1hHXpHYnol2gQl90+62cZQT/
	ShyoyccjSE7KkjJKl1e03gdQWe9Lu8F922y6auqoCOhKcB71PWeccvBbGnSPDnIzgwy9u6t
	k3iQJNFIr84cjPh0mko7FusweS2RjrjMyrXgjL418mM9Mjbg/iXDu31V+y9vZzZbmbqeXW1
	FxjF9E5GnwKQoz1Zuq6npCZx8XiY/Y5iuU65G0kw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_185727_870932_CBBD8F94 
X-CRM114-Status: GOOD (  12.92  )
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

Hi Yixun,

On Sat, Dec 20, 2025 at 06:14:53PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index d80e88aa07b4..c5b0218ad625 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pinctrl
> +    enum:
> +      - spacemit,k1-pinctrl
> +      - spacemit,k3-pinctrl
The drive-strength description should be updated. The driver uses a
different current table between K1 and K3, but the binding description does not
mention K3.

                              - Troy
>  
>    reg:
>      items:
> 
> -- 
> 2.52.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
