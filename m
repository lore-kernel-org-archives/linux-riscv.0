Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6257C433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C2E64E42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C2E64E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WMKUUrQCbcO+nF3Bv2V20DdXycmeQ/4m+KbZtp7RNZ0=; b=AkBcwHKr0yBFBL7sYysP8GOnL
	dnBejf4TdZuRgS96WRyNvq71V82gNN+V0Z6i/57ZL6Rb32twcxGY1uHnujj0CiCNYQzczFXmOzkxz
	cMfpBZR2X0Rc35g5pAwtgb1dWNNdQ6L9H9XTS3Yp3v/ec4+wyE+YvNLoiGDgINpCmwLcBwQAyfcTt
	Xy0wIQXp4Mb8UncaYwSuDuUuexEQy4im1TV9t0TvPCZqLu8mq+uNRXq+jFuqj2vAl+SbszI7KJscs
	Q8Apnr7PksMQsiy4NJ0e3XHyD7E/UeIM+rasZMpl/pFxeUk7S46GCZNdpnR+ATfEbiXwQBX1dWLsO
	8mYcTUkgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9heN-0003Kr-Qn; Wed, 10 Feb 2021 05:02:51 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9heK-0003GM-Lc
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 05:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612933368; x=1644469368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vo/OPIAjkDR1OdjdExr2oFWyf1l5b2KQ57/Uzl/0wR8=;
 b=jHLyAJHTmQwAsJ20PGHIucc4ltivoCVjd+p8n/5y0bSmyJQfEGt01UVX
 oXrWnnneISS0x/epIf9BoCL5/6ZohuBAwGiXUigT4qv/KesxGXN4Vjd2h
 SrfIkeo9/uJ8oEsMSrhV3rtcm7cvYoCPpTPX2IXI4f8Qb/GCf0bjKO+Ol
 SLYdi1vbZ3+1EBn9iEjjXbGM82Je8F1QF5zccaX0o1R5s677klb9qAkTu
 m+feU89IQshVfQDyAMPjYEnECrKNDcLsBMRr1MOWrZKFSDwa74kU9Vj5w
 PZqSPVtX+XHWfVOhpqCnYHlF1hIt/pCy8k3eh8zB5JRvqhTaqJayntH5O A==;
IronPort-SDR: CoaW+/Ie731n+2ZHcTBcoIXaZUVm126JIBGWRMVJZ0ubgE6X8Ue00T/F38Nz5RW+aP5L/w0g+N
 W1pI/Z7jdp/FnDwuBIbos5IougxhdCOU5Fs3dNvoGqcEciR1AyreagRDk3Iz3lxNuAQFJ3wRgC
 Rcss8k00EuksLqUIIwmPxIOIM5Xc5QgaPSQPc6s/DDkOq1JLHdTPRC+yRz+LXlEZrwRNp6qKVh
 B7W3PZXTgGL0VMs2n1V2XQaDGoJln9scM7U9s3rdHbcKYgf0Xg4W5yBlACnLNrBdBhVi2tHBbe
 wjA=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; d="scan'208";a="159592684"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 13:02:48 +0800
IronPort-SDR: FTGylzFCGvD02Zc4Wufyn8zVsO3cBYTf0Cw/agou0VsyHG7c8oakHj7+udhJNLzwHHm6hLY0eo
 Rioa/f7pZC0BaeqfE44jPhszv8EbR/XoEDlVePwlOFu5O3/BeNujydQC8RAMuAdiv+3zATnnxE
 7IRuFdENfT2r+E2WaKRKy2f8NTj6B3jmbMEAKEPW1v15q0fojA5HF2m8RUaecTlkUSvtOCgR/V
 eMZDZPkh/tizw5Kij6f8zz7cSp+/xdRLhQa7M01VH+iWknHoQ2akerKhXEUm7JJWiHxlYlWQWg
 uG8IR6D0eKKCh69kEiKWl4Xs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:46:31 -0800
IronPort-SDR: XTr2rBgc3vDiNsMTdefPpsf6sdqWbU6cqlmF9R5Ij7W1fF39bGJKt+L9hlLCsFIuezoj7w477D
 C04IkPMfp/sUR99xBBGObNwhk/3tnFIMdwad+GEUledZ2r/deMJ/hAnbWzZI2reuYN3epQV2x5
 UQhozPuUve7GGLtsXVccRoSk/snMjYxvNxEsUU1TFaafZzwfnv3Pqt6jShPTh/xx8TDoQYQc+s
 /lE2qIIOVXmIDLxM0X5Z7fyr+y+WLfgbBgoAEyHomfCWRPUkRFnER+htJ2xMdvDJSh7hVLMs15
 K0E=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.72])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Feb 2021 21:02:47 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v19 06/17] dt-bindings: update sifive clint compatible string
Date: Wed, 10 Feb 2021 14:02:19 +0900
Message-Id: <20210210050230.131281-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_000249_265669_49C600FE 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the "canaan,k210-clint" compatible string to the Sifive clint
bindings to indicate the use of the "sifive,clint0" IP block in the
Canaan Kendryte K210 SoC. The description of the compatible string
property is also updated to reflect this addition.

Cc: Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/timer/sifive,clint.yaml      | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 2a0e9cd9fbcf..a35952f48742 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -23,15 +23,19 @@ description:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-clint
+      - enum:
+          - sifive,fu540-c000-clint
+          - canaan,k210-clint
       - const: sifive,clint0
 
     description:
-      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
+      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
       Supported compatible strings are -
       "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
-      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
-      CLINT v0 IP block with no chip integration tweaks.
+      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
+      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
+      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
+      integration tweaks.
       Please refer to sifive-blocks-ip-versioning.txt for details
 
   reg:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
