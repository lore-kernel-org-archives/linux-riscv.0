Return-Path: <SRS0=1C2h=O6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C2AC43612
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 19:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E739621928
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 19:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CA93yt5G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QGSBawtv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="cu9Hmd17"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E739621928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTF6j1b+4ba32UcJZSTIs2hNMOkjIu421koGgdCPX3c=; b=CA93yt5GQ/V7ID
	dBhxu9alM958zhn3uL+JysBSMCg2juqjZJEpMCaW1crVMOdgb4Rp0GyCGbGtkR5JU45Zr+q4+o1hi
	v+Iu1BhQ2S2aJLx1IaCbfccoInGi4V77xQIc3peN79AWIRbo7sW851ptJSyUJHQn1w9T2ec/pIXsY
	MEVDWmDox85/Ar6nJj8Kq6BOmdi0sYJSiSgnMAa2J5PX2/B7U7HBsA2sXq3mA2lW+/W1jOiQxvaXO
	RvUxgnogNOSZ4v03P1Qxe8kQ1ovA+Si4EZh13qQEBMVLRKKDYImJuLpbSNUfz/u0SbchPkVU0DD5Q
	DiMaxa1lE+fRxyLsyfMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaQNx-0001qx-OS; Fri, 21 Dec 2018 19:23:01 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaQNu-0001lt-Rl
 for linux-riscv@lists.infradead.org; Fri, 21 Dec 2018 19:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1545420178; x=1576956178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3JtFwj7JIVLVqDsn3o7mL/ddTorrjWonzsYGX+cyCvs=;
 b=QGSBawtv4jDfw2JZl+Cu/vwp76o56sARzDQDCkNiF1+FxR2RsJkvczNP
 2T91ghFR7bNtg9cmh9pLFY+/nVsfvmusw+Y1NG7jCL/7Xcmso2+X2xFdg
 7gD/XltHV+aT1ZmkuqUM2HOhroVFCOs2YARy3U8m7SgiXqDamqSMFiZ88
 Id5KDbEve2ZJBBfHAn4hD1u1A5cfe0wPARelmqCHGaczzn54yUkoh2Pv2
 wrDMtOD8MSuc3r7t6j9Y3y1uVYndjz4lvJbINq+Y2PQ9PjuhH/6xYjqwb
 zl5Os0eBfvYH80b+rvaqXl0Tt50y3fHbMT/X1qSxjwAm+98Uafpbf1Mo7 w==;
X-IronPort-AV: E=Sophos;i="5.56,382,1539619200"; d="scan'208";a="201937778"
Received: from mail-sn1nam04lp2051.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.51])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2018 03:22:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JtFwj7JIVLVqDsn3o7mL/ddTorrjWonzsYGX+cyCvs=;
 b=cu9Hmd172iKKa5ygzVTZpEBonolfc6jI1UIQdqz6ETcLrAk9XDd3uaSOKt2zi3Tmun7ZMBitjlwzCaaiJyO3MNlPdiPOp2d7ajXtWnT/QjLVmZqa7l8eY2xVnBAfLyeTpgdt6DS22MTDffSThzRDMmwrHiuADoHi2urzj5/pMv8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB0896.namprd04.prod.outlook.com (10.174.174.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Fri, 21 Dec 2018 19:22:41 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::9067:fb44:66b2:7604]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.022; Fri, 21 Dec 2018
 19:22:41 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Topic: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Index: AQHUmWBEawqGhX/hUk+WG09gQflaXKWJj9CAgAACgwA=
Date: Fri, 21 Dec 2018 19:22:41 +0000
Message-ID: <541e8b85bc2d3010741daadddc71ada52b847b8f.camel@wdc.com>
References: <20181221190615.19003-1-alistair.francis@wdc.com>
 <alpine.DEB.2.21.9999.1812211110260.777@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1812211110260.777@viisi.sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0896;
 6:z/IJp3jtYLiLdz1Ts16gUR4x0Sq10QaVwyugubQTuDuh87QayC4oNtyj6hCkEkESfHVR66xOB9dHLyOW67tKmoDqvEeO5uoU+WW9LxWBBO/x20HUs/Pmso7HZc7rQZMdsxOil4gFfgb+B8mXwXuXQkYGZcKzdYf6CWoAEtKcLXzpIKDCDUGcIjlsqWR1S/3FRUIVkYbw5MpfBmSg0B59oIIVNdStXafAUEggQAW9HUh2Gyt9jxH++5u3STyePU+H8k2sLaJ0IVU3DOJKM7nmvhRFR+ExPnHjsOj1CIrGNcultlYZiVZZn4uB9c52Eicd+jPOU+CZjvcmHqNtl5tSKpMSFvBJBWM3rIHfBwuJ6d7Ja44e0Xqm+OqDXX555cMKRNSs6MoHUicIhlgFoNG5SVf2nLtzBvXJN/wutbMWUIbCC+F+ThLzH5PUpHx7wVo3W5w25bs1gcGDusNuAuzEqg==;
 5:4umdCcRnzj94qxJ1mkdkf3Ib8ECkzsOc1KOStxdQeowLJ55NTYEmKpmaeMRcWK7IbTgWnsdsCTCpiMKYUXkYc3MQfCn2gbDMeOv8J95cdc6lA3esTPU2FmxzRUz++2sDzXVOPOlJEfiav5U2Hze2zmbBSH94DW4Bhnzv4i2Jets=;
 7:FKrMOZOv5NtQwEq1B+ipAp9pUydaDePeVnX1n5mXeYcMYogvfHnW+/mU8QQaucLp7GUjNsXXkYr8GQtFlCLHQD4W+Y3uLJ3wLAb1FLcZ5D4cs5+0c/0EojjwWE84jVHcNpEcTzbt/cg0QZKYOveQtA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 665cec4e-dc50-4bc2-1f54-08d66779ad17
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB0896; 
x-ms-traffictypediagnostic: MWHPR04MB0896:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0896536C1FA67F598E9A4F1790B80@MWHPR04MB0896.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(5005026)(6040522)(2401047)(8121501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR04MB0896; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0896; 
x-forefront-prvs: 0893636978
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(199004)(189003)(316002)(2616005)(25786009)(446003)(11346002)(66066001)(5660300001)(72206003)(486006)(6506007)(478600001)(6246003)(256004)(26005)(118296001)(186003)(476003)(4001150100001)(5640700003)(53936002)(102836004)(7736002)(4326008)(2501003)(6512007)(71190400001)(6486002)(36756003)(2351001)(229853002)(6436002)(86362001)(2906002)(81156014)(81166006)(8676002)(99286004)(106356001)(6916009)(97736004)(105586002)(6116002)(8936002)(14454004)(54906003)(305945005)(3846002)(76176011)(71200400001)(68736007)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0896;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: 1u45yUifKk5G3ju6E4wHCOEi/0EMwrX3ENSJbnJ4tgtMYWvY12DquWa7idiqNtyIMMtstBIqO23GNpLBYAz9n1CeDb5R+DMLM1v42nFI5hJjoRYPqyeZb4sVYX6q1v71/R4fPtmEIQmG7nWfvxt11a1wAvhXmTeJhc62XqvifD2k5vQbusKZLZvD46ZGmHx4HEO+OtVC1W0TBklkFWfKvzSdjYuwAuLg8jr0MpyVNCcK6mCWKFsKMevpJe2nbGn5JP6w6SZigU01oj+WOr/fspK0Ox3EWyLy5aDuHYs/NbI2ofLlYYux8ABD2d8tvyX5
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <6679154E5971D444BD097404BD5A869E@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665cec4e-dc50-4bc2-1f54-08d66779ad17
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2018 19:22:41.1310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_112259_019782_7E02B9C8 
X-CRM114-Status: GOOD (  21.16  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2018-12-21 at 11:13 -0800, Paul Walmsley wrote:
> Hello Alistair,
> 
> On Fri, 21 Dec 2018, Alistair Francis wrote:
> 
> > Enable generic PCIe by default in the RISC-V defconfig, this allows
> > us
> > to use QEMU's PCIe support out of the box. Also remove the Xilinx
> > PCIe
> > support by default as this is rarely used and conflicts with the
> > more
> > commonly used (out of tree) MicroSemi PCIe root complex.
> 
> There are many folks working on FPGAs who use the Xilinx driver.
> 
> Also, we should not remove support for an in-tree driver because an 
> out-of-tree driver conflicts.  The right approach is to get the 
> out-of-tree driver upstream.

I'm happy to keep it in.

When the MicroSemi driver does eventually go upstream this will
probably have to be discussed though as either the config or device
tree will need to be edited to ensure only one PCIe device is present.

> 
> Enabling general support for PCIe in the defconfig should be fine,
> though.

Ok, I'll send a v2 with the Xilinx PCIe still enabled.

Alistair

> 
> 
> - Paul
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
