Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382AEC76196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPuHXUzglJTlFJFm7fiK1oU+k8VTK/n84/E7Qs/RKRI=; b=m/tB5FyruOVA2k
	KAk5TlK5cIPEgeniwZKv0qGbdSupUf1nqxoQAc6vWgxEVEKG+wPRg8l+6XOFyDN5Pd6TokR41gbtO
	tgw5AoWMNTtgmFFj96kggCOVYsUP+BMXxElmDwq5puwgitWDfDwuOtbd4lRoqCZDWSkZvfZgaJA/O
	EIoxEeTrYL9CzvyCGzyxJQNkxbKWPR/S/ICo03Y9tp+GKl+6Bz9hoILM4pch1dAQVs4ysNOvxjQby
	PzlijFT5430H500TmB4xxzw9a8nVqVn+sG5wECkOs0nkXa6MwfPr1FoCbmLJz+vA/mvE/Br4MDfGk
	CjFtub1LmuIkEWIUfDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiEh-009dWF-2h;
	Fri, 07 Apr 2023 09:18:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiEe-009dVG-08
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 09:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680859100; x=1712395100;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=35JN5owazSWBbm+8RO3qaxBKmdnZltj/UmvygD/qAmk=;
  b=IC9elvAKErmJmMtFr49PIcBYZLB0PQkuciaWoZCkHv8kyykx8qW78d78
   1UXBL6KIArjCAZXNR957tacSTX0ih/gcDcL5dppvfisqPiYZ6bXaZiYn4
   m24H/pICEZRuDif9e1UBPfPe8rF0nH6TcAYN31W8+qdOcqh4O/POMHmhU
   Z8IXy9e8kPT6kojbTbZnK59IinElfrDJG6BMzBfyx4KgkoTEdq1aXap1e
   2imC7CeF94bD3bjux1gXcN5kXN1YEphE7f3W1wFFRuEpq7XBHwrm/Kdkl
   PV3dT7Kgw5WCPBnKMw9bky60OHq5zuuJFeLRfl7T9cP7vFhKP2ckGmmua
   A==;
X-IronPort-AV: E=Sophos;i="5.98,326,1673938800"; 
   d="scan'208";a="208577097"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Apr 2023 02:18:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 02:18:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 7 Apr 2023 02:18:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcxPgzhRSMiMJRJ7uzebEz1GwuUIpLQKzw81GdZFtqqhyfzFM5ZDK0kSrpFHvPcBmpAKiBkvsCKniY46YFZtnp4LYI9R14PRjMBaTl4zdih8ma9qxjZ927okFG2c96m+v7SGeJvK2yveiw+7lmVm+Y6Pql8MczuOLQhMjINsz0YVYzG2ZYY0EkecgRtRwHhUZznMUBow8O6UcjW36/nxLXXBhd0IJ7Kwj8LAlMLzRRQ2VAXlQL1hN/JxLK8XJkLsCIc10DcVUsUrzE6OHiY5lu4UrCmiXgH4ohEk1SDra0r+xm9EqJTdrfLM0k35sIUuOltOpgYax8L5ThCTwJ4eFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35JN5owazSWBbm+8RO3qaxBKmdnZltj/UmvygD/qAmk=;
 b=MstjvJV4KxLVjpWLC4xNCYJ0ZPglZT77PLBbHpjQpKdUOL5pPNTUn0ppiA5gPiAbcyDpL0/Jy81QdJ8O37KyYv2u2bS2oVni4WN0bQ/8ZcjhwCOxqiKXfMOjBV1ahenZxhb/AgHh/JTHMBTHPD9iQ+ZaeifeaiUkTeIxvilpFvi030zoJ1QhZIIe5dzUMXiCWkz8KdHjpq3foB9imKRA9xkHu54iP/mqatF+6azj8NvnwFMGPQwpNZyRztBzie7QJjO35BHyJC5X5LTVYAuFgkP0VYgTX+5PWnx7UgGGfc3p6xafyMx62174DSzF8p/PkfGGevQ8wfZKSgImj1KSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35JN5owazSWBbm+8RO3qaxBKmdnZltj/UmvygD/qAmk=;
 b=iURoWESi9oCoyvoDMXE4U1SmGmq+ogHtzaxOg8/+JjKBCFgJqrCg3zFgJ4lRq7DkNTE4QHbbUhEcjRAiLf/OwggX2vnb5gNJ13oSXVmKYzpbofoyNlvLMYu/bs2Not45lDZiA2wtHz8mP5FJutnr0rBY4w9Y86v/7CSwhQoLzMM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Fri, 7 Apr
 2023 09:18:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::d8a1:4a09:37bb:96ac]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::d8a1:4a09:37bb:96ac%4]) with mapi id 15.20.6277.033; Fri, 7 Apr 2023
 09:18:15 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <bjorn@kernel.org>
CC: <heiko@sntech.de>, <conor@kernel.org>, <palmer@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <guoren@linux.alibaba.com>,
	<bjorn@rivosinc.com>, <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
Thread-Topic: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
Thread-Index: AQHZRm41OoQHmhNOOkWJmsrWwPzgja8VcgGAgAAB+YCAAAFwAIAAfWUAgACmNYCAABNHAIAABEn8gAAXRICAAAxrAIAAMgKAgAjPaoCAAAEpAA==
Date: Fri, 7 Apr 2023 09:18:15 +0000
Message-ID: <e9f4594e-78a0-fd1c-c0ad-845bf78fda48@microchip.com>
References: <20230222033021.983168-1-guoren@kernel.org>
 <87edp3loai.fsf@all.your.base.are.belong.to.us>
 <878rfblkee.fsf@all.your.base.are.belong.to.us> <2173635.1BCLMh4Saa@diego>
 <874jpzla20.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTRuqtxiNMwH9T3gvHMSJ1EBAEtOXNvFoCufjJrQgqk6Dw@mail.gmail.com>
In-Reply-To: <CAJF2gTRuqtxiNMwH9T3gvHMSJ1EBAEtOXNvFoCufjJrQgqk6Dw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SJ0PR11MB5769:EE_
x-ms-office365-filtering-correlation-id: 1bc4a361-2562-4091-5005-08db374904dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cc79tjuZ47lUoN5TcJ74po5He7CZLO+P38Lg2iMEoLLbOK01StelIZ0sMbJpUpXJa93NUENMeYaFCCtleVqEwvjgUPlpEaVoqQi9NhbMLT6JmC571HxtqxG6FA2y+gpVOfhGlTUyia3W7fce+fl78AEFMAxdEQBP37KjmmJtRf5IG1VN1owmXA7E7snY3+Oa4PUAOwEgvUS4UudQ54Pf2NLsW5yBTJh239AE1bsyspEsWseKjhpURrajHHBis8PMWvTN0agGjnJKa5E1jleo2RJ5OWG4JA32YMIGLaASOqaw1fRLnh66/G1r3AQoTal+ZSMSwBtdTbYqZwVk90NQs/UXIyRUMsP0Fqj79HsiWMj6h3WK5foBPlafW+Ctlm9RsKZII0Y9C+wpalpumPAYYTnPrOB/3E/uqTNnpOecgvGbhAqmGoWFFKSoPxciU+Y+8dOCSTMmmRyvF1NevHgWKL2eM++3BU+14gqHQ2vRRGVTfxieaO0P0HTIyXMvzuGSGM/LESAMp7uIVoWm4QH12DH9Ru14DgWBbyykqip0sZ1sPtLG+KMN6a5Y4ptFaPCuL6MAGlmPP9EKBv/w162Hd9yo7htQxVLP0jQzN8lW4ITEOE4U8TAHxSV2bvtmxmCjl1zNeCMXYxOAdAwpzRbrLhZ12yRs495ozqA4uwKfnvQnBLgefbEW8qroYfCBDYQw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(31686004)(122000001)(38100700002)(5660300002)(66476007)(4744005)(2906002)(8936002)(66556008)(8676002)(38070700005)(36756003)(4326008)(76116006)(41300700001)(31696002)(66946007)(66446008)(64756008)(86362001)(91956017)(316002)(83380400001)(2616005)(966005)(54906003)(186003)(110136005)(6506007)(6512007)(53546011)(26005)(71200400001)(478600001)(6486002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3R2WkFJRGx6bTRVVjRMeFIxRE14YTJMbmZXTERXRktieklGeE9tUytCLzN3?=
 =?utf-8?B?UnBvejNMZVBuSXZUN0lTb2xsRzFueTFCTjI3Y2VUZGxSOEYwRitjamZnT08v?=
 =?utf-8?B?a3VwaWtPcVZaYnhPZjlDUmg1aENsY0NQUTNQcTcreWJtWUZnUzB5a2ZLanBv?=
 =?utf-8?B?b2kzTWhkeExWRzdwWW1QakU0L2YzNjh1QkpaeVgxYTJVRmFuS3RHY3doZ2dJ?=
 =?utf-8?B?VUZhME1LeXhPQWxDeVc4NGxFOHdkQ2t1N0NLRkl0TXVSSGxNN3ZCSTQ2TmlZ?=
 =?utf-8?B?U3ZyQ29Yb3Urd09FcjhGQWFEcnNtbmoxdkt3b2k3U2xTWUIraVEycy9VWlpj?=
 =?utf-8?B?MFBURE1FN2hDZnVEeGhuUGZDdTZTQ0w0L2hka1FSbElFNXVvRW0xQm1adFhW?=
 =?utf-8?B?NHZVaml0MzhsYkxENEQvOXByU3VzRmNUU0RyOFI3a2FLOGVqV0ZQNmEzdUVm?=
 =?utf-8?B?eDJRemFvaG5aWTl1YnlSdDVoN2lRcFZDS1FOSzAyNHVUNFhWbDZyRU5aY3BW?=
 =?utf-8?B?VHZ4YXllNWt0NGxVdmszZkNYeE9XdkVaamhIZFc3dTI4OElpWWozOEFjZE9i?=
 =?utf-8?B?MDlkNGFnVnVFVjRlb25lSkxlZjFPZXR4eVZQdFZvWUsrUERQRnlMSmNkN2xX?=
 =?utf-8?B?YnByREN6RFlKNkFGemRNc1JrL2tGQnpWbEwrOUkzMmlWbm94eTdxZVl3VE1Q?=
 =?utf-8?B?dFZLRDF2cHEzcTgzWHk1WmRzVkprTUZpRGJXMnZ5bVZ2UHZlNmpnQmQ1MzBu?=
 =?utf-8?B?dm9FczZFak95RlAvUHBqY2tvcXowMGZIMm9qQ0RLZE10OTVzYWFZVUs5YXhE?=
 =?utf-8?B?UUZWdGQ3aVcvcmMyWitJWjhLK3hDKzhJWWxXWGZVRVhDc2QrMTI3ek50T2Fw?=
 =?utf-8?B?c3dnK1d3RkdoMUx5d3lOSWlNL2RxcXVSVVFCODRjMjhydmNEeTRHVFM0VUg4?=
 =?utf-8?B?OHJTREFXR05ZeVdaam1lYVRWT3lTRUl6YUhsdzY2NjNzSDRWdjhCZ3dtWlQr?=
 =?utf-8?B?RUY2U1FSNS9uT2cyLzBNWm1STjRIMG0rWXZVdU1ncVpTZ05xQW11a2xpVUMx?=
 =?utf-8?B?R3JxUjdSNDJWVHVCOHQzQzN3S1V3SU90cGZybHAwZi9FdHZSV0hVblZUSWQ4?=
 =?utf-8?B?eDRrMTF3OExBTmlVa3VHOW95OGtSVkhZanJBTFhjd3UxS2RFelNuaHc3WDNB?=
 =?utf-8?B?Sm01WU5ta2VZYjllSkVVTTZhcGNLcE82UkRZc1B3eFc1cEFSd2FUdytwOHBI?=
 =?utf-8?B?VlNVeE1rbzA3bEx0RllNNDV4QWNGV1J4WHo2ZTdqTFBnY2t2S2xweXZJUjRt?=
 =?utf-8?B?d0J3RTFEZEQzcUh4Z0RhUE5rTmZkVEROdHNSWWhoa2pDSDJXbTNZVElFMHVN?=
 =?utf-8?B?UGxTWkdtOGlmMXFBai9zOE9JR2NtOXp2bmJhT2dKRGdOSDN0aWdHVmVoaXZZ?=
 =?utf-8?B?M2c5RjgxaDMxNHJ4eVROZS8rc1dja3l4U0lTbTh0NFRBK3RyY3FMMVFkWndj?=
 =?utf-8?B?Y1JpcEFXQUFjaTJ6Ym54cENIR3RhcERyWUFEeHZYcnd3QVJabU03UUlRRVdS?=
 =?utf-8?B?SjFuQUtkTzIyNUd1VWJ4MjNOY25MNEdremZlcG1IN0xLVUo4YTg5K2FaMGp0?=
 =?utf-8?B?b3V0S09Sd2VZVUJ3bFFZK3pFbmx0Ukx1cGRoTlpqckNYYVVXOTJFSjFIdDVF?=
 =?utf-8?B?MnpKMDFKQmRWYnpmdS91RVhZa0s2TEVPZHM0L2hGMEVYYVEzKythTW15NktU?=
 =?utf-8?B?cjlKN0JHQmYvRjczN1NzS05kcytPNVN5a1dlMFVMRTFjTGdIVXY4MnlCZyt4?=
 =?utf-8?B?L3dWTWVJMHlObklyNFNRQ1ZVVGtzaVU5YUdib2dMZUEvbEZSYSszdElGTE1v?=
 =?utf-8?B?ZkhHd3BFbXNFckxGenJTWWZaNWFIZ0tiVk5tUitFVzRZUXRaU29ia3NvU2tR?=
 =?utf-8?B?b1NJUnVZaDRHaFl2ZytMRlUzcmNVTm51eVRpUXFkcnBReDdXVWtpSkhITjFP?=
 =?utf-8?B?QkNBTzlrQ0pFZlJsR1Bhbm9XZEVJaTZ0M0xHUnp4K3ZyekQwNkl2enppekZy?=
 =?utf-8?B?ZUpVWUdBOW9kK2h5d1NTbU1JRHdzcktydW1RYXFIUHozOFFWUnNOOGJOMHd1?=
 =?utf-8?Q?l0r7+aacYEswhtCpDDTy7RbFY?=
Content-ID: <7082C8423FA6204EAADCC8094CC7FD9E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc4a361-2562-4091-5005-08db374904dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 09:18:15.6379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uSO+145YT5M7pMxGWpnmjPwgKS8YIEOmb6FdpF4iXPHQTa2zemFqFD1U3RAGXScA8E1tWSZ2YudnZvHfSRLxxkRjkPoPkj/c43df9Eny+JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_021820_273205_B9E84A23 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcvMDQvMjAyMyAxMDoxMywgR3VvIFJlbiB3cm90ZToNCj4+IE9uIFN1biwgQXByIDIsIDIw
MjMgYXQgMjo0MeKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOg0K
DQo+PiBDb29sLCBhbmQgdGhhbmtzIGZvciB0ZXN0aW5nL3ZlcmlmeWluZyEgSSdsbCBjb29rIGEg
cHJvcGVyIHBhdGNoIG9uDQo+PiBNb25kYXkuDQoNCj4gSnVzdCBwaW5nIGdlbnRseSA6KSBIYXZl
IHlvdSBkb25lIGl0Pw0KDQpZdXAsIGhlIGRpZCENCg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMwNDAzMDY1MjA3LjEwNzA5NzQtMS1i
am9ybkBrZXJuZWwub3JnLw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
