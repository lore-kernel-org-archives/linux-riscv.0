Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0186C433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 16:21:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721A620724
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 16:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tOVd+Emw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fW+oHJ9d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="cz8WxmPs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 721A620724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PYH0uTTfayI1X5wCD1/nY08zCJtn1OgLBjD9+jwVpKg=; b=tOVd+Emw8dyogn/qmv2EvMXyV
	q93YlUoc4v2S8MF5qhic1HdON8QmOtxicn8QthERl9XzPw8lMl5a+UoWVsamEFZO8JiIlE2t4kA4R
	Xg9nNCq1O3hfUU/PfYKD2azLJ3deMDvbjzcVf444Mc1dAy0w5drIZCSK8gLp6NkkDtL9ww4jf6F9W
	rfuAk5GCH1ZkpW1LOli5aliuU24UxNJqfLPy5OsubU5jsULUmJM3v16svLLincDc+iNqg+HG3A5bC
	tl8mJM13SWOlBV6x228d9MmuhAkQVWZ/jE/a3ZjxFdbr6//7ukAeMhpwNNTBgLN/cmKKOjZ/Rl0Tj
	ycrniCuCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpDa7-0005wh-Hw; Sat, 27 Jun 2020 16:21:31 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpDa5-0005wO-Nj
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 16:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593274889; x=1624810889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tvmc3W4JRYhE0UL8F+9/z2F+anrZBizcFY56B9M2y7g=;
 b=fW+oHJ9dq+lrJV2FmEoodq9ovgCvGx0Sl6jCLbuUcy8qTPet1vdpKope
 lJYOZo3X1GFXiJT7KjNgNoKHB1Vk2Lw0wpIALnuPW/CMSo4z8XoX3UeTJ
 GHev3PxabYTfRjQZ0A/eAXoy12AzqJiwLPXnhdt/mvBM9i2DqLwxOkYh2
 ILUhYGohkc2EhkE0P0YEk1tSYZTs5f7oQTbXMhNMxVbVtN2JEMkKYQJJm
 YrwTqsyDMIOsTJVDAxvugO4vy/PhbI5GhLyMkaLkaSTTA77qdOdy1YVrU
 SEvVd0DMnomoZX5hAD4KW4Wi58mU0YqVM2qqO/kxvgvjEJtaPQ8wnwV8j Q==;
IronPort-SDR: HbY6sZiUNdCzyB12kvm6puITM6KGHJ2i78muAXLbu8x/aiWSBKZAzLhTVgSycfX33nm818i3iL
 plyGSTVWP8TUKsiOcz1bEoNooyZi+ZqH1B9XVdsMkIlnmJQdT4/6McijM+PHiWSSLYuGr+/8F3
 74cvvF2Op+UZL1wn2EpjjuLIgParDECpO4YlYmSMo6V85/rG0e0rvdRDI1Ch1pWDY8iwaPNzbd
 Rmdftv5VZzFpf7n05VdYIfNILgdi1Vw5UHGrYvVcvDbs4Y8s2v55SJjrbf+D+1XiGs+SRLEQ7m
 VRg=
X-IronPort-AV: E=Sophos;i="5.75,287,1589212800"; d="scan'208";a="141074526"
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jun 2020 00:21:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8gNZeHo5SJxyKwusO5bW5ZhuYVLhLnTlLfU//Sr6c6isMw6ezJ2sA1sVsg2QgcBpwi4156Rkso+gZU7i6jR1aqh2GD6EJ4hhTlcMRI6BqGfhuXm8D2QUIl2bN8rFk9QBCFziwl8fnlUGmNTdtqp+0/9OnjdxZwUSEasXJu2rF4y/Z+CmYpmtr4HyqkefCw2/n4vczllaPEZ9HBEe/OK/kLfo3pJS2Zn/ynkM37LFUzHKfRMZeKCYkKMhuWsqxGQ69DleF9o+pw6fORXKXsSvjwLRMO1sMZJ+KVSycJy5rfSjv+FvBSrIBLZuWsUQClxBvZX98nqefhTFIi6KJQbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKAyLfo04TzHYenRVAGkBgG/BhNVJ5ZBO2r3ArGrDPI=;
 b=X6XugljCX0Zn7+qtZTFEl2ptCcwTQ3YGsQ+B0LrY32bVKXQDWzwXxc2s/yU4mNi9Dwqx2hz7soiD7bvU2qzMbQ8woJEPAnJa379Bl8oQrIHySROFAv+epXalcS9e4f2B2QtXH+38nNi5NuOHQemLttpTpDWEKdPpcGL1LcpRlL4g/DzlErKT/lwvIoMo7nxHxLh/au48Qc08HZMj2Lu4QVtqLOI69WbUF0xG2JQgTEwAK6F4PKbHLPpHcbnmtKvI50FSh4+pvTZ2Z81IDZe4pl1jkbDlvHgdrRqCc9HFPnTWKtopm0f7pfT/qiTRXVMADitQsO8me33ZI9sajhDpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKAyLfo04TzHYenRVAGkBgG/BhNVJ5ZBO2r3ArGrDPI=;
 b=cz8WxmPsMyKlBNZaONetKt5E0FkMD8Zrur4Qvwl/clKmJtuwTa1T0VwqkSnIRyTU4qXO9PGoTiMF0c/bpffx1bJ4XXAr8FW3bfMIJEKn1JdEoVKoljnXclhBoCWGcDVui4vXJKWjMfJx0kjl9qH/3SyfVDIb6FLWJKNor24Bd98=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from MN2PR04MB6207.namprd04.prod.outlook.com (2603:10b6:208:de::32)
 by MN2PR04MB5725.namprd04.prod.outlook.com (2603:10b6:208:a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Sat, 27 Jun
 2020 16:21:27 +0000
Received: from MN2PR04MB6207.namprd04.prod.outlook.com
 ([fe80::e0ef:7fce:ff0d:f580]) by MN2PR04MB6207.namprd04.prod.outlook.com
 ([fe80::e0ef:7fce:ff0d:f580%7]) with mapi id 15.20.3131.026; Sat, 27 Jun 2020
 16:21:27 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 5/5] dt-bindings: timer: Add CLINT bindings
Date: Sat, 27 Jun 2020 21:49:57 +0530
Message-Id: <20200627161957.134376-6-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200627161957.134376-1-anup.patel@wdc.com>
References: <20200627161957.134376-1-anup.patel@wdc.com>
X-ClientProxiedBy: MAXPR0101CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::15) To MN2PR04MB6207.namprd04.prod.outlook.com
 (2603:10b6:208:de::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (42.109.128.251) by
 MAXPR0101CA0029.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Sat, 27 Jun 2020 16:21:18 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [42.109.128.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f83c4ecf-4e6a-423e-d426-08d81ab62416
X-MS-TrafficTypeDiagnostic: MN2PR04MB5725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR04MB57256BC1776D9E6424C7E8A78D900@MN2PR04MB5725.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0447DB1C71
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: No55Are/S05fEsGb7QWI1E2dsgLg9NgESDaKOYMbq2He6ncoVUZTNpyPYVDr4vjcNjhGZYo/d/pUzS2MbGSERvWLyS05KcGTo2N9jaR72Ckc/5ES9z9av0I8ATkqjnFku7DO+z5b6EY9Dna4Lzvo0brgt/G7Hhrt6AQ9+Pe9f63XLb7wPgo9CWc/FNZ8yHeW1DQewn1ycDIfh0Ylb0W7lhsNq6BmQougnVNN4VXWoPZSIJAOexHIkaU2qu/BfyA4iwIP0hZNO7fm6W6pTgJZxnfz4Wk6M7tM7DMeiIdntQqhKDLd2ZBeASm8idNv4WYKkz1mebu2NjQckD4q5ddOjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB6207.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(1076003)(8886007)(186003)(16526019)(52116002)(86362001)(55016002)(6666004)(1006002)(36756003)(7696005)(66946007)(5660300002)(83380400001)(26005)(66556008)(66476007)(110136005)(2616005)(4326008)(54906003)(478600001)(44832011)(8676002)(8936002)(2906002)(316002)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ClsdVQeWFQiIoND4lcyRS9EIYo5UmBPICf/63C/6SFzwC0E36X91GGQEl0bjIGKPh1SWs4MslYv5vzec/eO5RN5E5znHmQZ0UvrMUdqlSA/bZhmw4tbmVda48bFEB+uUcTo4/8Mr0RSUvxLYy3xeUudDUFS07gxcHFd0zdetMUQVZH2+wzGwWpV4tp2WpmON2mT2f87jr8dSrfu3lfuXEYJJnPYEqyRWQig7mj+MWDBV8M1QRidDH+SyQUsjb+yTBLJ1PL1lVlju3HaZfFgnJ67dKiD/9i+0IHd5Xy54mb5LZutO2IIS26mexWrENedPN675OoujuFJdxXzUpjk5fUYeOWya02Y4qxY9R+TEv237i8KggFTig97zntESsPd2plMqoz6/2pZBgBm8t+V/2GNwVLJ9JbJ43DrIf97yAFf1l0H/Sn2+uS/R+LgL0jIhPBxewS+kvcHy5MA3EJVxGy3XtPlGC0c7yw9Sye3Ouyg=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83c4ecf-4e6a-423e-d426-08d81ab62416
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6207.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2020 16:21:27.0278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxGFtxbzZE6AvUivVmXLer1/+EvNmAHvh6NMxFVVK3DYLWMjluZA3l65fkFimV1TwchYRyoQ6Coo1fwPkDDVLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5725
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
 Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <anup@brainfault.org>,
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
---
 .../bindings/timer/sifive,clint.txt           | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.txt

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.txt b/Documentation/devicetree/bindings/timer/sifive,clint.txt
new file mode 100644
index 000000000000..45b75347a7d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.txt
@@ -0,0 +1,34 @@
+SiFive Core Local Interruptor (CLINT)
+-------------------------------------
+
+SiFive (and other RISC-V) SOCs include an implementation of the SiFive Core
+Local Interruptor (CLINT) for M-mode timer and inter-processor interrupts.
+
+It directly connects to the timer and inter-processor interrupt lines of
+various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local interrupt
+controller is the parent interrupt controller for CLINT device.
+
+The clock frequency of CLINT is specified via "timebase-frequency" DT
+property of "/cpus" DT node. The "timebase-frequency" DT property is
+described in: Documentation/devicetree/bindings/riscv/cpus.yaml
+
+Required properties:
+- compatible : should be "riscv,clint0" or "sifive,clint-1.0.0". A specific
+  string identifying the actual implementation can be added if implementation
+  specific worked arounds are needed.
+- reg : Should contain 1 register range (address and length).
+- interrupts-extended : Specifies which HARTs (or CPUs) are connected to
+  the CLINT.  Each node pointed to should be a riscv,cpu-intc node, which
+  has a riscv node as parent.
+
+Example:
+
+	clint@2000000 {
+		compatible = "sifive,clint-1.0.0", "sifive,fu540-c000-clint";
+		interrupts-extended = <
+			&cpu1-intc 3 &cpu1-intc 7
+			&cpu2-intc 3 &cpu2-intc 7
+			&cpu3-intc 3 &cpu3-intc 7
+			&cpu4-intc 3 &cpu4-intc 7>;
+		reg = <0x2000000 0x4000000>;
+	};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
