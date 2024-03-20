Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49988CD11DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=As1YlE9M6WzWSsLPasCAnGP4Orw7pacGcR1pHRdvfAQ=; b=EJyaEJONTb1ErL
	qv6fCLX5Dkcqq2GEIxmK9KAp2bEiGpAxI0REOCWFBbxeBELVvq5NlMowoNZpImBIwDW58zfEIVhXe
	H6sJeecRBZxvbhGzQHxQRbbsFiNzWf5keysK7+gBgnQ13gPOt50urq3khk1Sfqa4+sjhbJOBY8nwt
	bl1i6zAwcYN6YJv8UznfiJisQfHPpFAfFI2QxIU6t2BssUJLEvAaYmO5jSGZqdg6f+rwtbeX2pg1k
	nmGmrl0y8ebtvNNQIDsyBOYHgFG7GbT3wG9+IxNEh+EQ3uuS/Dcmg+fORgIjU0TsIzlmrcbH0oX8i
	iy968hdwWLepZR8JpZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrXR-0000000GFFG-2tIe;
	Wed, 20 Mar 2024 08:43:09 +0000
Received: from mail-bjschn02on20720.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::720] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrXN-0000000GF8z-2AUk
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 08:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggw3bdGgUmdVycNZgnoGoDQ0igZaqN8k1xvaU71xIHAtLwKuOoaG8WC192Rz5C9IX/bCsundgZH5ZJEF/w0Ld7jozd9chEOgYhCPo85Jq4aWrL5i6dbZk6Ts9qpgw9EtUgMntDDlFN6vOp+sHuZdT62EkB6KyWA4ZFORuteG2RYojp5ZWphSE3RASLklK3BDT2HjNUPXZlVd/OJe001d4dYUkWTfTGmOJdLXjS9ZK6Kb3xvdF9HUP4yoshFOBqvTgD2tMnYm+l1YB/oIIb9qjIbOGkbLjA+CbB3Z9JGZpRMYHpN4ZaJ2BSh1U1qs7bO3Dqk8nLLZfjsOVtl3rm0D+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BL16nXSoOK/jp0XLz3NT7aQkbt+ODj92ICQPrGSflJo=;
 b=ZV0BWlWn5FtBuhIqkxuPU9oZW+OIfGJTZ+IS5p36vjWaMmRDN2NPrrNjjLBP5/oRAlYj9qvoy87TOX3O6sQ9aDp9uRKsjzLGpWiyhRfv5Mr4PKHjncjKGlTy1Y08uXJvQJPjPgP/8uCS9n6zB81txJUN0H9FqVXJ0qvKZtWpRzXcsd1blgAHjn8+8ZTgE1mPXHFJbfZbmydkFloBXtVH0OjAO0Z6YCsi0BbToyHU+tvYExyYKCsMf60xRizYvRBQHZ74nIRorOpsr2fNoDmSYyQhifWKBdq/lPxGF0N5anKLQdXwtdlqfcGyoMp4pW/n0YuJcHYaSk1TheLfu0CCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::13) by ZQ0PR01MB1205.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Wed, 20 Mar
 2024 08:42:43 +0000
Received: from ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 ([fe80::851a:37c6:7c9c:fca1]) by
 ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn ([fe80::851a:37c6:7c9c:fca1%6])
 with mapi id 15.20.7409.010; Wed, 20 Mar 2024 08:42:43 +0000
From: Kevin Xie <kevin.xie@starfivetech.com>
To: Bo Gan <ganboing@gmail.com>, Keith Busch <kbusch@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Minda Chen <minda.chen@starfivetech.com>, Conor Dooley
	<conor@kernel.org>, "kw@linux.com" <kw@linux.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "daire.mcnamara@microchip.com"
	<daire.mcnamara@microchip.com>, "emil.renner.berthing@canonical.com"
	<emil.renner.berthing@canonical.com>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
 workaround to host drivers.
Thread-Topic: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
 workaround to host drivers.
Thread-Index: AQHaaWi+d9assvQENEqJ5rz8wQxEZrEhb4yAgAZ7cgCAAW1+gIANQI1QgAAJLICACbbhAIAAGT6A
Date: Wed, 20 Mar 2024 08:42:43 +0000
Message-ID: <ZQ0PR01MB0981DB4002BAECB38DAF0AE18233A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
References: <ZeCd+xqE6x2ZFtJN@lpieralisi>
 <mhng-87e7ef5a-d60b-4057-960d-41bc901b6c7f@palmer-ri-x1c9>
 <ZedAn8IC+Mpm4Sqz@lpieralisi>
 <ZQ0PR01MB0981BC562E837B232B419AC28229A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
 <ZfJmMcs2UThVSC4v@kbusch-mbp>
 <16a1e6c6-2e2f-08e5-8da0-1462cec57e1f@gmail.com>
In-Reply-To: <16a1e6c6-2e2f-08e5-8da0-1462cec57e1f@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB0981:EE_|ZQ0PR01MB1205:EE_
x-ms-office365-filtering-correlation-id: 556f4601-3703-4b3c-bb46-08dc48b9b592
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ExIr/q1UgPIWffRBleam6lVXiP1wHfUTxFklInCrGOVrQuvXoTflXFWCX366u0fhNVNeaZFvTowI+AmbBqey0OYxqaMovrU6kYsnRKvqkQdF4z052dx52buZIhPiyKeThofDkvaL+VcIjckHOfk6Lcf1o7Zwmg3CiNtC+0hZto1rFhU8KW/7UHHd6dKYaZ1m0iAAAosCPITEcZivYyywSFi19TzDx5Ri6fdNuLzwLhUH7T/PfKvpvpUYLmFrTOq/ySpnuP7G99SB8KLAiuhBoDSABSmp+OJ+qbFMo4oDpZZvpw5XnU6rYbElyxcJIIwOrMLpo4t7ZwuWfqgoS72DCljdtVIV5iPogMgerVkf/a9bHuPFzAhWsm/Kpv+/u2+jxqxCZjpwSJF4y7gJ2FqrET34XjzekFWjAs8b0rX+ePE2hdzPiKtUiidAQaYEulf1ntyzQjDOA7Gfjd2XC0yDdgHjegg0nh70KwL9CN7vDg9WiVKdyMLSC/o/dTdkZHmEA/16FBqFehGqp1g5Ow6xTzhDZXk5I38d8XMbGCrbZLRDk58s8Jeu4eZJk1RM7Xg8Po8hM/a+fdmOW7pIax7Bbkb86ylolTLKBtyQgiy/hi1fDOLDMVvpTEpL60kE//ke
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R01ldk1NZlZ6U0dzNWlPY01oeCtaMERNQWhNbUZuQjBqQURkNTY5TTVyTVJo?=
 =?utf-8?B?OExRcGppdldBODdJZWZRbExjOW04RTFFVEd5NGUwSDl1RWR5RkVJN0V0Q0dD?=
 =?utf-8?B?T3NsbDRocy9tWWUyUXREUlVWcitLRlhtV3c4a3JCb2pJeEZQeVA1cUUxbGJ2?=
 =?utf-8?B?aitsYkcyVlhrOUIwNW9xN3dNNkNJbkRUSWtBOXdya1l6dlE3SlF0Y3IrWVNs?=
 =?utf-8?B?YVFyeWdmUlNvRXJGUUwvZlhVU1JNU1p6S2Y3OXNUQ0Z5VXhySEplbHcxTTNa?=
 =?utf-8?B?ZHIzSk9xY2V3YXo5b0lHZzdJYU9QMlpxREtpeFZVRkxhdlJLWVF5YTZxMjhP?=
 =?utf-8?B?d1lTUzdyMWcyeGVXVStjU04va0dqT3hqaTZRRzFhS3J2TlluRzloMFFDWjMw?=
 =?utf-8?B?d29Jc1JRMnVJMElLWnBLM1Z5OHpOeUtlbFUrMGFpQnNEODlVR3Z4TjlPTzM3?=
 =?utf-8?B?dWhOTVFWN3dFZEZ4bTE5QXRJRCt5NVRFd3hvQzlDZWNERFYxWmpyNUlvNCtv?=
 =?utf-8?B?MkhIOXFJc1d6b3h0aDduTTdOaEpFd2dOY1I5RC8wMjc3aVVCbXRVUVFuRDNa?=
 =?utf-8?B?aExaWGk5cVpGa2N4Z25mWCtzNnNJT1QrWWkwTE0zODgwK1JoVkhjTUMwblV0?=
 =?utf-8?B?V3c1WWdSWWRTQTFUdEVjRXpyU0J1bldYZ2R4MDBNUDJmUk9QRXNzamFKZTVR?=
 =?utf-8?B?aFNFQlJPV3MrUXAxenRNRXdTRy9VUytiSldmVG9ERlpOdmFNQ2QvbERJQlha?=
 =?utf-8?B?bHdTczkzR0pEUjEwbHZKOWE4cjJGUlJ4dUJkVEp3a1Nld24wUWJQMDdiNXN5?=
 =?utf-8?B?SXZzdEJZM2JrMEZiUUJJeTMxYmZxMXRvN1NjOXVSMHloWDdWMWNYNVZQODRF?=
 =?utf-8?B?ci9ISTZJSG1tNkFsL1c1SDZFRkFvQ3d4QVp6MVFOSnhVdlNjMG43VnFsekFa?=
 =?utf-8?B?ZUNOS0dITk9PaStWSDZobUhJOVhyYmZCMTlYOWVpYWdJdjJPM0IxZm94dk4v?=
 =?utf-8?B?M3daeWhOR0VKS1R0UG1SRm14SHpwVEQ1cnlxV0NFMDF3WktHblhtVGIyblFn?=
 =?utf-8?B?REp2RXZESVRNUitpZTZXMU1NQzNaVGJXenRIQkg2Ync3TmRvLzJ2R0J3NWRV?=
 =?utf-8?B?ZTM3dG5XMWQyL0xJOEVsM2tXRVprYWowVC9OdCtFNjdhNkFLNERXWGFaRGtx?=
 =?utf-8?B?TUJZVk9nMGdoQy84NVFCUzQxSkxCNVNZcW1JNmU1Z2REVEp1dGlDaEJrZU5i?=
 =?utf-8?B?TzVzY3dJZlZGemtyczV0Y2pEYzEveTJWOXZhd1k5K2RNcnNWNXhkajk3VmZh?=
 =?utf-8?B?dEF0RmRueHM4UDhVMThYS0pmSCtXQUlLd3hmZFMvN1ZVdU9pZ1VHY2YzMndQ?=
 =?utf-8?B?d3lRM21US3pXOHpLUE5mL0dYK1BHQ3lMdGY4SGE1WCtHMmVJL0V3QlF6MzZG?=
 =?utf-8?B?YUZsU3VCN3I1bmFKTDJUTVJuOWp5YkpKblY2dGtzWEVhNXFnNUZ2NUZNaVpT?=
 =?utf-8?B?MHNOdlhGNzhLYk85UUdoQ0RBRnJ1dmNzT2ZldHZsN3I1dlRmQ09rM2thbW1B?=
 =?utf-8?B?azYxVm44K09KbXgwcERNUjFJU1ZKK3dMdm8rYUMzeGVhMUQzOTNTU3BlVzVr?=
 =?utf-8?B?Yk9iYWdZN3pkR2hQbzhjblhsRlJ3aFhsVm5xcjBkQ3RaOUdLcTFnWkx3UTQ4?=
 =?utf-8?B?MjNPek9YU04rS1VuM3EwQzUzd1BjQWZkMGpydGtDcXE4aWo0TnJ0SWxSc0w1?=
 =?utf-8?B?cU5GN0ZxZGEveGxKU2lSOXBYVjgxT0JVL0hNeXdDNTRjQU9CcnJGMC9oSXJa?=
 =?utf-8?B?ZWFUb0JEdis0WWwxQ25PbWlPL0VTWXY2T1h0SGkxSDFZSkMwN082QWlLTlU0?=
 =?utf-8?B?aGlLZjJJaVdzUWRCQllxUkZ6SnF4bE5IaDVVZEZHSklpMDhTenczekRiMTRj?=
 =?utf-8?B?OXlobzVadzlheDdHRWRYNDIwRFBVakhraDFPdzBMZXIvUzMvcmUxVU9IaXpS?=
 =?utf-8?B?cDc1ZUVvTThRVmdsR2hMcE5sMnFiZ0R0dHowRXl3SkVUaFYxR1pZa242VndP?=
 =?utf-8?B?bzRtUHZ1SExXT2FHbHJyRGlsV2R4RXFOM1BJRzNZUWF3cjFBVzByUTcrN3VZ?=
 =?utf-8?Q?65FIdXWGcaPvXruG1bXAsqr60?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 556f4601-3703-4b3c-bb46-08dc48b9b592
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 08:42:43.1910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUhNBFrbEs1HXbNNQOctLpv5ROW1KWKfJyAP2JJRHo4L1gCATo9y7GIEd0s+2WczHjEmt8HGCezWdACwT40qrSSSJ/5aSPp6IPkQvEwrefk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_014305_914473_F1CA4123 
X-CRM114-Status: GOOD (  35.06  )
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

> On 3/13/24 7:51 PM, Keith Busch wrote:
> > On Thu, Mar 14, 2024 at 02:18:38AM +0000, Kevin Xie wrote:
> >>> Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
> >>> workaround to host drivers.
> >>>
> >>> On Mon, Mar 04, 2024 at 10:08:06AM -0800, Palmer Dabbelt wrote:
> >>>> On Thu, 29 Feb 2024 07:08:43 PST (-0800), lpieralisi@kernel.org wrote:
> >>>>> On Tue, Feb 27, 2024 at 06:35:21PM +0800, Minda Chen wrote:
> >>>>>> From: Kevin Xie <kevin.xie@starfivetech.com>
> >>>>>>
> >>>>>> As the Starfive JH7110 hardware can't keep two inbound post write
> >>>>>> in order all the time, such as MSI messages and NVMe completions.
> >>>>>> If the NVMe completion update later than the MSI, an NVMe IRQ
> >>>>>> handle
> >>> will miss.
> >>>>>
> >>>>> Please explain what the problem is and what "NVMe completions"
> >>>>> means given that you are talking about posted writes.
> 
> Echoing Keith here. Why are you treating NVMe completions + MSI as a special
> case?
> What's special about this combination other than two posted writes? I own
> JH7110 visionfive 2 boards myself, and if I'm not mistaken, there are two
> identical PCIe controllers in JH7110. The first one connects the onboard USB
> controller of vf2, which also enables MSI interrupts. How come this exact
> problem not affecting the USB controller? The commit message from Minda
> strongly suggests it does, and also for R8169 NIC. Thus, why would you suggest
> the problem is confined to NVMe?
> 
> Bo
> 

Hi, Bo, 
Yes, we have two PCIe controller in JH7110 SoC, and the USB hub & NIC over
PCIe work fine no matter we apply this patch or not.

Let me explain in detail about the origin of this patch:
As described in the title, we fixed the timeout issue by a workaround in NVMe
driver, that may affects all other platforms. Thus, we wanted to offload the
workaround from NVMe driver to our PCIe controller platform driver.
After finished the offload patch, we wanted to test if it does harm to the other
PCIe devices, so you can see we tested with R8169 NIC in description.

MSI and NVMe completion are two inbound post requests from NVMe device
to JH7110.
We made the mistake of generalizing both of them as " two inbound post write", 
because we had been investigating the issue in the direction of inbound ordering.

Actually, the phenomenon of this problem is:
"JH7110 have a small probability of not getting the updated NVMe completion 
pending status in NVMe MSI handler, and we can get one after 1 to 3us delay."
Thus, that may related to the ordering, cache consistency or other reasons.
This issue is still under investigation.
 
> >>
> >> Sorry, we made a casual conclusion here.
> >> Not any two of inbound post requests can`t be kept in order in JH7110
> >> SoC, the only one case we found is NVMe completions with MSI interrupts.
> >> To be more precise, they are the pending status in nvme_completion
> >> struct and nvme_irq handler in nvme/host/pci.c.
> >>
> >> We have shown the original workaround patch before:
> >>
> https://lore.kernel.org/lkml/CAJM55Z9HtBSyCq7rDEDFdw644pOWCKJfPqhmi3
> S
> >> D1x6p3g2SLQ@mail.gmail.com/ We put it in our github branch and works
> >> fine for a long time.
> >> Looking forward to better advices from someone familiar with NVMe
> drivers.
> >
> > So this platform treats strictly ordered writes the same as if relaxed
> > ordering was enabled? I am not sure if we could reasonably work around
> > such behavior. An arbitrary delay is likely too long for most cases,
> > and too short for the worst case.
> >
> > I suppose we could quirk a non-posted transaction in the interrupt
> > handler to force flush pending memory updates, but that will
> > noticeably harm your nvme performance. Maybe if you constrain such
> > behavior to the spurious IRQ_NONE condition, then it might be okay? I don't
> know.
> >
> 
> Also copied Keith's latest reply below, and I also have the same doubt.
> 

Hi, Keith, sorry for the late reply.
We have tried to add a dummy non-post request( config read ) in the handler,
but it doesn't help.
Besides, we tried to add the mb() before checking the NVMe completion, 
and it doesn't help too.

> > Hm, that may not be good enough: if nvme completions can be reordered
> > with their msi's, then I assume data may reorder with their completion.
> > Your application will inevitably see stale and corrupted data, so it
> > sounds like you need some kind of barrier per completion. Ouch!

If we do not apply the patch, we might get the timeout warnings and waste
some time, the problem seems to be less serious than you described.
After applying the workaround, we can do tasks with NVMe SSD normally,
such as boot up, hibernation and saving data.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
