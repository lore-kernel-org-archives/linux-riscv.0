Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC6B606A336
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ByAf+GVE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SIT75eef
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XKxmX4D6OjWbIg0krydW/FCsWA00R4k6hbIFNIEapZM=; b=ByAf+GVENjXsIvhTeZ3zKjmQG+
	Z9PcJYjqV5sWS5meknv9/4agl6Sy/p05+xljvQyYK/y8sgqEO4VFCvdpLrrB34WKqRrkEzA/Y/txH
	Mwx5gqbpr5X9s1DaLGtRZT6NAyFxfoRKaqEm5BgT92DlpVKAi24B3x93Rrg7Nfl7bkLHQTiWtmIXe
	6HAEOk093ohPdmUy1SNhvoCxBNLB6Appx3uUBUn+yOwcSElCdZ0J+cuFte2BM856yVPtK4iSPCtrx
	hfQDbwE3IVUkDMNhq2ZjSrZ34Rde50zXkfokxA13L+wQOMk2nGzar2S1lKhi9Uhs1r5EVHrnauE90
	+vVG9fxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITJ-00000005ecA-3wVo;
	Tue, 17 Nov 2026 12:39:37 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITG-00000005eUp-4BB5
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919150;
	bh=nP2xuNQZsH8znbKVANuCMDP5J5Ifn7WHvFF25qlOkpM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SIT75eefwQuoIcH2lZ9wzRuD9ACgU6cOyOBe3BUb3aZtKgHydvADn5mbnFl9Vodj8
	 wj66bFh1T8PNgosKLSCsxf2nOJKPhXbh25ph6FbG9E7Xe+sxjEP0gAV4rxPrmFkc49
	 nz7EyUMTl0QhIBz7NAVet/IfzJUoeLecnOcmKvrg=
X-QQ-mid: zesmtpsz6t1794919143tee230107
X-QQ-Originating-IP: +BVJx5tARnl0BqjS170OdDgH8xd/Hh14Uc1kFj+P5hU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14536568104907117582
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:46 +0800
Subject: [PATCH v5 4/9] usb: chipidea: usb2: add optional reset support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-4-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1684;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=xWCWiL6/aGh6DLTIfhzIR/GNKV2px/LS4AbhROpoUhA=;
 b=2jGoPSJ7yUHk/T3cldAxJZpdWWKkHruqfp1FhzNEgrwv5rf3O37M3S+EcE2izbeMhOfX2YFfv
 CQCj/3+KGs5AAo5kxa4MEyu3e8QZNn3Af0sOExB2YxYIOTP66KDE873
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MzOrCbSXFQdfaqAXeJwpOrKuQPcWuCqNqoyA0ASodfjXaz58mvjBcs5v
	JG6LeC6kASXZMzJVqwWZicChn+50HHKnwCeiaqHw2TxC5DlZTi/pr3easlNCWwujFCtcgFD
	5qYlKdevVFDuuAdiOYaFT7WflluG4OrNxwlH9NCevysmysqv2XFAPLC72V693+lfbWY60eU
	AWQuWjaEzTnik67TLxGPPh56VdzPk8sOUHW4RUbvjgtiRgCgaLJ5OHM8+4qXNwXCxO8kMEi
	JBF5jniEewir3Y38vekVAckhh1aK7SjHCng/DN5Ulw4R8FRk2dxpDfAkwpYW5aIT71j9G8d
	vqi3aKgShU0kOTJeJiA9PiunbcgnfEiaFGsR+/BNCl7r/DIxlP75Me/5qWfhWyAZOXMAtX6
	yVclH47QAjCaqoIua5iAym8Pa2ijHCcDgiF9ivHp9Hf1Uohw4SJti1Fohmb8WNNoiE1m2Wv
	MImdfOxGSiIg9QcFUdXvPes6drRuZKF2/BZUhypIASKOcW64fBWUwScPQ0cnK7m9zywzxLH
	Mw0enDSJJLhrB+esgWY5bzkyTGYMrjgktjXtcvfu3x9RmvuSPPYfPdcIepMcnlD2QuzC715
	nPuKrQRbMidhBJ9rYaJsZ90aujhwT+StVDLRToWnk7jGSizjNa0IPaJFfhDsB5sLc80VF7d
	jJhiw+hc3UGMeX/l7tu1xBqSx/cyy060p849rgku5kf5aKfaJ9ZCmc5Mcb8AeEgjN+ZSsZk
	acjXkTrKKcBtbClq8EHuwKMqjupLFRCmHJwli0Ng+xeyr38FwPFEHxNnTsLSOyLS3dlotDo
	d8hVdNr/6YuvH3KzfEB+hxH0MIE4QOn3U7SjhV6shvt7zstVry/L+ui/ljCdEPxB8B/pm3K
	nqnx7XHwnUOvIntdZHwPsM1yERuIFLSNfUPPqTms5NS/b5o68nejk4TiyaiVccuHYqniAK3
	PphIAHXLyd3ox0QAbWg45zUSKDDZiYkOzFUd8Ux/cpnKSQBiQbiCAwCi0fWsTUTzl0pbOWs
	wV43mb5naE/gPTjQKd06VnOLwhgP9YGajKZ7BfONzIy4j+rpcPclYSzobW7agOJGcB6RtcX
	Hoh6OkpPFA0XOvJZtg8Yesd8sUbf7eWYwJbcQ3MuLTFbrnVQoJ4eNEtoQZLs5Rt6sCPR3rp
	LecdDgLQ5TF1avBVQC0xTZjR9dftiLo65YMWqdepGAyqMMw=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_043935_426604_8506B78A 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
compatibility, add optional reset support.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index a353281e4e37..8cf13f0bae3f 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/usb/chipidea.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ulpi.h>
@@ -48,6 +49,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
 	struct clk *clk;
+	struct reset_control *reset;
 	int ret;
 
 	if (!ci_pdata) {
@@ -67,6 +69,11 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(clk),
 				     "failed to get or enable the clock\n");
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get or deassert the reset control\n");
+
 	ci_pdata->name = dev_name(dev);
 
 	ci_pdev = ci_hdrc_add_device(dev, pdev->resource,

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
