Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCDAE8FDC9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 03:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noDmr6qmVWvE5PtT2G9BuXEFcp7UF4fWTVjrdVu//vE=; b=DO0YghiXyacf0R
	pijZ/gJBcQbV2hnh4LFXhzuRTrP0Uams4rsl3tEmT99sJxM0WgCsXibFmuhol7mRxWL/cGZLmI3q9
	vyK7NwsNVZFUaW1UjHR0Hg8MBxi0/Xc8V70XfmV9hWm72MrIiGsDM9Sxhxjy0r3n1DNdCap2pHt41
	XHUsZG4FHTuUx5hNLkQuN6CMP+TMplxU/mzL9TCr6/t+SyUaSeg7xMRCds5LjkkTOvb9kpbtJ3dKX
	infzAizvVr/SVN+tHsLSYXicIMQoe3qifIQkPjaUQzCDt4t5Q1j/n+n7jeSiN17wAQBy2eWZ8h52r
	JDJjIrY0dNHU6UuMSGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnsrS-00G0IX-1i;
	Wed, 04 Oct 2023 03:47:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnsrN-00G0Fi-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 03:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696391261; x=1727927261;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=85YOkRJmW5aTWydQnRYmVQPvL7B27Vicia++vl/NZc8=;
  b=Wukfm31sluJzZFzAH0Rk2hAaDNUJoUDS5vRNLRHugIUBzk1bpQGC0/mg
   z8kBYqkh0V4vfHCuFSMnFHGnRql5uET5SaIGr57v5Gwfv2rATD4Oks5gw
   OtQzKIxryF9IwTWi8S6JQqgGAxO+a4bU0uT6gBr5MnOO7osdwDURcDXv9
   yYxij4mnKBKvJKPZgA6UKQYI45sO/FGxKmI4MIGk8U4y7EiILTxIigeSN
   Omj8YEHxybUoN7PfnTzB91B5WfULIaQ4kVcKauk9YYhpbKpSSJHtvzO3r
   /OwRsngqDW6TehWtsxrZ01O0m0UeRpcdHZQDr0Fswzec11F8UmCkxY5SP
   A==;
X-CSE-ConnectionGUID: 7H469gUmSGCXZdgy/qs//w==
X-CSE-MsgGUID: W6hQQwtcQrKEZl7BGnrLdQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="7992578"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Oct 2023 20:47:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 3 Oct 2023 20:47:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 3 Oct 2023 20:47:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl+IokdOGqvv5AI/jS3QvndOvw7C8HloER9izpMkJs2j1cpi3CVMwK1kirQ1mBsFM2Mx9ebSHeLP5uq2jhM7sAPznwxfsul8tTTgraYbpqvGkqJAfBDVS0q6N7PsgH/F/DO/lawPc6QJ/CQaBx2VKgA3j4rOL/7NhG2HMsnSY7jfQkKbihV5AQ9oWIw6u4U/RfcgNyv5M45K6Vc4gMxyL2X5jEk9M9FCoG1QM7ix2kOV29UaynhCvQ1N2t1tPL+1MH1W7ORSf72ke4TNhWzYHZ9qtFvNrn5p5wBqp7PlUoqmxPJ+7PHaWMvJYh9WBoOAd5EmoeCiHnyDD4eDRt8Rgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85YOkRJmW5aTWydQnRYmVQPvL7B27Vicia++vl/NZc8=;
 b=lt6yq4KJ5+DbIfRWMltQ5AKrvTM6X/3+VCWHWezZDO5THmhd+qGgAQDHuwMyyZqrbX9+bywDXXktTjD/oX7dFfH37RxoXgq30tvFmXz6UI9Fsh0QcYZlEMlY/pQn8iltcbMgFQzfoq9q+4Yl2Xen/T0NYQlK5GiQ/vP43+zEL4T797Nffd+SZs22kKUxbX2PXGtFj+cooV9aWb2JQwXFRGu3wnVSeGeI/gm2KP+7TB+FNXGH7vCTv6K91FRw058O3BjYVAFm+qk7JF168A8JaN8tb051hQDLie1DpKDCzYHyJarrjeePmw+IyV0qOjl8U9nkm2IQyu8xjnbWnoJ0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85YOkRJmW5aTWydQnRYmVQPvL7B27Vicia++vl/NZc8=;
 b=iglkWblOuD+EThkAa5A4sTtvTuTUwCuDc7pApqA/JY7SkI3R2I/Su3Uqzw+irO9OqrS4NE5WvS64zqmmJj2aLz/iFJDbhq1mpCyQ4Dx71TpW3kEuzWyZuHhc+bBXqErJt0ylVwvE9I3VD7BzmKrtFLpTsBQtf7SzQIMMs5PdoW0=
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CH0PR11MB5442.namprd11.prod.outlook.com (2603:10b6:610:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Wed, 4 Oct
 2023 03:47:08 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::7e31:26a6:698d:8846]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::7e31:26a6:698d:8846%4]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 03:47:08 +0000
From: <Shravan.Chippa@microchip.com>
To: <emil.renner.berthing@canonical.com>, <green.wan@sifive.com>,
	<vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Nagasuresh.Relli@microchip.com>, <Praveen.Kumar@microchip.com>
Subject: RE: [PATCH v2 3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
Thread-Topic: [PATCH v2 3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
Thread-Index: AQHZ9bEfSrhEFWigFU+chaZTfsHpRbA3rOQAgAFRb1A=
Date: Wed, 4 Oct 2023 03:47:08 +0000
Message-ID: <PH0PR11MB56114DC76037F8C882D4CCF781CBA@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20231003042215.142678-1-shravan.chippa@microchip.com>
 <20231003042215.142678-4-shravan.chippa@microchip.com>
 <CAJM55Z8+UtVwFRxOKPcNKmitzkZQ9tyecG46dhTZqiYZgw903Q@mail.gmail.com>
In-Reply-To: <CAJM55Z8+UtVwFRxOKPcNKmitzkZQ9tyecG46dhTZqiYZgw903Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CH0PR11MB5442:EE_
x-ms-office365-filtering-correlation-id: ff0c1a18-d7c5-480a-2f35-08dbc48c957b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7/byRisyHj4vhRaLBDpM+Fg7AlU9VEqf3GCCwP6QLagLI/jqzBwayjx8/pqbHghFtjlsGhhOz1X2g/Um5TCIvKhH8+isfkbC8R1q+KXUjwyqgwynylBLR7Lpm1iYX3nbYRn41bQb3/YF0AfKD1ZN++Ige7twxJNk/20enM0C5DSwws67Q36MrPKzWUoVxqW6euHUBvVJb5Ewp0SXbnropq9LNj7rHpMDwusakF6Z10CNlvnb15BO81QmNBlmdYh589uAjXVcNy66n4xQaCQgBrWd1f068/Fivl37KkddojEC+gXqG/P7/j9C2D1HYNggpzIw5UPjCvQnMAWm0PhVu2cpgGmPlhXVs/8tmvEDyIK5Bu8fFuJZ9/msD7gXLIGxSdy0RA98tudruB9xsRldWekWsYCiwIuuBwh7yROjbgh+sG56x3Nbkr9xYVBaUQMkIgmvUSWGgeXzfOMfW0k4sDMjzWZpQ52uGwJnoS1UtXQJJNKj5R/KmiVcMjvQ4AHPmk5GO/jYkebwlXW8uBtj79EyGUlMhWMDtfI7tP+TfDe77vGqAKh1K6jIkJtzYmvksZTGuUGH3a12Qw2XUye/1fPq4vxzFovjwc/KjGIUjm4+7ENv9zeP0Rt2F1Gcp160
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(55016003)(2906002)(7416002)(52536014)(5660300002)(107886003)(8676002)(26005)(8936002)(76116006)(41300700001)(64756008)(316002)(66476007)(66946007)(66556008)(66446008)(54906003)(966005)(9686003)(4326008)(110136005)(6506007)(478600001)(71200400001)(83380400001)(122000001)(7696005)(53546011)(86362001)(33656002)(55236004)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWZXMHNxREFoVlJ2NTNCZTJZY3NkZmVRQzl1MmtyTzhBcitxcmc0RDdwVWtB?=
 =?utf-8?B?THg3WWtGMzhTM2gvbXE4d0h0TkdlWXRrNG1na1JxOUExdHc5NjhTTDVWajBV?=
 =?utf-8?B?OEVYYkVuK1hYamg1enVGSGFXYnM3QkNOT2EydmRNUDJDY0NIK0xEMEEvL2hr?=
 =?utf-8?B?NDJFYXd3SFFOUHBabytMMXFDRmxUbWlmbmd1alJ6MTd6NHdPSEg4dDJhSGtE?=
 =?utf-8?B?MDY3R3RRdWFDUHBnOTRHV0xUQUtUU21NWVVLaHAvTmVJeDdSUHMwVUVVdU5h?=
 =?utf-8?B?SlBEV0c3ZDZYbFgwS0lzemF5STF5blY2WlZhMGJnWkFNRU1ESDN2NHRUNTFI?=
 =?utf-8?B?UGNJdTlIc1YxYU51VFM1aUsvSXB1bFFIZEo4Q2ZjSUZBcTk1RU1ZNVNvTnVw?=
 =?utf-8?B?QnQ5dUF6TG5vMTJtZUFZS2VySWJGa2Z4bVlBSDVnZytCZFdRN0pSL2VWZjh6?=
 =?utf-8?B?VFlzKzg3TVJjVDFvdHlEOEsvT2ZUVEVlc3VKTFcvdllaTGRHbzhSZCtCVCtI?=
 =?utf-8?B?bTRJdDlwWkJaaDBsZXFPRy90bzhuZVFUZEpKMFk2M2tVS2ZZMmFkYi9UcXo3?=
 =?utf-8?B?ckEwMngrbGJiU3NhVHk3Z2RHeUplVlYzc3ppclFJWHdCa3JBZVJkZEsyU2th?=
 =?utf-8?B?c05nWGM4MUdvVEoxa2dkdk51c01sUFhnL3ZIcVJhRXRWbzFzbVpyWHVLS05P?=
 =?utf-8?B?anowTHhqTmI5cmU3RXdRanllUXZMbHRMYzlJQ29Hb3NlVDNIZXB4dlE4azRl?=
 =?utf-8?B?RzdYeTFTQ24ySnFGZklWUXMxNHdFeTdTVlFxbXJ6S1h1TXVwK3RDd1JuVGNj?=
 =?utf-8?B?UC96azd1a2JhZjFCdEh3bHV6aitEd0J0SlpFNHIxdy9jUzN1UzdTQ1FuQUVF?=
 =?utf-8?B?SmpESjdpb3NZS1krMEZuUDFBSlR2TzlybHN3eFUwdWV2SXpUdlBlSFAxVVJo?=
 =?utf-8?B?cks1ODVjMUJucWdjZGROZUJ2ODFsMWdYcC80R2sycEM2d0I1aXZ5WW91eWhi?=
 =?utf-8?B?Ly9FbEFJQVlXMm5nUkN5WUZrQUQxNk4wQTZMajNPeXY1d1lEc2E5UC8wb0Nm?=
 =?utf-8?B?cXdKMEdpeDR5NW9XWkZ6QVkxRzRwaXp6QXBzaW11ZUptKzRVRzU1c251MklD?=
 =?utf-8?B?VDVOT21GNkpTM1lhRlppcnNjbjZnRmNXVEl5N2g5U3p5b3E5VWZYbjdBZUor?=
 =?utf-8?B?c2xZc0NHaU9JcWhLaSs1RUtLeGhrblZJVnBxTEhRcTBOUUovNWpvVkV5c2pt?=
 =?utf-8?B?NjE0WXUwU1c4aW1RdHRucXJjUG1XM0Q1ZDdUWkJBL0t5bzRZb25ROFF4TDZt?=
 =?utf-8?B?bFl5NFlRM1dEc2tIUkwwNkdkQnQvdEVjV1ErYmJDU21KQkV4bGlpbUZLYXNj?=
 =?utf-8?B?OU5DSEZTMy93dkRtMmJwdW1meUN0bVNacnc1OGJNeUlua29DaEtiemoxQkY0?=
 =?utf-8?B?VUc2SXFiV3NSTnBibURORXI1SHMrYmcwUVZtTjdQOHJIbnVRRnZyNy9LZis5?=
 =?utf-8?B?WlRwZEptbE5kaFc5ZVl5aGZQYlFGbHJmT1FNTUpoZjB2bWxoRWNDcDlHVHFG?=
 =?utf-8?B?OVd5T2pObGpvd3p1OVJqWlR4WlhrZERYa3NMeFNUNHhoNTlreThDclRycHVF?=
 =?utf-8?B?Q2k1SDBZcXhwUDlIUUZjZFA5S0IwMzgzTUJNTzNvOC9YWUk4R0c2Nmd3SUpa?=
 =?utf-8?B?OXB1SzkrcVQ1MVpNTmNvKzdLOXZuWHdPUlk4OGVlak5WM3hUdzQrcW5hQk5E?=
 =?utf-8?B?aSt0NXEyRWNEQjlueFljcVRSVCsxeGY1SmVMVEFwOWVFQ3RyNC9pN3lmZE9p?=
 =?utf-8?B?cFozMWhNZkhMc2JGMXNVaS9xaUtQSmt4QjhKSU85di9WRVhMY0J4ZnZwTkNn?=
 =?utf-8?B?Ynhza3BBZlhRMTJGL2FqZWZucmRFL0NZQUg2RVFBeS9iRUZsbXRpSFNIZk9Y?=
 =?utf-8?B?THJBUlFLOXN0dUhmQ1VUSTN4VUxTQWJvVjRKc0dtWnBvQUhyM0Znb1JPQndG?=
 =?utf-8?B?MlUyc1ZJc0l4cWtabExHS0U5NWRmQVZpU3FFOWs1eEhUMThsbEEyNEFjTXlz?=
 =?utf-8?B?cXkyUURicStTUVhrRkl1ZFlwV29wWEUzcGhBRFhwclVtTWVzTVZDRVU5WHFP?=
 =?utf-8?B?cGRVMVppbUlSeXMxQUFnQmxNSXZ1YVFqU1RGVXB5dmF6dCtZL3ZSN0NFS2or?=
 =?utf-8?B?c1E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0c1a18-d7c5-480a-2f35-08dbc48c957b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 03:47:08.4899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZl+GlfB4I7UnPCo0HL4UVdaNb+O1xlEnqsJC7WgEvvkVNjZA+aPso3kKJDoci/t/IlohkprRQhwj6nymTupFsvbzXrZ5a2GYcQkzX7EYgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_204741_575411_7EE715D8 
X-CRM114-Status: GOOD (  26.52  )
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

Hi Emil Renner,

> -----Original Message-----
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Sent: Tuesday, October 3, 2023 1:05 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>;
> green.wan@sifive.com; vkoul@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; palmer@dabbelt.com;
> paul.walmsley@sifive.com; conor+dt@kernel.org
> Cc: dmaengine@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Nagasuresh Relli - I67208
> <Nagasuresh.Relli@microchip.com>; Praveen Kumar - I30718
> <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH v2 3/4] dmaengine: sf-pdma: add mpfs-pdma compatible
> name
> 
> [You don't often get email from emil.renner.berthing@canonical.com. Learn why
> this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> shravan chippa wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Sifive platform dma does not allow out-of-order transfers, Add a
> > PolarFire SoC specific compatible and code to support for out-of-order
> > dma transfers
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > ---
> >  drivers/dma/sf-pdma/sf-pdma.c | 27 ++++++++++++++++++++++++---
> > drivers/dma/sf-pdma/sf-pdma.h |  6 ++++++
> >  2 files changed, 30 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.c
> > b/drivers/dma/sf-pdma/sf-pdma.c index 06a0912a12a1..a9ff319d4ca3
> > 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/dma-mapping.h>
> >  #include <linux/of.h>
> >  #include <linux/of_dma.h>
> > +#include <linux/of_device.h>
> >  #include <linux/slab.h>
> >
> >  #include "sf-pdma.h"
> > @@ -66,7 +67,7 @@ static struct sf_pdma_desc
> > *sf_pdma_alloc_desc(struct sf_pdma_chan *chan)  static void
> sf_pdma_fill_desc(struct sf_pdma_desc *desc,
> >                             u64 dst, u64 src, u64 size)  {
> > -     desc->xfer_type = PDMA_FULL_SPEED;
> > +     desc->xfer_type =  desc->chan->pdma->transfer_type;
> 
> Two spaces.
> 
> >       desc->xfer_size = size;
> >       desc->dst_addr = dst;
> >       desc->src_addr = src;
> > @@ -520,6 +521,7 @@ static struct dma_chan *sf_pdma_of_xlate(struct
> of_phandle_args *dma_spec,
> >
> >  static int sf_pdma_probe(struct platform_device *pdev)
> >  {
> > +     const struct sf_pdma_driver_platdata *ddata;
> >       struct sf_pdma *pdma;
> >       int ret, n_chans;
> >       const enum dma_slave_buswidth widths =
> > @@ -545,6 +547,14 @@ static int sf_pdma_probe(struct platform_device
> *pdev)
> >
> >       pdma->n_chans = n_chans;
> >
> > +     pdma->transfer_type = PDMA_FULL_SPEED;
> > +
> > +     ddata  = of_device_get_match_data(&pdev->dev);
> > +     if (ddata) {
> > +             if (ddata->quirks & NO_STRICT_ORDERING)
> > +                     pdma->transfer_type &= ~(NO_STRICT_ORDERING);
> > +     }
> > +
> 
> The commit message says "Sifive platform dma does not allow out-of-order
> transfers" so you want strict ordering by default and then allow
> out-of-order transfers if the match data allows it, right?
> 
> But here bit 3 is set by default and cleared if the quirk is set, so it looks
> like bit 3 actually means "strict ordering" and not "no strict ordering" as
> you've named it.
> 
> The confusion here probably stems using the same define for the quirk and the
> xfer_type. Unless I'm mistaken above I'd find something like this a lot easier
> to read:
> 
> sf_pdma.h:
> #define PDMA_FULL_SPEED         0xFF000000
> #define PDMA_STRICT_ORDERING    BIT(3)
> 
> sf_pdma.c:
> #define PDMA_QUIRK_NO_STRICT_ORDERING   BIT(0)
> 
> dma->transfer_type = PDMA_FULL_SPEED | PDMA_STRICT_ORDERING;
> ...
> if (ddata->quirks & PDMA_QUIRK_NO_STRICT_ORDERING)
>         pdma->transfer_type &= ~PDMA_STRICT_ORDERING;
> 

Thanks for the input. To avoid confusion on the naming of the macro and new macro for quirk
I will try to modify it as you mentioned.

Thanks,
Shravan

> >       pdma->membase = devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(pdma->membase))
> >               return PTR_ERR(pdma->membase);
> > @@ -632,11 +642,22 @@ static int sf_pdma_remove(struct platform_device
> *pdev)
> >       return 0;
> >  }
> >
> > +static const struct sf_pdma_driver_platdata mpfs_pdma = {
> > +     .quirks = NO_STRICT_ORDERING,
> > +};
> > +
> >  static const struct of_device_id sf_pdma_dt_ids[] = {
> > -     { .compatible = "sifive,fu540-c000-pdma" },
> > -     { .compatible = "sifive,pdma0" },
> > +     {
> > +             .compatible = "sifive,fu540-c000-pdma",
> > +     }, {
> > +             .compatible = "sifive,pdma0",
> > +     }, {
> > +             .compatible = "microchip,mpfs-pdma",
> > +             .data       = &mpfs_pdma,
> > +     },
> >       {},
> >  };
> > +
> >  MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
> >
> >  static struct platform_driver sf_pdma_driver = {
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> > index 5c398a83b491..3b16db4daa0b 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.h
> > +++ b/drivers/dma/sf-pdma/sf-pdma.h
> > @@ -49,6 +49,7 @@
> >
> >  /* Transfer Type */
> >  #define PDMA_FULL_SPEED                                      0xFF000008
> > +#define NO_STRICT_ORDERING                           BIT(3)
> >
> >  /* Error Recovery */
> >  #define MAX_RETRY                                    1
> > @@ -112,8 +113,13 @@ struct sf_pdma {
> >       struct dma_device       dma_dev;
> >       void __iomem            *membase;
> >       void __iomem            *mappedbase;
> > +     u32                     transfer_type;
> >       u32                     n_chans;
> >       struct sf_pdma_chan     chans[];
> >  };
> >
> > +struct sf_pdma_driver_platdata {
> > +     u32 quirks;
> > +};
> > +
> >  #endif /* _SF_PDMA_H */
> > --
> > 2.34.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
