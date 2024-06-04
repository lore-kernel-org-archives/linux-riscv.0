Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0563AC27C50
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZV1pkWP62xvNk9wquYCz02Cp1DaPj9jfu64iXprIAYk=; b=CEIh+f31GpPz5h
	HGmQ8q/T2NCdqUpXiPNSNMGZzc0V4epTt5g9dujYeFMA/wj3bcaxI/Ix3znBxXhqE1Ibc0CBwx0nT
	DOWNRRA+bndGhp0Ld1EbZLJnYw2DoE1SxJYTtsRyDnMJ/L1UqY4SjAcZvsO+p2eaafkUrGg9Uaori
	XMBkz1gXHSARkqMPfMv6Z7QEYN5tCguL/5njmj+N8nPOP4gRCRWjORpUuL+nn8C72sE5mnQT6fhLW
	eN+wvv5pHEIW6u7saElIAjIxWIGisjChV1HMR8u+WOfITUYvRoTDtHUTZfhP5AHIixv77yxj50Apt
	XNq/VuGw126C4dOGk+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEKEZ-00000000y1f-16dC;
	Tue, 04 Jun 2024 02:49:11 +0000
Received: from mail-sh0chn02on20700.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::700] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEKET-00000000xw1-2lX0
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 02:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuKWYXcsYpKHr7gF7l8OsQ6wHNUmya6lcgv08/TLZ4Eaif9gP2b2hjhCyeqYQalJ6gp+qnhLVt4a0u21HNo6gqn449/PJp5Q7oezzWaVcyVvHpZS0N2mhl6fY8uLXQflgk6UyxCr3tAIcoORO/GuJ6CQEsKjvq5VN3sd//zVuDcZn9dkfELgFoBOTvUZIYxiYfrpk90iloozM2hlxqBi5bfDf8pwllffPgp5sH7fFHYmogYeDgcKfFYN6Bu0axyjB+SY2BVVH73K4ZenVXy6ez7LZMFZQO4w+S/e/x2URXHCIMeE93Qgr1YWdPnep/FLPfjPpoCIADjJGTalUw/fEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrX2WgHckJfya45CCMyKlPiUGMwBclr9OkWBMgBRXg0=;
 b=Vod1RX/SWpBBgIAljXEVPhuOQvYJUQa/kRCsk3vKaVYG2EmPGi+x3BiJICgnV6GqeXxQKjfdOO/2cUnIGN5Tx99L+L4m/t/0TpG+N3vk/P/u05IPV2Q4hySMBaxFiODbSZIt2gWwIoL7XVR56uFOV/05eVp6PQP4dmARr+uLzzUdH9hXMljfw8xs5K+guLf4JwPcBDuCz9UhnlfmAWtz13gjWT7RbCzYDSZdYpOjVMPEJVnu3AMOeWC0259dzakAayVXSwQyrhBh7hVOG3QLXkXAFvTJC0K1aJ/5YgLCWK7c/WW0ZSbgPV42EmWsdBCPoAFuAIPn28zThoiRj3DU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.42; Tue, 4 Jun
 2024 02:48:50 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::61c0:a8fc:1462:bc54]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::61c0:a8fc:1462:bc54%6])
 with mapi id 15.20.7587.043; Tue, 4 Jun 2024 02:48:50 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	"matthias.bgg@kernel.org" <matthias.bgg@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "duwe@suse.de"
	<duwe@suse.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Minda Chen
	<minda.chen@starfivetech.com>
Subject: RE: [PATCH] riscv: dts: starfive: Update flash partition layout
Thread-Topic: [PATCH] riscv: dts: starfive: Update flash partition layout
Thread-Index: AQHatcqNxZBz/Lksg0yPg7MZoTCCa7G24f9Q
Date: Tue, 4 Jun 2024 02:48:50 +0000
Message-ID: <ZQ2PR01MB13075FDF73FE3292E050DF36E6F82@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20240603150759.9643-1-matthias.bgg@kernel.org>
 <8e50216c-2a3a-4946-ad90-9d66c6aae20c@canonical.com>
In-Reply-To: <8e50216c-2a3a-4946-ad90-9d66c6aae20c@canonical.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1210:EE_
x-ms-office365-filtering-correlation-id: 21437f32-6c2c-4261-8d83-08dc8440dd7a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230031|366007|7416005|1800799015|41320700004|38070700009;
x-microsoft-antispam-message-info: wuLb7a4QakLy9qnqn1xwPpaEGX/vOB/3vVmAlB+JDA6Ela1S/5PPawEGB9HqYBSUUqHnwVlWxhab3bTrXqYZr8v6jKv2i9LU7wENRYDrCRfle7I+japrxUOOmbWxoy0Oc32Ru8irHgX38N2+ablAAxJHgDq/Qc8svg5TLN+JK1rBQyG0oNY2Kj+QbJERu/TQthpGVb+cJj3Z0QUcoTeGgsg5yTfLaDxOW74Dls3cSJsibFT9AvjofjwH+doXrs/EADQbUzPz63tnFAojxqicu2ebC1LAP83n4Gj+e2SiBR7QQ8XYGffe0O0eom/omcnQIMpCrUt/asSR1WPc68/8oiAOh+aoSGemSrqLZjLA4P3iGJ/aiJ0gO8EAL8vD+1T3EEiqLf5713JUifz3vIsPZnGbsMyAQJauGszNu5pcWAacX6nBpljdvUy6UZqPKRl/npGoKbSVDY5QwzEDGlC5l8D+e7eA9rianUS118ailHLBZCKi5crhvroEOM80R2CoranLGs2MCxFgwn2Y+nD6YecdCqdFof3X3jnwl5bV1Ncpdrjk2zOZ2CIlS0SST2QPG+e+DIHVocP5rT0vl3ld2GgwiSACCt2ihKt0lsA/mTojOvJyjydQu5YjcHBYG1NR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVFGL3RlM3BVdVFWMmxvU1UxV21LaGVtWE4rOW5XOVVXbEJCVjRCTldZUE1F?=
 =?utf-8?B?V0JWblN6ckVwRTM4N1lscVJ5Wk5IN1VKb1FhQW9vdWhMV3pHc1JObm9BMG1F?=
 =?utf-8?B?UGdzcm5TN05XbEk1Y3k1LzhSSnZuSVlKVk5VQkIwSzZCajFUbGRKNkNvcUN1?=
 =?utf-8?B?U2ZDMjUwTXhaTHB6aUhlYXJLdFF4Y0hsVXQvYjFrRWI3TU1BQjhocW90dGxk?=
 =?utf-8?B?NWkyd0J0YmJWL0ZDR3FrZGd1endiMFlhZWVPWHo0SjRkL2tsYXNsVnZ6V0kv?=
 =?utf-8?B?aFA2SG9ZZ0NrZkttQTNRL3ZyVDRzejgyZE5rU3crYlNKbFRMcmp1UGtka3gy?=
 =?utf-8?B?ZkhIcFQ2KzBvMnIwTTVyWHc1cEJ4anBGSnp6M3pwSkg1dmhUM1dVRjdQWFFv?=
 =?utf-8?B?ek5sS2h1eFlzbnpuZW1Ec1ZUeW84elp6c0ZURE1jMndXeTIyMzYwVHV3UjFF?=
 =?utf-8?B?SlBNZVg0TlA1LzVNdEpNK3N3WjdBMk1nOE9CK3VBcy8xazlxTlROUEZvcU8y?=
 =?utf-8?B?ZjdvQndMUEpYN29NV1NLaWx0aUpwcG1DR1hLeW15Q2ViSEVRa2JtNGw2OGlt?=
 =?utf-8?B?dTVRb2x4WENZMS9VMzRqVVhZemhvN0d4MnB5VGt3STRTdVBZN0dhOE1PTXB2?=
 =?utf-8?B?cy94QU84VGFCZzhjZXNEbU8zMzN4cTY3YWFuNlFZY1BqQnZjVHlPcEZZWVhG?=
 =?utf-8?B?TnZ1N09hZUUrc3pPRUFlUC9hMk9qQW1ZcHlqbmczemNUN1BDYndqUElWQk5D?=
 =?utf-8?B?Smh6VmFibi9UODV5bkxxNUlGbTNieDRIT1B0OE9ma1NhNEFOYSt4TWZUWFl5?=
 =?utf-8?B?amdReDBjZFZVL3YrNnc0bi9WSkRDTU9MbnhIZjJRSHQwcWV4ZmtiOEw1RW1W?=
 =?utf-8?B?cS8zQU90aVVvdGRMTUI3SUJrd2dwSlEycVgxOU10Z2hwYjFBbWZvaS9kTjFO?=
 =?utf-8?B?RWdHbWJYUkFaTXZtUzFhRUt3UFZMMHVqV0MrdXZIMkd5RGdNQW1iSVhKUlJo?=
 =?utf-8?B?LzFCUXAyd2JXNmJ4aklOUGlPL3NlZEt3ZytCdWxIT0gvMS9zT1JLVWsydjJV?=
 =?utf-8?B?N1NxR0hmdFdwYmZxaXE5MmtTc2RSQ2ltV2J3bWQ1WDQzQ2Z5M3ZNZ21xUVk2?=
 =?utf-8?B?WERUcVpIYVF6NWhZVG5XNHB4c2Y1MytldWJvcnorVDFpMzl4b3p6SGtLZDli?=
 =?utf-8?B?NVhZSG5mK1VESUFFOGY2UjhhVXZGNlJzQkZYcXlCVndteEowdlVUMkNQMUNG?=
 =?utf-8?B?U0hkZTh1MitJTElWdjhNQzNscW8zVThIcUI1Qk92aUI1dlhocnBJR1pybXIx?=
 =?utf-8?B?cXN0Q2twZnBaQkJqbE9jM0Q3WTBhSzFoS05mdXQ0SytCRW9YRE55dEFZSms1?=
 =?utf-8?B?UGJBUjl0c1FDR3FReVZFaGs5djBQdDZ1cDIxdk9HRzlOOW9LQXJNb0NFVlJj?=
 =?utf-8?B?bWFpL2gvQUxOZXBCOHg2bkJUanBOQkNURWkvNXdqQWMwSXJtTTR6WmxGdU1W?=
 =?utf-8?B?TzlRL1dMYkM2cUNWTThGVnRuZDlFamsvc0ZnK1FjOGp6djJ3clVBWm9xTkJB?=
 =?utf-8?B?Skw1c0hRRGg5TDRnSnN3aGNFbWRyZ2tzdXUyMHlqbmhDK3RTT3MzR1I5Q0Q3?=
 =?utf-8?B?SWQ3V0Foa1Q3UUxPeitNN2daV1lrM05DVWw3SUpicGZpTFMra3BYOEFvKzlZ?=
 =?utf-8?B?aGsvcm0zSDNJTGpYWlpmYWhsYXIwd2w4SVdIR1ZvaUE0R2IwVFFxV0M4R1lH?=
 =?utf-8?B?dFA0WE5MMnZFYzRubW1iS3g5T0lCZmtONEJMYTFUODNnSXBWcSt2TllQbUNL?=
 =?utf-8?B?QzFVS2M1eWpGaFhLUjBrZFQ2NGc1bko0OXlPclVoY1Y3WnMxV2N2b3dEdmJI?=
 =?utf-8?B?UGdRU0Z3WXBDT0tIN0htTHYwWmhxcWJ2UVpJQ29iM2wrd0lBKzFxZDdIeW82?=
 =?utf-8?B?Q3ZoTXBDT1picEFIb0l6R25xZHlaVDdVYk5JSFlualhKMU40MHIwYk1oM0Ru?=
 =?utf-8?B?bUlnaEY4SEFoTWVnSnkwb1ZsNFM0bVA0eWdrVUtucG1pd2JIekFZeG9PWFhU?=
 =?utf-8?B?UTJsZUowS2xZOFNSdzR5THZycmw5dit3TlZRVUgxVmtVb3Qwd3FwRk5tdHZ0?=
 =?utf-8?Q?8MgluT9edetVBd6P4GbdRInBr?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 21437f32-6c2c-4261-8d83-08dc8440dd7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 02:48:50.8309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lwliqh4aaelC4DYcqs6m/Q+Y9h7dT56mwTua8tHwiWJopIKQHYOd2qKe0+PaXfaf2hlXbx3Lw7YL3wfBWiltY7WALwynvLB+aPPONBk1lFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_194905_831663_E47AD68B 
X-CRM114-Status: GOOD (  17.48  )
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

> On 03.06.24 23:27, Heinrich Schuchardt wrote:
> On 03.06.24 17:07, matthias.bgg@kernel.org wrote:
> > From: Matthias Brugger <matthias.bgg@gmail.com>
> >
> > Up to now, the describe flash partition layout has some gaps.
> > Use the whole flash chip by getting rid of the gaps.
> >
> > Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> For flashing larger firmware like EDK II it is helpful to maximize the partition sizes.
> Thanks for sending the patch.
> 
> Commit 8384087a ("riscv: dts: starfive: Add QSPI controller node for StarFive
> JH7110 SoC") https://lore.kernel.org/linux-riscv/20230804020254.291239-4-
> william.qiu@starfivetech.com/
> introduced the current layout.
> 
> CCing Starfive's U-Boot reviewers.
> 
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

We added a "reserved-data" partition because the u-boot of VF2 didn't
require a large space and users can use this partition to do something
they want.

Best regards,
Hal

> 
> >
> > ---
> >
> >   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > index 8ff6ea64f0489..37b4c294ffcc5 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > @@ -321,16 +321,13 @@ partitions {
> >   			#size-cells = <1>;
> >
> >   			spl@0 {
> > -				reg = <0x0 0x80000>;
> > +				reg = <0x0 0xf0000>;
> >   			};
> >   			uboot-env@f0000 {
> >   				reg = <0xf0000 0x10000>;
> >   			};
> >   			uboot@100000 {
> > -				reg = <0x100000 0x400000>;
> > -			};
> > -			reserved-data@600000 {
> > -				reg = <0x600000 0xa00000>;
> > +				reg = <0x100000 0xf00000>;
> >   			};
> >   		};
> >   	};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
