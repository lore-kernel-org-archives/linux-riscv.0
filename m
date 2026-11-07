Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11495606A32D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 03:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kjuorEjX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mq/LAbhDKrOPp7s5BU+9YqdV3XgmXus9yhUv7/MSY/s=; b=kjuorEjXzXHj9sv/+CrwR6axgI
	avPR9X0R+gUN9nK6rJhDzlgRIEY887Yxnebp+TKI45H78vnXGoHb1X0PsJooajFE9LtPjfPvgSbjj
	I/owlnolOAp7GNksxew98/JHSb0uTkfSINCLAXZ5SvfkMg31NtSBWWFgOjdKm1AoEmM8yQeYUbQnl
	3KyOOH9DSM/kXEowiEPQTPw1RrzcWYgfH8e4wEI8IyQbi3fbPgsnRE8UK9B/XaFtl8LLSnC0cdVBa
	IwmhB24jTY9RCLxTQUGaGbD+NieIcCvHFc7uWVSRCh8XM44mxTt41l4cQ8Jgql9E6HKPdPSoY850t
	HEGMjXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWrq-0000000E7Ms-02Ti;
	Sat, 07 Nov 2026 03:13:22 +0000
Received: from [2406:e500:4420:2::717] (helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWrn-0000000E7Lk-3iwj
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 03:13:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSxba/n1yyTnH0Fzb879nfKfzuurKfO4Pyx/C92WaHTLiRDCdjXEasJuUtUMVBnX8JFBqBWHRW3fatfkiEqqIbi0s7kO+1IKX5ux5zgUgwr+yebl7RqDOKWVW2g3MiVc3CDUw5zm8+IP1LmAWP81eO351POU27SNmn71fdgxju1oKPSfwxUEeT3b//WVfshF7rIlP2WLrJs2/Kg42utzm+3vBJjvcWHppEsEH9bCxkiWZqZkWck6k4XLjlON4ADvjsapKl2oUxVe1+v0PJPYVVuANx0yFhvUBlPJlwdrjJTTVfdN2pVJOwdoNFrinAMwk4W3qqdwJDw03AHEdqyYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSd6C4xO1YZ395Te9Gzj1wSUeBxODnJJn+nUgxBV6c8=;
 b=YpJp3R9fNUsHdwdBBzwSCuD4VoSfNlDR5I22A5ua81y+WIDbobX/iekDlJgpV269fH+WPDml0Et/aoToKN98YGNPT/GXY6j4TNB4i12ZkVRqTnzltDCL11+ARlI5H+fNUOjmrdQI2PaGfa5D/XIHHhbxSsKBHI7CRKpBW3pcFd6/Pi8vqFUd5PSCamOmEshdG3ZBd+AaAZi6uG+A82YgJcmGvgEW7YtKDAz6MfM/innc4USIQS/063OzILvkmUoAsXhlUrY/iuHeoz7BMVMmhcP03rLZf/5H91LXbNtdVFEyQ8N9PKsljBVQTsKfJZp3CMhgIOYTbkM4qRT/P1WBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1261.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 03:13:02 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%3])
 with mapi id 15.21.0592.010; Sat, 7 Nov 2026 03:13:02 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Maud Spierings <maud_spierings@hotmail.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v24 1/2] dt-bindings: pwm: opencores: Update compatibles, examples and maintainers
Date: Sat,  7 Nov 2026 11:12:50 +0800
Message-ID: <20261107031251.98972-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20261107031251.98972-1-hal.feng@starfivetech.com>
References: <20261107031251.98972-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0007.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::14) To NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1102:EE_|NT0PR01MB1261:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c934686-3380-4413-5b19-08df3c7d0867
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|261026140227099003|38350700014|260925021311599003|260925021911599003|260925022911599003|56012099006|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261102123227099003|22082099003|18002099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: AZJEYvxIAvo7phPSG+WwpCC/pS/9aqK4LTdvmvs8dX/66PlGo4R6wVE60EtY1KE83vsnZJ0Q9cumax2GpY5MeKQOmDpTJFekkmifuL0jttWwaBnTzqYizr7LhkrBiK2axQUsuXlCy2ihmSY7IOtAN2s2niBCJW6r8LrtIX6vclhYe/+rmFFbggFsm3sL/er3cl2jhmvAfjPRNEM14WyZ3Ep/wKqpp8Try6K7loeZRfpXx/Dhig0A8BzjC7cJ6LO2GOfx/71aKNXUyL3uG3yMQcCaNxa6cVD3PGyCdLzOIRjZvP7gzawHTNszthJmCHc1pDU9P6WEACOGiU2zaVsn54/pvzB19Kkq8B+aj58fS9fgS0d+uPORNGsxerLyLPROGvk9vWFRSmtuun0gWeZB0Wt3iqckp91UyBrSF/PnomeOiLfujuV4UA2PMkUYNwWGyBOpcME4z507N3ZXgLtya7PPfzksrFt8i08pocbfbdmtfvaulrz9aH+6Q6cTSLxT8qBFpKj6j0Vnuvvg7SK/88uWmiaZNggaSl6oGE6V0n/vZP8E8+9cGvpJnv9GkBfj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(38350700014)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t4FAr4AWs8q3DmeMBYupzx7duhLMTb5hA7Wu7zkxGipHmahqnW6vCh0inxH1?=
 =?us-ascii?Q?uOMhqrt5PqraS2UC+8gMWT5lVjV8hQlJx/LhRnZIjlmfoFDXs1vb72U3WFKL?=
 =?us-ascii?Q?8d8EgygRuFDveexpW2mU8zj45dxbLH3nvK8WsNJDPm/8ppdPS1hKtEWQJgMp?=
 =?us-ascii?Q?X3deF+k00T17TSnU9MuC0EYjuNthHjKpuRxbdYC/1dSrjvU7eIsdT2vAFfXG?=
 =?us-ascii?Q?0naAfyyNTlY9WqDRkw58cbjum+jSAUYryL84bjFDwCsc6wO4iPjccysT1t56?=
 =?us-ascii?Q?PxDissQQx1P+jGjMNes2nd29+xWmGEHU1WUblz4/R3RA8k+AI86sYt6MI94F?=
 =?us-ascii?Q?Xho0GISg2P7BL5NyOtz55Te+26IKVryW1f9ix50KxDaugR/fPJ2e18HPqGZ/?=
 =?us-ascii?Q?4CyBQUsDE/P95JxAQIJNGZlolI1Vu9pzMNhCvOPgGg+QhzGPfdNrEwtQ6VxD?=
 =?us-ascii?Q?zIe+NcQyQOAPT1J5kYTlphBlJHCJREI4ZwGcSF1dDa3mVYI0LRH4V6/F18sk?=
 =?us-ascii?Q?TFDKrEt/Fx7VLNxMpwkie5PswAdCS5jNMqEblagU0lGo9nB2nvu0KZfEsYvI?=
 =?us-ascii?Q?rs54kbN5U/tE5/C+tXmMcCCyOKMG2J796X/g7PWgkJkX8MI9N4u3T5tlOmj5?=
 =?us-ascii?Q?OQgPmJrO5VbQ6bAG5ewxWF7+5Tq79tsehxAneUuHpJWeWc2sUiSgHRlzY+aM?=
 =?us-ascii?Q?45A1bEFgKPjdub/nrcFpAtkKVJ1uX22rR8U7SrdnEOIeikajttq8NjIk7Ra9?=
 =?us-ascii?Q?IWQ2tIU70S5bqOT6IeebI421uJMslNHXXEg21K7zI1hSk9yNYm0Hf5uRgSYK?=
 =?us-ascii?Q?7DwdxDjl/mVIySrwpvtDICiS5y/UwKkdna4K7nzwQShyNc+Lxy4tsf4Y8ySZ?=
 =?us-ascii?Q?bS7H7SCPk2aucSsE4PPAPkeojB7ik8gjw8/aJ6sw4oL5HIu+hlrwnMTCwJ2G?=
 =?us-ascii?Q?R9YU/hs6zclqWlb22Dbck+Yo6TBZmKV5FVhcoAd+kpjpNE1KntoiwUUd5BFJ?=
 =?us-ascii?Q?PNhWHDq9h214R+vDJL8TtEI/lw7gWl+KCQMjua0tky2PvRi4mD9HBi3wabke?=
 =?us-ascii?Q?6Ec7DvZL773r8DodoI5a+HM4/ymUlj60umDndxMUGOV/0Vfdx6Q6NCjX9N7d?=
 =?us-ascii?Q?yBYxXybrilxVrSqWQmQVNLPgQnw272K6V7hBaL1FclGqyMLG7TbtmhSPMMju?=
 =?us-ascii?Q?01pB9VWTlnhX9IJBO8fL39Hkxb/KD6Dxe7BFLj3iT6nA/kcXF7ddkA5Jssh6?=
 =?us-ascii?Q?4YcydwQ9P3Ex5SlNlQtI+LvozfdcCGCbHUihZaXC4wBtYYUvs6RVRbbIwEl8?=
 =?us-ascii?Q?FEkZh4TOW9u8XutsNHrDuXK3fuRBTjYY3ZAUOXMJEu9SIybC8U3iXgKIdD+J?=
 =?us-ascii?Q?LUxLtL/cYX6Yc/7fxkVozCj9sr2qMfXopCpgpA97R8EQUvIBORj7hAwE9ZRQ?=
 =?us-ascii?Q?HyMoAZtK84U99EB1qaGVagWwPbzTRHIB+yazpKA0oj1kH2jk7OeolJhED2KS?=
 =?us-ascii?Q?42lSsUUu5DcFX1psjhHBVEA5YkLa0ghWVuUOPL4fAth/FTO0UPE8iF2KOKYs?=
 =?us-ascii?Q?s0Kxk+g/8LXrb6Bj2ZRCzKrXysyQqtZRImM8DS1xU6eEL74jX2LV037GFfCx?=
 =?us-ascii?Q?NpFj6z0W4g+nN00U2Tc0/9QLphxfcHCnREqcOz4cjHl7YeUaGDB7jNUzTfFM?=
 =?us-ascii?Q?gX0r7k2gHww6QaMutm+jYXg1fyfQPDzB4n71VabWXqfNgWSrjdRuGIUOKJ3T?=
 =?us-ascii?Q?YPqhOPcgV3lCQGlW3WA1I9iVbQTQrcA=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c934686-3380-4413-5b19-08df3c7d0867
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 03:13:02.0690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSWo3bpqO9JZ+0uQ5HqHWntrCv8fl2GewnR2krLfs1VX/mpLSNMAVJ654KNaQriSikRCL1DlaV/eg5obtbw4ekXmsCWo3b8+2gUIeb7uzqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_191319_954378_F7BA6AEF 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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

Remove the jh8100 compatible since the JH8100 SoC has been canceled and
will not be released.

Change the register size in examples to 0x10, since an OpenCores PTC IP
has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.

I will maintain this pwm module in place of William.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 2529085831b0 ("dt-bindings: pwm: Add bindings for OpenCores PWM Controller")
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
index 52a59d245cdb..b15468f97b59 100644
--- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: OpenCores PWM controller
 
 maintainers:
-  - William Qiu <william.qiu@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 description:
   The OpenCores PTC ip core contains a PWM controller. When operating in PWM
@@ -23,7 +23,6 @@ properties:
       - enum:
           - starfive,jh7100-pwm
           - starfive,jh7110-pwm
-          - starfive,jh8100-pwm
       - const: opencores,pwm-v1
 
   reg:
@@ -49,7 +48,7 @@ examples:
   - |
     pwm@12490000 {
         compatible = "starfive,jh7110-pwm", "opencores,pwm-v1";
-        reg = <0x12490000 0x10000>;
+        reg = <0x12490000 0x10>;
         clocks = <&clkgen 181>;
         resets = <&rstgen 109>;
         #pwm-cells = <3>;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
