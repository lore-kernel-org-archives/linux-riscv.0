Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4B4C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uzqcl90koukxt7HwSh2iXuom6QZLPHZSOI5unZ0rxME=; b=GKPsnjO+nEAs8Y
	A1fVtNv+IlBvYgf14sjCqQ5naENEwbQQRLc7lP61gLG00zlxO72pOL05EaOCl4waKJghUh09JY40l
	kNbH1UK/lYWDpV8xvWPY3M9j1sbj3qPVkVqZaHzEdW9TL246MMvhFvUeMH0w7IX60ir5vTcJNvKPA
	/wPyL7OB+LRDxRcOhywR4lCvKdU7wdiM7i/qIBqrKW/m4uK6eYaWHVqPjfLXSpSMtK9UJ/TZ+LCUW
	kxqOOjWLPy/jQG/JhoDeegTL724qkYQCkpHy260LymqQzWQ0wpMfDbOWICpY4Kf8hth7KrkKxKLtR
	DNVsaVVfnfSwkDvUjWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpTS-00CoDA-Cv; Wed, 24 Aug 2022 12:27:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpTP-00CoCJ-IR
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 12:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661344027; x=1692880027;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kLQOLMRAOVS1NL234iTQjRnJuIrwJwasZMOAhoJfWs4=;
  b=R3e9AEFcmrYiaG1iFh8fU3WSxiEcmwAJDifWGYrLu5wLpLT9FxBquZxV
   pXLUCIx7OAUsdSO/ZryJXOJfc6jAGdRhiHNgtam9t/8MgohvQwTxrCpAk
   6ZP1ArMfA9lfVlVkFDj9dLsp7OLrTTyO4QKpP0cAV21ZxMCzEONP7Sryz
   EWSm/mo2Dfb5pHXAK7e04LhfXWieVpKcPnzRXGpEIBdLL1umjqCPIwQxN
   XrZhELRufEqn/09k250jUy8D0itnAAu/eCmbb4aWjvliClY9RTlRJB04Q
   JS3LuRgetvppf+eei1Qgr+niuHlWwNvlfS6H3opEwHa57IdF4u/28ACSp
   w==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="110495675"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 05:27:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 05:27:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 05:27:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7HLr6JMwzxUbNXehhnrFs2BgvJMhu/jFPTz80minXgw188CDad4WzcD+gKwMjxic/Adw7jxt5OuFjuspRY5JPtrw7Lb6hW5U+L2j0ffJTNDc1CVCqy7JIIoFwuXMxPpsXNX+yDmiky4iAcZiHqJ57b7+wHI+E4foSg6v0KlZVmqaswK7EdWziAfdyxCd9ckVOcUdy7TPItckQ1xCKy9NitjFpxPqqFPaY/d0qYhKE0iy8VX7p+QjgxIDDDLUHk41EDgNhNbD3Fgi3Ebxhm6ZtZeQDIvghMhVEFETtgXX4OYmFvx+Gn8yXpE+FZJxZocRxfMzILryNOIdwdjytbEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLQOLMRAOVS1NL234iTQjRnJuIrwJwasZMOAhoJfWs4=;
 b=AhVnuLykyYo2wYgG8rZYf8dIy5xMhXyKIT+LVCiCPt3JG6i4d7u4CRSwnad9s065N6gaJN9ywaJnRSBHBADckwexIelimcNMZBXzDurQTLXwFwIL17VF1arY7VKwxwfnNgxvnK5vylL8DII5x1mx3r/0HKJJcOmg+n6mzKLpDmTgHJWsK/wiSbbV00ogNzNkqwfwZHyYFSfvzuJnVAyTR/8YLabuhLllzqT1KOwDZUt1TXC2lxD51RXF1waAJrZSHV11JdMdpFS9YM4PlXFGc7XqwGa8O5xnWsYu6RFddca2ocvKoduEisp1/jovSjlP1NlajThCZu55pnsoGH9y/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLQOLMRAOVS1NL234iTQjRnJuIrwJwasZMOAhoJfWs4=;
 b=sAiOBYz9QEHA+AnFmckYDH6A9DyPEjoRd+jvKMKhgl7VeLx6kQ5Cw+Qons3nEAAm+u6FS9ifyVibCUlTE69h8eAiWJzETrAHyayk+aaiSA6+Zl3ozE5r3lV3DUVEV6PCB+WNqseE4OSdoys9YjtRtlRKFZfNjSTfZ1sEFOmnLv4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 12:27:01 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 12:27:01 +0000
From: <Conor.Dooley@microchip.com>
To: <alexandre.belloni@bootlin.com>
CC: <christophe.jaillet@wanadoo.fr>, <Daire.McNamara@microchip.com>,
	<a.zummo@towertech.it>, <linux-kernel@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: mpfs: Use devm_clk_get_enabled() helper
Thread-Topic: [PATCH] rtc: mpfs: Use devm_clk_get_enabled() helper
Thread-Index: AQHYt5IndXqzWMJbz0OfuNYZ1M2LkK290O0AgAAPZICAABoVAA==
Date: Wed, 24 Aug 2022 12:27:01 +0000
Message-ID: <7976bb16-db1f-aee4-d075-97296e91d3df@microchip.com>
References: <e55c959f2821a2c367a4c5de529a638b1cc6b8cd.1661329086.git.christophe.jaillet@wanadoo.fr>
 <f76fb247-5160-61ed-a0a3-037d2f40d2f9@microchip.com>
 <YwYDI04TDD0RWn2B@mail.local>
In-Reply-To: <YwYDI04TDD0RWn2B@mail.local>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41da9156-21b7-4e63-915d-08da85cbf241
x-ms-traffictypediagnostic: CY8PR11MB7082:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wQrM7qgMoVISreGSM5KyeogOaTCObcoqlqeLznnAfge1mjwDabPnsAkCJgi2iG1nrrAuZpt1MfwMVyUsKM8ZQpuWQQPHUJsVm3lAaK8E2wIUSw8tODYUBYHaUS1YZX3WsACjM1IxEthbl7J9Do45CJe7plBx+ylEG+/42hsxjgTcvdO5yrp4SECkY5zTc24ES7gHiLBAEe7B4gtN/XlDem8yAkFSFdNVbKCp1I4AyponlM4kGdwNrWeyvwDkWpSkPnSvVNE8Heo816iK6J9+BGvCiEiui3sRiB3y5VsGVHm7wgI8+UkCm1IMuWnvkUUzRB1bc8TgB20tSiVBn63IxHnsJn18jzEaqjoSCxW8Gooz45bBazUnFaW7boDyqof5tebPXO0Ov5aGDoBuQYJOUZt1X0YdioXN4yeaa4MttDCLjHoK2doJuQv2i5xHaQMdspqv31c9slIPxhbCxf4oz2Ks9M5fmfy9zN8ddt2JCRzZivWCiYOkoSmAoZwsP06zfvUvk+W3wLgUO6tr6vKWbRJN6Ka2cgOhPYf6ydQf3pbV3bH/0YYHZKaYBHeWxzNZivxq/HgDGOOY6DZb3Kfav3TWT2qUGioQp57977RXY8LNT4CkIxPC++1ml8yWO9nuhdiygC4dP31rd85oD0Ea+BXLOI8D72RvWxoAUjJtOR+QjXp2OnCkjMbQ+qD7ejAj/mUbMItUdwc6mGDwzc/IxY/CLFOZbGB/pfsNZq+5L7LyaDnEqBORANEytjgOQT5haT+EIz9owtS4b8iuawseBlI1AdETyKBLDZRTawZTSpnMaqt64xw+xeKQkY8q5NnP4cbMHw9jUpltH4NbPTBVV+rdO0ECr5EQNRpm+gpGM1AbHCa5ga38ycKheaQ0q6YTcVteuLYcuEA7iv0t2fgG1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(39860400002)(376002)(346002)(83380400001)(38070700005)(122000001)(66556008)(38100700002)(91956017)(76116006)(66946007)(8676002)(66446008)(64756008)(54906003)(6916009)(66476007)(4326008)(316002)(2906002)(8936002)(5660300002)(6512007)(26005)(53546011)(6506007)(186003)(2616005)(31696002)(41300700001)(6486002)(966005)(71200400001)(86362001)(31686004)(36756003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3VVOVBBeXFXUUxuOFRhMmNUQkF6ajBtR3l1cDQ2eHhtMUpqL1ZBcjFQNFlm?=
 =?utf-8?B?TkU5dWxhN2pPVm1VZi9hR25UMnhDNHRlSmhZOWZ2bVExREpTMjZzYVJ0VkNN?=
 =?utf-8?B?N1hpS3hVdmhwNDY0VVhvb3VqTjBpZEo2VFhxYWx0TDF2RERjdDA2aG1QZ1N5?=
 =?utf-8?B?M2tJOVN0UFZScENNdTF2bE1WWU9GbXBaWnJDMDcrZDFYelc5Z3p1bk02TjJF?=
 =?utf-8?B?akVHUjhzdTZZR3JlN0tzTFdiMjFqMkVacXltYTJDZEFLbGR4RW1YMERSQlUx?=
 =?utf-8?B?WUJyeG9XQ2dlcm1LMlJNc3hZQ2Rqc2MzT0hkVWlVT1NZZmFqNVI0Z3RtQSta?=
 =?utf-8?B?dXNWcUJROFk2Zk54YnArYkwzdU5hL01BQ1hhQ0YwUndweFRWLzUxUU9xaUNT?=
 =?utf-8?B?MVdwUy9zUHZwYXhKQ2N4TmVYNm1BZnhYVE9BN3lSdGxBNkNXNHVhZlFicjVw?=
 =?utf-8?B?ZElZTEFsMzZ4OXlVTjFHRGgyWUQ0VkVPYjdBTllYRExGWTlveFB1dEhzdnZs?=
 =?utf-8?B?SkprODQ5a1RIK3pzM1YxSVhqeDBudEVzbkVVQTVqOUI5V0ZzSjRPRVJKNjZW?=
 =?utf-8?B?MDNhRCtoUUx2TThIYkt6RWM4Y3dDRjVrMWJzbURpYkZHcjFBK3BoRnVZdHpR?=
 =?utf-8?B?d3NmZ29sWnA2bHBwTzRrVlpXdC9KdkNIVjg5L3JPaGVLNHlFMWpSdldOWmxY?=
 =?utf-8?B?aW4rY0tFc0V1dWJlcGo0OUpRZC9hR2pSN2lCOER2VEtsQUh4azNFcDZrY25q?=
 =?utf-8?B?NGU2MFhWeUpDRjJ1RGxISVZnZlQ1ZUJhaDRaWDhYSGZUTDlWQmVPeGE0TFg4?=
 =?utf-8?B?RXUwejE4K3RobDJyM0k2djEyWkpxeTEwRUg3K2VkSUxldXZ5MDdaRW5ZVjUy?=
 =?utf-8?B?c095eUt2QWpIWC9qK1dWdzJvaG5GQi9hRnBPY2UreGJDRmJNbWJVSHE3bGlX?=
 =?utf-8?B?MGNRejJHMzFaMHZtQmxCZmlFQmxqNTNaVHRwVStCYktYMWJBd3VyQlRSUW5m?=
 =?utf-8?B?YUpualplNlR6VFlxaDMrajZ5ZE5pbzlHY2dIV3lucS9wSmVNK0NuYVlLeVo4?=
 =?utf-8?B?bktMZjZxVkE5ZTczTjdJY2JZUENURWJMNmJaTXFNR0dDQ24veURZTjJzUlVT?=
 =?utf-8?B?UUZ0bFRqOVJ4RFdDd0thQlBLU3dVelhPaVRmM3VudnQ1d1cvZGxIVGUvVzZY?=
 =?utf-8?B?VmlPZHpIRzE4NmdkbXZnbW8yaUg2bS9YQmlpQy9yTlF3VzRtWWZjeXNNbDZv?=
 =?utf-8?B?eEwzbW1LemZwcXdWWkhlTGIrUGsxaStjY2lmdXRldk40V2ZHMGs0NGxzTFEw?=
 =?utf-8?B?aXo0SENFMlNwREIrVmpyK1BEbGFuWHNjZEJVdW9TTW5SOHRWTDRKNUYxbU9j?=
 =?utf-8?B?UTN1M0dTckJORWNTdHVnWlFwT1hCckExc0VtUkd6SUZ2dzNvS0pTVDlFdzRr?=
 =?utf-8?B?R2VEM3ZGZ2tuMXdYdlg3aHNoZjUrTGptZVF6WlRHa3JOczlzaDNkeEZsWVRE?=
 =?utf-8?B?dTErWW5yL2RYcGtBclFGblZoZXlXWGdXZHRoUFJaWE9BL0Z4UW5sUnhpbFBj?=
 =?utf-8?B?UGlWVWJwUk1mTys3Ly9ZeXM3b0gxc05sUVdHeVJTblFUdnFWc1I0b2h5aHdK?=
 =?utf-8?B?cVViMWN5SW1YditFUDczOFUyT0ZOV0c5aU8zMXF2NW5KamRKNWRQTDZSdkxO?=
 =?utf-8?B?VVhCdGp2OGUzRzVPTTF2N1ZRMy9LalNpZ2MxTXI5Ylc3LzRESEpHdUM2YzJP?=
 =?utf-8?B?SlpGNlJNRzNVa2hsQUxCdUV4U1hHUnVzekI1cThxSHNzNlNGb0ZzQlVLc2Iz?=
 =?utf-8?B?U2QyaklvcTFIeWxYL2NyamJDQjJmZmVmZzI3dkEzZ0pOSEFPV29RdWRrWTRp?=
 =?utf-8?B?RUdreURxd25WSmE0Ny96Z2UyNWNMeWlPL3VlTXVRV0N1SG1rNmh1bnNyd1M5?=
 =?utf-8?B?OHpldk9HVlI5WG4xdWQvdGVGMEZKYkNKWWZyQVBoUDdFZGUvc3Z2bkpNVFY3?=
 =?utf-8?B?Mzh3TXJzWkVBSEpXckp4NmtObUk5WDdZaWtXcXFpL002SGZqNm9Db1A4dzlC?=
 =?utf-8?B?ZHpremhLdzI4YWZjVnZXVTgzeEoybjhROThkT2lhbEx6NXdhNHQ5ZlZLcERv?=
 =?utf-8?Q?U+Vs4cN2VZ+H00Re4Ogk1BHl4?=
Content-ID: <E8527556764A1B4086D7610B85B833CD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41da9156-21b7-4e63-915d-08da85cbf241
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 12:27:01.5273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RKajtr29qO7pHW4PP1wtRYT1y9z6IJHmSMIhZjXDmyf2lW15HsGvxO9s/ZyRYkPwi9q/Q7b8RSLC6f20cAXfo85sjFnRBclcdYCTeAHoDRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_052707_731714_D2EBCB45 
X-CRM114-Status: GOOD (  32.24  )
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

On 24/08/2022 11:53, Alexandre Belloni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 24/08/2022 09:58:35+0000, Conor.Dooley@microchip.com wrote:
>> Hey Christope,
>> Thanks for your patch.
>>
>> On 24/08/2022 09:18, Christophe JAILLET wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> The devm_clk_get_enabled() helper:
>>>      - calls devm_clk_get()
>>>      - calls clk_prepare_enable() and registers what is needed in order to
>>>        call clk_disable_unprepare() when needed, as a managed resource.
>>>
>>> This simplifies the code, the error handling paths and avoid the need of
>>> a dedicated function used with devm_add_action_or_reset().
>>>
>>> That said, mpfs_rtc_init_clk() is the same as devm_clk_get_enabled(), so
>>> use this function directly instead.
>>
>> Firstly, I think something is missing from the commit description here.
>> devm_clk_get_enabled() is not just a blanket "use this instead of get(),
>> prepare_enable()" & is only intended for cases where the clock would
>> be kept prepared or enabled for the whole lifetime of the driver. I think
>> it is worth pointing that out to help people who do not keep up with
>> every helper that is added.
>>
>> I had a bit of a look through the documentation to see if the block would
>> keep track of time without the AHB clock enabled, but it does not seem to.
>> There is no reason to turn off the clock here (in fact it would seem
>> counter productive to disable it..) so it looks like the shoe fits in that
>> regard.
> 
> This would be very surprising that it doesn't keep the time with the AHB
> clock disabled, this would mean the RTC loses the time when the SoC is
> not powered. or is the AHB clock also in the always-on domain?

If the SoC is completely unpowered, the reference clock will be gone too
- not just the AHB clock. In low power states, or with the cpus disabled
etc, the rtc should keep counting. Is there something I have missed &
should have either documented, explained or set when first submitting the
driver? I remember reading in the docs about the rtc class framework
supporting systems where the battery backed rtc was external & the SoC
had an RTC with potentially more features etc. Maybe I misunderstood?

This is a "hardened" version of an FPGA core & AFAIK the clock that
clocks the AHB interface/wrapper also clocks the logic in the RTC. The
docs are very scant, so I will try to get my hands on the RTL. The
clocks themselves should be always-on..

I did some brief testing just now, and if I disable the AHB interface
time keeping is lost.

I am inclined to say that this patch is valid & the underlying clock
needs to be marked as critical - unless I have missed something..

Applying this patch seems like it will have no functional change since
the clock is already being disabled in the remove callback so:

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

If my conclusions here are correct, I'll submit a patch for the clock
driver marking the rtc's AHB interface clock as critical.

> 
>>
>> However...
>>
>>>
>>> This also fixes an (unlikely) unchecked devm_add_action_or_reset() error.
>>>
>>> Based on my test with allyesconfig, this reduces the .o size from:
>>>      text    data     bss     dec     hex filename
>>>      5330    2208       0    7538    1d72 drivers/rtc/rtc-mpfs.o
>>> down to:
>>>      5074    2208       0    7282    1c72 drivers/rtc/rtc-mpfs.o
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>> devm_clk_get_enabled() is new and is part of 6.0-rc1
>>> ---
>>>    drivers/rtc/rtc-mpfs.c | 19 +------------------
>>>    1 file changed, 1 insertion(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
>>> index 944ad1036516..2a479d44f198 100644
>>> --- a/drivers/rtc/rtc-mpfs.c
>>> +++ b/drivers/rtc/rtc-mpfs.c
>>> @@ -193,23 +193,6 @@ static int mpfs_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>>>           return 0;
>>>    }
>>>
>>> -static inline struct clk *mpfs_rtc_init_clk(struct device *dev)
>>> -{
>>> -       struct clk *clk;
>>> -       int ret;
>>> -
>>> -       clk = devm_clk_get(dev, "rtc");
>>> -       if (IS_ERR(clk))
>>> -               return clk;
>>> -
>>> -       ret = clk_prepare_enable(clk);
>>> -       if (ret)
>>> -               return ERR_PTR(ret);
>>> -
>>> -       devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);
>>
>> ... this bit here concerns me a little. I don't think we should be
>> registering a callback here at all - if we power down Linux this is
>> going to end up stopping the RTC isn't it?
>>
>> I think this is left over from the v1 driver submission that reset
>> the block during probe & should be removed.
>>
>> Thanks,
>> Conor.
>>
>>> -       return clk;
>>> -}
>>> -
>>>    static irqreturn_t mpfs_rtc_wakeup_irq_handler(int irq, void *dev)
>>>    {
>>>           struct mpfs_rtc_dev *rtcdev = dev;
>>> @@ -251,7 +234,7 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
>>>           /* range is capped by alarm max, lower reg is 31:0 & upper is 10:0 */
>>>           rtcdev->rtc->range_max = GENMASK_ULL(42, 0);
>>>
>>> -       clk = mpfs_rtc_init_clk(&pdev->dev);
>>> +       clk = devm_clk_get_enabled(&pdev->dev, "rtc");
>>>           if (IS_ERR(clk))
>>>                   return PTR_ERR(clk);
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
