Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD394C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWxCxnHNn4ZIP61sckQcWQx84UZQ/JhbgTD4L29x7vM=; b=lgLw36sAO6Vct9
	I2n9HCCSGTBEDfYvYfswDftagZNzevJkjY2/H4lLHGhy+DjnF1mPYQODkzYChtHdt7Dz2N+23p79R
	vvhpHFlTrAMF4/lPI75B3zEVcW4N86hsH1315yivxxdHzs9EEUKqtiSYkduufPVtWLUwrtLqhtnDN
	MgxP24/FntvQAbDzRyhPewONjHmZ6QGwevixgMgdo2IWkhaApnuqCcE1RBO9T+zklTjOUTAXHvnG9
	MqCDkjtIvIYRIXpoxcYD5xSyQDyr/n/fS59bQGz3XTZxhCx3wTKKZSERvUEqPUYp28NiapH6GTcGf
	gFlG4qGU6UJIVEeiMXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMYQY-00BUMS-VQ; Fri, 12 Aug 2022 17:26:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMYQV-00BUIu-9h
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 17:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660325187; x=1691861187;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=utffnDYJZVazrK8YhuMhYVXCh5Oobwoezv5KjVHMaEg=;
  b=D3qQLELc5b5OYYIQC5ItpnaztIb60zGfkJpZI8sN31pBTi90ykejK/YH
   ZCx1tBS6tkMbOHy0VSRRr5ezJDJnRVpYq35wRQ9Iu6rQVQgLs/GIG72pO
   5HlVP3/48dirRL8X8PRWMQl7SGyTsG+piOap0iHY+kOJseGfB/+naRlQo
   +W9dtlAL2LyZxTnPXZkM9hZORZaxB+84IQwGn0Qo804FNB5Sd6NCKBzyD
   xbFrA62VDOcZLwYOmbWAnyANsV/0xgmnSGsevlAYbMnal4lHxXcehUWBx
   E38xk1A71gmKOhC+0vNh+NWRFkjNbLV3n2xQZQZ7myVMCIu+v9PUWmQCH
   w==;
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="176030077"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 10:26:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 10:26:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 10:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LK87o6YgcpiyyFJ7Smw74RzYulp8G7IGi+gAwjpdxnPD4IKUqsUChCKG+O+U+fnJoH4D4gcf8/UE1ESPG3eiGlZxRpM7ZfKCajnc9024JKvLbIo+CUYi43pns39TYVYU/a9saNf3WWZDKJHFckOK0Gi45rGPvGIEkwBDFBa4k4XKZHHjmZf2FNBkXGoorJOX4g+n8VKpA5OCKDTSLfUF4uCy8YIChhZJs3g3a7E7YKJY2xs9l96K4Msd7W05Z9RojeJT+ahAEb+B6aZIGW5lYLlckLMRKo2j2yof4K9U9giLWPfJEgvp+USZr2jiv3GJzva4K0pIsex4hXG5u9QXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utffnDYJZVazrK8YhuMhYVXCh5Oobwoezv5KjVHMaEg=;
 b=J1SfipBdEi4W+EGDXYPKJVjpUsyJF6/3zxkzwvdFUEx52ww0qUQPu4DKydKCsDjDM7TY1zFMashElHKLAhHKRHVL+v6vnFIwKwJWPHqQKs1wVDHqzKECB9MgmN2G4Ytv7445cqstON9MsXDV++mRZjXAFLAhOyIKYEvULauK7iB4JY7X3hMoHo53OaZnk5ImOZZXUAUK846xaBQEM2i4WHiD+sCdTfqloWnnbIzNiIpJ0cw2J8sTDgRbZ/cqxbkDTZxIHhBSBrygl+CcUbfKfrLEAL8W8jlh6cgamjnKw7y3w/SpwDi3bzmt8plUUyDviRPXQRqYCtAa6WtyYRHsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utffnDYJZVazrK8YhuMhYVXCh5Oobwoezv5KjVHMaEg=;
 b=U3Sd9CRK7ra0mMNtF8cYCNn/U6HWF4fpk8330BnN7Mvs5ymNUxErHYjTw+00v1oebbmMl09vv+JjFI8We2JNawj8Wy0a+D9Bc7eveMusv8TVRO++O9Mfc6bB9H533r/bjL9gui/DhPixBg8WqpQA/ni8x4x2oH1I7aYX7EKHpvk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN8PR11MB3570.namprd11.prod.outlook.com (2603:10b6:408:90::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 12 Aug
 2022 17:26:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 17:26:11 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<anup@brainfault.org>
CC: <lkp@intel.com>
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Thread-Topic: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Thread-Index: AQHYrmWTaMkFgwggr0icYeiN4P0UD62rhG+A
Date: Fri, 12 Aug 2022 17:26:11 +0000
Message-ID: <ee7749cd-c592-5e1b-f2a8-a6fd688bc33b@microchip.com>
References: <20220812154010.18280-1-palmer@rivosinc.com>
In-Reply-To: <20220812154010.18280-1-palmer@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fad911b0-aee0-4c55-7c00-08da7c87c072
x-ms-traffictypediagnostic: BN8PR11MB3570:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g0X9UyJVAOcL9uXbZ0Eu3p2csf/AYnnqecJ6A6AUULs4SfwW7GxSU+4wFWRrkNKLY9ZS/8lOl3Pvwb9ZxBEfhux13tKD64iWV6IKImv9BH9U22/jWvSZcqLWGGNgAZlgWceE1gahuIgPj+UwLN7kQo2WRUB2EpSSv6Nr7SqRXGnNQq7G/J6NcFMID66hZsp6SuE8v3FpNNi2L5RYME2n2+sm92IzXo/9EYojRlHVMiQ5Qovalll/CMM1YCuEzsTfomCjF7xzRr/vy7o5QW9fmifEMLueVzmuxY4JpA8/+uKjITmYHCTezU8+SiWGL8SQ3ykVe9GgOPMss4gDj4WqE7qgMgqjTaJV3cFM1azEYctRDJSmMrRlEXA65WULMR5VtWGFZCbcFEi/r/cbxN9RQl8TBdPpvkUg8EEI8b18yQ9GlG0CNRdk5bFwden8QLvq5LH8w3y2nMgXhx2Ei7xPOZrXT8qxFn8GZ3acBzTZwb4nKcV/QERWWp4Oj1re25VBjkn6yU9fYm+o7b/T4s+oXY/LqRGYGzCbr2UI3+z4sdeC2dGoOL7lXdgIqy0aW6/cNa8sXTT8VlRg9qD85l9RfSRllsd81PgH6dPqn70Q+Qpsj4m2aL5gDn0YmAPr0ybkIzDweZt6mfzr0oIsRh0bpLDuW5Wln6v4YwSYqZ+/m0gPP9DhhMcI+VRK7BybtCTWkRsQZC+a6unc0jftHKXBkLEu8AtnUyhg8IVOwDyFRqe9RswMZUBMHjPNhxFJAy4wBCnYagv+An8g8ipZ/f2umI+zI/fi0orkIMx+93A/icAgVoNPD/gyE2LgNwe7jpcnt29OI+DUe+cMoXH/dXBjj1wN1cT2vmD9A6ZjkGFqZY/Frzs9jRcYkNs1QW9vRvcWg3sVYfqBROmxH2S7Avo0fg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(346002)(396003)(39860400002)(38100700002)(91956017)(4326008)(122000001)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(8936002)(478600001)(38070700005)(5660300002)(6486002)(71200400001)(316002)(2616005)(76116006)(110136005)(186003)(26005)(83380400001)(53546011)(6512007)(41300700001)(6506007)(36756003)(86362001)(31686004)(2906002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajhYMVFlNDhBRVY5QUJFSG0zVXVyVUFlM3o5ek1WNUdocHdDeGs3Sk9kNUJ4?=
 =?utf-8?B?ZUZwcVQrcmo2MnNVMzNCSTFZZjZ1bFV1aFhJYlpwWVJWK1dYRDRBbFVPMFRC?=
 =?utf-8?B?d1NGdml1d0RuUnk5OEVmbm1jT1FONEVVeUZkS0pnOC9uelA1TjRWR2h1d2F5?=
 =?utf-8?B?S1djczRvUGI3K1A5Nnd5TDdjVUFlMXc0a2FoRUtHNUNuM282Y1JnTTIySUNo?=
 =?utf-8?B?MkpEaUtZbmFZaUNRaXBkZEorclNIS0tsTzFLemNraTdIWWpDTlVHclBNc3lP?=
 =?utf-8?B?TDFOakpDSmNPbkxrK0F4cURlVzVUNGtnU0I4Q0lSZWkyaWhlUC9GWE5JcXpH?=
 =?utf-8?B?aTR0d0RxNUZheWl5a3ZiYTkvUFNNL2J4NUEzU1c3ZDB1VFpvWHdBaTJRektu?=
 =?utf-8?B?TFlpOUVhT3lJdm5EZnlaT2tlSTZUVXJJYkUyRDZvMXludEt1MTNtL2Q3K05N?=
 =?utf-8?B?Q1VYM281VWdKaFR6NnpDRHM0UFpzeWhwRGVabmNJLzNsNDFMS24zSGxPNHZs?=
 =?utf-8?B?ckRQMDdzRTk2VkNGOTJ0TDB2UWYvZDcxR1ZTMkpaWWhxNGc5Y1IzT3JQUStC?=
 =?utf-8?B?UnhId3RGclR1OHpCelN3eW9HdExNNk9wTTNkbmkwaEN5VlBlWFYycml4eFMr?=
 =?utf-8?B?NXJnaU0rcFZoaDFLN1oxMVdaM2YwSm91RWMxaG9tQmVvdFVkN3Q3NmxZa2Er?=
 =?utf-8?B?UmFKSkUvSGtSWE9KQ1FyT2dJQjk0eU1EVkxQRlh5UnFHOUVrVWtwWHVhTjkr?=
 =?utf-8?B?V1gwcHdmMG1VaUsxS2l2ODVCS0llMkZscjlReURxaFYzcVh1UnE2RDFsNVJl?=
 =?utf-8?B?YmJ3OVA3T2hNajFGOWlRTU51V0REblRxL2VHN2NqMmFObFlCUjJONlJEQnNM?=
 =?utf-8?B?M3ZVaWZMckZrY1ZtN3NZbWIvS3FuWnA2clVIU1ptWEtaOUJXVzhQK3UxVE5N?=
 =?utf-8?B?UERKaDJlTTNxZ1dvTGFWMkJybHRIc0RUSTZVbVp3eGFSQlFobmZLc1NSOE9X?=
 =?utf-8?B?cWZTRUt6aXFsSWo1QWQwQ1V2T21paTVVYmFzZUFVVUlxbTlBdHhXQ2RodzVL?=
 =?utf-8?B?QUJYc1ZUOFlERG5xL0hxRjMrOFB2eWZwTzZzTWlMeVR1ZDR2Sm42NlhzaDJT?=
 =?utf-8?B?NGlQOTd1WktpbjJ6bFV1ZGViblNNM2ZNUVMzS244djFsUUtmbWVoMDN1NVhU?=
 =?utf-8?B?WnQzTWlWUFQrNnhaYU9aV0hKRUQ4NVlycTZaQUJwTXhFYU9IOVlRQUx2SDB1?=
 =?utf-8?B?WSs3dnlGcTE2Tmt4eUUvbmhLRWs5UmVrQTNSZ1pQSG9hclc1YnFwYUJxQ2xK?=
 =?utf-8?B?ZWRzck1JMmRVK1JYNjhQdzlEa2ZBdjc3V0JwMUhNMEtKNnpCQ29TWUFaT0Yx?=
 =?utf-8?B?TERmdVNic3VXRTdGYmQ4WVVKWHZ4UkxlVGI5QVJMS0hkNzRZaCtjcW5WVzJK?=
 =?utf-8?B?bWEyR2RzbmY4aSs2eHgwdGc0YlZuKzR3NUtIWnIwK2h5UXFYK0F2d2MrOGJs?=
 =?utf-8?B?QWFhTWoxaTlTWVZyN2M4bm5GVGtkcjJpdzRWWkdaOFE5cGdsREo0ckRydkpw?=
 =?utf-8?B?ZWtDc2FGVEtCMTRKaDhvcjVPZW1jZUFUTkkzbTkva3U4dXozZnVmSXZyT1VI?=
 =?utf-8?B?TkN4MDBwR0dWN3RkUEZqcjJ0UDFRMVpiWk01elNSZ0wzYU03Rzk1WmFNM2c0?=
 =?utf-8?B?aUpCUXVmWXY2V1k4T2drcTQzRXlzWFhqRmc4MFBOUUNHN1J3eVB5RXNvWGgr?=
 =?utf-8?B?ZVREaURkN292UFpreXpnNHF6K2dDU0Z5WmNTU2dVQUtuL0tkLzNJa0VTUklm?=
 =?utf-8?B?ZmpaVkJFMXNZTDh2cGdLdVlzbDVMMVRoZHZzanRYWlZkU1QxQkJqN2swcjR6?=
 =?utf-8?B?YXRXMG1hOGdudldyL0tPNEluQUVWT0g0cy9CUHl1RzA4S3hNd1hkOFlDUWVz?=
 =?utf-8?B?ZGZqcGpFRnlJb2ZnSzZlTDFBYWw2QTdYR2NrdUplYTB5STBDV1ZtU3VmRElX?=
 =?utf-8?B?YXhiejJFV2lKQ1RSM1FmZVVMY1BsNVk4ZzVWREFXYVVKR0xQbm9oRkxKTkNZ?=
 =?utf-8?B?R1Vnem5UNFJKYjF0NG5jeWRXcklHV0hZb1V0aUVyQXNaSXY3aXhEaGxjNEFi?=
 =?utf-8?Q?UVJpl+gQBl1nbNLqqLA3mdt4G?=
Content-ID: <C166C48093913D4F976845DCE71D0E3A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad911b0-aee0-4c55-7c00-08da7c87c072
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 17:26:11.7347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qAzLBs4vMz2RKfxyOzHkLCXGFuDfhwen3LGmBGau5xcXdHnBBqRqRdGlVz6tEHyu+/GzlpSTJw0HckYFkwB5cB3NkkZm74KWMeGkSjdvp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_102627_634236_78234959 
X-CRM114-Status: GOOD (  17.76  )
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

On 12/08/2022 16:40, Palmer Dabbelt wrote:
> This fixes two issues: I truncated the warning's hart ID when porting to
> the 64-bit hart ID code, and the original code's warning handling could
> fire on an uninitialized hart ID.
> 
> The biggest change here is that riscv_cbom_block_size is no longer
> initialized, as IMO the default isn't sane: there's nothing in the ISA
> that mandates any specific cache block size, so falling back to one will
> just silently produce the wrong answer on some systems.  This also
> changes the probing order so the cache block size is known before
> enabling Zicbom support.
> 
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

I just manually edited riscv/defconfig to add enable the
zicbom config option, but I get the below with clang-15:

/stuff/linux/arch/riscv/mm/dma-noncoherent.c:104:6: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                                        cbom_hartid, hartid);
                                        ^~~~~~~~~~~
/stuff/linux/include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
        printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
/stuff/linux/include/linux/printk.h:464:60: note: expanded from macro 'printk'
#define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                    ~~~    ^~~~~~~~~~~
/stuff/linux/include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
                _p_func(_fmt, ##__VA_ARGS__);                           \
                        ~~~~    ^~~~~~~~~~~
/stuff/linux/arch/riscv/mm/dma-noncoherent.c:104:6: warning: variable 'cbom_hartid' is uninitialized when used here [-Wuninitialized]
                                        cbom_hartid, hartid);
                                        ^~~~~~~~~~~
/stuff/linux/include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
        printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
/stuff/linux/include/linux/printk.h:464:60: note: expanded from macro 'printk'
#define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                           ^~~~~~~~~~~
/stuff/linux/include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
                _p_func(_fmt, ##__VA_ARGS__);                           \
                                ^~~~~~~~~~~
/stuff/linux/arch/riscv/mm/dma-noncoherent.c:87:36: note: initialize the variable 'cbom_hartid' to silence this warning
                unsigned long hartid, cbom_hartid;
                                                 ^
                                                  = 0
/stuff/linux/arch/riscv/mm/dma-noncoherent.c:116:10: error: too many arguments provided to function-like macro invocation
                "Non-coherent DMA support enabled without a block size\n");
                ^
/stuff/linux/include/asm-generic/bug.h:121:9: note: macro 'WARN_ON' defined here
#define WARN_ON(condition) ({                                           \
        ^
/stuff/linux/arch/riscv/mm/dma-noncoherent.c:115:2: error: use of undeclared identifier 'WARN_ON'
        WARN_ON(!riscv_cbom_block_size,
        ^
2 warnings and 2 errors generated.
make[5]: *** [/stuff/linux/scripts/Makefile.build:250: arch/riscv/mm/dma-noncoherent.o] Error 1
make[4]: *** [/stuff/linux/scripts/Makefile.build:525: arch/riscv/mm] Error 2

> 
> ---
> 
> Changes since v1 <https://lore.kernel.org/all/20220812142400.7186-1-palmer@rivosinc.com/>:
> 
> * Everything but the unsigned long cbom_hartid.
> ---
>  arch/riscv/kernel/setup.c       |  2 +-
>  arch/riscv/mm/dma-noncoherent.c | 22 ++++++++++++----------
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 95ef6e2bf45c..2dfc463b86bb 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
>  	setup_smp();
>  #endif
>  
> -	riscv_fill_hwcap();
>  	riscv_init_cbom_blocksize();
> +	riscv_fill_hwcap();
>  	apply_boot_alternatives();
>  }
>  
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index cd2225304c82..3aa3572715d6 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,7 +12,7 @@
>  #include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>  
> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> +static unsigned int riscv_cbom_block_size;
>  static bool noncoherent_supported;
>  
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> @@ -80,37 +80,39 @@ void riscv_init_cbom_blocksize(void)
>  {
>  	struct device_node *node;
>  	int ret;
> -	u32 val;
> +	u32 val, probed_block_size;
>  
> +	probed_block_size = 0;
>  	for_each_of_cpu_node(node) {
> -		unsigned long hartid;
> -		int cbom_hartid;
> +		unsigned long hartid, cbom_hartid;
>  
>  		ret = riscv_of_processor_hartid(node, &hartid);
>  		if (ret)
>  			continue;
>  
> -		if (hartid < 0)
> -			continue;
> -
>  		/* set block-size for cbom extension if available */
>  		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>  		if (ret)
>  			continue;
>  
> -		if (!riscv_cbom_block_size) {
> -			riscv_cbom_block_size = val;
> +		if (!probed_block_size) {
> +			probed_block_size = val;
>  			cbom_hartid = hartid;
>  		} else {
> -			if (riscv_cbom_block_size != val)
> +			if (probed_block_size != val)
>  				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
>  					cbom_hartid, hartid);
>  		}
>  	}
> +
> +	if (probed_block_size)
> +		riscv_cbom_block_size = probed_block_size;
>  }
>  #endif
>  
>  void riscv_noncoherent_supported(void)
>  {
> +	WARN_ON(!riscv_cbom_block_size,
> +	        "Non-coherent DMA support enabled without a block size\n");
>  	noncoherent_supported = true;
>  }
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
