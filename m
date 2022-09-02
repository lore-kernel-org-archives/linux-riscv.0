Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3AAC38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Kpi7FpAj3VBx7yRxE6JtBrIThjDtUhs6LxoR21tRuA=; b=IJ+mb+EDeGcUkd
	+T+Yh9EPV+Uli8z4kPWt8YQcaPbM7CxFDZUfV2eRDSdZ+wzZEko8Q8SJ8KSzX5/c/NL/6EpTFMZRk
	Kon37TE5g6/UirF9OREX9YyAJ/lqvorWeUOdm3H1LcrUnJePK1VgkqdcWJw3dMtYcizjNq142XU9l
	iakTGApt3MlbOGBcJTmNPl02i+qCCsa0LRUtuC1Dt9RRZC1xSxzWAnQmwvkHcjQsyBMHCjMzmBriR
	NC6bw9z8zZzg3lE8SAx/zL9vrk8X1PcmYQHF6zKZPkISFFq7mMUlLE3I0x1QRo7odH/UE2CdFrcXa
	lmcvOodX82OnnJoz6y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6jq-0055ta-RJ; Fri, 02 Sep 2022 13:29:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6jk-0055nd-KB; Fri, 02 Sep 2022 13:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662125373; x=1693661373;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=urIbbtvhnA3dR3pUc/D2C9wT7I6D568A6XeHBLGvU2I=;
  b=cg30oszhTCwgzcJFavwwxUhdrv26Dt3flFI6UhnevwRz6QZYibzvd4B4
   5TMDTLj/rmW2w9oZArq/A7HuRH8P3N7wCxusn1UvNRot/8qNhV/kEJfdk
   6VURiQ70eP/vg8TsqBQfn2ucdb/MIW+hxp120hOuJDdaXC5Ojsr6Pands
   GPtzZXjvQI/ThTwagQdxlFSmpd+C4wCk8eZ0ieFMXfDVwEkT72aJ3Cmpw
   5+omKq8rNA+dFuJeAbNORziEf/X4kqmouoqzC+Z/PbltwNrFd1Zv5ORqT
   JeSIuSuCVr6xzkV+q+jPVhqyMCRTFMPTc+814tRNYmA4g+UU6ynZHLV4R
   w==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="178801944"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 06:29:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 06:29:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 2 Sep 2022 06:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRfkZEQi3fVG1EtjZhg/C3JjddEj3ZplVcGgd2GqkHjGbkKa55LoZBwr5sY/Zi0SnfV39OX8A7XSHQchIBN4n5bygp8PAbTsByrGlujgzu/3U39V5ThXt1I5y8B4QvRD4rnkWadK4/DC2d3e+UW1twMcvt2vroJ97TvsOZu+5wLy27EN3zGJGTiK8VoOdqAyPCNZ+fsiA7ByG0TrTyjPg2vTs/7KK0DV9r3t3XG4b83Wjylxl4n0DK9kjbAw59HZpLnBOajSGPpAHuIZM867ap79radFjvvPryicX3O5BsXc42LGhxrWgjEMBUACcAleNoTgQf75clRaqow/DiRHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urIbbtvhnA3dR3pUc/D2C9wT7I6D568A6XeHBLGvU2I=;
 b=bbp8cdMf54O2FzEIP9zxp1st0U3MFkUIFMMOgY6+aEMJ5nAW2D1pQmjdIrPyx45ToNFudnpl5T6nmPUg5yeRpyTlR67wxNp26BSOUXkUJOXIb2xGdeZv4FStYhawvaFhbqrTMRThwjKqwqvOjK2KH7vVL1NlYE1D919s71u0FR/WC8hInD+yeA+uI7bTIJKayyn9tLU7WQyrArvs6xqm1O7oGpB8SGByU9xoFbCCn/xSerLIuoWpUfvQ+xJID/bKj6IcJ7rXhgm9WFBuEc0W6QjVHBj9ukli3nvATpYhdMMcsBBGmAWZLtX78LCO1qLpOiRN6mcNuFXXfTlnMYK02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urIbbtvhnA3dR3pUc/D2C9wT7I6D568A6XeHBLGvU2I=;
 b=XdadAopKaa3DcJTDKkqk2lK87YQ2b7WoZ9o+5sgnvbn/Yb3ba/WK4c7J3zxcIPJFlj1esl8+HDrr/eXd18RnFltfULrLGh8OZUNZSeAOICRHV5/bg2r1SX/reAX8XRM7zgp/xOZ+KOAAMeK0n+TMMIKavGl5IFoeaITn6lR1O+s=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2768.namprd11.prod.outlook.com (2603:10b6:805:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 2 Sep
 2022 13:29:23 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.016; Fri, 2 Sep 2022
 13:29:23 +0000
From: <Conor.Dooley@microchip.com>
To: <jszhang@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <bigeasy@linutronix.de>,
	<tglx@linutronix.de>, <rostedt@goodmis.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Thread-Topic: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Thread-Index: AQHYvWTJWdidtLbFYESs6cM+7jS71q3KyLAAgAFXEYCAAAVoAA==
Date: Fri, 2 Sep 2022 13:29:23 +0000
Message-ID: <ea5cdba4-7a79-56b3-f8d7-7785569dedd6@microchip.com>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
 <YxIAmT2X9TU1CZhC@xhacker>
In-Reply-To: <YxIAmT2X9TU1CZhC@xhacker>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 136e0cdf-abdf-439d-c1e6-08da8ce72678
x-ms-traffictypediagnostic: SN6PR11MB2768:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b/nlzkcl+sH6V5RArFzImrRy0ueeiTgnxCiBz1c8xoBYK8wKCvt3eVHph7czh1lVq4p5xpWUCzB5gDuBoJtCnkcOpB6sd9cJgk0+kupCBPRt6NtO9gIiDLokG6l8UDTpbrZt+QpYhNne7zi/xlgW9/SzURfJbYOP/SLKFh6PFxH2z5eUhBX8TgSOPe1sp1a9KoNfrNJ9ClvvTa8QMZ5NQ5ZaFK3/oFTDYa632caNSo9UXsf77sVOlpmQ43UM4IQXE0paYIOZlghEI4nREqSMDlbEMTmYNYhEcuE973KA5ATPQKwpBTce9S9jo13uLFZ50GrZbw3GcmDKX6VBiLOgvY0HBySN78vDoor3SP7RBsl+gi6XmWTUHvr/4W2cFezZYU5sUxxSMNeu4cRbL7/saWcCnD0bOOOAKoIS8Y1jpV4g4Mr3AaJNqgcZmZ6OcvAq9pKSKqZJLhDal+cShwTkgEGmJuDgle85OAyT65Ky1ft+Ag8rSDN7G9GMX3I0TJphNvDlhWv/BLO5py0JsxhOC2lpYUaF78uq/D3VZaLPXDmv4TIxN/Qj1t43UtHJsq18GDhAxyLkpvl9vy6vrjFXULck9tnHKYYqQ0RPKDFre670x7OkJuHknQ80+xksRTVEbXhGESzKluV8h/YtOIi1mUyOUuxpFqxEuNld2R0RZoWpnmkCEHyomU7lacr5FJWlVeJKqGy4rEQgnJSB3xvVKiIItt+25AOw/TPmoVu8vTLiyApDKy+D/XXm0u54G39Mrhyu3U9/wZHw64jErtPFSqUcx6dqgJtaVObKBWu6YA37eXi57YAXkcax/BpC1+QlvQjdQl/JK/sVIvhYmY771rUK9xYgV9MlK9uCEmPxdPs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(396003)(136003)(39860400002)(966005)(66556008)(2906002)(6486002)(66446008)(66946007)(4326008)(41300700001)(64756008)(478600001)(91956017)(66476007)(5660300002)(7416002)(8676002)(8936002)(83380400001)(6916009)(76116006)(26005)(6506007)(6512007)(54906003)(53546011)(38070700005)(316002)(71200400001)(31686004)(186003)(31696002)(122000001)(38100700002)(86362001)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWY3RWo5d1lnRGpIMVJXdlJKQmw1aFNway9TNVo2NGdNaGpMajROUU43cTdS?=
 =?utf-8?B?a3JVZ1hZdmFVbTFBZnc1OWhtQndGYmJ1NzNNTUhjbFN6MjJCTWJvMjZPcERB?=
 =?utf-8?B?Y3dGMUJxVStCeG5UWkRnZGUzZzQzcmg2aEZpVHJ1VzVRTlh5QkVkcFJWdEVW?=
 =?utf-8?B?bzhhZXM3Mk9oWHRsSXkycmJiYy85WFI1OU0xOTNwSEhyaFpPSWRFYkNsQlEx?=
 =?utf-8?B?SkoyMHBGamllMTVhRkFUMFdZWWJKUEZPZmhKYUdmd0dNUitsM2JZemNRLzly?=
 =?utf-8?B?L3FGK3VGUWRrWFJFRnVFVTZHclhzMWpMOUNjcWFJRzE0Y3VnSEVKTUtOYnZz?=
 =?utf-8?B?ZnpkWm1CUmM5bDJ3NU10MGVGcWZCdVp0OVBMdWlrdUYzL3RNL2Y4dHYrbkxm?=
 =?utf-8?B?K1hRZXpIblVRMzM3V2tYc1FIMHdITzBvN2RkclJJTFhyaEFxZllDOTByVUpr?=
 =?utf-8?B?cGoxVDR1R0hJRWIyV3FiVjlyZ1dqL3gxejYxd25qT3dyZ3RvdEM3bk80WTM4?=
 =?utf-8?B?RkhqTDdjeS9qdW5EV1FHTk9DdEN1THo5OE9ZeHVKbFpBQnVtTW1UL0wwdU1F?=
 =?utf-8?B?VkY5bDQwUkIzbHRETU5JM2hpSUR4SlNLeUxHSVJrSElESHJJTEpDa29oaG1w?=
 =?utf-8?B?RG82TkhGSFdSMzhPdU1iNmR1N09XZWJxVXo5MUZXdEw0SElJNHRneDZKaVZ0?=
 =?utf-8?B?cG1wUHhKYWFkZjFrWWRBTkRteFFzWVcrbmIwK0Y5T0hTYjFnb0MvWXoweEJN?=
 =?utf-8?B?eG5iVUR1L0JmT1BYOEI5bldsREVxaUF2RjdHbnR4WDRJSEJxMGtSZDE5TWhE?=
 =?utf-8?B?M09BUkEycWp6SEJ4Wnc3dmU2WmtUbnV3ZW9IRzg4ekZDZjEza0tDVU1NRDFs?=
 =?utf-8?B?bTBObzZWaE53bkRySHIwU1dTZzQ0N0x2N1U5b1kzNkhFeDE4K0Q2bURYQU4r?=
 =?utf-8?B?bXJxR3ZEMnMzQlR3am9KaWUzV01HbEMxNm5KTW11aFA5ZVl3cEVyeDV5aU44?=
 =?utf-8?B?Q0FKZVlWVzlvS0xIYlBzOVpHSVZZMmJFSitwMkcxWkRYRkNUK3BFbEJvVUFB?=
 =?utf-8?B?RWl5ZkZNenI1eWJPbnlHWDBhVlZzZVl1UHhKWlZ3cFdTQ0M4V1UwMU1HU3ZR?=
 =?utf-8?B?ODI0M3dZdUtWU08rWHBaaTJzM1FZWWdUZjl5WXBnVDNRbFRrSGQ2aHhJZllR?=
 =?utf-8?B?cE82cllQR2d4TWpENDdzaGN5RkhET0ZlbHEzOFdKOUdaQjczYVhnWVVGQ2xC?=
 =?utf-8?B?aEZFUklwaDlUTElBNHJkS0hmb0NvZHFhd2dIZkdBL292MWVHYmNIcVlnUTBh?=
 =?utf-8?B?RElSRjl4VjlpNzZ6d2NETU9RZ2wzZDZkUWc3NXdCYzlMdWtiM0dWNCsrL2xF?=
 =?utf-8?B?bXlYWU1UUDE0K2lvMlF5L2tQR2F2YWtZSnBRK0o4Yy9lMGNZMHp3NkZNNWl5?=
 =?utf-8?B?dW5MT0xzdjZQdXo3TWQ2RmdyTzZhRlVIdno4Q0lscHdOSzFlOE56Nml1NGs0?=
 =?utf-8?B?ZnVvQlBJNjZyaTdXQVdUZlpuMFdUbFJuNndvUEhsdzk4cXFlZFpvQ2VKL2J2?=
 =?utf-8?B?SXE5UkpscENSNUJJbHN6ZytoZUg0SVoyNGdBS2duWVJRSzU1TGVYWEFOazJ5?=
 =?utf-8?B?Nk5uekdpdDJlNkZWVzRwWVdHUmJxRy9IRzVqMk13cndDTjhlSk51ZHNpLzJm?=
 =?utf-8?B?S1g2REl6bkQzWHU4MlcxbTZpaWJEajhOSlNhdERqUUFidUgwN0IyNDBHVEhr?=
 =?utf-8?B?b3V3UFRja1JCU1hEMmY3TDlldmFqR0k0c3JDdGU3c0NzVHN0dC9xYklVUEho?=
 =?utf-8?B?QTlhbGdvd3RHK0lyT0dQMHUvVGJxMEVDV2dOK0tZdDVWUWtxdnNveTZBa0JW?=
 =?utf-8?B?bnZIcHJpZWdLb2Q2TnpmS0VFVGh5Z2FVQ0c3ZEVLWUJDQkk2djlHUkcvUzh4?=
 =?utf-8?B?T28yY1BRS0sxL011SEpGSDZxWkF6YnROUU1VR0dYOTRQREJ3bitSZkZZMnRH?=
 =?utf-8?B?WlhQdGd1REp4SHVIZEEyK2d0YWJTcDA5RUlvdlRxakFaMjdIczJkOHgvZkVD?=
 =?utf-8?B?VHhyYzMwTmhpMlc3TTk3T1IwQ3FXWUpIVnJjQmgrSmhndnluc20xSDU4VlNw?=
 =?utf-8?Q?tidhlLV+es7Zw0+HiygjQnfL+?=
Content-ID: <0B6CD9E4A441894FADBB459D05ABA956@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136e0cdf-abdf-439d-c1e6-08da8ce72678
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 13:29:23.6816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AdUjXeogYqJGx1WjN4j8CpbxgUNkhCzYVNCgk+lfazDhYeGXfmgvxt7lV7rPzpzWm2GvtqVFnf4KQ8gMX6jL9A3FkMUdF7STjXdJpDaFlFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_062932_951923_FC9FD3D6 
X-CRM114-Status: GOOD (  22.92  )
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

On 02/09/2022 14:09, Jisheng Zhang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Sep 01, 2022 at 04:41:52PM +0000, Conor.Dooley@microchip.com wrote:
>> On 31/08/2022 18:59, Jisheng Zhang wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> This series is to add PREEMPT_RT support to riscv:
>>> patch1 adds the missing number of signal exits in vCPU stat
>>> patch2 switches to the generic guest entry infrastructure
>>> patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
>>> RT
>>> patch4 adds lazy preempt support
>>> patch5 allows to enable PREEMPT_RT
>>>
>>
>> What version of the preempt_rt patch did you test this with?
> 
> v6.0-rc1 + v6.0-rc1-rt patch
> 
>>
>> Maybe I am missing something, but I gave this a whirl with
>> v6.0-rc3 + v6.0-rc3-rt5 & was meant by a bunch of complaints.
>> I am not familiar with the preempt_rt patch, so I am not sure what
>> level of BUG()s or WARNING()s are to be expected, but I saw a fair
>> few...
> 
> Could you please provide corresponding log? Usually, this means there's
> a bug in related drivers, so it's better to fix them now rather than
> wait for RT patches mainlined.

I tried it on PolarFire SoC. I know that at least one of the problems
I found is down to drivers - specifically the system controller & hwrng.

The first issue that comes up is in early smp setup code - we call out
to update_siblings_masks() which does an alloc with preemption. It's
the same backtrace from here:

https://lore.kernel.org/all/0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com/

I'll give it a run through tonight or tomorrow & give you a full log
of what I saw. There's some splats all over the place for me, but I
can't tell if that's just knock-on from the other issues.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
