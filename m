Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3C8C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 10:34:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2756C2147A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 10:34:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eEsBbHrM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VfXk9rZn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="QBDQ7gIW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2756C2147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VnY4Zsgci6NISqylkZrL3IgFKaTDhPVPOlU38aXjKZI=; b=eEsBbHrMijNtI0
	5z6+nIEjeeYR1PMIgeX6g/SpxQQiyfRHDRgg79TWgkf4Uy7Mz5e6szb8xZrJLNKrGPbxbIFfYBdDC
	V4Y9GvtRwOldrhw8vAeovdO5PP56bn7jlBMJgyZZmrB7GqWtG9AYAwtqJ8DwF+HG8qzl7rrLB8ro2
	rGP1/3V6AI5X1xJNEIVGa3oDfcb8GjbaB2Iq/GgJfLQCrR9vDoxIk5NlFT3evmV5YnOkrK5Gygc4j
	ea6Rlmd8p1B3Vohl7ixbaz5cewrRlzcgs/t95A4m9UjHzMRMzJc/2U57gK+T1GbdG5MmA7/zVbIl1
	4Z5MFy+wVcJs61E0Kxdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBdDs-00034I-8y; Wed, 03 Apr 2019 10:34:24 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBdDp-00033b-5X; Wed, 03 Apr 2019 10:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554287662; x=1585823662;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=U11qXrm8l/qKaiLxNPadRVmEWpXe7upavlvDF2t5llI=;
 b=VfXk9rZnJPyMhcBLa/JD76/C7JD6hadEbqMI1i7nxr4L848lL15lzfUz
 cjxkqm7mbtNmUthE5SnVFSSCApFKAhsG9qlA9P1CvG+EaN8Bg8v0SCZXH
 IuVCO1pOhivMICTYsmvSyKqBiG5Pyx/oDISOrF9lFYJSNpj/m78lt6yPb
 DLxQMbVHqNg8XLaTM4IPAyyfvCFbvBehM4aGxJUFXegto9KJ3a3lfC3qX
 eBEIuit6SK4VikTYDW98hG1G6QtxE5TNUkZp8RTAV/m0z0UO1VYllg+Pp
 MOGvToXsgr5ayH1LZ1kcU2MdCTwsLvcqtkGHHdcjfweq+/asZtn/Fn8Jv Q==;
X-IronPort-AV: E=Sophos;i="5.60,304,1549900800"; d="scan'208";a="106249009"
Received: from mail-co1nam03lp2053.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.53])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2019 18:34:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3uHNx+Svf74qKXwPF3bfr3Ae5ctrS8C612yLP91FZI=;
 b=QBDQ7gIWLl975aTIRP3RRMwtUehKhiIOCr9f97+mxvXSP63dmqc1GirLvMRMBJa/8QEIHM5GcLxFb2KNYW+chqN1g2ybI0Hv0w22wFPacBwrRdJhmUWUWkH1OHunf+KHj2xMYYrwBQrEfPs8dArl368in2wrmBDGRVSqK9dJfV0=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5869.namprd04.prod.outlook.com (20.178.255.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.15; Wed, 3 Apr 2019 10:34:14 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1750.014; Wed, 3 Apr 2019
 10:34:14 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: RISC-V ISA Dev <isa-dev@groups.riscv.org>, "sw-dev@groups.riscv.org"
 <sw-dev@groups.riscv.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Subject: RISC-V OpenSBI Mailing List
Thread-Topic: RISC-V OpenSBI Mailing List
Thread-Index: AdTp+2zF5A0bMRJXR9KGm7SDO6snoA==
Date: Wed, 3 Apr 2019 10:34:13 +0000
Message-ID: <MN2PR04MB6061D293813D628A998355C08D570@MN2PR04MB6061.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-originating-ip: [106.51.17.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ade7853-f0e8-47e0-e7f3-08d6b81feab8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5869; 
x-ms-traffictypediagnostic: MN2PR04MB5869:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5869221D4B216E9B3C0290C48D570@MN2PR04MB5869.namprd04.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(136003)(366004)(396003)(189003)(199004)(53754006)(2906002)(25786009)(71190400001)(106356001)(71200400001)(53936002)(4326008)(6436002)(966005)(110136005)(5660300002)(55236004)(316002)(14454004)(7736002)(72206003)(97736004)(478600001)(186003)(66066001)(102836004)(476003)(2201001)(52536014)(3846002)(33656002)(256004)(486006)(55016002)(2501003)(74316002)(6116002)(6506007)(26005)(7696005)(4744005)(3480700005)(78486014)(81156014)(86362001)(19273905006)(305945005)(9686003)(105586002)(81166006)(8936002)(6306002)(9456002)(8676002)(68736007)(99286004)(5003080100003)(223123001)(563064011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5869;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n0p0W+FqpK2KTcVRCbToGGBptRjL8olQpNp++xXojTZ5rkYOTNa+zYlwOa0qh8teuPMHR6YNvnJjWyDfzsS15Z47dUQyu35R4PW6fJFMg0eKKRsDFhpXfRJX9YSmOP5QmjLHnii7LD/XZ+6tvSWGip5f4FjV4FItTnJ/NiMAPZuvYpDNyVV2KfJXmrkANpuZa2ohThaLKGRF0dmzhiy3uEXtgwD7XcndXOezCQx+Z8f4/8Ggh8sh0C71bYPZSzaSgIx4hp4leDHh1NVJ7nKkBFFkvjalIO5/UETcK1aigeZkEz0yCgvGWbVt7YcJ3A/eplOuBAIIVU3B/DL8J3YX8oV+G56UCpSWSOwfF7W+8u5KQ3iTkdp+QR4Z01lJDEqgP/6oHCPehc1Wx+OnGMaaaJdjVFuQVeln5nkxRNY5MEQ=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ade7853-f0e8-47e0-e7f3-08d6b81feab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 10:34:13.8825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_033421_396460_6D54EA20 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi All,

We have created a mailing list for RISC-V OpenSBI  development and discussion.

The GitHub based PRs and issue tracking will be still available but preferred mode of patch submission and discussion will be mailing list.

The intention behind OpenSBI mailing list is to have one common place for GitHub and non-GitHub users.

To join OpenSBI mailing list, please visit http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
