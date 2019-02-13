Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58B5C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835EA222B5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QDxqhOLs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Qj1R679D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="mwIr/vyP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835EA222B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0H1h/FDguWf8qEwcHNfZnKt4Bt6BdVac3oBYfq/69r4=; b=QDxqhOLsU4FzxL
	MWyjf8ld81nir+j9pkf8cmQpYWjwjo4B5FVy2HCE3A9v776GRuB+bXC/+oIyaz0oQdXtQfiof6fPz
	gl5XgNo7CV4LQDK01LaYizyranIN/wfWNMqd/L8qlcinoMUUgAOEll3LKu+3yGO/w/UpyUdsdJhcd
	slbb2zAlEL4SoGroYAlIGzWu5q5QIvpkYnY0NDFk9TcXzBSGMjBdKGYOlC0GujkZ1jC3gApUydSjo
	zxeDrDJIaHFjgp9wZEBT+e1btqhiQjNsc9UgR6zAamFwA6afKkpycIHjUwBoUk9MDiDMOlaMYPlxK
	8tBUG/zu20reSH5/aVeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtt78-0007wk-Lr; Wed, 13 Feb 2019 11:54:06 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtt6w-0007gU-Ss
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 11:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550058835; x=1581594835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hdynpLsXwVKwcClFb4N8UkG4HyfxmZo8SJfWqKU4gbc=;
 b=Qj1R679DPDvmB8xfHcLZQNMsC0DISurXId4XBs0G75XBmToKnqgKnvc5
 DMoZlthGd1Z5I/ojTXYLU6/RpMQG8ADgiAv+VNPXauJXKYKTlb5B02HD5
 k+VSOY54OMDBQuZhNTw+hhKuav8HfLWhhtnv8P1O8bp2a/fh0MXen52Wl
 xLocdrGMAnB/hwFN+vfeUbLY8T8xJT3zmgm25bMD+e82BsZgIT7auL2Du
 opI/g5xD16Y5YyDOCPIvB8lIcPW44Tz1XyftWYZgu4yxz9YUnLZFBoU5a
 hbOVD4XyH84vlcT+ytmlur6sHIPEDeZC4GvaWzScEXUYdVJJyGTmQM3T9 A==;
X-IronPort-AV: E=Sophos;i="5.58,365,1544457600"; d="scan'208";a="101095245"
Received: from mail-by2nam01lp2050.outbound.protection.outlook.com (HELO
 NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.50])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 19:53:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZN5zUH1x1xZWl7BtTWHLtybsd33DX9UC1Eh7RejOP0=;
 b=mwIr/vyPbuT2ZifYFDqKWipjDgC5/GFrsLCBLKeb/BHwsqM2UlloEw95hM+1bu4lo6jnTbJ8RRgdL6iF6ozuY2dkrCVsNPCXA1AR/R9ubCMXUi+Gmoyi6M0RoJNk7la7/u5c69NunMxOAMhX8Zr/swzqS1n5WAiN3MKkoxVeCkA=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB4458.namprd04.prod.outlook.com (20.176.104.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 13 Feb 2019 11:53:52 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 11:53:52 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v6 5/5] RISC-V: Free-up initrd in free_initrd_mem()
Thread-Topic: [PATCH v6 5/5] RISC-V: Free-up initrd in free_initrd_mem()
Thread-Index: AQHUw5LJNBZjt056iESEmmv3JNu8Cw==
Date: Wed, 13 Feb 2019 11:53:51 +0000
Message-ID: <20190213115301.103989-6-anup.patel@wdc.com>
References: <20190213115301.103989-1-anup.patel@wdc.com>
In-Reply-To: <20190213115301.103989-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::17) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.52.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 535f05c4-daa7-4d09-c1fb-08d691a9ec07
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB4458; 
x-ms-traffictypediagnostic: DM6PR04MB4458:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB4458;
 23:3HjocLzHNbh/M6pXTkTBAZ4Xc5VNOaBoTX/RdSO?=
 =?iso-8859-1?Q?Mxxu8Ftzvqv006hMN2M323tfywA9UhAAnkx/hjlAmJ/6mJa+wacg96e3Qs?=
 =?iso-8859-1?Q?rye+SunHovmD99NmUwuT/aXsr6i0xRQ2FIyoeVxJ8C9Y7SMMSn9y+VlL07?=
 =?iso-8859-1?Q?i9bskONLt9yWItENHDKYGCHPkkmcbhq7YnyZRDiK38c42ozsMhmGJRRCQI?=
 =?iso-8859-1?Q?PMbYA/dHooIloJcb5cXVJMHwxhS9MSzwlqFPYk4QPbPEZjTxfh7zTK4I6w?=
 =?iso-8859-1?Q?Uzd3Bkq9McKpZovUnIVQ7DVlC+ltwRYLKovOb927uRlyW1tHpywT05MJVq?=
 =?iso-8859-1?Q?KaNlcf7ShL/8jHnlZQ4dlFWnjJzZWjBknl8vNICCoN7C2QavHxj37dHlEy?=
 =?iso-8859-1?Q?VT9R51o6IQefrgnfx0e1CIGEG2Noq+XODvbcUqY1LO3TaE7iufiawYu7Hq?=
 =?iso-8859-1?Q?He9N27RNh3BfaRjMK4QnIxpqt4Fj6qCtib2U79Y7eRsbNBzP7xc7cdjxI0?=
 =?iso-8859-1?Q?+xegVQqsUrGy0PqobE1JniZvoPwTXzobPSG5eotDhATroTr2XTsZTfn2U/?=
 =?iso-8859-1?Q?SZSW7ImJH5pkjFxmJU9HqDTPYieOfBhkL6QmP/m/5elGndPEaE8roJfLMg?=
 =?iso-8859-1?Q?hbVU08onU3ux7jr/leJl7H8Tz8Dbe07/SqiCR8poQolX8puyjCr8grlipO?=
 =?iso-8859-1?Q?7qFPjY87pkRwsavS5CCIIvwEgq6rKxm/Fy9Nz1TP+1dLMcWg4TmPYdOb4t?=
 =?iso-8859-1?Q?mJeQZTbZz/aj4bsIcTC3rj7yHAKIYX1c3YXLM7f9iafgs252PRc6JKEFQh?=
 =?iso-8859-1?Q?Mc889gsIh0oEYjamEnYtQY0RuByV8ZYMKryuGuLLXSI2uk7Lgw5uD/ACXg?=
 =?iso-8859-1?Q?/EHrfAmJMNeQDjZhYjBzmYPUwNacAmU1eZCHJha+C5a38dKfajTX4gphun?=
 =?iso-8859-1?Q?HOXY4bPeMY9AVl0usYT87gFJvHeAs344d59PDVzlyZQs5BEDLh4mDjhb3u?=
 =?iso-8859-1?Q?egIXgh6dkIVAzN2yd6TkuKlGGqZrofngYhjQ8NVYoFYK5JVuHXsUp71bWX?=
 =?iso-8859-1?Q?S7cGvpf/dHBN0jgHMcCZZt2I3b5kZRUE5Z17U9jAmBrB/mWKPFdt7jXIlM?=
 =?iso-8859-1?Q?qPW5YYkRJtO40xcygyG5qDlPISdnj5XlCnqqL2Z8HzO48PFYPrxP/7MvfF?=
 =?iso-8859-1?Q?YiOfGR0A1ZCtAR64yQEDPCsdVFKSxes1cqqWr7Sdk8ZgPXgX6GaZ5VNeRY?=
 =?iso-8859-1?Q?TcPOsKsK/NIACI+y+xP5y4WTHRf/xAd7zHIikSBEfnJKwI5nsLk14t2XwO?=
 =?iso-8859-1?Q?K6ECANTNvf8E3NKjiGHoOdAQdhmP29HUbezfP/jHC2ilg=3D=3D?=
x-microsoft-antispam-prvs: <DM6PR04MB44585D8CCD1EBF47D0643EE18D660@DM6PR04MB4458.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(376002)(136003)(396003)(199004)(189003)(53936002)(25786009)(6436002)(71200400001)(6116002)(3846002)(6486002)(86362001)(99286004)(71190400001)(72206003)(76176011)(2906002)(54906003)(52116002)(476003)(106356001)(305945005)(110136005)(44832011)(14454004)(316002)(2616005)(68736007)(7736002)(486006)(97736004)(66066001)(50226002)(4326008)(14444005)(26005)(11346002)(446003)(186003)(478600001)(256004)(6506007)(81166006)(6512007)(36756003)(102836004)(8676002)(8936002)(1076003)(4744005)(2171002)(105586002)(81156014)(386003)(55236004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4458;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ym4sZ/BQNXxOf94Sz+dndBzNFZWfld/M7is8WBI7zGE/8qYh7tl+N5uazXrh2fkOQEau554eHiPw1F/SQ66UIwHvEopedFAo7iYJkwjE60x/lQty896zFqdkAMclhBQyMncl7rHtSjZ4r22f95+lT5YDDDyp8Pxd4+Qlqo4p45rrU+4D3MgPfS4hHHrvh+dWuly4oEphEpfakTqd//l0QqbUYXEFm+YUEhJyhKh2PhjeJLGdHyyywdk5ctNXr/RkSBM35vAqymvf/qmQTXQELiufOGjzNBocG14aP3Pqjh1DdbfM2aC8VqYRznMe24zqCXJv1DLUlUF77wJG5WsRbVefYLp1X3LXUXjAOJQfNWl8P0frpIaEqGhSKUoqgIpHL44MWMZtXTWQpP3dWGDW2wvU3JzV2LtGpuhx9t+CaQo=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 535f05c4-daa7-4d09-c1fb-08d691a9ec07
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 11:53:48.5595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_035355_428396_B0949B1D 
X-CRM114-Status: GOOD (  14.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We should free-up initrd memory in free_initrd_mem() instead
of doing nothing.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b1167a6f5a92..aabf1869c54b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -94,8 +94,9 @@ static void __init setup_initrd(void)
 	initrd_end = 0;
 }
 
-void free_initrd_mem(unsigned long start, unsigned long end)
+void __init free_initrd_mem(unsigned long start, unsigned long end)
 {
+	free_reserved_area((void *)start, (void *)end, -1, "initrd");
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
