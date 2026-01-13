Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935B1CF45D4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 02:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ywn6+Xv+Oo2H35kmzljiHwuOnJTTtgKCF6CB/DjBwCY=; b=JO5wF5NxUNLj8H
	ADzYeJ5Qs2tuE4o9+F+JEfIuLd54BPKE2RfrvR9Dte6VM2XcW9N76/HRfoij49QLkfIbW4guHQpGS
	VoA3SpeG03j5EDURHJhzFTnfHGYBCUTXg6FjRn95j6z6ntuC/KJHOd0LglEvqewUY4kFALqOjpJ+v
	yYbYlJ0uTEpsGBU4dPP3hjv0QK/FZlHsFSrBhRHL6TccdGa0ptSxR4voF9C/TaVLdQ2Pb2p8DRT5T
	0RADBudMMnFmpE/Dzv2fETqkTEuNjru2ebuSzgqmeL6+gK4zl6BvlXLVX4kenLhU3CCedVHnNeLHk
	ie4ZUFqzuiwfpC6T50Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUFw-00000006QtJ-2ffJ;
	Tue, 13 Jan 2026 02:35:41 +0000
Received: from mail-sh0chn02on2111.outbound.protection.partner.outlook.cn ([139.219.146.111] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUFn-00000006QrZ-1bNB
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 02:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLqz8yDnDyG+qjyS5/9k33tmAc1o1H9M3ine0NvpbWjW8nV4jnfmjIotErpmYSCMePZ2djCJo71NwDtMEzVd4lE9y07AgEoyUxdkoFO4j8ADzTAnTPLbvln4NsAq6CsLQ03amYAHuGWjqZxZUrIH2cPdOPdzZnR4i3Ewt6BPaPfLkRn8SQYvFT2THQX5zAEGG55/YEf+DEx+2PvgLqsD597knSw1OHBmTYt8QCTzR/A9yTnXJGUksm9NiRnhtIePtEzvaA62sqlLPnhZJJvBODQFw/CCiF+YLEY6dpFXTcTtqFSbavGQVk/zlOTkJBbybm2VmCgw96d6weROvPDNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqYS1et785goMBrxTVHbdQ4MBEQn2kgM3XGvinwUIbo=;
 b=Z68e+y4SFTreSoFUAo0OEUxmxQ+AzoZWTgI5iCfvhq5cZ3aU8ZoI6AHeDn2D4rLp3SIzJue+sVvwnVk9fMFu/3u0HKpVOxUvlO+HpMujM7FihBSbtaXesCgsnSJIH11IjLN9s7iIP2z34yTCGpgasj2Yp2SvUPrfM9s70/TmpgGTG9SHyYmz0DOkR5dYomleyTTCC3puRvhly8+nuvmFaeHfT42X4bjYIRBKYygi4J8nK6wMnF6F8jPugMP022nM0zgMAMM0OnDEFprhMCu8lDqGsyV+CUrvKC6+EM7WZSw/4xABM7Y0EDxm0XCR/D6/ghkHqopaCPq29xc+KlKE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0505.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 13 Jan
 2026 02:35:16 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%4]) with mapi id 15.20.9388.011; Tue, 13 Jan 2026
 02:35:16 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Rahul Pathak <rahul@summations.net>
CC: "anup@brainfault.org" <anup@brainfault.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "rafael@kernel.org"
	<rafael@kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "jms@oss.tenstorrent.com"
	<jms@oss.tenstorrent.com>, "darshan.prajapati@einfochips.com"
	<darshan.prajapati@einfochips.com>, "charlie@rivosinc.com"
	<charlie@rivosinc.com>, "dfustini@oss.tenstorrent.com"
	<dfustini@oss.tenstorrent.com>, "michal.simek@amd.com"
	<michal.simek@amd.com>, "cyy@cyyself.name" <cyy@cyyself.name>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: RE: [PATCH 4/5] cpufreq: Add cpufreq driver for the RISC-V RPMI
 performance service group
Thread-Topic: [PATCH 4/5] cpufreq: Add cpufreq driver for the RISC-V RPMI
 performance service group
Thread-Index: AQHcfu35VvAr0fQuSkK4e06gnDRDPbVOY/mAgAEIZAA=
Date: Tue, 13 Jan 2026 02:35:16 +0000
Message-ID: <SH0PR01MB0841EF813268269C2AE59372F98E2@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
 <20260106092117.3727152-5-joshua.yeong@starfivetech.com>
 <CABdD5xmVVkQu6rYzF52V-JrsdL=NOQa9N9i8PsMgfaOh3GT-Bg@mail.gmail.com>
In-Reply-To: <CABdD5xmVVkQu6rYzF52V-JrsdL=NOQa9N9i8PsMgfaOh3GT-Bg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0505:EE_
x-ms-office365-filtering-correlation-id: 6cff2058-5f1c-4f64-dc8c-08de524c62d4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|41320700013|7416014|366016|38070700021;
x-microsoft-antispam-message-info: 675CNg5pNURwouEukKvPvnsrLUtR/KOBNAe994CZQghIc3zfnD2B/ZKO8BsDI1U5cg6s986fJsWqiHmGf4+3Sz0JCWC7/cRUgFtyjeq39Htb2me5LmWnEzKqlwDIFB6otDRj9nA+D5NC+7A+8yQ7UZuqyKlKFgK6X4uWI9sk13LvLjabV/5ry4fI7itepscoFPjpPGWcjBt0i8ENDxMcbJR3IwBRGcnI3qbPTWr+88ErGxCYBGqipy+sbXGo3Fzu/dND51bHoD6MAfGIqVusZRgaTKFmHObfOL5p89z6LZQKKDdMGT85jeOx55kDOHcT8hmqpbzyhfYrJ+iWT+tkIsPNFXP//V/5hGd99YyAk6zsxYFH3OGJVHQp34gFRYbwi6NuzHTZuIBl8hdrPouHIE2FUa6D1tO9eBB68MYOP/SPynRxHmLOqC/e4gnOR3r8IHZDKA8uROlzlS1s4uqbi7ypfUTSn87WPKBMShJKfH/DQ/OSN1a7uSgzt+T6VaalclFbp47HdVIKFIepmNciPczOntCj2n5RY0sE+cPf5fmPABzES0AtYrA8Z09xDSSHvCc11oUzTSgxg0UvwhjsQoIwGH8k6yIdE1/Wz8c6Xvc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjRGOEtXNFZOMk1yQy84bzRzTGtpNjI3bzhDWVlFemZLam4xWENSbVJRVXFM?=
 =?utf-8?B?MGk3SDNqTXVZL1NZWTI3V0JQU0FUbnk2Z0NMTXd3OER6SWpjZThWSkVKcXA1?=
 =?utf-8?B?U0RhcExvUDM2ODkwUm0xNlFMV09CMTFoTnZremUxaWdya1NRaHpwSkNZTkI3?=
 =?utf-8?B?c2ZFREljaVpnSmdEQ3NIbmJVMHdKcWZ5aFFjOEx6ZnZBeFVpUDVlL2pKalho?=
 =?utf-8?B?TVRzdzFJS3NOSzM4YlExMThtVC9OY1BGL09PVE9oS21JeUpqMFAzWmpxSnhS?=
 =?utf-8?B?MWRhbkFTWEVBWXZob0FTb1czOENjTzNJMWFaYzluWThOenpzcHFFU2puSjlj?=
 =?utf-8?B?anMzUkpVWkZ0NlVPM2R5MXFGNFM4UGJuVUljWGU3RVU4UXp5Y3loQXVxczhr?=
 =?utf-8?B?NkR4MEdxL1ozZ2tiU051ejcxREQ3TzVuMW9FSlptUHBHVE4yY3lSbU5jMXhi?=
 =?utf-8?B?Wnhpa2ZtbFVpV0dZY00rUUY1Rjh5SDRxTWxRUm1GZmdUZ3FadjhwWi9HeUxx?=
 =?utf-8?B?cVN5YjFwTjBqTk10Nkg0M20rMTAxalRYZS9ud3VITkViZ3JNaU9wbW1Qc1JM?=
 =?utf-8?B?Qm9aaG1jemF2OXFvenBQMU9DZzR0cW9ENlo5NTIrVXhsODc3RWZ5ZUVjUHdD?=
 =?utf-8?B?Q3hxMnpMdjR4MXZHdGJGYWxJdThTaW9pR0pDTDRLcEd4NXRhdXZrNFFOSU1C?=
 =?utf-8?B?YkFzaUZWL1Bxcmpaa3p5MVFPNWQyMHRrY24zem11N21FcndIRHRkbVVzM1A2?=
 =?utf-8?B?UzB1N2hxbDRhbGwweWhMTFdEV3lSdFBhNHZWeUNqMVVFVnlaaHBSbkxNMGpJ?=
 =?utf-8?B?WWhQN3RkNnRENkkwOHpxR09EZTZYMGpoRmF3ZWlyeklPMjNVa2tyNjUxdnBR?=
 =?utf-8?B?VVFzbTNQbkxyVzdqQ0s3U0c2MlZQTFIxK1ErRkhEalNCMnhTeWVlN09nNU8v?=
 =?utf-8?B?VnZTaEU5Y3g0VU9MdXY4RHJ5YXhFeFFkMGI0akd2RVN6anJaMUVQUWVCN0k0?=
 =?utf-8?B?bVpjTWhnT2pKblFMSENFM3g1bVN6WktwUnNzWmVweVJpRExFOUxZMmJmdkYv?=
 =?utf-8?B?RHVNRiszaHQ2TCtqbW9rSVYyVDQ4L0RLOHIxUGoxVW0zZEgycXEvSWtqNElO?=
 =?utf-8?B?clN5N0xOVjdWY0FId3RieXRmZW9UdWUwVURzaUwraG1Ba2dISm9iUk9ZTXV5?=
 =?utf-8?B?d2pKd2hMNUFpS296em1TRk0veXEzU1hTYVVlYlNoQ1FBeXZHak85bEU0eU15?=
 =?utf-8?B?UU4rSW1HTlQ4SjRzNk5kS1B3eGtETGR0VHBpSWd3bjg4dmE5dEFTN0pMTFRt?=
 =?utf-8?B?RzZ0M1kzSGRIV2doSnl3VitpeHgvbXlKTTJxSTVkSlZoSk4yUjd1N09MZTYr?=
 =?utf-8?B?ZFlHNG92a0hxNE1wRmd3MlluZ1pjaUJnS3ZGbE1VZ2NPeHRaa1Y1dlJ3V080?=
 =?utf-8?B?bU5TMFpaTzBBSFVpMHJZRnEyZ2RKOHFqTXJXYVk0anR5TFZPNlhCVDlXRHBz?=
 =?utf-8?B?anYwMlZPNzd1VWZiVU5RKzZIakRNb0lZdkFrWjloSkhoc0NNRjJaNTd6Mmhr?=
 =?utf-8?B?UFFDVnA0Szh6Q0VFSkZGalJUK2hkU0JoQnlWb1QzY2lmaWh4dDdaRzJTbzJT?=
 =?utf-8?B?MWxrUlRNWUhXM1NVU0wxY21kaXVWR1A2K1k1cjVUV1lqSjA0VHladG5FVVI2?=
 =?utf-8?B?RlVZRngyTDM2N25VdVlJTGV6SHMrK1pLdm1mUnBYMXl5M2hZZU5rL3VoZWp2?=
 =?utf-8?B?aGFwMWxzbDdyRi9NaHlnb2I3emZnalVXYnY3Qlc2NGVXK1lSZEN3ZS9aOVBB?=
 =?utf-8?B?YzhRK0JKZ3FPcEl0cFFVbWo3L0ZHWWpvaWIwc1AxU1FmVWNhT1l3cytDVy9V?=
 =?utf-8?B?Y3lzTVVxTVlrdFc4VU10UjUzWU96dVR5SFZrSXlybmRCVWs5ckVXdnIzTGY2?=
 =?utf-8?B?dWJJakcxN2ZkMEZFVDZhdDNDa3puZy9SNDdmeEJlTW4wTzA2RzA1TDdFT1Er?=
 =?utf-8?B?WUowYVF2a1JKNnY5dGZRcDRiV000K0daVzdxRDNPR1hjemdNVldPZDFPalFQ?=
 =?utf-8?B?R0cxOGRTN3NsOTcrNmE5dFBqcFMzendpNWF4S3VVY0JmQ0QwOENUNmc0ZHVm?=
 =?utf-8?B?aFNEd0FQMExFSXk1OWhwNlJtdjcrTUx0TUU4ekZKRG4wc0lZZ1pEOFY1SStS?=
 =?utf-8?B?Ync9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cff2058-5f1c-4f64-dc8c-08de524c62d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 02:35:16.2220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AysfVYtU4RrNWN3zEsUgOMtcaIkGvhIiWPH/1WNDQnrtuntK8u+trao2orRrSHq2ZGvJdtbOyWAnS7tGTOAiaS1WUC/wkWN4aGJgoY6FDmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0505
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_183533_598727_5E026D15 
X-CRM114-Status: GOOD (  17.12  )
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

On Monday, January 12, 2026 6:47 PM, Rahul Pathak <rahul@summations.net> wrote:

> > +
> > +static int rpmi_cpufreq_probe(struct platform_device *pdev) {
> > +       struct device *dev = &pdev->dev;
> > +       struct rpmi_perf *mpxy_perf;
> > +       struct rpmi_ctx *mpxy_ctx;
> > +       int num_domains = 0;
> > +       int ret, i;
> > +
> > +       mpxy_ctx = devm_kzalloc(&pdev->dev, sizeof(*mpxy_ctx), GFP_KERNEL);
> > +       if (!mpxy_ctx)
> > +               return -ENOMEM;
> > +
> > +       /* Setup mailbox client */
> > +       mpxy_ctx->client.dev            = dev;
> > +       mpxy_ctx->client.rx_callback    = NULL;
> > +       mpxy_ctx->client.tx_block       = false;
> > +       mpxy_ctx->client.knows_txdone   = true;
> > +       mpxy_ctx->client.tx_tout        = 0;
> > +
> > +       /* Request mailbox channel */
> > +       mpxy_ctx->chan = mbox_request_channel(&mpxy_ctx->client, 0);
> > +       if (IS_ERR(mpxy_ctx->chan))
> > +               return PTR_ERR(mpxy_ctx->chan);
> > +
> > +       ret = rpmi_cpufreq_attr_setup(dev, mpxy_ctx);
> > +       if (ret) {
> > +               dev_err(dev, "failed to verify RPMI attribute - err:%d\n", ret);
> > +               goto fail_free_channel;
> > +       }
> > +
> > +       /* Get number of performance domain */
> > +       ret = rpmi_perf_get_num_domains(mpxy_ctx, &num_domains);
> > +       if (ret) {
> > +               dev_err(dev, "invalid number of perf domains - err:%d\n", ret);
> > +               goto fail_free_channel;
> > +       }
>
> The domain space in RPMI performance for CPU and Device is not separate and a domain can be either CPU or a Device.
> How the driver will make sure that the domains which are returned are CPU only and not the device.

I think we need to enhance the RPMI spec to include information for types of device.
What do you think?

>
> > +MODULE_DEVICE_TABLE(of, rpmi_cpufreq_of_match);
> > +
> > +static struct platform_driver rpmi_cpufreq_platdrv = {
> > +       .driver = {
> > +               .name = "riscv-rpmi-performance",
> > +               .of_match_table = rpmi_cpufreq_of_match,
> > +       },
> > +       .probe = rpmi_cpufreq_probe,
> > +       .remove = rpmi_cpufreq_remove, };
> > +
> > +module_platform_driver(rpmi_cpufreq_platdrv);
> > +
> > +MODULE_AUTHOR("Joshua Yeong <joshua.yeong@starfivetech.com>");
> > +MODULE_DESCRIPTION("CPUFreq Driver based on SBI MPXY extension");
>
> NIT: CPUFreq driver based on SBI MPXY extension and RPMI protocol   -
> something like this
>
> > +MODULE_LICENSE("GPL");
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
