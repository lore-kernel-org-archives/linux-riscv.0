Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62283C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 16:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMsKCXy7VYO06Qhe6wv5u/Ba4zLcE+vKc6xwUkSJ8XY=; b=VnaQ1/W9DLLtGH
	HPf0Zsrpn4OzLusLHY9GxA7lHlw6E0Z3XWZRPh/oId8i63BIsgev3Jn1NuOGcFI/ROYLiEzqU45Sm
	UhHTiVCcq8Ou+xpezKBgm5HEowLgiZc9sSEAh7a+susLNwfMsfw+5ovIPNwtMigdLOIHvfEkLIVSU
	tm2vTxRfGkK1TvwNL0rWNck6JTa/Px/CCMSPWBn5C3Zcyt2Wg32bha7qye5fwSuIzEL4TA376RcBq
	Z4CqoreiEcpiALVKxjBAvXwsyLR6HviW5vvKmj2yGi0VTxdgTOG8w3pBB8SmH7VtOaI9Hap5LPcuY
	ZryoTcfpVRXmonsuLIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Ogo-009ucU-VS; Mon, 04 Jul 2022 16:12:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Ogk-009uaG-DC
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 16:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656951163; x=1688487163;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ninbEw12HUSaj4cjHe+R7+l16ojjRHwWBaLplSmhPQI=;
  b=suqifd2xeCLkuMsf6mRgTACELidV5NMr9Z0Bj6mKOKLPa2GkzNxfuFXa
   9vcBrrG3YA+YBj6aDoKRs5KGIeD9gIl6+q3fImOK61sw+mXESTF0B7KM/
   pQd2zZM5MIQcDENxuyMpHDvrKX6ZGJRdotFLQADHULpa01wRzjl0J5ouy
   CX4L2v9tIYM1RnXUWh4RjATbb9Pr0Pr6iPvrv0Z7ke1BtWRzpDgfcOiWt
   i0t5cdC04mGE8QX7M5ohe1tiokp2ylRN88IUaeYBp+kuWBI3EKpYQ8zPz
   t7aw//0EygriS0rsunrxf1/HbEnlPy/HlSwHJ5Mgpo24a47wq7nb7crqw
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="163237478"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 09:12:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 09:12:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 4 Jul 2022 09:12:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLMQk/j1rVVmTSKFh+4BtU2ae9BbFW2cbWW/0RG2fGpdE7Mu8iHuf3qxJLyz/aDf9t4ilhUUzeEwFDJyv9MzrwWWj2zRx3Ju01UoIfYZirUt8C/aVup/oaB9/dcJGcYmXtTi+qozMgV5Urlm1nCM/TEbZ4D7EHgMwYL5y9izKB8n7hiOjcUP1bFGLRgKy7iiM51RkYEA8quc3zv5VlEkn1+jdnzc/XW4ig80Bb8drzwAjrytIBwHPcY/pCoAx8p3nY8/v5hajkemdj8lZli2Rrw0qVJHn78FwmzU79Gsoq5t+IiZyL855B9BnQNn3Hf+GMIMANjODLzwPqcm8v3EhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ninbEw12HUSaj4cjHe+R7+l16ojjRHwWBaLplSmhPQI=;
 b=CjqFaQJ497drMBb/gbobdXWSFjSryDhDvm4mhzfEkGnU7Z0Lk0Y0DTTxhodjAIF631J3gsBGIEuD0WgdVwcQngy5ohOZTF9WaL99UG0Q58HN85GMXNQeH7suooy1y8ePnvNGH4FMwRq7R1tnC7ffDQZcX+WkHSBm8kJ3H7Slu1XoNQfP1BaZKeIzeZj52WfpRNubUb+SjV2BbUVNLZYEo8WQ/wlA14qZ5im/MYc4Rfn2qfW+TmVUXWfJSbxYU5uFljeQoa3rKXTdAeO05Hq4gxEOCpowgUKrenybpUydXFPew4idXNZSE5Z5A+8RJgelaGRXFq6ZIvKqeeFCu8FbRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ninbEw12HUSaj4cjHe+R7+l16ojjRHwWBaLplSmhPQI=;
 b=lYZRNBZQNshcwJdm423on37nGIJN8uPuijbTOv0suxriNDZyW+tHg+2SlU7SVpIvRAk/SDpbebbKd53CfvZrVs6D25Yh+YMl9qgRELsPfIg+K73dsEChDY12SpKDgeFH0EbQ/H5FTLNcM/NuLevZsg/8vofBY+bW57WbrTJ4ayk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 16:12:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 16:12:23 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <palmer@rivosinc.com>
CC: <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-riscv@lists.infradead.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski@linaro.org>, <paul.walmsley@sifive.com>,
	<devicetree@vger.kernel.org>, <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] riscv: dts: align gpio-key node names with dtschema
Thread-Topic: [PATCH] riscv: dts: align gpio-key node names with dtschema
Thread-Index: AQHYh+0TSEsUfCu3dUCW8EahvV7Amq1ucdaA
Date: Mon, 4 Jul 2022 16:12:23 +0000
Message-ID: <f10994df-5cf3-98d0-fc6a-b8f10414974e@microchip.com>
References: <20220624170811.66395-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624170811.66395-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb35de7d-5d82-4a3d-6c3b-08da5dd7fb1d
x-ms-traffictypediagnostic: MN0PR11MB5962:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Djoxj5TfnN3LT1LKbFMu7NNovn6NpS4ul98F3gsCskxm2G1hDxPtjGLTzVoRUX0GYVDlUwo/4JvTJnhNVJkBz0p4VWwJh0xAfLhykslsb2yRShXZJ3Ivwc3MQGzwZpXAMAHhNcaoU9/7pliL4ZKj9JNK3tNWGzs0rYP6MroZLox0LgAPGa9B+lEa1gxHhRUY+ZFoPvZIqhgLANYeuwJ968dDYlP2U0F8oCoYjg9gw6dHIqdFKQH/qkTd1xr42JY1ETAumIFwqxE0X4tw/Hc6au4jXjakGPl8hqydMGcy882sC/c0SlO022y3oxc/shxkD04wOtVPApTvuUGwBLc6blHRwaN0YJY9nzFQ536VbwAfaIktgOq1lbxgVaN9rC1+HjZ2WcyodW99l0tGC2PwN+H+ydITtrq+WgcHWUCBYxmwI4Y5g9gvTA4X8SyzD2UOd3bwc0AODZoETjNCTvUMQ8rTYj2AQqR+S6RzkYwli894IjeoKX1BMtumXgvREAI0D6zlrGT8vjISVbNohSAYQSs/i65EOCT58PRJ9xEpb7hGepH0DFwa8SifJjPgqmoP9y/pt2oUY5H5cg69ddKjQjF0gMU6Y3BL+6ZGrr7EaiJ09NcDu2u8qEYhMqFS2hi1HxyTb06ZN3P1JRFClJWj0OJcp0L0ZNMYI64j/BKpE5eJ/RWUcdh/xmhecNkOhR3p/vu508tj8wQu2zKmFee5u34nAGoSELypRRAAzg7kdVBkRR60A/uX1pTjsgGFB0D+pZMQKrZUhTG678paoPMGHW1F++lLe4DRH0IjpT75UEpJJrNjZHK2h8fl+N4CGg+EeBEKq79V2jBXhZxtFEsOliER5e+ZE7sgR0h8AqB5DONZX3O2Qy+okiQYjWkMC46XyVUseeAyB6wFABZBiLZ3YnBx2CDcMuG6j7dnh43x+nOedf12kWCpIo9qzTogap89
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(376002)(136003)(396003)(6512007)(26005)(6506007)(86362001)(2616005)(122000001)(966005)(53546011)(66556008)(8936002)(7416002)(5660300002)(41300700001)(478600001)(6486002)(8676002)(38070700005)(64756008)(186003)(83380400001)(31696002)(38100700002)(31686004)(91956017)(36756003)(66446008)(71200400001)(110136005)(316002)(66476007)(4326008)(76116006)(2906002)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VThOS3pkQ1lZS0JOTFp6T2dKOUFGeXpQMDJsY2c2WFVqaHZsa2xLY2JEV3Fm?=
 =?utf-8?B?OGhJUWtvbzhQTTFkWTRQTzBqK2I1Vi93ZUwvaXFaYmRXT3JzdFRYUThzMytH?=
 =?utf-8?B?RXhhQ1JyOHBObFZRbTdKQzgvSSsvK21yVWNNbGRVY3NEZzdsMysrQ1JPczNy?=
 =?utf-8?B?QXBvNWtmbDNWNlVGbzhOY2ozLzJpUU1kL2Jnb3loNnNwY3ZJZ0htelZMTWdO?=
 =?utf-8?B?ZjJSZlFuMVczSTMxd29rRHVLdEJEeFFka2w2TTBHUnNtcmkrK3JsRHIzdXhF?=
 =?utf-8?B?cEVUWXNpUVFLL2FvRWdKaGEvRWFWU2VsK1pGN0hqd0paN1hRU3JrTDdNN1do?=
 =?utf-8?B?dGVUdkY4aFVieUFXdEJRWnVJelJYeVpES2pUSGlXRTJtQk43M0hwOHZkd3NI?=
 =?utf-8?B?UEtDcDhSMmtRbjA2dnJlYXZVQW91dTFhNHdYVDhsNmdQK1VFcmdPU3dPYXRM?=
 =?utf-8?B?NmZYWitNYlNVR1hFblU0cWswMzlyMk9HNndqRXFRWnFqMVFnTTBMVDlCUDla?=
 =?utf-8?B?Z0dqTXV2UDhKa2ZtMldpTHg3QTg0ZjFqMWcwdnVxWXp0QStwL0hRNG5xTDBR?=
 =?utf-8?B?RWY0OFdQamlmTHIza01yUFAvL3dGZENDWTZUVnFXdE1xcC9EVTdUbUVzN0k1?=
 =?utf-8?B?UVlzSXQvbGpYbldHRFFhS1o4TjNkOVRnaGpwU09vcmcyNWRwbHNpa2xOVUFs?=
 =?utf-8?B?RG9JdFFnNnZrUHBrS0NwNDFOVkhyamdFOWxxZ0t3TWJKRzlXVGIxR0V2cXVT?=
 =?utf-8?B?UVFwL2JvaWNXL0Z6cUlsTFpucXIvUkl6TUFxYzIzSVJScWc3Q3ZkSlh3SWFp?=
 =?utf-8?B?NWM1YlJ1b2R6eGhBQlJGalpPVS81WWMvbTFWdjJGejdOMFdjcm5KbWlheGcx?=
 =?utf-8?B?NmdaVWpqbG5LemN0S2FUZzVmdnJSRDlpUEM5Uy9sUGJMN0RKaVF5OEhGUDJG?=
 =?utf-8?B?UXJuaUtLeERUSXlISWtLVmdSRGR5Q3NlOXh4d0pYV3A4dW5NUDk4Mk5kanZK?=
 =?utf-8?B?UUpFYjhYdlFYREFYV0NmQkJvT1NNUVNFN1BVTVVSNW4vaGJmS2tRcVpEejMv?=
 =?utf-8?B?czlQdVUwV1ZNbDdzU3NvSGJNb2p1OTA3dTdPZXF0Y2pVL3RqeHVxTFVZWkR6?=
 =?utf-8?B?bktGd2FzNlcyNmh0ZmZrSVdnRStCRFlrUUlGcVp2aHlTZ2lSQisweWdHalBW?=
 =?utf-8?B?VzY1V3FCMk5UdUF2WHBETWlkWkxsTFlpM0JEZ3BCb0VPeFJUaVNrVi9tZ2gy?=
 =?utf-8?B?S215bnlXSTZUS3ZtZmc1eDlZUHNuT0F1dHFSQkhhOW9GUUMwVVZmZCtWYTJI?=
 =?utf-8?B?Si9UZ21aSlo1T3hXMmdPdXpBczZSUUdlVzVLbWc0bFk5RTZIMmJaR0x2aEps?=
 =?utf-8?B?UFhEUzBybzhMUlJHRmY5Vm5OeWJqUGt5M0F1MHJsVVNVRVg1amkzZ0pYRVRH?=
 =?utf-8?B?dDhTcmJtNm9xcG8rRkI2T0trRW1DSlMxN25FTGQ2Y0Y0SXBwWFAxdkowZnV2?=
 =?utf-8?B?cmE1bEZuS3FjL3dNQjhOUHRKNjZqM2FhdzBhTFVFOFBJaHlXYnpCNGRGWS9n?=
 =?utf-8?B?c1ZVTlo4dlRIUnU2WWVrb3U0Mm1ydEE2OFpteGdqUHAwR1cwTEJndS9nVzJY?=
 =?utf-8?B?QXBiSEQ2UUNHSEF4VnhvZFppVmxXVDlSTEtzd2dqNkx5ZjdUbndSNi9HVUdr?=
 =?utf-8?B?VTFHbjdxbE91c0daS2NzenVCOWNyRzkyZ25ZNkJ1WXhJRHgybERBcVpYbWFT?=
 =?utf-8?B?eFp5d3lrYnZnREtKYUhtcEQ1QmxyMkJySXFTbTkzcENRdjRMc29UcHN3ak0v?=
 =?utf-8?B?THM4TmFhcWZic3Jjb3J6enJ3cWpEWlJXK05iQkNtMzB5ZzIvcFhxZUw3NjZL?=
 =?utf-8?B?RGpTNllCSXVwRlg0b0lVck4rRnA1bG1BWjZUWWVEYzNjS0hsaGtxdnVXS1h3?=
 =?utf-8?B?NlY4Q2RYcGZMMXIvQ3hnS1M4dlJ4ano5SUJ3bTRjbWhvRGpLZ1ZrOW1wZkZT?=
 =?utf-8?B?akdjNzBXdGloSU1JVkk3cGR3QTlHSzhvYU1Wc2lLS1VKNzZTdUhyOEZwSXVD?=
 =?utf-8?B?SnRVV2FOcE45K2xXRjl4Q2tkRG8vZHlweEllVnR3SFl6dit2b2dMWXpmdnEv?=
 =?utf-8?Q?sfqUTmczqojnF+W9kjH0uxh8w?=
Content-ID: <F3306FE34C65AB4BA68C2A30E1BE372B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb35de7d-5d82-4a3d-6c3b-08da5dd7fb1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 16:12:23.8551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fl5usxO3dFKHPJW6nTZy9DFwlGvOtan1O3u5w9OpHbbQj7yHEov+WOnJVtWYKAjp7vZ2IXNOrqdabAgeGQZRhWgOVfe86sLAtZ1vsorZ3NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_091242_837963_2BEEF0C7 
X-CRM114-Status: GOOD (  15.50  )
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

Hey Palmer,
Not my patch to bump, but since I was bumping other DTS related patches,
felt it made sense to bump this patch too.
Thanks,
Conor.

On 24/06/2022 18:08, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> See: https://lore.kernel.org/all/20220616005224.18391-1-krzysztof.kozlowski@linaro.org/
> ---
>  arch/riscv/boot/dts/canaan/canaan_kd233.dts     | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 6 +++---
>  arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> index 039b92abf046..f72540bd14a3 100644
> --- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> +++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> @@ -35,7 +35,7 @@ led1 {
>         gpio-keys {
>                 compatible = "gpio-keys";
> 
> -               key0 {
> +               key {
>                         label = "KEY0";
>                         linux,code = <BTN_0>;
>                         gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> index b9e30df127fe..8abdbe26a1d0 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> @@ -47,7 +47,7 @@ led2 {
>         gpio-keys {
>                 compatible = "gpio-keys";
> 
> -               boot {
> +               key-boot {
>                         label = "BOOT";
>                         linux,code = <BTN_0>;
>                         gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> index 8d23401b0bbb..3c6df1ecf76f 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> @@ -52,7 +52,7 @@ led2 {
>         gpio-keys {
>                 compatible = "gpio-keys";
> 
> -               boot {
> +               key-boot {
>                         label = "BOOT";
>                         linux,code = <BTN_0>;
>                         gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> index 24fd83b43d9d..03c9843d503e 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> @@ -46,19 +46,19 @@ led2 {
>         gpio-keys {
>                 compatible = "gpio-keys";
> 
> -               up {
> +               key-up {
>                         label = "UP";
>                         linux,code = <BTN_1>;
>                         gpios = <&gpio1_0 7 GPIO_ACTIVE_LOW>;
>                 };
> 
> -               press {
> +               key-press {
>                         label = "PRESS";
>                         linux,code = <BTN_0>;
>                         gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
>                 };
> 
> -               down {
> +               key-down {
>                         label = "DOWN";
>                         linux,code = <BTN_2>;
>                         gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> index 25341f38292a..7164ad063178 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> @@ -23,7 +23,7 @@ chosen {
>         gpio-keys {
>                 compatible = "gpio-keys";
> 
> -               boot {
> +               key-boot {
>                         label = "BOOT";
>                         linux,code = <BTN_0>;
>                         gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> --
> 2.34.1
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
