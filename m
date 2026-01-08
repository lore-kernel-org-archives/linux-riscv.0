Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F22D148AE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbgfIkJHByIorBM+A3A6ESg6aK9KM8T/BzevgivE8LI=; b=uETle39lHS8vFc
	cKCe6zGBDAWdoPu6nocjosJN7LwB3CgH4A4tV6xhReFlK2DkZqlP1wIFckBz5h89CK5MUDChKNE9s
	g0gtbnaqXm1RfD3i4/PA8WULezHCWND+VEmQh9ymrLUaNiznXcHB1XBURmo8I4VRRt1/c5cx2ng1P
	ozhWjo0bBygAh7dcXLwV/df8eibLaanjXNNqDwn3kRsP8QpooWRyLayj8nd5IFvCTIDk00peYDWyP
	o++V96DgSKJ8ZEc0subOO8lXdir2HjfhWHEvqXOV7O8DwLyvQFXnulriDslTXKUwWeja9HJtHUcT8
	NdUpxLNWpqB3JF62uPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjkW-0000000G0ng-0ml6;
	Thu, 08 Jan 2026 06:44:00 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjkS-0000000G0m3-1DTy
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767854582;
	bh=RmI7oW3Ye7H0Gv7gofrIS2/gqWoZQQpysgRh3vTjGSA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=wXgeeGF4Kx9PVcKyuW4QFiNIwYkxHN32+lYCa5Rs+yoap61jNu8ZNpt6oibW1wUcS
	 7XlmgdnLOiI2wxr8r86tf13MHcqlxuWhupvFqclx1147+wOeDp6a8wFlesOiCRkRrd
	 O9r5xTOONBLSS9MwokBF+hygkuJWqr5LpvsSfbFo=
X-QQ-mid: zesmtpsz7t1767854574t1b45140c
X-QQ-Originating-IP: nqhtGQEKzZptD8rA4rJPzNemzRzLbeCF+vPr7zaTLgE=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:42:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13233925994878137357
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 14:42:40 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
MIME-Version: 1.0
Message-Id: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767854560; l=1383;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Yg9i3WROboYmxNA0p0LX5mimjEeDeDaKPbSXU95jUTs=;
 b=00D5FRFx/hf/cFWmq3s6IJG6Z/e0lXKG3YIdSEnvh73fycgm0SkQ9AxYeRgxWbCZyqrDFCYYR
 wQV18mZxONpCcTvrinbhEzKwJDrgX5cV8RpKj4Lh4yKh7KOXM/7Br6t
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MocinEW0fRiy6euPJd6CFI6BAxMSsSCSR1kUo8/ZkITJOquTjxXCGcj4
	VtxuPX+CHeEJsFGa7Yx+rFAM5TShQ9EozW7d7YKTujhvvTpTxjeA/hbOdm6AGf8c54/DQJ/
	BhgP4ndZHiRpct2VAJzgY1wj7R5VmqwnN4lqXZiYWJIEsbM5xLWQvGDQeULFbVeMs0py9BL
	gSzdbuP+8PpmHK8RKTSmbHO8ZLb5bIENrD3baOng+yPFlz+XfOANLdxoe2v54Ey7nBu+fdx
	fi9rbbYLytcdhp+HyPAsc9JsbUujwRBlQ0Jw2MOBqgT8lclpbSurqFbDhAWDpqXaz7uQSMx
	Y67fVNdnhlk+beswno/hts9dGcZbS+od5INf01wT9Am0JgOb6pxIOJrYDYuF36veHDnU9aU
	hcWQHy1eHLxrUoK/pK3PFgfjQ35G/n7FCoRtYxjh++/Rq7tCLMfemXFxzfhJAn21VKD4yxu
	9dAyim9B4mJSycpfTf4TvHkKHvlUnucp6EkIOq3j5DkRkC4KZ7g4s1webV4yY6FicOWBlWx
	S00YyCQq3ppCkywk3LpsiUM9wi6L9BK1sdg2OxrKNyUuWO+adhzEwNWeGW4PWpc4lXxtlYW
	lpaTzqREBXil5UPycsEwnY1ChRnmFryw9XL6yFPwi8DpDdQ8RKqgZvtaSxhY5a60q0wrQRS
	pdcDPBLzjrGA0u2FS4eLuHUYwlUE3ecP6BFzhrXePRJDAbsJ9nBOnAUUu38t9JaNfKeikfC
	Vpf77nEVL4NoHuMlM72POJ/0xS5Sz4YtV1lbZhmoBVghS3W82XtK7i4h8sxwU1wpAY55Dkj
	fi1jJPXhsMd3OWjp+WQ8ML3u3WN7gM94j76+5U4orcGs3kMe6q+QcFXBVlusJEZwIUOUyeB
	Wq8O8y74rDSioMz6gmA2NbR3IY0Q2QnwDqYiLKGAX5GG4da2A/JjLXuhY0d9buJNaS56b/z
	Us+H7ha5RRgRJ6tTDJjopewdXEevJs9bTubwPXjKt2RG2cGjOkfQXscLB08BZrSE/aiB1Zq
	vguf3fYFnsuNGinvap/dDTuK/Wx3tX5lZ/1+/9Y2wlbA73b9cXDec0XFaFNVWqykedyDXe2
	3kNP6W55vjlGNgGLSPbyr7ePTYQ3e8C/37SNsVKqAJumjin5rRHSebICpOI9InwfCKpX/PL
	B9+IuwNaJkeXu/M=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_224356_743495_7A7DBACD 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

Change the size of the reg register to 0x1000 to match the hardware.
This register range covers the IO power domain's register addresses.

The IO power domain registers are protected. In order to access the
protected IO power domain registers, a valid unlock sequence must be
performed by writing the required keys to the AIB Secure Access Register
(ASAR).

The ASAR register resides within the APBC register address space.
A corresponding syscon property `spacemit,apbc` is added to allow
the pinctrl driver to access this register.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6a7755722919a5958512aa11950ab..f05429723d1bbbd718941549782461c49196ecef 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -565,10 +565,11 @@ i2c8: i2c@d401d800 {
 
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
-			reg = <0x0 0xd401e000 0x0 0x400>;
+			reg = <0x0 0xd401e000 0x0 0x1000>;
 			clocks = <&syscon_apbc CLK_AIB>,
 				 <&syscon_apbc CLK_AIB_BUS>;
 			clock-names = "func", "bus";
+			spacemit,apbc = <&syscon_apbc>;
 		};
 
 		pwm8: pwm@d4020000 {

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
