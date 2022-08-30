Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CFFC0502A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEK73CP8h1+f01gBL3zv3KeR3bAmJYXsg8KGtzAyKCc=; b=lmuENcv/O8ArhK
	zUMfwWYwg66dscLhBPH5OBfl5T+xcgxV9E2uZcPl4s9owMNLEJ/znDRJDiYiMPFWZ84JUDGcH16vq
	Rkx3lhPGuUQvHK2ScgzJw0t7QCXUT8z8HEvNyWv2w//MNuXPeVDZrtEX+Cd+VDBWRPGGtgzV2EEB5
	MfLLxTYdiX5bdKcXO5Tu0L/U6HabfHOo4yXH7XGEthyxVOqREM3JXiLP0hd3Tzu3q5lqaT0ZrhIdM
	Bb7yGasx5SzfQLkR5xZMzuLbh3ugnFh25Zta7JstMv3HIzb415o33iGhUmt5Qs9jN9mOgHlGF7i+X
	kajV28MODr1LrbemEgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwWi-00FAlN-47; Tue, 30 Aug 2022 08:23:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwUh-00F9kl-Cg
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 08:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661847671; x=1693383671;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=TTPn9MG4MWuSafqE3rCZqfZfqVw59DlcuKZfbUeU5WM=;
  b=H2RDGV5ow4CJdKxzKUOeYy4Qi5nwUvtBh3NzdtEiXPI6uJcmVntcToFI
   bemk/OnwVwM1V6DCidaMX3ogO2K+rdwY+nmXcz/auezXkEAFZEZj9P3KC
   HnBTnT8D6H8YRC9oKVBC3BMGkn8dOqn0ZimH4RdQ/35+HU5qzbu9Qi90h
   7x9ywQ3XNwdZsSsrqMujs0FtEr7gjC/cfhD9+aRqc8RoxyGKvD1m0+Rxf
   cPZrBWPHuO7dsOxihl7aib/1jHb+tqVE8uZh7cLKBsx81Oj+7gVUJ5ND/
   RwecNrODWK/bRB7uOlPGg3NNUKJeeQ3Gpq4bSI3VRO91jhXYN3fgrVVKp
   A==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="174769871"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 01:21:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 01:21:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 30 Aug 2022 01:21:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEWKZvbU9KLBqXX1KiqtgS2meiwtfSITR/MpkRvDaEKIj2eha0/BTGpWTq8mub08Oldyp6dsupYqzUczcl0DVYHyyiU3Mgx0DhfblIqhLHEZiWwqxnCjO1ux8w3ZOa03Tacq4kH/XwKq97nB3t/uwt9OlCtS/+jHSxxfvga68CQjMLZNUbyzkippSxgotWv1xrafDXdwAXWfHpaiMVIrq9v/vx2dTlUqvdQizjmnV6msH4mnuseTd2onSVgVgOlJMizEe1RW+W/vt3jVYg07qGkiZnGOe5bRH0oORNnk5z6BuauBWT0wwA8NixwVZa1Wpe7AJP4oInmEJwy9/2+ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTPn9MG4MWuSafqE3rCZqfZfqVw59DlcuKZfbUeU5WM=;
 b=Q1agpJNTusQlL1204hBQz5reql86iElmC+N1ZZXZjrC1a6/zjLKMIXk0R/fMfzmx+DQ71tPEXW8tPju4GIarpdU4xi5NyyQnOOzyaQXI30z0Q4z7rFbuBTZrqvsL0qpTH8oYkb0/feZ6XKW3y0FyKFM5f9fetiQVU8pwpT7FgnGlXFMs6IDBm2U2xnq3xMgmB4Ne3w72eMfEsR2XwCGoiiZAri4tTXotzdKyBHTZbiN3Sswjr1Vj0td+JCf1/0yk1JM0ytYDjdaNapdCvZjtJ4hDlHMPky05vG81Z0LhK49r6pdIN2eeJfzd3DWtkILivucbZBoRPN3IGUa2w6MiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTPn9MG4MWuSafqE3rCZqfZfqVw59DlcuKZfbUeU5WM=;
 b=j246F6+0dk3K7lQIw768R4bCiiz+Tg82mfWV9UzyH/bmmDmWALE3FQq+LTz1FZp1M8vMpKZV0TBYTR++pe7nOw0+qJI4w9v3xEwR6l7IlrTruxfebBXYgyfMhU3JDnTnkCzi4EYJdlTT+CXmWpLd4BDDCd6aajk7yUPTWOfYcIU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 08:21:01 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 08:21:00 +0000
From: <Conor.Dooley@microchip.com>
To: <vladimir.isaev@syntacore.com>, <linux-arch@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Fix permissions for all mm's during mm init
Thread-Topic: [PATCH] riscv: Fix permissions for all mm's during mm init
Thread-Index: AQHYvEa/ZCOQkPuwK0CORJxDg4lnra3HGj2A
Date: Tue, 30 Aug 2022 08:21:00 +0000
Message-ID: <26ec07d5-14ac-f77c-00a7-23ea77ebeef6@microchip.com>
References: <20220830075900.510105-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20220830075900.510105-1-vladimir.isaev@syntacore.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70a12797-6759-43db-6128-08da8a609289
x-ms-traffictypediagnostic: SA1PR11MB5921:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jRf3JmUvonEcJwTTPyf1rAtBe0KtYSBJjtaGjbseZmLfpZE5c4hVgOK+kynVIPskXlwGwG/rHXTbJj+xdWE1o5uCPofwL3+IiYbICGOn1NZSaLxrbquMJOcBNLIknIasVshFuB2tEtUnLMFbMEeKXlkBXKJNDBn4wclVmjlQ5qwYgABJQuTnD+2Y8O8nriKFciE9gUBQv+5ocElqJuPZdYztf8LeRZqFAgWdu3H0xDvw861IsH29nod0+W3EbVw25aSbG1k3vzH2JP+dBPyIp3k6M7ZJeKm+04unBEIV5qlAD44ZfNegF00nQKmlj7B6cpXZA9qs2Cqy9QKaVPvgvCqN28RlRon4+MAUPCa8pEvYuKENHp2zw+f6Ryy5n072FgpVBBe50aMGTqBm7L0aUCgSRvKakpft6WqbaY3cB4MYibikAlrtevqhXj69QnwMFcJ8pI9LbaJurKijrdeEZoOP+FqzLpd+Y2x5X7rDwpsyb95I0hWQDiHMGSQdAKUkc+ko61T0tw19VHKLdbjYS2RRaxZg2gblc2T7O3vewIBiiaTB+jJxa+gvwaQP7idJJJomSez2XWYWoEVInIkcBWopNC6dGtj6lMYPgVVJiCd+vWPz0iBsJaRQ68mdXQSp8GxWTsjg1zFXJ3XJunMWCe+Cba4ufryEShBO86rQKtx4ODQHA9y7zoMzW08mVyChLSKgRvTbpsKZ5iy8nxYku/eMnbr3fKX16lM7WMXIKE1xGYsvW+MSgQSg4pnqzq4pK0DXIBzYB2PrsvTNMfhkh515DSFAzRBnZoXoziGNsTEmrDvmR2t7NfP3W0cw9cVEHQlSCrfEH7SgQ/H3tywynHDBB/hc8rKZGzPNA+XEx0c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(136003)(39860400002)(376002)(71200400001)(53546011)(2616005)(6506007)(316002)(83380400001)(26005)(6486002)(966005)(478600001)(6512007)(186003)(66946007)(45080400002)(41300700001)(110136005)(2906002)(86362001)(5660300002)(31686004)(31696002)(8936002)(38100700002)(76116006)(66446008)(66556008)(122000001)(8676002)(91956017)(36756003)(38070700005)(66476007)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2JnaEU1S0YxVFd6OWF6TFhod080ZUVWRW1VWTdNT3JCVmYxZ2FDaktSelRU?=
 =?utf-8?B?OVZJQ2ZSK0tKc0s5N1dFMG5WK0hmK0pmelZQazFhOGpJUlkwNUF5TXdaYVJB?=
 =?utf-8?B?L0hOc3ZRUU9PMklXZFc4ODBWcGcxR3hsRXZQVklEbHFtQnJoNHBlWDZ6cFJ6?=
 =?utf-8?B?QnFQS3BHYjNwTDhLRFd2V1E4THh6K05YRlp2VVlkRjI0RUNlV3g1c0dDVHVt?=
 =?utf-8?B?TkU5T0hIOUF5SEpVcjNQaXQ4MmtzbWlZL3IyVW1mdFJUVVpCcXpqaGdmdTl3?=
 =?utf-8?B?NmN1QktMeUJPb3MrRE1sVWwxY0wzRGNyakQ2NUNiK3poTDlpbmtDeTR6SXc1?=
 =?utf-8?B?VTRQeU9JYmF4Z2dVYkNLb0krKzh4YVRJOHZsTUplZnRwcDd1cmZzenBzWjc1?=
 =?utf-8?B?dUVtcXg4bkErTkZsK1g2d2VYRVVTYjFaRjJTZWY1OU5mQTAzempCM2h4bGhv?=
 =?utf-8?B?R0QwVTBiWnM2OUJNYUVmQzlOem1uSWpYNFdrdmhHQktkVy9RUTlMc0ZhTWlG?=
 =?utf-8?B?YWVtcElBR05QdnRVeGhPSjY4eDBtTE03WFVoRjBXNllEMzFLSXFGTkd5dFIr?=
 =?utf-8?B?Y0RwK3N2SXpZb2t0Z2JrMktUUHN1cHV5QnlHM09XVzRhQ2l3Z3B5ZWhLM3Bj?=
 =?utf-8?B?QXFCbHRKMDZRSmR6dGN2RXltMXRHVEkyNTkxaUF3b1RhSFpMc3FyRzJRTm5y?=
 =?utf-8?B?TGdSajQ0Z3VVNWQxU0ZKV0I1ZTZLOFY4S0xPT0ZrdHczc1U4M1BOb0dScDh2?=
 =?utf-8?B?cGNENE5tUjg5MS9sZDV1Zlc2eEM2U0VzMzh1QmUvYjhVVXJLVUJyWTdZbGg4?=
 =?utf-8?B?ZjF1YTd3VFRPbTRmVERwdVVZbFczdy9vdHpub1hYYjR1bGIyOTBBRVlhQzQ5?=
 =?utf-8?B?UGRGMTdDdGZldDF1RXhFTENnMDc1NTdkdW1kMkMrT043dVp1WWNod3JmNEYx?=
 =?utf-8?B?MTBmMytVanJFMU5nOEhReTA5UGsrNDZ6cnVaMlNBYzQvN0VlSHAvcEpJUnFp?=
 =?utf-8?B?RjlWSzB1VjN4WWFHVjlTRGRocDEzYnJUMURlMS9JNzFUTGFBaWZkanhjWDdk?=
 =?utf-8?B?S1Bmb1ZRYzgxcW01SjRzSkFYMk0vNzE2dlMyVHFIUmphKzZoVklOL0pPQ0Fa?=
 =?utf-8?B?NlpvcVVPS3ZuSEpnZ0Fka1Nna1FFMFBKVnFzUjhZSkR1M0Y2WW84K285NFlm?=
 =?utf-8?B?VVYzYi9YdmRwcDRnUzBoWENNc204aEN3MVY4TnJRSk9mazVEblZmaGsxTU9J?=
 =?utf-8?B?aWhZTURWcHlBNEx5eS9DbkIxOHl4R3BqNGdJZFhPQWJXSWxVZTR6bm5EMTNR?=
 =?utf-8?B?NjBIcGVabFZXOU1ZQ2Q1NmhMVUtHUThkWnA0MW9aSnlYaG1xMVoxa0Z2V3hv?=
 =?utf-8?B?S3dvMlFPbC9GT1BRSlFzU3FweHd2SlJ2ZHhXWEVCSy9GOHJrQ0xpS1RZYnJJ?=
 =?utf-8?B?RlhjaXpXbU1pUXRYRkZaRU43dElKdHIvL3lUR0dEWGs4Y081cldzRXJpaXY2?=
 =?utf-8?B?bGFrQW5sWVJzNmpoYTlnc1FIVVBNTERxaHJaWjA1bDdMVnZITTBBdVhXaU5u?=
 =?utf-8?B?NmRsV3B2RTZ4SE5tZXdiR2k1dTNWT25ZY1dsbDZ5NlU0eXdRQkJobjFRK2Nt?=
 =?utf-8?B?MFByaXFCSmFvaDFHaTFyNUsxcytQVXV1ZXJQL3EyZEpINHIrL0NaYUZFVUI5?=
 =?utf-8?B?UlVQa1hlTFFRT2l0Y21NU3E2VlZ4SzRuS091Q25DOWJzMVpwUENlajNOblFl?=
 =?utf-8?B?WDdWK25ncUl1UmRGSi9VVy9ZcVh5VjdiNlU3Vm1aM2FJQVp4a3ZkdXk4K3RS?=
 =?utf-8?B?ZnFqWjRXakpNLzJvRlQ0U1dOQnl4bFlldkkycWgxZGZIZm50NmR0ajZtMFB0?=
 =?utf-8?B?MHllbUtTS1lYSnQzVy8yS1FsRGVBb1Nwc3BsRWMxc0tOZU1yTmNYL2YwQmsr?=
 =?utf-8?B?YTVrQjdKelJWNmNTRkZGYnI1RGw0LytON1JsRTJ5UmxNUDhrWCtIOWhCbC9j?=
 =?utf-8?B?WTFnMU93YTRnUEZpMVM4Ri9kQm9lYU1VT2t1OThLbmxJS1hHN0tJVkRSdzRU?=
 =?utf-8?B?TVhsdW1xVE5GbDFoZVJnYzJUKzNCQ1pOQzVhdFdSTzI1dG9BVUFmakZ3L2h4?=
 =?utf-8?Q?OeDpLTbdMhod4iHJmzulneS98?=
Content-ID: <E4B8977A17C28A4D9EEB5ED2AC90AEF0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a12797-6759-43db-6128-08da8a609289
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 08:21:00.6004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6zapw2wyQzOILmGeA+KqVpUhLR23KO0u2a/rnajRYrcrCsnkM9w+V3HTIFKOT7qICeDPMcXto/Ok88ddbnizSQ6R+pwGpgjejweu/m4UkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_012111_725661_F678310A 
X-CRM114-Status: GOOD (  21.23  )
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

Hey Vladimir,

On 30/08/2022 08:59, Vladimir Isaev wrote:
> [You don't often get email from vladimir.isaev@syntacore.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> It is possible to have more than one mm (init_mm) during memory
> permission fixes. In my case it was caused by request_module
> from drivers/net/phy/phy_device.c and leads to following Oops
> during free_initmem() on RV32 platform:
>       Unable to handle kernel paging request at virtual address c0800000
>       Oops [#1]
>       Modules linked in:
>       CPU: 0 PID: 1 Comm: swapper Not tainted 5.15.45
>       Hardware name: Syntacore SCR5 SDK board (DT)
>       epc : __memset+0x58/0xf4
>        ra : free_reserved_area+0xfa/0x15a
>       epc : c02b26ac ra : c00eb588 sp : c1c1fed0
>        gp : c1898690 tp : c1c98000 t0 : c0800000
>        t1 : ffffffff t2 : 00000000 s0 : c1c1ff20
>        s1 : c189a000 a0 : c0800000 a1 : cccccccc
>        a2 : 00001000 a3 : c0801000 a4 : 00000000
>        a5 : 00800000 a6 : fef09000 a7 : 00000000
>        s2 : c0e57000 s3 : c10edcf8 s4 : 000000cc
>        s5 : ffffefff s6 : c188a9f4 s7 : 00000001
>        s8 : c0800000 s9 : fef1b000 s10: c10ee000
>        s11: c189a000 t3 : 00000000 t4 : 00000000
>        t5 : 00000000 t6 : 00000001
>       status: 00000120 badaddr: c0800000 cause: 0000000f
>       [<c0488658>] free_initmem+0x204/0x222
>       [<c048d05a>] kernel_init+0x32/0xfc
>       [<c0002f76>] ret_from_exception+0x0/0xc
>       ---[ end trace 7a5e2b002350b528 ]---
> 
> This is because request_module attempted to modprobe module, so it created
> new mm with the copy of kernel's page table. And this copy won't be updated
> in case of 4M pages and RV32 (pgd is the leaf).
> 
> To fix this we can update protection bits for all of existing mm-s, the same as
> ARM does, see 08925c2f124f1 ('ARM: 8464/1: Update all mm structures with section adjustments').
> 
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>

What is the appropriate fixes tag for this patch?
Thanks,
Conor.

> ---
>   arch/riscv/include/asm/set_memory.h | 20 +++--------
>   arch/riscv/kernel/setup.c           | 11 ------
>   arch/riscv/mm/init.c                | 29 ++++++++++++---
>   arch/riscv/mm/pageattr.c            | 55 ++++++++++++++++++++++++-----
>   4 files changed, 75 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index a2c14d4b3993..bb0f6b4ed86b 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -16,28 +16,16 @@ int set_memory_rw(unsigned long addr, int numpages);
>   int set_memory_x(unsigned long addr, int numpages);
>   int set_memory_nx(unsigned long addr, int numpages);
>   int set_memory_rw_nx(unsigned long addr, int numpages);
> -static __always_inline int set_kernel_memory(char *startp, char *endp,
> -                                            int (*set_memory)(unsigned long start,
> -                                                              int num_pages))
> -{
> -       unsigned long start = (unsigned long)startp;
> -       unsigned long end = (unsigned long)endp;
> -       int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
> -
> -       return set_memory(start, num_pages);
> -}
> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
> +                         pgprot_t clear_mask);
>   #else
>   static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>   static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>   static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>   static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>   static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> -static inline int set_kernel_memory(char *startp, char *endp,
> -                                   int (*set_memory)(unsigned long start,
> -                                                     int num_pages))
> -{
> -       return 0;
> -}
> +static inline void fix_kernel_mem_early(char *startp, char *endp,
> +                                       pgprot_t set_mask, pgprot_t clear_mask) { }
>   #endif
> 
>   int set_direct_map_invalid_noflush(struct page *page);
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 95ef6e2bf45c..17eae1406092 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -27,7 +27,6 @@
>   #include <asm/early_ioremap.h>
>   #include <asm/pgtable.h>
>   #include <asm/setup.h>
> -#include <asm/set_memory.h>
>   #include <asm/sections.h>
>   #include <asm/sbi.h>
>   #include <asm/tlbflush.h>
> @@ -318,13 +317,3 @@ static int __init topology_init(void)
>          return 0;
>   }
>   subsys_initcall(topology_init);
> -
> -void free_initmem(void)
> -{
> -       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> -               set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
> -                                 IS_ENABLED(CONFIG_64BIT) ?
> -                                       set_memory_rw : set_memory_rw_nx);
> -
> -       free_initmem_default(POISON_FREE_INITMEM);
> -}
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b56a0a75533f..978202712535 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -16,7 +16,6 @@
>   #include <linux/of_fdt.h>
>   #include <linux/of_reserved_mem.h>
>   #include <linux/libfdt.h>
> -#include <linux/set_memory.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/crash_dump.h>
>   #include <linux/hugetlb.h>
> @@ -28,6 +27,7 @@
>   #include <asm/io.h>
>   #include <asm/ptdump.h>
>   #include <asm/numa.h>
> +#include <asm/set_memory.h>
> 
>   #include "../kernel/head.h"
> 
> @@ -714,10 +714,14 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
> 
>   void mark_rodata_ro(void)
>   {
> -       set_kernel_memory(__start_rodata, _data, set_memory_ro);
> -       if (IS_ENABLED(CONFIG_64BIT))
> -               set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
> -                                 set_memory_ro);
> +       pgprot_t set_mask = __pgprot(_PAGE_READ);
> +       pgprot_t clear_mask = __pgprot(_PAGE_WRITE);
> +
> +       fix_kernel_mem_early(__start_rodata, _data, set_mask, clear_mask);
> +       if (IS_ENABLED(CONFIG_64BIT)) {
> +               fix_kernel_mem_early(lm_alias(__start_rodata), lm_alias(_data),
> +                                    set_mask, clear_mask);
> +       }
> 
>          debug_checkwx();
>   }
> @@ -1243,3 +1247,18 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>          return vmemmap_populate_basepages(start, end, node, NULL);
>   }
>   #endif
> +
> +void free_initmem(void)
> +{
> +       pgprot_t set_mask = __pgprot(_PAGE_READ | _PAGE_WRITE);
> +       pgprot_t clear_mask = IS_ENABLED(CONFIG_64BIT) ?
> +                             __pgprot(0) : __pgprot(_PAGE_EXEC);
> +
> +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
> +               fix_kernel_mem_early(lm_alias(__init_begin),
> +                                    lm_alias(__init_end),
> +                                    set_mask, clear_mask);
> +       }
> +
> +       free_initmem_default(POISON_FREE_INITMEM);
> +}
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 5e49e4b4a4cc..10a4ee313083 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -5,6 +5,7 @@
> 
>   #include <linux/pagewalk.h>
>   #include <linux/pgtable.h>
> +#include <linux/sched.h>
>   #include <asm/tlbflush.h>
>   #include <asm/bitops.h>
>   #include <asm/set_memory.h>
> @@ -104,24 +105,62 @@ static const struct mm_walk_ops pageattr_ops = {
>          .pte_hole = pageattr_pte_hole,
>   };
> 
> -static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> -                       pgprot_t clear_mask)
> +static int __set_memory_mm(struct mm_struct  *mm, unsigned long start,
> +                          unsigned long end, pgprot_t set_mask,
> +                          pgprot_t clear_mask)
>   {
>          int ret;
> -       unsigned long start = addr;
> -       unsigned long end = start + PAGE_SIZE * numpages;
>          struct pageattr_masks masks = {
>                  .set_mask = set_mask,
>                  .clear_mask = clear_mask
>          };
> 
> +       mmap_read_lock(mm);
> +       ret = walk_page_range_novma(mm, start, end, &pageattr_ops, NULL,
> +                                   &masks);
> +       mmap_read_unlock(mm);
> +
> +       return ret;
> +}
> +
> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
> +                         pgprot_t clear_mask)
> +{
> +       struct task_struct *t, *s;
> +
> +       unsigned long start = (unsigned long)startp;
> +       unsigned long end = PAGE_ALIGN((unsigned long)endp);
> +
> +       __set_memory_mm(current->active_mm, start, end, set_mask, clear_mask);
> +       __set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
> +
> +       rcu_read_lock();
> +       for_each_process(t) {
> +               if (t->flags & PF_KTHREAD)
> +                       continue;
> +               for_each_thread(t, s) {
> +                       if (s->mm) {
> +                               __set_memory_mm(s->mm, start, end, set_mask,
> +                                               clear_mask);
> +                       }
> +               }
> +       }
> +       rcu_read_unlock();
> +
> +       flush_tlb_kernel_range(start, end);
> +}
> +
> +static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> +                       pgprot_t clear_mask)
> +{
> +       int ret;
> +       unsigned long start = addr;
> +       unsigned long end = start + PAGE_SIZE * numpages;
> +
>          if (!numpages)
>                  return 0;
> 
> -       mmap_read_lock(&init_mm);
> -       ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
> -                                    &masks);
> -       mmap_read_unlock(&init_mm);
> +       ret = __set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
> 
>          flush_tlb_kernel_range(start, end);
> 
> --
> 2.37.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
