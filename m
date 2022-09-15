Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF431ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJ1LlRMrBdIJaJlIuIDcdKWNSJwBZxv6vtW09Y2h02E=; b=DUtUENw1x4Tcp7
	ek08JYlLfBOU+i0G320O+SL3o6dI/F9cncK/pGMYnHIIYqKzcOrMxiNDo4aAzP+/sN8LeePenK2Gi
	Lax3rH4HRtS2fjnftjs+uq2/LC0wb8BItO/oWb0E/bKYJFgQBGG3SlbafAb4YdzjXLi0+iIgCnT6B
	yNzfSo2a4vyHd+KW0H6qdky2e/ZUSZYrtQqBaA1xGWpKoH6uq9BBaSUW5A1WuaMJ1zPXKY/gOpBG+
	PEsedRwKcnr+aEbQ1ze5vohGxFP+Hfu/bCQfvnxFTKZz/5zbk9HAZcG/peLe5KkX051FT0i4oXN4j
	P5cKsn7K2iiHB4oAhEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpTr-00A5D3-9B; Thu, 15 Sep 2022 14:04:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpTn-00A4oH-En
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 14:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663250675; x=1694786675;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=BB3gzOtUvnm3JGIRPFEupwnY/1fNFKWMLUb72jnx28c=;
  b=UnXhqlxxxy9Y7uyOns1PnW13d4jM7iaWhZMEhntqt3WA+2y3i8356bDI
   RVcqu+R1WBSQY3wS+aelZECwNbn1nPDp92B2akcH/kJhyBV8xkUJo9I4T
   TUddaFi4HFBFYHRXPiJcBEK9KHZKrq8ppq/VOizQjZqT0lQUU06fTn6FV
   GMy9J31Gy+RWbzh8d3lOs7gUTEm1PIDpxI9C0nMO2YGDkjDYeF9L5ac5y
   Bu/KOIwF+To4x1x+rpBZenwTiFAFQQ7aW9kTJCtFt7rdn471a16zPAuSw
   OwHH3xPcOabnUoYNN1YJuoAeTMYVswjl2VkSfipYzNjV6XeO9QBS5woBg
   g==;
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="113845068"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 07:04:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 07:04:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 15 Sep 2022 07:04:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFC0PCHn/rVHJ6OBRbsAHMSaygPaiSR9OtAg6puFAisMAQYKsk8ufCI6CPEbwywI2UX9QVTv1amFYvA2HHDc+0OU+cPZ4mPpc5nypXxJMyndEcnrblAXr0VSGoI3r1djzPcFDBQvQAiwY/lPTdcFrHrnFC91hxTw40nteq0/Cas5IdbTWIBBV5ety93WO3yGHU+toezvkSVrBJgenT6+LgvSxSwOT+l7W3vBgrbEBKEkwJofs9jMZE9dTY3gOa+n6oiySayK6kcvLC6z8/xjj3mt3ly1NBBEyQM/a7QoAa6TTwmHiduvaWUf1h4mXqcAHy6s25jqK3GpUCh/Oe8lSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB3gzOtUvnm3JGIRPFEupwnY/1fNFKWMLUb72jnx28c=;
 b=SQW8YY0a60pJZHmvEOEgVa7MyMx5dQBy5kzPVrlbfojxwHORF2per1YyeZ6acXE1D+/r6Fo4EXCbEEqUVxCdg5+UWfAIGlNakpHp2AhDFzPCs4d/TjcAf/GvAdQnKRDc6H+bZa/RXhAvEYnh6Ie6tgxxhJCowukH2e+MvG0X9ST6y2mz6CNIA6qBO1flPtVctE5ootkaO5qQp52muRVvrPfPbs/UovIvRSoUzfE5zVy4IcTnVUE30kGRE3uNXGYoCaALTUJCPahz/7Oh8g+Y5jS4t1XgkyzXiU/e4D1NpBH5Mtzx3K24CWVyaY3H/nN9lC05emXAp96GtXBPCUStlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB3gzOtUvnm3JGIRPFEupwnY/1fNFKWMLUb72jnx28c=;
 b=PEndyHMDlh0KafIMfvijB8sqhwij44mMp3p3J5jVLt+9V2bpqjAPdYWsP5ecLlRyZZ8hs0l4dQ5G5WrOzP8XtIDgwCmxYC/1LoLUKEmDnhP2spMDr3rMazmNVM7CYfWHaFp5Jd62alBxt97gRtAMaGjZ6MlNI4ACWj56ag1ODfI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 14:04:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 14:04:24 +0000
From: <Conor.Dooley@microchip.com>
To: <zouyipeng@huawei.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <guoren@kernel.org>,
	<tglx@linutronix.de>, <liaochang1@huawei.com>, <chris.zjh@huawei.com>
Subject: Re: [PATCH v2] riscv: tracing: Improve hardirq tracing message
Thread-Topic: [PATCH v2] riscv: tracing: Improve hardirq tracing message
Thread-Index: AQHYyQkJfpcoPVCaGE+Ygjv6QbiXMK3ghfWA
Date: Thu, 15 Sep 2022 14:04:24 +0000
Message-ID: <ab6654e6-2dda-4dfb-10b2-2c9624509507@microchip.com>
References: <20220915133648.59235-1-zouyipeng@huawei.com>
In-Reply-To: <20220915133648.59235-1-zouyipeng@huawei.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SA0PR11MB4685:EE_
x-ms-office365-filtering-correlation-id: 53838fa1-6b34-4b35-9e0e-08da972331cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZypeboNSNXjP6UJmXTo8h3oqL9FwrqNVR3m8/QSSGaedgzAjxGE/HuApa1ewxC9RUvjQ4ezXIAbI3oZ7PO/NIiNkdeto6Sw607GkPxkaO5C75eL0B6B2YcjIKDVljDzON/FC+lBkdwh2jGfYE/rMv8raKPgtkuGCl4mV7fOU4J/c8TXqrRYAH8r2pA4qLXrrwcx08WbGOfhThugKOGVslmR/FmDTXsB+l7NqPqR0XGFY7oPeS71i2ZCqlJmQqHa1JMk8/SYfw8ENG3S6AyQsXwTxQ+qQvgcgfcWTO994RZF4//dAkqwyimsGaxvp6cQlVxN6twV6nrcjbiawQSB0ke8V8fEogbQmKdA/iroo2qft7EpRwdgvHxdj3YpgN6HR+QC24Q9kEgs73fsD9vQbUjqOlEzkV2WjYMuuQUisfgR4pVoygJ4yRN39t6UxJQbQMdiOixoeMfkeAXCX0Nlp6K+Kd+7B7qGzLHewrkaa9f6qLfJvXqSl8Fjgmk6HVuukY9bv8XuxLeVrKOIptA49UQqVLQqUpcgfelbFxpYTJwVCagL8UeZRmVKnA9v+AvFqllw4vVtDNEB4z2gdJJeW/vmDhvBk7b02jxvw9MGmRXy7N3mpKLvpC0Y5rWAC4j8ltQh24iBEHOC1xYDcOS5yD+LECYHLtqmjkMLzEboHxDw14Hg+4In1gyRBFVoQHeK8UbCgRVkrAtPkDV625X9ocCtm3t3mbtFubaPJ4lRNrTDixHWJukwpis1S2O1lY7nA6NYuxuze2I7Fp1tGlk6ee4S/Wg/IrzlDldRBs78kVY0fHa4E7ktw/4pBHn6t7muoe9WppJ2vJmzWyxR1+L75af3rwnQ8t2XRUgRerCgzg5g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199015)(15650500001)(38100700002)(31696002)(91956017)(8676002)(186003)(6512007)(36756003)(64756008)(66446008)(66556008)(76116006)(66476007)(66946007)(316002)(110136005)(53546011)(38070700005)(6506007)(71200400001)(8936002)(41300700001)(2906002)(26005)(2616005)(5660300002)(86362001)(83380400001)(31686004)(122000001)(6486002)(966005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RCtMUGptQWFOUWlLRlF4bGVhQTZab1BYeXR3bEtvV0hVaDNrcHlzNVNySDlX?=
 =?utf-8?B?QTI0MW5mYi9jODdaYVJjWm1qbkVVY0YrRm9oY3BrZ0FiaXBlaXgzOTBBUE5R?=
 =?utf-8?B?RTBIcHJBbHREZXluSUpnMi9HS1BNWVdrTXJSa3MyM042VUlCWFdxYmJMNE84?=
 =?utf-8?B?NDVHMDNsV1BtdUI4V2JBK09XOWJKYzVOcnBsM3dQaFlmZGRPQVJOcUYvekhH?=
 =?utf-8?B?TlpLZGVTaWNUd29ha3c5cGFLWkVKRjczN2JyWWZDNklrQzdxV2RCMk0zdUQ3?=
 =?utf-8?B?MGlqNlhoSVZ3YlZ2L3dSZVZLQmlPalhLOUFpRkMxSW5tbzNOS3U2dVp4czNz?=
 =?utf-8?B?VmdTZmZUYWQ1N2xldXJCSENnUVJxWGpRdk1CQ0NOamhlZ0pQdXFPSUNUMnl1?=
 =?utf-8?B?VFVydVlwc1U4MG5hYzBxMVJzcDZMTC96V2tGaTJDYldaaGJ0VjJ4K2plSXpx?=
 =?utf-8?B?T2ZVc1hjSm9tWDNFa2hLSFhXeG12SmxwOWZ2OFRkVGl2Vks2Z1lZT1FzcjNZ?=
 =?utf-8?B?YW1acGlDVTZQeFZWdGtWc09XcG80QkllVWJhZXZacm9qWEp1MWZ4cVhrWlFK?=
 =?utf-8?B?NEtJc2FsUUhjcUxnTk9hVkxsVDgzY3JiVzhFV2lrdHloekVvNWN4SlhxUlVz?=
 =?utf-8?B?ekpKN2NoKzJoTnhld3J3MVFGNHZPVFRYeDk3YWRNT0dYOXR3MWRkMHFsK0ha?=
 =?utf-8?B?d1hqdTlkTndzVUNiSWhYU0Z5S3pTS05qc2U4QUdTWDN0Ylpic21qZlNQZnpz?=
 =?utf-8?B?dXduVGtuLzRuWXN6UXp2SzFwb1piMmd3SU5VV21qc2NsRW1CMWNyd0ptMjNP?=
 =?utf-8?B?RUltL0hrMzJuVjhwRWJXZmtXbzBYSTV4dE03WlcvTklXdTRIOWlQU29QUkJW?=
 =?utf-8?B?K21tSSswTExHL0pDdW8rWWUyd1BTbUlLSGJDMVZENjNmSnUyVVVOKy9rWFVP?=
 =?utf-8?B?UENWN04xdkJLZDRyNUpubmtwcFo2dVRtWGxVUkpmL3JIdW82ZEo5dEhIb2V4?=
 =?utf-8?B?d2RyUEVpeEgxcUgxODRxMnZVV3kwRTVDbVZjbnlKTDRUcStqUmJ3MzZnL0Jz?=
 =?utf-8?B?ejVSSUtpenptbUZNZjM0b25VWXBVUUNCK3BZODlob05QVkxaOHJZSGdibndR?=
 =?utf-8?B?ZHlNRGtTN2pIM2xIRnd3QXBaOUpvaWd1SFdHR2hwc2lLejVXdU14T2Z4WGZh?=
 =?utf-8?B?Q2IzU2V0MlBDSFZYb2ROVEVwTlRPNTQ2S1dSclJrR1RtaEVEaFNBdG9NM2tt?=
 =?utf-8?B?UXhFQ3pSMTlTeDlmUXFvYlNCVU5KSkovRVMrN1hxbkpzWlROKzFBVFRESEFK?=
 =?utf-8?B?WDRaWGVtUzRqeCswQUcwWElhaXpGSGxCQnN4NElTalE2ZjVQcllyYWFTS0NV?=
 =?utf-8?B?bS9jTUdSK2ZDNmNxYVlYVzN0QmlrMlpmb3RCclV5VG5iaFMxYkhWMjM0Nng5?=
 =?utf-8?B?cjI1eHl1RWZMYmVKVk5lL0s2Qmx3NlRBaEFOaEg0a3ZFQ3NCbVkxdmpFSUd5?=
 =?utf-8?B?SzNrbGlCVDFLWE1BK1VGT0twN1dLcGNQWkg1SVdjblhJUjdsamtmQ2ljczgy?=
 =?utf-8?B?aExGL0Y5OFFlbmk1QVROUXdZMlpLM0hENGtUcnR3S1ZORG11SlNyL1FJUDBK?=
 =?utf-8?B?dHplVXlrWEJzdjBCMGRqK0labFoxL2hNZkt0Mms1SHZlZitaakZIOEpXZStY?=
 =?utf-8?B?SXZOekJybmVWaXhOdFhYZnFEVWJKMDdacnZhY1hIUmNPTGJlS29VU2svN3lW?=
 =?utf-8?B?akg2SisyTW5OVFVHK0tJNFh6Rk1xQ3VBY3hsMnJTcnFldzJ0WGUvNFo5V0Yy?=
 =?utf-8?B?L1J5VE1EV3YrVGF5UGh1RFl5SkwycUlib2pjLzdMWVQ2cUdiaEVPd1Fsc2dF?=
 =?utf-8?B?RzREc3RKVFFRaFBZcUJpcVA3bVUzZm9QTDllT0JteWFoYUhuUWMzTTRMb2pp?=
 =?utf-8?B?ZVlVUkZwcjNyWWdjS09mbU1HTHY5bCtOaGFCRFd1QlUvOTV4S1ZOWkZ6ZWYw?=
 =?utf-8?B?eDJRNDBjdnZRdDlXakNhSEZwS2hSTFhFeGJhUEZWdldIbzVSRXFkSnhIVUpE?=
 =?utf-8?B?eUNnb3g5NWpzRDJUVkxIdDFhcFFJSGFoVDBZeU9OSHM2blBBb1lOQWpIeUlW?=
 =?utf-8?Q?H0prLWaiROp0+JjHsx7nj13yH?=
Content-ID: <801ABB59CAFFC9449E0F2470E5D5901B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53838fa1-6b34-4b35-9e0e-08da972331cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 14:04:24.0798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJfE163gKdEiCs4Ww/gqrEpxwJNBub0hVoc68uqTNSY3nqqir6zMIJYXNbUPFhWT/dxBO3Ar2udIrJvBnb5Y8MPv0RyTIcCJQByfSMKQuE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_070435_784420_4B5D4B48 
X-CRM114-Status: GOOD (  19.49  )
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

On 15/09/2022 14:36, Yipeng Zou wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Use trace_hardirqs_on_caller to improve irq_tracing message.
> 
> lockdep log in riscv showing the last {enabled,disabled} at
> __trace_hardirqs_{on,off} all the time(if called by).
> But that's not what we want to see, the caller is what we want.
> 
> Before this commit:
> [   57.853175] hardirqs last  enabled at (2519): __trace_hardirqs_on+0xc/0x14
> [   57.853848] hardirqs last disabled at (2520): __trace_hardirqs_off+0xc/0x14
> 
> After this commit
> [   53.781428] hardirqs last  enabled at (2595): restore_all+0xe/0x66
> [   53.782185] hardirqs last disabled at (2596): ret_from_exception+0xa/0x10
> 
> Fixes: 22e2100b1b07 ("riscv: fix oops caused by irqsoff latency tracer")
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> ---
> v2: add tags
> 
>   arch/riscv/kernel/trace_irq.c | 4 ++--
>   include/linux/irqflags.h      | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/trace_irq.c b/arch/riscv/kernel/trace_irq.c
> index 095ac976d7da..7ca24b26e19f 100644
> --- a/arch/riscv/kernel/trace_irq.c
> +++ b/arch/riscv/kernel/trace_irq.c
> @@ -16,12 +16,12 @@
> 
>   void __trace_hardirqs_on(void)
>   {
> -       trace_hardirqs_on();
> +       trace_hardirqs_on_caller(CALLER_ADDR0);

Out of curiosity, why does riscv need to use this when
other archs don;t?

>   }
>   NOKPROBE_SYMBOL(__trace_hardirqs_on);
> 
>   void __trace_hardirqs_off(void)
>   {
> -       trace_hardirqs_off();
> +       trace_hardirqs_off_caller(CALLER_ADDR0);
>   }
>   NOKPROBE_SYMBOL(__trace_hardirqs_off);
> diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
> index 5ec0fa71399e..46774fa85cde 100644
> --- a/include/linux/irqflags.h
> +++ b/include/linux/irqflags.h
> @@ -53,6 +53,8 @@ extern void trace_hardirqs_on_prepare(void);
>   extern void trace_hardirqs_off_finish(void);
>   extern void trace_hardirqs_on(void);
>   extern void trace_hardirqs_off(void);
> +extern void trace_hardirqs_on_caller(unsigned long caller_addr);
> +extern void trace_hardirqs_off_caller(unsigned long caller_addr);
> 
>   # define lockdep_hardirq_context()     (raw_cpu_read(hardirq_context))
>   # define lockdep_softirq_context(p)    ((p)->softirq_context)
> --
> 2.17.1
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
