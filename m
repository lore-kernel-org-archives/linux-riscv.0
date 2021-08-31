Return-Path: <SRS0=bBbU=NW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6A8C432BE
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Aug 2021 11:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCD660F6C
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Aug 2021 11:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BCD660F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghmn4jNSvhRYLQdUN0ld2ybrxSYQ4pfyIWVTmh/hRko=; b=oA1i+PWEH9vkbJ
	dtxpzGzTpI8VB/GHGe1R/4NUWcQIE+v5XcJSYExVas4z5egBGzr1B751XxkFRZ13X0/23SseEzltr
	2579GdNEOkGv5nD8NspN8LGmUNw5H6GJnXZ3r5niQ3weYc1F4KwFz7pQtMSWF+8H3IVIa/ecUrgrV
	AWc3rJzkQbiM6gTkfLgWnZGpXTCGrhzDkIj34HoaG1jqvBoN7mZtha4WePjyxr8kUxpwAI717K+/M
	aPqYTn+/3GRtSTeOjWHVx1xrv6kdKGUaYzBWa7FStrrA9ixi4qJ3Kka3kJd6JddcpkLFfsNaZepJx
	aWbOVYyrNPT9TZU6t5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL1uQ-0028dc-PN; Tue, 31 Aug 2021 11:26:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL1uG-0028cL-R9
 for linux-riscv@lists.infradead.org; Tue, 31 Aug 2021 11:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1630409180; x=1661945180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xyfLpAvn4rKjZ1i0weiOHdtjrfatBqhRj7Pm8ihM6dY=;
 b=lrbz+TqFBbejFJhKOe9nJuN6K/1MpM3RYIEeGr35Hwa5jffvFtFR9B89
 ZNyvZc5nW+iOp1gQOP1rhQtmt+9x9fSC90/FBZs0HUgJv9skak9tsPMPe
 OqqLXzfXqb/LtQzFiVDNhyaM/vQSycvUffdLb+5fwZVbug+DIY6LsrYm9
 IcvsXDBKY0V1GmdwozYm9CVJ1Oy1WwMfcwXwCwq9SAydaWQ0lUhvGCgEp
 gA7mk6wo60BJdmPjt7CVg972BfIooqijwXURdX6djUv/iY4MNv/tGrPEU
 a9xNC89Ef0qxQtnWAnnQe0qgYEAy3ryOpjo/Ho+Kznmbx7XfIS8vmwMWI w==;
IronPort-SDR: 7gPURcgZX0Ten0iS0WADz0JqS3Z7jSbTcxuLlrBr1N+9nvmm/WHnFUxYr4NiabeQ/qyMr4fVCu
 r+uk++QHO9ZYOeHjodBHtcXSWMbrIiaK6e9QPtpQ0deBg3Ntbruw+GnGR8vunuTR9AlFJ8GSc7
 UrEE+7GYEKe8Xk575i9KL76/nRi3RLi7H1psbWTSUHh5Ytm2RGZrYDaF7eUX3chpQ2fPbnqZf8
 PGbr5guFiBGDc6kH9b9SflsAh+5FQHtPGsB7jtBYJ2ROtx5BdwFUyEQdbrmXa8PGWptrsd1QOD
 A+Q/lPSewTs6XOu5Vv2gWV+q
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="134800191"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Aug 2021 04:26:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 31 Aug 2021 04:26:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 31 Aug 2021 04:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy5TPzDuou1T3p+JATEJkWNRfLOBVRRQFtea3WcUHJCTM4uGb18h+//8ShT5ZhBdbzjYlSONTc52FqmrPbJ2bef3KZUCUaG2GQtDITjBwKJGwGbZEMzCMcCoY6tWT9Djb40oOpG8qaR2g2QSyWnV8xFgFP9/Lc236ShGENapFVtc/9I9RlWUhPl4MznizB4RKuhp7P0aem8KuF/wLPXLNQ+8ybuenMYRp/MFZ0R+RHhBEGAG5sDnC7KEd1dL5zBqoRD5c/WkAUPYSPe8Ipz0ADBXYyd9pkuTDY4aXWfykOjzRe2DGUMfqhYPtpmqucu60ZTKrPYgH4/mBYuGOgVVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyfLpAvn4rKjZ1i0weiOHdtjrfatBqhRj7Pm8ihM6dY=;
 b=Zj8QlNcCM2HEgeQM8nxomAtTFVTeNmC9FE2AI1iHhwNlAwCj3D9Fz8ARIxTYeUpgJuRkPERKaL96GcTSX8gsoFsNVTeXVa+fJj6OCLgNTAHoFO7aRtii7ptfvp8ZzPQnGMvmIVtB+/VhvYkALKh3PmokgQ9vxmWpDLfRbBLeOXC/niiO4QQ59thtUAuXMZ8d5qAUxeURX1MNAKAPhQJ+gNg+NnSfuiYjgYccllrkgO8IeIfjG+LXs520TShXSiuNJJ576JmHWo/djiQBeNN8opjSe9rVaWXevRT4Xpr5D39z/3hyRmZivufmZmzKVKyhioizM7bDFnGkFE/ehyzgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyfLpAvn4rKjZ1i0weiOHdtjrfatBqhRj7Pm8ihM6dY=;
 b=UGsWGWIS/nrKhNd8kfXjCcvqPMZ7++5qZAlD2jHAdMwG/V30KzkB/U+mfwt1WzUe2ur8YMUldg/gu/asTY1bI8sccHcmyt9fpKVkZOujbINVPD9tTbiEwns8015U9dCXT/+yRm1g8tpFFd+7eMW1iwuEOyVp3an0qWY9UJqCp20=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2128.namprd11.prod.outlook.com (2603:10b6:301:55::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 11:26:14 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::d96a:4568:b553:97a4]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::d96a:4568:b553:97a4%9]) with mapi id 15.20.4478.017; Tue, 31 Aug 2021
 11:26:14 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <aou@eecs.berkeley.edu>, <atish.patra@wdc.com>
CC: <bin.meng@windriver.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2] riscv: dts: microchip: mpfs-icicle: Fix serial console
Thread-Topic: [PATCH v2] riscv: dts: microchip: mpfs-icicle: Fix serial console
Thread-Index: AQHXmn0dSEF9gIZ8yUq0D/Rfd1OWp6uNgQiA
Date: Tue, 31 Aug 2021 11:26:13 +0000
Message-ID: <986c2460-dc5c-44f8-67b1-526cd9dfc4e1@microchip.com>
References: <01b0aaeb50a960e36077669449a854e5d4c18a83.1629983839.git.geert@linux-m68k.org>
In-Reply-To: <01b0aaeb50a960e36077669449a854e5d4c18a83.1629983839.git.geert@linux-m68k.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00e9b8ba-8780-4078-620e-08d96c722445
x-ms-traffictypediagnostic: MWHPR1101MB2128:
x-microsoft-antispam-prvs: <MWHPR1101MB2128C48D46FACD8B67F9ECEA98CC9@MWHPR1101MB2128.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K/iVeV1ozX63aDOLVj8WztLYuyyw817tyKpb1U7n1DqrL0/4powReF4t04jEUi/sL+FPmvtGrv7arZSxvl38tUHEatZ674Kc9CTxWkCEfzOrUif9WPBbMlAFAIk7A3eHrn5I5zJ1z1p9Xvku2RXCUuO0TTLq+SmAKLqUgOHE/P1hL1IrqP3RW3nyNFQ7/Bo5/UaNJM9oOM+4VxGnsxmrzLHyxkYN+BohMo71kO035om2TY5pSEZM4F46lMXkwIJFfn6/KdAoY6dUhOFW3W04BKIMa6yFOGowVhiXMuXpLuScHMJvp5ZKgtYQFbfduxDVGVbvah2n6QpXLdp6m/gtaxuZegHS0ssKAiK3WqZsnWF4GV8aZEJ9JekCiaaMKabdPQUP5x/JHB3/VMpeFVbx8kieRYUB9l51cR83wZdFikBeMPKBfNrPrvTdGjxHZYnvFe6ztzBCl3VOsjp6Ng1Q2BhXz09VXKnCvaVsBXcmu0uHCq54Xzi3BNbZfKjgJutbLCEQ38+R0OkO75+vyF/3dns5Wf3XMx54ec0LdaKYQM72DT8ZmpYCgd8/OA8ku5PtZ7dcNk45uMgGhAlcVWZ06aNJs61YrV0m69Of4O4/OdXMTzB+ufe0zWWWROxwpwoT1JUP07NiHeRcsxaMPoGLOrSr0/nTPI3qATbWZliKbCiFuhHCHKs8T8P/3/EMmQ2dRwBGtQLQ/5d7DJfFU3YObwy4/NaIucaq/FVETRgzbPh4JoFuokQo7KyWFWE3cqfoGuyUs//6Vdb5b53DaKadJl8FXMsBWdwEZI7MdNsWwKh9+++5kXjvHXst02Px9Mx6Bq+wMYiRMa83YpAap7pSCkK6Fzl6O2u8gguc8TbjgKs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(376002)(136003)(366004)(2616005)(2906002)(122000001)(110136005)(8936002)(38100700002)(6486002)(478600001)(31696002)(8676002)(54906003)(26005)(4326008)(71200400001)(186003)(316002)(66446008)(6512007)(64756008)(91956017)(66476007)(86362001)(5660300002)(76116006)(66556008)(31686004)(53546011)(6506007)(36756003)(83380400001)(66946007)(966005)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHIwZ3l5akx1emthdHZVbVFmMW1oNTFLTTZnUzV0eDJGeDczMVhqYWpFbG40?=
 =?utf-8?B?UEE3cTQ2MVg2NXRQb3R4MzM0dVM3VDVocnNyTHBibVJqVmxrVUJHUkVGSkMr?=
 =?utf-8?B?QzVQS2sreXEyakNFMklwYjNPR0xtaDVKVjJFUEhIWjk3ZDRSWE40MklSb1kv?=
 =?utf-8?B?VTRnQ3ZYRzZTMm0zd25oVEFOeUpZTjhVb0RMSzA3TDhSc282OXRGbUlxNk9W?=
 =?utf-8?B?cWtBME9OcERmMWV1UkdRd21CVE9zVEQvNE5HT2dkeXJMQm93dmVUYWV2d0JY?=
 =?utf-8?B?SG5XcjduNTFDVThxMWkyNVQwT2FKTmIreVFNL1lwdnRKWTF4c2VJN3JRcTZO?=
 =?utf-8?B?VzVXL0wxOVU2eHVPbCtjMzJ5RndFOGtFQkxjVVkwSmZmZ2h1MHF3NmJWWVVF?=
 =?utf-8?B?SGxuZFdxRTcvN3FSRXBGb3BFYmdTNTFsa3JqTTY1QmxsZ1UxM2NjZnNZbkdz?=
 =?utf-8?B?bHh5eG9xelF2MnhNKzRNYXgvV1NKd0lkTWpQWGVyekprSlIrWHZuVVlGTHll?=
 =?utf-8?B?dGVybXdKOGNaM2ZRYmxLNXVnU3ZjTmpxNkhzOXUxZ0N4bkdnQjdVdGs3MUhL?=
 =?utf-8?B?a1VOcWlqNGxmUXJBRWU4WmRTZ2MraXR6dUhQcDVDdzJNamRUZm5iTVlySi9C?=
 =?utf-8?B?ZlRqRkFsY05lLzl6aVBEU2gxWkErUVhCSUVCM01UbzV1bkR1NGxkNjNWeElX?=
 =?utf-8?B?L2JScVJ1YVlZenVsb2NaOHlMeHNGS3Y2ZEgyZXRrc3Rwc3l4L0dJOGIrVmdJ?=
 =?utf-8?B?V1dzVW5WRXRHeW1FbWpJekNiMWRrNnlCZ3ZjRkQ3SHhrenZ4V0FMSnBLOStB?=
 =?utf-8?B?RUNwaldoMElCaFVSbmxlZjNQaGtMVjN1NU8rMWxQb2dLem1pN2hSRlowRW96?=
 =?utf-8?B?Y3NWd0cxOUV2U0RtTGVkdmNDMFNCQWN0UENZbHZDRWhhK3hwUkc4ejNwZWNx?=
 =?utf-8?B?cFY2UTN1UEUySGV1TUVYZHJ0a0pXcENaYklMc09BMWRZQXA5Rkp0d3F5T2RZ?=
 =?utf-8?B?MnZjZS9LamQ3NmRBc0xBR1NUbFczTm9ycFQrdlFNWHVRd3dEOXpzRnRJbktk?=
 =?utf-8?B?NmNFMFhTbDdGNHVhVlowcXlVdldqUTU2YWx2akxvZnduUEppcXpUVXA3Vyto?=
 =?utf-8?B?cklLNy9zZzhjWVNRK20rWVZtdnluNVFBMU5EdTU0WjVzL2xNTlVqZ3FwbjB4?=
 =?utf-8?B?U0RqV05nUkkwYmxwWUh3SDBjZHJDRXo3dGRTRlJIUlVNcUM0bXdRanlEZytF?=
 =?utf-8?B?cWJXSVhaVzRUOVpVWlJpdldrUmFuUGE1SGhROUV2dHVaMEZ2dU9NM2pWNjY1?=
 =?utf-8?B?SFlSSnlRRFVndHJ6bFc2YU84NVZpYTBmdmpWNHFLS1A4MUlVbXBLeGJVV2xT?=
 =?utf-8?B?QnBQVlZ1eXpDKy9kUm96d0c1bnFNZ3g4ZVNVMldHSFFxZE9rSmZyWXlUNTBF?=
 =?utf-8?B?a0xzR0tCZXFrWGVGTk1NL0REQVhLVUtRcTVhblNSTEZpbk9tZjdwcW9oOFFa?=
 =?utf-8?B?YkJTTDRodkJBVVhuYmQvZWR0c3JCbnB6UUxFWkN5cTNtNS9HZjNPeU1mWmQ2?=
 =?utf-8?B?K1YrWm00ZXRwd2swVXF1d1dJbFNQSDVaQTg5R094cWxtOXhLV0RJY0JZQ2Zy?=
 =?utf-8?B?eEVuYzdpa2FMZm1jQlhaNlFlYUU4M0FOZkh5czhHTXZDN1dQL1NsRWxMOHBj?=
 =?utf-8?B?T2FCNVA2ajFseUszVExJZ1pCSUFYeVpDZUs0TzBKcCtjUis4YlVjWDdwbWNh?=
 =?utf-8?Q?2uU5yBuc7PYIGKJSDp9H103eeUGIxcW6XsZ2aaT?=
x-ms-exchange-transport-forked: True
Content-ID: <BF7697B6C5C76E4F9A04C548C9B337CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e9b8ba-8780-4078-620e-08d96c722445
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 11:26:13.8949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPpu/AJJdnJiDbXiV78qkMdQ5Wm8pbiM48PpzaDKoHlg1lTUvlCobpzmJuUi9woHwpdPCEopmdRGiN01lXidsDdT/AlhUpE4QGr4ZgC4v6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_042621_028473_847E64B5 
X-CRM114-Status: GOOD (  22.69  )
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

On 26/08/2021 14:19, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> Currently, nothing is output on the serial console, unless
> "console=ttyS0,115200n8" or "earlycon" are appended to the kernel
> command line.  Enable automatic console selection using
> chosen/stdout-path by adding a proper alias, and configure the expected
> serial rate.
>
> While at it, add aliases for the other three serial ports, which are
> provided on the same micro-USB connector as the first one.
>
> Fixes: 0fa6107eca4186ad ("RISC-V: Initial DTS for Microchip ICICLE board")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> v2:
>    - Add Reviewed-by,
>    - Rebase on top of 417166ddec020c4e ("riscv: dts: microchip: Add
>      ethernet0 to the aliases node"), as requested by Bin.
> ---
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index baea7d204639a185..b254c60589a1cc8b 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -16,10 +16,14 @@ / {
>
>          aliases {
>                  ethernet0 = &emac1;
> +               serial0 = &serial0;
> +               serial1 = &serial1;
> +               serial2 = &serial2;
> +               serial3 = &serial3;
>          };
>
>          chosen {
> -               stdout-path = &serial0;
> +               stdout-path = "serial0:115200n8";
>          };
>
>          cpus {
> --
> 2.25.1

Looks good, we've switched to using this ourselves.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
