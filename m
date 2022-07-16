Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD5AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Msxu72j7WtPR0TdSdY6K5VbC3v7Jkb7Y79gtIK6Di9w=; b=JCcaAvDd3KoAxi
	QCDGxCFraUaj6dZyhEDEJAs1zDRfo3HvpqygwZ0RDeVETB72b4ire2Ea3K2hhHShRBbFjOE0v//mu
	rNKtqPcbykaYRiItcIwr5/bdI2H/Z8vXryn1o6VBaj0T86vnOLnBl9kK/uV9T0PQ/j6CChodWinR1
	mvrMSTzHfrpQpGsu/1g0RFIWEFvBx8bEpGDbv/IOmCtjeGsyB8qKZEM8qmlqfD0p8nr9UVhif5hKr
	fmWTMZcvgTekg74uBbBbUXh8U+g9SB4Z71JCcareLGl0L8emdz33WeSu+CM+jFHaJeYokgBwbX9u+
	s4JKYd4iQJEAdqXu58Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCjcN-00GnzK-EJ; Sat, 16 Jul 2022 15:22:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCjcJ-00GnuC-GJ
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 15:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657984923; x=1689520923;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wCaL2JbHF7/CxwR35tWrdwL5PQ8qkqOcTZbW31EUqVs=;
  b=lqYIkHl0odQqQVBRg8g+Kbo+8N91s7yJxyf/DFPAszuPo3V7ipRVFldS
   n2H2r6gqUAayTNkPCIU5D6deKkMUyGCwT1aTQ3gULXfkmGC0FsLiVePWv
   cbXUEtzBqe9Blj2UqEbtcmeBTh+3OM2kHMDXhqJkZ0te2Fzn6b3gOBdix
   8BUAzCwxB3xGodcpBmm/icFcyDwI9gC0jwxo09MDqE5sWygkwAvR0qmBd
   igE0E6MOm0/kPSPuFIutfKB9FB4KlavzLW65suVULngYOWa8YsXQAKX2j
   Sdr/SlBMTKOfZNkaWQVf7+a3A1CSWgzMS+/wEZLXwAkoLJcSQioSzIP3V
   g==;
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="168147391"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2022 08:21:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 16 Jul 2022 08:21:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 16 Jul 2022 08:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogFVlDRPiqJ0C6xbGIqMPgdU1hFvbxk9YUPPUIZ0Wlk7cZniNl2Fzg+tPYpzauzCbwGJROGu+9Y3BzECpttholSY6k5ZrGDRivG6Pzqsql3wf4J+0jNA72M+DUqoaoTzUNNzNpHcirojjg/6pbQ2o2SIy6Bu10PUHxFKGsuo+m947DeEOII0u9Mfr1dPO22jXgYAIWXFBLRx+k9WWmIatGWRV237H2pzQVS+pK1P9VZpZTdMdMckg9lk6+oxpdGL10n6Q/bPdPB9NNEMofAb3MduvNsGh+VmsC4U4BcCSv0aLUNasYNhnuQ3P2DXlQHx9xeAGaSPXG9uhZ00xe+RDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCaL2JbHF7/CxwR35tWrdwL5PQ8qkqOcTZbW31EUqVs=;
 b=KqIX4sQqIsT1u2+Sg0yBNCmrQuEx1U0TdUnWLeIFrGjWBZV2PUBFXPrtu/GatuM6MQwYLOVaCZSxyRYzYlrY8T3xSMQlJBebQ0I7iskZltgi6F8srrS6kTOFozsFFQHjmEVPj+e5hj77SL9v2mS7bp/2pazmg1pqZbVN42qnswMeNpacl/qOIWYVv5upLrqnDJNtJN7ZWK7Jls7FH273BtSyVeSQRM/oiFPbKMwqNs8+cB7XpWDQnPhH/sM2a5+OjJH/Lik3qVj1Nw4bdxPqqOpiYedepIN9iplixpM0VxLN2Jk7KPuVT08vLYQbbJl2XIq9shWz99fcsMXsOXk/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCaL2JbHF7/CxwR35tWrdwL5PQ8qkqOcTZbW31EUqVs=;
 b=tU8oPhTpPNK8iMZIdSZFLgxIVMZ5WW3UAZ6JPQDc6oaY263Sg8y6+ZKoC5y+Xing/AjQFi+GK+5mH7lPwd3LRYwEmNrJlD4BCu5V4bOi3t5+uq7c/zlrxJZ4spZtYQlq9G0dP1k/tMCg9Exn3GPk/Wu5UgW92i5gww36fzY5Avc=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by BY5PR11MB3960.namprd11.prod.outlook.com (2603:10b6:a03:185::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Sat, 16 Jul
 2022 15:21:48 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5417.026; Sat, 16 Jul 2022
 15:21:48 +0000
From: <Lewis.Hanly@microchip.com>
To: <maz@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
	<palmer@dabbelt.com>, <linux-kernel@vger.kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYmONEe8u9iky0lEWQnR2PO9enTa2AzRoAgABQpQA=
Date: Sat, 16 Jul 2022 15:21:48 +0000
Message-ID: <2d7f72d3e89686d3ba5cff5df8cfe443d04fc5f4.camel@microchip.com>
References: <20220716071113.1646887-1-lewis.hanly@microchip.com>
	 <20220716071113.1646887-2-lewis.hanly@microchip.com>
	 <87r12l4aaj.wl-maz@kernel.org>
In-Reply-To: <87r12l4aaj.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a378170c-53b8-4c76-e284-08da673ee6f7
x-ms-traffictypediagnostic: BY5PR11MB3960:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1490JFRPUr6KSOHK7uxbwQVEUJaj88eRweOQXdpPrBi6BH8OELrNkQHJgsxNm8+TRdb5GoEr3aFMmuQrE0HFjnjWZNE3ZKLpNqoOgxUmwT87+wPJ889//3LlD8QvKw0K9fSEYJzo3xVhxlH8LPjLtGTtTNXpXlvdjThYo/zQR+DNyiFnOBYFod2pAlUFFz5nFy+Sj36MA+bq4i9NBYKwc26ei9pkRSyhaBFBSZ08VDdmFWTXpZEJn/mCC9SOTXarBjJEjwEWfurUinK03byhTtJHCNXtAABtVcj5q0wpPaQQoNGV7AlDqS4nY/a9BDtpQ2qYo+DlDDNKBi2kubBF+uN55FsbGaAZPb7WM7HpA28HxD/+DwwXViLnlCtZw4vHPKlkaa3vDz02lKhr1J90RP1Yw/AJs4AzSnK0LPl60KhQmP8y6pHF2lxuFeRN7hfAzk9i+HQtsf1kzulFuCb8IfYJ7rgANz0DOCtsfNJ1h1xpyTUWTS6zLCBrrRVf+SndaEgx02xRUEL0Bvx0WbB8oZ4dPtqZQVjw5sL7hL57ALAJTujQzxK+DB7pIrcsUMfzKesCdhc44FL+g5cKYoytwQ0BWs+lbDnnsH4lZMosCoZ6KIR+o67MnZwpbXMQa/HFUt7dXto1oakCfUkZPvl/bpr6iOSID9dXlSAQTyy0a5I5WPdSbAqt78kTqwuJbWHOvreAHXkWCgyApwpqoZUwzbyekhx+U1LtoE2PBACl2RqZKzVPD3iiI4lfblRUoII+K7VCGE0CwpZO3OxNCVeQca8D654ovR5QJp8isD7GB6KEVHbW2Tnf0SDmvCjUpbHR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(346002)(376002)(136003)(366004)(396003)(316002)(91956017)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(38070700005)(38100700002)(54906003)(122000001)(6916009)(6512007)(26005)(5660300002)(8936002)(36756003)(2906002)(41300700001)(6506007)(4326008)(83380400001)(8676002)(71200400001)(6486002)(2616005)(478600001)(186003)(107886003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlhrWDZITzhYKzI2YUo4R3lLRUdVRkxGeWNEbUt6UkNraVczaHBWY1RIWVdX?=
 =?utf-8?B?Y3lBbnF4R0xDdVBaSWczK2twLzMyYXk1WGpZTGZ2aVRBU1BXMWYvMkpmOVZ0?=
 =?utf-8?B?WnhnNmNHRUw2V1FzUjBSWHFxNUtPampFK1gzTU4wSHk5Z2o3bEpMQWRTaUFn?=
 =?utf-8?B?RGZuTTZGS1VlRmVuN0JjSU50Nm5acDBCRDcxeVIzVVZySUh2b1M4NW00MFhW?=
 =?utf-8?B?WkNLL0JKUk5EU3A3REVEZm5wZU0zWUFtVjAwL2Q1Y09MMzJ4clF4T3QxbUNW?=
 =?utf-8?B?NU9DYXFSZVIzMGRTSHFib2E1Uk5yNnN6RXBYdDN0SkNuTFVrdy9ZNklDYk85?=
 =?utf-8?B?R1NPYjRtcG1pVnBuSmJtb3JGdnBlOVo0TXVtSkxoL0JScFY3eGQ3d2ZkaHhV?=
 =?utf-8?B?N0h4UFhNa2pJdUdJQmZueDFUNlovZElRVHlqcmdzWndhVXRsWFpPZE9TSmdN?=
 =?utf-8?B?cnJjMWFGRTI0cWMzcWZ3MklqeUJjRDlwTWdOb0FLOXBiSnJKOGg2dzloWFRR?=
 =?utf-8?B?WDRNNzFCSUJ4dDZjTGU2QkRJVENnRHFsc1VwZUV0bDFsb3gxVThRYkRHTFVD?=
 =?utf-8?B?ZEc1Uld1N1BwdnRxR2dIek95YTl2T1hITmZkT3QyS0VZblpPeVFGa0JjZUdZ?=
 =?utf-8?B?MlFDSUxKNmo0WVpWU1VVaXg0T3hBak9FVGo5MUZURGtET3pTUVZRbm85c1Bh?=
 =?utf-8?B?VS9ZeGZuTzk1T2VqOEpjclNqTVZER0hmUmZYa254UG5qb2p4VzZ1ZmxUMjN2?=
 =?utf-8?B?YStBaGtCMHF4WURhQXZEUk1lMlRBdkxvMmplUEhrSTAvcFF3OERaNFRQb0JI?=
 =?utf-8?B?VmNBdERzMTdKVUFmTlREVHZPRE1HeXJlTnFxY2ROeE5wZkpGRGdmLy8yZ1Rx?=
 =?utf-8?B?bTdoV2huTUt2Rms3WEdwV3F1SjIxUFFrUmY5RlFpeUNNdnRmOFA4alZmeFk4?=
 =?utf-8?B?ekwwSFhRSmdSd0xTWEdzSTJ4bzd1SmtHSFdnM3NSbTBYK2FEQzZyMWhjQUdo?=
 =?utf-8?B?MjhsazBmT0FYcGpZbFdqL1Ywd0dDLzN2bUh6RVVvU1hVZFY1MHlzQm11ZEdR?=
 =?utf-8?B?TFU2dkh2UlVxVDd6RkYySTREZjRrdnFQbVhVYmlYdkFNUXBuYmlVOHJZeVNW?=
 =?utf-8?B?d3g4cTNYbmY1OXQyNFBZcmFzSmhYWVQ3TncxdVBnRVpyTmFpaGtUSGNucUJ4?=
 =?utf-8?B?a3FPMzNzeVM2TGhXNHZhdkJIRHpNYmo4QXpURXBXT1lwNUx0d2JWbk5CM3hN?=
 =?utf-8?B?L2p5SDV0VDRFZzlzTVNKR05LeUN6Ym91NmZkY3lKcElrQ3cvdFlqR3M4SVV0?=
 =?utf-8?B?ek1uSVg1SjdDOWlPMzVyd1dHV1d4OURhRmo5NzU4SlVsWXJUK2tROHphVURh?=
 =?utf-8?B?aktCRm1jZ0RQZndjQU1tQytWS0VTaWE3YlkzQ1BCeHRoWFEwdGFOR1JxRGNx?=
 =?utf-8?B?c2UxSWcxaGFHUFZQV09DaTAvRVFRbktjU0VseVUzTDVFcUtSaysrYlNqTmFG?=
 =?utf-8?B?M0lOejl2UHJURGlJd3B1V0VrdHMzMHN1VklEMFJvbGw0MnNvRTUwdnUrYU41?=
 =?utf-8?B?VDNNL3ZNM1B3NnlWZ3JGMEJhSmpiZEdoV0pPdEt6bkNjdmVUWk53ZEI5aEFG?=
 =?utf-8?B?b09uU2poZ2t1R0w1VkRXdHROUmZmakNEMHcvNit0bURmMmNuUEJOUDRCdHNM?=
 =?utf-8?B?YVNNTEo2dDlQaTBidUFiRkhEbU52TzMrNGltVWxMMHBUUW9MeEYxRmVGQjNG?=
 =?utf-8?B?ZTk5d3YzOHZlVmVSMWRpUUR4dGRHTUMrNkZSb1ZWTDdVS3hsaS9MQ0dwZWU1?=
 =?utf-8?B?SWQyVy9NWkprL3JWaGZqbjUwdTBnajhwNXQvMjVWbFdnOFF5UVh0UjBWNTJH?=
 =?utf-8?B?VkxwbjNKV2R1ay9FMlMyL05JdzZvNXNQUFVzWmRxdEFWTU5lajV6SS9kTjdl?=
 =?utf-8?B?c0Znd3M5SHlRR0h4ZEd2UGEyekM1NGJyYjFkRktCeVB6Nmd6ckdRNEpHZHAy?=
 =?utf-8?B?cnFKcVMxdkxJYkc1UlNYSVJtYzRSc3g5dVVYTUhHa2Y2Vlg4OUZ3YUdmZnFi?=
 =?utf-8?B?cFluSUdUTUFlZXZ6NXovSWFUZ2ZzeEZkRndhRXpzNlBJQkw2YUU5ckFXbDA1?=
 =?utf-8?B?MW5UdUtFU2JsMVA5aWNSK0NBc2xzRjRQazh1ZkFFZ2hDUVd2QkYzVDVMdFUz?=
 =?utf-8?B?M2c9PQ==?=
Content-ID: <0359106946BB044FAA32D4DFB17ECA1E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a378170c-53b8-4c76-e284-08da673ee6f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 15:21:48.6359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4J7elq5YoKkfTU/QXMoy0GbZJPwEbuum0CGEpYyIWvmxmGZ2s4Am2112tv/EWqd7e2NmnHpy6HXWj24Yh22w2dDLzCafqthl5uEG1utIdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_082203_660657_857E48AF 
X-CRM114-Status: GOOD (  23.98  )
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

Thanks Marc,

On Sat, 2022-07-16 at 11:33 +0100, Marc Zyngier wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Sat, 16 Jul 2022 08:11:13 +0100,
> <lewis.hanly@microchip.com> wrote:
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> > 
> > Add a driver to support the Polarfire SoC gpio controller.
> > 
> > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> 
> [...]
> 
> > +static int mpfs_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> > +                                        unsigned int child,
> > +                                        unsigned int child_type,
> > +                                        unsigned int *parent,
> > +                                        unsigned int *parent_type)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     struct irq_data *d = irq_get_irq_data(mpfs_gpio-
> > >irq_number[child]);
> 
> This looks totally wrong. It means that you have already instantiated
> part of the hierarchy, and it is likely that you will get multiple
> hierarchy sharing some levels, which isn't intended.

Some background why I use the above.
We need to support both direct and non-direct IRQ connections to the
PLIC. 
In direct mode the GPIO IRQ's are connected directly to the PLIC and
certainly no need for the above. GPIO's can also be configured in non-
direct, which means they use a shared IRQ, hence the above.


> 
> > +     *parent_type = IRQ_TYPE_NONE;
> > +     *parent = irqd_to_hwirq(d);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mpfs_gpio_probe(struct platform_device *pdev)
> > +{
> > +     struct clk *clk;
> > +     struct device *dev = &pdev->dev;
> > +     struct device_node *node = pdev->dev.of_node;
> > +     struct device_node *irq_parent;
> > +     struct gpio_irq_chip *girq;
> > +     struct irq_domain *parent;
> > +     struct mpfs_gpio_chip *mpfs_gpio;
> > +     int i, ret, ngpio;
> > +
> > +     mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio),
> > GFP_KERNEL);
> > +     if (!mpfs_gpio)
> > +             return -ENOMEM;
> > +
> > +     mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(mpfs_gpio->base))
> > +             return dev_err_probe(dev, PTR_ERR(mpfs_gpio->clk),
> > "input clock not found.\n");
> > +
> > +     clk = devm_clk_get(dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return dev_err_probe(dev, PTR_ERR(clk), "devm_clk_get
> > failed\n");
> > +
> > +     ret = clk_prepare_enable(clk);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to enable
> > clock\n");
> > +
> > +     mpfs_gpio->clk = clk;
> > +
> > +     ngpio = of_irq_count(node);
> > +     if (ngpio > NUM_GPIO) {
> > +             ret = -ENXIO;
> > +             goto cleanup_clock;
> > +     }
> > +
> > +     irq_parent = of_irq_find_parent(node);
> > +     if (!irq_parent) {
> > +             ret = -ENODEV;
> > +             goto cleanup_clock;
> > +     }
> > +     parent = irq_find_host(irq_parent);
> > +     if (!parent) {
> > +             ret = -ENODEV;
> > +             goto cleanup_clock;
> > +     }
> > +
> > +     /* Get the interrupt numbers. */
> > +     /* Clear/Disable All interrupts before enabling parent
> > interrupts. */
> > +     for (i = 0; i < ngpio; i++) {
> > +             mpfs_gpio->irq_number[i] = platform_get_irq(pdev, i);
> 
> Bingo. You are allocating the interrupt for the level below. You
> really shouldn't do that.
> 
> If you need to retrieve the *hwirq* for the level below, you need to
> parse the DT without triggering an IRQ allocation (of_irq_parse_one()
> and co).
> 
>         M.
> 
> --
> Without deviation from the norm, progress is not possible.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
