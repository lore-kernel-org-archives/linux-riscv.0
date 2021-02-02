Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD6DC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:37:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 266C164ED7
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 266C164ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bmb7xPbLPsy3RSTZQuMiLQjYEoL88mm0gKakUHoTN6o=; b=dSIB2Z3n/37Cuz9surzOo3oX9
	NIGYI51EMmcpHcjSb9tEzu0r6xa2penAQ4yel3hrfgxV70c70vY7Ql2BqyZSby5A1u0Sz159K/z/P
	F0NRT4mZhKFQ92uKnHJaHR2p1Ox7DclDigx+VmJFh2P8bxoaEUEPhmqOmmWh87t3NL6lWpTY373U5
	xWIEJoBoKJUOEvlj7KOzOXX3VPI3+QS5QyvVlehxOCHzhykpYDeh7AuDCMKdA0le0GPSNTOmfXGmR
	6Ttq+d258ilBge6pxtVYtYpl7vOUiT82qQqxbxo7CeSRfYTRV8v6BPUSvTg/YSCpifWnkh5n88u3H
	qKXU7BXng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t3F-0008CD-7a; Tue, 02 Feb 2021 10:36:53 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t3B-00086e-Hz
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 10:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612262209; x=1643798209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lZzHJ95UHiDhalCyr0UWnRyqs9+D5T06N5O98Kg5LfU=;
 b=a92EDdUG21eQzUluujau55RUMfVvJDSka4W41NWqOz68riwHz5q98Oir
 X3quy4AJWTUplHZNje+mNhtzmaFBrAM7ag6D8N7kf7J+KGuluuOhgowKl
 234Ngc9eohy/yLedAtdW28T2bPImqNKjLjtY7QRryfSttf0lpqRoSvtzi
 GZEVQUQBIPH4TMNsQfbPBgGr5qP4sgAh8RZQZYrlIBP3P/vEY3B0MlEdF
 UTTsAKfucUbMBgxj9uesLZG5MZKJavqjgRMWGloDW7d/JfZv9/n52bUmO
 At3Qar1MWuSfBG9kHzaA+DaSwOfW00C4uuwvwXNSWTIQ0jOWJa4TLqimQ g==;
IronPort-SDR: pU1iWOOVPq2jfkI7msrYjD/Zcgp3QiRHuRcwAqGnWjAcqOAftN905PHJn+SAGNPIxLJBPSU65t
 4o82xLXnVoQk4MnOoiMVTWx5H+qLFAesAhPVVbjqRQXGB8YtJ7SeMbQAaUG5JeDvVdtbbT14Sc
 HnbSabQtDoz7S8VC9e5Lp9G/ynScXdUxr+61NpXptmFctkJyzlLPU+YBVfXmnBQkXTg95t+dCE
 Ck2Aa5aQKL6EXJ0W+2tGihAwphDKdk1Y57E4aoGDL/ENTqHaJqhTRVb8AOjwsVALbkRdoC/LKn
 HjI=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; d="scan'208";a="163357066"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:49 +0800
IronPort-SDR: UjIPE+tvpVeotUGImuoybTP/8wSF6TwRtbWOwiUbqKED+kAI+sEvrgmpyjg+I7XhbO/sk43TQB
 BN+gmsjImlVFmTNnScJv8z/N+V9cRM8zdWC5/hv7wC3ZoNUUXCun79PD3mDQEkTNAG9+Y9f72t
 SyzCb5q8vljZ92Ck7Wdz8TceomoKtRowNrLy2pIlAYxeQfar1D5hkqA+Q8Ci8CHXVYBNRg6Ncu
 IR3gLms+0Cx+ebA6NJuf4jwYEWhc/Nwevyx4V/sPU4TAabZXUkaqHVuX0jVUImkou/ipje2NQI
 j0IPrWz3Gc4xYfkeMOTPVH5F
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:20:57 -0800
IronPort-SDR: 0lA6LR7gBPjdNLgp5sgJDJIbEW0fvtyG/PC6OgQ1I0ezvpNWTALCLvLFcXA+CrI4Bza1bW4xTv
 hTBIbPHtJWUE1AKwHGkR4E+Zc961KfXehCu35vlcqCdrHL4idAbVTXzliHe0nOMHPoMtgFWKNJ
 FHiiDxlP8E5933Ar8534rTrXHO8ZKStt+sDRXIAwWFc1t2Gzr7hv/v7YIsHrnE5EE0MnodpUDo
 iEF5fKmOM5b6YVk3buZ3yyyqfB/dOGYbqKGw5L6oCQo+vc5Guv+9msUhNOx2ZM8zRx6ZzpvcS0
 dsY=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:48 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v14 06/16] dt-bindings: update sifive uart compatible string
Date: Tue,  2 Feb 2021 19:36:13 +0900
Message-Id: <20210202103623.200809-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202103623.200809-1-damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053649_910837_DE17FC8F 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the compatible string "canaan,k210-uarths" to the sifive uart
bindings to indicate the use of this IP block in the Canaan Kendryte
K210 SoC.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/serial/sifive-serial.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 3ac5c7ff2758..5fa94dacbba9 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - sifive,fu540-c000-uart
           - sifive,fu740-c000-uart
+          - canaan,k210-uarths
       - const: sifive,uart0
 
     description:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
