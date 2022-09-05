Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B3CECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWg+0Nm0orBhgfEmVVE+gVVodh9mckDwZ2Ptt4kdNFo=; b=YjMG6QcwHwbR0J
	CVo2qNyGcBa/syQTWzvI7U4fDVFIv5OatVuj4dyy3ZvLMxNBDBhxGu1UthWGPc8mRDckh/2ZGvL3U
	KyS2x+sSNmCV1h4Da5NylaXTS0wJMmyozvIGRSMuwefbPsZjnQrzI/sG1SFsZf8DaAF7JQ/4DB5nB
	3yR+B0gfSAJLet4gSkZ88/cSj/f8eoMMw5LOss0bGW80EaHr5zO5JSefI765k9SWvKe4VC/ef3N/t
	46A/QzdmBeHpkkCGCDtiNMWccZi3BFISI2kHxD0NXNKZSAWYJvyG3AL4zK+QyoyZ7j9qKy+q+9F/E
	I3uwz9OaBz3D3wLo8yPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHi1-009El4-3v; Mon, 05 Sep 2022 19:24:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVH5b-008dN1-KY
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 18:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662403495; x=1693939495;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=ZCsB/lVFWfGhXiV0l4jtmoYyz74PN1Ez1rQQdMCMYfM=;
  b=k5E6PkRTdnZ2d3IjE0I/1Ng8IjMRb61Pqr2eWjMSZ9/Vbt/TNq2ntrJU
   Sy26BBfUceS8e04o+6d5QebzYjHUSHDXc/MF9U6SxXQGUIhrlqLyI6hBn
   SzRoT9XODRngL3Y3GG//3jwHsutfJV4dtgHZnAlZXoNAzFBDUM/4LjDwk
   p2OdzBV9LMQqzTaJk+UAO4H526toAJwqG4j+KS2Pgzja+KB08TTRqEJP/
   0/AAwrorOBKnMSUDac5yLoY/NSG31bDBL+bivSe5B3RT9L+iOnXOSLf22
   X6DK52tlTCrhUlfjqkRTl6WIpwhNKyW1dC4Q5me3tT7OA8QLDHZQWFVgT
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="179245551"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 11:44:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 11:44:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Sep 2022 11:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bb+ILuILTyNpqY5p00bEq7Z75U8qmt9Mz2uyAwiRGC4ELcWO3QLBGOSuBNPMN1UaaWMm0dJkrM8dik/MGdwC1OLoDS2cih5iO2UCGAaQvy3zHVBb9+/7gnBUd2ohABiRoMQMY17wajFpGJsCtHgF6PUn66DCp+UhGrDfFo8ngQ5aNc3GUix3L7UhNxw4AKyjjd/9rJ2ianeAUN2YNP2U7mjS8hWFAdW7AEj4CAZQggG5BkLKbuhVnaJGkLemIrp+eHJs9WyIXHr/+xKYz8mygRFRSihG2sIhYLQzwIuJgyaOKs7B/0pLqYyCnFXwcgmyF/wWSUXYxNIdqo+CtlTMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCsB/lVFWfGhXiV0l4jtmoYyz74PN1Ez1rQQdMCMYfM=;
 b=ObI6Rvy+ZxQmGnnv7MQB6G/7fDxd1jynpHJnWwPhPyDXRk4qobenIU3CZr8TOZqhen2HfDMbI6CzOrcr0zixePdoZMbs9MuejFQizJ63wdG/pIP/CFmUE4/IFz7DbneSWNreTfjVVHS5VpbN3HIwczCp1mw892nCyx4zNTH4o7iDq6vu7ym7TsdQn1g05UMFGWGkS3LlfzWmfs6ywOk99yw7Dx97wx+gW/3e5xEiFgO/fHi/HgbvtJX4IJS/zT2P27BUjQ4V3SL7o6JRp/oBLlsIy946P4umhZSpVNnoEOf8zrYQ3X2+mgCU5Zj5K4hmAoSVos7lE8rYUhrg8aCrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCsB/lVFWfGhXiV0l4jtmoYyz74PN1Ez1rQQdMCMYfM=;
 b=oeIyKwMnT2iK9EDsqt5OjAaMR3P04tGbGJsF0W4lZTWttpf3+6Er9N67/qFMAOa29Gn2vf29CjsUMBVj7X+rYwD3W+BtMaa6LrAEswC9HghI32TLzcX+rN+OmMVYs4uElT6a6tQEQYbrhRCbqNjKf7guBkrr00o8zQ2xpNY1PmQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM8PR11MB5621.namprd11.prod.outlook.com (2603:10b6:8:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 18:44:46 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:44:46 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] soc: sifive: ccache: use pr_fmt() to remove
 CCACHE: prefixes
Thread-Topic: [PATCH v2 5/6] soc: sifive: ccache: use pr_fmt() to remove
 CCACHE: prefixes
Thread-Index: AQHYwQH/otr7rLw2PEiT1Rv9pqAAtq3RLR8A
Date: Mon, 5 Sep 2022 18:44:46 +0000
Message-ID: <74571708-be33-bee2-fdc2-01492f121cda@microchip.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
 <20220905083125.29426-6-zong.li@sifive.com>
In-Reply-To: <20220905083125.29426-6-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62901466-a30a-44f1-618a-08da8f6eb497
x-ms-traffictypediagnostic: DM8PR11MB5621:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8bmFZ0vr5uOTnG8CqE2LcvDMWfD9pJgZvHFi3AstaRMqo/0TGYOS0k5Yn9Xe/4sm4c+e76IrrBXzjaXQaY1SAtB8XpImw2zt7vknqvjKWm9HH7JWOcbOK0L0BR1mxgHIu200/RqkI6OMty2Es6KfUAFHokC/QkWmHw44uBVUoXxJwVJ0X0YtgEsaPzFmMp9DW/5QGv8Q1Ruv7AbHoDzjrJOHk1Eauh4iCvE9NPUsdmlntXwplqx451DuniN6eAVdKEmQuqryTj12CN03mxpqaCmPGrdv0NouT5miHTLebg5oEXWZ886VaIY1/iOvjL8a8T8PW0papZEBBQxYAPLtYcs/8ex1If7yH2+Q3MLpEV/UwgRq0ZYPdsecVhU5qFyxUX0PnCXNAAkXvbapxfMvjhPEkZMmy94rFqkCBl6YGOWChU8QyvpbO4+IIoS+7gT7ALAGzq0mEQLiW6QS5h+6ERPAyjVOZDyqwmM/ui5bt0z6b2BKY5w5xJWx+XykDucbUeHJXjwaSLHDNE8yAr/zKt2gN3hdWJOK+wc4WeKiYYwShQ0zwtVC20dCOLNFz1PFXvl5zZ1kNmJXXmOLVs42zU2AV5ZIROJAceZGYOiz713wwBmm4T72VS9aau8muE1Jrg6vBn9ZGhgt9Y5jTm74DkYBeZ9uJE1KL+ZDFudI9NNvfjevFGUYbz/fAvtvhDE1yDb0wRYt4oKli/SlGkkosWRPKjXfd/Y2bDKwHoEeqjv8SYsTVhbm3HbsZVWtKewjE9iq6yAALhbM0XkYo8pE5bstLKQy5PHnV4CDtjTdvcf8Ws+UJeV9yLzGLzhoVy0cT1GbzTcp6a1NdaWaTOU/h1qwZEIAVsSkFZiDExtECKg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(136003)(346002)(376002)(366004)(8936002)(38100700002)(41300700001)(7416002)(5660300002)(6512007)(26005)(86362001)(53546011)(31696002)(6506007)(2906002)(122000001)(31686004)(186003)(2616005)(921005)(83380400001)(38070700005)(66476007)(8676002)(66946007)(66446008)(478600001)(91956017)(71200400001)(66556008)(76116006)(316002)(6486002)(36756003)(64756008)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tk1uY0djL1JwcmRrbVlwS1lsemVndkRxYWx3YmE0NmFPL2tDSVpjWnUxd043?=
 =?utf-8?B?eXlsVzdFbEVnNVlCVHFXMmdTbEh1cFUzNWRtd2orTWNrR0hLZWVHYTV5TGtT?=
 =?utf-8?B?YzJZc09QMm5HUE94WFI4K284cStrQzZGazk2c0RsbUpvaUZwQytvWEtSSGt4?=
 =?utf-8?B?dlVQVE9ZNk9RTm11aXZmbThNMXpFMkJocVpySTBVRm04RlRVcUozd1ExdXoy?=
 =?utf-8?B?UExudjI2RTdaN0xuaC9wTnY1bEZlSGplVkQ3VHhOaW11bUVOUUExc0JzZ3BY?=
 =?utf-8?B?REQ0d01ITG9YQnJBbzlOMnlnOThXNTZvNGZ0eWF1b1o5d3dseWVFbXVlb0tW?=
 =?utf-8?B?TFJ3dmF5TUZ3REpPNEg4RU0velJvc1RCUG1EWEN6RHJOQ1pTY3FmQzRkOXJZ?=
 =?utf-8?B?a1ZvcEFyUG5yalVhcU1lK1Bla0ZwL3g1SXNsTm5yczZBeFNKZTY4ekhia0J2?=
 =?utf-8?B?cHRPd3lZR0xVU3ZjVXlFUGZ2VDlXeTNnbzlvOUNUc3V5SWw3MEVtK21reUVV?=
 =?utf-8?B?OTQva3FVTTFGUnJVNmUwajdOSVhtZWE4NnR5REEyamNyYzNvMlFWRmduYmda?=
 =?utf-8?B?b2JxRkZ6QlZWL01wSDNIM3NHZ3hrWXNxQ25LTS9XZis1cEhNeFNqU2wwMytM?=
 =?utf-8?B?Y0lydk9zZUloQ29ISDJON1lHTUkzZnZJYy9oWEh3bCtZejlRMkhvRVNIMFE2?=
 =?utf-8?B?UnNYMloyZ053d0ozWkI3Y3NoeEFuM2JuQjRoLzl5S0MrZzJsQ3VCVVo4UXFM?=
 =?utf-8?B?ZG0wRXN1S3dXN0Vkc3JzeWlNWlJ5cElpVXZ6YkpNRk1yNkNrbTE4SEd0ZjMz?=
 =?utf-8?B?bnBqNzJaamxnOXFKZzgwY2hhQ1VUQ3lWYU9NV1FRMGM1RVY3bFpyZ0djbFZQ?=
 =?utf-8?B?eFdxdmR6S0p2Mk11aUZXejVpMTY1ckRpNkJhOXY4cHdDNk5VbUFOM0NaRFZG?=
 =?utf-8?B?OE04MjI0ekZLME1PbStQbXlxOUo5YzQ2emtvcnJpbFJ5RERlTk9HUnNPLy9i?=
 =?utf-8?B?bzVNUGJMMXpXSlBtazc2OGhwZzVlVXp2Y01BYStlQkd0OGJhd2Yxa1RyOEtI?=
 =?utf-8?B?cGdzam1GMGhCbkNPR3FsQ0UwaWxyQmlTUmtnTWQ3TllIUWw3YUpkaGNUWktR?=
 =?utf-8?B?MTY3VlV3bkZaSjVVa0tXMHY0UlRsYnBQOVhWQWNGYlU5SWh0YnZLMUNsWlJa?=
 =?utf-8?B?ZGtKRTdYT1lkVUo4VUlnZWFJNDFXL3c3MFBtTkZvdjR4MHEzYjFaYlFPUUQx?=
 =?utf-8?B?dUdwMXhFSGlIRVE3N3Uxbm9qanF6THA2am9UbytSSGRWRTlzNGpGV0NUY3Rz?=
 =?utf-8?B?TXhkWDlIb0ZIS2ZnYksxY3M2VXVDekdLckZMMWtsT3hMa3U2T2pTaTJ2M0NX?=
 =?utf-8?B?czloeEZyVXZYN09jeDg3cUpwRTlmckhMcm5PT09iRVhGSWxjTFhCWGR4T04z?=
 =?utf-8?B?QTVsekJ0YXlBbTlLUzR6S2N1b2dlcVhWQjVVT214dFF3c1F2M3VkMXltYkdU?=
 =?utf-8?B?V0ZJbVlCK2xxa1BYQlozSHVrNFFDcGtXVTAvcHN2eWV1SEE1blNtT29xZkNR?=
 =?utf-8?B?RkZ5aCtkdTZWaFVxT2p4TWpPaG10SEU3MGZiazQzeHZKWWhTRDB6S1dMbGR2?=
 =?utf-8?B?WDh2SmNCNnBLSGZ3SUdpYzNYQjRYMkNYZmx2ZlUxcnNJazk2N1J2ZFZpYlNh?=
 =?utf-8?B?U3NSQ280alVBYjIwWGxPUlBvTkc1MnE3Ykx0aTZZT01XY1FUeHJvSWgwd29p?=
 =?utf-8?B?aWNacmhvNG85WkFhTDVaRGVCK3Qrc2l2aGFOclh4Zll3eFk0TENoMS9tRGpz?=
 =?utf-8?B?M2tORnFlZ085bXY2Ry9xd2lFTkVtV1BJMmZYdXhXWVNpVWcvZ2NwZ0FSQTQx?=
 =?utf-8?B?eGVDbkVDWWp0c3lRUEtBTWg0YVZvb3hRQ0M3bXBwTU91VDBaTFVwWHN4dW85?=
 =?utf-8?B?dFd3U3VjWTNjOUVKSFRUSENaSzdDQmVqeHBBNmxQam5sQ3B1YnFCVFVyYUJK?=
 =?utf-8?B?KzdGYVF0Q0lkNll5TVp4N1BVbVpQd3NiWUx4b1gycXhrYlJhRUd4eEdBeVdy?=
 =?utf-8?B?RFJKVG1YMzBlTXNGWm9JTlBuelk1bHA5eHRSTk51d0VMamJ1cXVpenpOcU1X?=
 =?utf-8?Q?I10wB8nCHlvn6xBe3iE8G9puN?=
Content-ID: <07FD90C90812304988879A58DE3973C6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62901466-a30a-44f1-618a-08da8f6eb497
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 18:44:46.4715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xYb8G19P5zY1fUaeGASYp6YFuJeQOyMXyKdRONLDTBldb6FMD1Q0ykjUpztnTUX9dmHeeEsspcWAmbak9Rq/TX5yNhxDVVY9f6iqZX3Mvwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_114456_366275_9C18E0C7 
X-CRM114-Status: GOOD (  19.35  )
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

On 05/09/2022 09:31, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Ben Dooks <ben.dooks@sifive.com>
> 
> Use the pr_fmt() macro to prefix all the output with "CCACHE:"
> to avoid having to write it out each time, or make a large diff
> when the next change comes along.
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>

Missing your SoB again here Zong Li btw, other than that:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  drivers/soc/sifive/sifive_ccache.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 401c67a485e2..d749600c0bf8 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -5,6 +5,9 @@
>   * Copyright (C) 2018-2022 SiFive, Inc.
>   *
>   */
> +
> +#define pr_fmt(fmt) "CCACHE: " fmt
> +
>  #include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/of_irq.h>
> @@ -85,13 +88,13 @@ static void ccache_config_read(void)
> 
>         cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> 
> -       pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
> +       pr_info("%u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
>                 (cfg & 0xff), (cfg >> 8) & 0xff,
>                 BIT_ULL((cfg >> 16) & 0xff),
>                 BIT_ULL((cfg >> 24) & 0xff));
> 
>         cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> -       pr_info("CCACHE: Index of the largest way enabled: %d\n", cfg);
> +       pr_info("Index of the largest way enabled: %d\n", cfg);
>  }
> 
>  static const struct of_device_id sifive_ccache_ids[] = {
> @@ -154,7 +157,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DIR_CORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
> -               pr_err("CCACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DirError @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DirError interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_CE,
> @@ -172,7 +175,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DATA_CORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
> -               pr_err("CCACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DataError @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DataError interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_CE,
> @@ -181,7 +184,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DATA_UNCORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
> -               pr_err("CCACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DataFail @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DataFail interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_UE,
> @@ -221,7 +224,7 @@ static int __init sifive_ccache_init(void)
>                 g_irq[i] = irq_of_parse_and_map(np, i);
>                 rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc", NULL);
>                 if (rc) {
> -                       pr_err("CCACHE: Could not request IRQ %d\n", g_irq[i]);
> +                       pr_err("Could not request IRQ %d\n", g_irq[i]);
>                         return rc;
>                 }
>         }
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
