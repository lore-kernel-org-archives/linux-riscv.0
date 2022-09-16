Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9ABC54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDHN+tjQ1Hh+zmVtVef8pn+jA/0RLLhXatP0XOHaMC8=; b=IQPvNwdFFyFZL0
	dg1YSOMgNRIZw/A84dJTLGuI0M22rYMU19lQmw5ygPYSML2IdClgX8/mux93yYSLndt3ka1W2T57V
	0EWFcVee6oCWOyoM36v/HDklgRqVSNjynfYJW9YyHPF9fX05FKWeFecb9KI6zb8KgsEiMkrrVckYz
	qgj6LUaz0CxaglFLj1IiRrI36iILDoH578SlgoC4CRQO14I0BxkSYEt3jaqIrmt4AGC8o8trrdwPx
	RY4rjvuyLpLlBkrAjB+QFDCRSgdiklVpTFU93N0WtEK/0mVoK26KuoOlmyXRn/g9bd/dVhr5GN9rA
	APxXDwjsdBTE2qFHXa1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZEL5-00F4jE-5B; Fri, 16 Sep 2022 16:37:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZEL1-00F4gG-Pi
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 16:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663346231; x=1694882231;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bZnDVOvbiRLhSk94hBQ5CwnShaV+8n90nTaw7obPVLc=;
  b=q/MbYlybEKO3pfkrsTMa4RgGKQElW+m1wW59o+tHjsd5YMQ1zdW8HK5F
   GrST1dXYmpVC4H/VXXcjoCNDV/E0l8QFTnnuqIJFlK5CYKFiCVrUAXAMl
   P6q540H4/6C69R8CAwiKR6RgIZpZdiH5uPSaQcTUxpZHVLF9pata/8C0Z
   0acrAXsaJ+i6RLvymtX8pU4N4FOxzX/dT/D07PK4UDhChP0EzXMFEKPxD
   Ytx3AyxV3vYcQ+fMM3cmk2qQVR3SUZUZty9HcWNBH5HxPvytQlmcMLVet
   O29SUZIDuvfRmje++D8sRSC5rkx94RSroJTcjajtxg01DKc7KGPCCw1JB
   w==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="114061274"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 09:37:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 09:37:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 16 Sep 2022 09:37:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX9QGKOrsnSiKO3Afdp/mXTwGKE7IFO7ae5dhwE7M0ashcxDVNilu/wmJuOoPRx1XwjWTisbokDeVXweXlcyiEs2V+qZA1fVjabqncp6dlP0NuM9KmE+31eaZbR4cKdSS+rvuYYvgi6p0/ciN8pUHQK8HRjBu4NgmInoZ/3b+wACHO/pnq40u5yWDOuWVa3FQPGOoP7lfp8Ym1u0I4WqRCdphQeAKdP/0MR6Yqkfx8+kB//8Yp5RlL0QkiN02cuB9rSAIsvUNfCmZEwVq070g/DvjXTVgvi40fsgDsALXdqqfw0AHhsR0ykrv30UqIAlX1p7xl+rNBQ8fAxzFQqgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZnDVOvbiRLhSk94hBQ5CwnShaV+8n90nTaw7obPVLc=;
 b=KRl365lUT/YUIbaZ3uq7Jk0Wc98N7+9jqh4j+f+TY7Ok8IM6kTMPehW77AIb5DBmH059a/bPcdDe9qplt+vMGUHreEs/8CUt6gqgqqMS5hmgpZKMP1XiVe2C69GssjyvuPdcs4RZRjxG4SrDBG4/AYx500X7Pafe+LbG5Xe7hMJvmEPQgENiKRGxvwwhrpla7983xGamK9QCQ2Qe9ZZ4M0y1o1ZbO9fgAjGTnQ8HsdsqJKCN7BquQ9PngngXa9DJCuStQMMLXDJO9ZpQyunMW6UwvHBiowALZ6ZXJh4fI2/tGvDOwWs8tAK8/xOgArMtRJMKzVwrAyXVErX9woVUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZnDVOvbiRLhSk94hBQ5CwnShaV+8n90nTaw7obPVLc=;
 b=IS0Pyf80tfMNHitKvFLCZ0K7ZdGuGQLtsnEresvJ9vqtr4WNe7///dBf9yNkm4RnQX2KjwALOVvBVKWqvfu4GSPTC+qMU04Ffmlv9bID90L+Rxb90eHODt5wTh2ec8LtRGxO2K0qGscloKvc5YgqJc5p6iSl0OLt+57xXjTXKa4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5507.namprd11.prod.outlook.com (2603:10b6:610:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 16:37:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 16:37:00 +0000
From: <Conor.Dooley@microchip.com>
To: <vineetg@rivosinc.com>, <linux-riscv@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <palmer@rivosinc.com>,
	<cmuellner@ventanamicro.com>, <linux@rivosinc.com>
Subject: Re: [PATCH v2] riscv: ztso: disallow elf binaries needing TSO
Thread-Topic: [PATCH v2] riscv: ztso: disallow elf binaries needing TSO
Thread-Index: AQHYyYQq7AHa3Cms0USowTkeq57IPq3hmaYAgAAGkoCAAJ+EAIAAAlCA
Date: Fri, 16 Sep 2022 16:37:00 +0000
Message-ID: <d30b4730-b447-e8bf-fe1b-edaf35345b65@microchip.com>
References: <20220916030552.1396820-1-vineetg@rivosinc.com>
 <20220916042331.1398823-1-vineetg@rivosinc.com>
 <67a3aba3-68bb-5e8b-4e4e-869c8e99e879@microchip.com>
 <9b9ff287-75e5-3ee5-e6c5-1daca6c562dc@microchip.com>
 <adf840d4-b5f1-4b1f-faac-d735465028e9@rivosinc.com>
In-Reply-To: <adf840d4-b5f1-4b1f-faac-d735465028e9@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CH0PR11MB5507:EE_
x-ms-office365-filtering-correlation-id: d57af592-f8ff-45e6-530f-08da9801ada5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jmeyNr0U73MVizTqF74r+AOJ9FbJB+VxTeBe1527NQS9kWG0PBRZbVScAOCPXKLlZfP+I9xFm7pfilZN2IGz42slWssAllplCJD44NQGoicpJ9ONl1yX2KOd5Gwc8KtH6sfie556dElxPcLUvXg2oiDEx9rudKUU20SXAYIEMw9tgJw95irrEAbeitssCuy0B9jHYlgt45INZvr3VYf+sX4xylrOPfmDXE2mrtBi3fZmCNtr6rpDPrCxOasHOZonij9mia+30L0QBWVxD2RFQVRBhcnOD3ECO4z+zyPCzFyPVIormur3EdqAlS+HHdr8LyJD9mgDqbR4jL7mhdJbJFdtgJBUs4CZurBBnDUQ7PAt/6OOL6TdLiZwj/jrBg+rv+IZRfXebb0/iIWJhLfHPYh6XztDhCXQMrolE44CWoI0CSnj659R1QwU2tqwZWXH4koQ/eMPlm/nq3QoE98CPCpB1EcQ0i3uB7JoakMtih7GsbLYhMuHg+bnjc74rceuZ2IKFPUSL9PUOTt0/MME0PjWhLuFJVA+v2Nnss1vtpQ6qBQMQ0TucOXdd+jLM4En3O8uN9F0FPTSYJrDKsRjAGb/hJsJNs4WJ2fC+w59p90JfBWjuuxqRmFRiorF/UO6pYAB3F6dpM7zdY87X7P5IEq/r7TWeuAdGWBJu0QqGQnuEDhzZX9oRuWgTI2JUENudHa340wGM769vhgnQRYGeNZfEuJYf1+hqhxvs+a8IRXIk6OdibnFyCIM3NXwaehn39Hbw+6zpGpjE7aaCh6kvk1P3fLWM7MbX7I3gmMnz/+09mxaE9WbpegMP4QcQWm9zs0/xR+J4BZU513UfkF3Yyex0Qddr2A8lhRyPPrHkII=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(64756008)(83380400001)(66556008)(66446008)(110136005)(54906003)(2906002)(4744005)(38070700005)(31696002)(86362001)(8936002)(66476007)(36756003)(122000001)(38100700002)(41300700001)(6486002)(316002)(966005)(71200400001)(478600001)(5660300002)(26005)(76116006)(6512007)(53546011)(2616005)(4326008)(186003)(91956017)(66946007)(6506007)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MktybzhnR3FSRHFMTTBKcG8xdHhWaC8wM1JMbGdPa0lwcEZub2pCblFZbEda?=
 =?utf-8?B?ZitxSVdwQ3JwY1FJU01qTFRnTnh6R2s5MHBtNi9vN1NlNnJ1TVZEdllYaU03?=
 =?utf-8?B?c0txaHpMQTI4QXdMOUdiRUdlZzlyVENDckxKblNOWUQycDR5WGtCTGYyZXJQ?=
 =?utf-8?B?cjdCbk4vd21TWDRZOGo0ekwvMGxyK3JqWUhpOVZFOThxOHExN080ZjQxV095?=
 =?utf-8?B?UDlyTHh5c1BZS0VPdHk5TTJ0dE5mSXRvQUV4QkxWY0ZNYnA1WXBZaUEwenha?=
 =?utf-8?B?Um9sVTUzckVFcEN1VWRxWGdTbWY3OVJiMWJxZzVPbUYwcW9qcSsrRUsrUGww?=
 =?utf-8?B?V3R1K1kzajljSDFLb2tPN3RYcHdWV2xxMDA5cEpYZHN6THJYZHEzMCtlM0Y0?=
 =?utf-8?B?bldvcEFUWjRRZWdzY1hJSWRRRWViUU9PdXdFSnZDdU9zWnFzdDlhVENrK0ts?=
 =?utf-8?B?QlNxRlBHOWNQYzdpYVFKRkhBdDNwa3JUUitFcUdaN2NrbTlHOU9sYS9hR1FC?=
 =?utf-8?B?TDNGSzZkOTA3cEE3Umt0YkYzZmhQWlhxVk5JbFBGUWM2Y2ZvRy9oMGhiVkQ0?=
 =?utf-8?B?b1JCYW00M3R6NkFWR2l1Nk1GVTFzZEZYT25xZDhPSEtOVUdocFVXWno0N1d0?=
 =?utf-8?B?dVpPVGV3MWh1RXk1Rm9WNitCYlVjb0ptQzZqRHI0TlRSWC94eFFLS0FzK2JR?=
 =?utf-8?B?MkhpclZ1QW93MDhhc0VaNGE5cU01ZU5zaytrQXJCd1o0bXFPMGx6Y09wYnkr?=
 =?utf-8?B?N1pIeHAwajFNRzVTUlhPZnRzck1sbU1jWDdlNmRhd2FzSUpXSmJxZGhXd2Iy?=
 =?utf-8?B?dmZPQjFFUkFSYUQ1SW5wTTFzYWdUMTNweXdCU1VyZmRHVHRTQ3h2QWdEUi9w?=
 =?utf-8?B?Q2EraGtYMHRuRG1KWEdrTHk3bDNsVk5ueXFVS2JGV0JmM1ZGVE4wSFV2bHYx?=
 =?utf-8?B?T0NFUmF4YnpJRGNnSG9TeU5jQUQ0QUVDVFhVQXVMUEltZndFTVFJK0o0NHpl?=
 =?utf-8?B?SWRQWFMvUGR0SW12UGVIbGNKODJIeUxwTkNqVWJqMWxYN0tnTS9PVjRzNFRZ?=
 =?utf-8?B?R1FWM29uRDh6bGhwYUM2blN2RUwwVXgxQm9lU1hyMzRKY3E1MjNTYXpSTTZG?=
 =?utf-8?B?cXBrMkFyd2RtSXJCRjJxYVZQcCttV2lPdVNTODFlcENNRGlYaUIwWmxzZ2pM?=
 =?utf-8?B?MTNYS1Q3SHFnZGlRR2xOVnd0ODhSN1VXRUQ4N2RxdVQ1MWxZdzZKNXFadk1Q?=
 =?utf-8?B?QzdodGxMVjhCTDlZdHZCL2FuV1gyWmo0WXAxQTIxTkRidDFWYzZUMG1jTnM0?=
 =?utf-8?B?YjBlNkhLQzJDNm9jdFZscGNWdUxubXdxWmQwZDU0NXF6OHVZNmxDb2tQT0lS?=
 =?utf-8?B?UVFORzBxdHpOb3VuTXMzMDAxT25YeVdpalU1Ni9iQmZUZXFHdDJFOUxhTUMw?=
 =?utf-8?B?bXJKN1kvSmkzbXZsZnFzSVQyM1JCWHJrNEM3WDMzYlpHdC85YzZzSE5remhl?=
 =?utf-8?B?S1g0b1A1QkFhdkhsNnAwaE9YcTBqSWVQSVF1TDFCUm5CQjdKb3YySzVCOFdu?=
 =?utf-8?B?cTF4cnFhdkJMNDFWTlBzMksyWGY4bEZseXNta3ZRZnFrVkRVUE1VTDJJK043?=
 =?utf-8?B?cG1QV1VtR25mWTkyaDVlRVNZRGQvRU0wWHNIQ1lHd0VtSU5MNmh2YnZuM3hK?=
 =?utf-8?B?V1JDVkMzbzA2cGM2M29zV01nVEg0WmIvOWdMZ3lOeHU0NHdaM2tmekdmVnpt?=
 =?utf-8?B?bGhoVXJHUjRZVTQrYU5vUDVOUWc5UnRaNGsxMmJCUnJWVGZFM0Q1VDdpOUJE?=
 =?utf-8?B?NzZPUEllWWljUHFXRGRvM0Fnei8yaUVUN1JKSlpFOWJkTytkYW1TM0o5dHNH?=
 =?utf-8?B?SHVSZVZNQmxyTDAxa3kyb0kwc1A2U2NBc0x2NGlsdFZNTEVjVkUwRUliZm1D?=
 =?utf-8?B?S1VFcFdYTVEzblBxd1BUS1ZmcXpKQVplZkxIS0dDU0ZQVXZXK2c2anpUV0VF?=
 =?utf-8?B?dUxPaDR6VGkvUDR2ZmE4Z0w2Zk5OYS9KQ3hvRklvZE1aaVNhTGxBQU5CNHRN?=
 =?utf-8?B?RzY0dmRtMzl3M25hdGVqVFYxcWRNZExFbTFlTEtIQi8ybGh4RGNaNW9zTE1o?=
 =?utf-8?B?NXFxcUdQekRBemtsTzNHTmlMWENyd1lhSWpVUkNtQWxvTXBYYWhmZzV5SDVS?=
 =?utf-8?B?NFE9PQ==?=
Content-ID: <69268570E7C2314D89DFFD2D5DFA4D4E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57af592-f8ff-45e6-530f-08da9801ada5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 16:37:00.1716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rhn8vlUX5fHGx3XHGDIPUrE3rZ/8C8hXELBcRDisf6ma3zj0s7yRRhV6VBwHGU/+PfXTrjPJTt8yeuwsiDdcQKrsPnMDJTNC9/m4AqqgloI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_093712_163895_8C554572 
X-CRM114-Status: GOOD (  12.84  )
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

On 16/09/2022 17:28, Vineet Gupta wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 9/15/22 23:58, Conor.Dooley@microchip.com wrote:
>> Also, since this is not marked as a fix, why would we not just apply the
>> patchset from Palmer that looks like a more complete version of this
>> patch:
>> https://lore.kernel.org/linux-riscv/20220902034352.8825-1-palmer@rivosinc.com/
>>
>> Maybe you could offer an R-b or some comments on that patch instead?
> 
> Sure I didn't know about that patch and my idea was just to get the ball
> rolling so tooling at least can start having tso bits as last time
> around that was the blocker to getting stuff in binutils and gcc etc.

Ye nw, sure I completely forgot what the order was between frozen,
public review & ratification was ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
