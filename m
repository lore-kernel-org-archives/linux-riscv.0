Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56654CA5FAC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgzKjmyLNpVoB5fsiVIIQJ73ZLrLqhFOHhFb53UFp2s=; b=QSaa3kURmkbGJH
	g75F34raZDUpmKIv1YlxzlnMYsJJrfzyMHacUoBFfILTZHSrCbC2chZS79nvitwuH7oLz+WPE7I0i
	NB1Df/E5jtvnsl9vYemyBgAwZuAeGAJoaqnxB8/ZtOGUEbngrxHNiad2D2TNSUqrhZ7jsH0H/zGHb
	S5nofnstsiWeUl5nAO/WPtwByQQAUQoQjCCHqSiOQZP0B/YLrt+eSjGeUavm+49h4RlaBSeWf0wpt
	Zx+K3QUTp2pV4az/Di5qLH0h6/Sg0/3R5hyBZh1sBIr2L+UWzGh6ouUwZOMAYsBsb98NC98QF6JCP
	s7uipAZyKW7GCe+iCHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBu2d-000000065oo-2N4c;
	Wed, 30 Sep 2026 13:08:11 +0000
Received: from mail-southcentralusazon11013051.outbound.protection.outlook.com ([40.93.196.51] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBu2Z-000000065o7-1r9D
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 13:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pH/jZMtoHBKZk1xcQWRDVjs2FtDmC6K7Hx8T1GkHSkrKvssvsUfDw0Mmr8jfob1JTXsjVP5AdongFE0RxY/0utqzBjwQLlgois6FU/pr2BbijYhTeMrkbDhM662N0nCmu3t4yhcDP/ekeE2pVRDJMc1d3UZ8U+7Q03PkDtqEaa1OPH6BkM+3bTGEURFyRt6xjS7B+No1Rs6BH+Xo0E+3i8rTNRI5kA+vaGmemRdnXIIkdn5Mq7mUaUNYAU6D7nIryUkPFMqxIMpZkLgDZVACi9Nvo2IP5VKpiRZIdJIeyHJBm5+iD341zehB+hfPoOH8YlLslSvvRxb9AYsxzP64Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uzY6ke6C1adGcZq5ssZEyMyNrFwJ5FGdpP3gxIiUb8=;
 b=gmDYTjt1agb4A/o9Ockc1mv1dTcslUkLwcylqV6O9y5jUY80WFO5OZW37kqDKHuZIBHodbSAcfDAXrHRUnyxR7crLdNLfJLAAG3jelNlVzGre4LOQFg3pnt7l6NoHzf9iGx4mphKFwCePud9OjObjWPQffm+eSnRaRvZWU5rnNVTM7abejFfOS1xGZ4TywQSIf5Zyb7CkfksMaWaJK2Sh57LwxxP4AATEKHcI5IeJ069Vlg+PAefI8LsIgx6Qj8Vt80+VXGm9/Lnv0pwYle0rSiWh7dWYGhKVJw1Q3p868LiJJNACwC9EoidvjkT4mYLYwQrWRzUsKpO/zXSi2t0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uzY6ke6C1adGcZq5ssZEyMyNrFwJ5FGdpP3gxIiUb8=;
 b=vxYVLnMfoKL82qeKx8aY72/emP1+xXrv9d1Tpy4zKNf10CxR5Fy+1jY4TYCXYIfWe2zeQXf34UuElS+u93DyV0jFv7IV2C7bYox7j86UALNpNfVLh6RDGTJ9Pt8M1XEEtySMwaip13RYN30s2PDbATqNxmUmui4EdoNaTUjvE60=
Received: from BY5PR04MB7025.namprd04.prod.outlook.com (2603:10b6:a03:22f::17)
 by MN2PR04MB6926.namprd04.prod.outlook.com (2603:10b6:208:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 13:08:04 +0000
Received: from BY5PR04MB7025.namprd04.prod.outlook.com
 ([fe80::97f1:60bb:2ae8:6f01]) by BY5PR04MB7025.namprd04.prod.outlook.com
 ([fe80::97f1:60bb:2ae8:6f01%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 13:08:04 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Yulin Lu <luyulin@eswincomputing.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Pritesh Patel
	<pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti
	<andi.shyti@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Min Lin
	<linmin@eswincomputing.com>
Subject: Re: [PATCH v4 7/7] riscv: dts: eswin: add watchdog support
Thread-Topic: [PATCH v4 7/7] riscv: dts: eswin: add watchdog support
Thread-Index: AQHdUNy6FlBf28PbNUyVHt6pMSZwCQ==
Date: Wed, 30 Sep 2026 13:08:04 +0000
Message-ID: <BY5PR04MB7025A06D2F1D1A9EB66BE6C1838B2@BY5PR04MB7025.namprd04.prod.outlook.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-8-pinkesh.vaghela@einfochips.com>
 <e27dd631-73a8-444a-8747-84d51ca3a57c@sifive.com>
In-Reply-To: <e27dd631-73a8-444a-8747-84d51ca3a57c@sifive.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=9c9fb6e6-dd90-44c8-afb9-9244deaa7757;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-09-30T13:07:15Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB7025:EE_|MN2PR04MB6926:EE_
x-ms-office365-filtering-correlation-id: f1861758-9b2a-4ea9-cfb7-08df1ef3dd1c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|55112099003|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 0L9/UzALTtj9Ej0om9Z+LNB1G3IFsyf6XlYQlscICiIXxtyyR7pnGBuHTVqh+M3Lfw1vSujia08Lg1VBtUAzPxFnJKUnhd29ldrJdbUtPmevsX1LbNC+fclQ8NZXQGxDwzODsrFGT9NYsz0WuwPUrAeklQfiKME0MQebc60IHaWxjr6NkaHKVhtI4bEJjOc/4kT/YtpblyS2ivHddT3wgQZjAx6ftYDTYy/s0yi/KDsnzFMipwegCzLoj13pY5w9z6gXuGcQpUGcvs5dnVqsGVdZuHUx/fegZDXXFRnDdovqNNxUyNzqgRFXfTwY9qUz0zBmF9wu0iZHy48Kc5adeA3iqYhpjpUJsZ04m44VpTrp5+UxP2XIWPPeQgTHQSd3zwgp4HmxV8dJdQEQL3y7SCReXLPsLERuUihBCkTqTS00YvpXatOT6AYhtFOAr6NC+yZ8pjkNvFH9CS3+b+xyhNBFWZPPS5J9pPes4u4uORNkmPWQIM2sJEb4ri78P9ngkWmSwavH/hoPkzBc3+6R1F2F6M9XTyW+0mIN4DZuCnps0d0J0JUCEvwL5qgWCRlNj2EyLP8FxDWkQs+FQHpBgG5b6WCH/KPHa1w0EvpRLnHx28TCKlqxTQgclLZoGIhER94OZ9difAR+fBM0lm2ZwlsdWyv3QcapKPsWqtvGKhHoLwtYRwq9Z9RcYVpI/7HkvQrLru5UiSFc/kf/n5uO+H++XfUu8pY8pVSuHnGJjQ0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB7025.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(55112099003)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGo2RnNIN1JKa01FejkvS2xNTE05NjFiTUdOOElkUGFnTzZMeW10NGx0UkYw?=
 =?utf-8?B?REZFT2cramhVOXVTUjJzc1huNlhhSjB0ajY2U3JNMU5nemE3QWFrS3JJQ1RB?=
 =?utf-8?B?NkNHWGVhVXE4Wk9NUUlJVWZhazAwNXZ0UGcrTHl0YlJ3dWVEYjNEc016dVVX?=
 =?utf-8?B?ZWpYZThTZUY4dWZkb3VrWE5zOUtCUHRJOW1MR1NHdDdkRWdMdnRjbGU3SDFo?=
 =?utf-8?B?RXJ4amVNZ2N2ZUh4dHoyVzNtK1dCVHNDeGhWNEtYL2c3ZFlCYUJQNFN3Wm1R?=
 =?utf-8?B?ZmlMbnM3QzJES21ZVldsNy9pYXVnVXZuL0dhUVYvekhzYk1lKzlDSzRZMTZ0?=
 =?utf-8?B?RVpzTUJyTzdIZXRTdXNXN0hzeHFpS0Z0YjBJbUd4ejk2aUp6dnRtRzArV2Nq?=
 =?utf-8?B?K1FiSXdEdG1iaTNkYjZrZTB3ZXFIVktCU3NBK21FeHhvc3NaeGFYR29NOGZy?=
 =?utf-8?B?UmNLVkJ0WGlmQ1hsRXNFN3JaT2hWbVd4aUVjTDRrS1lTREtpTjVuczFOcWZG?=
 =?utf-8?B?QjcrM05mRzN2OHBMY0hvQnh3ajAwRjZjWWkyb3JSNGRDcURhOTY5Q1BOb1Vw?=
 =?utf-8?B?ZDE0azlRNjlQOGE0d2s5d0VQRmI4NkNEVkFMVjV5ekN1NENWeVI1STdoejMz?=
 =?utf-8?B?TjJBU0pvd0NVOHZpaUM5a3RwWUp3ZDdVZGE1b1NicWErWWxnRVVoTUVucWI1?=
 =?utf-8?B?T21MeVJxZEtEcm9KZ1dsZ21xdkN3Z1BnOWNiKzYreXdoaVNSdDZuaUQxdzdm?=
 =?utf-8?B?OVBBMXQ0WUozWFliUmsreUZDWERHZmR1MUg5T20yMVM4TUUrUWt3RDNzTmU5?=
 =?utf-8?B?QnJOWlAyUEZ6WW1sdGMzTUFyOWlQTE9sMmpERXFYcUJ4aGhSclB1bnVCY0NQ?=
 =?utf-8?B?dEV1NmVRK254ZGZDY2t2Y1Q5c3VmUysvRUxmN1o4Z3p6QjB6czRuNVk0UWg3?=
 =?utf-8?B?WmkvS09oL1JUTE5oeG9kZXhpUUE5L3lweHEvYldsWU80SmVmZ0VsbkFtbEtF?=
 =?utf-8?B?V29zbStxWXFqMFJlL1lMY3VCZ3VzRG9VckxYQm1oOW04MGdSVjc5VlpPbTVz?=
 =?utf-8?B?RHpyY2JoanlSaFl4SFhvTHROQjdOUXE3M1BpVFAwdmNyanZHbTJiYWVHcTNl?=
 =?utf-8?B?eHNUTkZpcGJNNXdURWE0WFd0S1VEOFloc2gra1NmN0ROZERTUTZXTFpmOEpS?=
 =?utf-8?B?eVpmYU9XbkllbDk4MnpzZzFpbTZScVVpSXN3UnNGUElmakxRaklHQkEzOHNK?=
 =?utf-8?B?TUxxUkhIZnJ3NHlGeEdYUGoxMXlQM05melJENEtnWnhWQzNJeTNhaXRXOVc1?=
 =?utf-8?B?YlFGUGhHY0oxWjljc0d6RWxzRXVtY1loRHVEODF3UFR3T25TTWEvcTM5U3Qv?=
 =?utf-8?B?bW5CeHNiczZjUThBUlNhTUVBeE5yT2lkZGs1enNQcDZDV0dZbGhCY2lKSExR?=
 =?utf-8?B?Y2xpYkk2eENhTWhlNXlxcVE1bU1uL2s3Q1Z5QkphakowQnF0d1J3OVBMNExm?=
 =?utf-8?B?b3VzV0kvNE0wdjd5TXJSQ2NKdjFXZWYwMVdEQ243R2hRN3RMa3Exd09IYUZV?=
 =?utf-8?B?SjJ2TTM2Z2QxWGd6Z0dvMGpmTlk4OWsvaiswRTRXQUpEV0MzQU9xUGRXZVky?=
 =?utf-8?B?RUVtaE1EMUhtNWVpaGhYSmhjU3FnME52b2ZRNlRKMUNVSmtGbVBpSzBCRGth?=
 =?utf-8?B?d1EvcGhPaGxUOHQvMnFBOEEyL1JwMjFYTWJ0MGJBQjdDUC9OSC9XWHlDNGxn?=
 =?utf-8?B?SDE0NXNwSVhtQXRPYUJ4eHAvaXgyOVQ3QkkzU056b1k2YlhSQ2I3YllwN0ZJ?=
 =?utf-8?B?aFhaSmJaTnFiTXJ4U1FYTXA2dFM3YjBORERja2drRVFZNHNjU0NCSTFKclBH?=
 =?utf-8?B?QUM4UThDck83dFBxclpLREgzSzdnaElubjF2MG5ROElQU3VTYUVWM2dNNXkv?=
 =?utf-8?B?cks0QU9lN0prUFExRFVoK3phaGQwMy9tVFF0cHlLYStvOXRndUVGcGEvUUUv?=
 =?utf-8?B?MFlETVoweW1weFdOSWN0R3VkOWVLZ1hMa1g2MjVUaWFLUmgzNW9MZzdESFAr?=
 =?utf-8?B?QU9DZzFnSklnSFNXWHpwalJWTlhsc25TSnVmN01FSWJJdHRaUUZQcVVDd2tI?=
 =?utf-8?B?dXJvb0FxUng5U2R1K1JuMmI5UXN6ais4Vm9iTy8rOSs5SDZqTmdaTlRlcHFW?=
 =?utf-8?B?ZDhDTkJzZjQvd2VTeUJUdFdtZmpZRzI5VWt3MXNOU1VtSTRDendtRUc4SStJ?=
 =?utf-8?B?SXMvMjR4ZHZRUUZoV3V2UThEM09jQ0t1OU1WZE15eDBLdnhQTVEyV2NROUZX?=
 =?utf-8?B?MzZQZ1NNVEhNSjdSUXZnQzBZSHpmb3F1Wi91V3JQdVEyL2d6UFI4ekx2THdY?=
 =?utf-8?Q?tndfrS6YG2U+q/MU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB7025.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1861758-9b2a-4ea9-cfb7-08df1ef3dd1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 13:08:04.5068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prPnVRiP2/w5PGEFbMUdxglWoR6BLqa7d0Y6JkiCUlAOVOqY3VssVTUuSthVGfHFeKpzxj3d754jk05hDb+270qu7tlEDiugqQuwWW6FYpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_060807_750168_7E03DC4A 
X-CRM114-Status: GOOD (  18.29  )
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

Hi Samuel,

> -----Original Message-----
> From: Samuel Holland <samuel.holland@sifive.com>
> Sent: Tuesday, September 29, 2026 6:42 PM
> To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Cc: Yulin Lu <luyulin@eswincomputing.com>; Darshan Prajapati
> <darshan.prajapati@einfochips.com>; Pritesh Patel
> <pritesh.patel@einfochips.com>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Paul
> Walmsley <pjw@kernel.org>; Palmer Dabbelt <palmer@dabbelt.com>; Albert
> Ou <aou@eecs.berkeley.edu>; Alexandre Ghiti <alex@ghiti.fr>; Andi Shyti
> <andi.shyti@kernel.org>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; linux-i2c@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org; Min Lin <linmin@eswincomputing.com>
> Subject: [External] Re: [PATCH v4 7/7] riscv: dts: eswin: add watchdog support
> 
> Hi Pinkesh,
> 
> On 2026-08-14 2:00 AM, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >
> > Add watchdog node for ESWIN EIC7700 SoC and enable them for HiFive
> > Premier P550 board
> >
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  .../dts/eswin/eic7700-hifive-premier-p550.dts | 16 ++++++++
> >  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 40 +++++++++++++++++++
> >  2 files changed, 56 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > index 5dddcf13fd25..103c3dab184f 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > @@ -207,3 +207,19 @@ &uart2 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&uart2_pins>;
> >  };
> > +
> > +&wdt0 {
> > +     status = "okay";
> > +};
> > +
> > +&wdt1 {
> > +     status = "okay";
> > +};
> > +
> > +&wdt2 {
> > +     status = "okay";
> > +};
> > +
> > +&wdt3 {
> > +     status = "okay";
> > +};
> 
> The watchdog timers have no dependency outside the SoC, so they can be
> enabled by default (omit the status property). There is no need to separately
> enable them for each board.

We will change this in next version.

Regards,
Pinkesh

> 
> Regards,
> Samuel
> 
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index c13432d14504..f873e9eeb929 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -265,6 +265,46 @@ syscon: syscon@50440000 {
> >                       };
> >               };
> >
> > +             wdt0: watchdog@50800000 {
> > +                     compatible = "snps,dw-wdt";
> > +                     reg = <0x0 0x50800000 0x0 0x4000>;
> > +                     interrupts = <87>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
> > +                     clock-names = "tclk";
> > +                     resets = <&reset EIC7700_RESET_WDT0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             wdt1: watchdog@50804000 {
> > +                     compatible = "snps,dw-wdt";
> > +                     reg = <0x0 0x50804000 0x0 0x4000>;
> > +                     interrupts = <88>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_WDT1_PCLK>;
> > +                     clock-names = "tclk";
> > +                     resets = <&reset EIC7700_RESET_WDT1>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             wdt2: watchdog@50808000 {
> > +                     compatible = "snps,dw-wdt";
> > +                     reg = <0x0 0x50808000 0x0 0x4000>;
> > +                     interrupts = <89>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_WDT2_PCLK>;
> > +                     clock-names = "tclk";
> > +                     resets = <&reset EIC7700_RESET_WDT2>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             wdt3: watchdog@5080c000 {
> > +                     compatible = "snps,dw-wdt";
> > +                     reg = <0x0 0x5080c000 0x0 0x4000>;
> > +                     interrupts = <90>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_WDT3_PCLK>;
> > +                     clock-names = "tclk";
> > +                     resets = <&reset EIC7700_RESET_WDT3>;
> > +                     status = "disabled";
> > +             };
> > +
> >               uart0: serial@50900000 {
> >                       compatible = "snps,dw-apb-uart";
> >                       reg = <0x0 0x50900000 0x0 0x10000>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
