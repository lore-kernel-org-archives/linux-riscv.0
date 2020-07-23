Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD15AC433F8
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 14:25:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 927EB20759
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 14:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vh+ANOO7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="gDv6XWMf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="gENvNjHC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 927EB20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lv9T78bm/tHdPSLjIJZB2dVdqsuj+uhKoCCTKvfc++0=; b=vh+ANOO7GUmOzb9YfHFcvFAyq
	rxzpIto0oTaV5IQ+W4lX9Ib+58B8KSI5tScCevHKRPTF21fNQ1Fc44DiIE0S7/WJ/lg+0WEgwNO2x
	syOOnEZTC3KB8sXYgTNZUjupSUFJYvqgXiee6mrtaBoAKCDSE3jGfUkBGGFYwHZ4SpLQLO0oTcLpf
	p6RjrKc6A6WYcHYf2XBMJ3Aj0tsHcxCTI+8mprCb/SnsdYAhvfNqYOCTKSoXWVmsIgt9Ji/s+e5Bh
	JpGQYxMs84mHAdKn+KnnPPJQbPpN/ETuaazN3QFoUv6lTwn4962c634Im8Q1V+fafchdP8OHursep
	XZvklglWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyc9o-0006B2-SX; Thu, 23 Jul 2020 14:25:12 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyc9m-00068r-2k
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 14:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595514310; x=1627050310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Bu7QYu+rmbl1BgD5j/YqNPU0EHoH6IymWIqTKqf27Og=;
 b=gDv6XWMfkR56LiWT3bs0tBZILBs/mhxvVlNL8Ej7gYjOolfrg1cgAt8d
 gwkCvVGTq5OwsyMKeGebJBGjb9zkOCIpFFmvMYLedBYKrKsWimv6xNQKZ
 Jm0jxfgYQN4H7qBnc9LiedvYZdpUouVOEllG47+PQUbyeQg182NTWuYFe
 7+w/62L1D73xEpUNx7B7yfRQCXmXkqwLxpVgK4ODJopRBxpVqsetiUu8/
 STa+NPp+oUjRnu9uaUkzKOKLD9ObzBeHShS+VpOXItaCMn4BjTN95gjER
 gWXUzicfbAZ7AZpsbmMULPd6lKzrsDFA/Z8JpCVn2NaqyDEZ5ZaYKycs7 w==;
IronPort-SDR: kT8Pq+IKCnn3+xMVzXKQOAW0Ac6XQScQa0PBAUiKuGe70GWqfA9vLhDNhdqG1XZUaE3ll+Jes2
 iuFB+D5bazYK6l8wouQqGEw4LjjJkwFtateEdR3u9ruyGhw7W+dT9ssPES6VVOum0EJ1O9MZMK
 oxHuqKPbQVoI5/w9Mhy1RKGU3H+d3fgTwPdtBc5dsbxK/st0MbP6YLvWvd9e19q1gZaZVvUk0t
 jk1AnZ60sGdU4pclZtLgyRqCzBvCq3uDjpVxWQzkN6ArFbcxYumXYqK7FKaKBLwLtO27FYB2DB
 wkw=
X-IronPort-AV: E=Sophos;i="5.75,386,1589212800"; d="scan'208";a="144473072"
Received: from mail-bl2nam02lp2053.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.53])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jul 2020 22:25:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqNg9r1HFkdzRxYjWCClgkLsrCi0i0jQWzSDdarhT3oNjq/IZgBYz9jBKkkD9CWiPxFx+jmjQ8nPLPOOb0mO4SaMRwfNk+x186OZ2ZsiFH+gor4fh3uDwgJZrtlEkLibIKfx7VU9o1LZfkPrLut4VsikakcX09QmfQqAsPj/KWLYVs7XU+3tivA+speW9Z6lDzxD+BMAWjWllN7ljLg6Y2+R5c0G0KfjGTHH3ZJqz5Q9K6mDls2mOZMEmFNf1BWyiI7UnhgvhVx6CB0d58AxqrZxwQezvNRI9r2W6f9exvOuEXdIxQJ2woA9oGpcIyp9mw9+5SM7RJIo5J770K7h7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZYtCM7MSi4vbD+2NG5qAzPEcrA1EbyRdRBLFvNpzSU=;
 b=WvmRY7qvHkdpOn85vonfvOLbKXDbGl0BqB9tx7RPx9zJyYPjE19iEHQBG+Ssosgu3ft/83tjIHf+nrIoOohvGPbpmC258XuA5C6KUzE49Y6sCNkcyZb9ulVClOg5JUrhcWE40dYTtJiJ3Fs8wM6V4STpEU+RIlvSRt3rge+BJEmHDsZFszl8oabm5PjlBaHRRtHO5d7wPuwh6t3wqi7Uh9FvoYmH8dsDBnv6gy5gEI7myuVhJEDEevcoOZRNmzijHtN7pqywRCF9f0cgDY79xnsI/sl+Ba5z5JHGOLq6/MLoBAbaLbnEEr4MD+hghmoutIPLx981xQT98dyZeqw/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZYtCM7MSi4vbD+2NG5qAzPEcrA1EbyRdRBLFvNpzSU=;
 b=gENvNjHCvcEKrNZdrxmGTSR0m8LSev/N9UcOZDCyk1M0lNX307nW8KIDLw+QnLzKmZgJvzmcm2064FlRqrKBnIQcj1Ei9unZNUMu01M70ot2bl2ohDciIX2OXSdbCqvfVK1BwNJgQhSSirLySDQ/rn+iy6BSJtk90yBEaa89OA8=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6682.namprd04.prod.outlook.com (2603:10b6:5:247::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 14:25:02 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5%7]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 14:25:02 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v5 4/4] dt-bindings: timer: Add CLINT bindings
Date: Thu, 23 Jul 2020 19:54:09 +0530
Message-Id: <20200723142409.47057-5-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200723142409.47057-1-anup.patel@wdc.com>
References: <20200723142409.47057-1-anup.patel@wdc.com>
X-ClientProxiedBy: BMXPR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::32) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (103.56.183.159) by
 BMXPR01CA0068.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 14:24:56 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.56.183.159]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4598c208-0cc2-4437-3268-08d82f142fdd
X-MS-TrafficTypeDiagnostic: DM6PR04MB6682:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB6682044DC1A7462169BCAE518D760@DM6PR04MB6682.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xo4/fJ0OtcXRgO2+98owj6C0nVXsHRYtXkFt0QxBZQj5vVtDqQzdhuv5QDaO+FrpS7ggMN/rgYcu0td+XA74z+UJ4iUMKnIg4uYlB73XvFgBUsrAROUXSG9E2CyIi3xu/NofLexdzgMtNxko0EeXgBtcvJZrcrI+nvvn4MxQf/HHjFPapXc7WPpLmyXd7LflAlNtOLW/2ASFDiZkyKMIDoT8DSPAnrVjXir7d6hIfTFqXkunvF4VWbcPIlDLNLnHFZKBCa7htUfWZfbHedThOdCGC5XOq7+9kMZMsJBfn4OT2v/nHq4dc8EJ5lVaFHTDqRI6WyoMppglpBbdG4kAyJuO+WARdse4VhafTaiX8t8tTQPcDaRU/NhVpbIJSv7jMOQHSNqj9PZKKixm1dj5kYkvbFnZicJirYlSKtSpPF7GxJgbJWfJsgbfYDi+8jooyTu4ZA2HRJlTlyyWmBQ9+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(4326008)(5660300002)(36756003)(478600001)(7416002)(83380400001)(44832011)(55016002)(966005)(956004)(2616005)(2906002)(316002)(16526019)(8886007)(6666004)(52116002)(7696005)(66556008)(66946007)(66476007)(26005)(8676002)(54906003)(86362001)(186003)(8936002)(1076003)(110136005)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: TMbSEb079f+1gV3SNSpVLPE3F2TU4v/q85siwbVKCn7e6tmTv6SouHlpVcqBalOh9OuDRaRC9iWiuuI+wcSRlAHIYFxtEqeB3XoEBCuoXWxwsZ4qOPzJ6esVEvtlamq7bZPCI23ClusbKNmvehVOKH7yqqQpMxrnIYxm78JqjeYdDbDIIf4T+d7VcQ+Llw7OPu9MAXlg7hkktqUDp8IYaPBdSAtTv2Rfv70V+x9kbUW+WhPcYyX/KpjvWUalBhqsCOrGetOX/iyU3MndNruxWhHLDFLMh3ALW74EQk0yA43ujg8IMqONy9UvUwn2WnGxtmJGSp1x//7pCyGXFAEu7ruaUct000Yh9AcAIrC9094iR8tnzSxPzrVHbw1ygzPmdhw2BG3p6+roGwAiICYci2hOeklZebJEXmOmIP4YgUDNYFTUX/qTuHwE8deAunGjN0SyLdYokJdLbWCywOZ3ClBzPM/oxarKe5k0KofKPIQ=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4598c208-0cc2-4437-3268-08d82f142fdd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:25:02.3211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wox7ri7EBWehyd1jNeH/igYJ0OcCNgnD6cc+Onjf3S4RgAvzfeDtjulYNM44kUM0pgKsaVIt8xMNEE2PY8jHdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_102510_297357_D3ED9586 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Emil Renner Berhing <kernel@esmil.dk>, Anup Patel <anup@brainfault.org>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We add DT bindings documentation for CLINT device.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Tested-by: Emil Renner Berhing <kernel@esmil.dk>
---
 .../bindings/timer/sifive,clint.yaml          | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
new file mode 100644
index 000000000000..8ad115611860
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Core Local Interruptor
+
+maintainers:
+  - Palmer Dabbelt <palmer@dabbelt.com>
+  - Anup Patel <anup.patel@wdc.com>
+
+description:
+  SiFive (and other RISC-V) SOCs include an implementation of the SiFive
+  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
+  interrupts. It directly connects to the timer and inter-processor interrupt
+  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
+  interrupt controller is the parent interrupt controller for CLINT device.
+  The clock frequency of CLINT is specified via "timebase-frequency" DT
+  property of "/cpus" DT node. The "timebase-frequency" DT property is
+  described in Documentation/devicetree/bindings/riscv/cpus.yaml
+
+properties:
+  compatible:
+    items:
+      - const: sifive,clint0
+      - const: sifive,fu540-c000-clint
+
+    description:
+      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
+      Supported compatible strings are -
+      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
+      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
+      CLINT v0 IP block with no chip integration tweaks.
+      Please refer to sifive-blocks-ip-versioning.txt for details
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    clint@2000000 {
+      compatible = "sifive,clint0", "sifive,fu540-c000-clint";
+      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
+                             &cpu2intc 3 &cpu2intc 7
+                             &cpu3intc 3 &cpu3intc 7
+                             &cpu4intc 3 &cpu4intc 7>;
+       reg = <0x2000000 0x4000000>;
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
