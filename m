Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB08C5AD2B
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3xyk1cx/JbSUsi0wcea4mUBPOX6MNx0IeLML5JnRXc=; b=oW/JOId7K8CaHj
	J0X50jeJjzrVXgzTzDt5mc3s4K6/9xgNzHdMDo54U5c4WXfoj4jS0DizZCHihnwBuU9Q50zlj5r8I
	8c4ZW1xy8Hh+VNhP9J8P4ZN1olSRqS3DGMx01jL4UJLjj1s+FBHWjvaFOq7HHR6MERlPcAjDGdw/e
	stWCBH2cknzlb0aVup/q8l+3pQ8wmyMpHo3Z7n7sCs4brTSpxhNMgRe8FpwRsWNIaxpwtduOpVnfI
	+SATml0RdzSAycwprF/pJJjpovREDGrvDDzIvL/P48SQ8s8Eh7TcFcGXcDH7vWQ9VQh5XX1ufJeDb
	VL9gs3X+TwWI0V+bDpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdTA-00000009DwG-3GNq;
	Sat, 08 Aug 2026 09:35:56 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdT7-00000009Dvg-1mdD
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 09:35:55 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6789P1h41115330;
	Sat, 8 Aug 2026 10:35:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	dk201812; bh=EnhdshtjS0phIbK/KSx12Lmg90Grmoh69IZkHdpOY0w=; b=wUE
	DkkobXa8Q8FEKDlzHMgE77VqNELBXpJMyp1ijG4gyhbo7XayTlAXA5TSpVe5/OOr
	o4kMqMqWsS5qr++HhC7RqjtD1Y/3h515Su6vOlSWkZeQ7YTYw+FdMSDrsXB5cIeg
	4IurZHAaZ3n6KdlUEtdm40SHIAE7Yf3cuxi1GYh1J4XpCkfYxgVG2G1DkAk1aH5m
	4J6S699Kx2zJhtcsMigj7kUTdOfn0V2ZNtSp0MHU3DhJJBFeJIJcxyEzDkkAGY/x
	275rawnjiqZd6KLVlr5eCQ9HSx8TWdQRWkyqM6dp82WDAyIcaTA9/vsXxjj82xg4
	qCq0s3Nr9SuKbj8jGWA==
Received: from cwxp265cu008.outbound.protection.outlook.com (mail-ukwestazon11020141.outbound.protection.outlook.com [52.101.195.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fwvhtr5jc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 10:35:29 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1pnL+MZSq5J1vQdxdJwBytMlLI2tdbxkdDQmsgSPUPJ4JPRUKMxN7t6KxDE5OIBd4CDtFBPeD062ZXwnZEmpiyXvfCwmoIxosZxlrRvdA3HiCAwqS/k4hfZU4hMNGpmnrsA09lSJ4uCYytH73mjqRkRrInN44VPhO5OAH95hmMslSDgze57o2B0r+o2HyZ7zKhLsVuP7u+mMhI02VA+FvwuzSlrolmwutBkGOVtZJhUh4fx0WPy2EfpWwgl7qY3UNsGMfs6CJDs17I83fkBhrtiFj+OnKn9e3yFh/T6lcjlZ2dUdbMvnfEA3QZPZAhfyoLsbXJ6zX4NpJpOM5kYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnhdshtjS0phIbK/KSx12Lmg90Grmoh69IZkHdpOY0w=;
 b=DLJ6OG4XOjZP5lFWIHm4pUyXUveTS4w0j9VgWz7ECoSVhIHuIWH5QVytSW+1Je8sZtfTZYsev0mgE5p1u9P5wxj0Rce2VVMFokcgZhm9TbHE/gfMbezFkmVz8S6hkbMrn5fnxZsK1QgZveljHFy0symoaAjU+wTNqP2bfgW7NDqA1LgfREyfb4PlhoNe4o/vIDv35sgsgf6r/noPgUgjlW3zTnc6At016QEnCBKBKG7O2DAkEbkQCFEA+8o/vNJdgOkpdMv7NotJzRSSRFXTszO9tvS1tW0E/Rz5yPEeF2ndAYlxcU79BF11hG3Ca8oHibK1DDI2ISCyjaqpBny9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnhdshtjS0phIbK/KSx12Lmg90Grmoh69IZkHdpOY0w=;
 b=V9e56XuQR7GskIG+FnG1X/fQ+V/3r5vwfRkZN3RfnebTkozNWU5ojgu2UqZFazQ6gjIuKfxc3VqGLEB1N1Mf6Gb6HTJkqCjBQcx1mmCoG22j2A/ZnR6k2xf5ELaR7GSCxDrLpXkjZVTuDCM1A8m6MlG4/dAhVi2j5rhYRzBw1eI=
Received: from LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:449::15)
 by LO8P302MB2379.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:468::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 09:35:25 +0000
Received: from LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
 ([fe80::3585:13b4:3133:1e3e]) by LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
 ([fe80::3585:13b4:3133:1e3e%6]) with mapi id 15.21.0292.024; Sat, 8 Aug 2026
 09:35:25 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Alexandru Dadu <Alexandru.Dadu@imgtec.com>
CC: Luigi Santivetti <Luigi.Santivetti@imgtec.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "opensource@mtcoster.net" <opensource@mtcoster.net>,
        "imagination@lists.freedesktop.org" <imagination@lists.freedesktop.org>,
        "simona@ffwll.ch" <simona@ffwll.ch>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
        "pjw@kernel.org" <pjw@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "alex@ghiti.fr" <alex@ghiti.fr>,
        "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "mripard@kernel.org"
	<mripard@kernel.org>,
        "airlied@gmail.com" <airlied@gmail.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 2/2] drm/imagination: Move FWCORE_* macros to reg defs
Thread-Topic: [PATCH 2/2] drm/imagination: Move FWCORE_* macros to reg defs
Thread-Index: AQHdJjzUFm0jCtpOn0Kdcb6gagLqgbaT5gAA
Date: Sat, 8 Aug 2026 09:35:24 +0000
Message-ID: <15e0c61a10e50743ed8c49cb2bf102809da34710.camel@imgtec.com>
References: <20260807-b4-unify-repeated-reg-defs-and-move-fwcore-macros-v1-0-375208fbb579@imgtec.com>
	 <20260807-b4-unify-repeated-reg-defs-and-move-fwcore-macros-v1-2-375208fbb579@imgtec.com>
In-Reply-To: <20260807-b4-unify-repeated-reg-defs-and-move-fwcore-macros-v1-2-375208fbb579@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO7P302MB2107:EE_|LO8P302MB2379:EE_
x-ms-office365-filtering-correlation-id: 03c62d51-2fc1-422b-b6ff-08def5305feb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|4143699003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: KlirQWd2uLNcEP0uojkYAHmgbHv9MbPF4Ptz8tUj8rfXqPvLKozoHVs4SeMcW+sOjqlBRcCvc2YA+cIa/s1hG340if6TcDMBiqBjguluRZZb1f25qBe1at7zAUZrSfR9BF4yF87daVX9XezvMYeR6S1yy9YZmjy0Mwf8gvCUPpgpvZyFSDpp9kJYB1xVyDSnjvZ5gXrsP+unmL+AdfU9xorXpw7z1ztBFhV3EJhdgEmIEkiHROUq8eRoz7WIdTe0qU2tvhFvbyEZRMI9sRLOPwWuBFTgSmo+8dLXXad67zWjJP5ljJB9PAdeI85yCYluXs11kz1+c5sbw/VRIgrwZgZaDql8P+D3depIQPjVBGFlrQdvS3bDfMjnudhfTWFEAm+o/thu9l7PYMMGWwClOILzkOUOFmnYhjAg8mXC8AOAOPwHDlQScfECKVJCA1vZgy0OzORwA/O8A/CKwLHXElMRAyykB0TfbSth8CFYgcHKooOdYorAHG+Kw8Q4atVEE78fk928aluNeC2OPqen0OvXmCMqLeUBQJBPHOiY9KYzvTKIde8ulJ7kkZlzlqvKL2/Vj/sqvW9g7iKYC2HmPxhUS/awLau3fpd6NrQZ+vVA7c6UPJeSk9EgdgSrl6nvbCDYXhRLveKsveT5CiBEaGioXWeWNKRcNdVA/0l+i0Vs2tGusVFqKki0NyyUlDFm28WGpXLLAas8I2mDTqFe51YXPlJLen6Bf4lJgw3MiAc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjAzbkhCUzIwZjZYOHp4TVhxRWlDdFFJRUhpYm0rTm9oVjAydnBhUTJZTW5n?=
 =?utf-8?B?UVV4QlAxc0YvV0dxbHVmZjhjTTBiUU1wbUxMTXJyTlJkUEJLVHZ3VUF2a3I3?=
 =?utf-8?B?Q29HQitaWkxXcGg1WHBaWmJTMHpoUlM1T2ZUK0s5STRmNlJwRjhiZHBOeWxW?=
 =?utf-8?B?RUVjcHEwQkkyeEVVaVUvd1dOa0xxTjA2K0hnNCtlbFBxaEc4S3JSYllsYmdN?=
 =?utf-8?B?R2dEdFhGTDVVUnc4OGtqQy9VbDZ1OUVXdGpPemNzdEdva3JMdkFVd28vSENH?=
 =?utf-8?B?TG1mWVJGNzc3NjNrM3Q5cU9NbS8wdnp0WWpsTkZ1ZlJWK2p0UUpZb3BEek8v?=
 =?utf-8?B?MjVrMHJwSHh1K3Z6NDNWamZqamU5VWNCdG9HMmxYRG9aeFF5Vkp2aHdGVDRL?=
 =?utf-8?B?MjZZaCtjZkwrZXZ2ZmxHTW9IaXFhN0N0TjM4QVVUdXVvb3Z3aDFOZUxaS3Va?=
 =?utf-8?B?WjRzOXI1QWlWZ1I4NEFtUFZsaWFoRFphL25uSENDaG5VWkM3a3A4WEYrUmRk?=
 =?utf-8?B?YVNpSEpsT3FCTWlXeE5uakZRMUM0bXJRcmM2WUg3WTBsTE15b1FMRURjQ2Zn?=
 =?utf-8?B?dE1kUEJlaUdtVVZXVlQzQ2wwa1BMVFNnMDJDZ3c5MG5ITDR5eGNpYjRDOGhZ?=
 =?utf-8?B?Tzd2NndpMG4zQWRzbjFOd3M4VjhEN2xPUE9QTlZGc3VYbVE5bUdDUHBKQmFx?=
 =?utf-8?B?cUNCMFZWVVhkWWZ4aWZIUUgxMVcwZTdLSVVNVHgvRFI4NGNqZVU3QWpEM2Yz?=
 =?utf-8?B?clZVWjNoM0ZJNVRkdndadkt6Qld1YU9DeUs3MFRIVVE0YVNuMFY5aUw4bmZn?=
 =?utf-8?B?TVAvOG1ueXJNdjRLT0lvVWtqa2dNWG44VkIrdU9uRmFhdG8rS3NtN25DNFA5?=
 =?utf-8?B?SldoWnkwVHZMVWZkcE81YldtVmZIbEc5eHJvOEtOWXFxdUZtYTdhRUkwT0tE?=
 =?utf-8?B?WmRjRzFwbW96cHNvMlJZcWxYUWRuVnFKaUdVa3BwaWtvSCsyeVhnL0Zteisz?=
 =?utf-8?B?N2pWd241RDZCOTZCVGRLQmhEU1ZrQ1ZpU2lBY1hid2dqRThJU1NlS1RxVFp4?=
 =?utf-8?B?Q2tET2ExZXZlOHhybjJ4V2lQSmIzcWoxUDhoYkR1YUNHSHpFclp2UTZzblJz?=
 =?utf-8?B?UytkUHF5UjlORkYyMWJaVEJUYXJwc3QvRm4wUU12TCtNUnpxOGVqSGJmNU8v?=
 =?utf-8?B?Mnc2SHNBZ0hpV1NIVnc4N3ZMRW0wSEd3ZEtMbllJYlNkWE5hQ1pBRVExWk1Y?=
 =?utf-8?B?VStJUzBkQng4TzdqNzNuVndjL0ozblpybkZjMllHOElIMVprOHcwdzV0RVNw?=
 =?utf-8?B?cUVRMjRWekVvQXNBL2hDZXpiQ2tIcnFESUExSzdxTW5wL3FGMmd4b1JMZHdw?=
 =?utf-8?B?N0hkN1hGd2FyNHpqVmExOExEbW1NTEt0WEtiTXFhREhjZWZUNVA0WktRK1VY?=
 =?utf-8?B?bWVPK013dzJ2ZFZXRzU0S0gyV3pmQ3Z6ZXd3T3Yrekt1Qi84UjNGWW9UWG1W?=
 =?utf-8?B?STVpQjFJNEpoRmt6b2pOenVGajQzMkpjdG5SYUVNNWxublA2REkyajVWNzJz?=
 =?utf-8?B?bEtGeklwWmpHTmhQRC9QTVpXVVNXYjdoZXJwWTlhMUl2SGpEWFBFbUpGTG55?=
 =?utf-8?B?V1RISkVnbGtHMGtEbVZNZlNrUU1ZQkthdWVwUC9LZTVTQlZHaFVUZnFtYXYr?=
 =?utf-8?B?UFRjUnQxVnRROE1JNDBQTXV3SFlxUTJKWGh3S3hFRGtlWC8zWHBPejFxWkpw?=
 =?utf-8?B?OU5MUC92KzdtWHQyRTg2L0FMWXplSm5CWkxSeUF3K3EzMGI1b3U5QWtCQTRj?=
 =?utf-8?B?T1NaT1UxOWdwNW9YNmxHbHIraU04am9tdzc3RTNkcGlPeWpZNmpMbjNLZmJH?=
 =?utf-8?B?TnVjT0NNSVE4WjVZaWVsRGlwUFd3RW9mU3hMcCs1UHg5TzY4dlZRZlV2eTl5?=
 =?utf-8?B?NXpJNFBuWkZzaHJoU1BwSFVvWnZwTjdSQkRTdlpoTDJ5eENZUm1ZYmNac3FZ?=
 =?utf-8?B?QnBLeDcrYTUvRDUxVXk5T0wrWW9jUDA4QWxyTUtTdjlTVzZFTnhQL2tGS3lm?=
 =?utf-8?B?aVpLWmpka0MyWU9uVXYrVEtBeGJRVGR6eGpHQ0w5cE9MWG9ZWktZbFZGL3Rn?=
 =?utf-8?B?ZkM2dHI1WE1GUG9GemVSVkJEKzVhVW5rVHgvMCtNQUxDSXozdFhFRThKeGwy?=
 =?utf-8?B?RC9aWTJMbklCWjFadVR5eXlzUmNyNG1jY2Zub3RaaTVQanBqdWEzcjNqQVE3?=
 =?utf-8?B?V1p6ajlaby9ZQ01JNlJxeFRNa1Z0cGFWR3doV0IyUmxnRnVnM05KbnBmbDJC?=
 =?utf-8?B?N1I2SkgyeVAyYXVXMDFCd2ppMWpWTFlMQXFMTSt3NWFaTnVXYzU0UHRlNW1Y?=
 =?utf-8?Q?J3PP7/QNOvXI3oDI=3D?=
Content-ID: <603A2D1C2F38EE49B47960C069013A7B@GBRP302.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GFYmkXMCivbE+eWnmL1PLF1g7+NyecjlAQiivDyJ8YRbuGgIrXmb3eEw/aMga1/G/JUu7eCFmetXOZSg5J/9EaxGC0oyWfQREmLn9Rad2Y3NwcyXPmA6FYzpjKSWzT4yI9ufBNzqDx0GueYrBMn2s1RPvFY8Aoiz259bMoxMVmVZDDqO7hjIQYXnJ1YBBSRKnwHOeQ8JQOhYX6B8mEwSiMxki+0lVtpATK2BLrZxP2H//vA0KWVPb1rrqpnu/IsR/tEPY6ZlKo3lm3H3YlqCdzpn5wkccLExX28oBcX+YUJ4efb7puiGv2wL4MLa844hqP5no12M0sXo9U6fAvg7vw==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c62d51-2fc1-422b-b6ff-08def5305feb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2026 09:35:24.9591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3XCc0t/Z6/6K5oeYJ8/lJZ24GOCiFZQEQOhoigZL2pqXNdEO5nntSKbjjcZ8iAwHS1aeYAD/EbG2fm1T60VEwhOCayIaX/GNN5IVG43Lwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P302MB2379
X-Proofpoint-GUID: lbUN3WSff8JmXt0EfIbfRc9kuJoqc5n0
X-Proofpoint-ORIG-GUID: lbUN3WSff8JmXt0EfIbfRc9kuJoqc5n0
X-Authority-Analysis: v=2.4 cv=Xt7K/1F9 c=1 sm=1 tr=0 ts=6a76f861 cx=c_pps
 a=mTgzV5mghdx+RhOkCEs1EQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=r_1tXGB3AAAA:8
 a=KJNmBeMexaQtD_mviR4A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDA3OCBTYWx0ZWRfX4suFSiukCcJN
 LN6zZ5/TnXWltYUVxRlI332iR8RE3XGA8k5kEXYboDje9tC7nrYfNFRKeM6nhi3wZAgvhErM234
 PBy6EzRZAG4Rf0h9Nt+cm+bjiTvpGJxzhzmnAx8+D8YULiIIWju9CC1LUC1ChOJ3e0goj5PcyY0
 XthB4CZrDMdQ+2i+QxAC0gZKBBLPNihDxegchK+lY4Xg917sVcKUylwBBNQa6PqaLgplNhNnGu9
 kOPh2sZ0baF/8zImynQHchvb7t9nTnH/7xcqrfHpbM5jAKXTlHy1DsBrPitYyhNQ534TLf45ZPT
 9Ml0LWCijbL8Vck0ZT3ikWa68em8EESNvGiPK486mLvMEqXQo1VN/o1kcAl9D6059UVyqWAbzTI
 g0+CmSI2aw7nUMPxAXfoETgO2LLT5AA9qNP7ntixmTcbBMKymejc+Ww6FDUX5V8d96csTmiThu8
 6kqwahAo136VOZdqgJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDA3OCBTYWx0ZWRfX8jJojgdkiwIh
 ABi6NscCDX6uyq2OIZo/hBzhbUbwtTMXO5ThKER7IL9/qcZ5dJMNg72cK5K1uAoHz6FjIRAlXeq
 vzQa1v9w6VyFU5oh1sQN2J6nz8A+S8E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_023553_768642_8FCCA821 
X-CRM114-Status: GOOD (  16.56  )
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

Hi Alex,

On Fri, 2026-08-07 at 10:17 +0300, Alexandru Dadu wrote:
> From: Matt Coster <matt.coster@imgtec.com>
> 
> FWCORE_* macros moved to pvr_rogue_cr_defs.h

nit: Period at the end, also could you point out here that these macros should
have been part of that header from the beginning?

In the title, for consistency with the other patch, maybe "reg defs" ->
"register defines".

> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>

Changes LGTM. Strict checkpatch reports usage of camel case due to "CONFIGx"
(same for the first patch), but unless anyone complains, I'd leave it like this.

Thanks,
Alessio

> ---
>  drivers/gpu/drm/imagination/pvr_fw_riscv.c      | 5 +++--
>  drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h | 2 ++
>  drivers/gpu/drm/imagination/pvr_rogue_defs.h    | 9 ---------
>  3 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_riscv.c b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> index d2bd263aa25f..c160ec9e3ff2 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> @@ -23,10 +23,11 @@ static int
>  pvr_riscv_wrapper_init(struct pvr_device *pvr_dev)
>  {
>  	const u64 common_opts =
> -		((u64)(ROGUE_FW_HEAP_RISCV_SIZE >> FWCORE_ADDR_REMAP_CONFIGx_SIZE_ALIGNSHIFT)
> +		((u64)(ROGUE_FW_HEAP_RISCV_SIZE
> +		       >> ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_SIZE_ALIGNSHIFT)
>  		 << ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_SIZE_SHIFT) |
>  		((u64)MMU_CONTEXT_MAPPING_FWPRIV
> -		 << FWCORE_ADDR_REMAP_CONFIGx_MMU_CONTEXT_SHIFT);
> +		 << ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_CBASE_SHIFT);
>  
>  	u64 code_addr = pvr_fw_obj_get_gpu_addr(pvr_dev->fw_dev.mem.code_obj);
>  	u64 data_addr = pvr_fw_obj_get_gpu_addr(pvr_dev->fw_dev.mem.data_obj);
> diff --git a/drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h b/drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
> index 5fbb1ffd0eb9..45d784f2a82c 100644
> --- a/drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
> +++ b/drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
> @@ -3029,6 +3029,8 @@
>  #define ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_FETCH_EN_EN 0x1000000000000000ULL
>  #define ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_SIZE_SHIFT 44U
>  #define ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_SIZE_CLRMSK 0xF0000FFFFFFFFFFFULL
> +#define ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_SIZE_ALIGNSHIFT 12U
> +#define ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_SIZE_ALIGNSIZE 4096U
>  #define ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_CBASE_SHIFT 40U
>  #define ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_CBASE_CLRMSK 0xFFFFF8FFFFFFFFFFULL
>  #define ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_DEVVADDR_SHIFT 12U
> diff --git a/drivers/gpu/drm/imagination/pvr_rogue_defs.h b/drivers/gpu/drm/imagination/pvr_rogue_defs.h
> index 035e2ea39434..f09ab85e590a 100644
> --- a/drivers/gpu/drm/imagination/pvr_rogue_defs.h
> +++ b/drivers/gpu/drm/imagination/pvr_rogue_defs.h
> @@ -96,15 +96,6 @@
>  /* Utility macro for accessing instances of repeated registers */
>  #define PVR_CR_REPEAT_X(REG, N) ((REG##_REPEAT_BASE) + (N) * (REG##_REPEAT_OFFSET))
>  
> -/*
> - * FWCORE wrapper register defines
> - */
> -#define FWCORE_ADDR_REMAP_CONFIGx_MMU_CONTEXT_SHIFT \
> -	ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_CBASE_SHIFT
> -#define FWCORE_ADDR_REMAP_CONFIGx_MMU_CONTEXT_CLRMSK \
> -	ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_CBASE_CLRMSK
> -#define FWCORE_ADDR_REMAP_CONFIGx_SIZE_ALIGNSHIFT (12U)
> -
>  #define ROGUE_MAX_COMPUTE_SHARED_REGISTERS (2 * 1024)
>  #define ROGUE_MAX_VERTEX_SHARED_REGISTERS 1024
>  #define ROGUE_MAX_PIXEL_SHARED_REGISTERS 1024
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
