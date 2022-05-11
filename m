Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJGzS4M32SxPiMeMUF4PXqzz5KG2Gf2mKe+8ui+4ZHg=; b=q/WqClrHbqEsmR
	1lSrd3snE57xZsnKlEyr6YOJ6JjPARcuO9NPmhj7lbWxnPJuQ8vWmd1PS6jFIPf9Q2siISXUoiVsh
	Lixcc4znnSVykJpHibochikWeWS+ZhoFd1Oj1OqSwSii5AC6DrILGVlxdqGbkC6brTJ9MuoZ7KM24
	9i4yxfwuBTPsI4CIFmc3wC6CmgpzNeC8a/SYhOkXK4Tt2yOdorCl0bjmJ2iXrv4vyrAN09mWZLNfj
	mMLKmg3OwO6rgBqmEx8mub9wAYVwbcsxEaBbsIYqu0p6FEPOD7g6Jsrihp3fuelA45z6DPKqkL3Ti
	lD31LRYWHlQXKATGEZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nojJ4-006ICu-5e; Wed, 11 May 2022 10:10:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nojJ0-006IAw-TV
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 10:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652263854; x=1683799854;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TdXNWLQQ57BTpmok4IT+ON33DA6ApFafQj1qFBll7jI=;
 b=l3zyKtPPP+9c7tvG9KegYdGfHtOUi0e88sZdPm0AWURXGkQsHIUKP6Qn
 +Y79sTWA7APK7rWYMYE0X0Ntj1DaoWUuiRz+JAslYybo1UBX0XPqC300D
 iExrc20BeuM6YlpiZ5efMNpHYNPKroxXpM+NAnf2iDSJWs3z5rXnLSN5W
 CARWF6PZYiB5ZDUmhUkFvf6zj23RTe1mAmBjg6KoPtyBIIQhwpH3T0V0m
 0TkeLfdN6HYeJ0F/ffBBvb1yTfvk6fSJORAXXJxJoav5hE8+/OBerzqXY
 cIbIfttLPqXJ4AezBC+gfzVur9x2afLCN7W8jSxXXQYrzeQ6o8Js2Y9LD Q==;
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="163573163"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2022 03:10:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 11 May 2022 03:10:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 11 May 2022 03:10:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mcs0x+ekPtN1X/oMQ6IR26H3wpigCVVM0LVKJz+Drj75lumqnYm+XBDK4OEF1CQU1C3xhiL4bRBEf4IWm+38ZJ7/MA/33WAr9VO3WIJL7pvlrOSL80LEnZUsf1HNpuX/4yXKc9XpOaK9N53EUFqEfp+doqskoLIFNkagzsNdKGQCAsxQqNZC7oDWJIvz40l691YnEnakN97Uqh6odsGfJDRqI9AljddOSZtlBTggMQ4qik+oXswuKyueYJgW7AM7p4YuSko8USdjRan3W3B7wRt2X2BFfKJVTw3R5G7mmNv9HAT4mq7gjpvkux3/WLPfAcutZGHSy2WU3VlqUdJnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdXNWLQQ57BTpmok4IT+ON33DA6ApFafQj1qFBll7jI=;
 b=YC5wkawyplZU5O2zzUozpr4W1Fz0w0rIBu5pq59I8KpyBcAbHUrSN/qjDXVVRGXxZp/8MDlTlpl1E15+3UIjYxULguf21fNwTCAXBgtEM16Ba7nAs6Ucw/Fqu8uT0lmn9+vuOjM3mAQygBYBMiU2HPL9sIvIwxs+ey0J9ziNRPxm0LKgGraWtuAzy/lbCIr/ZRuyzTfSMbbXYVoCFjn0nFcsR6DuKzBVq5x78uK0OwRO/tsv0ib4J+3dT9BknpCgsiKayiV9kBlXhDhAT640K+jyYwh4QlLCNpTDWD4u9Xw4KDtOXk7AYjx5G8UPRnVbtc3Aztp/oHcFlSG0ihd28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdXNWLQQ57BTpmok4IT+ON33DA6ApFafQj1qFBll7jI=;
 b=dQn2Q48RxDaJyrOjzUx5kVQ5Krwv4pxWxnX87q+CwACaO8x3fwtbvZDpEsNjBvLJtrJfFzDJHXqFKYAcC1Mt8F26lCc/AwyeEBpikxlOWOSyois4YM0/xe7wFaHq0v+aatMdIV9tsyZ4YXesY/EPrcQA/QV9k0H4xerJ5EVfQ+w=
Received: from SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20)
 by DS7PR11MB6079.namprd11.prod.outlook.com (2603:10b6:8:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 10:10:40 +0000
Received: from SA2PR11MB5163.namprd11.prod.outlook.com
 ([fe80::11a3:9d10:d099:16ce]) by SA2PR11MB5163.namprd11.prod.outlook.com
 ([fe80::11a3:9d10:d099:16ce%5]) with mapi id 15.20.5227.022; Wed, 11 May 2022
 10:10:40 +0000
From: <Conor.Dooley@microchip.com>
To: <hch@lst.de>
CC: <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for May 3
Thread-Topic: linux-next: Tree for May 3
Thread-Index: AQHYX5FrH/BqiZa6/06OwkWdFdBwha0Wk2YAgAAKyQCAAAevAIABXEcAgAE9tgCAAAeAgP///8QAgAA4D4A=
Date: Wed, 11 May 2022 10:10:40 +0000
Message-ID: <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
 <20220511064832.GA761@lst.de>
In-Reply-To: <20220511064832.GA761@lst.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c1767a1-a092-407f-82ea-08da33368070
x-ms-traffictypediagnostic: DS7PR11MB6079:EE_
x-microsoft-antispam-prvs: <DS7PR11MB607944309D73F97FA9D6B5AB98C89@DS7PR11MB6079.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vEwhL7DEMUlgUzpRIgdYKbyIZwRLJxUxu6OW8qKdQP7MCU060eQMwBSK8MLZ81Y+LbqTfBc0oW5qhZa61cCujsgLPw6qvGRIxmLp12cQAotdXopE/ltIJIFHTNZQkRzrvx2oDutP5FjUkEyLy2kJbdaVqg0f92fQFzYaEUxLBVOABjkINUFNRClNryLdMSeIO66jT1hrsp10+liX8riN2QLbNGMwxUeXBjF2PxHBkCPgr7YILrKYC/AQNBe6DCMjZBUP5UG0nvmG/44+H1N2I4z1Cj3cgBx2Nka7KtmMSVVUaFgvFW1CFe+uuj5DYUh/oy5MX4sKYhDgfl0FqLe2+NYgTNWY4PXEJ3OnbX66G2ewopFg+TzqhSDj0GZBJu06bPkSpadgNnli/T40UXSbudDNVJe0vEs+B1a3ULOOCZfi+mnTstu3vq6iDW3GCMzm2pi9xwjyawY4sm/1aPX8hp6itOcA/Nz/PBFF/Lh7BcOTU+RpmHQMNhkdajjdrcQRQwCxuPciwWMyAAoNODW/mvt5dervB9zszGkiro7Q6eJ/R7VWPyDsZiXzJAIftzdF8S4WhPOZl4nvxi5+xH1Oaeb5kLg/Z/iVK2+mgblHeGCnhSJ9fedZVrAJ7imiZ/59kvYqtRCpRR0zU0W+FPfsqZ5iCysjRlkK4yFbc4WkrX43fleWxgiX53sfycUhpG3fHBgT9N49M7TzNs5/KmSiCDpu0H6B+OglHkdiNHya4L3VW8zVwyO4RPkYqwy40JAArwI7Y62IF/jKS6gClsj2DA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5163.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(186003)(2616005)(8936002)(66556008)(66476007)(54906003)(36756003)(31686004)(6916009)(64756008)(91956017)(8676002)(66446008)(76116006)(38100700002)(38070700005)(83380400001)(66946007)(316002)(5660300002)(53546011)(86362001)(6512007)(26005)(508600001)(71200400001)(6506007)(6486002)(122000001)(2906002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V01CeFhpL2hNb1AwZERJVTNQNFJBVlRoSnpCdFhISUtKOE5yVlNkem02dVQ5?=
 =?utf-8?B?YmVHMGNRYUNuOWJkSTBKdkhORVRrY3Y0dmFhKzFVL3dVQkZnSlA1b1ZWdVlZ?=
 =?utf-8?B?dXF6bFZWV1VZL3RrYnJxNVVKblVaajhaUEZIWmhiVDlMSzJiTG1TUm9yMFFR?=
 =?utf-8?B?ZVEzR01EcFRLWmdLY2ptTnFOa2NJQUlNdnRuUnI0MXJCc2l2eTR0KzBCTFoy?=
 =?utf-8?B?NUlxOEhTUXB3eDFDMXpOdVZrTnUxS21NU2lLSkhFWThVWGg0WWZlMko1VkM1?=
 =?utf-8?B?N29CQzY4alpxY1QwMkpoVWJNNUZYWmQ5Q1BsU0Y5eDJGaE9EVWxkRTZZbk9y?=
 =?utf-8?B?RFJBY0ZSbitnWndDRUhlTXd0ZHZJcCtLMVdRVUx1SjNPUXM3OWw4ODdqS2xo?=
 =?utf-8?B?VVpIbk53SEFQOEVCTHAycStyYVY1UFBNNDVQNHk0QUtERDc4V3lZN3lGbHVB?=
 =?utf-8?B?KzVnR05Lai85bDhSRzIwamlzNmlTd0RVVTdsWlFwdXFocENhOGxBTzFTc1Z2?=
 =?utf-8?B?WjVXN3hEQ0xkeTRIdzFaaG5zdlh2U2x0aUVMV2IrOXlGTHcxNjV3VFFMK3VC?=
 =?utf-8?B?bU1KeWxZeW80Tkt0SkswaVRIb3FIbC9VcmJhQjJBelF6S1g2RmFyZFNyK0xW?=
 =?utf-8?B?Yk9lQVdYaHZIZCtPejRxVjRyeWhVMU44MDRhL1llUjNTTWFHRlI3T0pMMTJS?=
 =?utf-8?B?L1FhWElwSUZLb05MMU8zRUFpUjdJMVdvVkozZGxQUXRDaWQrUmV6Rmt3bFhJ?=
 =?utf-8?B?d1ZqRXozQm5ScXRPNnc1WVpKZi9aU21zYklTeTI0ODJ5OXJ4cjB1RlR4RDJq?=
 =?utf-8?B?Ly9BRjRrWXRMOTlpUW51T3UzUzY1SFVSakhCWHdvM1FkTTZieFhnbG5HNFlk?=
 =?utf-8?B?eXhKK2d2NnlhVjloK0t3VWtnY0pRSStPWkVEM2JPbjkvY0YrTmhhZ1I1L3Ur?=
 =?utf-8?B?eDNubW5kc2h5Q28wcFhqblgrOXY0N0hsVExGQmdkZHprVUZXSXdPVEVnemVU?=
 =?utf-8?B?RDRBd28rV21iajNINWRmVkg1MUdxcUxYNWFRU1Y3VFZjbWVJRTRKNENucUI0?=
 =?utf-8?B?TlF1NEVMN2JQUWhJYWpVbTVINkdIeWxyMjh5T0dnR25Ib0xORU0xNTZINnZG?=
 =?utf-8?B?Ulp4ZWJiSVQ0Qyt6NWZ4TERtYVh2QTB2VytNOWZGU0tRZzhBZVRUaTZCMHY2?=
 =?utf-8?B?VWtvaVd1anI1RjZpUWVvb1MvZkZLZWo1V0VIQzlzOGJWcWdLTDlRSnlPRStJ?=
 =?utf-8?B?cEgwQ29DTmMzUTJRMEdORUhJaGdvQlk4MkI2S29vY3ZOS3g2VXo5YVdzck12?=
 =?utf-8?B?dTNQYXZ1T3QrdHN6R0VFU1pIcC9NOURId3VZSGRVTERsa2ZyMzFGS3Q5REh3?=
 =?utf-8?B?WkdqR05oSS83LzVFOHoySmF4VUxVKy9wTDZSWmY0eTZMMUN6WkxxVStVVzRX?=
 =?utf-8?B?amc3UUxlRXZPT29UbDRIcVlSTmlRMmtaZUl4V1RCamcxVVQweTU2S1BCNlo2?=
 =?utf-8?B?R2RTMW92VGEvemhXQ0Y1YzVPb0Z0ZldQWW04d09QaDc4WUtRcVd0Q20ySEpO?=
 =?utf-8?B?TnFvMnFxWSsrQ0RaSUM4T3VwdXBlKzFkVkk2enFzdWtzUWFrUHQxV3NBMVVi?=
 =?utf-8?B?eThLWlc4T01jUkFodjJxYm5IenZDbE9qZFBTdXc4eTVSbXY5Mmk3WnEwT3lV?=
 =?utf-8?B?SUpWeC85b0xoNC8rcXBuQ205S2ovTytPblU0T0RqdnZVSmZQL0NHU051WGth?=
 =?utf-8?B?SEVUOXJkdlhudzRWQldHYkExeVNTcTFCd1kxakh6cjQ1NzMwSnp1MnlOZ1Z4?=
 =?utf-8?B?RGRhTTNjcWFjaXVuRjh4cUZlM3V5bWFuSGNXd0todFJCSUg4VmhUYUtDUmcr?=
 =?utf-8?B?MStDOExuWmZFSjVWdExTd2RuV2dXZ2pkQjNRK24zWHJ4dnV2aFgzREpyUUE4?=
 =?utf-8?B?VXMxRXZOWittVjc5azJoN1ZKSDBOQWlBemFONUZpWUU3TWVRVnhZQnFNYmdK?=
 =?utf-8?B?Z3NwK1NBMzZmZWVQQlpWRHd6Z3JUM1QxQnBmMnMxRzBhK0k1dk84bWJXT2ZL?=
 =?utf-8?B?QUJjaFA0MmlST3Z6NnBiemd3KzJ0aFZKVXMxVGEvZ3VqT3Jra2F2RXgxOTRF?=
 =?utf-8?B?OER5blN3TU4vRCtHTkZ5eFJ3RmU3dGVqV3JQd2xENU1CS25qZ0I0MGZoblkw?=
 =?utf-8?B?eUcvOVpTbzhuc0FLMDIvR2E2K09uUm9wRWVra21FQ3FIajFhYTRsZlV1dkFt?=
 =?utf-8?B?WUExMGtxVDFEOUdTRkVhWGZUYXRlWEZRNVZSdlBCSFl1SnZyaTZ1YVJIcVlF?=
 =?utf-8?B?SFZtRUFJL2dTamZmeERZeFdhaStBdXZOOE9DUVMzRE9CVjhNZ3F4dz09?=
Content-ID: <CD4F527540F442479BA08EE19400558E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5163.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1767a1-a092-407f-82ea-08da33368070
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 10:10:40.1985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgP89Obl9jLFiCqbMrlA/ktxa8j9mTPOxrHdavsiC77duPtH0vkO7fxFn00xFQjS3Vh0kmQIQLT205OsBd5O1okTU2HHdQDvd3VQ1OM1pCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_031055_234723_A75A4A3B 
X-CRM114-Status: GOOD (  18.60  )
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

On 11/05/2022 07:48, Christoph Hellwig wrote:
> On Wed, May 11, 2022 at 06:44:22AM +0000, Conor.Dooley@microchip.com wrote:
>> On 11/05/2022 07:22, Christoph Hellwig wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Can you try this patch?
>>
>> Hey Christoph, gave it a try but nfortunately, no joy!
> 
> Yes, while it is a real fix, the problem it fixes can only happen
> with Xen, which is not relevant to riscv.  The only other thing I
> can think off is that the allocations were always failing on your
> board, and the patch makes that failure fatal.  For that try the
> patch below.  I'd also be really curious by now about the kernel
> logs from a successful boot.

Without even trying the patch, I double checked the boot log from
3f70356edf56 and I get a "software IO TLB: Cannot allocate buffer"
With the patch its a "software IO TLB: swiotlb_init_remap: failed
to allocate tlb structure". So spot on & I feel like an idiot for
not spotting that before!

Is failing being fatal valid, or should it fail gracefully like it
used to do? To me, blissfully unaware about swiotlb, the "current"
behaviour of failing gracefully makes more sense.

Thanks,
Conor.

Here's the start of a boot log from v5.18-rc6:
[    0.000000] Linux version 5.18.0-rc6-dirty (conor@wendy) (riscv64-unknown-linux-gnu-gcc (GCC) 10.2.0, GNU ld (GNU B
inutils) 2.36.1) #1 SMP Tue May 10 08:25:21 IST 2022
[    0.000000] OF: fdt: Ignoring memory block 0x80000000 - 0xae000000
[    0.000000] OF: fdt: Ignoring memory range 0x1000000000 - 0x1000200000
[    0.000000] Machine model: Microchip PolarFire-SoC Icicle Kit
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000001000200000-0x000000103fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000001000200000-0x000000103fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000001000200000-0x000000103fffffff]
[    0.000000] SBI specification v0.3 detected
[    0.000000] SBI implementation ID=0x1 Version=0x9
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] SBI HSM extension detected
[    0.000000] CPU with hartid=0 is not available
[    0.000000] CPU with hartid=0 is not available
[    0.000000] riscv: base ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: Embedded 18 pages/cpu s34040 r8192 d31496 u73728
[    0.000000] pcpu-alloc: s34040 r8192 d31496 u73728 alloc=18*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258055
[    0.000000] Kernel command line: earlycon=sbi debug
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: Cannot allocate buffer
[    0.000000] Virtual kernel memory layout:
[    0.000000]       fixmap : 0xffffffc6fee00000 - 0xffffffc6ff000000   (2048 kB)
[    0.000000]       pci io : 0xffffffc6ff000000 - 0xffffffc700000000   (  16 MB)
[    0.000000]      vmemmap : 0xffffffc700000000 - 0xffffffc800000000   (4096 MB)
[    0.000000]      vmalloc : 0xffffffc800000000 - 0xffffffd800000000   (65536 MB)
[    0.000000]       lowmem : 0xffffffd800000000 - 0xffffffd83fe00000   (1022 MB)
[    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (2047 MB)
[    0.000000] Memory: 991276K/1046528K available (6534K kernel code, 4865K rwdata, 2048K rodata, 2165K init, 334K bss
, 55252K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
--8<--
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
