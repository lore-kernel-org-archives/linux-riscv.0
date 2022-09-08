Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DA4C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDgSdHWHeKI69C+EyAlo/Lau3L3dbT7W0JarqTosYMU=; b=fsR7nzFqePu+IW
	fEQc7lpqAmu8wONAZvOWU1HqyO57JZ3InU3z/ViTklGeWhYClSM/N8YcLlxBTvBxjYq7pAE20UVid
	deqZHwla0I1IxTQ1qrLUuiQk5Gdavm054XWg0yQc/FWKy6UWt4Prk/U/4tBL7gele89cTUlBu2p6x
	kKjWESNZLVM2Mi0icmGYxo7SSI5cj3eoQSozO82Ufz9wMN6bQKGBkwlH/JqGPuoGx6xTjPR5aRQ/V
	vZGUoaK+AVSHtDExeHVAyH5B43Kz8AQcOTfKGoPmDWFbCb16ua5WMRc4dAbYd/eMjEgWRMtgHfeYL
	Ts7FkthHcHbO62ehql3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCJO-000UpA-Br; Thu, 08 Sep 2022 07:50:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCJL-000UoU-59
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 07:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662623456; x=1694159456;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QxGsVu8KiymyYgxX9TgdQUsFG6iYl8ionen7j7rqI4o=;
  b=WIKdeyIBfI9hE/5aBOPeIwvY1NF6xOsM3yyvMfA5d/tbncTPp9x0/RAW
   VY/wH9w7K2NuGcxrQlIqLS9d4nDuO1DTRrhnBrek4+7Mac2UgcK69uf1X
   BOWgZ9DK+QKc9UhzJvoIXRlFGE9LQE4SbbAdqZ9JNAxAR7GVlIxghGs3I
   B2rlNBmdOFZWUHii0Y/Wiu2JxGjnxOY5q0KWIvA34qu6z2CZruuj7ZpSa
   cYVyNDfhXd1GwWDYmKFKQjdf88kIwkfw/T1fT5/tWwakGd6/iS18WbBNT
   t9C4gCd2ipehGMsUhSQiSAsC/UlGPgxCAtlGDIYz8nHIdC5sBb0gW0WHq
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="179528311"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 00:50:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 00:50:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Sep 2022 00:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHGpOybXs2CcQu+UHzlnmbsJm6mjKFM1FAbNYhPuiS65gw52RemGrx7BSo7SATF+T+Oh6oI+mGaeErPhmi8VBTplzzJX1V0UZ5uTiKkiqEIavNrEWd72oCbADFTIyTOfHVfhS6VgqqiWl15HKAUK/bHUNGaeGA/6h9O3JnbB6ffwVIqiPp4Gl6UzJoCCf0XuHLRuxJycJBW5njc2EUVjFwGz+MVqhNfkZEc5TAq0uuB4rw2WnYeN4WuR9aJFQABOj8hM6U13/9bEBt6P2TuxkJkKzjANehRbjaz+VVw/CISh3BM8YIBAN3gzWL0dIiURUuenpDPtUQ7tYuqKsK2TuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxGsVu8KiymyYgxX9TgdQUsFG6iYl8ionen7j7rqI4o=;
 b=a2H1R7zAlF8z0CU5HY5kZQdttNdY9or6vcEXrFsXRPZVP7Qp27FO9SRxT2N38Xbe3y1SMN1iR5F75WGOFh9Ii4qsHDBryktZQ75Y/gzXed/SyxqeuX3Qdo14K7fmwslXUFLE/s9SwoP5s98RLyqDGlyAS6tU3Rn9DLqQVpBVZlc5LhqxCSuKMGrneQQcE0k1/5X742Dx1ia7Dm9j+K+x5/0fRHnmP68YHF5kxnQAARRHv9fLVVQn97XDjjkAKIPW9cVKu6tWf8lzt8DXsubvjru+n+w1d5JWCcgKTMXM+tLcwmsDh3ia9MAWXXsKIMjso+l4ZYUmSnGIQINk1Zr8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxGsVu8KiymyYgxX9TgdQUsFG6iYl8ionen7j7rqI4o=;
 b=ZLM3G9qVQFNPdrtCGC6UpLvChBDqpfU6ncpSOwR50eWhNyYo5zjPLIWCaI8/i2S4hul77ZZOiHqPhRQ+bBh3JrM7/zdu2676NkHypVz3IU8MtPgdKnfaqlOfp5O8Aa2AbVzjIwjT69C5z5gv2/tW8dkO1GNMtIJUP4O0j2g4MKM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN7PR11MB7043.namprd11.prod.outlook.com (2603:10b6:806:29a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 07:50:47 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 07:50:47 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <atishp@atishpatra.org>
CC: <linux-riscv@lists.infradead.org>, <palmer@rivosinc.com>,
	<heiko@sntech.de>, <anup@brainfault.org>, <mchitale@ventanamicro.com>,
	<nathan@kernel.org>, <jrtc27@jrtc27.com>, <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
Thread-Topic: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
Thread-Index: AQHYwcSsPeiVQ0wUxkCmS1eQIngROK3Uk/yAgACNCoCAAArEgA==
Date: Thu, 8 Sep 2022 07:50:47 +0000
Message-ID: <ce82dce1-d32c-0701-245d-6e3b84a1684f@microchip.com>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <20220906074509.928865-3-ajones@ventanamicro.com>
 <CAOnJCULO-pSNgsvXMbCiOi72jJmOvB_UGGw87psynbXgo1K_3A@mail.gmail.com>
 <20220908071157.ajjascv5ebhbwhv4@kamzik>
In-Reply-To: <20220908071157.ajjascv5ebhbwhv4@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SN7PR11MB7043:EE_
x-ms-office365-filtering-correlation-id: d437504f-f9b8-44ab-54ae-08da916ed78e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DKpKI5GegnpoXz1ktRGCxmti0rFnP+wLK4kZoXaGRDAExILtBchEwu/dPQJPN6nnE81bJerSCPjQCXWsYtAu+QkNEuKkNeahlx9skkEgM6s/OVGEeHa1nSiBza4Ae8V3tUdKNIjLK4ETixqg0bWdIMzbQTqDdNd0R5+fCIhFQdXiX6KI6+wdmMMMWETC3cf1RAlY/lkIID+ad+K/JG9WygiAyRVEQIe4YibrO5lAr08K8MYj/uvhAmOOH/Ce6nGkoAnyMFWYKSAYtbbVSE4I1TxpqsFz9fVOGPWrI0Saa6u3Af1S3bmRIK/WyUWLj37G49ekBk/nwGsDHQGfHnht2bOofijXfBexwbN2C77X4C275pzQyb+uXtHYRPBln/l9gUxRibNTAPBMM2RYrC341IHFkbcW8k81x6PDRo8JtlFlpSKDJDbov99Nn5ZBkPUWxJb2UaSuNkSclM6lkOVxWfF+jc/BJLnn1/ww8HfZx8v6Oys1cae3PL/JtQhjxJUO5okWS8holv1EP2B0SDudvN0ODOOSvV6/Um0XRqCVsY3B4G0ilSXT78UAl7h1Z6b5aJ8M7IKAyZl/rzUHT4bBAznPe1TW+SC7nt+eMGDge4GgNRo1Y0DAxEJyzJuAgK1llkUQPcVrQqtpIyHmPkrKVxNTqXlL8La9dKsCQJ1RYohn93H+46dkN1kKv+PCA6zuuZ+7gYNmy2rR+9VqHJKFlQ7k2COsys1FBYS41mLnZ7HuzMJbQTfABlhQUMmNj4gyK1XR7hB1znHAK+WG2gT0b7N6D8yTvMZcI72OsZYy9DenRXBwAsbFP6D+emvZgXJUQq4B1ERhP+F0KQF/JmFTCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(376002)(396003)(366004)(83380400001)(186003)(38100700002)(38070700005)(6512007)(26005)(2616005)(53546011)(122000001)(91956017)(7416002)(66946007)(31686004)(8936002)(76116006)(5660300002)(4326008)(31696002)(41300700001)(66556008)(2906002)(66476007)(8676002)(36756003)(478600001)(6486002)(71200400001)(86362001)(66446008)(316002)(64756008)(54906003)(110136005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU9OS0xPRGp1ZzBrNDhsbE9RaWR4RFJlTnlIZjZ3a3ZoUHRjUzV1Vzc1UjJI?=
 =?utf-8?B?NGZVRUZyMHR2VE1TUXpQdzAyVzd6OFBjcUI5Zk44eDlXL0VqaWJKZENidldx?=
 =?utf-8?B?aGRKaVlxQ1hBNUhRV1NjNVJKTVJTT291Skc2LzFkdi96SDRNS1FDNm4xemZ3?=
 =?utf-8?B?a1pnVm5KNUtnd2VKdUpCaVB0RjZDT2FOZTdhNjhkRXVMTlhpejJ4N0NWcks1?=
 =?utf-8?B?dTRoWFV4RHBkSWRTVWQ3cWhzNnhsNmJwSzRuRjFmWHV4SjRwQThrNnd0NTVz?=
 =?utf-8?B?MHhmekFPckNwNWwwQUxXaEgxa1UxVHphV2d1d0l3T280Z0VHekdHcUlWc0ZH?=
 =?utf-8?B?clFXbzMzMmp2YTA1cldnUnJnaTRFK25nT1NJalRzMGNqTnBQTEpyUlIzeEd5?=
 =?utf-8?B?U1hGWTBWb29yRUl2QlFWaTJPWWhaSnRKYnJ6d2xTQWJ5dzEranJ5cnNnNTcx?=
 =?utf-8?B?NVBXQTQrckZ4d3lTV1ZjaS8vQUQrNVdPL0k3Y2ExSlNjTVhpQmZMbGFOVWM3?=
 =?utf-8?B?ZjNydms1VURrVWZjTnpPdmE2VjYyRkdoVElVK2R1YTE1WnAyOUlkMkdMVFhv?=
 =?utf-8?B?RmZZZkRBTHArWmxRelJkakpMVXo1K3hmVjBXaVZuMEhxc3BCUWdtR2NTQy9B?=
 =?utf-8?B?bkNIZGNxQm5GT2pQcC9qZkVHN0xmVGNpd2FjbHg1em1FODdybUNEZ1daWm5n?=
 =?utf-8?B?d2ttU2lhYlFCWTRiSlF5Qk53OTZZd0VCcno1UzBsTTRCNkJsUzMzOGlONWM5?=
 =?utf-8?B?a0dqK0s1cm1jb0o5TElVRlNYMHM0S1NqVzc1MnllWWJtajJRWU4yclVPSTZv?=
 =?utf-8?B?THZxZmMrZ1JDcXNIWFB1OEFTZzV1VEhiZ1ZoYkdlTWxYZS8xM2JON1ZGODFu?=
 =?utf-8?B?NW0zSWI0UXVnQU5VY2FpMTZyeWdTSlp3dUpzZS9UWTA4RTdXYmh5VmZMd2N2?=
 =?utf-8?B?bDVtYitxaHJodmF5MDI5Z0V5QjA0THVkSStkS2JMd2hsVEpqRjBaa2UySlZB?=
 =?utf-8?B?dmFzRlVSUG5YQ0xMbFVJeDc1TTZRNEUxWTd4cDcydHhncFdEbnd3Y0JKcGxq?=
 =?utf-8?B?TlFlZVFXNEorazdweW1qd3ppM2FpOHhGay9iWWhIODlNOHVJdzJwKzVXenF2?=
 =?utf-8?B?TzErTjlFeUNZWjVHWDlDSG5FTTRwV2x0WkVVeUdCOFpBcjdNTnpsZlBnbklU?=
 =?utf-8?B?bE82L0J4M0cvbWxWWmFweGNKQjg1OGFGczdsYllDVEhTdlRzVDlwQ2NheWZ4?=
 =?utf-8?B?a1lSbHJuVzFOZE9QY1p0QmozNG9rWjFhTWFndGdqd3pFOWFYdWJrRDlGNEFK?=
 =?utf-8?B?Z0hwMWFPZDN3ZXBtZ1lnbmxBaTF3NGJwN1RPOHFhajd3SkxqQ3hCOGFjQU95?=
 =?utf-8?B?OGpMZkR0eFY5Q1pNa3BlUEthWkNYVGM0eTI5eXZVdzVlQXhKbUJyZEI1TlZn?=
 =?utf-8?B?dGZ2SWZteW9wdkhKWDQyNDdUUHI2VElXTk9HZTZsOFkyOUlkdGZ5UWVmUklw?=
 =?utf-8?B?ODQ5dFg4b1VoVmZ2SkhyREFPUEtsa2o0dzhJdmlTV2E4amRHWlR0NCtzYmdI?=
 =?utf-8?B?SlVKUCs5S0NuV3RIcG53bTY5VGdGYzhBVnh6UWt3WnNrNEx1azdSdk5yby9q?=
 =?utf-8?B?MDJIeWFKQVRiMTdJckpDblVOU3JhRi8yTlJ1YVFSL0w0Si9kWE9HOFVXOGpo?=
 =?utf-8?B?dXhKYXV6dllBR2FZT01WZW1OVjZKRldEbDBoeDNtK2VTeDlaTCtLd1pDenpB?=
 =?utf-8?B?b1hnZkdLNlN3ZjZHRXpLbTVlbHcyaHlxKzV2SkE2dkZDUDBFUjFJZFhzc1FO?=
 =?utf-8?B?VEE1YmYzbUFVRWFBMUhKUkx1bE1WeGRKeEM0TXQyNXk1VFJWdi9jWTh2VDRY?=
 =?utf-8?B?WTdiRnd3VmY1R1diNHB0SytudjlMcWg1d3dZNk1sTmVsdXpTdWxTcjQ5Q2Zu?=
 =?utf-8?B?dW81RThDa1ZuUHFvWjY2eU1aVWFmZU1iRE1DZlhUWi9yOGNWdDRyakJSOGND?=
 =?utf-8?B?aUdLOXJqWWpJTEc5bkkzajc2Tm9aZnFQZllYV09YRlQ4eFRLVmk4d3A3ZE9O?=
 =?utf-8?B?R2FOUnBPSFhZM0xQWlRMODB2NmtLSFMvUzBWS3VkZHhNWDZJcm11bHhIdkFn?=
 =?utf-8?Q?b2c1NmOqc0kyDohkff/R+4j9x?=
Content-ID: <1DFD815AD90D424C9426B781D7DE1BF6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d437504f-f9b8-44ab-54ae-08da916ed78e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 07:50:47.4737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlVCiygTvajkoNjLXdGGQrLi5MIdLtqSMX8ge51v2xEgZSKNGwJb4aqo5EUAQLbNXwAb2vwajhsQvp9ZifA6lmSs3Y445k8IZBBmdh4dDnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_005055_447068_721B726D 
X-CRM114-Status: GOOD (  20.01  )
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

On 08/09/2022 08:11, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Sep 07, 2022 at 03:47:09PM -0700, Atish Patra wrote:
>> On Tue, Sep 6, 2022 at 12:45 AM Andrew Jones <ajones@ventanamicro.com>
>> wrote:
>>
>>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>> -               if (!riscv_cbom_block_size) {
>>> -                       riscv_cbom_block_size = val;
>>> +               if (!probed_block_size) {
>>> +                       probed_block_size = val;
>>>                          cbom_hartid = hartid;
>>>                  } else {
>>> -                       if (riscv_cbom_block_size != val)
>>> -                               pr_warn("cbom-block-size mismatched
>>> between harts %d and %lu\n",
>>> +                       if (probed_block_size != val)
>>> +                               pr_warn("cbom-block-size mismatched
>>> between harts %lu and %lu\n",
>>>                                          cbom_hartid, hartid);
>>>
>>
>> Maybe add more info saying the first one will be selected in that case as
>> it is just a warning.
> 
> If we detect a mismatch then should we disable the CMO extension? The
> current spec says "size of a cache block shall be uniform throughout the
> system", even though that may be relaxed in later extensions. I also now
> recall you suggested that when DT parsing ends up with a zero block size
> we should disable the CMO extension. riscv_init_cbom_blocksize() still
> doesn't handle zeros in the DT correctly, even with this patch, though.
> For example, if the first harts parsed are zero, but the latter harts
> all match, we won't even get the mismatch warning.
> 
> But, for now, my preference would be to merge this patch, as it's an
> improvement on its own. I can try to write another patch which handles
> zeros and mismatches by disabling the feature. What do you think?

Given that the clang allmodconfig build is currently broken by this
issue, my preference would be to fix the issue first & follow up work
can sort out extra checks etc.

Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
