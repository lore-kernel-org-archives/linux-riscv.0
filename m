Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5594FC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXcCvQ51DiOGtCDz2ZV5E1ZLSLrzF9aRrHrzjRMdaC0=; b=rzn5sVcUCedgva
	jVXYcv2i6lp/eADe8C6csGOmvMVwXLdat8ekzHejYLDCU7x7Wql+oYuyWNAzVGqk0Nmiler8GndAe
	O5XmaRu+yaZ7W9lHradvzCs/n3Cbt7Opsl//q+sWGpkgErLUPaJ53aarkXDwDloyVPlN+pk5I/XBf
	JAQS/gCWP15Shpep6osYaZi8WLA2J0ebkUuwEbcHLBmUz0FOlk+oa2wT8Wf/962FEt0tr67xp0T8G
	HHo7IgMkAKBlnnLw55/Wl7hADodONe5DOrKz7DwfKDGP3JrSa+mB5e94/RAmEYzox2V+Z5qtPKKcz
	wVg6OE4pbuGzP2bp4yEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDlkz-008Qrp-ME; Tue, 19 Jul 2022 11:51:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDlkv-008QmB-JI; Tue, 19 Jul 2022 11:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658231473; x=1689767473;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YoE46OflTzmSOHE1RmIe9Ck3lnRcjtoGPmpd2d/lp1c=;
  b=sXYwEqBxgOSz7Y8yjQI6OvZbc+W3Dn4tYyjvud1punU1pLC1gbyGpXD/
   X464UgyPsSRolqNVMSEDfnuDfD9+4MxK2S5kEcIUXmN+G3Z6xpqfNuzU+
   PwwiCPouROD2Yay8Mc3z10DJwcHVKz6IqaWfkXRaSkuq15SHFXU56i7l0
   g0cWgUXdRb/Ss0dUAh+kXFwnIGpYqYWWo8hINh3F7AkvlhrW6+qaCMnDW
   CThEdV4YcscHOv9980PNKbzqDiX5UYglbRAFrSQFwQpLpr9Cr4exNF4kH
   bPk19X/g1/9DNwSYfY6wkSR088IDO3zukNo8m7st0TvCmtn+UtbzT/TYv
   A==;
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="182801206"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 04:51:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 04:51:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 19 Jul 2022 04:51:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmkpUGqU7912uEcg8BbBiHw9oiWzhj/7tLKwe6oPn2eQ9aWiB2j+Q3tgo/p4U9bIaAZJjiEyfvtwgOyyOHuIfNCtww3P+i8eIbmwOdA9xpQjTqqNzQf5h8TXCzSjNSKDqunzgx6rs5VuIMq2Coats6BsOvNjP9+XOYN6Z8M0H+IePWsaYO1Y8q2dSn4AJKBcvNaOlSwwn/qFKru9l7R6cWQ1t9j5ktSsWaFblkQJKsaFbRfFOAk9rAKxC2kw4t+IgTbfnZJIBBkRWNRYfXwhdP3UT857qphJsry+rZHZffFIgS5Q+55ZwIutRkH5AYR3AtA7qYsx9nn5DglC8TXnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoE46OflTzmSOHE1RmIe9Ck3lnRcjtoGPmpd2d/lp1c=;
 b=DkuFWuqyDHu3XvowF9kb16Fw9a7iUhWrzt32laST5SG2ukPkd1ZhY6su5A4155ZfNRF9Uib6KHMIY1ovJY0sU4RG21gjSPPGPPXUkXBqsy+k05i19ox7mKkZVOKQFhWufs8eNvvBPC/blbQEHsDXKbZXc8MwNDBl+Nss3wDXkU5A35WVxr5yc94qr7ntOLtCyBUxbZbIx+0xsPtJpiIv4PjoFNbNHVUG+/ZwvtaL79kt4frJnurUXAmVoUn+dKfXPFt9YtL89D36VeY9I2bi7CWf7gX1ePQkzWSSGfdyDSIRrkujhlR2k+CM8vtbRpvvgapzgePohBCqplcYS9OBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoE46OflTzmSOHE1RmIe9Ck3lnRcjtoGPmpd2d/lp1c=;
 b=FRtRKSaLFHlXJ/HxI5axX8RqoCA855ijmVG2ZbYN8zvX3Mj/3qrMRIPyr2HGdcinODyYhvDIjk7yF01q0fLwg3Zj5eIhNARNwi6GMX6uoLuuKSWeXovctrBQ+CUsIEo/HicRTGFhC8FEDF71y5J+CKUi5YkNvUDZJMQ5K3+SBAE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1824.namprd11.prod.outlook.com (2603:10b6:300:110::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 11:51:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 11:51:04 +0000
From: <Conor.Dooley@microchip.com>
To: <catalin.marinas@arm.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <sudeep.holla@arm.com>, <will@kernel.org>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<Daire.McNamara@microchip.com>, <Conor.Dooley@microchip.com>,
	<niklas.cassel@wdc.com>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <zong.li@sifive.com>, <kernel@esmil.dk>,
	<hahnjo@hahnjo.de>, <guoren@kernel.org>, <anup@brainfault.org>,
	<atishp@atishpatra.org>, <heiko@sntech.de>, <philipp.tomsich@vrull.eu>,
	<robh@kernel.org>, <maz@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v4 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Thread-Topic: [PATCH v4 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Thread-Index: AQHYmHP8H8qT+Q5YTkyKfQcjXDX5xK2Fl/AAgAAC4wA=
Date: Tue, 19 Jul 2022 11:51:04 +0000
Message-ID: <198b0486-29e7-9729-d137-0470e93038fa@microchip.com>
References: <20220715175155.3567243-1-mail@conchuod.ie>
 <20220715175155.3567243-2-mail@conchuod.ie> <YtaYTgFDpGSsG+H0@arm.com>
In-Reply-To: <YtaYTgFDpGSsG+H0@arm.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba29e9dd-2a4d-4345-43f5-08da697cf5cb
x-ms-traffictypediagnostic: MWHPR11MB1824:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eHe/QgxpXFiyqT5wCqjlhFWXVE2B0tj71hpVn1/bvVef2CS5Tr+oM9d4CT0HIKz/MQ0hBdfgRwGo4fH78wRnvh+j0+RGRBhLJ1y+TghlwkYGBCfabVQkfUYo6i+tpbKi6Zn+PacrSnwuncxGfP9nSlauzMizuBSZtZIpEKn2rDx8x7eFsal99ZuQeR7HkA8PZRqIPnUvXVpeQ52S+vKiEf+hFCVFJEprtNmxXLMxXJgfglTKAnLXQ/sZ09iorScnd+o5ngchCqz59i0Yh9ppF7gBCouvVi5ZzapG0GP420RFZM6C/fUfzxPSSnQXdKkgi+ZVUl0R8lEGeXjgaTuVN7GCUPWXtatxX1fRhy/IJoa6eOqqVepVuTdILgVczX0vGli6AoSlk1cDrqDEhbUT6WFuy0+CZavsTVC5Odgwfg/JvToAjzxhDgElBg/rEzkgvQ6zhhoZLHyZ/Upi3XASbQz7ehSS6IaUqzTnxD837HXIuQYaHl2/BtRpl5ZHc57np8MYgj/FMdoiDe3a2uh85vwEVNwAJ+dcX/SyqTw8QQ6DGq8D6lqa4HodCHa4LOpWxkZy+B93xJNP+w4D/0IwzaLWlEgtZTYOLSAYEkB/xFtvu4ma4x33LJFmSmZdagIHGmnYOb0UxBSsDxJrD+U6EIiFKW8dVKlrbx5eNfTrRIJ4t6qRfi8dgCPikUicsXS/qU37cG1pSScYTpV6YQvxnf3Hv2k+tCo4KNnmN0RzFEiodmVV/2sww/B9iwVg7rQ6Im0vURbcev/MJ/GLBS+3xdUQbkJsij+XofPwQxAPrJ7Y6flxlNf+KfXHE+8ChmotIwfPQRPPHhNPWdvpDfC2sWaiTyfrDkNmjBfxwotjfjNOj0rkkOIaB5LKVlyIxx5Q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(376002)(366004)(136003)(53546011)(6506007)(54906003)(36756003)(91956017)(6512007)(31686004)(4326008)(26005)(66946007)(6916009)(76116006)(41300700001)(71200400001)(316002)(8676002)(6486002)(478600001)(83380400001)(86362001)(31696002)(186003)(8936002)(2616005)(64756008)(66556008)(66476007)(66446008)(38070700005)(5660300002)(2906002)(7416002)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkExdW44Q1hUZXMyTm9oU0xXVGFmRGhOak9jQ0l2Rk8wUTgwUEZFanNZS3hC?=
 =?utf-8?B?YmxQbG1LdTBRZWxjLzZsWmIvaGQyVlhJNWhQWlY5MGVpdDVBTDdHWEhxSnFr?=
 =?utf-8?B?NEl5TE1ZaTJYTXlMMlpTbEVZaEpiS0RDcFlUWi9GaWpTUVZpT0xHZXhWdHpo?=
 =?utf-8?B?M0NrVEgxUWNPeFh1T3EwdzdTQXlQVWtZNElhVGQzYVg5TmVJbUVtdUhqa0dN?=
 =?utf-8?B?NWNrYXBmQnpXVk9vekxpbzhBQktISEFYOU9xeUtuTm1FVjllUU5iUlpDaUdr?=
 =?utf-8?B?akhkY1VaWXlMbXZRODN6WlVTYXlOMzJFdThGNFhVOVc3Q3BldG5TTlBwTTVC?=
 =?utf-8?B?eUo2L3UyQmsvOFZaV1JYckJ1cWtFalk0UVlIN05rOVVpWno5SlFsNkx2THpI?=
 =?utf-8?B?QXB4c1UzWG1jWlU0bmJvTnp4Q1BGcTY1ZXova2xMTTVmUGVFaXdkRkhDTXlj?=
 =?utf-8?B?OUdkTHBOQys5WWVIVHdVN1JSRUkyb3htelFZbkg0MFZhTlBrZ2lEKzhLc0hj?=
 =?utf-8?B?dGh0T0hoczR3ZXYwNE9PRUhtUGk5RCtXMFBlT0czWjBxWkh6aWdxTnJCVXJy?=
 =?utf-8?B?RVlrT1FDWG5pUmtwNVc0UEdpZHBZZ2NWQkpHR2wxcTE0TEZuS0ttSjAwMWJy?=
 =?utf-8?B?MXBNQndlblE1eTdJZ3hzbU1LSmFUeFI3TGU5MzdtcXBjTDNiOG02VUVxRUJG?=
 =?utf-8?B?WGRSZlc0MFBRMDRsdSt6dm5tblE1bm50cnozbFEvVmJiV29YZk5qY0FHWXJv?=
 =?utf-8?B?aGdhbXJHaGtuZFhPUXFzWjFhdU5RVXZsMTdjeU11WHZJZkRIakxaWDRUeDhL?=
 =?utf-8?B?VHhxV0o0TGpUV1NNQitCcG1YN3F0R0xQRWU2eFZJQVNZUUNRYWhVQ3VleWFP?=
 =?utf-8?B?QWN2V3NiWjlob1Fab1hmVUxqMC9UZGowUlMrQXplMGJzM25zYWVlM3J3RFdl?=
 =?utf-8?B?N0hmaUhRdVlPYzFycFZET2ZCbGZVMFpmYlByZURVdVYvaGN1TmpGWFUyS1NG?=
 =?utf-8?B?MVpIbFJCbjNNRVBhS016UEJKSlJkWS9ndUxSVnJGUko3cG9HUmFjbGFOc2My?=
 =?utf-8?B?MlZVK2kzbHczQXVmbmxDUEc1RTZDMnhBbDR2VS9qNVRNR3FzZ2pjbUZneHR2?=
 =?utf-8?B?dE5pdVdtNVN4cVVYYXRDcmRDalF4U0NEUWNoR2JISnZsalhRNElDZU51ZW1h?=
 =?utf-8?B?WWYvdnFDMEtieEZFeDhKSkM0dmh1RllyRVl1UElKbk9RRDRMNjc2enA0cm5Z?=
 =?utf-8?B?WjM1VjRVYngvbnBSR1NMSkdTQjFTanVrSzg0TTNOVTRYQm1tcGNQdklQQWxL?=
 =?utf-8?B?YzIrQ0twZ1F6ajFiZVZMNktacGZSYlYrMnlmbWYwN3ZXcklmMnBCSlNJSVE4?=
 =?utf-8?B?Qmh5UUdyaXlRSWg1RCs3aVFUNXIvWWtVSkpZSVRuYnlORCt6V0NLMFNZTS9a?=
 =?utf-8?B?MFJsTVVXOUlWVlpXTDN1UDRwTHlabGVmeXN5MnNZSm80aVRFOVFOb3VJc2VQ?=
 =?utf-8?B?WExVd3o5MERvcXZqeUppdExGODFtWllmR0t2ZEdDYStlV0x4anBVOUpEdkN3?=
 =?utf-8?B?ejN4eFJDTVE0MXRaMldBUGJZZTVOQzhnSUFIM1hwaE9oV3RGTzBJeTd4bXRL?=
 =?utf-8?B?SlJibVhTR0c1VGExVlkvdTJGNytqSUZTWm1kUFR6M21yVUpFZ0lWNFZ1Unh0?=
 =?utf-8?B?V3JuOW03N1o1b1JaVklKTnBIZzNKcnFFT2hZRVczYzhQbEp1Q24xSStEWXAy?=
 =?utf-8?B?ZlVZSFA0ck9aT2tYYW0wSW9yZUovUjZEMHFRQlh4Y3gxOGZrZXVXOXpXQUh5?=
 =?utf-8?B?VzluVEJPd1dtdmRNWW92TjhHTWFYUlpqT29FaDgyVTdsaGhqMk1qaW5oTTF0?=
 =?utf-8?B?ZVROaUFyWVlzVjJZV3lXVzR2NzB4d0JWTHpnWHB1NEpXTGhzcVp4ZkhIM29j?=
 =?utf-8?B?UjFHaXV4WGlpQ1NvcDlodTluWW9qc2hDako1RCsxRy92WmlnVy9jZ2Zkcm4x?=
 =?utf-8?B?YjNocERvUjdnWk5MUzB6QkFZSGYyQktXekdqVElaODFXRTgzL2NHZW5hUm9h?=
 =?utf-8?B?WnZraThzTzcwam42TGhlQkNaUEJHTWhjYnBuM3BXNDFqNWV3U21abVFuRmVr?=
 =?utf-8?Q?UmFn8IcapB4pwRNMS9SdqmxbC?=
Content-ID: <2EAEF99E86AB744D824BEFAFCB4732A4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba29e9dd-2a4d-4345-43f5-08da697cf5cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 11:51:04.6790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVx1h3s713OWHjCkuzkH8X240GHYzJKCGWifemXUZPpQdnjVZ5TccyDRtIS5U3//pDiTFGw3gNSn5GABVWIeiz2a8Ehf7HWbko5nMToj/ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_045113_938270_825E0301 
X-CRM114-Status: GOOD (  16.13  )
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

On 19/07/2022 12:41, Catalin Marinas wrote:
> On Fri, Jul 15, 2022 at 06:51:55PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> arm64's method of defining a default cpu topology requires only minimal
>> changes to apply to RISC-V also. The current arm64 implementation exits
>> early in a uniprocessor configuration by reading MPIDR & claiming that
>> uniprocessor can rely on the default values.
>>
>> This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
>> topology: Stop using MPIDR for topology information")', because the
>> current code just assigns default values for multiprocessor systems.
>>
>> With the MPIDR references removed, store_cpu_topolgy() can be moved to
>> the common arch_topology code.
>>
>> CC: stable@vger.kernel.org
> 
> I'd quantify how far back you want this to go. IIUC based on the Fixes
> tag in the other patch, it should stop at 5.4. If you send a pull
> request instead and have a fixed commit id, you could add it as a
> prerequisite on the following patch without a cc stable here.

I guess a PR might be the easiest way for it anyway, so that both
yourself and Palmer could merge it?

> 
> Either way:
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
