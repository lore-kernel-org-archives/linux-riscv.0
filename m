Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0D1CA5FED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 07:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoFcwcETCXSCLD33rzYxiM9ltNI8WpN6mbOgR7u7JAk=; b=oXe/2X2jHmx43W
	Gibk0/UPxoy5mZrdYc5OxcmpaZYabSb436ylPS0uCN6ZkukNRhZniJ0xprXoblrnEF7dR4iMurhPH
	27RrHvlKwoWGUJoNi1NSb80p3Jwh1AQawL87OUZoc5v1HVuJMruZ22wZ8ECAUX8/IUzgeTvNGZD5y
	xBs9tDjCNPABVz7VpcQ8T8ZgxFY9ExrUIHlD5Q3Pi8gEFsx5GhHjFz2fbgfgt5JBuNAHD2KgmDNUy
	R7KX5gb7CO+5l60nFNSxw5v85xNPtYfXWuQ4B2cEoaNdzbyqCOH3oUJw3LGbEwfxdXqMA8J2MJra/
	gK96dL3roQm+WMWVLUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF54c-00000005jHX-376k;
	Fri, 09 Oct 2026 07:31:22 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF54T-00000005jAZ-1eQb
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 07:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531047;
	bh=36LVwmIphhVaIHhFR1rx1ZN+NuqsGrJ+k0gwm0wt3jU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=RvJHe9RCqTZvSmWPkCz+KQlbKlsMJM235jPBbzLNF2NzYQwA3Xne1Mouui5Jk2dCV
	 EI5knJfz/0snT21wgUWJDgYaiywmo40IAnvSvj2LxXqhzSWWKcRM23tK3oTkpxaLhV
	 6lLC14/Ewjy0OFpDk5FAf03nZbhQ/3PQV5NgPac8=
X-QQ-mid: esmtpgz13t1791531040tea0089a3
X-QQ-Originating-IP: YbmnKKlF33JDTNYD+4VukpU3nvn1nyLOAbnrTkDP020=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17300880968877318002
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:27 +0800
Subject: [PATCH v4 4/8] usb: chipidea: usb2: add SpacemiT K1 support
MIME-Version: 1.0
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-4-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1441;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=zbXj26zXno+atJnbbmylm48F889Dbwwuwzg9UKMq9Ws=;
 b=yUXnKICubpT5RhsVMro1YnR3UasVnUQh4CkRfUiaL0r3/13xRgqC1XnanX7X32oVpGVnsjcZc
 MBMo8h50eUvDxvJZjg55cA99MOUR8oGGzzwHTerkGP7R2p/24IsShNZ
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OZw9wIELRY5O6nzgIm4e0KfsUXq1WTaTiZWSMW9lj6fciClAmADgnNYF
	7dg/BRvsbU00sI8XKNIwMats/HE2+5BWGBA7KD2xK7KMeNt+QIEYiaJCvudo+XHYUi1Pxo1
	kHxHWlGf64kxYA2C/xg8gnqg/2zX/SSmEbMvsycXAidIayJKbJda8/QEB2OQVyXcBU4g1M2
	ibMAPMkHtICSNmzN6aq0DOUOBKA2KlbdJSMYaI7isURGD0r63kJioI1NrHySFgWkqGLcglO
	ZTPL+r9OQ1FE3od7WLhgjT0dUszY1qv0TVOcyS+8ZwJd8l2j7nY16RvUEr3VcitwSPlAld+
	tAjhTpjp1YzsSopBjSNYcpdFvg3EttrofFfmrr3kVolvvQH6vWSqFIHJp7TzNqFpkA/FHUQ
	AkUrWM3V4C+1IQ6PiG03uCOgaHhIaTK3l0kBGa7+L0lWzSj2l0m+yQdDKN+eGzQYBsJjRnG
	MghaGnWejXKD5Em5nh7pMtVkGNMjxNbT3t+Utm/uyj42/mMdkRM0nctFEdKAryYQc5TY60A
	0DVdVediBAVGsnXZkG58AMBTwHsbYbfmbFyXxIFdFnSMvqvu67Udis2MyEE05TzsUZBS0Yx
	wY+RxJE9ticPd8mVQEVzseZnGWFERuGkDVzVZTV40k3wPW2XZCyPAGggDsM8WEJNZGgtysm
	ldCvPsL73lQmbkhxdcaGuyEEySiIOfqZi5Oggy5PJJK5C8E1t1VcxEp4dYLcHoLrmPVr2YN
	m0lvNxNQ5NFYxbNL9xs8E/2w53WLI2ecXKR04S0tg39Jo54AFqL/0LOGVMBpkOK5PSOcEck
	189Iojo0utPZPV9ifRB3H+iwmmlMDi663s6wEHyTj9EXlnDXanpj4o0CgtVZmp6AnTvy26M
	/+d/tTgO7E00xVw3bryFR2A1uY4ms6h0xYHL7ijQ6lnfJxklJeMV8Hg7Ho0Vvx+Q0v33Hxc
	HztgAu2nHfRnaDG383Bb8zI4wPUcNhX/mqKE5bEK5KqeTRTqJc3e4En940Py38f6SlwsExk
	pobdOP4iTOjwKIM3O3VazLNwBLqx2wP6B57ZlYMlY6FH1KH16lcZQLFpH9mBbilmhGobi/c
	mfpcfq+eZt3x9SAoSAMAOVpgaMhtcKSMoGa5UmIPPQSqqViXPdYCDMhB1uXfBYznXcC/nL7
	fotPvR7+wl3H1jKZlZOWcyhixLKVmBV8FrhI
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_003113_887993_ABC681CB 
X-CRM114-Status: UNSURE (   9.49  )
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
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 85244e8bbc3f..a5ed2bad5573 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -38,10 +38,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
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
