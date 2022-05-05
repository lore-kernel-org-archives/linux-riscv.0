Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7B8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaY4Xx1sEu9kWvAf1qYkFvpLeWabOUHW97VKZgyULR8=; b=xTxUxdeunvcP5G
	HLI3JQcER0okNXULTEqpekC+ClKmKguM5lWRqtdYcB3YIW0F4dM9cVvj1qITLQ0bsmcnzuTatK8sD
	gZyujLpn5lkwKj2aznvGB4uWKKUJ4BN6xwSpdyMMAdw70WoPTLQHSW3nIWBvzSpelLBV0wTBZG8yj
	/9lZwjmmK6mzxAgDCVDI7j57gSgUyCLF9nig/uIoZg7vRng4mRWyJvoq4HnJJ1M548ES8gnWzexAw
	W9chgMnRkuXVDTkla/hQGDWe3J2w0FONlwi2KFUhPXH4+Hk6MQCoU5ZwhrqIpWfacDELbDV4hiQRN
	CFwRg5cyOPXkHSiS/CRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmb6J-00FvxR-GH; Thu, 05 May 2022 13:00:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmb6F-00FvvT-VR
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 13:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651755655; x=1683291655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VhfY5oMQPJu9z7kfJxnwnpTKu6x+DbDF5VMEHafmD0g=;
 b=pxKb0iVQjnKbdJakqAUsVbM0N5itbBU5jxcBOcKbyjWkSbGdfmRW/Rkj
 n9Qe0gO6VTljOtI96fkfOH4qNykDvrzORJqmmu1aurAtiwkZZtFyo3+l2
 YtHHX3nx3lf/BlfyOacklXy+bCejhzSV1npDaojYzbhyAjf6Zu1sHb4/9
 TJ7UiG3METE+6ElxvyvZV9R7lI5Tp4g3MX/dbgG5l+AtdiccMp0AcwN8P
 jD6x/ZHRmQdTPelz06DPnZMWlAl+5wUn9YBe7fatBH7IRdPQUmiAJ7rHH
 xul/RQgGoCI/xXgciNKQf38+8ZbM+xXU2pEoagbTePs/f2Q2MM90cbt7X w==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="172080611"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 May 2022 06:00:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 5 May 2022 06:00:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 5 May 2022 06:00:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUZjJHIKzUmalgblQBVaQleGpuTntDwBwOdpO4HaK33lhHj6AR84IVTCyvoWKU3IfJBDezMNZjePolmqcRlj2GAbEmftzNcdNEJwlQpmKbmzIKuCPDU5m/NiZ7ccHpmEGa0CymCOfSXK4U+lbNMnBjP93sdvWOFQQVzUH1pmtxsEi/ccm5//q4ivKlbFrWplythZlzYO3hKDAtL3QicGi/BZT7iCnif5n6Q6qrji1K3fDsdXm0RRE8UtczqYv9TcXIKDDmgjp/pWRYhCAEOnMMAfxiOlKyiU2bX/KeJhA61c/3b6UALQqrO4kpz4CsYh5IXH7qfimSQqISLH4nUbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhfY5oMQPJu9z7kfJxnwnpTKu6x+DbDF5VMEHafmD0g=;
 b=etL/ZnUA2vv6cIAxhopgTSME/KbLlO/h/9vonUdNv+5/BN6BMcsv7PoT8MrNQs6gLKQmKyHqzdG84AwZDWprlWdy6eUaqXvM6iARgPk8ZD8H4B6sibujaKy3YkOqMI1tD+d9iWvCGe7blsvvESbEHgyjKZnalXY4GRqNPgway/okzjRZRnXwiHtMwoV48/ppJzjy6dJejaq3geD0mGK3zvUVJZlbt9Oj7ZsL3Goy92lIeNj3iQFw8KXkm/Lr4arAq2dvN5Fh1T3gPL/gkRxaZtT1h0btkycsAwORTo38ZdqNZjjCcn+yYnass7/yMU8Dg3npQMOFDOZlMZ/zMDGrhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhfY5oMQPJu9z7kfJxnwnpTKu6x+DbDF5VMEHafmD0g=;
 b=RNIVCmrFma53vexvueT3iGFaY9LMUzPI+TbwB3jRSb26y76b7l7JlfxnzZPFnbm2N822Lz2JBceowe5YQdmOF1dF+gLlfKF+Ms/fjvosvYbiWzxe4L9uBKKZr5NON29/+uF3dQDSRWolyhB91vi/sKWrcU3etTyG/xZLfA/c4Ac=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BYAPR11MB3159.namprd11.prod.outlook.com (2603:10b6:a03:78::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 13:00:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 13:00:49 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <arnd@arndb.de>
CC: <guoren@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
 <jonas@southpole.se>, <stefan.kristiansson@saunalahti.fi>,
 <shorne@gmail.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <gregkh@linuxfoundation.org>,
 <sudipm.mukherjee@gmail.com>, <macro@orcam.me.uk>, <jszhang@kernel.org>,
 <linux-csky@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <openrisc@lists.librecores.org>, <linux-riscv@lists.infradead.org>,
 <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v4 6/7] RISC-V: Move to queued RW locks
Thread-Topic: [PATCH v4 6/7] RISC-V: Move to queued RW locks
Thread-Index: AQHYXKhi75gRseSB/EiwETrRXFB3JK0QRuCA
Date: Thu, 5 May 2022 13:00:49 +0000
Message-ID: <ed835f10-e8c2-2695-4dc8-2064c86eb931@microchip.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-7-palmer@rivosinc.com>
In-Reply-To: <20220430153626.30660-7-palmer@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da3eebe3-30c0-4d24-69fe-08da2e97474d
x-ms-traffictypediagnostic: BYAPR11MB3159:EE_
x-microsoft-antispam-prvs: <BYAPR11MB31597051C196D592BF433A0D98C29@BYAPR11MB3159.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 81tcb2XU+rMh1wHtatzKSl6NUz68yhbs/ZU8/kTclUaCvPRKDcj4nNFuL1JE1he13CFfXssYn29/5XfkllHFQ3x1Kwz+YikVTj502PCfxxpi1YhTct7lmmjmQkdLdNsgnrqgDFcDca2BLB5hU5T0emP5VP6XMEVzcO1+Lr6byyJVBOL4ByMwOOnp9pWGXf4I56nbupi1m1x9hBzqCM1KBZmgXr4Caow8o7VeWr1AIu/nGMmGXjTwbPmQMjXj9avniVUrYFW7EXZXNnWPV6QAmd3JaxrlwE7KjsihF4JCghWKRguUS6CVtC4JVkpUC0jZwZHBmuh6Znh4RORaVux+Dy3Ey3QUoEapAwvq0c/xcJzCPFBIDR1hBi8B7YoUfzZPtOUVm46nN5GxI9jhvKnhRnQT6L6RLDwYOPIp8Bd7qMYKjk+lWW5tLbWNOFvxyr4wQf5fTRzOp+uayz20RaNUiX0mCDVhU4xzCUpXHLdyfVBE4Rp/XAxpJ5kMQ2YrWAHWbd95o7zckxJHrQnAtzGz/27IrmV6rTTMiNOmvNQbvMtQMPOFuSyqKi/mi0TEhcrp6QhBQiimjDkWh2niQEh6FjVzZE1URhZWFdbvXw87CbBQB4kc8l7rTSOhR0B4k49IqCeZOUluOeACDMoj/Cemkwu3tio8ZD5lqWEqsKhHvITbTWjiqn/aMyxEYYHPpGPfX6QxQqBg6Q4utft39JRMUuKU99W8y3tbCaAckyi9jOn8Oc/HDIucyP24zcEHoLun9pu62QtZE+HKyCeCE7+ABQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(36756003)(5660300002)(31686004)(83380400001)(6486002)(76116006)(4326008)(8676002)(91956017)(186003)(66946007)(64756008)(66556008)(8936002)(66446008)(66476007)(54906003)(6512007)(71200400001)(7416002)(110136005)(26005)(6506007)(53546011)(508600001)(316002)(38100700002)(38070700005)(2906002)(122000001)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmZubzJJQTdCb1dqRUQwRHBYd2tSeGJCNUsrWVJSQUozOXllRnV2TEFJVGVy?=
 =?utf-8?B?bUYwdms1TkRZY0kzakhjNjIzdnhvU0FPaVZhRVA0ZlM5ZFYwdlJUS0FoY0RJ?=
 =?utf-8?B?R082OTk4MHZ5NCtBdW1mSEtjZnRrNWw0VEN4U0lpa0pKNkc2Rm1GbFVtZGZR?=
 =?utf-8?B?eDJRRWlaQmErbkIvWVpGaUFqMFk4NU5OQWJaYlhIbTNwWFppOTEvbEhmTlF2?=
 =?utf-8?B?UWdlMnBpTnZQTmRYUEdVTGY2U2ZPZmZrTzhSL1NvaVdZclR3NXNjU2NTUENX?=
 =?utf-8?B?Y3crNFlzMXp6NVFSL1dzNDlDNnpCMHdxYmNjQ3lwZ1N2bkdjWWgzOGp2b25R?=
 =?utf-8?B?SDVWRmRqaTUwb0VIKzlnNUdFWVpoUnFieC94UFlYa242T1lucnVzNnMvUW5z?=
 =?utf-8?B?TjVvMzRpN3NDRGpxRE5uM2dMRDNtYVhPQXRnVHFvQnZiemhhRFFMWnZDMTQ4?=
 =?utf-8?B?cEcyTmRBMHAvL3lPNkc2a3lxZmpBa3F2WEg5YnJDbzZQK0ZCbTFVZm02QXFL?=
 =?utf-8?B?bzU1eERjUXRKT0FRM2tySXl2RmwrM3hHTVRVYlJzclppOVc2d1NBOTBGQUdp?=
 =?utf-8?B?MlRacWlQNjZOSEtGa2RkS3IxR0Z3MVFOY0VuTFpreUlCOS9LU0M5aFpaMmRL?=
 =?utf-8?B?Nm5iK3Fhcyt1azBLeExFQ0plUlI2bDdJWWdUZzZKcmMwSi9vYlAyZXk4OE15?=
 =?utf-8?B?aThGRnF3cUQvSy9aTWIvQktTcXJNZjBmbU5mcCtTRGlSWEZCV09YNE5YQWxV?=
 =?utf-8?B?S09hYWV0UldJUjcxNVRKVE80TzlEUVFtd21NS1d6ZGlwb0J2cXJxbmppd3BI?=
 =?utf-8?B?L3BxY01VRXVDaGkrOWpsZnIyZ2laWkVCUHJtVCtHSnNCcjNXQ0RZRDRqTEhB?=
 =?utf-8?B?a3cwQnFyanI0UmJwUHhOZG5DNzZ4aVB6YVAxZW9SWDkzZ29zMFFtZlh2V1Mz?=
 =?utf-8?B?ejlWN1hPWXNkSmx2UDhpS2JiUHVJUjArZlRJQ2RlU2lSVEs5TW9LYm5aWWJx?=
 =?utf-8?B?WlAwUWFVV1lBMVBheTBxSjZjSnI5cmdCdWFJRkpzejBFM3RvRFM3U0FHTWxT?=
 =?utf-8?B?UVRpZzE2YitpSFFOT1JLZ3UzWGtZSkdZemxpNFdjbCtWU29MV2F2dWQxTGxN?=
 =?utf-8?B?clFvTlZ4SkZmZ2UydllncU01bVlFL09HdnByWllIYW13OXY1RExOZElid0Ir?=
 =?utf-8?B?djVENGJoMnZsUUlBMmtORVBBK0ZPaEpPZ0dwblAwMTA3elNaNmszVzEyRzFJ?=
 =?utf-8?B?aURyQzdOS0djeXVJMWtQYXYzYURBVjQ3elozWkIwNldDMHpuaFY0S250Qlhm?=
 =?utf-8?B?QWtlR3RwUFNydjJIdkJ1SHF6YVFVV0huTTA4T2pWWTFzaE16WFhBZFREMHEv?=
 =?utf-8?B?RDl3QU9OT0VsTFZWcEVLN0VISnd1bmxQbkUvQ2hBTjhpS01rTHI2M3RIcFo0?=
 =?utf-8?B?RW00dkdveGxQeFNtb0Z5Tk1kOE1iTEJuUVF1YW9rSzNWdEtoUDRQSGJ3UVFY?=
 =?utf-8?B?d09acTJrbXJocjZQVlB5NUI4VmQva3V4WkJoaFRjemdiZGgySkVhNTBPOUFq?=
 =?utf-8?B?MmkzaXprUTBlU0JuQ3JHV2duYWZKa1F4cGJOeHQxN0JkWjNWVzMvQnpMV2J1?=
 =?utf-8?B?ZStFRHR4NnBpVERjZnNmMWE1VmNUUFhCUDQzV2pNK3c2NURHdGtGWXdhRnFT?=
 =?utf-8?B?T0pmSEs5VVUzeUVJWDRxMUlxNlcvcTdNaGdWa1gxSmw3R05TTDEzU09NSENi?=
 =?utf-8?B?RGpNZ3B5TndOVXZDTElSZHFZaEh5RzVEWHV6YzAxdkk2aTNhZ25xL1YvOWhn?=
 =?utf-8?B?a3ZzdlNMVEd1NFZhT293WStlcEM4a3ByZS82MGdseTBWWk9vQ0JGcE9TNDF3?=
 =?utf-8?B?eWdnT3pIQW9WNnJrT1dPRzU2ajNGeWxEbTVhZ2FqUXJsaFNnVFJUZThrRlZG?=
 =?utf-8?B?RGkyWnd1clYzU21VVTlZVm1vYzJrQldKSlI5Wm1RNlVUVkhqQWJPbEt2dVN3?=
 =?utf-8?B?NkZiK1k2UzMrY25TZWpuZ1JhZkNKQUpZajBQZlZiWHJ3YmoxK3VCMXBibGx6?=
 =?utf-8?B?cXZJZ3JCWGJQQ0JpOS9qWUtwdFN0QXdibE5LM1lPY1o3YjQ0MG1HYTVCMnRS?=
 =?utf-8?B?N0RCd01ldnhJWGo5dDBEdndKTFhMd2hwb2dUVFExVXpmYjBZbUtvWjhvaW5J?=
 =?utf-8?B?RjJtVkdIcUVUWXZkU3ZvcnNZbkFlSG9PeXRsR0xFV3RxNkJ0M3ErZ1ZMaUNi?=
 =?utf-8?B?QStnejFwRjhOSEswQkRpbzdnSEhQR3haOCtEdE9QeXJNR2U5cHpFTWdnZ2tZ?=
 =?utf-8?B?dFFuKzJuMldTZUhIaTNxR0xyNTQ4V1d3bE5NTEhic21BRGhkdmt4SDFUWGF2?=
 =?utf-8?Q?u3Qr7v6P2BCs9SqQ=3D?=
Content-ID: <278FEC812B02B542928FD279D8B2A7A1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3eebe3-30c0-4d24-69fe-08da2e97474d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 13:00:49.7229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhoZek0vl5C1XABpcj0Y4UBekYYlMQKj+BQirDbLbtJokUyhLkOolT/BKYR9QxZqQ6/vdokTYCEacgsxEI1Fz5ryfh+Iq1yw7vFKMXZ/+dA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_060056_169930_A4579E04 
X-CRM114-Status: GOOD (  20.18  )
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


On 30/04/2022 16:36, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Now that we have fair spinlocks we can use the generic queued rwlocks,
> so we might as well do so.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Verbatim from the other patch:

I am loathe to add a TB tag since I have not done much by way of testing
any realistic use cases - but I have put it in our CI and have had a play
around with it locally & nothing obviously broke for me.

If you think that is sufficient:
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Otherwise feel free to ignore the tag.

Thanks,
Conor.
> ---
>   arch/riscv/Kconfig                      |  1 +
>   arch/riscv/include/asm/Kbuild           |  2 +
>   arch/riscv/include/asm/spinlock.h       | 99 -------------------------
>   arch/riscv/include/asm/spinlock_types.h | 24 ------
>   4 files changed, 3 insertions(+), 123 deletions(-)
>   delete mode 100644 arch/riscv/include/asm/spinlock.h
>   delete mode 100644 arch/riscv/include/asm/spinlock_types.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 00fd9c548f26..f8a55d94016d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -39,6 +39,7 @@ config RISCV
>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>   	select ARCH_SUPPORTS_HUGETLBFS if MMU
>   	select ARCH_USE_MEMTEST
> +	select ARCH_USE_QUEUED_RWLOCKS
>   	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>   	select ARCH_WANT_FRAME_POINTERS
>   	select ARCH_WANT_GENERAL_HUGETLB
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index c3f229ae8033..504f8b7e72d4 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -3,6 +3,8 @@ generic-y += early_ioremap.h
>   generic-y += flat.h
>   generic-y += kvm_para.h
>   generic-y += parport.h
> +generic-y += spinlock.h
> +generic-y += spinlock_types.h
>   generic-y += qrwlock.h
>   generic-y += qrwlock_types.h
>   generic-y += user.h
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> deleted file mode 100644
> index 88a4d5d0d98a..000000000000
> --- a/arch/riscv/include/asm/spinlock.h
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2015 Regents of the University of California
> - * Copyright (C) 2017 SiFive
> - */
> -
> -#ifndef _ASM_RISCV_SPINLOCK_H
> -#define _ASM_RISCV_SPINLOCK_H
> -
> -/* This is horible, but the whole file is going away in the next commit. */
> -#define __ASM_GENERIC_QRWLOCK_H
> -
> -#include <linux/kernel.h>
> -#include <asm/current.h>
> -#include <asm/fence.h>
> -#include <asm-generic/spinlock.h>
> -
> -static inline void arch_read_lock(arch_rwlock_t *lock)
> -{
> -	int tmp;
> -
> -	__asm__ __volatile__(
> -		"1:	lr.w	%1, %0\n"
> -		"	bltz	%1, 1b\n"
> -		"	addi	%1, %1, 1\n"
> -		"	sc.w	%1, %1, %0\n"
> -		"	bnez	%1, 1b\n"
> -		RISCV_ACQUIRE_BARRIER
> -		: "+A" (lock->lock), "=&r" (tmp)
> -		:: "memory");
> -}
> -
> -static inline void arch_write_lock(arch_rwlock_t *lock)
> -{
> -	int tmp;
> -
> -	__asm__ __volatile__(
> -		"1:	lr.w	%1, %0\n"
> -		"	bnez	%1, 1b\n"
> -		"	li	%1, -1\n"
> -		"	sc.w	%1, %1, %0\n"
> -		"	bnez	%1, 1b\n"
> -		RISCV_ACQUIRE_BARRIER
> -		: "+A" (lock->lock), "=&r" (tmp)
> -		:: "memory");
> -}
> -
> -static inline int arch_read_trylock(arch_rwlock_t *lock)
> -{
> -	int busy;
> -
> -	__asm__ __volatile__(
> -		"1:	lr.w	%1, %0\n"
> -		"	bltz	%1, 1f\n"
> -		"	addi	%1, %1, 1\n"
> -		"	sc.w	%1, %1, %0\n"
> -		"	bnez	%1, 1b\n"
> -		RISCV_ACQUIRE_BARRIER
> -		"1:\n"
> -		: "+A" (lock->lock), "=&r" (busy)
> -		:: "memory");
> -
> -	return !busy;
> -}
> -
> -static inline int arch_write_trylock(arch_rwlock_t *lock)
> -{
> -	int busy;
> -
> -	__asm__ __volatile__(
> -		"1:	lr.w	%1, %0\n"
> -		"	bnez	%1, 1f\n"
> -		"	li	%1, -1\n"
> -		"	sc.w	%1, %1, %0\n"
> -		"	bnez	%1, 1b\n"
> -		RISCV_ACQUIRE_BARRIER
> -		"1:\n"
> -		: "+A" (lock->lock), "=&r" (busy)
> -		:: "memory");
> -
> -	return !busy;
> -}
> -
> -static inline void arch_read_unlock(arch_rwlock_t *lock)
> -{
> -	__asm__ __volatile__(
> -		RISCV_RELEASE_BARRIER
> -		"	amoadd.w x0, %1, %0\n"
> -		: "+A" (lock->lock)
> -		: "r" (-1)
> -		: "memory");
> -}
> -
> -static inline void arch_write_unlock(arch_rwlock_t *lock)
> -{
> -	smp_store_release(&lock->lock, 0);
> -}
> -
> -#endif /* _ASM_RISCV_SPINLOCK_H */
> diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
> deleted file mode 100644
> index f2f9b5d7120d..000000000000
> --- a/arch/riscv/include/asm/spinlock_types.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2015 Regents of the University of California
> - */
> -
> -#ifndef _ASM_RISCV_SPINLOCK_TYPES_H
> -#define _ASM_RISCV_SPINLOCK_TYPES_H
> -
> -/* This is horible, but the whole file is going away in the next commit. */
> -#define __ASM_GENERIC_QRWLOCK_TYPES_H
> -
> -#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
> -# error "please don't include this file directly"
> -#endif
> -
> -#include <asm-generic/spinlock_types.h>
> -
> -typedef struct {
> -	volatile unsigned int lock;
> -} arch_rwlock_t;
> -
> -#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
> -
> -#endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
