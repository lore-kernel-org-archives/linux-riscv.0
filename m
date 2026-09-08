Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F16C79FAD
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQtWMU/QrGD+6b/xuzPxb/bcfYJRVyJnDltwWlVRFe8=; b=c/BFmsBjSpAGUJ
	/jEmd3eJtu1nVin9xl6Pppywq95mw1SV3nYJE+ZIha/Om0RF92gGZetAblL+LYniHvZ1ejEteQNPb
	wTR/r35V58fpo5fXSuw9F9apsAdeQ2E0ZjPful8cRQ1eBH+0hQCl6vtgmmsRXLq9+fvO/jSn/dRQ2
	kgzxwDy+OgCAurzQfsfjtJrVkgVOknolf2se+EsUkLDz6TTXRL04y1HYv8wtmNUhlqRY319XzzlC3
	ofNYrLa7gKAVs1xwFxdMd+kM9tEVvqQb+dAwxlDg4NwbE3XzFkeatyWNF/2CkdELRIdFPKcGclRcl
	rHjIP9LMrjjWDkkOFUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSb-00000008fUe-1Aeq;
	Tue, 08 Sep 2026 09:49:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSY-00000008fQ4-1HOg
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2WvjZ7PRX5I3Qg2XYIm//ek403tVfRXRDNVPCfW/T2E=; b=XgOR1nhRJEawZvYV3hjSGHUVxH
	wSLc7uLJijnR8A1oOg5DY5xvjeG7iDD/bVvBOfi/EcW7qE7cRzyjUlYg/AnGnnOOcIS1NIJFP7DCX
	9EVtXAot4omk36ir96ClCfuL0tO/xIE6eMt+bRDq+o8C7kS99ZeKM2qpZ1GQ/doKZRK314pSx+6GE
	TpOcOhfQ2l/rOPLaaU4Ijb0auzPRfu99vg/P+b1eFjJGLpKKtO8rEKBNmW1XWkQsKayGOMPhTQtJD
	uqt4I5mcatQE94Bb12VediKB9tiTu4E/BT7oESlqdJxGaEjbgtMhua/Bk64wK68St5N9utRuvHzJQ
	9JjJ4uew==;
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sSO-0000000HE3B-1Vlc
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 09:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860946;
	bh=2WvjZ7PRX5I3Qg2XYIm//ek403tVfRXRDNVPCfW/T2E=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=h+sftq2fWcUbHhfh2QRY/a3xNOLat8kymelQ/YLafrsGexe9+6gXsCl/U5fjo+PIT
	 i1ClRyWZEF0wKnvuCzaHLhv55m1DI1OHza9gaHgTDbOOhEXJsao1t9JAXEJjsthPgN
	 hcvGvV7sV0ra7HHu2T4E24fxdXp60iO0t0bv0laQ=
X-QQ-mid: zesmtpgz5t1788860939t346cb146
X-QQ-Originating-IP: K67NAZp2kMQ0DPheEFDKJ/UAB5PtSPZqmekA8NXZGn4=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:48:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1522024227208835969
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:42 +0800
Subject: [PATCH v2 5/9] usb: chipidea: usb2: add SpacemiT K1 support
MIME-Version: 1.0
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-5-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1336;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=IE1M8cN6Hz8pu29bkuB0rkDef6vfQLYnTvp4f5E2F6c=;
 b=6KKN0+/uAPNkLpzGq2ZNRuqZTklBYwjTgwazBgUhCw3e6z+oMaS20+cGX78JGZtSwqy2RTQ9q
 El4BclTQPC/BnUYnoEQUVhP1fM1i/H2SonBzfCAULss1PaJh9jKoTSU
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NhLOoLKr81lWxz3EcjrWeeR5Cs807GfXyIIBZT2mMec0+/guWtQMTikn
	JM7N/zJ8IAIRhitlv6CnmzkyRf/fYg496fN/JfLVJRbJyTZtuPExlS8UVzkLhi6oQ+4vj1X
	1bV/ZCqKCGerzwn69BgHvZdPM9pDTv819iuifOW6CVIKktiFdxRdeUT8yLo/sKhz6RBzJ2m
	PzgFXVjq8MJMivqwc/HahluoC9Uf9tZkiVIWCnY+EAggjnCuvjjKUeDdiq0nLwUXyzqb3PA
	OAjagz/2n/yMeei0ThGzHx8AZXCdsQvfWpi2AbTFpt2ryFTmWuB2JhuoopIf27v+0uMBOLG
	hNrfg9Y45WfdVnxvQw20+X7TbOtnOE+0yJaesyipUuFRdw/zu6fnmdolVzcjwOUu+fMblJg
	rd7oatdY8NvQ+h5L/xItJ84qFKHnK4R5K4gaODwJ8SZ+smnAl/14wuuNZApvX+iEspwn1EG
	wK/3CAXcvLn4tdG7+donYiJqoNuuYc19Zh5zAuTinYWgCB1FLrxXfIgdqWcHfxTFbMHM74h
	sTs+tpEAzvCfVPMROkKOjrAwY7gPxqWPhhfPyF8yFkOA7e1T8r0Xt2rFrgyoQV+35x/Fxtl
	aAkP8k/GFMTY25x1VEIOQXodS09hGuZkuoI8L2nz7CAxQ2Cw4aw66S5Wyeo1fYNWSM1GeXi
	y3C4YeVbL5ZX5OKydLC2Ocy55J3Guv1wQD4/X80FcA96mPomrRxqNhtICsoU0QGK49NSFyC
	OAqvIefdw0SLkBBAk1N6PjZg0OdwakGuVG1FFvZZhmM1GDpkcaEnDhnYH5YT9ZN/TXVmHQj
	rbECEV/hxAJvPprCjt8KS8vEXAsKgDwk45QaEFHUc2BFg2rJS7Jb7zUWjxQ8GUH4oRw3akf
	c7XUlEBDvUEoCh4wnHOxKPwEwf7E7ONQQH4tjkN8d3VGtJLWWixMO4gAlFvQpILnQ8ll9r+
	YrZzvV9nXFQpxfq1McW+sWmWOtdFauqzIUss8qrUmoPe2apgLcKJTWIu5+fAXdSEhuzKWGh
	9NYOEBPdJUaH8jh+FpDLndPMEAoz/LBVvuAFO8tkRrbVljapwcLAUrZ+HTp61lAa1yiavr3
	4sMRG6culGm0u/w7KOMW05VQjiMOWFRiSPny3nt+GeoJBqOrmqC1ZE+2sPNh7CxPAPjZ4qY
	MhnJNmZ8HsNBXYNcxExAJRijuS00bmhiydmc/SVuPyKZWt8=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104939_084599_53509D22 
X-CRM114-Status: UNSURE (   9.80  )
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

Add a compatible for SpacemiT K1, and add platform data with correct
flag since the hardware doesn't have internal otg register support.

Acked-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index f81673edca3c..606ca367343f 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -40,10 +40,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
 	.flags		= CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
 };
 
+static const struct ci_hdrc_platform_data ci_k1_pdata = {
+	.capoffset	= DEF_CAPOFFSET,
+	.flags		= CI_HDRC_DISABLE_STREAMING |
+			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
+			  CI_HDRC_DUAL_ROLE_NOT_OTG,
+};
+
 static const struct of_device_id ci_hdrc_usb2_of_match[] = {
 	{ .compatible = "chipidea,usb2" },
 	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
 	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
+	{ .compatible = "spacemit,k1-usb2", .data = &ci_k1_pdata },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
