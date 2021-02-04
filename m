Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5779C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 00:48:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2223F64E0F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 00:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2223F64E0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AqJrjV4aaDPRrR5wvnOmieZ6qdsQWEirTMXzM+fNOa0=; b=Y+AT/84v55HmXG3CzVXxgIo7/
	LTwEuUkOaytb6o/gQW36LTz/R33AxHXvl7lpfPuERLF8hDt0Tvw1LyPKmnEeLNRYYPyO4cFAjccMA
	0Zf4F0JldkXlH/ymqkTAyv4cPQg0Ng14C146MtVKOtsiBPh8yuPlYXNSqnIkKzKf3vcyP6TV/U00k
	joyONtjNTzniAIewzmJcGRx1QfGMxhxsOoetu0HvoRNN0o90Uarc2Dw6ElM1Fj6uzATeSFQkFfNXS
	uAhzrm1nkkKUW0u3ma+w30jS1rQflEH/tINgoPIRrFgBTTcvM2J+o4zrn3ogPVgALZOfeqwUd1DGO
	bZiyJiu7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7SoL-0004tp-DB; Thu, 04 Feb 2021 00:47:53 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7SoI-0004tD-23
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 00:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612399670; x=1643935670;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PB2ZO9/A4FRscfG6XiBl9D6ZPkzAR/gRjqHqQWfJgW4=;
 b=fuNTZ+U3hUiYAFkIjEO4lgNhirUTfL/t3/yp1HRCXvjg8g/m9PQ7DiQO
 cnTbqc7C2q1lH/BxxEKJtHuEGZIiz/ABOkiuwHsrIUSleZGhPU29/ga/b
 93IqyT5Je7osrBVOarfzOgck3a5KuEGkGfq3sZOM1XZHJursaxHHkFjgW
 EwI3qPpN+bTGnRdfqPuRncqQVvZ6z/UgGHRhXNvy7gVHQn4keodxj8Z0K
 44m7tOzlYYGKkNk4W3GrmgE3XgHqi5EuP5bTGgV9crzG6inbhp6RzhTwT
 fuuTix3yRaCWWRzS2+B+GTp9Ud+T6MTV0+yq94ey5PYEqyM6rUWDaOT55 A==;
IronPort-SDR: UgVZnf5KKqsp4zNaF/MCc5VcfEXsFkf57PZ2r742l1I9zVeJQbMpOpVKNs4IQNiujFjFwrDw1c
 ehglzKQ34KeufjdZ93RC554N02ba7wWug69U37IH0sUC/DU6Fthwk6JS8IFug35gCs8dRF3g9F
 3Y4Z+PcKt5f/RUYb7aLi23ocgEd+XPZM5+LGj39nBXBZ2qfJijXh5fEHt63722WQ60OBPiNb1M
 o9sQpjM/z/RDx+Tqrn1M8dwsC98TrNNjMU5xaC/VT8hjta0f/fKl6XuSupUegIzN3ByzI+TT/Y
 t90=
X-IronPort-AV: E=Sophos;i="5.79,399,1602518400"; d="scan'208";a="159068769"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 08:47:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZatWiz1e1dHks+2i5kmlvSZl/HunjafyWyCP/1LLsmOr3m27/CxWbpo8qZblVXzUquLGlsdastzrcpvADJ9L1+TnVMn96G8bq6morrVrjwxNrjd2kLcuzqwK3HIzjQDMG/fAOVZCnTooYZxFfxoIDb3fAggvvNb3NHRHLeLmRGMXWGVEbEQ636KyAUp6Tzfja/n08MwG8PnCJs2b3z1imWoSonOorDHr3K3w6h7JbC6bH9ELUycZw0TnOa6b13erSlhA9CZn/QAaY2u/oW1Kd6aVmTq0FmLFAdrD4aVEnQ5LUMMD++qLER2UDVEqyzx2ge9meOAexMn2gmfCMWKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB2ZO9/A4FRscfG6XiBl9D6ZPkzAR/gRjqHqQWfJgW4=;
 b=LTPpWsi5JQcBddprvS+3r0qVMehs5V10Jhxptx49VbxfGIi4tFzorEKaFd3IQsscVjrEk0I2sJ5+9nkoeSmAIzs+ckDc1KJoimubgH2eZyPTOXcBQ0I/zdivbBuHIO9etEuTQaXSDTs77FSVof2TnNJioEnF1Shyjz4FNjeFE38b5JJz26+dY5JyVFHBy5n7c2V7kW1dkEIsT22KCVmqhbblBqgyWXoOb8OsOyvj9uqYPKbtEYubtY4JEsMpe199rEreECpvajfmNn4a6s0ToOrhD+fcwF/kA3JBDOPLv46NK72i/E+aIOB9Po8Q2haEwe0nR6PyrQHe/rzvqvcglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB2ZO9/A4FRscfG6XiBl9D6ZPkzAR/gRjqHqQWfJgW4=;
 b=wW40Wi8K/omDtdfNoNFcDIulY6rD6mUekAKmjvLksS96oJjWIPtYSNqYBeXqKJgPo0Wh5n3sLZrOCp9eSa+6ABNjuE9EcyL6Qbm2fTOHAU7Y2P0n/fNEdOwmbRtR/iOji1bCMOF90QZEDL8O4NtDotDDTWzzuVuleQ0gZ6C7nMI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6448.namprd04.prod.outlook.com (2603:10b6:208:1a5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 4 Feb
 2021 00:47:44 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 00:47:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Topic: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Index: AQHW+U9T59FA/s8Z20mcfAvTuPFEfqpFOSgAgAErBICAAIL6AIAAROyA
Date: Thu, 4 Feb 2021 00:47:44 +0000
Message-ID: <c9d273c87815a89be314e4e824a365313be0d677.camel@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
 <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
In-Reply-To: <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8fc19499-139b-48d5-4bad-08d8c8a67c34
x-ms-traffictypediagnostic: MN2PR04MB6448:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6448BCA5A61B39A208AF66E4E7B39@MN2PR04MB6448.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QV3q04q3a7y63+SrklVrmrGL+bvV7rjkA9cKLHrmiJam3y6J4GqUU1tPDn00zqJ+ODQrOAHZ32fQGMEMMNzFURrNVEFREIH863je5VU27Ccm6PU7zrsMnv5vyqlZz4GZwDPTD+uPFK0F0CzcBCA0OSxEkEGxm+nK+of7pAqGQs1mzTYhPl+TS9MEvnA+rb4yJLxzCnoX6EKTJoVxn+/SEbswJN3Ka8S/PKwzSymx9yw4uicviqXl+Cwny1uoziU2OIrHXa0B7JFhNCzsNZKoVn789G59uK59btUb28bjknnmqhjP/vt6iK7pczjT2NuybRcgfzIXMZKgl6cqamtQPsg/5+ixmTXnL03BUGeY5zoLDGJPgTWRqGs84p2mQvy4Vuju2WUlJ30dISzqUa2esMZ14WzaAdezBkCXDFk7/9fdBcC6tOqNOSb8pAywOALh8y76UOiR3M/0aS6x0L1rcJ17Ch1RXkdPhHuE7MVajnAwQPonFZuHjF7+2LLCuczbRtBqTVpCXJ1QPEaF/+OIaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(71200400001)(54906003)(66446008)(66556008)(64756008)(5660300002)(6506007)(83380400001)(6916009)(2906002)(76116006)(66476007)(53546011)(2616005)(66946007)(6512007)(186003)(91956017)(8676002)(4326008)(478600001)(86362001)(36756003)(8936002)(316002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TXlDczk4RmMydEQyKzJsUURZNU1QcngvVmlRbjZBSlIzc2JzQzZaakkzMHRH?=
 =?utf-8?B?UUpJYWdxYkxQNWt4YzVJVmtXb2dmN1VUNkFtS2NFZUM1UWFOTURXZXhuTTFt?=
 =?utf-8?B?YzdkT0w2R1IyakdUZTZSbHVicmdlRU1rY2ppS25QOThYUlpaS21teUFVVHpz?=
 =?utf-8?B?VFBDaGVneWw1bDVDYjczc2lOaXBwcDlGL2VYSjVYNGhDSGkrMjM3MTcxZ0JF?=
 =?utf-8?B?QXJ5aDRTQWF1VEJ4S3V4UFFNMGZ3MWNNZmQ5dFJuaEFmYmFpKzRuQmdOaVRU?=
 =?utf-8?B?YmtNU0FwRGtuM3JJbFA1bFFMelVsYlY5alQ0bzNsT0I1Wm03alNxMERVeHA2?=
 =?utf-8?B?dlZmQjFwYytuS2FEZEs0UDJlYjZ4alRIL1BWcGZTS3h5d2xjQTVoMWo1Vktk?=
 =?utf-8?B?a0dkWERNSGllc1E3OFZGVVlpQnE5UnN0OW1FOE84M3U3cmZGRjV4STR6aVdW?=
 =?utf-8?B?UklSZkh3U0t6aVlTZWRjRGhwR1I5RjY1Sk9MYTZBU0N2eHZrNTJRbEtLbTlX?=
 =?utf-8?B?UFVKUHB5MUpxZzk0c3NHU2ZvZjlmRGxrR2Rxd1dLSERHdzVjaVBRNWg0bkRS?=
 =?utf-8?B?cDAwanFLdS9IZEFEbUVGWitFbyswN1dMZlJ6a1VzT01qbklhSU9RT3U2dThE?=
 =?utf-8?B?YmlsblpNeFFIN2dEQ3BNWWtTL2krUzJiUjBPN3NLV0o4cklEaHNYZlhEYlNF?=
 =?utf-8?B?NSs2RUhNYXk1ZEZvVmx1WUVMeEJ5VitzbUlLQlJ1ZXBMREpHbktuTkRZRHI0?=
 =?utf-8?B?dTlzMUt0WkhGTklmeVFlWVBZR1V2MkJaTVNpT2R2dW8rNWRPNWxndUlDSFd1?=
 =?utf-8?B?NjBTemNvUk9NVll1QjNmb3M5OEN4S3cyOHV6RjBMVUtxTzlDL1FBMGg4cis5?=
 =?utf-8?B?NTIwei9VTUlscCtIVGJvZE1OYzBBNkM0S2lZTmVnUmFnREV0RnZnV0lva0Zs?=
 =?utf-8?B?aHN0cDN4YTh1YXNkd0J2RnBncUU1citnWkhsWU5uSnI3Q0dUOGRweG5DL1ZN?=
 =?utf-8?B?YXdpY3JsbnAyQXJuMGZMbTFGUjU1MGdIZXVQY3c0cXZmZW5KdzdHSEVUQ2tp?=
 =?utf-8?B?MlZTRmc2elFxR29UcUNxb0FBSEJ5cXlrNXR3STRIQ09XMTVsOUN1Q0NUcklv?=
 =?utf-8?B?Qmx4aXRZS0JiTERmdmQvV055TDhkT2hxWkpmc0tYZHh2ZmcwR1k5eTN6TW1T?=
 =?utf-8?B?WXF2YVAxdEdzcUVTQW0zV1hqWWg0NGhkWjloT0VWejFDS29RTzN1N2pmNjRn?=
 =?utf-8?B?SG5EajFsVHpmTEU2ZnRhajZTWTJrbXprVmV3NlJnU1Iza0RIbm1UTExReG8v?=
 =?utf-8?B?dTQ2aFNZckQzVjZzOHFsSXZHekZpd2dIQVZOOHc3aFRCM1BtQVRlOGFxUWdC?=
 =?utf-8?B?MVI0bUxUNXFGSWFPZmUxZVRFM0hhUEFsMnZHdnc0OHpySTNwd0haRWgrU0NF?=
 =?utf-8?B?OHg2cFJQWGtXTzhPdTJGdmZrS3ZrNFI5RG9lVG1EaytFQ0t0QTZtb1NzaVJH?=
 =?utf-8?B?UFFyT0hsUGJyOGVWUUV3cU9PK2RLSVRTM2tiYlpqMEMvbklGVEpkVHJ1QmYv?=
 =?utf-8?B?RXFEbWZqT0dkYS93Q3RVdkdSWWp6MXBRTWFldW8wREViU21pOTNWbDN2NFJL?=
 =?utf-8?B?SUpkWVc4RnNOZG1RaENnc1htMXFYd1cvYkN5azV5T1JFeVZsNDFZd1Y3Nm9J?=
 =?utf-8?B?Y1VXYmk2QkNScm9sTjhZbzhCc3QrTlo5U0EzK1dvcFJORVNEM1pNaVUyTjN0?=
 =?utf-8?B?ZEJnRUlKL0I1b3BBeHFrWm1LT1dLWEZhOWttaTBiRlVXYUlhZmtuRkR5TitN?=
 =?utf-8?B?azRHSDlNemdGMWtEenhvRFZ6Vi9WaDRUZDN0TXkxR1ZZU2hzQVRHTm9HLy9m?=
 =?utf-8?B?OGVhS3VYcUhhVGQ0OGFwNnhOSE5HL0tqM0xKZ0RNcUpuSkE9PQ==?=
Content-ID: <CF4E7F31605C894CA413923B07BC503A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc19499-139b-48d5-4bad-08d8c8a67c34
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 00:47:44.5061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZwE+BDIO0Kr1IzJ5M4FPfwsgGVjc/cYnuCPnag4lSnh3iVn2smVJVgoo5aiJow8wcu6wUU788RTcCJTSG0zCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_194750_455375_62E44912 
X-CRM114-Status: GOOD (  34.95  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIxLTAyLTAzIGF0IDE0OjQxIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gV2VkLCBGZWIgMywgMjAyMSBhdCA2OjUyIEFNIERhbWllbiBMZSBNb2FsIDxEYW1pZW4uTGVN
b2FsQHdkYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyMS0wMi0wMiBhdCAxMzow
MiAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEZlYiAyLCAyMDIxIGF0
IDQ6MzYgQU0gRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4gd3JvdGU6DQo+
ID4gPiA+IA0KPiA+ID4gPiBUaGUgc2lmaXZlIGdwaW8gSVAgYmxvY2sgc3VwcG9ydHMgdXAgdG8g
MzIgR1BJT3MuIFJlZmxlY3QgdGhhdCBpbiB0aGUNCj4gPiA+ID4gaW50ZXJydXB0cyBwcm9wZXJ0
eSBkZXNjcmlwdGlvbiBhbmQgbWF4SXRlbXMuIEFsc28gYWRkIHRoZSBzdGFuZGFyZA0KPiA+ID4g
PiBuZ3Bpb3MgcHJvcGVydHkgdG8gZGVzY3JpYmUgdGhlIG51bWJlciBvZiBHUElPcyBhdmFpbGFi
bGUgb24gdGhlDQo+ID4gPiA+IGltcGxlbWVudGF0aW9uLg0KPiA+ID4gPiANCj4gPiA+ID4gQWxz
byBhZGQgdGhlICJjYW5hYW4sazIxMC1ncGlvaHMiIGNvbXBhdGlibGUgc3RyaW5nIHRvIGluZGlj
YXRlIHRoZSB1c2UNCj4gPiA+ID4gb2YgdGhpcyBncGlvIGNvbnRyb2xsZXIgaW4gdGhlIENhbmFh
biBLZW5kcnl0ZSBLMjEwIFNvQy4gSWYgdGhpcw0KPiA+ID4gPiBjb21wYXRpYmxlIHN0cmluZyBp
cyB1c2VkLCBkbyBub3QgZGVmaW5lIHRoZSBjbG9ja3MgcHJvcGVydHkgYXMNCj4gPiA+ID4gcmVx
dWlyZWQgYXMgdGhlIEsyMTAgU29DIGRvZXMgbm90IGhhdmUgYSBzb2Z0d2FyZSBjb250cm9sbGFi
bGUgY2xvY2sNCj4gPiA+ID4gZm9yIHRoZSBTaWZpdmUgZ3BpbyBJUCBibG9jay4NCj4gPiA+ID4g
DQo+ID4gPiA+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+DQo+
ID4gPiA+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiA+ID4gPiBDYzogZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIExl
IE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUsZ3Bpby55YW1sIHwgMjEgKysrKysrKysr
KysrKysrKy0tLQ0KPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxncGlvLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUsZ3Bpby55YW1sDQo+ID4gPiA+IGlu
ZGV4IGFiMjIwNTZmOGI0NC4uMmNlZjE4Y2E3MzdjIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUsZ3Bpby55YW1sDQo+ID4g
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxn
cGlvLnlhbWwNCj4gPiA+ID4gQEAgLTE2LDYgKzE2LDcgQEAgcHJvcGVydGllczoNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqAtIGVudW06DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtIHNp
Zml2ZSxmdTU0MC1jMDAwLWdwaW8NCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC0gc2lm
aXZlLGZ1NzQwLWMwMDAtZ3Bpbw0KPiA+ID4gPiArICAgICAgICAgIC0gY2FuYWFuLGsyMTAtZ3Bp
b2hzDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgLSBjb25zdDogc2lmaXZlLGdwaW8wDQo+ID4gPiA+
IA0KPiA+ID4gPiDCoMKgwqByZWc6DQo+ID4gPiA+IEBAIC0yMyw5ICsyNCw5IEBAIHByb3BlcnRp
ZXM6DQo+ID4gPiA+IA0KPiA+ID4gPiDCoMKgwqBpbnRlcnJ1cHRzOg0KPiA+ID4gPiDCoMKgwqDC
oMKgZGVzY3JpcHRpb246DQo+ID4gPiA+IC0gICAgICBpbnRlcnJ1cHQgbWFwcGluZyBvbmUgcGVy
IEdQSU8uIE1heGltdW0gMTYgR1BJT3MuDQo+ID4gPiA+ICsgICAgICBpbnRlcnJ1cHQgbWFwcGlu
ZyBvbmUgcGVyIEdQSU8uIE1heGltdW0gMzIgR1BJT3MuDQo+ID4gPiA+IMKgwqDCoMKgwqBtaW5J
dGVtczogMQ0KPiA+ID4gPiAtICAgIG1heEl0ZW1zOiAxNg0KPiA+ID4gPiArICAgIG1heEl0ZW1z
OiAzMg0KPiA+ID4gPiANCj4gPiA+ID4gwqDCoMKgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRydWUN
Cj4gPiA+ID4gDQo+ID4gPiA+IEBAIC0zOCw2ICszOSwxMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4g
PiDCoMKgwqAiI2dwaW8tY2VsbHMiOg0KPiA+ID4gPiDCoMKgwqDCoMKgY29uc3Q6IDINCj4gPiA+
ID4gDQo+ID4gPiA+ICsgIG5ncGlvczoNCj4gPiA+ID4gKyAgICBtaW5pbXVtOiAxDQo+ID4gPiA+
ICsgICAgbWF4aW11bTogMzINCj4gPiA+IA0KPiA+ID4gV2hhdCdzIHRoZSBkZWZhdWx0IGFzIG9i
dmlvdXNseSBkcml2ZXJzIGFscmVhZHkgYXNzdW1lIHNvbWV0aGluZy4NCj4gPiA+IA0KPiA+ID4g
RG9lcyBhIGRyaXZlciBhY3R1YWxseSBuZWVkIHRvIGtub3cgdGhpcz8gRm9yIGV4YW1wbGUsIGRv
ZXMgdGhlDQo+ID4gPiByZWdpc3RlciBzdHJpZGUgY2hhbmdlIG9yIHNvbWV0aGluZz8NCj4gPiA+
IA0KPiA+ID4gUGxlYXNlIGRvbid0IGFkZCBpdCBpZiB0aGUgb25seSBwdXJwb3NlIGlzIGVycm9y
IGNoZWNrIHlvdXIgRFQgKElPVywNCj4gPiA+IGlmIGl0IGp1c3QgY2hlY2tzIHRoZSBtYXggY2Vs
bCB2YWx1ZSBpbiBncGlvcyBwaGFuZGxlcykuDQo+ID4gDQo+ID4gSWYgSSByZW1vdmUgdGhhdCwg
bWFrZSBkdGJzX2NoZWNrIGNvbXBsYWlucy4gTG9va2luZyBhdCBvdGhlIGdwaW8gY29udHJvbGxl
cg0KPiA+IGJpbmRpbmdzLCB0aGV5IGFsbCBoYXZlIGl0LiBTbyBpc24ndCBpdCBiZXR0ZXIgdG8g
YmUgY29uc2lzdGVudCwgYW5kIGF2b2lkIG1ha2UNCj4gPiBkdGJzX2NoZWNrIGVycm9ycyA/DQo+
IA0KPiBUaGF0IHdvdWxkIG1lYW4geW91IGFyZSBhbHJlYWR5IHVzaW5nICduZ3Bpb3MnIGFuZCBp
dCBpcyB1bmRvY3VtZW50ZWQNCj4gKGZvciB0aGlzIGJpbmRpbmcpLiBJZiBhbHJlYWR5IGluIHVz
ZSBhbmQgcG9zc2libHkgaGF2aW5nIHVzZXJzIHRoZW4NCj4gdGhhdCBjaGFuZ2VzIHRoaW5ncywg
YnV0IHRoYXQncyBub3Qgd2hhdCB0aGUgY29tbWl0IG1zZyBzYXlzLg0KPiANCj4gTm90ICphbGwq
IGdwaW8gY29udHJvbGxlcnMgaGF2ZSBuZ3Bpb3MuIEl0J3MgYSBnb29kIG51bWJlciwgYnV0DQo+
IHByb2JhYmx5IG1vcmUgdGhhbiBuZWVkIGl0IHRob3VnaC4gSWYgd2Ugd2FudGVkIGl0IGV2ZXJ5
d2hlcmUsIHRoZXJlDQo+IHdvdWxkIGJlIGEgc2NoZW1hIGVuZm9yY2luZyB0aGF0Lg0KDQpJZiBJ
IHJlbW92ZSB0aGUgbWluaW11bSBhbmQgbWF4aW11bSBsaW5lcywgSSBnZXQgdGhpcyBlcnJvcjoN
Cg0KLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUsZ3Bpby55
YW1sOjQyOjEwOiBbZXJyb3JdIGVtcHR5DQp2YWx1ZSBpbiBibG9jayBtYXBwaW5nIChlbXB0eS12
YWx1ZXMpDQogIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Byb2Nl
c3NlZC1zY2hlbWEtZXhhbXBsZXMuanNvbg0KL2hvbWUvZGFtaWVuL1Byb2plY3RzL1JJU0NWL2xp
bnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZQ0KLGdwaW8u
eWFtbDogcHJvcGVydGllczpuZ3Bpb3M6IE5vbmUgaXMgbm90IG9mIHR5cGUgJ29iamVjdCcsICdi
b29sZWFuJw0KICBTQ0hFTUEgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wcm9j
ZXNzZWQtc2NoZW1hLWV4YW1wbGVzLmpzb24NCi9ob21lL2RhbWllbi9Qcm9qZWN0cy9SSVNDVi9s
aW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUNCixncGlv
LnlhbWw6IGlnbm9yaW5nLCBlcnJvciBpbiBzY2hlbWE6IHByb3BlcnRpZXM6IG5ncGlvcw0Kd2Fy
bmluZzogbm8gc2NoZW1hIGZvdW5kIGluIGZpbGU6DQouL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxncGlvLnlhbWwNCg0KSWYgSSByZW1vdmUgdGhlIG5ncGlv
cyBwcm9wZXJ0eSBlbnRpcmVseSwgdGhlbiBJIGdldCBhIGhpdCBvbiB0aGUgZGV2aWNlIHRyZWU6
DQoNCiAgQ0hFQ0sgICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9zaXBlZWRfbWFpeF9iaXQu
ZHQueWFtbA0KL2xpbnV4L2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL3NpcGVlZF9tYWl4X2Jp
dC5kdC55YW1sOg0KZ3Bpby1jb250cm9sbGVyQDM4MDAxMDAwOiAnbmdwaW9zJyBkb2VzIG5vdCBt
YXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLQ0KWzAtOV0rJw0KCUZyb20gc2NoZW1h
Og0KL2hvbWUvZGFtaWVuL1Byb2plY3RzL1JJU0NWL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZQ0KLGdwaW8ueWFtbA0KDQpOb3csIElmIEkgY2hhbmdl
IHRoZSBwcm9wZXJ0eSBkZWZpbml0aW9uIHRvIHRoaXM6DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUsZ3Bpby55YW1sDQpiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxncGlvLnlhbWwNCmluZGV4
IDJjZWYxOGNhNzM3Yy4uNWM3ODY1MTgwMzgzIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc2lmaXZlLGdwaW8ueWFtbA0KKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc2lmaXZlLGdwaW8ueWFtbA0KQEAgLTQwLDgg
KzQwLDExIEBAIHByb3BlcnRpZXM6DQogICAgIGNvbnN0OiAyDQogDQogICBuZ3Bpb3M6DQotICAg
IG1pbmltdW06IDENCi0gICAgbWF4aW11bTogMzINCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQorICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIFRoZSBu
dW1iZXIgb2YgR1BJTyBwaW5zIGltcGxlbWVudGVkIGJ5IHRoZSBjb250cm9sbGVyLg0KKyAgICAg
IEl0IGlzIDE2IGZvciB0aGUgU2lGaXZlIFNvQ3MgYW5kIDMyIGZvciB0aGUgQ2FuYWFuIEsyMTAg
U29DLg0KKw0KIA0KICAgZ3Bpby1jb250cm9sbGVyOiB0cnVlDQoNClRoZW4gYWxsIGlzIE9LLg0K
DQpXaGljaCBvcHRpb24gc2hvdWxkIEkgZ28gZm9yIGhlcmUgPyBJZiB3ZSB3YW50IHRvIGF2b2lk
IGEgZHRic19jaGVjayBlcnJvciwgYXMNCmZhciBhcyBJIGNhbiBzZWUsIHdlIGNhbjoNCjEpIFJl
bW92ZSB0aGUgbmdwaW9zIHByb3BlcnR5IGFuZCByZW1vdmUgaXRzIHVzZSBmcm9tIHRoZSBEVFMs
IHdoaWNoIGlzIG5vdA0KbmljZSBpbiBteSBvcGluaW9uDQoyKSBVc2UgdGhlIG1vZGlmaWNhdGlv
biBwcm9wb3NlZCBhYm92ZQ0KDQpQbGVhc2UgYWR2aXNlLiBUaGFua3MgIQ0KDQotLSANCkRhbWll
biBMZSBNb2FsDQpXZXN0ZXJuIERpZ2l0YWwgUmVzZWFyY2gNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
