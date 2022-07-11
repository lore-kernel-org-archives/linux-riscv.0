Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB962C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s21gILyt/u0Y6z1L/3GfxWyEpTHucvoh7Y0EoeqEAZU=; b=tGHrabQKJlwUB1
	NnBdphDwGtSnqWRFNKg0ImsjHRJ1T+LbzBQ/lEgTpkAqLTcHXVfw2UOUDPlK6tTbzAfhdYR7xQZnm
	SqNmillvsU7kSR+iPpAGHZ5vtSWy2Jsr9XMD/wsDUMqrMZmqVuCEwPplvZiDwKvF5asZdXF9qNE9k
	929/ctlA+wG35yOZJAypxLnNfMkUnB/mmrorH2iDe43QJqgcmupiEmTWRWu8g/ckEMWANebRNNz92
	HpHE937Qj5SxtJl7euwEmqnJky4dX5LFIHcicoa8ITYjCAK3GWNHn4XtFDebTWS4cwFtfz/1xT9y9
	QkkFz66OYu2GXJ1JD6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApCB-00HON4-8q; Mon, 11 Jul 2022 08:55:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApC6-00HOFd-Nx
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 08:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657529706; x=1689065706;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CClT/EsB/h8xZS50CvVLKZo+xGPYX8aQoL2OTcJIByc=;
  b=VkXs4JNuhmYO7zlEkdlArtK0Oh+tIt+gmXTZhg7mGElwFH3koP0q0a4G
   33IOBL8b015HyCS2BVjiDMQtr8xQwW8qcFCgWUlRkDS+SohXPIobzACHR
   s6FuqLFNaSHzSWbsIZcBwMpodE10yv0KIV/zVu+ea3y0HA2lsRrRpE4Kx
   FbEhTMTvynqJkX75Yf1pDSL+TWyedECeMTZN20yRJtT1VNQ0a9EF5g9Bz
   799z9pY7ODIHlEjqFowWJ+EvhVNojYXP13I/+XJa1F7R0ru/dfjUGrvuq
   NQ2EKQfE7+fJDEiSQ7EhD6saTranOFZBZOfEXScTRaLTShNOHAPUoMiZU
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
   d="scan'208";a="167243521"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jul 2022 01:54:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 01:54:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 11 Jul 2022 01:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixfYUIgLVhesg+Au9BFqv5ySwXiYic2cf7RAmh9jo9v745a/5WEscIzY1aegnElE3Vf/nPMC6D4yVslI+kPlhxBMvSGtVGV/r1UuuhVPI4qO8LlE6asFlLCkKlupjw1h2TaF0N7dwn+IbCSxN2S3bf7TxVVkP9q8rZdW2zjttyS8zXoFUzFzKaRjQFLWVP6r4KHXtXPqusHTlf3I5I/gGZL4Fid9CuTYkI6L53ZtMCI/QYNwWqJPeW42JIBoCbVOXrDAwO91hJmknygKiYOlKbtd0Pt/xeOtLQ6jhjRkwU6vsU/SZL+Y38yvw8T2JJjWHdSNzFZokrtkc0u2Nu7C4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CClT/EsB/h8xZS50CvVLKZo+xGPYX8aQoL2OTcJIByc=;
 b=E3GXO6Gd2KZkqTyCyPrtK/UyD0bILVj8HFeUWfyWKZ3piUpUt9aL47MOSX5xsMrCFx+IXIa1e1iMgrJ16kw1Zes/1ZbStGT+UOHYLe7edyjYu2/WB591D0WXQCDW6WBlhZb9l3HuyhFFSjDLTImlkMH+vCaWsUeB54E52tiMxDa/OgUAW/rXTD3/HIIR8/1xl7HECK3Xy99Ezz9m6cGTI9dZLgM+HMlnk8FVdKJdm5g4fJDZ0EYh5kW6y9GoDeg0pW8gRfE08kJmpoZxNLRIZlsJNvD86xnA9yVuWJEbSZyMzoynNnXDu7Mx1OWcUAui+O4/PdgMGLiZyihLL7z06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CClT/EsB/h8xZS50CvVLKZo+xGPYX8aQoL2OTcJIByc=;
 b=J58epty3WF08eCJ5BcJEUbJEujhN2PkBX4vcIWVr6lpumq6EkfNVSu4qTXwSd+FUVr8d5Q/+ckMbw0vuLsY4qhWMZGjBj0c2YJDMwW13Tu69Xf/Q5zTSxg6n6r+jKGDVMBErJSVKKTmyH3njFYOIyqULzBtdQS9wFu9Kp1gU6CE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Mon, 11 Jul
 2022 08:54:57 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 08:54:57 +0000
From: <Conor.Dooley@microchip.com>
To: <kernel@esmil.dk>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>
Subject: Re: [RFC 2/2] riscv: dts: starfive: add the missing monitor core
Thread-Topic: [RFC 2/2] riscv: dts: starfive: add the missing monitor core
Thread-Index: AQHYlE4nF/qAlBokZ06lONo/E9SkSK143jqAgAAA/gA=
Date: Mon, 11 Jul 2022 08:54:57 +0000
Message-ID: <310fe6ed-0193-a599-2f56-584aef292bb3@microchip.com>
References: <20220710111330.3920699-1-mail@conchuod.ie>
 <20220710111330.3920699-3-mail@conchuod.ie>
 <CANBLGcyK9wjdgVm-pXzUDU5JNzatAjjf1Y28+dG_C7WPwqrwGQ@mail.gmail.com>
In-Reply-To: <CANBLGcyK9wjdgVm-pXzUDU5JNzatAjjf1Y28+dG_C7WPwqrwGQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35d2cfb1-6f8a-4b11-a126-08da631b07d9
x-ms-traffictypediagnostic: MW3PR11MB4715:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mgH23MGmPxRgc0yynLnsrEjPKohS7CJ1ok3lsEq5/kZfM7JpBQYJaab1DWBZdkHfOovznX/8c9T9kRaOSGa6+rKthrCNy5UgTaU2QbHUnjiJSf6R47WQfw4d1Fs3caO7GtRdTx0IeinYgbKAzgKlxVVF6LobeAIR3k+GJe3QwyFwyPSgfwIgHASLBz9A/RKl2Ql6SwfuahQ4GQPB7gUcLljYzMB0fE0HPTQxAqiaLerHfm9HWsHm8lMEHtsg4+nZIGjY47i1txBPiHheQyxzhmbhRCnv8LqB+i3WGLkKWQ3XJLeXoFF9fMqpLF1M7K+mh/i73GQFzXWc90tXOkUDF8M/iWqCD60aR71thMnuitNAFyL7GtofVUTr2qR79xdCdzV/ya3xIf8YiT1coiH6rZLBj4BQP05TdQWA6ib7Lk4lVX2L3yi7krJkeYgijKOrWwFiRsQEQVtZpk206fo5/azujq33DbimtmBZ6IkLD4GqmE2Q4O3j7u3bc3gK7iFYGhB0GUBH+mEk2AMYStiwAD/F7qkRsaEFcPK9+NhufvkhAqmehl6xsqKm14isyx1AwRLt1teM5usKRR9u1JU1A06P5e0ZUXDW3cBeb6rF8LwOVffGBKHJHgmixbT94LXxg3MP7p/Yumll3P8Gsclv8kFaljKcU4V9N/VTlu1ZaTT9SiUhoDjRgyD1P7cKWcunHf4/rT1ik1t3FjzIjGFNCMsfJMlXRjx9iv3vrllbCvdRNCL1Kpk30hANJnxJ3igvvKDbu+FaHLG38j4caW2XpIemL2Q0X4cRIAhMTifVouv0Yt9o4UjIzV5aOcdXGn0sN0Z+UuwtwqkeHtdrTyJStEFQnfV/rJhvv+rTVqeyiidn9XiyUpWXzOXNse7Y6wT9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(346002)(136003)(31696002)(6506007)(86362001)(8936002)(76116006)(64756008)(2906002)(41300700001)(478600001)(6512007)(26005)(6486002)(5660300002)(53546011)(38070700005)(38100700002)(107886003)(186003)(91956017)(6916009)(122000001)(316002)(66946007)(31686004)(66556008)(66476007)(66446008)(8676002)(4326008)(54906003)(36756003)(83380400001)(71200400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUtUa3VCcFBycUJFblI5MDd5ZGpXYmtHZUl1YXk5Vmg2b2JxbTQ3RUZaK0NX?=
 =?utf-8?B?bnJaRDlUMFgvV0NUa0UxYmswSkxWcE05VWl6Qjk1S3VYaW9NNTg2bU5NT200?=
 =?utf-8?B?RFFOSUNsamZUdXhhSmhNODdZWjQrTjNJU2l4UEVDWEJhbjRkUEhBQitvYTFZ?=
 =?utf-8?B?UW0wbkZiN2pKQ3locUszMlVtOUtWanlzbi85MmN2OXllVXFEeDRqdDR0T2Zu?=
 =?utf-8?B?VkR1Y1QzU1RGZHMwTktIay9meStKWTNKUjlWQURkdVdSQXRzdXhidUNraGN5?=
 =?utf-8?B?bmxPcmZGWXd5VFFQbXU0ZGprSmlGTGh5ODhiVTdDZTNwdUFJaUIrak82NGoz?=
 =?utf-8?B?Mm5LZnZnZTJRNVFiNkNNeUFoQVpUZEpqS2NxbDJHUVpaWWtNdDdiNTRuSGo3?=
 =?utf-8?B?UXlvdFNIUlBpYi9iVVFEallUeHR5cHJ0ckdOVGlNdHp1VUVFL2cxSytOdzVX?=
 =?utf-8?B?cmliZm5RK2RyN1JzUUpTbk9FdHVEclBFbU4rSHduQTYveUlpNlM2WWc4RFVr?=
 =?utf-8?B?aW8wSEt1YjZUcVhjWGVnVVF6MHBJQ0JoU1hiWmxpbHFBczhQTk0vS1lnemta?=
 =?utf-8?B?YVNRN05YakZnUTFMeHNWS2lEcXYweGFzSjAxdUZQcEJUT0lIMGlrckxsTDk2?=
 =?utf-8?B?Vy9yUlQyd0tCVHFZSVBVS3dSUi94MlFaSDNBdVRMcXVZUk1hYkNNSjFiRnB1?=
 =?utf-8?B?YXZsQkZ5ZWJKYU1iTTVocVJvQjBITU9CWi83SkpRcFUyODJMempCSzlEVFha?=
 =?utf-8?B?ZjJOeC9EeW5mUEhycEhJay9WRXdEaVVOQ1kzWDV0OWoxWEdaVFlXOVNzZmVi?=
 =?utf-8?B?cDJ5SXV2amsyS0JQWEs1bVBvT2FWMkhNb1FXTmgzR25pLzFHQ1phcjh1Tjhs?=
 =?utf-8?B?SmZpc3NuZnMyR3MvTFFuVi8yOWVXdXgzNFJ1QUNZZHRkT1Z4VkhJQUszNnhj?=
 =?utf-8?B?V1RuSktYWjlZRzBoTXhhTGZUbmxYQk5jYUlFT2czSjU2TmdJRVNDZWdxbXlP?=
 =?utf-8?B?T2NMUUw5cEVhNFVDK2p5LzF5cTBBQ2d2NEpCUVArQ05iY2hCaUlrZFlSaWk2?=
 =?utf-8?B?eE51UXpGMTBxempqbE1yeE16T2FtQjdnbEtla3l4MnpLREpIalMrYWJBZEVV?=
 =?utf-8?B?K012WGp0MENtN0NiWDRQZjdZRVVhRXMrVFh6MmlGYkE2OEdBcTF5MUFrd2ND?=
 =?utf-8?B?T1hDcUptMWJQMjlJNmlsZS9PeTFMSFBzeXRZaHlMZ1hpYUZJWWFsWXR1YjVG?=
 =?utf-8?B?YnQ4TG1CTHpaTStvdnczQkZEeTR6QlB0aXNzbHZSUU02b0RVZENvM3hOcldC?=
 =?utf-8?B?SmNsNnJ6ZVMxeVhJcHQwR282Y1NtUS9rNmlkUzNKU3NlOWhsRW1LYzdMSWdI?=
 =?utf-8?B?b1B3ZU9uMXNCTEtUcHNlOWpBV0N2ZGdDOU5OZGJzM25HOXVFaEs2cGpmKzdt?=
 =?utf-8?B?Tk0yeEwrNHExa0V5NVdLempLd29ISXVYSE9zNHNWMEQxaTd3TWZ6NGxrWkR4?=
 =?utf-8?B?Y2hsNi8wWWpNRElKMG9Nd05QY2wxZ0dhOTc2NW5OOWRJbTdlOFlEdnF5UzhE?=
 =?utf-8?B?cnRES0FpaXVLWnk5MzdBWVh0M3ZIMEg0WTErU3pOMlFSeWJpWDVFRFBTWWN0?=
 =?utf-8?B?SjdTZW9hUlBrRDBCSVVId0JndmdsTytJbklRTDJTNkZoVVpRbEtDVUJzTkQ5?=
 =?utf-8?B?Q2xWckdmUkx6RHM0dS9tbXd2eFFlRlhQZkZ2MDFaU1Q3MlVnSGNlcWNIaUpx?=
 =?utf-8?B?WFZYblN2RVlrRUZGcmxYSzBKL1ZCeTZTU3QzVW1CNFZJcDFpZXcreXAwY0RT?=
 =?utf-8?B?MWp6R2IzZDRleVRTbnFNZmtZZHhzV0hCTGRXZUd3dEZhdGhXTlQxbUZac2k4?=
 =?utf-8?B?YXVjbDBCdlEyZm9hTnRrYjJTTDc0NXk5UHRXcTZXcEtvSmNrQ3hCQXB2TmlF?=
 =?utf-8?B?N2RjMzBMd3RvbkdpTk9DTGQxY05OT29ocG9BMWNYZW1jOWNJSlgzNWVzNElP?=
 =?utf-8?B?dW9iWklyMWVDaVRodEVFTFl5TDk2SWxKZHovQ2daSkgvKzNQci9VOHpnSk56?=
 =?utf-8?B?WjB4aGxEU3JTMW5SQ0NWQ2dxN085Y0VIbFBTamhwOTVQK0E4V3BNc214M0Uv?=
 =?utf-8?Q?M0VoqZ7m2+OhlH+WUWLrqLkaV?=
Content-ID: <4420164D85980E459060C91EC72CBCF8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d2cfb1-6f8a-4b11-a126-08da631b07d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 08:54:57.3003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTdH9OUSDiHBKFfW4tQ9bLPhtzHd76cVFK5LKz4r6RWPdguFHyJ007m2+ejwd2l8ZFiYYm1WiGb6Laoe8mq/x1usbLz/VD9FjpEFqs0cVKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_015506_885399_E9A03A83 
X-CRM114-Status: GOOD (  15.40  )
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

On 11/07/2022 09:51, Emil Renner Berthing wrote:
> On Sun, 10 Jul 2022 at 13:13, Conor Dooley <mail@conchuod.ie> wrote:
>>
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The JH7100 has a 32 bit monitor core that is missing from the device
>> tree. Add it (and its cpu-map entry) to more accurately reflect the
>> actual topology of the SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   arch/riscv/boot/dts/starfive/jh7100.dtsi | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> index c617a61e26e2..840875fcb633 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> @@ -67,6 +67,22 @@ cpu1_intc: interrupt-controller {
>>                          };
>>                  };
>>
>> +               E24: cpu@2 {
>> +                       compatible = "sifive,e24", "riscv";
>> +                       device_type = "cpu";
>> +                       i-cache-block-size = <32>;
>> +                       i-cache-sets = <256>;
>> +                       i-cache-size = <16384>;
>> +                       reg = <0x2>;
>> +                       riscv,isa = "rv32imafc";
>> +                       status = "disabled";
>> +                       cpu2_intc: interrupt-controller {
>> +                               #interrupt-cells = <1>;
>> +                               compatible = "riscv,cpu-intc";
>> +                               interrupt-controller;
>> +                       };
>> +               };
> 
> Maybe you could make this look a bit more like the nodes above

Sure. I'll send a proper patch to all the lists etc later with
the order fixed.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
