Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07721C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 00:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eq1hmtdkogAaaBlaGysBAcK0i6pPRpsahOa7SB3rbtA=; b=mOrQGHvPw5fMDE
	f+d3ajTckLhNxPhlGDkd8RZpytKhLUC42DRoQ3R+J9qUwmZu9YO5hRibsNxeLar8Of46HZC+KocAH
	WuVZ+ec6MX9+45xyl6utieqhpqRUqhJEBsR7jSYp0Yt91147PRLgIFSJDTtXKEB3D+re7x7T2LUaD
	fS8niBxNRRrY+fqnLz12AuP62aDjyM4mwlAwqJexDH/OQRa59Ytt/r0OzW4VYcOKu/aKW77qa2ZbK
	FAHslErHfbxQpiScEfqijuQJ6zvFjyVbKDGJ3Aeze4pSDpLh11dkErhGolk1wQXPfAvNnaCaKCSD2
	x7fauuLnga0am4YgoeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2hY5-00EyHo-2X;
	Tue, 14 Nov 2023 00:45:01 +0000
Received: from mail-dm6nam10olkn20813.outbound.protection.outlook.com ([2a01:111:f400:7e88::813] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2hY2-00EyGA-2q
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 00:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NU1H6IbdAz4wbpfkM53NXwtnKqpi+T3rSPCGicxXJMzhM6NjRVV38sECf22q2mV6+ECCAp5e9oo8beiXdq/PJ1Xk66diK8heHFcLNjdfanPSiYT9tuvjdxKLlWxu+qU6DGoZ6xi4l6ez+zDAxdupYNNupIDRn/IAkaXBzXQZvAloeOqSDWwCtFHLULPr8amq1Ru+WqVtmaybkD5vFs8hV/2NSzZLvZAMaWUVaJy2yihXBcZTmYOvHWhg1F6WV8Cel27LSqdek7JvCjtUeBxpXuhqJlpIngsHSSCwadAbFxy8/D0KXo7Iu7BRqTbNB3szW0EA4hY+xKlEBh8cxLfmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLCJF43U9rhk3x0h56agQamxmuJvrnREIg0aplc0gC8=;
 b=O90JVZXUDOZoVNYxco6zyITkPaixy06Ls53HcM4v7xCpGmMh/kkWMI+54QeXzrvwE8/jSdjZmhcLi9sm0+1jY2rZ6ujYt6wSE9yY1bYj7sVLGlKtj6+7U+Vj71FhUWw/p0ELfgMS2dK15iGIJF8w3/rGaiWORxxPMN8udnIQwe+pNXY9VS/CRil5TGloUF7Q8950I2kb8lwR6JpxMs4aahaIM4vvSrbsoHacAJjycLsB5VP0OnU/orY3lh8BtBjJbqQxneB+ywiDdRyi2pC6YYxWYNrjCeI+5WZ8D6qj/p1/FBU7Wvu1hQR0J/yBNB9DAa7LAMK0lWgcREVWsH7SEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLCJF43U9rhk3x0h56agQamxmuJvrnREIg0aplc0gC8=;
 b=GzTcDCi8lXPjjztxFkYL1sgJmeikZ2Z77FSOCa9motgEzaB2PR/AYyGWFJELwNL8B1Pyy1LfHiDTrlaXZUUubadsNBkbjuFjb5VipgyO0xykPJUdRBUYeDFvykNAXYKlqlMbTNFFg35Ob0N0uRprMZK3UesWUv9x8zOYbjxV+AtgZ76aqD1qpGBwvJcbLV1t1MqSCUTDGTaFPY/Gh1M5qKy+hACAOaZ896T59rAx1yUZFSSTNG2sSbrYf+cC2xIb4biXvcXUFxOC7R46n7vQEmP15vFqo0GXOkplrYT9VuKmpE2+xFlCHHAmutWE3/JT6bMez/OuhfI2e97PD9CgfQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM6PR20MB3492.namprd20.prod.outlook.com (2603:10b6:5:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 00:44:46 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:44:46 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and mtimecmp regs
Date: Tue, 14 Nov 2023 08:45:31 +0800
Message-ID: <IA1PR20MB49533EEEB2F7E8D93762DC1ABBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <IA1PR20MB4953BB0ABD29F5AE938A54ECBBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953BB0ABD29F5AE938A54ECBBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [0mrh/P47aZM+VvyH6RMX0C3C2ZQ6F5hcch1gvP+7At8=]
X-ClientProxiedBy: TYBP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::25) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231114004534.43833-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM6PR20MB3492:EE_
X-MS-Office365-Filtering-Correlation-Id: d37af353-6b31-418e-dc2d-08dbe4aae65e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SsVK7yxfefAXQky8hhDaeRH5qvyMCN4Ubz1aCR/ZgRTgW/A9iLqbRor1PZzX2LEJlpLgJvOXaLh8aIVn5OvCjSa3fJLv4oAdTWdYzEZJXH0ILcA4vIGcJ+tTKs2XmFSb2QCLN9yS0GfRIWWZ1e5qTBYWwH4TQLbZD5cOhPhav/Id1et8NV+aZduGhbYVqqdpPUfPUnKjnMvBYVNvXDrNjRGfS1PNk/p+IhRVDpJTopGatq5iisDbWFHs3eBL6icl7uEXvd64m+btjZm0bMyeXZJ7W1UAVqQngGpnHGkJu6pTqJzZZPSsrvZkCnoZPwK0mKnz+mfve88/GHVIqG0hC5A3DQLXRzYkkvDVpMz5JKj7KBShFyfjW7es7X4wpT7LjDTPPQLXdH+sp9WzoZzG4/XdktfK0JNW0q8xVeADOeIC7cQWqH+xE4pTzKzd60pWcmulIQO07LTE4Ya3RFhalVFVBNHxU1A2Xni15+A2K3MD44NX/pQnpbG9O1BJSC3jAmrZNVk+qWHk8XbueQTxUonuwtyWQw8dmP5As+sFF/nz+uIYOyrlTHj+H5IcihLliiw5CRo2QdEy1GoJWBdAFULSigijj05U1ablU/Nal3Ugs4LfOmEjlq7FmWhhc5Kv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g/fqNw2VU77obNr2BI+jZVwv6ILMOxy91JiovbVY+aBhWdMu2rCQGZXyloKZ?=
 =?us-ascii?Q?BUNufGAy9A8YmWG0NFA6tP3/UQxldlrCVX8RUX7wW07igh/S4ZgqYaeOe8rm?=
 =?us-ascii?Q?JiPXpNGk+eTzZQ2R0wT4Sw8gECYWBzf3BEiObIyThAAvCKJq3OGTurJLtr7S?=
 =?us-ascii?Q?6lq1r8UjCcYeldDNwufULGHhzHXdFKJfkAyUzr0tXGUIgsbC+cQjp2ef0kPf?=
 =?us-ascii?Q?QvrCYjkGcOJ6ba8HfbxAlaPD5ZyayndJxS8nUTpqnp8IBNVxCHWGXe75t9po?=
 =?us-ascii?Q?vADaaHaORHajj6zhJNvnT3APyrIfbC4QoaoqHU+jv3IdxE50WlsKTB+RUvbf?=
 =?us-ascii?Q?Q5GstS1cOpm1CbiRSjijVSa0hENForaS7ntrIWgVp+JPb5fTWiLNwQUuR1x3?=
 =?us-ascii?Q?ZsC88JyXCJ9dFjOgVaXXphKFgtUztWF9baNxStoJAJzSz7AiPAOkGdia63PF?=
 =?us-ascii?Q?YPXnGF07ynifWdN3+Oux4ALVyYXIZ5k+OZ3uoyD4o3cUrPcqgVm+SnUcd+uc?=
 =?us-ascii?Q?FlmgI3hyK4U7Eo5eQiE+Mh7sCXyCQVrXjog0Mop01bK8T1oEYNir2h48sFAv?=
 =?us-ascii?Q?TcXf7ojU2HMMdmAlZ/Vt/+a21Q8Q4ljeivW+VDNxMVAvKoWxFm1ZivUgZagP?=
 =?us-ascii?Q?+BZG06l5g27IFSn94XTgFLHT62lcyuSZo3WKL2v3H+yZChNhqrmIHhO/rw+a?=
 =?us-ascii?Q?3DS3Ny1q/U7NYcKkVC4kZpx+hy7fomvVrKENbjgNP18oR8V5PwL7hBZMBdaf?=
 =?us-ascii?Q?1oAHgd3MMh0BN4Wz7SaMv8Ms5iHP+MLTWljx/fjL3G5DULcDIPcZPegRfh1X?=
 =?us-ascii?Q?nWrBnizeR6E+T0G9pV6VN5jockmkAty4WOb6GTdQPmFZkxTIlS/HGoD+ykWY?=
 =?us-ascii?Q?Kt5rTrw+OcKGI5lbEVKFu/1wCKpv9axx/2WKmpo8JXZynxvN2xfwyDP05S5I?=
 =?us-ascii?Q?eCmsxceHSmJnSvXnWhOwwjMIYXAekwEiF/oonvOHgtkE3xNl0rW/EQVAG8qi?=
 =?us-ascii?Q?RggwbR0KtwrvKaxCep8hcg0xWlaWPuOTdeLKkVh1CeZZMUFDdMwS08n9gZVK?=
 =?us-ascii?Q?RXFL4ZXYBJ6Hpg7U9Sm9jK9RatUJj6xMEP8AbkpRHniy/TGe+2S/7OKlEm87?=
 =?us-ascii?Q?tDKQqDwG4pKSdXOZwm5DtBR+iUWpLIHv6CtWEe56L8DGFOYyHZZRXrUI9aAr?=
 =?us-ascii?Q?EndHsmM6X/1ZbY3K50igMEAHrPPQRqCxfZZJ15zY67Evs6rxGQYyraUb5Yw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37af353-6b31-418e-dc2d-08dbe4aae65e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 00:44:46.7477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR20MB3492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_164458_919859_8379760F 
X-CRM114-Status: GOOD (  11.02  )
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

The timer registers of aclint don't follow the clint layout and can
be mapped on any different offset. As sg2042 uses separated timer
and mswi for its clint, it should follow the aclint spec and have
separated registers.

The previous patch introduces a new type of T-HEAD aclint timer which
has clint timer layout. Although the timer has the clint layout, it
should follow the aclint spec and uses the separated mtime and mtimecmp
regs. So a ABI change is needed to make the timer fit the aclint spec.

To make T-HEAD aclint timer more closer to the aclint spec, use two regs
to represent the mtime and mtimecmp.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT timer")
Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005693.html
Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
---
 .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index fbd235650e52..c3080962d902 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -17,7 +17,7 @@ properties:
       - const: thead,c900-aclint-mtimer

   reg:
-    maxItems: 1
+    maxItems: 2

   interrupts-extended:
     minItems: 1
@@ -38,6 +38,7 @@ examples:
                             <&cpu2intc 7>,
                             <&cpu3intc 7>,
                             <&cpu4intc 7>;
-      reg = <0xac000000 0x00010000>;
+      reg = <0xac000000 0x00000000>,
+            <0xac000000 0x0000c000>;
     };
 ...
--
2.42.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
