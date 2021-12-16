Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B92AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjUmz5sBKjizhpkErBrMdRjByly2svssOfvtq4ucVNA=; b=Zymp87ArWrdY/K
	oK3+0HuQsCAXK1lLeNrHygrH3VWFSNUXiLO3bz/yvdM0K24rgKtkZSfZ+gHzJ1xGySgTGSl5RyQr7
	8O1VCeCL6d2kLP6B10brG5ZXmu56Nsor7fMRTIp8nr0qF6cPfQDtmvcSKPL2p/yoHUmJwJaoznJZ9
	wvMV1Fy4F1R9qXD4n2nHDRAymDAofxOwmrV1NzUSjfmfUcK/UEQ8TBwvEGO8WL0N6kS2vG/jbe6yn
	/Ycq4ygLZ+Bda8migENSJfI3ez8/s4h0loy9uHxxnNGMtym6D/4SpPLgL7p8aVG2oZ1ctHACvMvVI
	ZrVuLRwIzrL7vNcj2w0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxry3-006D8S-DT; Thu, 16 Dec 2021 14:42:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrxy-006D3i-Ho
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 14:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639665763; x=1671201763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9uYF3W5ZcM9cdkgJbwNre6f3OTO7R8Irsrrx+e2g/nU=;
 b=zzz5jF5ZE+/CBZlC7WdRxvOPgH8k6loD1REhC+f1U5alKhnqShiryIS7
 R+d2ICRrOR/JSYv4Iq3AjTwXSyozE/sh7V228/tJX3DnCt8tSKpxNHutR
 khIVhhUWS0LyEFI8nnYfsFZxwE7rjctX8ZsYuuree55hUIjloChowbxHW
 G6BA7xf5oH+8o7aAxPM2R/I2hGpXZKTopyW/GW/DZbbu1/go6AF5G82uU
 uOgoBgdWE2lCH45NDKE280k4XufkSuMSEN1qiP4N/uWEW7TxTx0DYIuGT
 gQqqSVEduvzVrcwluuUqrKUFBvV4qO9cuKmFaC1eLkTVQ/6nNdJKVG/g3 A==;
IronPort-SDR: yfg337+qmwvuiJYu/g100hGVlPDaVgdHuOjHO1zscQV0xLqkRON+bnoFz2JlBfHqJ73AWQG3H7
 CyxDjxzmZ9wIZ1XuFyLgwKfq4bYV9R3YygsQ/FqzkBT+XZgLLpr+D2lCB2LRUvvp7B3Lwoi7Vx
 uszwtm7C789fnc+JRr0uowAYZF2wUzi5d6SeMHMYdmZCywMnccSthI7k6KLsi1lwCO7Di/FdEl
 mwLrP9y2/hFG0lB5AP6fOauC6hWaYPv+rLdK872ec2S6E6pjPh0YC/jrGqRvufhHYh1+R2IE6R
 QRGrJH1UtEhQUNDiCDHUXvon
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="146897763"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Dec 2021 07:39:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Dec 2021 07:39:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 16 Dec 2021 07:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKE3jxb4gNuaNG2HnKKBhirDwVEU8iWbPdMNOrQj1LgkUttG00U0TREjwmZZ3hyRkqYmxLnvW/9YjOVsXHEHIiGUrB27X4RK6bvWEqiT/t7w0XW1+ebR1AhX4nAUg/ZBccl5TeOk6Rd+Zv8ilZbBupGOHLS/3VRyZ95Umx6csdvX8nqvBCPhsiiNxc9jJwWsT7dp4Dux1bg0JsLu/6o43VO8EU6NYzK+Kob5zhPM0kDbKPZUL7Phrw2pl97eN3EPDdjWCSpyTeMeDByi6d08TTHj0XGmwIo0Jyg6EM1vKT1BKAYW9/m0epGdoSKUBInaZgpme2OZ0tEUjif2wnudXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uYF3W5ZcM9cdkgJbwNre6f3OTO7R8Irsrrx+e2g/nU=;
 b=BxyPaWBhaDy10SSGhZzx8jO38ysJ5DqZ3aiH5GP//y3QosiN1jIiz+MxXWldc5p15AgyfqLUtw8ys0KSFIVKSN5JQG8qAEw5uz09WC+4W4jEhdCVWb7xBOPJ3GWLjLhc5wkxHDN0gLtgBYf/8c3w8k90HuVsG4HZvANip43ZMsSUFJcI5r7e9ie0HfdH8fljBf4pq6u+flATU3OeLm7DNidzgQ7iYwqqx0JjAZs9FBEgLm6iBOWpi7uuvHYANx4g/cR1lJnQaYNHuUZf2ei8Rn3s4NjvzwZ0nExw/Mrzdmeuhs4L5luM0sQX5P1QJ04wouo39NhNf/Y9gFUNqFgmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uYF3W5ZcM9cdkgJbwNre6f3OTO7R8Irsrrx+e2g/nU=;
 b=XwPHfdhpJEwB4mocHRCdp7nTnYvhzuB7VpBwdrmWFJliiaLgnXdcJ21Vx0RzKUzDMYWPk0A5F7bZmaePrQ6Nugxm8wkDaf5CoAa5vrlDGuR++CPeh4BtEhfoB2E5ucPb9/cBBAfG4Yfh7HX69U5ZXRPZwhEkqv16JnlWeYVhy74=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 14:39:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%6]) with mapi id 15.20.4778.019; Thu, 16 Dec 2021
 14:39:49 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <aou@eecs.berkeley.edu>
CC: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>,
 <Lewis.Hanly@microchip.com>, <krzysztof.kozlowski@canonical.com>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 05/11] riscv: dts: microchip: mpfs: Fix reference clock
 node
Thread-Topic: [PATCH v2 05/11] riscv: dts: microchip: mpfs: Fix reference
 clock node
Thread-Index: AQHX8oIgnWYztQSikUKTyjHnHdaFqKw1MRAA
Date: Thu, 16 Dec 2021 14:39:48 +0000
Message-ID: <d378f94b-ac49-5f91-9fc1-19bf3debff89@microchip.com>
References: <cover.1639660956.git.geert@linux-m68k.org>
 <1fdb9ffe223057e0140324ae020c9cc1dc90ae5c.1639660956.git.geert@linux-m68k.org>
In-Reply-To: <1fdb9ffe223057e0140324ae020c9cc1dc90ae5c.1639660956.git.geert@linux-m68k.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b9a6b68-8a3a-4ccc-7f61-08d9c0a1e990
x-ms-traffictypediagnostic: MW3PR11MB4635:EE_
x-microsoft-antispam-prvs: <MW3PR11MB4635066DD055D6699E9AE5E098779@MW3PR11MB4635.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t+63DjvUhrwf2Mb43O8vVxdyhonxp3KkMJRE6bgdriLIx/GnWohpBUhKl1chABLDJbHsaLZALq672ZrychTXV0DTwkzss+nYjaapWiJTzCgbVPRKl/yfFR+2h94RCYUxnakf8CfCvz2xi4tlW+xCMKtqsm68Gi2tHihDEIzlKzYeue6hxw/98JYbJJdLfyALG1hURKd7WMzkzs7DRlxnGH3CjgcgiAL8N1bo1kStT1mnAK9OQZs2v4lvzy7aE+W+pLc4kw387cj7y1d3g+tyAuhnm48Q19IxU8x2PeL4IJ3RknNWjWvrVA5Ap9gzKy03pAh/GqKorwkRw9oy7ssPU1BxG3xPHvUE0NLPpmmy3fzp/xXxukEWg08SLdMUZgznrVCnMkTHxzI1xqYGlNZHNfS9Jc7tiCP/Bgt0fLKD4iFNPmn3CMOYOGvJiBA4R8wwQOJ+xhyHWVr98cy8kr4JVnRHo9flxTlhLkV+2z+E8nNZBWnm0mduQ/Hh6Rs2yBrBWY8STV8NqbFio/CrC4co5vOqjV0iM+RT0c7TylGMVt+bkSUtywaPZ51LtU8mdvQBblfgbXjjkwn7l8mFrxH2keAX0lIha5335qWzPMTmw9jcsQsXhtnnsKE8wuWTMgdRYvSq7UjnRPi75ZhqmJFw9uRKmQOyNxPvvAK4CaeMyE3uBIceUwCo2TfGQJhawBpAg1UmP5ut7RoVlyyPTi86DGl0WHPOqbodIUMzE8vLGSOFNm/5D8sATQFzNMhXW+KnV1QeysRyTMWUc2la4hJ7Og==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(2906002)(76116006)(8676002)(83380400001)(31686004)(4326008)(110136005)(54906003)(316002)(86362001)(64756008)(66476007)(66556008)(66446008)(91956017)(66946007)(6506007)(26005)(31696002)(6512007)(186003)(508600001)(36756003)(53546011)(2616005)(71200400001)(122000001)(6486002)(38100700002)(38070700005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0I4UUk0dHlMbUVraXhTRlRWbDNJNUhFb2UzRVFydDg2aXc3eEZTVkNqTjdW?=
 =?utf-8?B?Vkg3eFRsMWp1bGFOUGx1amRQdjZlbEZGTmFESmpIeXhjTUF4S0RJUkZERmQx?=
 =?utf-8?B?cFJvOW1Wd3JhbEprZ1Z0QVdsVlU5c0E5cENCQU0vNlNkL1pUeEhtWlE4RTY4?=
 =?utf-8?B?VVhBRGtERVdBTEpTTXFXVUN0QWJENVA2OWR0ZVRHYzgwOFRyR1kzTE9SL21q?=
 =?utf-8?B?TkUyQlhKZlpsUUhGbHFiZjlvdTMzUXVPbDk1bHVnYWNCZStEcktKZHVQVDVL?=
 =?utf-8?B?YSsrMXJSS0lIM0xySlhCaHhFQ1JJcVlzWkRHYVhaUTFNY3h1TVBrNENjTEdZ?=
 =?utf-8?B?YjhZZm1UUE41SVhsSFVwTGJjYlhYN2ZmeG1Qc2RTYlhpK3dQbDRtai9Zbk5Z?=
 =?utf-8?B?aGl1SVlJVzlLbmxDNU1jOERYc2dLblVkUFNUNFE1SXhpdmRnMmpMYTFqcDlW?=
 =?utf-8?B?Vm9Wc29lcUJvV3ZWQTlBZXQ5QUZjcitGcnlYNktVRTRYOUZYZElDS1h3VDJJ?=
 =?utf-8?B?REJ3L0FTK2dNc09lUWIrWkNHbFZ0ZVQ4TnAvZVZZMkk2ckUrOU9jQXM5QTVO?=
 =?utf-8?B?WFNRRFZHeEZGQjdtekZVRENpRG9ta3VtZGt2T2xDRkRSTytvMnRlek9JYmkx?=
 =?utf-8?B?bGJBRElpcmI0K1BPVkh4TGVjWTBUWlRrVjUyZFBDd1lMVkJjeVJLRVlrb08z?=
 =?utf-8?B?SGtJcVJMSFRXalFmRDQ4Q0plbWdqdy8xYTBWUjU5bnUycG1vOFZlZFo0UExL?=
 =?utf-8?B?dXJYbmVDUnVWZmR1ZU92cXlEQlpCMktRUTZIRjdTL0g5RXZ6dnA5cVdjUWZQ?=
 =?utf-8?B?OWtOWFJXUHprRERoWlBraXpreVdtSnhDL0lNVVlUdDgwakZqUGpncTh6Mmoy?=
 =?utf-8?B?UncwL09mOU9RQmp3aWR0SE5lS0lqb2FyTGE3eC90dGRFSmc2cVhKYmJnWm50?=
 =?utf-8?B?a3FkRzQzSmdqa3NaaWU2TnVQcSs4d3ZMQzZjWFZhRng4M09zMUozenhTbVAv?=
 =?utf-8?B?SG1CYSszSS9ZZjdqUTFBYWQxZHREZkVNUHZyZEVZNXJMeGFJOVhBZ0t1Qk5S?=
 =?utf-8?B?RXluQjBYb3UzWFRYalVRL0V5cDNSWHM5NEt1VS9uaGpMTWh5SHZ6QWgwdVVV?=
 =?utf-8?B?R1FYVkdzQVpGNThna28weHh6dmNwcURySDZGZHBKN3IxeXJCZzJwUlFPR2dV?=
 =?utf-8?B?RVZzdDcvS09Rd1FYYnp5Rnl6VWdsTzhtUDlwdmtPMXpUWGY5R0EvRENQcTJw?=
 =?utf-8?B?Z2Znc25nM3NFYmtzc1lneUNxMW5oaC9UdHdhZ3A2cnZLR1JYZ3VsKzJnRlg3?=
 =?utf-8?B?MTc3bStNYkU2TDBUTllqenY1K0VNaHBIMWt6TGgyZ1dkdkJWdkwvSXRlSW90?=
 =?utf-8?B?VGh1OUYrNzdqV2dneUV2ZnJCdE1JN3Y5OEtvUnZ3S1dnWEtFU2M2ZE45NmRP?=
 =?utf-8?B?WnpGdEY0dkw4c1ZBTWs0R3Iyd0h4NDBXOHc5bk1rZTdHTFB6YTdlSHhwK1h2?=
 =?utf-8?B?bWQ4d3Y4UEtVdk9BdXgvc3E4OUdHZTBiM3VFZ1FPYzV0MDBEeDB0b1F6RXZj?=
 =?utf-8?B?dk9LdkJ5K3BSYXR5Z0h5SFlGZmF5WDFJdUY3T1VvOXVvWnNqQ2NSd01LSGRT?=
 =?utf-8?B?aEZZeC8xVjZ3UVptcGlMRERHcEE5a1BUU0JOODV0YlhIY0dUeWhSRE5PZ2VX?=
 =?utf-8?B?YVlrNFAzSy9seFVKemFzVjFpU0VxWi81UWJkWkJoSVRTaWVIVk5QdTFuYW9E?=
 =?utf-8?B?SStMK0c5Z1ppenRmU1pnMmhrRmtGcVRCUFF3WUFWTzZYNmtVNEVBT2FvNVd0?=
 =?utf-8?B?NVVFVTZEUm9aaER5MGM2WkdaQWJMQUYrVDFscExFeHN6b1JjcEJXRlR4YzZ4?=
 =?utf-8?B?NVpQeXhCWFdtL3BNbkdDZjNRN3gyVm1jaUxsQ29QRmVTQk5DR2FSc3Z4TTg5?=
 =?utf-8?B?SmRGRW9KeURTTUpRWHNBUHBSZDYyTzlRL2M0cnFpWWVrdFFGdERvSjhOajFx?=
 =?utf-8?B?REhuZkFjYkE1UllGZnNXSXQrWnBSTEkwWitxUnkrVzhqY3Y3WDBlR0Z1b01j?=
 =?utf-8?B?eDNodXNONDVQYWhidDMrWFJXc0dVZ2FMbStDaDhyRkJZU3NLS25GNWJTZDdK?=
 =?utf-8?B?M243MHFFTTQxaGFOTTR5OWpKaGt1WDJCUnNreERiZnVUSW1aek9ReHl3bmhx?=
 =?utf-8?B?TnNoVlgyUVUzVFBBakt3TzI4WXMxMTNIUkFMZHpCNnNrazFlSjY2Y1NJZHlP?=
 =?utf-8?B?aEtwbXFmUW5JSlQvWFRFZlBKZit3PT0=?=
Content-ID: <26DEBE62878F3E408AD94DEDCAF5F2CA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9a6b68-8a3a-4ccc-7f61-08d9c0a1e990
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 14:39:48.9214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XikuBBjv+S0ChBUGfqk5DlrOBbWOPtrfw9jOYSk1OabhMolx4l77ynfIYswvieUmFrs6XcERhB4iMPC9sHSjd2xaAHb4fys9CNlcbo4MFuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_064242_704334_AFF817DA 
X-CRM114-Status: GOOD (  17.70  )
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

On 16/12/2021 13:37, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> "make dtbs_check" reports:
> 
>      arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: soc: refclk: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[600000000]], 'clock-output-names': ['msspllclk'], 'phandle': [[7]]} should not be valid under {'type': 'object'}
>          From schema: dtschema/schemas/simple-bus.yaml
> 
> Fix this by moving the node out of the "soc" subnode.
> While at it, rename it to "msspllclk", and drop the now superfluous
> "clock-output-names" property.
> Move the actual clock-frequency value to the board DTS, since it is not
> set until bitstream programming time.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Looks good to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> v2:
>    - Add Acked-by,
>    - Move clock-frequency to board DTS.
> ---
>   .../boot/dts/microchip/microchip-mpfs-icicle-kit.dts |  4 ++++
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi    | 12 +++++-------
>   2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index fc1e5869df1b9fc5..0c748ae1b0068df7 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -35,6 +35,10 @@ memory@80000000 {
>          };
>   };
> 
> +&refclk {
> +       clock-frequency = <600000000>;
> +};
> +
>   &serial0 {
>          status = "okay";
>   };
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index ee59751544a0d3bc..b372bc6459bf163a 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -139,6 +139,11 @@ cpu4_intc: interrupt-controller {
>                  };
>          };
> 
> +       refclk: msspllclk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +       };
> +
>          soc {
>                  #address-cells = <2>;
>                  #size-cells = <2>;
> @@ -189,13 +194,6 @@ dma@3000000 {
>                          #dma-cells = <1>;
>                  };
> 
> -               refclk: refclk {
> -                       compatible = "fixed-clock";
> -                       #clock-cells = <0>;
> -                       clock-frequency = <600000000>;
> -                       clock-output-names = "msspllclk";
> -               };
> -
>                  clkcfg: clkcfg@20002000 {
>                          compatible = "microchip,mpfs-clkcfg";
>                          reg = <0x0 0x20002000 0x0 0x1000>;
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
