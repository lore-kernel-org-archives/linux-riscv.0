Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BA1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 00:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCjlA7e38wMP+cVXtRpSz3F9tTld15RxRsHZry+mb9o=; b=hhXBQRTyUI1iaE
	pW0FhZP02ryE77iU8MNs16q/lhzW3pifTeHGxgCYloy50t5RHZXxxMiodWXcQnptwTXifqeE8AOEG
	0nBTsoNXxWRHcuv+cZ6dyh0sxFZgSH5deHtpDRpC7oj8oGmut9RhKa/A91w73P/WLOtzF3nZ3ZrJk
	KTAoEF78TSljxE3Vs6DyQjPtI3Fr+4bJZfAwrMGPtJbosorqFh55pNfMTC5994wJ/dFvzZXR4fNwG
	fO/G0ZcRot86lS7mmN0IKVMJtHFDoo0uoCqMBZiapZxTDuaODWoeU+LOOMMPIu4XmP+RXCnI/zfUH
	CIQj58ev1LQqQwI+hJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOqkB-00EXDi-VL; Tue, 01 Mar 2022 00:52:00 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOqk8-00EXCJ-Iw
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 00:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646095914; x=1677631914;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qrqKPLNxPchuJ1SGMUt4R+/jCJnFlJ6PqjTtV/j5N00=;
 b=NupH1gXx3+IXhpCuzTmOO9q5E/xk1MPJEH9l1f7od9CUD3hxT2f48y8H
 OHTpICE8KtdaJAYaoBgWAaMHeZliKv6E9P0WnGiVkxJyXGJBiK8q2LCR4
 NjR9KnUFBcmGJD4t4lPgFUWe3yvhFeYkx9PF71jcc3YF8kjB05lqON/N2
 8AiX/IfW9HSYLXKM019xP617lW7LLWnfcZ/XWQ4lW6Q9OGxeE0OMGH7uP
 EmZ3aikKUc+DIuE4rRBrKzS/AJcf/nunHIzrZO4xg4IXInd0z33AQqC77
 PT5/M6FdbCvJpW+XorovTH7/qXCJNf6fSikWMzLX+2mNSgdC/MGfUoXdu Q==;
X-IronPort-AV: E=Sophos;i="5.90,144,1643644800"; d="scan'208";a="198988113"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2022 08:51:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqcHNsIop/MayFLZGWPqtXmImnW2PVu7lD9Gtrky9n+WCSk4Lx0xg4C33o/QuXVD6G1LuxGdIzniKjqZJkh5ezBV+4jlL3GSLXrMYcraHNCIcbLxYJGT44Pyp/9JYFlgMY+KMJaq+hsmlREZcRCBaRQWZd0/nyt9cIfCHCx8u8eXzR1eT9R0mWQdoeHTc1QWW66PQhb+Pa336X3FmrhbcsBDz5g7U6VjjAv2URkJHK6bSWgp1Ew/amW5vaTem54ogiFGqtbxihxJ7PVuMCzVt2ns3fVTFd06cgWFzicK+b+TwBKrrMZZEyRVxuOEfe/ee4pQmiz7a0cMJd1bA2yFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ9zWWx4BUgLeZKyDI+KEziLg5cq+SmIuCFrJm082+E=;
 b=alZaprDu2iKcZPtpIaT9t09AfywpVWm7D54IyMHvZVYGMPybVjqUo1EDSWe7qORhIieWSbbcJbz9m2Q1vkmPMhcjXwzSSPb/zE97Gt2xDH48K6fktYsnNlFGQgSU5xSq3qM4hfDA7qTSETN7VVwpNmmOjLwlMwB2S7oYaGbWA70hhhAukzZFTeTN1zW5v65hHpAMFT0zYLfAHsFNXzeUfXNQvszNJA8xM2TRClgplrImxdndWq0DLgl7l1IBxy3azn45dKEqf0+wVXEG5Dtabfd0C61nfCo/7zgq3KlYk6U17YcE0GJ8GYwYmoCgHQZ+dTEbDsoI/DgJTVZUkQ7x5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ9zWWx4BUgLeZKyDI+KEziLg5cq+SmIuCFrJm082+E=;
 b=yUG7HXB8Mx5KbbMuMtlBTnIyFlHW2csJzyZDgF2s3I5rKorFwTMdjkrqFUpiYLFkgwZuPNekVJRyJ4qQy0Jcl5vAXsUfO35pcdoiSyrRCbQ0UT7Pj29GlvgvKtVW0UAY9VcubWVJKZ2EXKAZjZVapPpvJkLlGltA27hT1/1ecA0=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by DM6PR04MB4604.namprd04.prod.outlook.com (2603:10b6:5:23::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 00:51:53 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 00:51:53 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
CC: Niklas Cassel <Niklas.Cassel@wdc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
Thread-Topic: [PATCH 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
Thread-Index: AQHYLQaKb26mBW8vWEWejzanD4SivA==
Date: Tue, 1 Mar 2022 00:51:53 +0000
Message-ID: <20220301005142.3038702-2-Niklas.Cassel@wdc.com>
References: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bd1a245-64c9-45c4-6e3e-08d9fb1dad73
x-ms-traffictypediagnostic: DM6PR04MB4604:EE_
x-microsoft-antispam-prvs: <DM6PR04MB4604C7A654F476934910C4E5F2029@DM6PR04MB4604.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20SfTcguorIjgx2pW+apG1EzWh02YXepzfCAHxEY2DKdRY3F7J3JGvI10A03ChHakgFsaz6giDIaGsZLJDgc5scgDljETdwUdvb1bGlRXocpOPX9E6pgjhZiQc2o2ykbwM6b8IPKQ9iDHgl94sLyg4AP9td9bxIk77DGDRQgk37NH8zZoLGnTN6+xo1IDEP7bDjsf+sYFGZqZCnB9YUB2byiv7Y2j1ga1bvRyU/HZfXK+eOPaiuGxiw/SYuYl5ZDLd5odGoxfR45yL9HliRtpOGR36rBUb4AnEG6cokpIeu7A54UMIj6FO1mOwnzeYDL6gf5ITe4rSaVZZjOJ7nMKTlPYE5uUXxu4pb0TIjTMgkcicTnIQmiFMRCIkgXTM19+lbHXP6TQWM2LX8OH/mMWWGVqfDpOiLwXmSjRZejQPgfFcC2Pti9+FGKz9fA6dru0kwKQ8YORcdpX5VF/08CQu37kRcokavBA8nhgyGOFBHzpQvblVSgw5z+upBJ3kGs1A0oPMeTsSwSjS5toW+UECS+ywTLUl8/Sa32masQd2+YrhH5Xf0ohJ3nVihw4nrYAHcnQ55ZPvCkv+iUyLjkHt8WyPxymciyGz/ScOEl1TAInoFdE163mvfQ9Hpf0jKhfkiv+o4iLDA6k+aLm/pqdgVEaOUm9YexHWJApAFsHT3lC90uptrQDqCQ9be+5m0htJBCMkvB2g6IPmIPdn2REw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(2616005)(66446008)(64756008)(71200400001)(66476007)(66946007)(66556008)(54906003)(86362001)(6486002)(1076003)(508600001)(91956017)(83380400001)(76116006)(36756003)(8676002)(122000001)(4326008)(6506007)(82960400001)(8936002)(6512007)(38070700005)(5660300002)(110136005)(38100700002)(316002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?774RP7gHrAKF/TTwWwh2lANcm2hCFHLUcrnwHh156GbawRGIab8Lad75NV?=
 =?iso-8859-1?Q?BOSLvi+0E4ag40I3+nWKfuKCjP6Ed/8yfjrC2/WVvCih6IDNbNjHaWuDly?=
 =?iso-8859-1?Q?DlcdkehWIY6dul37vKM0EdligAksPM+65hAX/+UF3C+4/1F2vPBVh1GXoh?=
 =?iso-8859-1?Q?OUAuSg2YjrYNfw6QYDlXenGMegw1xZInnEgfMUKejvLYdeLreKoLVdJ6+z?=
 =?iso-8859-1?Q?Fhjz2AuMGwiR919pg/Mf+nq6FPQrY7dz5HtgKPL5zpCYlj7yTSsuDmQFYO?=
 =?iso-8859-1?Q?1eXllJuScjovagdphM5bIUyvKIkzPcLpV+rAfLMvuZ0CDiqLdHA7nJ9S3D?=
 =?iso-8859-1?Q?BQQAbOUcjTcFhp7CDFXo9eO3q2YTLPAN853oyH9+cVNquKfMdsGxuqupC2?=
 =?iso-8859-1?Q?iIehlf7J77NuqnRSkOmaEGc1bCEvipegOVf/2j/0WZPpXiAg68YDsh86L1?=
 =?iso-8859-1?Q?CAJRroaJu81XFS9qy3oHwx1TRzne23/tLSFcUBGf42jIBjzDlwhHTx2yp0?=
 =?iso-8859-1?Q?/E+d63qHqWMd1+Rt2AN03Hw3IvrthsGbZ77VXYxoyVaOfH5pyWqmmDJkFb?=
 =?iso-8859-1?Q?jP6X5ABsupd0oB2gdusX7n5bqYZpdvQfnEKcodTcQyXi4a1NhaQKIPrs4c?=
 =?iso-8859-1?Q?9mndBLLcIY/IlMNDG2onTUCdsO1CKD5++OBQDkUq3jPqBaNgPLS/0Myqf1?=
 =?iso-8859-1?Q?U1+nky0CX03STA6rXQx5NlF6sP7f4pHgALhBFGsVL4rnIvvJpWpaL7hNuq?=
 =?iso-8859-1?Q?qLI85xJTWHogZ34Q1P8WVN7tbH7gI9j3ZFOcIkNi8VZfYhn1M2MMKgeo+5?=
 =?iso-8859-1?Q?Fvnn17nKx/LDEJ8nXvHch14CnDj5jBs0q6DoMc8xROIP2VBfbbJcHKwZNN?=
 =?iso-8859-1?Q?WfuCWBYnYokensjsLfv7pXqEsboqFbSvFmA7pff8hRLe1ovZOFP5jwwGEq?=
 =?iso-8859-1?Q?IcELE47NXci4mflRBNej+xY5JsBBu6U/vcNGQdjHUOyTsiKT9QkJp/Ewr4?=
 =?iso-8859-1?Q?F1NwdL43cILxhRXlPg2RjGRd6H4QyWND/lCvO5mXh3zaOhKPZ4Bhy4+Osl?=
 =?iso-8859-1?Q?o8eun/YFTdFIMM9vy0MnrbVdtouxtQjOxTpEl7fctbcV1hSjI7lvJS4yNU?=
 =?iso-8859-1?Q?QYkqtKzXPQTIkRSd/7E92YX7KzySdARrVO7XYNe2HOknd03ztA7VdA7WtK?=
 =?iso-8859-1?Q?3pjORRQkp4gyubhekGGKVIsUufSaP7OEQ40k4/aejxaoMgCxNd/tvuRePL?=
 =?iso-8859-1?Q?SOb4LENWI6vT5daIp+2qnUxsljwD/J8VGAz3uCP6fv+SKCPbDNaygaGqnz?=
 =?iso-8859-1?Q?nvgpqx0t+izDbVGf6+KUjnqi/XFUGM58rQ9sOyXH7aWmXMjjSg8ZL83czy?=
 =?iso-8859-1?Q?+vcpPWIUw4RDucM++ECc6ljwlIts/k4EHl6MIKGRFp+rsWnL0BYMNG8keM?=
 =?iso-8859-1?Q?uKtY+Yy89K60DDNWxOkhANe0jP32Lru9qUzKQUOSW8O1jMUOPUzjRd5SY8?=
 =?iso-8859-1?Q?x1DEUaxAnOR4RxP/IhGoQJj5cHxknTlGgl8Jn8YW2bk048O4jI/S8zTnSG?=
 =?iso-8859-1?Q?8amvGDs6FQNcl/LNOLWyBoS5tm2DllYu8RsBYMe3ZyAMA4CVhII4itI9zP?=
 =?iso-8859-1?Q?8n/PLt82O2RE0x0qmCkNmV8vA0UU+3prkB5qmFtakBg2tyhAqdqJsg3LmK?=
 =?iso-8859-1?Q?X76T38vMmNMcvxeVsCw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd1a245-64c9-45c4-6e3e-08d9fb1dad73
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 00:51:53.1032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0LPO0u8KYs/1RYv2J8tSsaRxDKd1I+97jzIT5DSiNCkbnWPIY8R/qdegD4XmIymNeu6fEtaVMNoUD9aHJ2eI5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_165156_661498_E336CB97 
X-CRM114-Status: GOOD (  16.54  )
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

From: Niklas Cassel <niklas.cassel@wdc.com>

A hart context is a given privilege mode on a given hart.
The PLIC supports a fixed number of hart contexts (15872).
Each hart context has fixed register offsets in PLIC.

The number of hart contexts for each hart depends on the privilege modes
supported by each hart. Therefore, this mapping between hart context to
hart id is platform specific, and is currently supplied via device tree.

For example, canaan,k210 has the following mapping:
Context0: hart0 M-mode
Context1: hart0 S-mode
Context2: hart1 M-mode
Context3: hart1 S-mode

While sifive,fu540 has the following mapping:
Context0: hart0 M-mode
Context1: hart1 M-mode
Context2: hart1 S-mode

Because the number of hart contexts per hart is not fixed, the names
ENABLE_PER_HART and CONTEXT_PER_HART for the register offsets are quite
confusing and might mislead the reader to think that these are fixed
register offsets per hart.

Rename the offsets to more clearly highlight that they are per hart
_context_ and not per hart.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 drivers/irqchip/irq-sifive-plic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 09cc98266d30..211bcb10aa93 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -41,19 +41,21 @@
 #define     PRIORITY_PER_ID		4
 
 /*
+ * A hart context is a given privilege mode on a given hart.
  * Each hart context has a vector of interrupt enable bits associated with it.
  * There's one bit for each interrupt source.
  */
 #define ENABLE_BASE			0x2000
-#define     ENABLE_PER_HART		0x80
+#define     ENABLE_PER_HART_CTX		0x80
 
 /*
+ * A hart context is a given privilege mode on a given hart.
  * Each hart context has a set of control registers associated with it.  Right
  * now there's only two: a source priority threshold over which the hart will
  * take an interrupt, and a register to claim interrupts.
  */
 #define CONTEXT_BASE			0x200000
-#define     CONTEXT_PER_HART		0x1000
+#define     CONTEXT_PER_HART_CTX	0x1000
 #define     CONTEXT_THRESHOLD		0x00
 #define     CONTEXT_CLAIM		0x04
 
@@ -362,10 +364,10 @@ static int __init plic_init(struct device_node *node,
 		cpumask_set_cpu(cpu, &priv->lmask);
 		handler->present = true;
 		handler->hart_base =
-			priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
+			priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART_CTX;
 		raw_spin_lock_init(&handler->enable_lock);
 		handler->enable_base =
-			priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
+			priv->regs + ENABLE_BASE + i * ENABLE_PER_HART_CTX;
 		handler->priv = priv;
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
-- 
2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
