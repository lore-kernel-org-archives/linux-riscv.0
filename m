Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714491088E50
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 23:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mf0klY7crXt9ADdYET2njTNcKdx5uY3svM9g8RhT3hc=; b=HrzJDAo40p3qwS
	2IPNHKFf6AHruwncE3IpLOAgfBrf+9+6FWcI67wdGnei9dPC/gAPf137SozuSrPtK+eC3U5yyQwof
	hlgZ8p+F4CUbbkwS7bHu/qUuLMeM73hAfCvc/Pxi0uvC/zPgabBZQx01rpYMWzuapz/C+pYL2CXK1
	j3j1yZBqo9eYTDZw/loJrVVAfVBdLW0bf+eTJxsMlcz6GIzVF1286zlJpSDVzsYHgyQ7frw33cuVv
	sitKDwyus9b8cntzb4rtugGb27rG03Lsm9WgtVj9dXd7CEU8DPS2mkaKgafyVlYohOx3Lrn3XeU+n
	41cL2kUmCrRO7rMcBkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w308F-00000009UMw-0Vp3;
	Wed, 18 Mar 2026 23:16:55 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w308C-00000009ULj-1VFn
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 23:16:53 +0000
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IMYBcE2361912;
	Wed, 18 Mar 2026 16:15:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=; b=
	ktvNFqZEy2NNl3DzdiQeFb4ObiY6MIDQLxcfGqINx52UoIHP4wcGvbicUnddZkp0
	DOFSEMK80EpraRoXKdTLEdxVz/pTDnTdeeBluw777QHo0WjHdNxEm+ystAgITRYz
	2yOVQcywxCH4D9fSIupGGa2QfWvGh9mJDtYspdUnDdl/52gY0RkVEjfoYivcVmb/
	dRYJEN1PqHGM2AHudANN0W7jMLO3ARf/UyVfumQtXhrY25hBe6OwkGv4jEMP3vkK
	1WTymbgLSo7M7+rZNtr6shyyvSLk2O2P8hvfAtKtosDg9A6TS1u1G3fRrfPJwz6P
	v1hJVdbE0SUpgP79nfjKcg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cyt80na27-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 16:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773875755; bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PeDM7q9DNHwzwtN4viKutql34aK13r0+ElGSNCVJ0Mao/UcK8hp0m8tnole/NUEs/
	 MHm0URglNlk3rHLBQT38ekYOQHAhDzlnxDWl/vSizKDzTADsGrEJBJF33J3yUBVxt4
	 oO14362V6gMS0XPHlYFbDLlSj424ak8JXf5O1UCjQHJJcO/bhIOvUBXWJ4VYMkUSh9
	 o50gRtVQZQ/o7zLDP5AJBbIB05hGi5e4J4FfNs9QXHFy5pYaJnabah6AEf4QZypk6g
	 XNK9GOj0A+Z16qiRVU7ZhT4LuGdzValPYmCWBzjZICbC5huc8WoaeOonaV6h+auyMk
	 fakejdqP9E0+w==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 550A640143;
	Wed, 18 Mar 2026 23:15:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5E3A0A0079;
	Wed, 18 Mar 2026 23:15:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=U6ILKPTp;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00103.outbound.protection.outlook.com [40.93.1.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C9C47404D6;
	Wed, 18 Mar 2026 23:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpqTaxftenbMlNx66P1hkFCDJ7O/yxMqiB1kUBoaskj1QpDQM0FMCozyz/Qw8IGBqDmUg891uE0eVGqnNeTw+4xCTT9PS/WeD54eVCfKP1f0FteCmbAZbOXSrF/cpnRHAej6+viFGuLbKwx+WXPZMx3tnZGR1kPDrBUWCK1HOo8XYzwXRugscP9pydNlWaYL/OUnBsTK3L0WeIy+MhrgGJXaitsushag1160kTYY57d33aoXctymw2De/KX8ngYBtr5+K4ui8ihNBK+ElazKgqe0iOuq8eVtMvzSJ/c2rRdZkSoMoGqa16U25qIf1QJIzr3e5UwQ0zokP2a8WkZIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=;
 b=RJvfMDxfj21pqjpOeCYxjjA7Eja9kVrhn8y7LgUxJoEZBgM7RHTvPxRRbLxHPge5Rl0+EthFqWxpjF1DB6uN1ypMMpgmcS4iuAsjvCQR5qfzpZLkcVHiHEyTcu/D1OEGJOB+Dma13BceKNGFD4DQI5eS7c8HHyvP2e3CGBi9Nl8KRAN86SXNcuPxPz9MKSnAINiMSVSjrVUm4BITLkdW+eBd9o1BTHUPCx1WrA6APgXsv8I5Lgnb3m1oWg5KDwW3fScMAcJpiRVKHNHRaxzJ9ov4uPOOBQmxlEwHKFqUF65QQ9PvbVvnDRjpz+28Pa7xZVEf1bWYiX9VK4Sh4MoMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=;
 b=U6ILKPTpWQH/t2jWGO6dFn4cciCLtUZHREWVIUCUy3ChsmB+mFV3hN3KmtyaKF0P0Deh4f2KO+mUNZ1rIay1IGM4iPoCzQHHU+UApWbCIfRg21Iuo8wmpSGJbUCDBZiPXy1ZHxPFvygMMp3sToTD8NNr6tE2hQYHUXV/+WS2KHg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH1PR12MB9622.namprd12.prod.outlook.com (2603:10b6:610:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.12; Wed, 18 Mar
 2026 23:15:44 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 23:15:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "dlan@kernel.org" <dlan@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "huang.ze@linux.dev" <huang.ze@linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Topic: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Index: AQHctRr0ppGnJPsRE0yK8zk2BTHieLWzcneAgABkoACAARj7AA==
Date: Wed, 18 Mar 2026 23:15:44 +0000
Message-ID: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
References: <20260318002953.6gknb2jfveqyisop@synopsys.com>
 <20260318063002.3743362-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260318063002.3743362-1-amadeus@jmu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH1PR12MB9622:EE_
x-ms-office365-filtering-correlation-id: b28ec070-65e7-4374-49ba-08de85444802
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: cMNKpf8c52Y1clzrRwtoWrk9FzXkVKkPbKWdJNo21LckFKjPakd1R6cFbOA8B5uu/lunHhmTVWkGot5kRCzGIspjNj9j3kAsiCYWogpaJ1dw8empgMb2jgVFQR63SFsSDJ50dy/9bCU4MJaGCwTJd7H91HyBarFanjbIBhhanR4OFsrinNEeNqNFSq2KxiF0B+5HA5or8Q0AvjlUMP4RJlEh4kJx1fdo1fUhZ1aTH8Gdsv84axtMA7rL9rEhw2Z07kZ0rZhQl0z3U3CTMLnmbK3Fvjw4rcM3jjDOdJ/JcKk23MuCp5ITEtNKjH4yX0Iiuj4ihqKW9oYNlCYO0ddEHi57oSKy3taLLx4F4t0M7AF0t7d0dKlAkqeWReN9shPlkibeXBo57Bw1GtzBiP7XBjwPuxNUwxxuRbKCcNhBie6TJUsH6+eHAu8UoAAwrCgl+84UE1W0oiSTL1pI8Ug2z1HJhwtjaz4mhP93PJLU5+AFPXe74+g05So/lp87AJQOw+4Nd912BRstIaCI5cYBMpj0y1lGHzBIN1p6S/CFwP9Nn34ub05a3NE9E55p3xLvspAfyrhnYM+xlpHAIV8iEEbv/LfDWv4N+B+4cVnk+oqPmGLewZPJwYzmQ+GrgsH6f3aGGUV2M2A+2JFoU/XpPlGIObezsKSEDWFQWdFl7AnooXz8r+hZkqfbBNJoPDafBmfaxnqpNrvWK0GIrgtfbU/3j9yPiYoQ4xP67PK8nZ6alsEYpoC3nyO4FOfjnysz3P+c3UTCN/oFFAsIE3usiheC8hu2rMNvxSlF0aQzrV0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2w4YXJSQWUvUjI1NWFYLzlibExoUU5WQlpIekQzcUVsT0RFc29vZXRwV1pW?=
 =?utf-8?B?MG80ZXVkbWVpR0c5R0VNWTdwSjQreHp4cVNMYmwwREhVNDJBTy9taVN2NGho?=
 =?utf-8?B?SStWWkdmQVlmQVE0THduQTd2Z1pxZmNyUkNFeGlzYWoyMno5aGxOdXpHekYv?=
 =?utf-8?B?S09UaHVHYTVtSElyaXJjVEs0Q1lkOUdaNi93cE1ESmFpTEk4dlo0aFpsRkVD?=
 =?utf-8?B?c0xWWXRLZ21WWis3cThqR1hFTkFGSExXMllkSEZvTXorcnNXbkVPbWt5M1RY?=
 =?utf-8?B?bkptU2xqTngxbU5aZUxjcFE2T0o0QVEzSFRsMFJ0WDhJQzRBb3poVnRvMzZj?=
 =?utf-8?B?eHp3NytCbEIwVGlEWDVDRlgyTFlHNXozOGhjdWRnV2VVbHZtT2lYakM2L0lP?=
 =?utf-8?B?MlBjSnlKUDFlemtZZVc2WjFvK2U0b1k0Q3hjRTk5bWU2MGo4aFIza1gzWjBR?=
 =?utf-8?B?bUFMUTNDdlZyTHc1ZUlYeXU5QjFTMUl6QWlGaU1DalZrYVh0WWVqK2VzaXdH?=
 =?utf-8?B?R0FKS09FeUlyclJaUFJaR3VTcnZxdFU3MTE1WnhOcFJpRTFWcmtuV0plb3Bs?=
 =?utf-8?B?dUJTNS9uaWFoNlJPUG4rSEN6QVRGZ0NyK2lwUi9vdnk1TTJEUmxFcFBLRlph?=
 =?utf-8?B?WnBadlBTRlJnQjkzcGQ2SlhuTm9DZHhhK0NUbWxqZWhTUEg5VXZJVHErZUtq?=
 =?utf-8?B?YVlVbXJCTDRpQWxkbThXYjRpOUFrUHNFeTJ6blhvNFNEb1Z2ek1FSkd2Z1dl?=
 =?utf-8?B?VkVRRzhvMlpkZTY3RG5uTGl5U0xGR1BvNzY4aVBXbzJaWjRFQ1kwT01KVmhW?=
 =?utf-8?B?MEVXZ2J0T0UxRk52Wm1XMWx2VDY5NVdoVWIxelVyemY1b29YYnlwV2YvcjBE?=
 =?utf-8?B?VVgzRVMxdzlWOVdGREx1NXZBWXFlMjFXaUpaZXA4TFhlV3Fsdjl6OXlnSEU3?=
 =?utf-8?B?ZVBIZmdENzE3R0RSU3BBN25DcExUd3pBaG4zeDllNjRNME1OWVlTRWYyZFlO?=
 =?utf-8?B?d3NOcElrVVpUNHBoblhnaUtpWFBWeGhGelJFWHltYy8xRWZIUnJnM1hsdVYx?=
 =?utf-8?B?bm4xZ3dsbjR0NjFtdDRFeVdkbTFmT3gvVkJNT2lmc0FublFJOWIwWFJlbUVt?=
 =?utf-8?B?eW93TWdvV1NmWFVRelR4WlRVcTRxak83d2RBZnVBOHduK1JvRndob29VbjdH?=
 =?utf-8?B?OEpiOUl5b3l6WWFDblJ1cFA2aTdkWUFhRTNjWFkvbGtSZytiNVluZ0ppWXFm?=
 =?utf-8?B?RG9nMklnTFdqNjZNVTA2akw0aGk0aHpoNEkxWGIvQkZEMVFNNXpURCt1TGM2?=
 =?utf-8?B?aDlCWkFrd0hQeXVQQmRVQittUVpqb1dlc0Z4dlJlUVlROGlTZ2VDR0JEMUc2?=
 =?utf-8?B?TG8wQjREZ1BQeEQra3hxS00wZUhSNzEwZGxOcXlWQnZxRGdlTG50c05Nc280?=
 =?utf-8?B?QTZNOW9QMG1rR3ZQY2dVREFrVDk1TTVwZ0hHQVNDbGhUYTF0T00xVTNldmpm?=
 =?utf-8?B?RDFRdUY4NnMyQStQdzk4LytrdGdkbnAyRTh0VXJiQW0xalJlVG1MUDlJa1VG?=
 =?utf-8?B?dFpnRmhlTVozMExNREgrS3lTcHcwei9JT3dLc05RbFp6cFUxK0Q3dmV1VERZ?=
 =?utf-8?B?bTBTTGhpdmE3cE10SlZJampsQlM2WGJRQ2ozVElLVUpiYitXdHNPRzkxK25i?=
 =?utf-8?B?L3lmVGpzRnArQ2ZTZ0FpamkwT2Z2dFl6ekFKWjMxTjVyWEkxeEZsMitBaDRI?=
 =?utf-8?B?Njg4N3NCMlFSeFhYQzNjcERiTDVkTWlHZk55dU03YUJOVFRISE5pZTVPTEQ1?=
 =?utf-8?B?V0JIWE55UTJ0S28wYjFUaGYwTkc3dlBZditlZm1oYXlpZVY4TVUxRmFZa0lP?=
 =?utf-8?B?MDg1R0NTVGc3eUxucC9mWEFrT0s3Q0NZNW9JNm0zZU0vTzFRV3hXTER0WlZY?=
 =?utf-8?B?dzRTMTcvM3c2Q1FJdTBmODhPK3l4M1R5Y3NmQUp6RjZzTUQzRVUyOWh4U250?=
 =?utf-8?B?Z1QrOHh5QzFxdnN1N1Y1Y2RFRjYyT2ZYWitJRVcxNGJoUTh0QzVvOEtnUkky?=
 =?utf-8?B?bS9WV2VvTmR5ZitjUlNldHRzZ3hySHdVeDdFNkZpTFpON2lHKyt6OEhhOGV1?=
 =?utf-8?B?b2FMbjRSSkI0VHVJeEFkNzFsd3dtTmY4ZXJwdDhaMFpxRmxBSVFNSlAzVlJr?=
 =?utf-8?B?TzVHSG5XYnJPOXNMeXFsZklzSnNiS1hsM1FUNHlOMFV1Vjg3YjUvazEwSW1I?=
 =?utf-8?B?dDQ0MVExdjR2Q29kbFpGZElPRElkMEo1S1lhV2lzbnNDTEt5MW1Wa09UOGdz?=
 =?utf-8?B?aExxRkhLTCtxOUtGblJmS0h4dVR4R1ROYkVpa0ZieHFRRjd5WGFwQT09?=
Content-ID: <9665876AF8368B4B9F4B6B8055812328@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cB97KuE/ZYe5tkrpZRojL02AA4AZFm9e0N8xBqNzz3Ws1G/iZI2f2K+5xGw8itX7qI2HmAf6uEHyZjnmShhLc64EqaZW3BQ6MQvV9ck6l5adumK++d7AhpNJundMejzhNlynLVOXw5LIkewmZg1wVC70lA/qqpieBWz8fi9hznndVZRDUaTzQX64jgp5a3H88MK7MmNyfYX2t7gTNirE2X1a6bmntByIcG7L9HIk1IQ9qgqfO8mupLPtOLeQHhTbGPI36VKpFlm5wlDq4Q40SN5iYJ+4IQjlj9YDgk4RguB8TWpbUE3DZPS3wlnOIzem6OvG3rjNMrUqk0ihjef4dQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +aI1UX+Ao4XxdAMCpZkKwuZFpkX50vWPfjuXE4zIA87nd/xqAGAoZv4wfJ6wfUgzh8cwPhG5CeS7bqoVoul93hEiXy2vCrq8V1KvSgeWrBpLAcuFOflKp5MO0ybdjY+y1eFPuOtrnr+Nx38aET+VJ1NIbk4UIbQfLQmi8F7W6IZGt5xUUb4YTOSvwoxWXA2JKr8NqWnJ0A07GEi2oB12xkSYx9g3hqkOtnzInne/TGKpEG5Jik7gYJx++jK10a+xaWg6M86N2oM6DE5Wps+qk9ROCeH8uYO4AxdapXFDYelfEKbFkhkEcyo48GmR5XQ4kTNx6T3ZSfj1CUGouZlzfQApz2djDPaC4cwtSejzxZzOBL+esgFexh2KdMLIA1y8etSL53HQboDZEHAReoh0fm9LZ0dXMlwwMAEvwv3oa7T6OjQFJjwTrM1rY3rv9Asu4GBdne6ttzz1nQx0cAkfaS5i1pBYqJKcJ5zyUcDpiV6qaCGyft1FzK5FV7hXMiHrUU0cWOXzck/J7u2+7CH1atbDRoS/49n5ba+hW8E8XmFy3NiSS/TvxxkHcgy+LJTD1gZf25JcNRwFJ9yOPft+4ohTji7KXJFuk/B6KjXCVTgxqYPooGYSMxlJo+KSiP0Sn297rLTPMUCGH8+UUv7MYw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28ec070-65e7-4374-49ba-08de85444802
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 23:15:44.5199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XyWPp9CpU8x46moSbm1d+ORShPGM8zUx39MQv7q44N2Pj7ZRtXI/dK8+Qcc2pUsuH+DX9+DA81nQss4FfTpC6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9622
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDIwMSBTYWx0ZWRfXykA7xddhHDcJ
 jJyNP0EYBzmIwOauBIZgLU8+sLIaetchxAs00ron5rZNKPtvAmuYW8j9GRXIFxhEIG/Cx174To4
 Baxs/FcY/teOCGdT3aP22d8rCwOVfbCu3FRzdkbT9hTWQ3JGlX37xunytX46oMGClVB1MzEjNIW
 xJCd6gq/QZP40fWvTixZKXA+E0sLbd/iFZC5qkiaMJ44Qpk7XCPIx2Q3mcVZf5l3jrPpAJxBOCA
 zvD8J96b3pKQcwSOHgTMYRXCqWCBaPZZKF+vPJW3lMbCgIZgimoGeRAU77SAGNZukNIBM7WG5bU
 n7QVJkxk5CLF/wEQjfeo68snOAAvv4RGXvczjfP++1N+8MOJATKhGNYwdf9PlK5Q/56msZDR0UD
 3gYMBTCacBgS5TpMZmOzfP9CbNLmKw2hRpV87K+g3aiNd7nG/9c0pTAHRnsFLjqezXsjLLST4Qo
 4C8hqJC1CeeX64nbE8g==
X-Authority-Analysis: v=2.4 cv=QcNrf8bv c=1 sm=1 tr=0 ts=69bb322b cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=3aj-GYhVtthe46Tand0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: goBMB9tjoEEZB_T4ezodnnYo5PGJPIdg
X-Proofpoint-ORIG-GUID: goBMB9tjoEEZB_T4ezodnnYo5PGJPIdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_161652_430741_94D038A6 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, Mar 18, 2026, Chukun Pan wrote:
> Hi,
> 
> > If we have a specific user, please include it in the change log. In this
> > case, it looks like spacemit k1 as noted under the "---" line?
> 
> I will change it to "Some SpacemiT K1 board".
> 
> > The name "vbus" here maybe confusing. This regulator powers the
> > controller chip and not neccessarily turning on VBUS of the USB bus
> > power line. Is there a common/different name for regulator id?
> > At least fix the error message.
> 
> Sorry, but I don't quite understand what you mean.
> Taking the OrangePi RV2 [1] board as an example:
> 
> VCC_5V0 (IN) -> VCC5V0_USB3 (OUT) -> Vbus30
> 
> The VCC5V0_USB3 regulator is connected to the USB vbus pin.
> I think it's okay to call it "vbus" here?
> 

I mean this is a generic glue driver and not specific to your spacemit
k1. Some platforms use regulators to drive the vbus (e.g. dwc3 meson)
while others for internal controller supplies (e.g. dwc3 exynos). Also,
if the platform is operating in device mode, there should be no vbus.

Also do we want to disable the regulator on system suspend? If so, we
may need a regulator handle.

Perhaps can we pass the regulator id string through the
dwc3_generic_config? Create a new field to store this ID.

Something like this?

struct dwc3_generic_config {
	int (*init)(struct dwc3_generic *dwc3g);
	struct {
		const char *id;
		bool disable_on_suspend;
	} regulator;
	struct dwc3_properties properties;
};

BR,
Thinh
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
