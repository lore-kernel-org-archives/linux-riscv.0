Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E65FC5B56A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHn45YwIh5qJLw4dLVEDkk2R7Syx90u1/lhK9Gyw6BE=; b=Mj9o45rLUUdwlK
	vBc3j42bwo5KFuKIiRKbYlpp1HDqnrcIcJm+Jgt0MLaHInWufaKXpM+j8k/3HHrb/sD76CkK5Kphk
	0KMT/7913hucfVTEkgUl97nI33V4gnahpc9DprtOiOsaYyCGcIr3jJWJU5Ttycpe/YuWTJlgmfVdV
	v075uBZ1gMt+cx988KYmExuQ6zqoVp8fukWzQei4VrB71na1Q8Iljv1zqtn37vTYcOM25wgBhqivR
	b3srwkiq1D2fSitlBGUnFzPTQF/T5Rj7dgCB1bLJlRIZyk7ofiATE0CTytOA7uEAY6PzugQclVtfM
	/kkigVWX9F5qXR829Cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpfv-0000000EYOw-3eW5;
	Tue, 11 Aug 2026 16:50:03 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpft-0000000EYNt-1V2e
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 16:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgyQ767pUcnNVgr7+SCyf12TUvx9efvoU7Q45/p0MuiNriK3w2l4hn9kj/CcRfOYzUFLQDbrm3C0/jZ19GXk1RmAkltEaOJhIS8Bac3RQ0wgYqJBKVxyh5sNty+rJzHT1arlZhoQaTeyIc6+LVZNwsX+MXjUwCc/og9xVBPNLJAd6qMCmjkuWEMxuqofTVfCLXCdqDaLkzBc8GWXqCeVsaX5rgtdNETHjvVonkqOxmbxBs00EkzTStlkwOJN23qYjqP9RglK6J1L75vv/HteXImvBtZtEm9SKtPI8yw71NFd9tg26HeJsRPTWy3vLyzEadZMNoHMfDuKG4VAWc240w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFkJYcvQ/wCULA5rkuBrnHOGIEOLTaOxoEZ96MwasFE=;
 b=a83/WNRteObYuihK3aMk61MiYnptUEL9UeDuQDHwM004TTYeNTtFU3J+mpcS2huxIYx9TMPGVHkrVZ7H+zBNhW+64yuoFdsDTCXUleccqkmDqBx1yMihTzRXqOaZaQuigJcLtvtQ81HzpkmNl8Ro5seIn4FpBvUdXcH3/oIBV+TerNJN3tY4di2haE6F+0DYgK9Uo2Nc06Kqi5wvEisPLkEofnvz8id/KTJGc+R4z62IJmuFach7ugVrGPK+fbiDRVwHtrUp05wpLzzeKliN7WV95zyBMw+ZIxs1EtdyihJ7v0NP2LXqF52I5lx67EBTibhOQQua1ah69LJxrikX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFkJYcvQ/wCULA5rkuBrnHOGIEOLTaOxoEZ96MwasFE=;
 b=L5bnu795Z1tqd4GASJkLnSrPDemTbrZ0bZatapcBsH7++b9BWv6wsZTef1YEBBmAYjYt/PDymrFygyuM34CStTGtUz8jrlaXkkyyB8Y1FgCwIsxOnVSgP5XIMFCUI9qC7bYJ5zV/G6DV0pheMePBs/M4PVxy3tPjla/+uqQSvVbN60s3joDooxXnQfKXwFkF+UAVQ4QHs0/PdPf7jNqwfmwPqN2G5y1UoG3wciN/AZcIiXi6bWGNJz83x5Ui8UhD7OJNeD5tyxPlTSRxSTEmZW8guEd+kXZSwjUIsdFT2FnrwpTcZZPCM3hE6FDGweuC3eeWT2zP/Z01h8nPXJP11w==
Received: from SA3PR04MB9001.namprd04.prod.outlook.com (2603:10b6:806:398::17)
 by PH0PR04MB7899.namprd04.prod.outlook.com (2603:10b6:510:ee::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 16:49:54 +0000
Received: from SA3PR04MB9001.namprd04.prod.outlook.com
 ([fe80::3da3:45d7:8860:e196]) by SA3PR04MB9001.namprd04.prod.outlook.com
 ([fe80::3da3:45d7:8860:e196%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 16:49:53 +0000
From: "Ousherovitch, Alex" <aousherovitch@rambus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Krishnamoorthy, Saravanakrishnan"
	<skrishnamoorthy@rambus.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Herbert Xu
	<herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Shuah Khan
	<shuah@kernel.org>
CC: Alexandre Ghiti <alex@ghiti.fr>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "Wittenauer, Joel"
	<Joel.Wittenauer@cryptography.com>, "linux-api@vger.kernel.org"
	<linux-api@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Shuah Khan <skhan@linuxfoundation.org>,
	"Nguyen, Thi" <thin@rambus.com>
Subject: RE: [PATCH v3 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Thread-Topic: [PATCH v3 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Thread-Index: AQHdJd2KxV2i0y3L3ES0fC17MQpCTraW9VgAgAGWx4CAAH8HkA==
Date: Tue, 11 Aug 2026 16:49:53 +0000
Message-ID: <SA3PR04MB90016379260AE6C1E70E9374D7DD2@SA3PR04MB9001.namprd04.prod.outlook.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-2-skrishnamoorthy@rambus.com>
 <778fef91-0610-4ddc-9d64-e6b45b30127f@kernel.org>
 <20260811-lyrical-aromatic-mouse-bbbd42@quoll>
In-Reply-To: <20260811-lyrical-aromatic-mouse-bbbd42@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.11.2.117
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB9001:EE_|PH0PR04MB7899:EE_
x-ms-office365-filtering-correlation-id: b0994b31-cbdc-467a-3cd0-08def7c8915f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|22082099003|18002099003|56012099006|11063799006|3023799007|38070700021|6133799003|4143699003|10067099003|921020;
x-microsoft-antispam-message-info: oYlCasjFLi6QsQCelYu4qtG8e1oxOBYWhIFtUTU3iHd1WeZGl6QBz4858VxyhKVtw4KJyvspFyzFDBzecPtyUoUeHarFf68LubCEoKXyvqhGzcqHfuToL1iQVetR/nuUKHKPy4LAhBeY7LHjaD3u61EKRKIHYWYm2BhE3voTlGIMbh3Osx/T+mTCd6Ym2i1CIU7y6Mi/Rlwysp+aI68xEJ1hc9Pe0+Jbv7mh8RCpS7kY8Ku6yWA29OSqKD+iFzQSmqw1aH8NiRlGoUOvlko+uDz7liOXLW+1N9ZWfwUnBO46dImeYa+RlJNyXORAgY9MK4KUVGaRtZ6JZhPEN4eDdsKyDzPsScSB1vF14FW5gDGer3XhWAdsJXuaKWcp+DYBFNRgRg5RADDIx3fBhllhE8AmVzFA1sFjWPp1PLXV8kHE0TdBtcTPcbyx7GqybR+W+eObT0JMaG3lltZIWberC5zcjn3mOfDGOtoldXO8jLXyZeakz6Xxd4ENkVjSxe3J11xy6U7e8NaaYeDRllYvZ+AvgiNVf7NjPqEtYl4e/ndWnRh5lM+PKGdM/4D4eaT666naSRw/6JO+CUKlUPq+T7f2eGdaO1WrZ/W8E0QnPc2PtxwyY2rig3gfpUX9eBNZsXhBge/3cSWpNQ5fxvCZXXvM8JA0oNazP36Y+r3IFUc52QKKUDJStMIO26rZHA2lNgdwb4OV9HpuXzgP2Ob6yPj8ZpAmj9BGFi/e8UHtzI+XvvwQb2pjMOvB+fKMfwwG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB9001.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(38070700021)(6133799003)(4143699003)(10067099003)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlBDTU9zcTdlcXlYa09IWS9NZWZrM1A5ZUFndU1NZHUyQmI5WndGalY1djRt?=
 =?utf-8?B?WkdnSndxZVU1dmZQdmlTOGh0cS9kUFFINU5SNk44L1JqTzMvZW9MQURJQXNx?=
 =?utf-8?B?RTRYOGxBU01VSzZQTXcxVndxQlg3ZDdMTGRPanU5QTloLzRpQWRCZnJiQlc4?=
 =?utf-8?B?R2RLTmlHbWVvcTUwb0VlcWRoZ0R2UmxvSzRCaHdTejk5b0p5M2RSZ1I1cis3?=
 =?utf-8?B?Y1FUNFZyOFRmVzB0QmUrWFpKdmR2NG1IejBvMlRjN29IWWM1RmhqZkpDUW8r?=
 =?utf-8?B?TUlzcHRTbnZ6SVpXdjFKV3dpd2FqKzE1UWxBdmtnTWhYY0RZMkRHaG9NbnNC?=
 =?utf-8?B?WFYvVE1wWlF0UStEWmxpVTZ0b3ZjeVlVK0FkNGFMZEZ5NGpxNXdEVE93c1FX?=
 =?utf-8?B?c21OK3lLKytXcEptY2t2R0t6K0swektNUjBvbTdMbFUxRnhzck1xQldMc0V1?=
 =?utf-8?B?b0VZQUxIR1BKYXFkK1JwQklWY2ZGc05kVnVtbVpzdi9vTjMvNWttVldXL0xw?=
 =?utf-8?B?MlpTRE5MNkh1Yk45UXQ3T05jSUZTMHZyZTdwN1JlOHdhcm82bU8xcUJmMWJU?=
 =?utf-8?B?L0Q2QVM3bTRiRDk0M3lFZE9za2pxSzYxcDJEUmpWbWtYQlp0Ti93SUJ1cy9D?=
 =?utf-8?B?NFloMlo0c2hrNDk2dU8xc05ZRTBvYWExQXFaQ3o5eEVSd2x4Mk8ySTVFTGN6?=
 =?utf-8?B?Y0xEMUpqblc2MHdxQ1VRUUlVK3dtejNkV2ErdE9QR1d3V1V2S1hlckg0MXlv?=
 =?utf-8?B?TnRjbytlaGUrQklhMFRwVDNHN2wwekVSVVlXUEUrOFZkMlZLQnEvdHdJc3kr?=
 =?utf-8?B?Lzk4NGFHdzFBVjF0ejVuZVR3VW5rcVQ5dHdwNXFtQlJPa0w0anZiZVlJU0E5?=
 =?utf-8?B?aG8xMTBZbFhIY1pFeXFVT3VPbDVZbHBGWnRab29NSktRYU1LR2gyRDIyRVdU?=
 =?utf-8?B?aVdFRnFsNWZSdGh2OWJhSDVjVTEyL29ET0RUd2l4Ykh1S0F3ZjJYbkJKZGtl?=
 =?utf-8?B?UG1TanE2K00yN0tRQi8xN2xRbGRWeklrZEhkSXV5VTZOUDVlYVJ4MnVBT0Nq?=
 =?utf-8?B?L0pEWnI0RnN3bmYvN09mMXFxdzVzVW9XL0p0TXJ3ZFg0QW5qR0M5d0R3MTlG?=
 =?utf-8?B?ZTliNTJPbEFjcE90Uzh6OWZOTVdTay9XRHcvUGZ5TWtEYUp2MGtBTEVyNi9D?=
 =?utf-8?B?dm0vUU90WDVxcFNoOU9IRXhwL05ldkFGYjhCdklZcXZTclFENU8zdXBCa0ht?=
 =?utf-8?B?QmQ1RHAyZFVPZXJ3Mjgxb3ZUemk0NElZT0RBOFM0ak1ROHJXZVBTMGJsbHZs?=
 =?utf-8?B?YnBoL0Zxb3FrUDlJYWM3ZUhCb0hyUEdZMjVWTm14RWVsR283bnVXc2szeFVn?=
 =?utf-8?B?T1hGWDg3ek1ObTFBYUpZWVpjRjg5czg2aXFSc3lzaTNxSXIxOTJDam83K0tr?=
 =?utf-8?B?ZHl4RGpWU01wWFptZGFZQU8yV096VFNtVzFWRzFaTDBwRVlkVjBlVkgzc1Qv?=
 =?utf-8?B?cjZleURubnVCT3RCVUpRM3FVYnVGc0lYNTBNUEpMQjhDNVRvNVFDd0E3QytJ?=
 =?utf-8?B?Q2loeHZiNUNLWWVndFFtYkNPQzd0bnB1K3hxYTFiYjROQ2V2UmUwU21OTm1Y?=
 =?utf-8?B?YUd0QmhGVS9iUkxGSDVkTHJHT0Z4UUZIL1B4clFzekY2enM4ZzNRTU5wRUUr?=
 =?utf-8?B?TU1MT2VkYWc1T2Y1azVzT05jSXc4NjUwenlCOWNCZVY3L0dobVg2VkF2ZUty?=
 =?utf-8?B?Zk1oQTNhYy9uZys2R0xSZlEzTjBvTW9VVm1zc0hzOHhsODZrYm1vNDJ5N0lu?=
 =?utf-8?B?NmpBNXdnVENEWmJxRkhldkhGcHF0dHhZbnlRekFzYnp2ZWlqaHBGQ0N4ZEZJ?=
 =?utf-8?B?QXpzWVFTVHNXSE9qMmw2blUxWFRpUVBNS3BVRjNvelp4dW9jR2pzUWNkampI?=
 =?utf-8?B?bDdIVEt6MVZXa2FIUjBUdDJNdmhva01EV3pZTWVSWDZpbEs5MHNMeFZ1R2JZ?=
 =?utf-8?B?UWJQUnVWUEF2dUJ5NllYQlhieks1dzVkM2dwMGIybFFiVXpvQ1U5SEZRb3Zp?=
 =?utf-8?B?NUV4RzdzLzc5RG4rYVAwb2svVDdreStYaUNtRkJaUkNYVE1MZkZDcWoyVUph?=
 =?utf-8?B?dHBmdWtvZDZMNTRERDg3SS9KMFVpSFErT0JmdzVXQTk4amY4SmhHRk5ha2NY?=
 =?utf-8?B?SEkxZkJ1cFh4YUNZeEVJV3RmelBXK0ZmYUFWckJVc2Z3T05iU3hGK3JBNVNF?=
 =?utf-8?B?eWs2bmNLM2l4QllXVWM3VDY5V3dRTng4Tlh5MXArekZNeDA0Q1I3QjlEcjFp?=
 =?utf-8?B?VnZHT2ZLSGFRaGl0RHQrOXV0cm1UeWtzb3BFZ2lWZTkrT1lSLzdYUT09?=
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB9001.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0994b31-cbdc-467a-3cd0-08def7c8915f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 16:49:53.7182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eRd0mB28Xd/0fy7LujJdLprvxLroQFsx230QcaHafmcJEJsyk0eR3jFCaBMjZEL8i/QXw6jhpXjIK5SR7tOCHjMLVEKlYqeuE74UDTKqwMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_095001_480941_C8BF8103 
X-CRM114-Status: GOOD (  27.09  )
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

On 10/08/2026 01:16, Krzysztof Kozlowski wrote:
> > Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> > Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
>
> Completely messed order of tags.
>
> > Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
>
> How Alex could sign after you?
>
> > Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> > Reviewed-by: Thi Nguyen <thin@rambus.com>
>
> Your SoB is the last.
>
> Are you sure these people reviewed THIS code instead of blanket-review
> for everything?
>
> Did they find any issues in the schema which you fixed?

Right - Alex authored; Saravanakrishnan co-developed and submitted. We will
fix the trailer order across the series to:

  Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
  Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
  Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>

We will also drop the internal Reviewed-by tags; reviewers can add them
on-list if they choose.

> > +      "<vendor>,<soc>-cmh" compatible first with "rambus,cmh-v1030" as a
> > +      fallback; that extended form will be added when such a platform is
> > +      upstreamed.
>
> Considering how variable the binding looks like, this needs real SoC
> compatibles.

Agreed - we will not keep a generic-only binding. The SoC-specific
"<vendor>,<soc>-cmh" compatible (with "rambus,cmh-v1030" as fallback) will be
added together with the corresponding in-tree DTS user once the integrating
SoC is upstreamable. We will keep refining the series on-list in the meantime
so it is ready to land with that user.

> > +      side-channel-protected cores) and "rt" (the real-time tick clock
> > +      for the internal timer).  Absent on integrations where a separate
> > +      management/power controller owns the clocks and Linux has no clock
> > +      handle.
>
> Don't repeat constraints in free form text.
>
> List the items instead with description. minItems stays.

Will do - we will drop the count-restating and "Absent on..." prose and
describe the clocks per item, keeping minItems: 1. The clocks are not a
strictly positional list (core-div2 is present only on SCA-core
configurations, while rt may be present without it), so the valid name
combinations stay enumerated in clock-names (oneOf).

> > +      One node per hardware mailbox owned by this host.  The mailboxes a
> > +      host owns are assigned by the management host at integration time
>
> So they are SoC-deducible.
>
> > +      and cannot be probed, so they are enumerated here.
>
> Where are mbox-cells?

Correct - the mailbox set is fixed at integration and lives in the SoC .dtsi;
We will reword this as a hardware description and drop the "cannot be probed"
framing. This is not a Linux mailbox provider (it exposes no channels to other
consumers), so there are no #mbox-cells. To avoid that connotation, we will
rename the "mailbox@" child nodes to "queue@".

> > +          Completion/error interrupt for this mailbox.  Optional; when no
>
> Don't repeat constraints in free form text.
>
> The schema tells if something is optional or not.
>
> > +          mailbox has an interrupt the driver falls back to polling.
>
> Driver is usually irrelevant here and that internal review which
> supposedly happen for this code should tell you this.

Agreed - we will cut this to "Completion/error interrupt for this mailbox." and
drop the optionality restatement and the driver-behavior description.

> > +          log2 of the number of VCQ ring slots the driver provisions for
>
> Driver stuff does not belong to DT.
>
> > +          6 (64 slots).
>
> Missing default. Anyway, I do not understand why standard number you
> express as log. slots-num is a number. Number is 1, 2 or 4 etc. Not
> logarithm of something. Do you say: I have log-8 dollars in my wallet?

Understood - we will express these as plain numbers with defaults instead of
log2:

  rambus,num-slots:         enum [2, 4, 8, ..., 32768], default 64
  rambus,slot-stride-bytes: enum [128, 256, 512, 1024], default 512

The driver converts to the register's log2 encoding internally. We will also
drop the "driver provisions" / "imposed by the hardware" wording and describe
them as the per-board host-memory ring geometry. The same applies to
rambus,strides-log2.

On your follow-up:

> Also filename should match compatible.

Agreed - we will rename the binding to rambus,cmh-v1030.yaml to match the
compatible.

Thanks for the review.

Regards,
Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
