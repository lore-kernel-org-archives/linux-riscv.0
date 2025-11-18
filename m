Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CD3CED243
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 06:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BORbIwJJ39WHbYGSEawZ+PzxQNroyiEqMixJYimOv28=; b=iXOsp5v/tQ8rA1
	zX1FosbmuOHgGIDCr7KM5sLiqGfAZQbDh8I8IeRvc/2Be/KU1wzB/KHO6gZoY2T2olEh8K5EHs07O
	qdsl81gQk+BKRK3Ije1sU28hQTav4j9IfJg3tg+SvuNUjfxBIh/jR8uO3oGOv0tc3Rsy1EjVeNr/Z
	bvofwKlsd8Zqo3x3YNemrXXFuZHXkDjWP6TC6pTMGTCxIzj1ZUwPak4IU12Cvik1VRN0hlWRIScMw
	iA3g2ol+fJuaiiNZYYhF8GIfJVLul4fyz6m1GoEAsluo/6VpxtAQyKzhzJocY4P0VttV49WSXLwDX
	eQ2VR6VP9YST/vfiVxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEuL-0000000HTJp-3FKI;
	Tue, 18 Nov 2025 06:09:41 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEuI-0000000HTGi-2Yxl
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 06:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446109;
	bh=/R28j+sip2o0AzX0gvsfJgIDgUWL+CJ2iEXc2U7oVtU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=CgdCH7cQaEdxoPXVLDTNt4AIyseDxn0W+UAPfqBpsRbDgfWcLwvV3GSHF8C5p+ZKX
	 LKLulrnRflP5I+/BjT+hy+lxkOiMT2nfF0WuAlvXVU/da3zwMyCQbX0kL7Qp9q0ms3
	 3abWnq20c5hMCWivrh2+fTMN5xcc2JsEoh/LQnxk=
X-QQ-mid: zesmtpsz3t1763446100t30a9d698
X-QQ-Originating-IP: HMfRSA0C3/bJASptnEPMikXz27CdD8G3z4bOnI6LNzQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:08:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16781449544636721918
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Nov 2025 14:08:07 +0800
Subject: [PATCH v3 3/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
MIME-Version: 1.0
Message-Id: <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763446086; l=1532;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=yls6h80hLZJlTac4LUpPcWzxMBYeSjdLpDtBb4EbJJg=;
 b=dr7NO2Rl2NS1SRL2NLicVgng+DpAuuG3iyX3P85oi8i6vmNxhMmIi1rQq0P1D0+kuhXx+lQm1
 Y6KrtgHoA7wBd6WvY2Hv+xJl6oQIKUsPtdxrlgjcjgrFughsSecOqyB
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MaGQX4dAiUPTLP1LixvbreolGZ7yxG2ZHqvlsjes9knb2l0erNj9m/Ls
	MWg+XdxGWlxudmydL4xF9jl2cnJ3I8lQHo/LJt0dwokZLduppSeWG6Ix+YjJinIO0Dx+yiL
	g9qfB0MzFSyZdg+NTKc+Fpjuwa88Iz/g/L/IC1BqZ5xJbESrPbTS3O40+YYltVMoYV9UxlM
	ROgUkQZgyMaiJ4Twt6uhBQ0SH2kQRB2WHuVQH7/u/UWqGKZuMUd3/5ueWA0VaBKzPJ08Vw6
	TZiwfoJ+aan9/zHpxAORltw5X2U3B5oEdTBpBGavv29coy90b59zNQc2d3amN5hgBxckT1q
	LoZtuJTMj+QDvlIRoGSjRvO6tbxlsy8h9uBgvEFdpxOlv5X7JFdbRYO3Pct4KzdTTWGiJDW
	G/e8qEioWYFyRhjJybg52irg7qVP2JevZhGGa+s5VYVWvRNIec5VzFPMv/2E8UcryO+YUiZ
	w8n0f8pzQlTmtM5MH9tFD+meczIwGTHK2lJtBWtqy5BQkw8abEtLWa9vO2mPcuQZp0PJf1g
	SyithZrtvS7c2icjXExM7gwNV6EO92vUdGnxUnajCERko7ZKGdb+BcjQRw/sLtrLqntFqoq
	D0JB799uEHtcNjyvzH3kp5VCzCNXD2ehDQ/aBc01LeT8Kxjlb5XtsGbu4wicHtxT//INWE9
	v1r3O7yGMEfNTkKSsEwFTNAZdI7aLG0+mq+A9fraX3cCj+Tnxs6oSkV/vbj5flPDpWubBEe
	34S7fViCcANxEGOHlbyE7YMREQt2RahYhfAU/iRsP1l8K8XcXFRJ8I0MWOnQ6wPAHLkt5+p
	OGg9B+wJDflGmwBWb4zXSoA9+/mlTjntGl8njf2a87kwjiGd1CcZy8BFBQtC5QOXBduEswh
	2x5C7uhJqZtA+FnAS0+BYdeu4yQR/T0Ez0KJZUqU4vgeGmOcTJs2rATmU2zy0Z9tTXCp502
	yb3L3CHzN+6ZLlWDJ46k6aVy18qqY0dGgDnzBC8zUgCcKZw923X7KmWm4bwJoGdrN9plgYd
	F1zweUxe0vpY9xELrtsj97+YQ2XY7Nl9safF2uao9DErEMdXWu3S0/3G1yJykjRf93fqeLL
	bvxkCzRLKOfyF3asDKQCB4a/mvAfs6UuFhvOQvgovhvyh5CyCEBgs0a2EjUxDN/mg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_220939_185538_77FECE51 
X-CRM114-Status: UNSURE (   9.23  )
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

REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
in REGULATOR_SPACEMIT_P1 is now redundant.

Additionally, the default value depends on MFD_SPACEMIT_P1 rather
than ARCH_SPACEMIT.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
---
 drivers/regulator/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d84f3d054c59d86d91d859808aa73a3b609d16d0..e2cbbb90500189a1c4282511b8d7141301cae1f0 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1455,9 +1455,8 @@ config REGULATOR_SLG51000
 config REGULATOR_SPACEMIT_P1
 	tristate "SpacemiT P1 regulators"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on I2C
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default MFD_SPACEMIT_P1
 	help
 	  Enable support for regulators implemented by the SpacemiT P1
 	  power controller.  The P1 implements 6 high-efficiency buck

-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
