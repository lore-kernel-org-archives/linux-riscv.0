Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99F9C61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 13:28:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B56712086A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 13:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pqcliZBn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Yz14lqqZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="dd4RsWsd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B56712086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaTiE0m+brXGHrSISE2jhaTymaG/V4N5G1EEOZtUmzo=; b=pqcliZBnpPQ/Fo
	JTNOL/rJFK4c8cn9Fbd0ZYIt5XqQ/DlVoZ6QmCo1XkGiIZFIsjNhr3MMlLgj12jg6vQYGuiBeVklv
	DVGlemuXVM07T6+SBskPsxfTtd2UzCUTOccodz9K4RwBjKgrlOuowU51waTD5MtuwwA2qzY5XUxVI
	SEfaoIhfrQqwp5da3L+mMuBXLPN0gPC4k6seClX2Jo4XEDnew/eE1h86iUK2XIErnYmOghhA3pLxn
	Ni6vwNwNjiter1BX3pcFZ4qnfySSFoagZ75Nb2bVQYFJfKnboXk4JxO8gp8FnRTFhr/TAR79sMFmN
	2MxZn2Qca6oNQMVv6epA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkqfV-0008OB-FX; Sat, 19 Jan 2019 13:28:13 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkqfS-0008NW-Ac
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 13:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547904491; x=1579440491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5clvEc+EFgdK4T/Iczm91gdzvaVtM8VoefDnldveq20=;
 b=Yz14lqqZ3jYOxUd7igfyAxt3wliJ1Q9pm2UgEM9OIb8qaSkKBhkPDIGo
 EINKsPASpKR66tFSXJaaHY7C3l15kYViJ3Zq4x94t8Bbnsdb1IXv2K638
 JcpKnPv/X/v1gFKiGrYvCxYyzVzXrvGs8tJtU7p5IEEFB2SF/wvhLy1RZ
 oYK+awyOxlwrCUoNK27hqD3zfYoWQzAtvaGyPnfAHKoaeKBBIPGg1Qayu
 0lq+tcOpQkraNXDnRO9jk8z4c7DuBBLTe1PUlxT8tr1jHam1s6crfynt7
 qQh85K/oCjIeJ1sm9BG2pWqyV+n71+7VGC5NSaypSfl8eJonOdU1YWmum A==;
X-IronPort-AV: E=Sophos;i="5.56,495,1539619200"; d="scan'208";a="101011291"
Received: from mail-sn1nam04lp2054.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.54])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2019 21:28:09 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF6hu0fpdA9VC4UYtqAme+z5ny0ToEpBQrWwrYwzbq8=;
 b=dd4RsWsdrbFlgvSgkgzm/GKU/QNdkIilZal3nyANrBW1tPehwPcbDwR5UxUWFPAGv2J0yx4WubH6ac06mtL84Xbvhjq2+z/wxAHxX+nhsU7XUK3TifTUBDD1V3fgQcpKLo+Ekj8Uel8CJ1NicoDz/sr41lng5AicWDo9rv5vUPk=
Received: from BYAPR04MB5303.namprd04.prod.outlook.com (20.178.49.148) by
 BYAPR04MB4678.namprd04.prod.outlook.com (52.135.240.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.28; Sat, 19 Jan 2019 13:28:07 +0000
Received: from BYAPR04MB5303.namprd04.prod.outlook.com
 ([fe80::add1:92cc:65d7:5d94]) by BYAPR04MB5303.namprd04.prod.outlook.com
 ([fe80::add1:92cc:65d7:5d94%2]) with mapi id 15.20.1537.028; Sat, 19 Jan 2019
 13:28:07 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 2/6] RISC-V: Setup init_mm before parse_early_param()
Thread-Topic: [PATCH v2 2/6] RISC-V: Setup init_mm before parse_early_param()
Thread-Index: AQHUr/rQF1FzZ43LWUiaqt7t2ByYrQ==
Date: Sat, 19 Jan 2019 13:28:07 +0000
Message-ID: <20190119132650.9978-3-anup.patel@wdc.com>
References: <20190119132650.9978-1-anup.patel@wdc.com>
In-Reply-To: <20190119132650.9978-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To BYAPR04MB5303.namprd04.prod.outlook.com
 (2603:10b6:a03:c8::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.52.191]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR04MB4678;
 6:wHARZ5lD5c78P0tGEplzDd+NM43s1EmXqW6x5ExToJ0uqpPKRI8/CkY9TqM5GIDUS7RsnEk+52IfUjM/6X6EeNqHXFv7o2yAnXzkxGLCUUcW1/CB8JSlTv4Tfd83s1e0tOI9oftj8/wvqkjs7z5HcaZvLhkhjbxD7k7O2TgVzzYQUVq018jh0E1qc9NVbLMRRhtVSra6o3myEOcZXIrB5CcJbcY5e8xAveWXIEHwYcB3LVz5syHsI/poY9SFZsCYuWcysygO4HwdmPEQaIJat5W1ufhfC9s/RgUxMb4Q+bhiDUwz9gikgUYAz9nswmubLN8KFaoTj9w0ZPQ6QYqzfELGU3CKq+e2owbZKMJPFefZzQrRRgI6RF5qO8iZYKkZWF+aBP24NZmZEh9rsjmLnhebaD20oFD8Xv8DnHR5l+PS+sYNIscnWPky96CoNq31WBlmZvHFzZ6aVI+42WhmVA==;
 5:kCOkwqzlv4T1Jycv75g1URtWa1kHCTzODvV2bSwjIz0Sz/x3bQMEX8aPRPJqZYFWz+EZF8jR8RNyAY8VvC4g/eeFH01yYblkegjPYXcq6rjqRCyJFjTAwKdyLvLSQXppZ+4qPRxxHB5I7z1BRa63xqZNgnS/gjACbowPg5u1wmZsQQsV9iuZE6TDk//+ExX0ExV9jX1o2EcQZT9AX4W5kQ==;
 7:VhCxm/smzWRUl6IQpPrUd5gFGL2o5Li9wQQHhnqtyZhYrGPBdXk+nM1rt13E7a0nPJNI4ttgdbCoMmjvbURV3kre/9OBSP06SmngIr/lDfLqu+SMFDIC0AJhzENHUDUnFBcGKfHV6JP4ZlPc/Tq9yg==
x-ms-office365-filtering-correlation-id: 11324407-63c3-4103-1654-08d67e11f2ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR04MB4678; 
x-ms-traffictypediagnostic: BYAPR04MB4678:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB467836A72C34F4F07A9520458D9D0@BYAPR04MB4678.namprd04.prod.outlook.com>
x-forefront-prvs: 09222B39F5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(346002)(376002)(39860400002)(366004)(189003)(199004)(50226002)(7736002)(2906002)(6436002)(72206003)(5660300001)(106356001)(6486002)(478600001)(68736007)(8936002)(256004)(36756003)(44832011)(486006)(71200400001)(71190400001)(105586002)(97736004)(52116002)(66066001)(14454004)(54906003)(6116002)(3846002)(1076003)(110136005)(25786009)(446003)(99286004)(26005)(76176011)(8676002)(2616005)(476003)(4326008)(86362001)(81166006)(2171002)(305945005)(81156014)(11346002)(53936002)(55236004)(186003)(386003)(102836004)(6512007)(6506007)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4678;
 H:BYAPR04MB5303.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jL/tsS2PK4IbTSzQ3z0jIYNO4nO4wWxcZsLe5zFEo4CyDmjYih1AJEemOb7C5tuuBHrJCVTNDsWis1ooTVIa6jyJFtxcl7NMhhzxfdSQEo7iMu5tOo1wkOqw+5PBvFU79nIVhAKXgLIjrfXpOtxfssXw0SKC1OrwH8m39PAuFJwJYCqd6QsaUFyFFwd/yCvGP4lIBkIr7AGOH+pHVYLWzj9ONUkx/Cqpym9jV3q+UsNPPkYd+l2IWzVEABA35omEGgWHqT6ANqpL7ydDCuOKVxS1C69xMU9hiU1CRQRbUrhTXo5hths658UzvBPRGcry24+vAoU9V2qzfbFOq96wGywBor6moKoEwtkCQR2cRGneScY/9XBe171cxbn7L4D3JtyWa0n9B3JrK4U3W3KzQYHN/uJl9Y4vEzFpCAgc5DY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11324407-63c3-4103-1654-08d67e11f2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2019 13:28:04.8470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_052810_410574_54CB264A 
X-CRM114-Status: GOOD (  15.68  )
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
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We should setup init_mm before doing parse_early_param()
in setup_arch() to be consistent with setup_arch() of
other architectures such as x86, ARM, and ARM64.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kernel/setup.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f270adcc678f..577d8460d141 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -208,15 +208,15 @@ static void __init setup_bootmem(void)
 
 void __init setup_arch(char **cmdline_p)
 {
-	*cmdline_p = boot_command_line;
-
-	parse_early_param();
-
 	init_mm.start_code = (unsigned long) _stext;
 	init_mm.end_code   = (unsigned long) _etext;
 	init_mm.end_data   = (unsigned long) _edata;
 	init_mm.brk        = (unsigned long) _end;
 
+	*cmdline_p = boot_command_line;
+
+	parse_early_param();
+
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
@@ -235,4 +235,3 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_fill_hwcap();
 }
-
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
