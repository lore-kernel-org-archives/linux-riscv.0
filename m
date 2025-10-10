Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7222ECCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 01:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SN+jKFL0b8FtAM//qygBQkd1Cvcu+QUubXj6MbBsvY=; b=tU4/OgHX1SUdtr
	e2jVO0joyVOhhYx7H/WY0FjzbjYRv+Caubvipqb5UhJIqO/en05h0JPI02edghZIjU1eJ0M0dWgO1
	ejekzuTHmEJg7aFy3gZ6jCl8bds0RhUrhmjLOGn2LBXETp4rtcdtPklzrjDctwYAd9xJGszMC9fDw
	9DS0l7dhrxelOAEnkk/sm0iTqrz4gP8lZdck1Q2LE+vRkgDTsiEMD6qcbO3ay/XOSyp3dNw969K6t
	il6v+RGOiJV5RO6KJefZdvKeuGC9qSNafFhTZVCsB8cVnX6CDGwunJ2CKRb068gYOBEbEz/1l86w1
	Hy2DME6ZqgHZoc1oI39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72OW-00000007T15-42q1;
	Fri, 10 Oct 2025 01:58:08 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72OU-00000007SvD-2jh4
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 01:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760061422;
	bh=BNyJpZwzwt79VmZFwQ2hwN9MxGf/PzqwrerldyY4KOE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=E3HwNOV+GAXp3yYjW3HmOYkY3XSOT5+97hJkpzSqQqgr/JHfsC4CdQpijjtsJ39Co
	 HlwDHS62TMPCmOBTRh4ZVVLShU+8wPuSBWOrwprwrmJi/CkAei91DrOsSf5pPIPH26
	 +bs0kUKojV840OA8aMdFYQ+KKBG/Qq9TDAuJk+k4=
X-QQ-mid: esmtpgz12t1760061412tc9346fb6
X-QQ-Originating-IP: CpqcOnv69DjnonDbcIVMVIhKDSAZiIgHiG/X3MhjUds=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 09:56:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4019892986896641376
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 10 Oct 2025 09:56:32 +0800
Subject: [PATCH v2 3/5] riscv: dts: spacemit: enable PDMA on MusePi Pro
MIME-Version: 1.0
Message-Id: <20251010-k1-musepi-pro-dts-v2-3-6e1b491f6f3e@linux.spacemit.com>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
In-Reply-To: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760061399; l=740;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=0w9bve3SGLrlFd9z7MYtKQ6kWXHe697KHcshOSbgu0g=;
 b=/6He4zADj9M4UWVv+2hPg9GJvLBQedP1U3kNhiCdEPrJwZs2IJw9iN8ePNkuIMBwABwsAJBD1
 t7mM5Q/ZpZ7BhBmt1UahuGOuKG4jWo+gdag0UUoaOBEgJL6VvAGi09U
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nm9Yh740L7axANQfGVqRT1p/UUOD2eOmLadxStwK+Unuw0vgVOMqouKX
	Cv561/58GEi0Hy+TUg1jXgvnjCPotK+6hL1vSnyeM8ZQpqVOELipOfM7tC4AaR+FlE1J0Ni
	pwSHa0vyvcl6wDFy5vU9CHiqF+2IaU2RWVrlAg/mroFGQKKNyCa10cgB5M73t4Vd02rUVtr
	pNo3FP3xE++MwTVMWP/s8xar6BHMIm7OOT6O2NosISti4ZJ9ZvtdKkoRWo7s8qUtn/BWPAw
	pdEb7QwsvAbxb23ehl8rQMm+x1ix1+c2huD8KdpXzthjirp6uv+jJlgOvgBrh2lF4hBkNQ+
	rfRWMXoY2x1FnFEl+pPNwgDAWZVIxG5VUneRjZKzNhifK2eQLV/xSpiT+2kPZGUzNYaVdIg
	bxbv97ciJOXL74Tok3gOrHCAU9sOqLyrA18A7+CLCRQSCF1VACE6oR9FEvGiY5uzW23yRfJ
	GvYrBgJ2WHHLaYx3it/1My0KSfCqyqiP0TnfZbsafcdR/hWiC8KKYPYT1sIJhYoAeDHJ8eR
	NvS9CtkxCczNqeju7Q/Wuja3ZFZFfG/zX1zT8hLjal+nQcc4s0YQBJ/DXY3jWuYD7USPA3q
	ap1/LfR4n/+FRmAMP231882c0cr6PwnmDlbFS9XNpZYfSTAVBbee1XDdh0s0jnY4dxKpJQJ
	O0+5AstW1AL6xvmKigl4tKllCdfrqxlGtsUHlEliGpiZUr5pyttNqPCkYaLmziQDuzor0mO
	YLcZupDkeGD1RyBUj5dVCXhOjcs9seMpV5ej6hKT+8U7Bt/jFXUExaVZAtiOGzZ87oBUHX1
	34h21ZtA99lvLe3DKIAJ4ZYVxIAjB0WIt9ltlstF406i7sFcVVgtQ8g7A0gjR0Ixuyb4djn
	0Wn4fETPMi57dvGWop7BtCCCUs3juoQdrsBiL5ON+EMS6Ol6N/ZAvKAe4E9Zdco9hEUhv2W
	E3dLsiUQiCcwOWzgTV9tP4JwAcbr8oo7CUXVkhByA90UBfZF4OXsEp/ucF7zskV4i4GW/uM
	yC5VN9eyd7IpwYLp6BcCisrMljXuKbt+6H+C/p3iMca0btf5xGoOe1NBt5g5KRsa7c2WJA4
	5jon82jbM99t01l7sFfrDfAFYZ3ZrwKhnfsEl4gKdt31Stx1z6fzwA=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_185807_037378_044DA4A2 
X-CRM114-Status: UNSURE (   7.78  )
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

Enable the PDMA on the SpacemiT K1-based MusePi Pro board
by setting its status to "okay".

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 49c41ce785cded31c9937d8244d9bc99dcd1e1da..7ca3375910a3da8eaeaf1a7d5398616d928aa875 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -33,6 +33,10 @@ led1 {
 	};
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
