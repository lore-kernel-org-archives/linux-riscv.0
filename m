Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9BAC38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDvkQ8yDnKcr8SJHQv0VcvMyEh+3Ah1LBlMjj/fWd6I=; b=blbTLwL//FyeCQ
	BnM37AZsTAEYmwPyO14Gy1hFgBb5E2fhkwt8ujJLFEXveiaLHoh3XAzIRcG3o1kE5nzR6eeqRa3G2
	Cnp7aizYQXwacaAEW5B4SfCBZ3+iYBaq/zdaUIs6BZvo4E0upBh4M2KyymHS3d7AXdDMAgXzNnq7C
	zCl2QIXxCWKwOjdnyL9a0A2juwtEZ5mYc0ilFhLJq5bC2jQzYjvQzTj+IjShttAWUSPgzZ6jEa/4s
	iFpiAY/H5djkQKYE1Nmudtd6g4PKO+8lpcSKmvlxSH0FJBWYC9UaMbjMGoTEHBi74WOI5uyNnuxNY
	ve/8cyQJrODkyyDQL/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU31Z-002fnA-Ba; Fri, 02 Sep 2022 09:31:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU31W-002fje-Sb
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662111098; x=1693647098;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6M+gGJRF9QT0nihqwywCANxgH14O+nQFtoc+iRsomiM=;
  b=M1tgXpCIkwRnYD6+nJi3gL+HT+tDDH58YDM9355CuoGahDB2g8MvsZWF
   x2p0aDdxEYfk5THBuKNY0OF+qxqeJTbVb3xsMtbA7oEJK4BQurcpYvuhi
   R3lDTX3eNiG8ycLQ9iLtXJVucBbcPde8hYfVB9OQrRnCkPwfiXb1xa/o5
   N8tcrflSKb8jDUwOBogrEL1rf48s3Dz+3vukDfQerVrsbnWzmDneFQ64G
   eoZgLVFgP8eSd9urcTA7Y2/Ykb8ZYZAPqsKZRNdlwRDYDWXfhl4l4qZqk
   sSD4QIuilpZCNIOGE3oaU28W9ZrW++cKjdt1rip5mUNKCynzjB0cVzm02
   g==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="175350626"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 02:31:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 02:31:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 2 Sep 2022 02:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeWSmq0NX1pQwxWCSk2hFSLXa9vrMyYfHtI9+Dr7j2AReNh5q6rWC6v1bbtnm3oQ1sK4Ekp/6O0BRJAVHjkRsmPGnIkd+SfGBEw2Qrty2yfYY8BPh5ya9EoqtjBtC6n+tm57WjOLUYXzUxLdX2g8cVMUUwt6NYieZB/1bWIvf3y7o5A/IgFqOY52qCxdGB1v+10kiJTtOXoAlC0mbfBMUb44l72ZjANYLmagM7Vo5nNzURbsmL5cd+7V51aRQ7dTGE6Rccr8SlTaScjSSwuV31cTK2MjljrCKKeoxNrIYfFAKxLcvD27n2M4Frq4LCCfZRseT+7sZTE2+8xPLX/PAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6M+gGJRF9QT0nihqwywCANxgH14O+nQFtoc+iRsomiM=;
 b=WnNj9RnEDXYG5SyJOUMJ8RgP28e3hUpZrHbxC5aV7/EDWljivJuHUu2NCcvVcnTmOV/qW1nK6uSY9hauJHgjc8ggrnm5Q9XGcAaPgoJ0glMY77JZMTgf7hmnXkimRBhc7YIQMkHXvxAVMKDCVFQm6fWQgMEw3kTq17Xt7unrQ83M1vcMBcyF5+GC3RHnkkNmW8Sy2/A2cR8G6yAhcUTXTxwpTLzM8o2nn1/QG0VPo4xUerw+pj8OBt9h+VGlLy4stZ9xqkZ/hQfeiHHfSXRrzMbe4KHxCYBOumXFTGGHN3MA3zpV4MXFlxYHcV6kmNG5vYJ3iiF2jjWjE9leUqUQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M+gGJRF9QT0nihqwywCANxgH14O+nQFtoc+iRsomiM=;
 b=TzuME3NPEoUGHMJbl1LxDJYVhIAHjnxqTfWgHNiaYZQ1ETQWcaacYD72xK5GK48UzzqkUy7Kx+/k88nC/BS0KAJ2S7H8gjAOAVoAhopeDUfe1RCBmnt2CLjslcfPS6Xg8RhWpz6z/KHfI15W9bnNoPTK0a+0nrs67+a9cmbbeBw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2363.namprd11.prod.outlook.com (2603:10b6:3:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 09:31:27 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 09:31:27 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>
CC: <guoren@kernel.org>, <apatel@ventanamicro.com>, <atishp@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] riscv: cleanup svpbmt cpufeature probing
Thread-Topic: [PATCH 1/4] riscv: cleanup svpbmt cpufeature probing
Thread-Index: AQHYvlI0SQeRx9DmtEOp6XWrWDqn663L4NQA
Date: Fri, 2 Sep 2022 09:31:27 +0000
Message-ID: <b0f51962-4302-f005-8baa-ab41b81c0817@microchip.com>
References: <20220901222744.2210215-1-heiko@sntech.de>
In-Reply-To: <20220901222744.2210215-1-heiko@sntech.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6d129ad-e28b-4d2b-a818-08da8cc5e930
x-ms-traffictypediagnostic: DM5PR1101MB2363:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6x1Lns5uC//DMcBG87rNw38cJn2n4TN5YL+p13ViefLtMNUYO1WYJxL0giqdJCJaPXDXFiSnUmGUISenpMDhRZzfThCA+5i4dlIReziQbYpSTasF/s91nYxf7H8nbUlc39AK3fPfEQIeM+eKq3aNq3pB7jTWxLiouMwrci8rsHNse2xuLGGjzS73O8ThnhtsOrKMvu2li/PFth0pKrNDxYvobu5aCvSBSgnenInf0WL01JQxXcJ0zaZ0Smhh71EDiaVxqor2MTFNoPQjs0oIif9EDcm6U9bPe94fPQqXokeyJjwWSKYlPxmnA6amVDIO3S6gzIley2uJN8MS2FHRQ3a5tkQynm3OwFcwUeSZHgOFaab2mEIy2MRtn3QsfN+apnmXxN2sn81ID9pQuwBw3XIR3fxUZG5N3ZN9D+Qx/nyU3IvVZHnpTaNvyZboa9Jrjj28np6Gep/n8XFUdoZ3KQJquXuJ8bVEyB+7JBCMpmTowFx2/GhB2BwQ7JmO3irE3WpDq3fNdIViofoqTDQ/UGQoNwfCd0bvCWizrnqF6ge70088icEg1ReItSx1xhz4YJwqL3QSjL92VVzIqsNBvYWrSCN0cQSAt8PzUlvNGG5GJUlDg/VlFOLiG5Iq3gdTfO7xyPTUNCyaXqNlZW1rg9s7gwH66MNvo89x8qBZVBzwx/yBCQkleNFlcUP2pvR5LL7nkJi4GrPmwUN0Dd4hsMqrOEdlCa2YaTEqti/KdrcyPzWeLpI2VaiLltfcFcxiZM4WKyn9xaJcBsHZQlyNv6u09iBAH4lo7ok5m/S8EALub5dhXhM45kuucb2TB4N5SqMAJ9t2VYRSWwE0k+LJ0aVcz+3nDRwYSS3TpSQbIMY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(346002)(39860400002)(31696002)(38070700005)(83380400001)(122000001)(38100700002)(91956017)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(110136005)(54906003)(316002)(2906002)(8936002)(5660300002)(53546011)(6512007)(26005)(6506007)(186003)(2616005)(71200400001)(6486002)(41300700001)(478600001)(86362001)(31686004)(36756003)(40753002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGttbjFjUFNEV0dJc0RGUEx6QjFPZzlDNzBwQ1F0VHZHeGZmYzNRclpEd2lK?=
 =?utf-8?B?TnJKaURrMEN6VDZBRmNyRHJ6M2QvZ09nbnpBTkNNQmtEcG5SWnJObVpMcWo3?=
 =?utf-8?B?Q0JTTmNrY0hVTHR0cVdwK3FpcjhLaFdmL01PUzRzWHBZVmVjd003Q1FqTDVB?=
 =?utf-8?B?bGFBK2tVWXBUK1BQWTB2RkU1aGZLVDh4NlFidnZIWEtSR3hMZkhqNDdhUXNO?=
 =?utf-8?B?ZFd1enl0Q3luSklRYmdqMk1rWk5mVjJuUFJqSmg4ZEFpdE1OUytoWXRzZGtt?=
 =?utf-8?B?UzZYdWRIak5ERUZEQ0wzbzZ1WC9ROHFrQlBOTGo0TG0xdHp1dHhCd2pwZkU4?=
 =?utf-8?B?VENQSW1HaHllT1dzUlJxME1HenBmTFZIcm5iTXo5bmRIMVVJdlNzVHdVUXVV?=
 =?utf-8?B?bzZ3eG9JeVV3TnJOQkxydERIWkdJNUxSYzNialBYaWNJT1FLMWJ1bVRRTUxZ?=
 =?utf-8?B?eDE4T2t2QmU0eFdLa1JScXNoblROY0E1bU1qaSswb1pxakowZUNlOTNJVkd5?=
 =?utf-8?B?Y3JQY0lUQjdRS2RaUjROcmE5czl5NVdGbUthMmN0MmVlTUNmN0xxdHc3SVZr?=
 =?utf-8?B?M3gxOUhJSnFkR09Bek01UUV1em5oN245dHVTQjEzOWtOTXU3eWFnL0d1OStq?=
 =?utf-8?B?WHhINThnODlwZEtpd1hKTVpGV24yWnpuWDRaTGdYc2d3OWs2RXdCZUI4NER2?=
 =?utf-8?B?NjNaYjYxQkExcUVBWDd4SmdraVlybXl0Mkp5QzF3T0o4S2toSURja1lzVTFL?=
 =?utf-8?B?ZnBHVWpBU3p6Q1NuWjB0U0VScVhaZktpTTRqQ0VLVXZPb2NZWlJGcmY3ekJ2?=
 =?utf-8?B?ZWhRcWk1bkxXUDdKSmlJZGVmbmtUZ3loU1dCNThydmRmSXZRb0Z3cWRINEtU?=
 =?utf-8?B?em5maWszcDhROE4zSldxeFdUcWRVajloU2Z1VnRKZFJaMEh4Tm5qWDg1MWFU?=
 =?utf-8?B?TG5RVW1ZRi9SNk85ZkhYUnZOUWZ5aGxTQ2kzUG1sWHFRZ2JidDBvVlpNNzU3?=
 =?utf-8?B?dDNJcnB4VDhsVmVnZEUySmhXYk9USW5pTzFZb0VZZEpyOVpKK0tIZmFsZ3ZU?=
 =?utf-8?B?Z2t3K1NtUlQ1Q1VHT3FiN3l2MnBpeFVaTWRXSi91YVZ6dVlrRmNOOUc4aktZ?=
 =?utf-8?B?VTdLK0tVdnRUejBVcUh4a0h2N3ZwazQyVENmTGtnbkIvMUVVTTd6ZUFPTXpu?=
 =?utf-8?B?VGxyak0xeXBBQlpzZ3JkRTE1b3pvMDN4VTQxZTN6dnUyVGp0dG9hOFRaZlBQ?=
 =?utf-8?B?eVRYRzRDOTFEQ0wydVE5NTlyekVFMlNhbVhIaWFqL3lDZEYzbjVLaEtMVTRr?=
 =?utf-8?B?cDhNZTM0Y0lnMXI1RjlBd1VwbWN3ZVQrcTEwWTlkY2Q5M1NmdnFBT25OVlo4?=
 =?utf-8?B?aVIwakUzdm1mekQveEZsYldFaUdheEVaU3QxamVxQkFTRVhDaCtPR29TOE9k?=
 =?utf-8?B?MjFHMGIwVXJ0NVBIUkt6NHZEQnl6YTg1bVQ4c2k3dDdFblpjUERKeFdXb0ZU?=
 =?utf-8?B?REJVQU1PZDhCNlBlOUdWNjZzaU14UU9YckV0Y2gyQnkzMCt0MjRQc2c5eUs4?=
 =?utf-8?B?QUpsb1V4VVBuV0ZvdGF4UDQ4akplTkVhZ2U4Nmhkc2p1a2ZVcEhpYlBxUHpw?=
 =?utf-8?B?Q3VyOURrWlBIYkJIdFc1ZUNiT1Q1WXFlSEJFZ1BTa1NaZzZDc0Vib1I3THhq?=
 =?utf-8?B?SHc2a1h5V3NISVgvM1pDTEI5Yk9Fb2ZNNkVKR0hzNWc3QkhCTXRaOW0vQndL?=
 =?utf-8?B?OUhVd1dEVHpQWDllWGludDk2cUlVMWRLQzJ2YjZjRk45QXozcms3MEN5SHl6?=
 =?utf-8?B?enNUU1V5WHlnbVNIZmErbjF0ZU85YjhTRHRrc0VDYWMvQTlLMkdaRzNlMWFO?=
 =?utf-8?B?TUF4ZzJqUEFLQThuQW5JaGYwaEE3UW50MUxsYWtTYzRJM0ZIVW8weWVvb0Ft?=
 =?utf-8?B?Mk1JQ28zVFg4NFI5NUlzNTRGZ1Q2ckRuSkFPTmY0ZnNWWE5ybDNHS01yc0J2?=
 =?utf-8?B?djZxU25TeGt0TUVjT25CSndsZXJLVWVIT0tOV1FSUEdWdEwwZjNuaWc5OE0x?=
 =?utf-8?B?LzB6Ly9TQ0dSam8yMlVkQWF3c1UvUkMyU1Baemg2NzlIbHBwZVVSbVRrdzlt?=
 =?utf-8?Q?ptXcQKBO7bdcZXeCGCMKDrOWK?=
Content-ID: <417EA3135A0E6446A45EF2595F007784@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d129ad-e28b-4d2b-a818-08da8cc5e930
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 09:31:27.4447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUec//ZxfcLQUXnUEU1wMQq/reFwHQbxrioEvHCW961aXz+eY2Et0/K8SC75N0cYnihFIg4z3OuMWdzfDSbNleFPDA0xm44xCGfB73VhxdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2363
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_023139_261078_936B0B23 
X-CRM114-Status: GOOD (  18.19  )
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

On 01/09/2022 23:27, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This can also do without the ifdef and use IS_ENABLED instead and
> for better readability, getting rid of that switch also seems
> waranted.

The change itself looks great to me, but the commit message here
does not stand by itself - the "also" stuff reads a bit oddly.
How about:
---8<---
For better readability (and compile time coverage) use IS_ENABLED
instead of ifdef and drop the new unneeded switch statement.
---8<---

Call me biased, but I much prefer how this looks now...

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   arch/riscv/kernel/cpufeature.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..764ea220161f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -253,16 +253,13 @@ void __init riscv_fill_hwcap(void)
>   #ifdef CONFIG_RISCV_ALTERNATIVE
>   static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
>   {
> -#ifdef CONFIG_RISCV_ISA_SVPBMT
> -       switch (stage) {
> -       case RISCV_ALTERNATIVES_EARLY_BOOT:
> +       if (!IS_ENABLED(CONFIG_RISCV_ISA_SVPBMT))
>                  return false;
> -       default:
> -               return riscv_isa_extension_available(NULL, SVPBMT);
> -       }
> -#endif
> 
> -       return false;
> +       if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +               return false;
> +
> +       return riscv_isa_extension_available(NULL, SVPBMT);
>   }
> 
>   static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> --
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
