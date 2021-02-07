Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE64C4332B
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D31564E31
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D31564E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rDOsYd80hg1kW7D7IGobBsRgC2QIET2X9X+AVMYW0Ss=; b=r3Iv2mXRcIVa78vlseD9kpsy7
	Pc751P1mQ78Lgno9BeWfJCyAfrhomNzJN4CBy1WU8CiD+Cs6jbuK9/mDEFP4QNXSZ0SHvWa77zW7E
	Q8x/a6DB5txJH5GFordWXbkSmipA4RP35Ri6kYZFN8fMQsGFArrc5/sE1yHunPXRT32XB6i0x4FIV
	jCLG8W0twkrkwtWBnXgMeXggUSjHEAX4IbBPyTezy1q1s2W0FKejLRwX3YiIeVFROl83T7q3UOFnq
	v0b7v3r6VHV7S7Dc9bsnCWgYvVtZCFSWwb/apa/Ca6SvcGHQ5Bo9QtX/RWmiWMBOywf1iIst0oNuf
	6fxiWkeoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8tEw-0006Qr-Q1; Sun, 07 Feb 2021 23:13:14 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8tEu-0006Os-2c
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 23:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612739591; x=1644275591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIY+mENCG0OfDogqN2TK/zkNool8y2CBwzDhCDvMBTc=;
 b=Lcpc7jMiN1D4C48vxCi//OoncRDINTN0BQilmJleSRVpWE4J00W0n167
 nqvGdzn4p5IR/QUlbyZYjegRSSrxrXC3b62CsKRFpK+/9eLzMtfvY08fI
 Phvp+Im7YlbRfjkyW8m6XBhFDxir/d8U6+WPBs8phA8mMMKn8F6ea4wpH
 Eo5AwKnbo0DupqefkPZid8S1KojydYa4ri7EB7k18kFCrTEbyEe7u0nsl
 IhB7TDGyc1LnQoAGSQ2Cze4ueSiiJlJKQAhdp0b9ttwr9SSa8Q24TGJ5f
 b4VUwvc5AX/Q/wQy03DE8Av79DikNYRtQFjYGgoG1pbOzyX4Xhdm0MZFt Q==;
IronPort-SDR: ChFul+W6+sMTVZsjmNcx+Cn7lJaw0f0+BafgQmaheeupxlXjJQ3T0Ah25DlVtMyowfE/M8nrmV
 ewuPPJ4TIMn6uKKFujd+bi5fdF4D44rcs11Lsji4KSCBtNdbNHcC1wMcB0jxZdjqZsikvEZ2Bk
 W4eBu6Wofa+mRyY/qKPl98fnNoRTM2UwmpTUE6OXP4pPb2/vBbDwJlhtf7ZcKXu8YC6f6SLaPN
 Xq2HcD4gYJHYgQ5OYAfjhD1TKSJO5pWhKVW0zCx+F01IWEtrejwzVT4XONynBcAKbI13+PCbdG
 aFI=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163861264"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 07:13:11 +0800
IronPort-SDR: CxJLD8mtmWFEyZB7Ons6eMUj3A8huRLV4f+raYbce9PgpJjoGkkUp5d3FQhLuaDdVsaUMLKv1D
 6P+OrzBxsfq+1EQkv7pw6SG1Ajbad+cvo7kFRQ2RLMiPwnYdit6RgaxWV70Zw3vmOL/k5lyU74
 nPW3961KxPz5Gez3etxiKtbDd5EUB0KVowBisZggKWLl/wGy2r8LKTv8rP/skpwq92Ewd4Zn/r
 raK+VE93fXMfUny5IEe52FHLzOaj9t0obZX9EuzmLqDZm5zWP8EIxit/U5ANc9EsHrdkUsT4FJ
 +fsLtbdXh5AoYxqe/gK99Zcn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 14:55:06 -0800
IronPort-SDR: hAXhT1+T+Hypmn8iiSEXz+UmnGq2tzSPYwZkH+S3BE8rqCZa0tlhOxGctiQxYb8ypGAflVuQ4S
 xDGYkC65V3ZrJbcBzh4Y8Wrc6yDVQQsBmQWqMqBTGyRmuU6VY0V5nal8jbtNU4ONxNLTaIZTf8
 NBnktXpKHd3D4t8hdIKGmmNEYHepVeVmiINRafDx2X6WHEja1QtWzeWD5oInCBGuvdyZ1pG+4T
 luIj1aZ+/8JCGMZXOAnJnHQXplYt6sj9wBN9EGfsvylIAoqIkookSNs0GnHdIOsZU9KJ1/hEuu
 VpU=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 15:13:10 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v17 06/16] dt-bindings: update sifive uart compatible string
Date: Mon,  8 Feb 2021 08:12:46 +0900
Message-Id: <20210207231256.115130-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207231256.115130-1-damien.lemoal@wdc.com>
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_181312_289360_504EC8CA 
X-CRM114-Status: UNSURE (   9.79  )
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
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
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
