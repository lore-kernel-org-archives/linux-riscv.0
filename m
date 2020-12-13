Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757E5C2BB40
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5EE2250E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5EE2250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K+ja2fejkHZdt8IsHo8uWunrKO810BAO2Ms5sp/4LsA=; b=om9BN0ig+DEHqc25wlwq4WpVI
	/x2UwXOrBZTm2XrpHyFrWCy6s6tL1S4aCMYuGA1322I2R876EhE4ydXZkGF2DNHR3iIFTwuKa3H9H
	maQpGfqvfQaOOOU0dGVpkzMVm/Z8JM6EEeGKXiXKDMSD0CNxE9Jm/oz/UQgFh1PfFV0qeVGj2xJy6
	ehTVmG3UeAoS0zIySxV8pmpgEhaUIv/stIJ7LCGT3SnjWRlvpBgRyBi+la+OIfdnEbG2A1LeFLPqn
	YjDCI4KHtr5C34KhJ9SNBE+dQm8Hq74nw/vUkg7EZI1y+vjPU59LzmgQ/6n6XnlefShY513adR0Px
	yBcnWLOkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmS-0000G3-UD; Sun, 13 Dec 2020 13:51:21 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmP-0000AJ-4y
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867477; x=1639403477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3D8NTC3KrPCHvVVEiTgbfIPXRYhsMwi8saVYnSZKxqo=;
 b=gpwt/fOyxMOOfUVwJ9ROXM5e5jNvkVJOaj3wr63aPzJqzqqqBDzKIoye
 meyqaGpog603e8M/16bLp2UPDVscCQ+TsylBpK7dgwE+8Z9nUYZGZh/U+
 DcIq1kLy7if/9nqXxsn0G9XA0YG9I6i3OMk1UJZYN7ikmrbuwSQ71wOmQ
 1XnIAE+oo5/00biqCJBs7ZaTq39bPMlY7N2sky7D/XCSiAZJXwllm4zlO
 86TLaUI3cSd6IIsNyTdcxTSFlNUa0VBogOz+TM543Xd+F+0re7R05nSWW
 FOUXO5M6xItJ3ed8b4Oe5aXQE+Pjpz3LllEmePyeqqFTQ1fBdERX+10Zh Q==;
IronPort-SDR: MWArz84ssI9YRKtlM9dBXlo84hUmKng9HDEPdgN+mg1l48IPoyZyfTbQsPBYqVO6fbEgP3pnWl
 Cq2Kz2LzpIpVformyjfm6m0FNz95javNgjvVeRq6okMzMLNUc3DDb2fE9WI6qNfS5Nm9yDAkva
 183UAAxBflC7hNaqijkZ/ia+uWKOjTNJFmzQwWU1tR2KL0UqNdiONKt+pwQA0MtIvdGUmVqrjB
 IY3SnY/of47pSx670NCSigPOHTOcszy2957mYFsZ/kU1dkaCCuSDwps0l7dJ2r8AMaKneJGdma
 Ktk=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242569"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:17 +0800
IronPort-SDR: v1YXPX0uAHH7/pfrLxeKsx8NP+uPT0aR2FD0Uww6DQ8LzbmTv3dP1y5hRObc5C1QdSzqXrXiyH
 C0Fxcju/qcw8Ljj9WFVE7F2dDQsqrgM2cUE5JJjhpi42PtYe/TaeEuWtoVWFlasuzy+Wu81DX1
 UWM4hktB0e49KS+wrPdWbuNs//XvuKs+n6dfZjNYmv5/jF5TX++xZv1VErJSX98pNqgdAO4l7y
 QqCh46TuhZYyi6GzVYOLkLr9QtwxT+ypTU8y9Mo8XRfzA67eqBC2LPY2vEMpp/hPahHdQ7TMMW
 Hup3SBJO6DK0KpO+nbeVDOAR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:35:01 -0800
IronPort-SDR: l4m8Z/DvHEZ3IoUae9HZPOw+I8LMPAhiy2acixk1JLJoFWEJori+6Iw0pzYymG00wxqF4TQTWb
 H+lAzyepBdaG4Ff5NdBg3nN2onYGtzqa7E62fAhBeM05wD6Yb/q2wGdB12N884381y98XlqAn6
 OfQkFI0dTnBG4vOfyZ/2XbC/e1DTNuGvAqdZhuj9dbvQZMNF2xGVGPIXDOsQk3xfGjBFjn6a8x
 vxLQ2ISNnBNYubuxBWTH/uItI2XxUMHnHby7tuI/9ZgodFviZs/quUHa+H2NFvwFfUavUZFCiS
 Ng8=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:14 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 08/23] dt-bindings: Add Canaan vendor prefix
Date: Sun, 13 Dec 2020 22:50:41 +0900
Message-Id: <20201213135056.24446-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085117_344310_C48CD9A7 
X-CRM114-Status: GOOD (  11.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a07231aaf3e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -179,6 +179,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^canaan,.*":
+    description: Canaan, Inc.
   "^caninos,.*":
     description: Caninos Loucos Program
   "^capella,.*":
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
