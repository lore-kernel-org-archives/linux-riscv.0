Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA255C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPdVPe2CgY40bUXNmfikyCNN+dHDuHgG32DJgd5VT74=; b=oxfCCwK5o6wWtG
	EUwWGtlETYePHvcwDrnZNcVf5W6Mi4iDqsN0h+GOFjvLIWyjPUohPwODi7zNp3p4O29oRMMNC2wyA
	NKCMnXOAA0lYD/0o2Yto9dyTGSXYcWXamWVGONSI5VSSZ4M9+zSvQtvc+00LoD5eI0VeoSXsgvYJA
	O5kBmZD4jL4tgnRB8OS1LNVB3XcMUPjQP18ki17K4DS4B8De7UanWJRoJ3endKLjZr8bLc76h5VAn
	NdpAMzyv96qUQLOFcOYGGCSMCN/dqg/NnQDM9K4Uat7xF+11u6gILv5oKgaoxERg2pG98T/tl/ovW
	0vCLZtdlmRPniCPuADLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUaB-00D7wW-Pf; Thu, 21 Apr 2022 11:02:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUa6-00D7vp-J2
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 11:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650538958; x=1682074958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qJkVYBuXTO0J3pw7EJapz95GEksM4cLykmlXxZcwpE0=;
 b=NiITA/CSF+FWE67gAeNRWR2KXjbH4qiAqp8OiRJ3BksNfqIvRIDQkw10
 1fQ9GD9T0luqlMSHaqWBD3tZzX6d0hksZivEpRiMRcnd/dbCfO+aBGaho
 LNWLiX0v1vRAzfHT4TFMyb6cjujbHCj9EUa7ks30aHpO/oY4gKYL8lD4t
 HmGBrKtXdbAhRvXBKlVZgub0aj7MvABJya+LZ7kbu5CYNzVwMuxXi04SN
 rG0cICxSDuQ5DQVLvd+R631afzILkWFNwl+w/lpvv+B45G7XY4rTwkdXq
 +3IgaGirznQHfshonS/JP8U2NbFFGRtHGF/6qU3XGn97RswF3tYCBzbm9 Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="93087130"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 04:02:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 04:02:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 04:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRt8+s6bXlmyCqSf1Y+JVss1gVp2zGWHDyershvXFmEu2DCZXaUHhS2ifZKqTK8TKab87zr90RE37qPf4XckqjvcL0r/lE0gL8oV2zalqCvsSzUiwY0AcTlQ7mOYh2PN/lOhnX48SwytJDC8NWICkDTS0GQmMoaXywu/NqoE572kSulJ+Fo43rQZUV5rSTxybVToMCwHEG9e0vZ26q7LG7SObxxNRMx1vMpRZHHPLf4jimoToX5nCTyN6Bavtn06M7alDGUQ/tR42JrTunzzShJ2xV/S0vZjgciUOBOol6GQMTwi4L2AmYkggYDbBghgNJ9qDRezaJi6U+l7PHgOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJkVYBuXTO0J3pw7EJapz95GEksM4cLykmlXxZcwpE0=;
 b=gF0iZXDngZeOCmFayuPwt1KReVy7+JD8gi64xAIWit5ud5FXMUNA1kTXzlGzm7mDnuubyOddJoV86hZimTvMg4I/FHkWSdjproU2b5+SN/ChvwgevQwGiT8Q12ImRcJviyEfssqKOzJb0tYjM0fkfB4OaAU351TK7o4RvcEHvIzgQzTlh2nYfqeBRZLnXHskdT0kWNc4inpca8yd3Nxw5hW3FCnxrhIZjFw2aCR163Xi8kDW+AWsC/r4yZAsLuPk56tmGxar5Srv+mgWMHfHAJASiE11aP7SWpPXO+YYqhP5F0eg9YQ0GiTUafRTK+Y+OXITPj80LqsimBEzMqPCZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJkVYBuXTO0J3pw7EJapz95GEksM4cLykmlXxZcwpE0=;
 b=Vodk6ZPqs0I5tTBio+FrAo80jJgPMYIt4+Ks6iD0ce2B4Ak9bSbDFzRt0Z9iM4nYehLCY6pUrN7QXEbNCG2tZs47BxLokuKLTsgRRTcNBnhFPBg4kUH7Znh4svQt79xBforXLwMHNnYzhvRYPzAKCv4MS+uQEdiEpdqpwDOFTWA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2223.namprd11.prod.outlook.com (2603:10b6:301:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 11:02:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 11:02:35 +0000
From: <Conor.Dooley@microchip.com>
To: <naresh.kamboju@linaro.org>
CC: <zong.li@sifive.com>, <lkft-triage@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <palmer@rivosinc.com>,
 <linux-riscv@lists.infradead.org>, <bmeng.cn@gmail.com>,
 <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>
Subject: Re: [next] riscv: sifive/fu540-c000.dtsi:171.4-42: ERROR
 (duplicate_property_names): /soc/dma@3000000:compatible: Duplicate property
 name
Thread-Topic: [next] riscv: sifive/fu540-c000.dtsi:171.4-42: ERROR
 (duplicate_property_names): /soc/dma@3000000:compatible: Duplicate property
 name
Thread-Index: AQHYVW13ed28jdglL0mqf+BONPXO2qz6M6mA
Date: Thu, 21 Apr 2022 11:02:34 +0000
Message-ID: <41f85208-9b53-bb45-729a-0faed85f6cda@microchip.com>
References: <CA+G9fYvnf3Ys+ptCJf1fNOc1rjTiSEEY9Gxbc49eOrx227xOoQ@mail.gmail.com>
In-Reply-To: <CA+G9fYvnf3Ys+ptCJf1fNOc1rjTiSEEY9Gxbc49eOrx227xOoQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48f3a8c5-e512-4e48-45de-08da238670c0
x-ms-traffictypediagnostic: MWHPR1101MB2223:EE_
x-microsoft-antispam-prvs: <MWHPR1101MB22232942652D726EA752887798F49@MWHPR1101MB2223.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IBYBnpFKw83YQU0kRZ+lyeEeDYr5J3nFWyiHZ7rdmStxjnH3yOJ2fxnHqUK78s79nQv/8Wd2ixLvcBReX/d2JbqwDqx86cgiDslXFCW/o3OiWgVf5AvtBy459hqvCcx0+QEnuoNehYfbTNpo9HtRI1DymnoFOHQ8SKlCaY0RRKXu5Nc/r/hfbF0xn647sAn7CZP9GgFZ+zfTQ271Uf0Cw5pdVycDaKSKaBVc68pDqRXZNQM3VKzEIq4WqEthl0tOlinf3WnnlMsXuDOqwFhX7WzKT/JPStGFsvMTIT322yBV2bmVk7kg8icdH8HCCtnlt3cPdD9sJXzzvgzxZ+yZlxjec3iVdJCvdjVoya6Z/yrIlDeneFIb+dAlvAl0vyAvZfPXcMPw5V2KRc64d3IJxzz219y97nFBKai0cx7UQmpTyP83w+iL841fxbstMK7SWVqOoofLyYCCc78M0xMMz2UZPZLsyRsQz2cqGkKWdvsH8VmAzdKWn3TYT+hUM7s1HkAnnOXkDbi2nlqJweX7c4gct8tMk8wFg7b/dHazO63px/MPiRQilJ9mGLVc0WWCkX/AraKiKfImhP+BOwFXNepxbiclaG5UBR+BSLLHzN0Pv5aDQY2JSfVMcbEKPnzWJ9SEiyubaAjt9KDU+aQVd8t+Kfz0eDvTLQkyfbF6tUkDNvR46sqiZ6nRNFysClaDlxg4nq4AonLmGRVwvB+ArI+ul7G2NAj2dbt173jMRiUML6kL+ZDgV+J/yVcMyNcGYTrJyMJsZG+UsQBv2GDo2laG3BSJkGraYd5HbkqaP6j5Z4RogyuSiV2XmXbI3g6S3Ri2pRjmMKFVpCv2HOEbdV5+Z5cMN8eti13ibgWA5hQtpbx6oAddVVnIffTz380V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(122000001)(6916009)(8936002)(6506007)(66556008)(8676002)(64756008)(66446008)(71200400001)(54906003)(53546011)(4326008)(86362001)(76116006)(91956017)(66476007)(31696002)(966005)(6512007)(83380400001)(31686004)(66946007)(38100700002)(26005)(36756003)(2616005)(316002)(5660300002)(2906002)(186003)(38070700005)(45980500001)(220923002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3NsQldlOEJ2UU1DamtUWGtOZGtIL09BRFRVOFR5RkxCR1B6NUZYSkdLRCt0?=
 =?utf-8?B?NnVYZ2Y3cnNaZmozYVJMTDV2VW4zMklqS2NrcnQvc09ST3lGZ3g5YjJxVGJq?=
 =?utf-8?B?c0swSGJ1cVhmZkJ5b01ybU5xcDlwUXhldWJtTEkrOVRrQW1HR1ZZcXB6czdJ?=
 =?utf-8?B?cHkwaTA4UDI3Y1h2bG9nQk9lUWhCcnV5SmFqV1FYelgyQlNQRnVwejZHRTBm?=
 =?utf-8?B?eTRueXhySVhiTS9kRVZsUmFlbUhwRG11NDNSNGNMK2p2b3d1YnExSzlzTjc3?=
 =?utf-8?B?a3pLRDZ5eUR6cTRpNEtHSldraVBQbGp0MytKajJudjdpOFkyWmF4emsvck1k?=
 =?utf-8?B?UEhSSGozTHc3T1BpcHM1bWh6TVJGWUpjS3JPZGtMem1LenRTTHhKc2lxRUZC?=
 =?utf-8?B?UE1UMzVhNWw2eFFSd0dxLzNIa3JrQ2hRUFBDYVAzYnU3NS9MbjRvWlBhUk9T?=
 =?utf-8?B?d0xkanN3dXJVZUxvK1NPQTZJZkx0eVpnaVhkcDdVaGdmTGZ0ZHQwQjZGV0k4?=
 =?utf-8?B?YlRRZXpYVnJsci9iZTVJZThXVHVhNUZKQjBuKzRKejZ0R2JsSG1PUitoM2RM?=
 =?utf-8?B?ZTNmOWlURnNkYjFQSWpOU2xkNFhxcWRRM3o4L2hORGtIZjFtM0U1dzBsbGlE?=
 =?utf-8?B?VmkyL01oUnd0TDVDanF4enk1bWc1UFl2a0xsemFuLzRtaXFuWXQ2Qk5aZnU4?=
 =?utf-8?B?UFNHWkQra2FhK3o2S2lWb1AwRXJ3citSMzhzVnYvSWNHQlBRbGhWWUtPNjA1?=
 =?utf-8?B?aFJqVWhXVGRVb0kxcVhQKytwcEpLQW05WUt3T0hZQTlpYTB1d0VSWFA2TWNJ?=
 =?utf-8?B?eXp5QkVLcERRVmZFb0dhT0J6T0pldjFLN0pMdmdQbWlJOVcxL1JoSFRuMldC?=
 =?utf-8?B?WXlwNnlOTXJHRDBZYlUwMWJBdStzdlAwMS9hS0RCQjRvSFFhU0RINXZramVV?=
 =?utf-8?B?MnJtdG5JVWIzVTE3K1VjV3JQN0dMRWZkamJDL2RxbWdLQzhmVE1YK1FMbURD?=
 =?utf-8?B?em93UWpjU2FBYzUyLy9yNXZ3OHZwNlZSUzdQVFY1NmRrV0lJaUJYZnA4WkZr?=
 =?utf-8?B?QjhsOVBWUFE1T01XVUUzU1ZBYVFQd0dCZjYxUjdYdVRzd013SVd3N0tvanRW?=
 =?utf-8?B?TTlNTEEzRmVDL2dReHRtazlrdFZRbDJ2OTJTM29kSFNJaUhMQ3JTdVp5UjBz?=
 =?utf-8?B?V1FHSWVuNENnajJ2N0t2N0ExYktuazgxblR5Z0lKYXk5VlJiUGNkOGp5Z0p2?=
 =?utf-8?B?NWxnMFVoVmhtTGZxazlmNFQ2TEFiVUt3WTZtSnlUcmRnTnBCNVh0NDNZSXkv?=
 =?utf-8?B?SFQ2eGNrNERyZnNUK1NPYTZqdDdWc0p4dDFkYzAzQkpERjZkUUFQeHlJeTI5?=
 =?utf-8?B?Z1N5ZFBBNERjQldNUXZldmtBdlYwMDJaWHVvc1hmTWZLeVNzeUIyYjgxTkJi?=
 =?utf-8?B?REZPWTF3RkxGdE1kbFlraEUvK3plNnFLcnRoUmpaYk45aFFzemVQb3BpUnls?=
 =?utf-8?B?dzhpU1IvM1JFaEliTmJEdEdZM3dLTlFyTVQwbE5DODRXZkVucVl3NDRpd3RX?=
 =?utf-8?B?QXdGYTFjcUs0YW85alFvTTFUd2tMbCtNRFBaNGkxMk90WFlhaEdQZkt0Uk5L?=
 =?utf-8?B?TEdiUTJHMDFpL0VkRGF4ZXIrNFI2U290bHRwZmQyNzMzUjFCdkUxM1NnZlFp?=
 =?utf-8?B?a1FpbFJOSHNILzdCNGpNQmN0MWRqcTIwTVNnV2ZCdjdCOFNQQjFpSlZCUzI3?=
 =?utf-8?B?NEFtN2xFNVhIdDNCeXk5cFpCakZwQ0hnMDRnVFZKalNjbHZJb1oxazBxOVVr?=
 =?utf-8?B?aWJQZ2pyMmcxOUtlV3Z2UVBScVJubG5qSXJaK3RSRmpSNW0xU016Y3kycTR4?=
 =?utf-8?B?enJuVUZGREFkc3BSaXl6R1VxbkNqdCs5SHFmSXBCaHQrb0ptSHRyUHJHVVVK?=
 =?utf-8?B?UjRwS2dOLzFpK1hEM25HM29HY0FiVFI5Uy90RGIxODloMDcxaUc0Z1hwNENk?=
 =?utf-8?B?K0VBR1pqUXFyMmpJUHdwbDFubzFYOVRiK01GSERpL2JKUUM0aHI4QUkzTFA3?=
 =?utf-8?B?cWFhMHF3dXFxd3JuN0NxN01UQWx2V1dZNmpBelAxellkbWh4MVRGOWlCbDdV?=
 =?utf-8?B?YkVCbmNRc0d5cmFBVnQvbkNuenZTNXBRYUVTUVErOVVEKzNDMXFVZDI1dU1Z?=
 =?utf-8?B?d0VMMnYwMUNPckFoM2RMNVFoby85NTRLT3paR2hQSVJ3WTJaRmdab3QvbXdq?=
 =?utf-8?B?K1MxWFVrN1dzemtkVmFHWFljdUdicThtUkNvY1JocDFzRHB1V3hWcHdoMytB?=
 =?utf-8?B?Y1draUpkaTkyaDBJSktYY3l0eGx1cWFld2dYNVREOFVxcjNRQm5LQT09?=
Content-ID: <97BD51DA22E520449C3E53AE20C9CD26@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f3a8c5-e512-4e48-45de-08da238670c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 11:02:34.9960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cYz2jU+K7Kr62kFXwWR3Pq+9DWPrDI/gbklnCFlzfYUgxhGYJcwbTe9kMzboOBaAAEdwS34YjpXWElr5EgtKVddS9rRv6ue9aFIkzDht3Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_040238_902665_F738BFD6 
X-CRM114-Status: GOOD (  14.75  )
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

On 21/04/2022 10:49, Naresh Kamboju wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Linux next-20220421 riscv defconfig builds failed [1].
> 
> Regressions found on riscv:
> 
>     - riscv-clang-13-defconfig
>     - riscv-clang-12-defconfig
>     - riscv-gcc-10-defconfig
>     - riscv-clang-nightly-defconfig
>     - riscv-clang-11-defconfig
>     - riscv-gcc-8-defconfig
>     - riscv-clang-14-defconfig
>     - riscv-gcc-9-defconfig
>     - riscv-gcc-11-defconfig
> 
> arch/riscv/boot/dts/sifive/fu540-c000.dtsi:171.4-42: ERROR
> (duplicate_property_names): /soc/dma@3000000:compatible: Duplicate
> property name

Krzysztof already sent a fix for the duplicate:
https://lore.kernel.org/linux-riscv/20220421065401.9303-1-krzysztof.kozlowski@linaro.org/

> ERROR: Input tree has errors, aborting (use -f to force output)
> make[3]: *** [scripts/Makefile.lib:376:
> arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb] Error 2
> 
> drivers/pci/pci-driver.c:533:12: warning:
> 'pci_restore_standard_config' defined but not used [-Wunused-function]
>    533 | static int pci_restore_standard_config(struct pci_dev *pci_dev)
>        |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:226: __sub-make] Error 2
> 
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> The recent patch on this file.
> I will run my bisect script and get back to you.
> ---
> riscv: dts: Add dma-channels property and modify compatible
> 
> 
> Add dma-channels property, then we can determine how many channels there
> by device tree, in addition, we add the pdma versioning scheme for
> compatible.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Steps to reproduce:
> ------------------
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
> # Original tuxmake command with fragments listed below.
> 
> tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
> --kconfig defconfig
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 
> [1] https://builds.tuxbuild.com/2868anlKwTP8aavo19LT6KRIq1T/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
