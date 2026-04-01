Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D523ED3515F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Cc:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LujZAFaWxFwVc07afeVQH/ffFcAtyQqYtDO1HOJOAYg=; b=1EUQLioOi6VHhp324W1ILlof2t
	JQiNS23zrj4AQsxeeITWzR2/pKwGrTsPXQ8m+b3bSSp2+YMVf4xZVxuevB6o/+WtSa1rN4q5BSlth
	JnQ1P2RHWhtXn7sYjTnZMoFJur4cPXB+6xFgUOF5zKgeyZakfBpCx8UUKN48r5RnzkiKieLNBQfSZ
	MlWFB5jBN41ei8uNbOaKJOqpSEyqrzkQ2DDrz2btyyAykg8q8Xn4wBoH0A6D5mbyTqJslxS8TgJcY
	Rx/DkZIjWNXSMEHWgBlvNgkrYNMri8u+sE/jzuBl00g84EfNSHq1fUKkLGTt8Hr7VSPbg9BWFgWOZ
	9nzgMwUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7r7S-0000000EKet-0oIW;
	Wed, 01 Apr 2026 08:40:10 +0000
Received: from mail-japaneastazon11022099.outbound.protection.outlook.com ([52.101.126.99] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7r7O-0000000EKdu-3EnD;
	Wed, 01 Apr 2026 08:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsoolBYDEr4VgHR7fpuVb8scJ7vfxmL053EmRAkFxXpl3ri2c0ZkSQSQ78w+XvoAsL54SWSjtODfyUF3rl641UweVcnR/4x3dpWT/oJRYSPTb6D7GMgPkJ5TzDv+Ev7+YlfqMhEbXdPJY0D3Jo+8WL27kMxxNrFH/AZgndZn7ZSNv1GnayPKUbeAZnIk/kRD2/jg+lTVmEfKRmqV4MV+cvooabgtiZKoJbyIBDPUPqA2HmioX4qkk49/okCksXnyle9ZJqNoxYVWOJNEJ0HL+kp2O4t2t2EcNLPmjj1IGlSHGgtqIfModxoc4TRvhvhIGmRe+zYxyqRPKVebMNCelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAYgSed3tuckkwJEbX8YkrOdWN/rm5DGAnFwZpDAj7I=;
 b=nSxUxPxNecBGB9c6c1WIx+Q6Yeip52aMd4bpPf/piqvAcD6yu2eGaY5hCxwVHRT4K4YokqlT4RAvV+/0CMHYr3mHy8f+pVABAjJyECS9icJ3pcLr4WGMeO68S02eIggF6Ab9W18zfBaVnZcPLft+JMbEudpj8wzRyQnCokdkU0rqjveHq6jqsH7SyMTXRvFqTSwj9J2g+rGrMhOmZTwSX+UmLJhDx1Nx6yL813h8viBr8uJWmO+wwlVvjIZATN3RcsUO9bwZ7EqjOUmBMYy960geHZBrxdVPMtVO9FJ51gqNljU52AfPfSmjNdZF1nZJ+4iLkl1AGHKzjZ8Ik865TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 08:39:48 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01%6]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 08:39:48 +0000
Message-ID: <1027afd7-dec6-4ff3-85eb-2d9a1646ada6@linumiz.com>
Date: Wed, 1 Apr 2026 10:39:42 +0200
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paulk@sys-base.io
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <a5f6aeb1-b038-462e-8989-c4da65966134@linumiz.com>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <a5f6aeb1-b038-462e-8989-c4da65966134@linumiz.com>
X-ClientProxiedBy: BM1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::17) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|SI2PR06MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: af6a17a9-e457-4b76-3096-08de8fca3beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ys9d78rSYkMkhr5KZr3X9FORLPqmp9FbJ/FqaZoMzn1wd2DN+UX+I8W13taY2mWm1uzyGyvLPntRNFKoIhu81fe8y9aoQa9nnChC3Y2rbTRSl+1p6lwDfb7aHxQhzRtqvYChaxshBkkHr73oCmHlsX53eXuPfx1ewH4s7A4/JF3Y/QYCNNeNt5YRl/2bGBYn/1rxNG/fbIzJZAgSOZJVZ4JPxySFTK2YCN/PqDmfP9YylC78w/GIFRYxB3G/uzxV26mHkI/RbIzrIsgikwhvMJVYgDaxY1gVtNgBSpZOAZe16v7SxQbPL5EquRFi0wNn4lAOKPDnbf5hyK2duECtRaWdYWYsMtCfXSrDvzSmP0wfgoO/qnndmkAxJsCTvNNnVrl7sO/4Ge3Eix2GdtPwd1HP9ohvjnSUeBQNVKaEvOm1sKAJODAthUYgLaaG2gychOd/DwgjllX0AroPT+s7sg4Am3m/FaNlAsO4LQTXloIfN9jncA4RobeROohlj1tNsO/Y/Xxf2OiffWPhVUigN0MXeC1ctRaEdDabS9b3YQl+JRbsjMMlhZu/ZWyaaDCRs04wkkQLC1UDQzJQHeUQzpyBV1bTRcrj29Vulo6DEjWA1Er0RFvsdY1HeVRqadunkQ4iPFaBEuwiiuS7cXwFA1fbXUcvL5iFAFywhgPIJHZZvb7gPao895+HdberY+AdhZlBZYTeeThUgABwoswHlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVo5OFQ1V0VGWHhJWHFnWklEU3ZvdTVrUW56cG1xSk50RHR5QmYxKy91Q1ov?=
 =?utf-8?B?T3Z4YnplbTgrY1RYdDFzbzF5L1N2dEl4S3M0cExrZXlyWElqalBVUjNVTkNU?=
 =?utf-8?B?RHVodVFRenNOVjRJVzNFMmNpZ25RK3pJdUJIRWRERkxha0VmRHZaKzk1S0Qy?=
 =?utf-8?B?K3NnUWQ0UmRPdHdzeHBUZUZ1Zlp0SXhDT1hrZ1ovNExNNnB2Y0Evd2pDWkdB?=
 =?utf-8?B?d3RSbEE4bFZnY2JkZWhESmEvWnI0Y1lKMGllM1Z1U3EydXJkZ0pCTDQzbzJl?=
 =?utf-8?B?SGRGVzdTTnN5YXlUdXMrMWtlRWlRajBuZWtXZVd1dW51bXJYejlQaC90Mys1?=
 =?utf-8?B?YStCZDhNRXhyeC82a3hXYlhDUWt5bWhWNFV0NnVtWnNvU2lEWENta1hZUkpH?=
 =?utf-8?B?NkxSWStLZVM3SGxHdy9PVEJzbDRxYUl3djIzSE1qME5yV3MwL0lJaVBSdGRx?=
 =?utf-8?B?Z05QVjJELy9IRUE0MW0xcHBsSzl6UHRlV05DYVlnamdOUmQvZW5sZ2dLVFZH?=
 =?utf-8?B?OGtEV1FneFFkdURsL1FxU3NoY0s2SVZ4MjE0S0RwNEh0dWNrMERsek1hbGVt?=
 =?utf-8?B?d1ZXTGlXZDhlODNxdCtkZEZZOGg3ZUllRHdGQVRaaG13Qk81T3g2RmprZFBh?=
 =?utf-8?B?bDZ1TGswNzRhM3hvdktQZFFoNUdJcWxZVTQrL0p6MC9HU1U3U3ZtSGpITEds?=
 =?utf-8?B?cHVPb1pTV3J0QXBYZHREZ3NOOGVKejFTSHB6dGh6djYzRUt6dTFrQ01Vd0FH?=
 =?utf-8?B?NDRNYmFQRmsyeUMvWDBrNTllV21xSmJRTkl5ZW5aYVFRb0dScFh0OXZranMr?=
 =?utf-8?B?RUt4UCtQak1uN2Z1S3R0cFpVVUdSaDZKTHZRNzV1NFMvblAyemw2eWwrM2pH?=
 =?utf-8?B?TFVRRU5ncFZZdnZGa3lTMUhvZFVnYWh5UWZ6RER5Y0QrZWJFVy9vZmpBNjVp?=
 =?utf-8?B?WUdNTllqWlJtUXVuYjZYSW96T2tiRWdXcWwxNkt4MWVwMzVxYlVmWHpsaERi?=
 =?utf-8?B?UnpGQ1AwMmdQVnJTTEdJL01PVG9CL3N1VTZpaUJrclVLRkVtbStrVFljaSt2?=
 =?utf-8?B?Wm5HUmVCMlVCbnB1SEJyaXRpdkdqQmNOc1ExZVJ5YmNBVnJrWEl0dlhnOGNC?=
 =?utf-8?B?N2c5Z0F3ZDlIdHdJb3lHRk9lYlJPb09hY3MxTk5qYThCd29idG5KRndaZXJC?=
 =?utf-8?B?eEFQbkJDb29sVE5MYWRaQjV6RTlwUzFQb1ZQZTJ3NG1ydDJrN0ZQdm9MUWRx?=
 =?utf-8?B?b0NqR2lJOE1EVFNRZmp5UEI0N2pzaWRjM3E2T1V2bGxFUWhrUGdlRXFsMDMz?=
 =?utf-8?B?SUhjODhyNm5GNEVLcVBnTSthekprc3lKN1U3NXExeXFsY0QwRkZJYng2ajEr?=
 =?utf-8?B?UC9sdG1MSkllbHUxREdsWDNvcE5pMjVTWWdpellOd0hNN0RTRE9RekE3OGtw?=
 =?utf-8?B?ajJaWkJtdHdub0ZGbW5kL1NPWXpjZ01UZEJuS1pGYWgzejgzNHJlTFRpbjJC?=
 =?utf-8?B?ekxtc1FJc0hEODYyYVVaNzJsRlBGWmh0U0dZOFY0Vi9UdTk0alE1NnVWWkZ4?=
 =?utf-8?B?SGs4cUZrVm9DVUVqUG5qVWtKN05QczhmMGxVQnZlWko1czZSYytmNTl0MWp4?=
 =?utf-8?B?ZzA5TWxYaHBEQ1BZcStUTzVWcEtidnYrYS9acjQ4YUIxQ2dnUlNvaVFyaFhG?=
 =?utf-8?B?R0xmQmk0ekErMjRSNFlSYnpnYkZ2MjhpRDVnMHU3OWNiVmpMQnJWTDcxUmto?=
 =?utf-8?B?aE5vbG1tZUszQkpHYVAxQng4aUdTUnFTeks3RXEzeWN4SDVpUFhSMDFSS29D?=
 =?utf-8?B?UThmUTE4Vk12UFF1VFVxNm9qUklkK1EvK2Z1cDUzblQ5cU12N1pmSTlENFl1?=
 =?utf-8?B?MjZxQjNweEZOeEszM1pRWWdaTkxYOEszaVpvVDFtR3RWcHh5ODAwZXJVZHpo?=
 =?utf-8?B?WmhERnhOMVlmSlAxakhIU0JzYkNocFhOai9iUUIrMzJjUUV3WUNtYUZtbWNU?=
 =?utf-8?B?Nk5sTllIb2M5R01xalJBWnB3NkpCZElqOVlYb0M1QWc3QU9TUldoOGRka3lB?=
 =?utf-8?B?clh4S3V2dXR6MDVSdG9KV2NhOHhKZ0NmOXNIY3ljT0wxT0xzVnlHck5uck1i?=
 =?utf-8?B?bkVkSXlFQmE0NWZYWkU1OWhzczdMcFZzOHBmMDNZRlNlemw2ajM3OFo0VGtG?=
 =?utf-8?B?S2tvWHo1ZVU3YWhxMndqWWIyanFSY0JJdW1yYnFnaVlocnRYd1REL1VWNE9H?=
 =?utf-8?B?WHBRUXpJU3BoTjgzVXlmeFVRWXdENHBWME9mZC9nSWlCZzVmL3djSU9SeU1X?=
 =?utf-8?B?bk5IYzV6WTh4TytSNzFnbVl1bXV6ZHVibCs5MnoreWFaMlhyckpmbGlsZXgw?=
 =?utf-8?Q?kFnE/PBJnhHyecCM=3D?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6a17a9-e457-4b76-3096-08de8fca3beb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 08:39:48.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1QjUKnUeUHjsl822KJKj4j2ol12qPIUCWuaBc56h2xFhh8EBc/23E2bHjy9s7b9HTYJdbaAZbgInYE8w7C3iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_014006_819392_996AEBA8 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RGVhciBLdWJhLAoKT24gMi83LzI2IDI6MzQgUE0sIFBhcnRoaWJhbiB3cm90ZToKPiBPbiAxMS8x
Ni8yNSAyOjQ2IFBNLCBLdWJhIFN6Y3pvZHJ6ecWEc2tpIHdyb3RlOgo+PiBTb21lIEFsbHdpbm5l
ciBjaGlwcyAobm90YWJseSB0aGUgRDFzL1QxMTMgYW5kIHRoZSBBMTAwKSBoYXZlIGEgImNvbWJv
Cj4+IE1JUEkgRFNJIEQtUEhZIiB3aGljaCBpcyByZXF1aXJlZCB3aGVuIHVzaW5nIHNpbmdsZS1s
aW5rIExWRFMwLiBUaGUgc2FtZQo+PiBQRDAuLlBEOSBwaW5zIGFyZSB1c2VkIGZvciBlaXRoZXIg
RFNJIG9yIExWRFMuCj4+Cj4+IE90aGVyIHRoYW4gaGF2aW5nIHRvIHVzZSB0aGUgY29tYm8gRC1Q
SFksIExWRFMgb3V0cHV0IGlzIGNvbmZpZ3VyZWQgaW4KPj4gdGhlIHNhbWUgd2F5IGFzIG9uIG9s
ZGVyIGNoaXBzLgo+Pgo+PiBUaGlzIHNlcmllcyBlbmFibGVzIHRoZSBzdW42aSBNSVBJIEQtUEhZ
IHRvIGFsc28gd29yayBpbiBMVkRTIG1vZGUuIEl0Cj4+IGlzIHRoZW4gY29uZmlndXJlZCBieSB0
aGUgTENEIFRDT04sIHdoaWNoIGFsbG93cyBjb25uZWN0aW5nIGEKPj4gc2luZ2xlLWxpbmsgTFZE
UyBkaXNwbGF5IHBhbmVsLgoKTm93IEkgYWxzbyBoYXZlIHRoZSBNSVBJIGFuZCBMVkRTIHdvcmtp
bmcgdG9nZXRoZXIgb24gQTEzMy4gQ2FuIEkgcGljayB5b3VyCmNoYW5nZXMgYW5kIHBvc3QgYSBj
b21iaW5lZCBzZXJpZXMgZm9yIHRoZSBkaXNwbGF5IHN1cHBvcnQgZm9yIEExMzM/IFRoaXMgd2ls
bAphbHNvIGFkZHJlc3MgRDFzL1QxMTQgYXMgd2VsbC4gCgotLQpUaGFua3MsClBhcnRoaWJhbgpo
dHRwczovL2xpbnVtaXouY29tCmh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L2xpbnVt
aXoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
