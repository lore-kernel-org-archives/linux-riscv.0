Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3B1C83016
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 08:04:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019FD20872
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 08:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019FD20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EsuAn7/Q2JDV2LVu1mzoEVR+fxcn/gD09ckeK5r4Gtw=; b=yhTt59jizK+/nFuqQKrgZvi46
	HKLYQInOd0sSBooJRrSxFv6LwIuesjX3O2asaCJGxd6NEWFTjIoD00iUe9uRai8NbwHen+ieChDb2
	TW2bCHEsVgUBHxywvX9RWeCOjbG6QbiSQXgSoo6Wge4QQPhgK5eX3N+LQ2FWHlEQAH+NDjdTd/2jT
	9HPCYkRU/Vdmn9IOAnQArKT3H3yPvagoWlj1cVpoPJ3scrE8I5yLIYSJ2m9qJxyjdCBImWL2h9gty
	e5kqk5KaQsSWsS8p4t4GpYKfi4qncjyBpBUQVt6U41ruHMRd/ifDTLoDcuS9GTX9Lba7FoDzI4ytX
	UdvP5k9Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkN82-00032B-3r; Wed, 02 Dec 2020 08:04:46 +0000
Received: from mail-bn7nam10on2079.outbound.protection.outlook.com
 ([40.107.92.79] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkN7z-00030h-RD
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 08:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aW0JAhfL4M0nGpWE7HP12r5RrpnUYKPokHV6+3oFdehG59UMua8mUHCi3JXy2mfep0PX9W3FvepLtyBR+khywMDDFAly8KD9dXce9TzU90XlcjpLBaxgipF0UkpVmshEdzvIk2PeVrVnhzRs33Dne04hLW9tgHR5VWxcTYFFnLd8qY+KQi6n0OILE9Z9ZEN07rU4UmWOOYwptdUmU+alLWcXfnjRGe0HhSjyLWT3VUz1TYOjuH17Kg0Wn4gntkDeD50ZQWm+l0DpEbMUc/p2lc3BgYU77LoU5CPlL9kyvinDcFH4VRzFWYGgpEwR4UJ6ZOY8+YA1WOxKWFZCkcVvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXeNfZTJwTQH4URh7Z09c8XBBl3wTwyVUsnPEBEg/I8=;
 b=IMnBuOkk4CgQvmjw0bhZ0tIk5unbpiE988oyX7yVDShFUep6QLxDHgk4SA+v3KfWvrK7JlLKFBGnAMdSCY0hzh65Vhdz+0I7XwA2JoPnYoT4A/4WHmXciAcnBIoeI96t3xYHv3Ua353s3oIU5vFOpFtFGHMXwLVSPfYcupCDNiM5WfHvYqjxLfbr7wXXKyvKfKbgsQEe+9tWMwyIJCvsnS2baPSd2vVmjE2lrAF/9oPBjGRC50E94bFl2JzidIRu4K+vjuCWPeofeUGHyJfJXMDsl3Bi0wJd5AmZwlUaTjT75l5OIjrfjBCy7G7WPMhn7+ulhlnvaeMGZZGA1wovZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXeNfZTJwTQH4URh7Z09c8XBBl3wTwyVUsnPEBEg/I8=;
 b=QDLUBMzXZdWL4HCKo0gls2oWjLP7whKSDayD+Yxfb7JL5Va/dX3HLEmAQNrJWrzbDd+bdWQHRZm38QFrQKYUDBELdx7pFiXugAEiMgV+IzOiNIXRrhb0TVzcGagW3rBYF7tmo1ukdYTSauRUkypveWxVNDN/0gc5Gaf4FtbagbU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from CH2PR13MB4458.namprd13.prod.outlook.com (2603:10b6:610:6c::22)
 by CH2PR13MB3543.namprd13.prod.outlook.com (2603:10b6:610:2b::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Wed, 2 Dec
 2020 08:04:41 +0000
Received: from CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c]) by CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c%7]) with mapi id 15.20.3632.006; Wed, 2 Dec 2020
 08:04:41 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: riscv: Update YAML doc to support SiFive
 HiFive Unmatched board
Date: Wed,  2 Dec 2020 13:33:55 +0530
Message-Id: <1606896236-62780-4-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::28) To CH2PR13MB4458.namprd13.prod.outlook.com
 (2603:10b6:610:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 08:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27cebd0c-b2bf-49e3-95c1-08d89698ec6a
X-MS-TrafficTypeDiagnostic: CH2PR13MB3543:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3543D09808E3A77B9CAD480F82F30@CH2PR13MB3543.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKiVw+5WpYF83zn91bOgBs3PYi6StLr1l0Qorgea/TgCBjeDPFy6c1veZMYQikqsyNHMJcpU8gyB0AsRO/y5J/M/Zj07Wund4fJkX8nTI+IS6iez2/9d4/MvlVAFMQGFcgOCLIfdPjEvoDnLqPOl1YD2UpG6D68fjr3R2ga8fanPuRgUk4dbQ34aygv+FehizpBwV5Qyv64Lr5mNOnK20R9rdzfUcFLHt+phZK4imX8OCUGcLWnFGVtNw/IXuduqtMowDAuk07LdJYe49WmY60Fff9R3q8xmqT8MvSBv8BnZ/IMXAjp8bWTLY834ie+oo5tZyChVEQnvz+WMoPgTIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR13MB4458.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(366004)(136003)(396003)(39850400004)(346002)(376002)(83170400001)(36756003)(42882007)(66476007)(316002)(66556008)(83380400001)(2906002)(4326008)(956004)(2616005)(26005)(44832011)(5660300002)(7416002)(52116002)(478600001)(107886003)(66946007)(16526019)(8936002)(6512007)(6666004)(6506007)(186003)(6486002)(4744005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BLeVorC7cRz2TZo9p7ZDPJFy/pPJj3pyqvbaKWueF5BsmLtfZ52WWHiTdg3H?=
 =?us-ascii?Q?CBPYtPtFet4/Mg6qcSeBg2RPYQQRnL35HOXBUSDiqRhKdlegJTiyUQE2Qfj1?=
 =?us-ascii?Q?ZuIehB/eSewGsD+T3e58/3TSrJIqF76RSsf5JbZycO/Y2S8VYaM2oOxczMNm?=
 =?us-ascii?Q?wBOdW7ZpcLMxSE5ixcHEYahBEc+LSlzsGZPa3kAzPOybM34hUMEBFFgP4Fu8?=
 =?us-ascii?Q?uRp5O+5Pa9Xrc6sChpnZ0hdwGQR0FCKGsDICLDmHuVptg+UwI7ik2JXmU5MU?=
 =?us-ascii?Q?eIRIdEIxDqoj+ygZpYaWuFbKugWY6xdGqLSnLG121bg6oyeuxthKIBhbGBMC?=
 =?us-ascii?Q?cKxO5LQFZ8SrQduyHUMu/kz/XbJ99D8hBFKwuwG9u7uL+Ic8Ph1XdZxyiwLD?=
 =?us-ascii?Q?tLqRxVZNxeXz+bpSW7pSg6d/ltqNCrfNO2dnhf5Cne7EVoaLHHNvBlsgNZfb?=
 =?us-ascii?Q?wu9J3Vj+RnC3zeAv3spjTeb0WHn46rcq54uhSbf46JXZeDjF2TNEDlvZADg9?=
 =?us-ascii?Q?QSjCBxbmpQ1lWrtIhQpEw9+f51owd9Ob7FOGZx4PghMJ0W4s8qeXZIlCYmCl?=
 =?us-ascii?Q?NkcZ25VDls8nxKKvtGHuoo9lkgllHLFwWMPPUIWEczym+gWetH6bPebIdU7o?=
 =?us-ascii?Q?O79ldERjFhxwbv3sJj2ta6feWHPLkbCKPtm+oHOxXEQFvM+TlD2eTlAvS2nA?=
 =?us-ascii?Q?3PHl3J3GMy4UCKizXNgGmBiGll7MpO1ZiKR42+hiG+mTmeZDkm6Lv8+5W7mf?=
 =?us-ascii?Q?xL8cqwOuIJm6fvoktWoHkjVRMUbo42wtJ1BrjeDlgutEx5LBWBeYt3Dz0nfm?=
 =?us-ascii?Q?rP9Dl4i8AVeDHL+/hA9NRSaxruxtvP29IMvBrBBwUKbHKspITf+X9nbHfQp7?=
 =?us-ascii?Q?UASdt2Hr5G0ypth5V3FbyfYlSp921ZLpXkiSP+prigV83WwBAsPBQj6oai9O?=
 =?us-ascii?Q?9kh+bqiqpC38vK2kz480gFWzWYyP3Rv+d4eAwpb5vC73iAaJmlLaLztoxGP6?=
 =?us-ascii?Q?vYYq?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR13MB4458.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 08:04:41.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cebd0c-b2bf-49e3-95c1-08d89698ec6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh8EjmjbbkCD8iioVYA15/FZ+rO0e4mE3DSBNwl6OtBYFF2t/c7yzIpeqmlAmDQJsMGnBXxWt1nZ3sI+TyC78A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3543
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_030443_937324_BF6AC31F 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 sachin.ghadi@sifive.com, gregkh@linuxfoundation.org, broonie@kernel.org,
 paul.walmsley@sifive.com, robh+dt@kernel.org, bgolaszewski@baylibre.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com, palmer@dabbelt.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add new compatible strings to the YAML DT binding document to support
SiFive's HiFive Unmatched board

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/riscv/sifive.yaml | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
index 3a8647d..ee0a239 100644
--- a/Documentation/devicetree/bindings/riscv/sifive.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
@@ -17,11 +17,18 @@ properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - sifive,hifive-unleashed-a00
-      - const: sifive,fu540-c000
-      - const: sifive,fu540
+    oneOf:
+      - items:
+          - enum:
+              - sifive,hifive-unleashed-a00
+          - const: sifive,fu540-c000
+          - const: sifive,fu540
+
+      - items:
+          - enum:
+              - sifive,hifive-unmatched-a00
+          - const: sifive,fu740-c000
+          - const: sifive,fu740
 
 additionalProperties: true
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
