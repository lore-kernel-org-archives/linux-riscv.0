Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF526C2BB3F
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpi5cs53BYEaNmQTLbIri5W6ViPDI6uLQKAi28XSy+M=; b=knLBktKh/VPULj
	hfc2Ia4eFEt5NEBW1+Z08xidf/jTLsaN7wNuT9V+s9woZLekrnz5/aLAbcWAW4VSn+7RxQA8zsx3S
	YE1bgHmZEblM/hxx/oFwoWYSuw5cjVGkv1H7m/SsKgxtZw9jKOgeAYdp47UY00BXRR01+9mTsYCMA
	uGvSJuBnf35dY+0wFuy5qfLjUMVTimp/bpYsrWOpimf5rLxT4xvLUsmyWy7YSJgpMGikP0cdTd9y8
	QyECdX2HZkANtrPwEH2/RAw3/QaTiYpiWZhaEuiBax4rIVmqerNY8clOJY59XLGDT+CVgq8hmIKFg
	KCGRDJVf7FOCcq4fHFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4FSm-00802e-05;
	Sat, 18 Nov 2023 07:09:56 +0000
Received: from mail-bn7nam10olkn2080d.outbound.protection.outlook.com ([2a01:111:f400:7e8a::80d] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4FSh-008013-35
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 07:09:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aefKmjY1G7dDqraigFWFBn23YoMNXW+wklzR3/n4eAvrLHBUI25XXgarJajtbO04RrY6T2qVoU444IgGYf14m+MArLADB0Z8rBC/2JicQwT1tJX9GWhEc7bHeYREY+Mk8bYq42NiFwETIqa2Jt79ZJDET2bvvbtphuLL6RskrB8SqAMpvnXVSpQARBB4HACzr7ANppvKHmADzBB0JgA5pduocO5BX9nW9eKtH48wSIRCiv86kCJiBhknczENizQ7UtwU9cP5njNTqbi2A/AgpR+AdYYOj4QzkRKSOmkVOabos15bQjrAOOHbtCHtmAgSqoRdrDxBzHmSn6qvBywulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xt5wP1JZCLwAmUG7yCxzVydhc1wyn961JTwC0k3QEw=;
 b=femc118Zp0xgk2f8MEM6XQppw3/fLNnQHh5EP3uzlwgAGbdNHpLXVK+pwLFkiMuy/iN/w5m7xZf1Zc45EFcGFH4M7yZAmxZ4i4DLi/V1dzZ26rPUuvMjXoyq+MVK6F8MmqKEexouohNRULlKgdGnLHo6M2GziHNULPzxJ6Zg3cwnLXTMvpfFPaeXFSbE91GHhhdRH8x0nBB8RK+vyOjiwoOPsI2/A0wL9HEPz17ovwNnz5M5Bk4b44pMHdOcbRlakdzSAUBIJgZLyPAn1/yeGb+8r1wlLOskk5XZ36hNqtx0PE8Bq/BDefGdZSkP3Dg854Kjn9UcTOuiGf5iIu4CPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xt5wP1JZCLwAmUG7yCxzVydhc1wyn961JTwC0k3QEw=;
 b=KHaBws/rKgUFPg37sbyll/M9xaKKY8LTOWz5IMCb3hmODJ/Gq/Mj9Vi0S+8zgQbhpra4wj/opCKPSJjcX02aGUn5Gz6G5suPeZJddQ01U9972LIWIdwpLUkfFS0hx/rRS6TAsn0y1+jSKAlJqD5P3Iz8i1igGOaYhHLne/wDnP/l6AUuO3ETdRRK6jsrs0AEvsj9l9nehjiL7fDzZI0zAQqlDWktTbML152QRr0bC+ZpLYP/zw6XArt6se/mpuYSOes0C2nKsILg3comxojWE+Zto3mVdlsx0KdhMiaU5IcjG9xOlw5eIQBxz1OB/tMso5XADcTGTBST/pkf7ESsyQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS0PR20MB5788.namprd20.prod.outlook.com (2603:10b6:8:148::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Sat, 18 Nov
 2023 07:09:38 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7002.025; Sat, 18 Nov 2023
 07:09:38 +0000
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
Cc: Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and mtimecmp regs
Date: Sat, 18 Nov 2023 15:10:26 +0800
Message-ID: <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [7Wn98kPZzhlqDRSnPBsFClfz/5h4pgUfVZrY+WH2EXQ=]
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231118071028.248483-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS0PR20MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: b0079e89-d4c2-4cb5-071a-08dbe8055384
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yUbWmAMfiMdNMed2PAjU9Qyb7WECmUDB7nd1q8JOFHJJ999XvHnWY9Sld2WlRzJwnMlj6SLjvjCexoWjTLnt8eQiDPcdi9wqyPrjjxKmZByKhrXaf7oI7VOofpVhA+tyRSbU5fU+qlqWyuY241XfeFwn9ahh2TCe0zrGz8LeyTghKa7MC/XjofMZM2tNfjgBEaKwZB3zOblbFLBcKDgATIw7fDMdy538QGUMf4jzw8PB5TY9m5aBOKZ8QHwGVWkr5LEp/vXBkflwU0dH5H0MAHFLSV+t1B51f3IqovAKQiiujIAm81555vBj4wf+nKJ035fmM/nI+LkaYht43q7I78sC4z4QorgXGLh71Aqj5B98JuROylQGC5OSfAi/mSaJLDi7oyIFGi+7oNc/v5UFHzHePhJwiNZmfkS6gkdd/AYXlIwRec1AXJVv+n203NaOSyDIu4uWRFCyPs4g64wWYQMw0oAvGqoIPlVnFPEYKxmzbNIOGaRL1ZiZHIVelTpS2/D+NjaV6AeSiJZGzasA1Ovb3wVfTMysAnSU/w5VbCgcJGkZ4PIc4MTscimgMJ0BpHq2uD19VXSQAOJe/6av3byL8myprP55TOFG4hO4VXctXKKy2SnkcSXIbzeeJeD2k1OY8ndKgYNDL+aLNpLMjlIra75mZzYeuhqScGf0JO4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8z5kcswpejLk3xYcVFf7tf+buMYMCQYJDXWEYjw90m+qf5RURzeUghNopsm?=
 =?us-ascii?Q?sy4RhFboBvGQUVt9LWXMyiBqKKSYCCucTR56zONUJJB7qz6K4mMeWW3Wj/B1?=
 =?us-ascii?Q?Bj5gfHLfMLcpxFdgutZOYQxc1cRUKudJ9acFrDXrD9Eps0+xEQGAEspACoLC?=
 =?us-ascii?Q?isBDmNTKGPrswItFQ8DmpZdrjAq/8vvIZRF7DzVu+aCKme5IMh+kCrbsdHoC?=
 =?us-ascii?Q?KKcTngSYX4JWfhamZBxbwIOFtoVOSlq3I29FgplbhpJ+VwFC9+fYCqvCMUka?=
 =?us-ascii?Q?o/MRcGt/YUhnSKN1JSZOU1DGPUja0n/p23skFxbgMt3jR9Pl33fCN88eEwwY?=
 =?us-ascii?Q?z7+PzaJwJmFz5RbiFft5hHsVSnDblLgG9X4Hus6Z7kuQvdtOBExoca01CUtj?=
 =?us-ascii?Q?vu7fcyI6jX9rPr3aNffY/aUR0Z6y57XAu0NbeXlowOvIyPcty75JhNHydFJK?=
 =?us-ascii?Q?fjyjwKeIE12HTCaOed3mrg6fVckomBi+k55huvd3I6FsbFI2S3fO3nzWie0H?=
 =?us-ascii?Q?e7QUVGLDmDtgCVhHKqc3QDgR6b30Lkuf5K8UO+as20sBaQdVrRgDzDIglyBQ?=
 =?us-ascii?Q?rTHMFmrNznEqewtf4nYsuAmDk6PF0wQh3mQIoYRlMK7qRFak/uNbrsqykk1y?=
 =?us-ascii?Q?ccTG9gijDurepxNR+xE+mR9NUN5GM0D1r350KbINKQSXXMANr+iTBIsxtY9G?=
 =?us-ascii?Q?cAREtlBnfBO6CSOo/ouJxjONBnyhTfLAaC/l1DDKdIqo1JV3GLpKz0LZX+x8?=
 =?us-ascii?Q?RtYoy8htWEuH7RjerrFglvmQXfaVbrcXr5O8N9kU/+IYiX4/NA8SOymyQvJY?=
 =?us-ascii?Q?A0WCclYRqsZJk/WO8md+gS33lsyHRSuociBPGzzS5MVA6jZ0miL6N0TWJCUJ?=
 =?us-ascii?Q?4kJZU8NUqLP26ag5kwHaUR8szFXwDIV5P2tCuRgwvmG/7vC8h7OuuDCkdbgk?=
 =?us-ascii?Q?XH45BZjPsQ1ed1+mENpmrl1ebPFVC0+JkZWXve8FXzTYghRR9uXnN4F8Iz1x?=
 =?us-ascii?Q?TFHEmUwz5T8NwF9BabtytBvHZpV8lzUzWxPlN+7molfcgnt1TtxWrNyAldEi?=
 =?us-ascii?Q?mKyn4sAEni09bDPRfGqVuMqaIH8lbY0nhYv95QFvBi4x4xPoDaaD51mxA9Cm?=
 =?us-ascii?Q?ZNsDGojdPAZlWlSyLy2Z7pD3bxRC6l6BQ2raeVyLhQkK7eNDl+lmA+a2GIx2?=
 =?us-ascii?Q?hrdGKDne0ATf4ITWjr6SJEKW8wby9pz3hPI1C/cbQLnITZABDMxUFJYmFYI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0079e89-d4c2-4cb5-071a-08dbe8055384
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 07:09:37.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB5788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_230951_995067_08DA2902 
X-CRM114-Status: GOOD (  10.42  )
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

The previous patch introduced a new type of T-HEAD aclint timer which
has clint timer layout. Although it has the clint timer layout, it
should follow the aclint spec and uses the separated mtime and mtimecmp
regs. So a ABI change is needed to make the timer fit the aclint spec.

To make T-HEAD aclint timer more closer to the aclint spec, use
regs-names to represent the mtimecmp register, which can avoid hack
for unsupport mtime register of T-HEAD aclint timer.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT timer")
Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005693.html
Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
---
 .../timer/thead,c900-aclint-mtimer.yaml       | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index fbd235650e52..053488fb1286 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -17,7 +17,20 @@ properties:
       - const: thead,c900-aclint-mtimer

   reg:
-    maxItems: 1
+    oneOf:
+      - items:
+          - description: MTIME Registers
+          - description: MTIMECMP Registers
+      - items:
+          - description: MTIMECMP Registers
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: mtime
+          - const: mtimecmp
+      - items:
+          - const: mtimecmp

   interrupts-extended:
     minItems: 1
@@ -28,8 +41,34 @@ additionalProperties: false
 required:
   - compatible
   - reg
+  - reg-names
   - interrupts-extended

+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,c900-aclint-mtimer
+    then:
+      properties:
+        reg:
+          items:
+            - description: MTIMECMP Registers
+        reg-names:
+          items:
+            - const: mtimecmp
+    else:
+      properties:
+        reg:
+          items:
+            - description: MTIME Registers
+            - description: MTIMECMP Registers
+        reg-names:
+          items:
+            - const: mtime
+            - const: mtimecmp
+
 examples:
   - |
     timer@ac000000 {
@@ -39,5 +78,6 @@ examples:
                             <&cpu3intc 7>,
                             <&cpu4intc 7>;
       reg = <0xac000000 0x00010000>;
+      reg-names = "mtimecmp";
     };
 ...
--
2.42.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
