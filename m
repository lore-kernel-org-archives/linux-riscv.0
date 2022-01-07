Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 02:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=5xPbR7bhcAXlO6OQkURQ9jUVYiUxZ81nqSpFWgTVjRY=; b=moMXe8pafH1Lik
	h0ESyDdooFMZEjtrWWqnJteShik7DhU/IaNJSFuvWDhTXQHGnMJRINrZVAQNYnDFmH5ofVgHjf1SJ
	x39uaI55D85VNIagjCZY+Io9KwYnXrvw/0QqoTDrZfPxXZajq4DvYFvgCMkul4L887Zz7IrGz/QU4
	CjrAvPOgqXxZcfGihItdyc1R3d3zUmAGYsWjUWLZAGQTf4U52ki9TIVLrnhRPNDbCJXZSjqdn2hBm
	xTOTKMcj3bStxzgb8EBwH5JeOrj15IxaFsOReUNn3lqrkNyk7clfgW89gP73P7T9d5FqfqO5T39xS
	urZ2tX//WsalSYNKMPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5elb-001twA-Fd; Fri, 07 Jan 2022 02:14:07 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5elY-001tvR-I9
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 02:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641521644; x=1673057644;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
 b=lNy/1Wnd6N6kAl1UMTlvn0rQuSqt+eWNw7Aj1nVL7oF3agLkNe7Thg3j
 z629Gc9rjDfbJ7j5aH/R8OacJ2jUzPsZHQkL5Nd8g2FoAaNKBYggpQicZ
 j2SGUGMHPnRJrxp+4YKiu+JHNTBiOhguwhSWxyWNCyUjsqtlVDRV5b19U
 0AT9Gq06hCkpxwqhcDQEyqi4k4dwfDYI1Vp0CPb31VO1NrVcE7B5h1/et
 0GLghAktMYidbgaQRSdZJAzRIRZoy0rNhJihwtLu7xH9b8bdxCQ+zMDhW
 j8iG0xmh+WmE4n40llchLmcYQQQd43m3NlXwrQxF4JFRphxQYvd7tLPAu w==;
X-IronPort-AV: E=Sophos;i="5.88,268,1635177600"; d="scan'208";a="301757476"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jan 2022 10:14:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+2xcdKZ9I10SvpTSSPKtk+7rc1ugxENYQedAlr1CQyx1fLCU+5/AHwpffNYckJy3fzko9yoQAF+O6zIe8W9gohu5XtGNC7bi392sS4un8CY1cqm/962nmTgDR6R1NKcYCL/5/2LXA/dXBr7wBKZB4wkP8a9O6PdJiWUQcDQfErF6Tyg/Fb1pXzf0NkL9IrgjEBWM+CEiBtp6A3HWE7Nivk5ejq1VWfjI9PWVluBOpFgi48bdSubRiPdv+u210YAL7q6VC4CyK0p9ntXTXMxBF7joaQTNrazmX2zg3oUl9zorB04xK4t5k6EvRQL9Y7mDBj7amOHxgWCSEhmE8c7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=OlZHxXAyiukQXee/czRjdp9JV/CVnxT7r5yCjjBGtEehXsc7F5hKyyXbE9UV69RhwinstProlEHj+vZGaJGi7uRnQwH88GPxDlINRbjvaCLtub4zAB5sIYsQXkhPWMoH5x9gBAIoNz+Pl5I6j3RENvd72c18A2+CQz9nWlDtJ4XewvQ7UllQSyD2BN6moYJBl4spBJZAfVwIh66e/LORY53Iloa3oloJ7CwRX1/SR8ir+zDLd7V9rA8ZTmoKX9wwVppOyeFlLfSBS3kN0VS4CSfI/IYiZnQz2b7U+MDI0wmH82KxV5S83aYBJ+0kPShb9H4SyGytiZwQycHqwaBb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=ryb7zdpmykJR1rsSF6od79JBe+b/l6HLbg8JP3uvug+KlSpT5ynruoDMhLul9NgbnKd1ChVR7nLof4QR1ZXbwxrOGVuNZVBxiFBBZ4RorbrSCRk9wEvdELR2KoIdUT3U+vKQ8uTf5Op2sHGXCtuC7Xgm8nf51wTNYbUQ0+qwJ1o=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB4538.namprd04.prod.outlook.com (2603:10b6:5:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 02:14:01 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e58a:8ae5:2f73:35ea]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e58a:8ae5:2f73:35ea%9]) with mapi id 15.20.4867.007; Fri, 7 Jan 2022
 02:14:01 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>,
 "heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "sagar.kadam@sifive.com" <sagar.kadam@sifive.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 12/12] RISC-V: defconfigs: Remove redundant K210 DT source
Thread-Topic: [PATCH 12/12] RISC-V: defconfigs: Remove redundant K210 DT source
Thread-Index: AQHX3WTpsbliyan1bkCwPrZcgVMvjA==
Date: Fri, 7 Jan 2022 02:14:00 +0000
Message-ID: <DM6PR04MB70816AD80E3D9BD56A59FEFFE74D9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <mhng-40969d90-76cb-4b9b-9c39-32dbd0f9a7ea@palmer-ri-x1c9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1b46f53-1670-41ed-eeee-08d9d1835ec1
x-ms-traffictypediagnostic: DM6PR04MB4538:EE_
x-microsoft-antispam-prvs: <DM6PR04MB45383E2FFF02949B1369297EE74D9@DM6PR04MB4538.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3+TBkSV72RjnXM0JeSFYAMebaCJQZ/3yYKv0+QYifi1qEpHrQwBvWDukbJ6fUAFr65G3ftUjPVZeGvvmpg2nVYPCrhaoWG78lVJWD8Xx5Pfoz/IUuroKH3PX9xXAJ6h0vr3A6MW2Ikd7Ig8GTjlyoiG0/1mJUJT7mxsqFkoMdw9h5PT3zesYlrpPaas6jJ9GfOLHR5T8LCmlodktTj7LFg6WtiJnMZHYYiKRl97DeECANEuxcDM1bbNAIewSi4S3JFC/BbqL6MvjEZZ7MYXJ7stOhQ+ydLAyUgAGwxokpvQfYJGb+B7cO2/Fj6E3G1v1yF6cnBV3GZoLi8ftLjEZdPtG9HsZoRWtvCIO8DLiooMTujlbxiQ9pnCcjred98zo6f/km6KFV+oTrRxFameSOluSfAjIIZdcNtygsOqmJWPRTEaNZSRZYtPVfg2KSgGS+Kb+PStwzdLIKKwrZFYUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52536014)(54906003)(66476007)(8936002)(6916009)(76116006)(91956017)(316002)(73894004)(86362001)(2906002)(71200400001)(621065003)(38100700002)(82960400001)(66446008)(64756008)(122000001)(66946007)(55016003)(38070700005)(33656002)(66556008)(7696005)(186003)(4270600006)(9686003)(8676002)(6506007)(7416002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HW0L8UYsxkr6N/1ZbSS5nzXJmgsJJxFVHeGHDjwNvjgDUwSSwhyiZOBzUWh8?=
 =?us-ascii?Q?0q22nIkNaDJGaAdLZqO4XfZ6CNjNH5rJwZDuN4Xo7rErriNRLjDd9gNn+kfw?=
 =?us-ascii?Q?Q/eH3tkevFMXtMs+zMDeOrPqJZG4mBEuibGBtbDA0A7o4iL9FWnpEok9/fEk?=
 =?us-ascii?Q?Dk++IRvpmPMlkzbDlBP8to5XwbenwpA/e/H5VwysUd+buYxoc8bvnSrQ5w1N?=
 =?us-ascii?Q?4luT9yjyK+sQy2pnsb2hYfhe7sAPJ3tOPTw7+imYiRjTrSjW4qbotXHvXnNv?=
 =?us-ascii?Q?MdYUZ7ZPVV/qWt8/crkAC381AaYcLOkrdVFWiWyhbYN3xxI680k7UkHKdsUe?=
 =?us-ascii?Q?pymlAbJA/k1S2gyVtBNENQ79jq0bZuA+l8L20iCxBx+Q+YHoj4igyl/qZS0I?=
 =?us-ascii?Q?yZMcaVIJ+aZMBRJyPD8C9C+s0Bw/8AkGH23ZxanT7gV1ZLvtfMEOKtqQySHY?=
 =?us-ascii?Q?jwfwXDcjfXMO7p7hA4A2N920cIrtpcECcSfz8DB2L8mEd/8dxNh7sAR1t1Rd?=
 =?us-ascii?Q?TYcxg1GIfO69hrpe+SRZ4YZhC+dJiq2XULKx0M7X8mPBoZ35wAdpUWJHFeWZ?=
 =?us-ascii?Q?ST6O8E6pdqGLXZHwhXJ77Icz5Quokwf8pdaZg9u0KO6SpzWgdAe04KdG0t0W?=
 =?us-ascii?Q?t2Cn/sn+jMYouMelRW2dZOGCLJTwZpa5S84DJ5RgCAA6biVctWeNVXLNWjBj?=
 =?us-ascii?Q?TroX7ytClpvC+OE3JdlHC102H6eCOz992rW2W4X/LNlokF5rPPrSdvNMs6/1?=
 =?us-ascii?Q?YdgnPEEzJLJsgLxXxvLfK4M273dP0tslIrppXLUsBHdek2fR/rV564/w+uU8?=
 =?us-ascii?Q?Q+/jk7N6ynP77duhWRW9JqPZMUbfEFjeOed1cIAejj1Yc8qSSPgBfeTY4qYW?=
 =?us-ascii?Q?mSWl9jjXf2wAT0rM9QbrQJwZD2AF1j1zxqSDtkNoAyKvEw7Z/pNjOB8TTDIZ?=
 =?us-ascii?Q?O4uM3i1XFa0Jk+Hicyzijj0RigtyfhdQQ14VXqQtZMMqyiBw5NCpqlx3r/Mi?=
 =?us-ascii?Q?PVmMhdRbzhn419I24gvXrRmTl1BAkoHH51WoHZdneOnaosfZGP80BxVlZoyW?=
 =?us-ascii?Q?79Z+YM53LQsV3eA1TDWwu5CV4IO1oXyHIJdfHN6N27DU/lxmcCOhW54en7bt?=
 =?us-ascii?Q?xdYqfdcdbIvDlfpkx524V9RxGEf4af5Gt+w9zR0w8UgSX31bJ9WhGAko0gw6?=
 =?us-ascii?Q?uYixQJ0S1yWNz2Ym/vSdtXu1XRh+uAuSGMj+CJJjMraU+lX+F3ID3J4+P5xS?=
 =?us-ascii?Q?76xvPIdKMMUiTQwb2PizCODsMjyYEAZrhf+GKXbrGyDfbdwXkJ7JAbkKuyA6?=
 =?us-ascii?Q?vMemaCC8acnPPSBnb0DgOUUFh02YmjRxJaVcliUjwNMhn+O7CKIzuJJJbPn5?=
 =?us-ascii?Q?NfhDHRdS22zNX9yjrj1yMTo5r652uI/lqwsbkwA0X9wzXb3y15j+h/Cl+YFR?=
 =?us-ascii?Q?ICo3+1Z7TxOZCcwUWEdh0+g5FFUysItiwyrcWxHifYaWFZFwTidl0CAd6znW?=
 =?us-ascii?Q?WmH3QuHKUDkPst70xJXYBQ6DFr09tBCxRpts2st1vbQdKP5xRnzjDq12zaJH?=
 =?us-ascii?Q?YK1ubq0HcYGN5q3mtNNkfhNq2QgREwanC0g+tWf9e855R7Fxn7FObd3Wi9FQ?=
 =?us-ascii?Q?GPXCvHIDoKwuHAEYBVS/54R2wpXOapLnX3cLo0kBQ1aqfHwDNuVbZuKkUGfM?=
 =?us-ascii?Q?ymEelXmUvm2FIhgPKfyWNAGpOpNZgPXzPkEHhdWB1fTwG57s?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b46f53-1670-41ed-eeee-08d9d1835ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2022 02:14:00.9231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUy66ESalU8eCwpb7msgc5nsb89rGZvY3Inmq/YhjEuP/+KS6ZOB/nPIIkMidHwJ8idVpsflDer0Jp2/kBewEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4538
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_181404_651216_A37B8FE6 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
