Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363EC30653
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2H5fH7XJuuBRsKs3D4yHHgyIFM+NbMIxdZkbx/w3gCE=; b=QOMvZO6FklLI6IlrqrBf0Lmrit
	Xwk87fEm10lwJXG1W3LHL80dAYtrsBra/y/EYhSnuV1UBTkHkFBwrdRFXCwepNoWoE6AvhNGIavhZ
	I9jIu95vzh2otClhvDWgz6XNsMMMOlBZH/VN6gRz1U2QPDmYtlWVUvqC8lMYDkWSzG873lSgq97i+
	1oa4lKd92dSuUpiBQc9pKMnDVgz3pEH2QudFeJaJhEEel8Q7N/xEQCAscuwCjD/RgyOSNnPPI9rlt
	ixqqkn0BC13X84hT2xdeFAJibXNLRvmEYOjNAtMgJT54ql9Jk04r+zk+oT4o1vU5lpHDlyhvooB+T
	Fmj+TYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmNo-00000009wVH-1xIg;
	Thu, 27 Jun 2024 10:29:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmNa-00000009wR7-2iVi
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Jun 2024 10:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uGQijwsUKmQcc+X0Df3FQaPFW5dPslKK3Eblr0nCLEw=; b=fy8lHprGgs7o94SP7Rz3v3rxAv
	AfhWqdgo1EhPVYxhHRV4cYo9kBH01alS9War+c85dhvLOr2Dhbjf+xh/x8+T+1sE/zzio4osAAsqM
	zSnbqjEyG7DU0Ub+tHCHPwNDewXMbwPFJ39l6B8B+Ao2Di74lUwOQHATK1Wkzyhlm2LCqocjEmZXH
	YUkBUnWaiVc4ctx30DmE3Y5F9wxPExXm3oKNz+nq7wlqOCc5v/na1THp5Dq6f/9PaF3dIL4Nvhh4C
	L06TB9nUsC7IluVX/UdgsQutf7TXDV/JsB3il4PMS6R83ufXpZEfE5Y5em5ybHYXmV4A9CBIN+i0Z
	tMMSC65g==;
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmLd-00000008pku-0Zic
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 10:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVR3dXDRvM+lpkNM6VPf90erxnHWb6qEWsAW2fwwd3RDPOWwiWFUW1ws2dK7S1oyKN8+fxTldY9lpLeFY18NV4pUn+N5OpaizqCKa1XCmCOW6vAWGDfgklHf+2LkiOOWz8B7/ko9NwIHZ5T3qMYA/x7Y6gpdMP7YYdwvjLKgqKxowc/e4XhBJv+n8rqIgrC33u6aUrQuYxgGmAa7OFR/AZFnN0p8woYXjvqLbEhBjBt2R+PNkIL3fX43wqLMGL5um+9uBg/BL334lS5dNg6CMu1phkJRgUMkawO8wm6Dh+IUekX32zcVfT5S6cBmc3mKrMLIy83CzH5tROROJFOKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGQijwsUKmQcc+X0Df3FQaPFW5dPslKK3Eblr0nCLEw=;
 b=M9lDjdmSopyIqHpmusxqNNRd20GUyIks2JI1EckWMb36XT3CAhZyWjpE9M+dBWGTPFdAjphMJVOwdMEg6rOSVZUKXthtxl6tt0O3oOlZ/OHgDZMFD5v7xx39U+9dX9eAkpSHnv6cPuNPR4NcoeSbNT8kaKH2ogt/SEO1Mo4vVFdaOVwzKnLo5Tj8ElgmhgCIifggw0NEwitESzFL7JEjSb6U8V1OcXx4slAs3/ihf6R2k6cGhmRKMJ4ai2Pml13e/+kOi11kc+sIjk4rMnDKuWpOecZOcHIcj7U4DkrAaDYXl+sJoPix6Onb/m0jDFfkkp98dAbJxAgLhkwEa11Pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGQijwsUKmQcc+X0Df3FQaPFW5dPslKK3Eblr0nCLEw=;
 b=Iz4NEW8GVTJHq0McM622SJmhwP+yF6ReuTkm4C35SuWHAz3zP/aHIlST+lhrHAwX/goj4M0YVzvbJF2IcZxau0hKXdlvo7EQIiO0JjdWbj55vv62AWHshtOmeb2ElgpcPP2Y4K9DGYHwIGXqxlNhafpAroJr2WhARj1grwJXYWMt2XfXc9fyKgcFeE8Zbw2avg/cxdKxfTDPfVsNFmdkYNnxeNzk0TUAF7R3KZrZ4OSaHS706CaI8RVWHIh5Dqi+QIMJVikaMU9AKENYb6nez5dnqdnuDboVD0EJehuBDfDT3Ti0jM30NjmVXkd53w8geM0eP57z5k3YXxLjbPa9eA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB2033.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 10:26:55 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 10:26:55 +0000
Message-ID: <MA0P287MB2822C5A4682AE9EA6AB3B9E4FED72@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 27 Jun 2024 18:26:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>
References: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [frVb8Y0GZU91gVkt3KE1nnhhKncG4jGw]
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <c8c2a2e9-6732-4b8b-b885-11bd4f1658b4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB2033:EE_
X-MS-Office365-Filtering-Correlation-Id: deea45d8-a615-4f06-f5ec-08dc9693a953
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|1602099012|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info: f4jKOJU3RdoI292FPtmiG5Oqhr70eSX9OIRYDc1uLr39aX9ZljvZOij+haSt4WPuL6aBDJDU/aQbINQOuiC3M+d+IeYCwwLaxhVJLUO+fZ4eYc02KnhGiwax52Jv4uebFe9/uhLHm6yZ5s8Vl3fXVABzwzSbYbN75pawKTjMm141wNPvzmOsEWjSh+S/7dF1NWNLZmCyBpSLumsJvnxOrqTuvXbepCVa77GD1Gl1Vx2ScfX4Zvnqxr+C1l9ZBV5Fo16J9UwkBd+firAUXid08wb6NaZGOrW3F4pi0rmkRt6RJVsyPDKHF1yUj2NTVQE6ANgJPGOGYzs6AZHIQkzMtoxV83799zWZO5Q32mOLOQP1buOCmRz4imphO97aqgcgzXRQhoez8SJXtuKgPCf+THzwG7HaUWU3ZVToz9gdNuueKotEdb7yiIMaNnOnU2fI/wO/oUrg8Q/oiDfUB6veWNYXOD0OfEMEs5oelttNOpxMxH2FPEJfsK5qFEDTNFV9na2uaSG0DYDlNst09FIIXfIo8VEPcqP0ZdXEtGMbAfU5Qh1hftW0rB3hif++cCpqW6nr3nHqA3BqvBQPMbkD7u83rrAqcrIKVirhAQvMcsrAdOEl7Bpl+H3OYyNvtFGUKUJ7OLS6J6QUgzPHYwAmXntRWQxhCTNE0g8L/jG5D/zw2MzzbBgrS3+Q4ADqYwcbAxabXgRfJXCU+hKniZpqfw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VksrRk91S2VvUmd0YkZWSi9uMHFKL3pka1FETGJkVk5UcDRUL3gvOFJEK0pt?=
 =?utf-8?B?MzIvMi8vbkdXSzFXQ1lUQ1oreTlWbGd0NkZuZ0sxajdKVE8zK1RLcFJ6M2FF?=
 =?utf-8?B?Rzh5dXk2NVdId1JIQ0FoVzk2eWQ3K2lWZjdwcGE4RGxPN0ozb05TTEdzZVpl?=
 =?utf-8?B?K1R1eEgwcVFvS1FDbXFaR0h0bXkxM0NxKzV0N0grazY5TWFoNUhTZkg1ZWxV?=
 =?utf-8?B?QjFMdFdjNHJxU3ozRHBTRVpZSmQzWmlqNllWaVhRcGJyanQzQWtZa0oyeTds?=
 =?utf-8?B?K1pBU212WTBTNGhiQkM5a0M1WkdXM2REWHMxREQ4Z0JVb0hNUjBmVlJFNW1D?=
 =?utf-8?B?cFJuMU5McFRRTjlMa09RQW1WQ290MFVOY0tvbDZ0dEdYYWswaGE1a01vRnBO?=
 =?utf-8?B?ODVHT0VOVFpCRE5nNjNHMzl0RWJsOW1Icmg1QnB0UG8wZjFZUFZmRHhabm9T?=
 =?utf-8?B?RGVhUzFpdFJXM3FwcDZVN3V0NXhIUnY5Ti9xYnN2WDNTaUJWTjNnWUZURDlP?=
 =?utf-8?B?NnVuRXROOXNBZms1MGRCQlYycTB5WEJnL0x0RTRscXFoZnNTdWQwS3VSZWd0?=
 =?utf-8?B?aGU2SS9NVnJLc3lHK2Z3SGxQcEpqMjNqZGpoMUY4bXJjWk5VSmJyckxzdVNW?=
 =?utf-8?B?ekY4OGxkZmFndi9zTVdCaFFibDF5TjY3eDQ4WGRJZmF3dVc3OTVRTkdCS3lJ?=
 =?utf-8?B?MDAzQVhNYTBCcmdtc1VtZEJHalArbEZ6a2ZPcUJva0cyc3BZWlBmT3EycVh5?=
 =?utf-8?B?L0NNRE90QURza29sQUUxUFdDQzBqc3dsU1lNY3ZIQ1dHMktsd3ZRT20xRTRN?=
 =?utf-8?B?a2tZNkl6ak9QTlh6NnZsMWkyME93OEVPOFlPQ2VBeFlWYU01ak5rTmgyR0pv?=
 =?utf-8?B?ZHZ6TzdZQTg1Zm5JYUpwYWdZQ2JaTDFaQnF0eFdPU3VmR1k4K05TOEpXRjVl?=
 =?utf-8?B?Tk9BSy9Yai9oWWxHNmdURVFVNWxOQ0o1Q0JkTERnWWdNdlNBYzBxS0dlcStp?=
 =?utf-8?B?blJ4NDlha2U1a1M5VExUSGZzMHRuV0l2d01vSHZUK1hvN3VHNXFSbHZPUVR3?=
 =?utf-8?B?R2NlcGU1WnJVYVllUmY1SEpydDV2RjBNTzByRVhZcFdTeUtjTHozdlNpQzcr?=
 =?utf-8?B?ZjNCWE1POWNJWjE2VlE0cS9oanZOS3FvR3FPU0s4ZmNQSHFXNE1xR3crYWFw?=
 =?utf-8?B?UzBSR1lHYkthbjA5WU1oMHV0TU9iK3p2OTNESFJSNHF3ZTROdWpBdzV0cFpx?=
 =?utf-8?B?RGFEWURCcG1SNW5ncDRGU09CZDZXR3U3d0VGbXlPa0J1dHZhOXo3RmxJN05i?=
 =?utf-8?B?OVZPWlAzVmR0K0lQdE9uTzZxaUk2YWU5cE5ZaUprMXdEbjM5Qy91ZDJkZ1ZP?=
 =?utf-8?B?dm5sS2xNVWViSzBlUGIvNFNaSzlBUjNFQUZ3MFNid1paNWFNOHl2MjBJV2tp?=
 =?utf-8?B?Q0JhQUVOSWYydlF5RS9Pd1dEc3g4U0tKdm5WWXdrenlMZUNHNFNHUC9CY3RC?=
 =?utf-8?B?WGpobWZzRFRsTDF4akltQ2JGZFZEb1EvSGdiWUZXWThTNnBWc05QTDRqTmh4?=
 =?utf-8?B?aWs1Z2xES29LMjljU3hodWpqL0EwMnNXTW9wQVFCL3lRNDJlVnVDTXNwcVVq?=
 =?utf-8?B?TEpNKzZ2SjRtTnd4bnV6UnVneGs3aGFWdVdmdHBhRjJUaCsxeFNOWVU3VmRr?=
 =?utf-8?Q?/ziYCfr13WXb7b2WUoYH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deea45d8-a615-4f06-f5ec-08dc9693a953
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 10:26:54.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_112751_508298_4BFC8AA5 
X-CRM114-Status: GOOD (  14.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGnvvIwgU3RlcGhlbu+8jAoKSXMgaXQgb2sgZm9yIHlvdSB0byBwdWxsIHRoaXMgcGF0Y2hzZXTv
vJ8gSSByZWFkbGx5IGhvcGUgd2UgY2FuIGdldCB0aGlzIAppbiB2Ni4xMS4KClRoYW5rcywKCkNo
ZW4uCgoKT24gMjAyNC82LzE0IDE1OjI4LCBDaGVuIFdhbmcgd3JvdGU6Cj4gSGV5LCBTdGVwaGVu
LAo+Cj4gUGxlYXNlIHB1bGwgY2xvY2sgY2hhbmdlcyBmb3IgUklTQy1WL1NvcGhnby9TRzIwNDIu
Cj4KPiBGb3IgZHRzIHBhcnQsIEkgd2lsbCBoYW5kbGUgaXQgYXQgbXkgc2lkZS4KPgo+IEkgc2Vu
ZCB0aGlzIFBSIGp1c3Qgd2FudCB0byBleHBlZGl0ZSBwYXRjaGVzIGZvciB0aGlzIGNsb2NrIGRy
aXZlci4gCj4gVGhlIHBhdGNoZXMgaGF2ZSBnb25lIHRocm91Z2ggMTYgcm91bmRzIG9mIHJldmll
dyBbMV0sIGFuZCBJIGhhdmUgCj4gY2FyZWZ1bGx5IGNoZWNrZWQgYW5kIHJldmlzZWQgYWxsIG9m
IHRoZW0gYmFzZWQgb24gZXZlcnlvbmUncyBjb21tZW50cy4KPgo+IExpbms6IAo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2NvdmVyLjE3MTc2NjE3OTguZ2l0LnVuaWNvcm5f
d2FuZ0BvdXRsb29rLmNvbS8gCj4gWzFdCj4KPiBUaGFua3MsCj4gQ2hlbi4KPgo+IFRoZSBmb2xs
b3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgCj4gMTYxM2U2MDRkZjBjZDM1OWNmMmE3ZmJkOWJl
N2EwYmNmYWNmYWJkMDoKPgo+IMKgIExpbnV4IDYuMTAtcmMxICgyMDI0LTA1LTI2IDE1OjIwOjEy
IC0wNzAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiDC
oCBodHRwczovL2dpdGh1Yi5jb20vc29waGdvL2xpbnV4LmdpdCB0YWdzL3Jpc2N2LXNnMjA0Mi1j
bGstZm9yLXY2LjExCj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNDhjZjdlMDEz
ODZlN2UzNWVhMTIyNTViYzQwMWJkZDQ4NGMzNGU3ZDoKPgo+IMKgIGNsazogc29waGdvOiBBZGQg
U0cyMDQyIGNsb2NrIGRyaXZlciAoMjAyNC0wNi0xNCAxNDo0OTo0MCArMDgwMCkKPgo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiBSSVNDLVYgU0cyMDQyIGNsb2NrIGRyaXZlciBjaGFuZ2VzIGZvciB2Ni4xMQo+Cj4gU29w
aGdvOgo+IEFkZGVkIGNsb2NrIHN1cHBvcnQgZm9yIHNnMjA0Mgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQ2hlbiBX
YW5nICg0KToKPiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiBjbG9jazogc29waGdvOiBhZGQgcGxs
IGNsb2NrcyBmb3IgU0cyMDQyCj4gwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogY2xvY2s6IHNvcGhn
bzogYWRkIFJQIGdhdGUgY2xvY2tzIGZvciBTRzIwNDIKPiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdz
OiBjbG9jazogc29waGdvOiBhZGQgY2xrZ2VuIGZvciBTRzIwNDIKPiDCoMKgwqDCoMKgIGNsazog
c29waGdvOiBBZGQgU0cyMDQyIGNsb2NrIGRyaXZlcgo+Cj4gwqBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1jbGtnZW4ueWFtbCB8wqDCoCAKPiA2
MSArKysrKwo+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhn
byxzZzIwNDItcGxsLnlhbWwgfMKgwqAgNTMgCj4gKysrKwo+IMKgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItcnBnYXRlLnlhbWwgfMKgwqAgCj4g
NDkgKysrKwo+IMKgZHJpdmVycy9jbGsvc29waGdvL0tjb25maWcgfMKgwqAgMjggKysrCj4gwqBk
cml2ZXJzL2Nsay9zb3BoZ28vTWFrZWZpbGUgfMKgwqDCoCA0ICsKPiDCoGRyaXZlcnMvY2xrL3Nv
cGhnby9jbGstc2cyMDQyLWNsa2dlbi5jIHwgMTE1MiAKPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiDCoGRyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cyMDQyLXBsbC5jIHzCoCA1NzAgCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gwqBkcml2ZXJzL2Ns
ay9zb3BoZ28vY2xrLXNnMjA0Mi1ycGdhdGUuYyB8wqAgMjkxICsrKysrKysrKysrKysrKysrKysr
Kwo+IMKgZHJpdmVycy9jbGsvc29waGdvL2Nsay1zZzIwNDIuaCB8wqDCoCAxOCArKwo+IMKgaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLWNsa2dlbi5oIHzCoCAxMTEgKysr
KysrKysKPiDCoGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1wbGwuaCB8
wqDCoCAxNCArKwo+IMKgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJw
Z2F0ZS5oIHzCoMKgIDU4ICsrKysrCj4gwqAxMiBmaWxlcyBjaGFuZ2VkLCAyNDA5IGluc2VydGlv
bnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCAKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1jbGtnZW4ueWFtbAo+IMKgY3JlYXRlIG1vZGUg
MTAwNjQ0IAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zb3BoZ28s
c2cyMDQyLXBsbC55YW1sCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgCj4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItcnBnYXRlLnlhbWwKPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0Mi1jbGtnZW4uYwo+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cyMDQyLXBsbC5j
Cj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29waGdvL2Nsay1zZzIwNDItcnBn
YXRlLmMKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0
Mi5oCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3Bo
Z28sc2cyMDQyLWNsa2dlbi5oCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5k
aW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC5oCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS5oCj4KPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
