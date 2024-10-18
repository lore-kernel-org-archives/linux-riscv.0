Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DA5D3C53E
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 01:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xxN2DBCA/vIWEwqTalGHrbKYktvl+sFsgIi8aqrgvWU=; b=TGVoy/TOFpJu8W
	/6RKfTESTDPcDDk19HMUi1QMw1MEpEkuhG4oRng/KRQSsTmlWjrN4r+OpWFGTbceK3yky/Zt3lVdf
	VgyJ05RT+ZjLKV+9G3nFzkEXvNH5BmSr6I3/t40tdLHiJeZ2f/3qWZwp91kMfOxAyoRuLf42/2eTb
	TQmlcQGqlaopbsp3v+IufwziQklhNLozcIAEFMr9Q2c9OIsQi/GN1D/My6L2VGtedInr0rQS/e00n
	uhre8rwpOlOl+8XUXDh2XGcAK0ENzRmfHgIXMZoUO5JHtYtRXnSXollbH2fMm5qG4SnhubcqORgUz
	tk1KyyA6MteLbyn3NO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1bga-0000000GYsY-0uxI;
	Fri, 18 Oct 2024 01:21:48 +0000
Received: from mail-bjschn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72e] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1bgX-0000000GYqw-2VxY
	for linux-riscv@lists.infradead.org;
	Fri, 18 Oct 2024 01:21:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IN2bGQ2MDvwEs2+uWHlSTgTGOeLPMmEytL3mndfv4QI5sCGieyJIDFdmeQMstN4LtbyJCOYQKtgLUbziRrZV8gmVZP5RhkHlhLwwghilAXHMGA1/CmXKBsXim71PT9udPJjv/dPkAgEWroPrYiKpLbQhELLpPIUI+qJMnsNW7iVOzLTHvRlLA3ifhWPzNAFY76/mucloWdKbiLDhd4PpaAjow5dCoRmAaEVg5tuA2JPSaSQ12GJG0mMU91KDPtqkimmj+M3fDaTB8OmaspUWrAHDFp8MSGSsMlfgSCMhb0PKeieOCfU3pQeHs7dqOmZWE08UZEZrBB7lfMhyuH6zBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWW3gx/jEm9F7tfpr1wzKaf886RGuz2cczNTmC7wRAU=;
 b=kfkmg1dbD5Yar+HEjF0tCr6xj9P+73T6yFPXvRUY443OcuBDKH3M8UKUKZriQV+kC9yPEKn8+4Lg85ec9tba+tOZPOtb/ZjwvvVL4qiudg+jUfqPcXdKm+LLAHVpGF66EAn07rBmBfvt1jJvxiwGN6xfEAwdhrYlNWSYBa+KIFQhUB2gvMTdxZwVhuVw/OuIQ8JPCypSxrMhBqTd5VL5s3kt7ZlVwk9mTJlqUPDarvIVheUqSYwOUxaHuTg8G7GGuHNlQQNwrWyjghfMI7+8v/P7fvtEBVo8HQFe4cNj0WGnE3KBEY+A3lQuwjSTy2w+U5Duom06EbTiyW6PHALtxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 01:21:11 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8069.019; Fri, 18 Oct 2024 01:21:10 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Conor
 Dooley <conor.dooley@microchip.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIIHYxXSByaXNjdjogZHRzOiBzdGFyZml2ZTog?=
 =?gb2312?Q?disable_unused_csi/camss_nodes?=
Thread-Index: AQHbIAerDCyRJ1WJg0mmvQeCtV44grKKI3cggABMoZCAAMplAIAAfRRA
Date: Fri, 18 Oct 2024 01:21:10 +0000
Message-ID: <ZQ0PR01MB1302DAA51F7171B19ACDF7A7F2402@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_
x-ms-office365-filtering-correlation-id: 7841194d-ce72-4945-71c3-08dcef132675
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|41320700013|38070700018;
x-microsoft-antispam-message-info: CDZ+qj+RLo86GURjDalYGoZOd3xOv9uQAltE/6MYI67/yZZaTiWsFMCeQP7pycn69+EwqQnxAD5JOiWy8cD66Jer2fDkQYsn5XFF5XbQh+MGcpgp0wU74RDRgtscNWFCDsynQFpg2LCelnPNJL1dqEpwdQ/W8eGDQrlleJP6d8BnLpUToJtwoJ4P0QLojfVgVl04aRWcuXPrm5SUqIunwjNYu3V8qRKvx490p4Co+hgLnOmnF5nMd8pJ8nIAak9dOTlSTb/okREpKp3OmeYuLV1BPCheoHbEUWUTIVI+i2pB+/Z7X3Dcw3LWIBPiW2WV+hJAllRpiGJzbNvi1NPO+V9yvp4M9yv2ZyjXGD+l4jVTDUzL90h3zxtw5fhcywTlml/6dEy0YIoORlWcX5SThKdZeVMgwuWvqTDjnmBb4qPgR089SkveYbw7pgjODCoKu+pio5136R3pNG3BlALKBhuF5PMBp6NwYLamfzlHifZAg1twdIqQoLAq/Q3X4gfs0thbbFqPJXQHN82qhDcSGCnatgFBbFm2kdBu8jwzoQ940dXX2PRyoqK18zRA5EgFczfGCJTkompxhYOe2HJWtSgEpKZrpUNmn84ZNc9+wzBmo0JO80ns9tVTZlM1/Z4O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?aWpOKzQ1R0lJRWFld3RteFNBeDVNTkRoME9oR205SGdCdWJNK0wxRU9SaUIr?=
 =?gb2312?B?N2FndDhnVHZ1NGJRR0YwKzM2dFpYNno0TkR2U2FmK09LRXVPVzJsdEl5TzlK?=
 =?gb2312?B?R0FJd2xTc3VibkU5c0xIaExIYlVob3FjaTdsRGtxSGswUkFaVlFmR1oxcjh1?=
 =?gb2312?B?WS9TWnllUEVhNzNUeVNJZlJpcWliZUFlb1AyR1FRVVg3alpMZ0JWUlRXZjNp?=
 =?gb2312?B?WTRSTU5XL2tMVEZ2c1F2NzZOM1pZY1NHTldUc2J3aUEyOVJUcDliUld1R0pV?=
 =?gb2312?B?djhHK3M0akhTUVpzMkE0OGwzdXkydUFiQlVBaXVBZG1XN3ZZTjZGV1ptdjRh?=
 =?gb2312?B?RS95M2EwVkFmM2lMK2dZa3h4ci8vQUoxd3JheWdwTCtoM3dkWCtzT3ZIbW4z?=
 =?gb2312?B?OFN1NUppdHNIN3BpRHZxMlVFQlNwdHpyUkxPY3dQMVRJcEpNalhYV2pXZllJ?=
 =?gb2312?B?R2xFMVZQRlJqai9HcEdRM2Ivb3UyWEt6RlhpS3RMRGlXUlQxWS9keHlyU1Nu?=
 =?gb2312?B?aDJ4VXJGUnJZM0pLTW51TThxUmQ2Zng3TDViMUxKa3U3Nk9YeFd4L1R3aDd2?=
 =?gb2312?B?dmtYOEpvZlFlQUF6M0lidjk3YjlJK1RlZGRxR2ZKbGUveXNVU2VaTUtyZ3c5?=
 =?gb2312?B?RTNMYU9oL1ZUVzQxRkxWb2xuVWV3ZUdvQ2NzNHpvbUNuaWtPd3IwUDYyRWp1?=
 =?gb2312?B?OFBSODNsY2hpRG92NzFBYkhKck1sa0M4M3VYTHFrYVk1WFhkRjNrNFFXWEx1?=
 =?gb2312?B?bUtsZWJTN2Y0VnZnZG9iNVRrYjlGSEtDMkFHQzlnTXFVV0NzZ1ZRZmloREtH?=
 =?gb2312?B?aGloYmdmTWhFQmVYaEJwNkhPakNpakJOdlMxYUdYYkFaSEsyM05xcTJXTmo1?=
 =?gb2312?B?Q2dzNkFuSnJndXVzWCtsdzlqNHJWaFdNR3ZudmM2aEdMVmZ4VG1JbmNYQVFS?=
 =?gb2312?B?UEVaSmN2UFpNdGxtS0ozSlRsWWFhekZ6YzFlMUtEbVY3bGdUZnEwTitFUU9P?=
 =?gb2312?B?VTlaZzJhVWhlQlBIUjAzeDNtZzNUNFVmNXRBR28yMHZiRjJNcll1TGVxNUd4?=
 =?gb2312?B?LzFicC82U2MyNmVpUDY2TUhIZEJRUTlkRnpFWFFpQ1hPSGdISStQclFTRk9I?=
 =?gb2312?B?WThPYkM0V3F1TDg4UWZWZnlvR0p0ZXp0b1Zxa05LdnBRc2lFdTZKeVlLaTBD?=
 =?gb2312?B?QWtxWVQ2M2JmNldWQUJsTmRzaFpaVWFST28zV2NpeHFKL0lHczdVak1lNEZZ?=
 =?gb2312?B?N0wrbDNCaW43WCtpaWlMb2poLzF2TGNDVmxqckVaSCtVNnJtZk9YRjRaWk1O?=
 =?gb2312?B?TU9GeitrV2JsM2syTFVIeWxkUjlHVzQ0Y3pjS0FpdU5BdmVkdVE2UW0yQklS?=
 =?gb2312?B?UUdTTFFzZDhscjllTTZWdjZsQ2xlSGFpNngvVER2bzVHd2dydGVBU1pDQnF5?=
 =?gb2312?B?VDlER3BnVGIxcTVFYUpJRmdlYnlvZWZEcXhVc0Rid1F3Z0srT0ZTdm5pS1c3?=
 =?gb2312?B?RzVJdklUMUJEUUlwMUQ5WGNmV1craGhnNCsvVWdlMC9xM1crOHpscDBZWDNO?=
 =?gb2312?B?Wjk4RlB5MjRnMW5RUEJpTHc3YkQva3ZJV29MUnZnUDVCanBaaFkwNDNKbm1y?=
 =?gb2312?B?Z3JtMEpxYjh3K3JLV1VkaEgwOU5GL3lpa0h1Vkk5K1V3VkMrLzJUdE1PVlVu?=
 =?gb2312?B?aGF2VWNzNVZOUkpraTJENHFDVmEzMnR2WjViVy9LSjkwalUxN3F2eVMwV2dT?=
 =?gb2312?B?UHlrZ2FxRU1pWjU4YWh2aXdnTVhoZjgwbEs1QjZ0UENyczhQTmxBUUtHbitx?=
 =?gb2312?B?YkRoQ3BiZWsyUTN6NkZjY25oZ0IrbzhLbXh4Mjc4a0lFQlVUYjJFNDRienNn?=
 =?gb2312?B?VEV5NmtGOEtQSFIxUy9zNm9yWHdubnRPMnBJeXpmejVFNXRVdmw3U2pMRy9Z?=
 =?gb2312?B?d0t1aDA1dytZSjZ5U2lYMFVrRUJNZnBOeEZ4RSs2RkFFbzJ0U1didFU2Wm5C?=
 =?gb2312?B?UHptdDZZbDR6NlFjRUhzNHMvSEVRNDR0Qnp6WGFIckVCd3hBQzB0K2NhM0dF?=
 =?gb2312?B?YVlWZU1TMHc1Z2p6QkRkcmlJZ1orTUtQNDV6bHZLM1ZrK3FQSk1CMmhXcVEx?=
 =?gb2312?B?T2NwMCs1L3RvVWJIeGZVVnkyUDhuTDRoRWlva0VuYjVoU0dSV015Ymp0RUpF?=
 =?gb2312?B?TGc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7841194d-ce72-4945-71c3-08dcef132675
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 01:21:10.7923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goJ6cMgPaVgqI7IaEJzPQA2eOQ/auYvJUpyJA8rce+Ya/fWGB8jrbjH5JH4FxFbR0ZOIMCyGZnyT8m78+gBfNu6KnTo13aH9q8EFM4cwxcgYFJNGz6E8oZ8QAjr22XrP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_182145_659456_7C9FF43C 
X-CRM114-Status: GOOD (  17.51  )
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

Hi, Conor

> On Thu, Oct 17, 2024 at 05:49:56AM +0000, Changhuang Liang wrote:
> > Hi, Conor,
> >
> > > Hi, Conor
> > >
> > > Thanks for your patch.
> > >
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > Aurelien reported probe failures due to the csi node being enabled
> > > > without having a camera attached to it. A camera was in the
> > > > initial submissions, but was removed from the dts, as it had not
> > > > actually been present on the board, but was from an addon board
> > > > used by the developer
> > > of the relevant drivers.
> > > > The non-camera pipeline nodes were not disabled when this happened
> > > > and the probe failures are problematic for Debian. Disable them.
> > > >
> > > > CC: stable@vger.kernel.org
> > > > Fixes: 28ecaaa5af192 ("riscv: dts: starfive: jh7110: Add camera
> > > > subsystem
> > > > nodes")
> > >
> > > Here you write it in 13 characters, should be "Fixes: 28ecaaa5af19 ..."
> > >
> >
> > After fixing this:
> > Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> 
> Ye, I know it was 13 not 12. I don't think that's a problem though.

Okay, that's fine.

Best Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
