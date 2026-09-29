Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D64AC9832A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gs+LHP16dxaUAs1gEZ6IZuz8mGMgEJIc9s2z4h+3CZ0=; b=4T13oTC/o1ocsf
	hLRkUFNzfE21CJXtHirnyUw93B9utdMefYiF+LJUpNewFWwZJ/7qgO8i3IPSJe1sT67UouL6Tgnnc
	hrwWnOmfxt9wL/mBMeJJavEUY95zOfyBiPYSb37H3W9OBWn8U/r5G51Cq24sX70aPOZowblCEXFJQ
	srBxCa8cz6N6ucKW590T6FKxjCEGRBNuWLshy1f+orQbuCnr+DdSaURyyimWze+AZ9SFcl/LiJc2Y
	WIikrNo7Rxy9d2DyUA/bneZKpxn31Mw4kBevZcZnrz94nnTLw74FjwRCD9sadLUqwLUZqvuaE+1Kq
	19vHsBvvSX+T+P6N0vJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZWH-00000003uK1-3EdS;
	Tue, 29 Sep 2026 15:13:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZWE-00000003uJO-2ilL;
	Tue, 29 Sep 2026 15:13:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfED1577264;
	Tue, 29 Sep 2026 15:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=dlt4mPRoZOEDWPJxLTAcTCRtPuQNbaWs2fjk1RhJLqA=; b=pP
	Oy3uZtyxoUs5N6z10oP075BzOayg8mMVR36rjBea9kapkLBSPaL7PgnglOeIj0Pq
	VzOI2d+yNk5U7x+ReFZiCQQHSCK4grRM3joxbeySdiUX5dlBWY8DCbHpAoNMBHBv
	HBZzY3uIeScjWpia7TbxMS0V8W+Gs+VwoK95AcEb4+waqVMgBJv2IXcqIbhcU/X1
	1iswcsDbgrbvaiAbMzLcSrY2b1rqOlqo4n9Pt33rPl//xWeUDZ3/dXVDf8hYP+Db
	Tpw2XF+Y1kLlgyGHOe4oFZNbHBgItyv2nr17NeGi8WbErxrZuXc0+7dg0LShPEn4
	jE8gkdfCOW7t6cZKOSFg==
Received: from bn1pr07cu003.outbound.protection.outlook.com (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4sqjb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:12:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDo2Wx4Xf+3us0x3qo5cuTYamFG/WYpDm8iWoRVEPh8oxaWgndY1MO1IbsMSp22bDkBKDQZxvFYOmf6qKpMoaAa+Bwx4JR++E+AfMBopXBaOBFyrxRwvPdByYmUj1Y0zBUkaTcDSPayhL34zjkVJhYksbL39ZS264ovpOYaooRkKf+ES2xNkbd/8PQ2+VIFS8AstKZxRSn2OT7QN+eV/W8m1GA5kL19A+uoGrQ62ter3f5MIO9s+0p9qBDlOgVuSYohPFWyKN5gEg4t0PXFWNNqfKfAL2LH1xqFdsbZ7e/18zWB2UEY3Q4e/u9h33fUIXutJzvhIKG88Upx+LcZ1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlt4mPRoZOEDWPJxLTAcTCRtPuQNbaWs2fjk1RhJLqA=;
 b=DT0jKaBhO7FqBy8jPYcJYG6+Sjfyg+CrjZR92/kTB18Nd4GCiPPGdKdR0FUUzWUbBRyHUj8NbOh/Yy57KHv9RiVoDcIULj0mHT/shH5hza4tzZ4v14J1GBDkI4IKCrsoZzXpjgUY884AtfV4IaxodQwuzDkkEepGnoNd3oLegGk9hJLDLwu83B/uFG5397fvdwwxWSmQdehO8HfClVQeq1SCEFWRcYno5AJ3+rFjItt1dbz4eShd9jcre340SRJ6Rq1Y/Wk08AZm7hqBVOL9mty8oLUdoCzPPAapm6bNfqSZau8v0vXYbICJMQhv9p3sgfS4tGccVcB1W9gf/7KogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by SA0PR02MB210799.namprd02.prod.outlook.com (2603:10b6:806:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:12:36 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 15:12:36 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy
 Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter
 Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao
	<zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien
 Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan
	<dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto
	<inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-riscv
	<linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
Thread-Topic: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
Thread-Index: AQHdUCT1AafgZkO7UkSDCQjLkxCJvw==
Date: Tue, 29 Sep 2026 15:12:36 +0000
Message-ID: <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
In-Reply-To: <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|SA0PR02MB210799:EE_
x-ms-office365-filtering-correlation-id: b04aaf3b-920e-44ce-1cb6-08df1e3c1840
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|10067099003|11063799006|56012099006|3023799007|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info: OZo2LTg3LlYMcMx6xwZSCyLo62fpp9MkE64Vm3DzaoIWVVpFDsVa0Pszfqg69AhZc7SPWHoUf8xaKq+7OGhB0GMaFyIjsexGk9DK/5syBSw7stIXqErltlHaQRztr1l2HZ1DTlzA7c9t9ww3AGbn7GcFsL4rNo1J+XXscRQC5ZcZDjOPR3FH3A82WLEdjR7sxasZ3L0kP/OzG7jiePNL69FIpneZnOraU8JdOZxGeT6Q/ZrC591Ptik4XMZH9FNkS8jQVv+hHX3DN2u6Whsz9VikXDpkR0Mkmb+wz0rRMvgq3sz7Ir+4dy/kVtFJpaGLZm/KwfpnaxViXzBDX6XdrXhHBxZSGWooMfkAk+WSH6Hs4VngJaPOhkVSbas2lU1ZGiOQICdf9M4pcrSHy9o/UZe1H9nz6VJtz5n7qjavGrHU8dM6AbuY1ySkBhQewOFxda3ewQqR8SQCt7PdSS/zeQ6Kbntt98sqr0XTMC6/zsFxFw7HfKurl571bvzsIKRBQqXPdpuZKrlOf7UZLixcspaZGF8CyAAGcsSJwEjeOosyg55JFCz+VH2H6p94GqPnZW/oxXRgRzwNFWh478s31M9M0ZTBnz20M92QxRP+I26wKcaASlylwgsWrhhdB97NH9CEuzucSk4jEHn0GwBoeKnXhHBTUhdBYkOTC9FaaOjuKM0e24S7sJyukPk0hHAN4wCQzJAXoqk77ms18uA8J/FNd0jht1xYLLGecP3GDEQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(10067099003)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnRDYzVsaFRHWUxLcGx3ZHIvaXArY1o3NGs4bG1NMmlvVm5PVmhadGptVTNa?=
 =?utf-8?B?NUlac2lvWFdmc0M0dnlKeUNUNld3ai81Y2JuVXh0U1libEVqN3dieXcxRjFu?=
 =?utf-8?B?MkozMi93ZWo4cDI5ekVEdFIzM3h2TjQ0UEhiWjM4SmR6djRSTGJWUTkybXJG?=
 =?utf-8?B?K2Z3S1Nyb0JUOXFqVEU4NUdqWlhuclpxbGVaaEhkc29NREpsVUNwQlFzYnpL?=
 =?utf-8?B?VEErMHRTTTlmSXNWUW1zc1MrNGZCamNaWDVWdE1hM0ZYd1NiSDdrMjE3dFRO?=
 =?utf-8?B?c3EwTmxsYjZoK3BhMVlrdXA0cmFqS0ptTjdiVW93QytObG1JcGtwSDNqOVZz?=
 =?utf-8?B?Zmhxay96aG5wUGIwZUxTWFRCbzVSRWM4RUh0ejRQaEhqWHJIb1I1UjB0aE5K?=
 =?utf-8?B?SytXQXJnN3YwUDVPQitWL2RpTGV6RkJhckQ4RzVuRDFqWC9tblVRNm1WNFN3?=
 =?utf-8?B?WXgreHA5bUlBZEVEWVB4L2NDZkNFMEI3Zk55R2hqZnNjc2Vxb3AwS3V0TEJI?=
 =?utf-8?B?VUlOaTdZRUdOVmpsRURsREwzSjRqTDF5S0xKOFZ0RW1ZOTNIQjdwd204T1dh?=
 =?utf-8?B?L1h2dGtSNkpBdVFUSkNreks4TUxHQkVEUFRGamF6a1lycGJxNzdvbmpzQzU0?=
 =?utf-8?B?cFczQWFMSXZWdzFTTWw0bG1wZWpGcUVCanp1QzYzYTZMMVRGaXRBVW5zZWov?=
 =?utf-8?B?ZEtDN24xTDM0THo3enpnUXVjT3AwNVdid2ZYN1FOWmd0SW5NSndtbjAvK0dG?=
 =?utf-8?B?RHRRQVpSenc0L1puUTRIK041dm5acmZxd1gzK1VtZ3ZKZnhYMVMyL3pqc0k3?=
 =?utf-8?B?ZjVRbFkzT1BKWndyVDJiWTdFTEEyOUFqTDFBN2JPMHE2RCs1UFNTR3hwVHly?=
 =?utf-8?B?bWRxcUEvZ3I5amRzcHRGMTFRK3Z6SGp5SWN6VSsrN2x3T3dsMDJYcXhtSU9L?=
 =?utf-8?B?NUpqRmFKYmtxeEhHQUVjaFJ1Y2NtNDBUZExCN281MlBJU3pvcHNIU3c0UWxC?=
 =?utf-8?B?UjdMNUdhU3poUTV2MEpncmJtNXJuSE1rTnhPYm5lbEViZmkyalV5aXVJbE1m?=
 =?utf-8?B?R0Jaa3RmWU9nMFRIUFdqMkJRY0k1Si85NjBDbTk0M1d1U2p6ZEhqbjBFK1py?=
 =?utf-8?B?blZxSDQ0OXZ3Z1gzVTBaT3lnTXFzWTRSS1EvODdmeXhnZEduS1dzczd1UVdz?=
 =?utf-8?B?MVl0NGNLYWFSeXBPQk9NSG0rLzUvL2xYNGxkNk1Gc3NTUllIZnJvSitXa1dw?=
 =?utf-8?B?L0pGQVJQa3QybktERHJCTlpRa1VvTnlUa1VLQk5nRitnWDhITURzR0dETGJl?=
 =?utf-8?B?RjAxR3d5L00vekVvWFhtVTlVQXdITGROcmRDOWhJY252Nld3MXpONFZFZ3Nr?=
 =?utf-8?B?SGNvL013VFcrajJjOEVYcUo1Y0RGb05sNC9UUkVwM21PN09Sem5PQ0RWZWp1?=
 =?utf-8?B?QUpobHVjbmNWdm54aVBSRjkveG53MFo3UnVZWXY1NVAyRkpvMHoxWlNxNWtk?=
 =?utf-8?B?bHNsdHN4cDBKS3o5REFEdEg1U3hPZkEzdjEzZS9kUTRkUTNIdXVEbnl5TUJ3?=
 =?utf-8?B?WlpqNlRGNFRMMW13RTErdy81NmFUYytWTWVPelYzRnFRdnVWaHJnbFkveVVp?=
 =?utf-8?B?d3JOSEd3RzA0VEQ2Y3lYNlZSb1A5dGtURjdTUmNReERYNlhhQXordjFwLytn?=
 =?utf-8?B?MmxHeENUQW42SHhPdkFRWUxtYlpvelNRVjVHU3EzTWoxbld1T0FVbHovMno0?=
 =?utf-8?B?d0RWam8rdXFVV3VoaHVRcGpsUEZVcUpNZDNXV09UVDBRcHVqRG82T0tXWlI1?=
 =?utf-8?B?ZjFhc283MGtiNzhldlI4clF4TU5hQ1dCNTNZQlJxK0V5NzdlWDhqWHFoVUJz?=
 =?utf-8?B?ZmpacHErdjIwdTc0NFlHRkg2ekEwaU1pNk9Nd2FYN3kwdGMra3JDajNOSkVp?=
 =?utf-8?B?UFFQemNoRGdmVmNjMFQyNEJFaDV1eVJTL3BXRDBid3VYWVBoMUhqRVBLYWZi?=
 =?utf-8?B?WjUwdXp4V2gza0diTXg3ZWIrWU1mUWxIeklOU1dlUVg3WmJuOW1OWDVrQUhn?=
 =?utf-8?B?cEE2QUF6U3QweHVFSzR4M0dTSzFYTld4dHYxbzBvb29BWHVDYzZNT1orMkxw?=
 =?utf-8?B?YWVGN3Fid3hSU1NOTmd6bHhkcWVOcU5ZcjVmUnlGKzRYWllSaDNLZ3l0QzVt?=
 =?utf-8?B?VnhtWFpzMFRVU0FHN2xkRmZoK3Y4Vy9PZGJKbDI4dGhlbkZlazZ4Uk9VZ0Rp?=
 =?utf-8?B?TU9RU2JLM1hoelQ0QjFqejBIaWU4aEZZMjlFVDBJSVFzcXNaR0owYk1vVHNI?=
 =?utf-8?B?MGtSSFFiYVl1ZGZ6OTNMZUNJNzJKRkZkUVBmQ0xDT1ZCd1Q3UWtzTEtIWjdt?=
 =?utf-8?Q?9nqy59xiOzU5N7/I=3D?=
Content-ID: <BFB357F7C542E34EB02CDAF46195055F@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JhZj1eHPieY0295lfn5NNRSIsHy2Ul8ze8WTEZJ9UaYoQPPW4q8UlhcGwU9+UDfnVrRZ+hnYTVZQdHHZRo4iaOqYmmC9oi4KAkF6I5kv4fc8+Wd9BTPAMG+AdvY/y/fCf8O9tA++YpgDRxXncWFmW6n8iK9SQytiONxdmY8bRJ5NJ4O3m013ozLDzy4Nxd9f97aWTEHWNyv1fBQz+4r0GIILKAe2i74il5a2nxV5XlDDuqoZTQVhqG6ttVdMa97ic4rN7QBErCbI5HMk6rHbVEMaq2igzL08hHj6Y0aEmb3fOW4ujH56EHpnvEJovG3KXo4dAnZVh09D/RUL/hJ+Qw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zbySiv+fFN2jPRs448PhbVaNKPUbUvrGNQdYjQoBhY78lp35pk8MpTXXQ7syjoRWJrLAuwKRC1gMUpWW1p+UZiXiA5RlNoyVJi9SrutNW2SVfMnKbqr8DqNJKdRk5Ae7oIv+L2fXnbEgVPwq0zHZUW+MCX8P1HozupbH217PuXBrgdwe+miCJTafe4JReSPiieGKcmD8zbMIM1MHVsFFGdPeZTUX33AmlFzTY83k67cgsAjw1qFiPlWRDXX8dVSsv9XsuhUeF+8MpCj05peuontGZ16kmBRz+mEZ9PaR1HvKe6zDyyPcIrpAgIGErWfxdt0W6jXVpeO03knIEIOgkUUwfy6p9CY4qqbB8A90ETG7/5KTTt+jtubfPiRyMB2zJ1NFijMr5GXlowUzw8q7qU7TbC0mm8PBBtP1BsQ17miMg05Nf+RA3tvA/TsswR/x2OTUXQENnop7OOH7MtN7O4Laqok/wceCivhjJbQpCjf9a/xtrZxVhsZyjrANjdmJhiRyZHNyHwuam8P135bc/4gQa8PO/YrbplF6QNpuwSz4DcSefNuqZn+BfuYDjNhdvJ/JOzwpo23bWoTmfhkCVleLkZiOjbZwZpKGo2noOekIEC1SKQN1rSFz+akoUXh1
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04aaf3b-920e-44ce-1cb6-08df1e3c1840
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 15:12:36.3556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrSxvtB/nG1QVnDDLaY2FEn4AThsYLHxn6y8mxtuf81B//5xAdO+Le/MxLoAXx6nzSi7E+H0RyaaATDw4akJjetG/H00MfIGLD+uiF4c6iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB210799
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MCBTYWx0ZWRfX/6IoKYO06CRT
 GlCPR9uZD/YrmDyHjQ434R/mVsCDswfCct+F9vZ2McrLYQpB5sCa7GvUKZZPA1UelyZ8/0BuTq+
 E2z4M6p67j81NCe6l6ApBC5GpscaHvA=
X-Proofpoint-GUID: 388DG219h6GL6mPIy3GKUM8uJYMhUbzh
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbd56a cx=c_pps
 a=vyniI6In/5XBr/U1JZq+ag==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dnoDzjF9eS-z_a7k34cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 388DG219h6GL6mPIy3GKUM8uJYMhUbzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MCBTYWx0ZWRfX9keJ3C83ex1K
 /lnFKM4fJZxmJ6do/U3TPwQXhVpCpJYQt2Haq/7moyJXgd1PDYT1JP4BMwoNaN2noj37eWnIwRX
 AM2f7AE46/uPwSfap7y2bhW9jchevGxxLhsIvIvxAThdltFkoVU52DUk6bN1fTFm7xYeKgj29E/
 vgr+0hEmudu1XzBMNE5LLGRHXGY38Hp8aZ/bBSAtA5Icf2qgXkJE0UQ1ebGrZcXhrpAfKBhOKeQ
 mAcAmtv7ISh1fUJ8GC76GWbNnEKEmkTc4zDvdsrFK/E4OPaLsRwcDe78Hrwb3GCkkVLg6ePwVDo
 oYhnI6PKB56ANXE8ab4FxqCDdZnQ/lmMcD0dVFUISZw1KICw3fL3OZNzQGoa/9Av+icHEzYC9vz
 mpSDb1MwkviEQOpa2d3xKx60NTmrvfeXTajbhNngm773qauXwFbPeUO2ug+zRX190VtPIfDtWe5
 se4m/i4EnzWqXNQq+Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081322_693648_B65EBAD2 
X-CRM114-Status: GOOD (  15.75  )
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

2026-09-24T06:38:17-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
>> On 9/20/26 09:18, Guodong Xu wrote:
>>> [ ... ]
>>>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>>
>> Hello Guodong,
>>
>> The RISC-V Unpriviledged ISA specification has this description of 
>> extension B:
>>
>> "The B standard extension comprises instructions provided by the Zba, 
>> Zbb, and Zbs extensions."
>>
>> __RISCV_ISA_EXT_SUPERSET would imply that something else but 
>> riscv_b_exts is in B. But such an extra seems not to exist.
>>
>> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
>> change may be needed to set extension B if riscv_b_exts is fulfilled.
>
> Thanks for the review. Intentional, and the difference between the two
> macros is whether the extension gets a bit of its own.
>
> __RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
> the name only sets the bits of its parts. That fits zk, zkn names, which
> are shorthands with no identity of their own beyond the ISA string.
>
> B is different: it is a single-letter standard extension with its own
> misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
> of exactly those single letters, so the kernel needs a bit for B itself.
>
> A is declared the same way; with the spec defines A in the same words as
> B. If I can take that as a precedence.
>
> IMHO, "superset" in this table means "also sets these subset bits", not
> "contains something extra".

Zba, Zbb, and Zbs are equivalent to B for our purposes.

Are we sure that B will always be listed in the ISA string when Zba,
Zbb, and Zbs are present?

We could incorrectly lose RVA23U64 bit otherwise, and I think this was
Heinrich's concern as well...

(The "A" extension has the same issue...)

Thanks.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
