Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D35C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D22164DA5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D22164DA5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rDOsYd80hg1kW7D7IGobBsRgC2QIET2X9X+AVMYW0Ss=; b=gLxM2nqA94+eQ6HVc7lea6QnW
	gzewbN9Ybg2n+W4RuEs+GkYGR0RiG5LFxiMC9ku415tQiwO8t79jXsKzkMNlZpGES3q/eNuhcI4Ox
	xhxSU2YppZqYWrg3HuBK/Jm92zyn8Kv21Ke8bvhmdg1sIC/J+pWjHMgjTezKZVaT+O3hRSJMyjvVq
	KaPkqtUjRLaLPWfCZ4JIbxo9TkZbuKDgpNsb3civhPJexEhPZUu8ujqoH8mU+kdvP9bDBsDU5jWwy
	PlVfWu8yiKZuAPXKpUiGV1+zpTw9b6YKf97ahPwRfqi6GX2DLLr0pD0TEEMleYnXZMYXxJawI941a
	6CPOYXckQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9heQ-0003MV-9R; Wed, 10 Feb 2021 05:02:54 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9heM-0003Jy-QM
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 05:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612933370; x=1644469370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIY+mENCG0OfDogqN2TK/zkNool8y2CBwzDhCDvMBTc=;
 b=ByI0y1kPwn/ZXfjWnK9272FPIKdfPmJ3rw5cotVXU8JiED0LS40W1R13
 Ql8kZT5diKGBG8C2d3gw83uvJvuuVVgfaxndFoI6CNGwL1mQRAJXKMFbN
 Hk8qh98XKTzwxM7SRXQFiWigAqAM529vNqamJt6lKVliIEEOevv0kTJp1
 1S9i9GCXn3LnRFskRLAn6rqvtKGjJ4EuKvYl6ms7laGukH/1vrs+bIhoD
 SJcevLwfi7z+aC54CU7BS3fttIUlbDc87ntFaApvxD4zQMjrn843f7HEY
 RYszsp03V+lkrbDCymqeYkOWS1KBuPGYLseGY4tEblLJ/zrrxmNAj9k3J w==;
IronPort-SDR: /wHzC8pdI8ya/GZ6mIvdyUvJrGE9/o/IW8zYLrM6Yu6JkX+BW5q5TOtUc2HZXp3AGa5l/T9iIx
 Lmz/uHcvhEOOUsuF3IzHyY5js2nqttU3tWlQUi5feHYmK9GKERuQBeW7M4xkEemfSVsy1bMrG2
 TMf9hX8pf29OenCDaaApolkGlHGGahiJLlXGgHw+BQWfcNs4nYvk0Rw7Uya2aSHqJlR9riX8Lh
 6Z3Mxys0iDaw5rwWhpJDll/tdJzq94LfhIb6PzFCWs8sgf8nEta5nyr9yNTJLLI+sU7RnOq1Nq
 2NU=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; d="scan'208";a="159592690"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 13:02:50 +0800
IronPort-SDR: SuZu9L+t3BD0V++RbsxJcB2GJ9nVFC7fOK1OR+wOI4p+IoJTLS9Zhk7QzGHLnUfUffJtMw0jTC
 pZETT6G+knn8a8fSikLPHsbwQHmVqeIcmZzd1zbCLax8UU9pMigM/cfVWgCLlujb2VdH/ZRhgr
 bH5+er14BHEdaUoVR2WK6YMxLk6uRBLGkrwxaiOZlWIy2SnerFY5rot2mPecmjEeOJGl6vepWH
 CiEylxkpAguPHaN44LMkT4F7qHhthPfw6T65Jn8JcjDPYcCdw8fiRgEKSfU8sEdQh627STmySv
 mkN2OAPFjaLcvJFtp8KQjN11
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:46:33 -0800
IronPort-SDR: eZwUjlfnXPNdbdespLK5RaDb3UvE5ofxqGzBxus1CBffsYCb3EUh9At4XdN+Su6QotJhybAeB3
 BCJofYp/eAE/zNg+oKVaI6NSOriPEzGkx8j08bo5vn2gutdWdIS5Rrsfbr3xtE0O0SqOqf3G2c
 O+7C1VdLkxIEXWV8naL9FzFMunNT9Spe3fbDaE7Fn1HyQCv4JPHS4Utsp8D1FLnYJ16DRs3mMR
 k1Wqy8laRCYV5b/bpuJfw7JpFilOOWJi1SLDMfSr89Rdtqg8lD8+/GD4RUDWtVNlkoy9XFtexL
 T1Y=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.72])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Feb 2021 21:02:49 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v19 07/17] dt-bindings: update sifive uart compatible string
Date: Wed, 10 Feb 2021 14:02:20 +0900
Message-Id: <20210210050230.131281-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_000251_020826_97947CC5 
X-CRM114-Status: UNSURE (   9.94  )
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
