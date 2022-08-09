Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55910C19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 23:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0wbf/QWvJ+xsqTxRNPCQrqmsYm4gWWlsRq476Q3dxw=; b=zgs5I6mzcG+UGU
	2LGsJdjyTwekADV8b0iZgBlaWpDOBaaGv2apk6yOLPqCBClJqor6g6RyhY97tBs7D+YRjgJu8v03c
	G7DsFUAq4sOo8Sx64vIj5omkcNwaGLHezV25Nj1EfksJFQy3kPZEZCoLfo+uCjwGPar8N4PNB/Ney
	6sbYu1paYU2sLkFERuXgbCysI+QxfS8a54XsNlyKX6CSjQoh7qKTQSwhSIXzbfJQXtmLdDd9RS8+f
	JUeFkVMYbOSKX8irMYmnq3vd3ENJ+OPxJvJcqtJU3mYCiCCn1bTHFk5ZrD3GyxyiXa8GjdSTC5Kst
	MaP2MECKFF5KbNf0wmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLYIP-007EIF-AZ; Tue, 09 Aug 2022 23:05:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLYIE-007E9z-OJ
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 23:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660086346; x=1691622346;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yQyg0KFxf+7334XyLs4bya45KPJ+B01o9xQYzlgJTz4=;
  b=D/4U0kfwK5k7JzeF+OYJKH3DNM6Xh5Hlffz2eAYl0+5rj8vc1fC65ghu
   GlFID623ge6yVHlpZB50EYUKpVKo8blE9dcfjhTrf1wo14LIVqxJIEysk
   4h3V4W6M3O4kVFx7A+K5dCdp1KJE2ZNhMKT/g3dSLPAaGCcbiNYtklmDG
   uE3useD1Hiaa4m75JprMmSdkOlizgQuLVWxHiikvvcXaQMwDHZ5C6wJMM
   WSWXs5TqeBDZesq9qQfLS+79/Q6MW+tojKuNGpnptErR7R7dSEgx9u19c
   ycuKLAXCWY6z5IsAA24QNxQYO7vWMDFkKud7jtko9FjA8Ch8U6RXtiAEA
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="185816293"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2022 16:05:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 16:05:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 9 Aug 2022 16:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bo0qD6OUXuaiB3bgdgITlRUxU/jX5NpVUyO5tMUwvs/Mnykizm1rMCS0uSHZdhoN9pXsT7tinMBXUvus5yWUFrREbeqNG3KjUR5bPeFOA3eKzVzIBpA4VQJtT7iD5Vji8L7d+HAnzljC0K0k+77wlQ6fE043SA6/YCn5KOClhQOhz/ujvc4AppQTlCZDCIALsMIMp/9Yce57gviqcaTB6Ufb+dz6MM/XfHGNMOltlUzA8LdzTmWmhbpHIDw6BTTT0wpOToX7LZBgYkTBl4QJyIEHzp3jWCVamBCfZXQLzblZt0Q6TafeECa3MiiL93kcUO5+7x2GzJCoh6IA/rkrCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQyg0KFxf+7334XyLs4bya45KPJ+B01o9xQYzlgJTz4=;
 b=Z1pR3JYAsiZUCx2rpPdNab/02kJz/uEUEkPkg68akDskViWsMoNCSu92fgX7FL/nKMW5eaA8OYYjI9ZYU48IfgR1ZAExIG14nI9nMFHPTp0dGr9SJx5I9x6UFRgc/oWeSwhuaE/Y3lpTyydqOkzh9TUEek4XMKZNMbbPVR5ROtFhqypgRIk0JeZ7tlcMkys/5qEQfwqUHJQHr/S6HtLMXxUmZVYO/zHAuBOQf2uC5e+bMl+5bnOrYIrhmD/PjdDLJ/ZRaNqqa0RsOKUmqEzJoTTGjiHfZvuGD0uRNX751MxqLQbfmSfpm5l9uuEHGpI+f6hpYbDnGMhpylPGRs7DJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQyg0KFxf+7334XyLs4bya45KPJ+B01o9xQYzlgJTz4=;
 b=ZM4/OvUyKcznis1p6QZ+X3YmSSc8+5ZWG1aMkel7QxRiCRZJTDgnKFkvgkf+jTRp5QNeL29WJUrden5PXqy9kj9rPpL84Xl5oj05YDjvAcfCUEpNEn91x7y1wzJctmVMrwan5mtPGV1X0KH84zhVQH9q0vlcGCFTJ8bIHOy/s40=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2895.namprd11.prod.outlook.com (2603:10b6:805:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 23:05:32 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 23:05:32 +0000
From: <Conor.Dooley@microchip.com>
To: <nathan@kernel.org>, <ndesaulniers@google.com>, <llvm@lists.linux.dev>
CC: <mturquette@baylibre.com>, <Conor.Dooley@microchip.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Daire.McNamara@microchip.com>, <palmer@dabbelt.com>
Subject: Re: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Topic: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Index: AQHYj5/vIrxOVV1EL0SoHOsgiQHkyK2nacwA
Date: Tue, 9 Aug 2022 23:05:32 +0000
Message-ID: <bd14f1a2-750d-2511-df0a-85a9f5925f84@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
In-Reply-To: <20220704121558.2088698-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fba6742-dfa7-413d-25af-08da7a5ba923
x-ms-traffictypediagnostic: SN6PR11MB2895:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d7VdJHmOk26nlrnP+SgVFmHUMBR+klmXKPRuaplcI4M10P8GzZq5Sf3EFpJ3ip+9kbqxzG21yozMU7NYP3l239CWsuB4o+qh0aquUABuVHSTmA/5nN09pDBKDzOaWfL0O9kwTy5+1ZWOvUxcD1NUVfX8lVRfyVT6YW2ztL3N5/1BGz3O2t5bVc93Bh44NvGq7/P9uNMgFjRuWzVjtG0e+ke94sOZ9nwD84//IZGg0lIynaWz6Ste2fuwMruvuP7DrjR9uV0mwJfTeQ101tnbyOHH5KbsYg1w2GKBBVKruaSsmeVQuAuytC8XLCtCnvsJXOs1vOn0bjNto7oEf5jhYVyLUtZFXdYOeJJCIeAVtLDnWtHYZHa4+01F88TTPkEeIw0zJIlBA6IZwG7PZ13V9N7Ddg1AFgm0TrcBG9ZvimEQ1tc02okN/NVKtHRmJ8YuxikKsAPa9xDyUNkSNYkyhEiFCOSQoDvHp2PmQgy8+WZib6EJrNBQi3lxZ1WBl7qAQiGdmjtEVDd2eavh5XOjoQmA+spCtSMw7sEXb1XJdg2TGd444ullZ17Q/R7GpfdcIiVz9hO9zo8kiAocEUtVdROXtN4BtfDP+i4r4G4VveTXFHSNQznlzG+YLCuWHPBwyihlYw+4XHxhYaNEHuHDV5WLuObGFDtMqcZF2retOdFxBnLCvqwXAicNBNB1IwNe2SK4Xki1CnuCsOqGINAcvn2k2P3H/7FpSttNPcbF7q2Mq9/9cK/3J6Lx9NXdOCkJV8NlQG7KJc8v0QPcSZYsKFPNlyYyxhjOH972vM0enfjYH7N43VZBM3uZbQgfbDg+TQHVMxtRspjX5nDllFS5Ut6fQ+S3vLOBR2xe4kbK6gC/Zo4+h4tcpy1YUfLij/Xv9hF2+yzomke8gUpflkq+Tf7GVQ4mG7jnJwA9MlSWDp5CUTz8kKbDdFO2qLBkpK4G
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(396003)(376002)(136003)(83380400001)(31686004)(26005)(6512007)(36756003)(2616005)(186003)(91956017)(4326008)(110136005)(76116006)(86362001)(316002)(8936002)(966005)(41300700001)(6506007)(2906002)(53546011)(6486002)(66946007)(38100700002)(66446008)(71200400001)(66476007)(66556008)(7416002)(64756008)(122000001)(31696002)(5660300002)(54906003)(8676002)(38070700005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmdJWmtZUWp4TGMrOUlSaVRhbHZKYXlBcm96ZWJjQW5GVVZqb2FTbjNnSGFl?=
 =?utf-8?B?TTcwMEw0YkpEd2pmcEFqMi9xK1E3Y0VWbXZzZENlbmJlMGtPczVadmMvZFAw?=
 =?utf-8?B?MzlkcG1vc1djdXlMVHd0RVE2VzdjUnJnODVXR1ErWTNqS3Y0SjlFUEdBazVv?=
 =?utf-8?B?c0hxU09hU1hnRGkrbzlnRDdFZWs1aE9uR0tiajQyK2VndkVUS1Zya21zOEhI?=
 =?utf-8?B?S1NETDAzNFNidmQ1STJmUEhsSDMxYVZEbzhSWElxeVByYUxKYlBtRHVzMkxU?=
 =?utf-8?B?Zktzb0djd1F3YkE5Z0R2ejhDRVZPQitjamIyM0JBRFkzdU5Bck9VUzRPV0dp?=
 =?utf-8?B?WXA5SDhKMDRka0ZsZkFYejdHWTFoWkVNMngrZFZWd2VQdWpocUNzNStlQVBL?=
 =?utf-8?B?empLYmNCdk5LZkdLOFVhUGpqMnIrZUtnOEF6NmN0eGx6dzRHN2NNMStXc2w3?=
 =?utf-8?B?cE9TZUNNcFZDeTJVaWorL0l6Q1cxcHZEOGRBRytKZm1XSHlsL2Rvc1FSckE3?=
 =?utf-8?B?Y0J0UVZXVFkvYXNZQnBIUHN3c29WYVpnR2Z1VEtndHovWjV4Q3ZVMDBycXFv?=
 =?utf-8?B?NkVOejByVGNoWmJXOGVjVThCR3Y2VjUzcWxyT2hxTTQ0YmFuNXpNUml6VFJW?=
 =?utf-8?B?anhGN2d2NHlhdjBHMkpHbjR4bFNqU3RrMTZrMS9odVJOOVBHbnV3czkxczY5?=
 =?utf-8?B?M3BoaUZLL2tVOHhxZ3ppa3BJWEdKS1cyOHQ0bjhaV0lWSER2UXYrWGNlSHRY?=
 =?utf-8?B?WnRkc0JyNlJTWTl0MXpmQzVxZXFCZkpNWDBoajQwYXJmQlB2aDlwdEJ0WElC?=
 =?utf-8?B?cStYOU9uTmFzYjl0Q09mN3Vyd1lteVkrZC9MUWFZODhKcytLSXlkZGVFWkNy?=
 =?utf-8?B?dDRvMk55UXA1ZEpEOG43a25NT2NCd1hVSnlIT2pCdXlSZVQvdDlwdTREYlFC?=
 =?utf-8?B?dGk1VHdKakFPTWN5STJKMVRHemFnM2hiL29mZXpUbkxYZUNLWkl5bXlyK1VK?=
 =?utf-8?B?RTJUbDBwSjhUcmVnaURCMmtKaVlHdHdVQWlVYlNnR3RPRlFqc0VITFZBOFNM?=
 =?utf-8?B?N29zSEJ6V0NvNHBNc0UxZUJwVlZjRGM2UEMrZ2tHUHM1MU5OaEREVDJzM2ZV?=
 =?utf-8?B?bG00cFBwaER6UVhscXhpZ0ZPU21jUlgyVWJTZUVVVHJzYWFZeFdmRWNBT2tK?=
 =?utf-8?B?YWlWOFk2bFM5N01LUzQwaHgxNFBLenIrRm1TVk9kRHd6OWtyTHU2UmtCUXEx?=
 =?utf-8?B?WlByTWlWL2lUeThIc2drVDRwakh2bkorZ0RRYWdtZ09tcnF4QUtpUWI4Ui9I?=
 =?utf-8?B?Y3dva2FqRkFHTjhyS1dzOWpoTEhxWkVnbWtNTDFOK3FWQmFUeFFka3llNjNr?=
 =?utf-8?B?b3d5ZFhQbG12QSsvZWR4ekd4b0hURFVRbFdkT1BJMVFpTVdYNXBOdWZoNits?=
 =?utf-8?B?ZkZGc1ZZanZkdFdydytNWGdNSmxXUUlxbWlCWitSbGVJSWt3MVMrS2NTeUg2?=
 =?utf-8?B?Q1YzNGhHWlplUzM5K2RudDlsdklOWHhDdW5ISjZ2UklsUjVlMk43OHh3aDE0?=
 =?utf-8?B?L2hob09CMXRaN0dHdkRxeHZGQWdCSVRQOVdVZXp6TGlqTWw2K3NSWWVmZkRD?=
 =?utf-8?B?VDJ0ZUZYc0JpN3ZvTFFxVWNkYTM3L2dyNklUV0F5RFJlWXJXL01HNjNyYVVj?=
 =?utf-8?B?R29JK0dUNWxpM0Z2aDEyRFpHRkhqYW1zcHFCcUk4TVZiUzJ5MlJjU01aOTJF?=
 =?utf-8?B?NUF2dGZ4cEpmbW9VK1N0bTRKOHY1M2FtQTFFdzlMOFJQVUJlVzRlNndmeFpy?=
 =?utf-8?B?QzdobUdBOEJIV0ZUcU1SbmJoUXErQ0kxd2pLOEpYU0orcEw5ODhkM0t4bTkx?=
 =?utf-8?B?SURnL2FZOHFWK0JuV3EzRmhOcDBBNlBla2hKWnRMOEZHOFVJK3J3QUluN1Zt?=
 =?utf-8?B?VGROTms0Q0wxMXRBSTZLZ0JsK0Nvc1lyWEE5Q005WExnekFZbmlsb0RiTWFY?=
 =?utf-8?B?TWdtbUFucCtPdmpjTE9pTGo5UkI3QUZjSG52L0NmODE5d01pK3krd2ZxWGJU?=
 =?utf-8?B?MVJkT2dTTm5IUVExTkV3aXNYNmo4ek4zODdTTm1paTQvUW9mVW51R0RzN2dG?=
 =?utf-8?Q?8aZsjfANoH8UEkhjpgTt4lzzg?=
Content-ID: <6B383115CC99FB4BA9DC7A4439801266@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fba6742-dfa7-413d-25af-08da7a5ba923
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 23:05:32.4143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfXD3HYQqpuxq2PULuwV11DrbFTmcqrrJvG5ak4Hr6++eYGqH+4YroyYzET+6wnEA0wCN/i4HRYEJJcPYkP0Xs9mhoZqtttwaNfDwk16S+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_160547_167073_5E2DA1ED 
X-CRM114-Status: GOOD (  14.26  )
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

+CC clang people :)

Got an odd one here and would appreciate some pointers for where to
look. This code when built with gcc boots fine, for example with:
riscv64-unknown-linux-gnu-gcc (g5964b5cd727) 11.1.0
The same code but build with clang build it fails to boot but prior to
that applying this patchset it boots fine. Specifically it is the patch
"clk: microchip: mpfs: move id & offset out of clock structs"

I applied this patchset on top of tonight's master (15205c2829ca) but
I've been seeing the same problem for a few weeks on -next too. I tried
the following 2 versions of clang/llvm:
ClangBuiltLinux clang version 15.0.0 (5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa), LLD 15.0.0
ClangBuiltLinux clang version 15.0.0 (bab8af8ea062f6332b5c5d13ae688bb8900f244a), LLD 15.0.0

It's probably something silly that I've overlooked but I am not au
fait with these sort of things unfortunately, but hey - at least I'll
learn something then.

Thanks,
Conor.

The boot log is fairly short so here ya go:

[    0.000000] Linux version 5.19.0-13253-g374b508ee318 (conor@spud) (ClangBuiltLinux clang version 15.0.0 (git@g
ithub.com:llvm/llvm-project.git 5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa), LLD 15.0.0) #1 SMP Tue Aug 9 22:42:10 IST 
2022
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] Machine model: Microchip PolarFire-SoC Icicle Kit
[    0.000000] earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
[    0.000000] printk: bootconsole [ns16550a0] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000103fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000adffffff]
[    0.000000]   node   0: [mem 0x0000001000000000-0x000000103fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x000000103fffffff]
[    0.000000] On node 0, zone Normal: 16064512 pages in unavailable ranges
[    0.000000] SBI specification v0.3 detected
[    0.000000] SBI implementation ID=0x1 Version=0x9
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] SBI HSM extension detected
[    0.000000] CPU with hartid=0 is not available
[    0.000000] CPU with hartid=0 is not available
[    0.000000] riscv: base ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: Embedded 18 pages/cpu s34168 r8192 d31368 u73728
[    0.000000] pcpu-alloc: s34168 r8192 d31368 u73728 alloc=18*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
[    0.000000] CPU node for /cpus/cpu@0 exist but the possible cpu range is :0-3
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 224263
[    0.000000] Kernel command line: root=/dev/nfs ip=dhcp debug nfsroot=192.168.2.5:/stuff/nfs_share earlycon
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 0x00000000aa000000-0x00000000ae000000] (64MB)
[    0.000000] Virtual kernel memory layout:
[    0.000000]       fixmap : 0xffffffc6fee00000 - 0xffffffc6ff000000   (2048 kB)
[    0.000000]       pci io : 0xffffffc6ff000000 - 0xffffffc700000000   (  16 MB)
[    0.000000]      vmemmap : 0xffffffc700000000 - 0xffffffc800000000   (4096 MB)
[    0.000000]      vmalloc : 0xffffffc800000000 - 0xffffffd800000000   (  64 GB)
[    0.000000]       lowmem : 0xffffffd800000000 - 0xffffffe7bfe00000   (  62 GB)
[    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (2047 MB)
[    0.000000] Memory: 803032K/1800192K available (7485K kernel code, 2858K rwdata, 4096K rodata, 2181K init, 394K bss, 997160K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000] rcu:     RCU debug extended QS entry/exit.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] CPU with hartid=0 is not available
[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller@c000000: mapped 186 interrupts with 4 handlers for 9 contexts.
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [4]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
[    0.000003] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns
[    0.009713] Console: colour dummy device 80x25
[    0.014676] printk: console [tty0] enabled
[    0.019217] printk: bootconsole [ns16550a0] disabled

FWIW this is right about when the clock driver gets loaded
as you might imagine.

My config is here, but it's been reproduced on a few different
defconfigs:
https://raw.githubusercontent.com/ConchuOD/polarfire-soc-buildroot-sdk/dev/conf/lowmem/defconfig

On 04/07/2022 13:15, Conor Dooley wrote:
> Hey all,
> I know I have not sat on the RFC I sent about the aux. bus parts
> for too long, but figured I'd just send the whole thing anyway to all
> lists etc.
> 
> Kinda two things happening in this series, but I sent it together to
> ensure the second part would apply correctly.
> 
> The first is the reset controller that I promised after discovering the
> issue triggered by CONFIG_PM & the phy not coming up correctly. I have
> now removed all the messing with resets from clock enable/disable
> functions & now use the aux bus to set up a reset controller driver.
> Since I needed something to test it, I hooked up the reset for the
> Cadence MACB on PolarFire SoC. This has been split into a second series
> for v2:
> https://lore.kernel.org/all/20220704114511.1892332-1-conor.dooley@microchip.com/
> 
> The second part adds rate control for the MSS PLL clock, followed by
> some simplifications to the driver & conversions of some custom structs
> to the corresponding structs in the framework.
> 
> Thanks,
> Conor.
> 
> Changes since v1:
> - split off the net patches
> - clk: actually pass the spinlock to the converted dividers & gates
> - reset: added a spinlock around RMW access to registers
> - reset: switched to BIT(i) macros
> - reset: used local copies of some variables as pointed out by Philipp
> - reset: dropped the success printout
> 
> Conor Dooley (12):
>   dt-bindings: clk: microchip: mpfs: add reset controller support
>   clk: microchip: mpfs: add reset controller
>   reset: add polarfire soc reset support
>   MAINTAINERS: add polarfire soc reset controller
>   riscv: dts: microchip: add mpfs specific macb reset support
>   clk: microchip: mpfs: add module_authors entries
>   clk: microchip: mpfs: add MSS pll's set & round rate
>   clk: microchip: mpfs: move id & offset out of clock structs
>   clk: microchip: mpfs: simplify control reg access
>   clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
>   clk: microchip: mpfs: convert cfg_clk to clk_divider
>   clk: microchip: mpfs: convert periph_clk to clk_gate
> 
>  .../bindings/clock/microchip,mpfs.yaml        |  17 +-
>  MAINTAINERS                                   |   1 +
>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
>  drivers/clk/microchip/Kconfig                 |   1 +
>  drivers/clk/microchip/clk-mpfs.c              | 379 +++++++++---------
>  drivers/reset/Kconfig                         |   7 +
>  drivers/reset/Makefile                        |   2 +-
>  drivers/reset/reset-mpfs.c                    | 157 ++++++++
>  include/soc/microchip/mpfs.h                  |   8 +
>  9 files changed, 386 insertions(+), 193 deletions(-)
>  create mode 100644 drivers/reset/reset-mpfs.c
> 
> 
> base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
