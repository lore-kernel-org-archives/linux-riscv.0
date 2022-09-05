Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590F7ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 19:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yShNHogUfccA6lVZHDRmdRvjHGQqslBnkYMIQo1Dw5w=; b=mi3lZxj8VX8tlc
	c8UGiiSES9Xp8rryXx0nonGYqEW3AkBTnkmG4ctwN7olr8wRTVsTqM0mfjSq8L1uSh45cFq+MwJsK
	w+fCVV67JjApA2zOwvZG9H25Pf3OJXB9aQFV6vI2Gj6EVOqLT8kiTCAfueHqEBCWLFmG5WPxvBi4+
	RiMLPxiU3Si1FSZM+KE4DDR6IiHYPnVIH/U+ThzVxvAbD0L7ESUOH5Qn1aC06RlDWzc+RZr4izHXl
	aNa7ihd5NUcIxMKLwMixfAQt0gxl87NLIrZTYhQYh0yjjbUvgNoG8yGJgi9ctkA+0cDzzrvw04loX
	fEB1OdYIew4bVCQQFpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHoL-009Ld5-CD; Mon, 05 Sep 2022 19:31:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA8q-00158q-PB
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662376788; x=1693912788;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nju5fFsr3imQBpe7dxn0MzTdSOw7ctdAjOCsgdADelI=;
  b=BiUObmyqcRJmMAibb95eu1DrrIXSF79jvPrI5NqcgropGOQXUDaluGho
   pZsi5lSHeu4V+GrahtEO9gDB/FwfasYsPlJZwF7i24WPs7v9Y1FvwVILQ
   2egbtRA9xsoDIdzxaXkXkefr1g5oNJoylJg6DNZ6IBhDs9uihjSAFGfbU
   WP9+uIsndO8I0/bYyElgHMbCHBuTqyYz2yAmXzsuIUKTphGRU+ek8uuTu
   SPEwXvcxTa1ugbBiAOK9lFEmWp+T5p/ak8Wl24eG/1i1KCC0duAeSiNjN
   UND8wJBKKGE4MQABxIuM+6+mjJMPeD8SgI+dNr+rnbsrJPZOKX85Ni6Ti
   A==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="179205722"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 04:19:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 04:19:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 5 Sep 2022 04:19:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrf8QZ9KuEyf8WfDsafaHCHt+uL/4hX+bMJ9sO2eKXrqRObPFGA/RwZuEGDnfY/g9i9wyY7PnPPm/AXMQxG8aQxJMSfUqLnssvKUKLdzHWrDl4BdjXJesuGCypB4eNdrQJp1ZK3AMZOK/OJnnuQJKYO4ssH5OX/3Li0VR/DOzREA2/jsurkcx3XzBsHsT5Cp4bFeJwYTsYRI81hEa4FAqHw0PPJ5nRA2i2SzH0rx5HtWRHJnyHmV02IbCdJIFMe/35yLPCnQhFbrQClpsLl9x/39regnLL1Zdz9jAn1MAZWrtcjEJpe7hdxwqLtm79EaM1Xc0zYHdbuaABPgFg6sug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nju5fFsr3imQBpe7dxn0MzTdSOw7ctdAjOCsgdADelI=;
 b=d3bYISvjFHeGVf4rnnhApe9PQnbXgO7uNHEkZ9rL6tektCoDjkvBp1gZTpl6bd2rfsQXO57AR+UHwlk1Z8+nS8l9D1whNSGCHMYB+ydv/ZWwrhGwjk0ke1DNq9tsbmje//BJUxnsb1MBp9/ZQ0lFQM1VPfiqyZ6AeHtcFSR9ZOMdj5yQymJONXFsh6x3hwjDDOONmyN9su1Apr+HYaFmwMlawrxSpk8+VBuSdIQD7r7i541eCSGPtKrBuKl8rP7ZLZBHLwUZGZEBKkS1IEgkjytU96mLQNxwdVKLbNx9+ia6ovlzmvlMyb3WThVx1W/t/ytMJrohnnJX7VtoFA69ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nju5fFsr3imQBpe7dxn0MzTdSOw7ctdAjOCsgdADelI=;
 b=hXpkgPmGAV/N3UT2eB4Bk3P+3nkExDuR+hIA06NLqi5H3Y1AdF/FDgUuAHYmp6/ishxBG+un27WtpYLjm/Y3/zeb477a5tR7tHY9KOBPtDn0E8oEuKPvDfBvJltj8Inuhxo2upgK4gFe8w3bWEakyTZ5hfFzufegASrd3WbQcog=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 11:19:42 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 11:19:42 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>
CC: <guoren@kernel.org>, <apatel@ventanamicro.com>, <atishp@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] riscv: use BIT() marco for cpufeature probing
Thread-Topic: [PATCH v2 4/5] riscv: use BIT() marco for cpufeature probing
Thread-Index: AQHYwRg57DMgpYyc+Uef16fLunMs063QsIQA
Date: Mon, 5 Sep 2022 11:19:41 +0000
Message-ID: <1e61d31a-9bf5-af79-dbc4-87d63d24b497@microchip.com>
References: <20220905111027.2463297-1-heiko@sntech.de>
 <20220905111027.2463297-5-heiko@sntech.de>
In-Reply-To: <20220905111027.2463297-5-heiko@sntech.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 833da7ca-4737-4d59-6de2-08da8f308777
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ffKrQjGfKH7CxFeJ/Ffg7+q4FRsZQqMfM/PFyk5Ag9lH7YIgT8wVIIgMkVTHpdPJx3W8Xy5rIbq+IbJEbbe64zjx0h1ctNTN0t91Fc72Oi6chX5hlb9ASlI/1rQ2H/FutIopKShhtaCURrv754P1wWBqxUTchVzhoHouJ9RExcYLBH+kRDFIhclC7eSxKXZQYYipr3lcFlE45/G0jxeLe8bi+yZxoqP9nE1DpyBErZ5JIi3LoLgymSUnunbLegc4n7GTVWlfKk0os1ZUKxTIyNUJ47nlbJLKyK7lsQb/4VaMDxBUyfXLbK5d8Yp49mOhDNjB2suFhBWzr/SK/JpWJS1lnvYm0cSnXSC8+NVIcDEZ+zouukqfI+4CmI2thDE8DjoUY7RdsOwX0Wr2UjOmOFgjpgiSkrAyDKUZzqwASmno7YW8yiJEGIpFfd7w3gKE568Cz7jurR8Azj+++QyPDqXyKRanH/wbP8nSc8ZSl96YnAqcng9l5zLNaQv5/EMbfqJrebpkHRvyqbo3BKh3iIdFPmOE9ufyHXtEbI1bS9EQP7SFU+TN0K/OJ/47yeTUTMaKFxpYUubeYVKOhLnwweY2XG5EBmwJO5m85ae2x7D7WkADTx8xyNi0m5muLClK3TbiyeUXszIdnfXh42fTSf2fQfQqjbAJ2h6xp5U0Oyj0jx2yDc9I1b0QidW8EyRtP7MMshNwBEy9kKSejqT7gZEhC/cIie95dnJol4Wy6hRBjGa78Olo2mNhadmreCz9M2fi48S9Cr3Kw8EVo4o51G0zsIVKllIVP+hBU70FeZLqtISeuiTUB3dN+RD7ude29Ks+AWHq7lCXP8N85eK1zw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(376002)(39860400002)(396003)(38070700005)(2616005)(41300700001)(53546011)(86362001)(26005)(6506007)(6512007)(83380400001)(38100700002)(186003)(31696002)(122000001)(8936002)(31686004)(5660300002)(76116006)(8676002)(71200400001)(66946007)(66446008)(66476007)(91956017)(64756008)(66556008)(478600001)(2906002)(36756003)(4326008)(110136005)(6486002)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0oraHoycGQxYi9PM0hscEg1Z0tsMitVT0NNMnJZcVlEazZlbGJKTEhRdXZ6?=
 =?utf-8?B?dlQ4T2VoaWhwQ2tEYmZIc2QzeFVWY2FHdVZaNmZCNDNBTmhVU1k3NzlHRnNq?=
 =?utf-8?B?M0pEK0pYNU9VeWMxbGEwNlQ5LzllbG51bVprUERHQTZndnQ1N1NjTDk3NEl1?=
 =?utf-8?B?VkFHY0tNQTU3ZExKdnFCUC83NSs1VmJzYUp1RHgvTEZnYjJoRWlseFZzVGFx?=
 =?utf-8?B?clB1dDhUWU1NaCtHcHJVbklGa2h0Vis1YWszbGhNWUZiSlZUcGlleHpPK3pP?=
 =?utf-8?B?eGNDV1Z4c09kUklIWVhHVlBYU1Z0NHVhVFlqWXRtMjFGNldGYnNQYmJidFdV?=
 =?utf-8?B?U29ZRDZaeklsQ3VJaHNwNFFacDNQMU1Vb1VQYVJoVjhidGRraXI3cXM0OGVI?=
 =?utf-8?B?U0RZR2c1YlhaNXdnWlR0QUE5QmFKQVM0Unh5VVdtT0lzR1NZRERiRVR2NzF0?=
 =?utf-8?B?dVozSGhhOWJ2SzlPejh6QnBOVEl0bGRQekxvdGtDYWhhZm9XVDR1SEZoWUVU?=
 =?utf-8?B?NERtOEl5NkZnQitDSnRsS3dEOEpIcmIzTTRDUDNGS2plS2JvZHpPSlBKRVdY?=
 =?utf-8?B?Q0Z2ajdLSjZ6c01PRm9nZjZBOGthdmdvNU1TWkFqRC9BSzBhSk5zNVFZSjMr?=
 =?utf-8?B?VVpSWG81N1BqSHYwNEFvSHE3TzB5bm5OVmdPUkJtRU42L3RkdW8weGpKeldy?=
 =?utf-8?B?UFBwM3REYU43OExlSUJmRDZ1cTBKdkV0VnN5UGpHQjQyQXpuazd2T3FOcEZF?=
 =?utf-8?B?VHdGL2kyWGZZRXJFMXJYblFlTHlDYnljcHcvQ1Mxc1ZsQzF3WDY3ODJsQ0Nv?=
 =?utf-8?B?UXBBNERhKzdaemNMSzN1Wi9YQ3JJWTVEZVFKL3Fyd3I5Slk4RWZWcW95ZUpu?=
 =?utf-8?B?ZUw5V1BHVWhxdkdwWkI1ZkhiMysrd1cyUmJoRklPclp5NGVsTXBNM2Mralpm?=
 =?utf-8?B?VDZkOEtqNWFNZFpmRnpJK08vMTJCMm5WaEp0Rld1dlF2b3NPdTRqc2pZODBl?=
 =?utf-8?B?aVE2NzVHMXJDNDNBelN5eCtHWjRHTzZMdkpEbkJQc2dkU2lqRFhRc2loNndN?=
 =?utf-8?B?K3h4cWVpVkI3eDd1L280d3AyVDl3ZGZBRXFFUUcxR00weTMyQmFSaXZwSGRm?=
 =?utf-8?B?ako3YmJ2ZDlURHZSTzFpUWlPeUFTNTB0SVVTMGhBQjRkRUNUM25lRXZUYXRi?=
 =?utf-8?B?cDQva2RSTm0rc0NBWWpxSEtjVng0OHdxdDZqQ0E5UFl1TmlJYkJGRmZVWlF1?=
 =?utf-8?B?aHc3M25aTGg3WWRFc3FkdWdPaVVoSHNmQUZFMXUzb1ppcE9oOXRqMEQ3QVhF?=
 =?utf-8?B?dzlFRjVrVnF1RG91bjcvKy9Qb2wvOWVWRGNZYVFmRE1YVnN3V29VcG1Tc1Zs?=
 =?utf-8?B?SjZlUmJ6TlJobEs5NnFFenMzNXdNYzN1TXlhMnFZd0E0Nk8wdkZzVjBaNWxV?=
 =?utf-8?B?em5ScEw2ekJvSUwvaHk0ZnFadEVVdEpEclB0NmRWSXFXcTNOMzUvNmRVanYy?=
 =?utf-8?B?anZWK2NwSEtmSWRmVlpjY1Vvb1lsdjEyMmtwK3poR0RLKzRLZ1RIU1ZCUFRG?=
 =?utf-8?B?ai9iem42bERxc1NLeFZTRnZEYUlSL3pzajhjNGRkRlZBTUJIa3o4Vk1kamdP?=
 =?utf-8?B?OUNTcGh4WkR2cUtsUlgvaUFkT0QyZDkxT1I1RkV5Nk5FZnpiQy8zMHZ0Y2Zx?=
 =?utf-8?B?ajZMc2p0ZkliUTFUQlg4aHV1dlhIdGtwV2dJUUgzQmNSdzFqbU5mWGVYVmtB?=
 =?utf-8?B?VWVLRXNNdGtBV0JlczlUTTErSHp0M1ZWSnZlS0F2bHNMZEpuNGIvTC94bHVl?=
 =?utf-8?B?dkFpeVdvSU5iTXNRTS85cHFSVHNwOVd2ZGx2QXFpM0RVWnY2OVdoQ0NFdlZ3?=
 =?utf-8?B?LzVWbW11T1dUNThxdWVyd3dxNWM3aW4vMFdnMDB0bGl5WGhsNVRYdjdrdEJa?=
 =?utf-8?B?N0RBcll5YzhxOWNHa081eTZwVERpY1p1blFvSUI2dEV0ZUVhN1RwRnNDZ1Va?=
 =?utf-8?B?VU9Fcmx0S1F3UnBXV0ZJM1dyZGdidFBHRkRzK3I5ZWZ6NDVmV0M1VlZGSm5R?=
 =?utf-8?B?VjIvZEtZOXVxWFBENVNCOGZxK3FLT1F4OWpFV3JsL3NGTlRIWmNoZmpIcDkv?=
 =?utf-8?Q?hsRstxlelPtK0YacZGivvLkRX?=
Content-ID: <6E8E669F884DF842B03CDB3D98FE85FD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833da7ca-4737-4d59-6de2-08da8f308777
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 11:19:41.9832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: crNsEqZU3oTKAQ/fEDxf/Py5AwHo7gFdUg1bav6rMn7re9cCmiymTwdvQkLrFXoiUjrO1FYQmIhOj1dQIwt0/ZFCYYX5KUTZSE/SZeVBM6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_041949_220916_7C3A4733 
X-CRM114-Status: GOOD (  14.28  )
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

On 05/09/2022 12:10, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Using the appropriate BIT macro makes the code better readable.
> 
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Missing the cover-letter with the changelog?
At least, I didn't get it in my inbox. Either way,

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>   arch/riscv/kernel/cpufeature.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 729f7a218093..08f7445985dc 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -289,10 +289,10 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>          u32 cpu_req_feature = 0;
> 
>          if (cpufeature_probe_svpbmt(stage))
> -               cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
> +               cpu_req_feature |= BIT(CPUFEATURE_SVPBMT);
> 
>          if (cpufeature_probe_zicbom(stage))
> -               cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
> +               cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
> 
>          return cpu_req_feature;
>   }
> --
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
