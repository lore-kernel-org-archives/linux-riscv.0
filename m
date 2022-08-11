Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B454C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dz0SNIfNyD3sM4EoiX2YzuRaccvxWDEselPAUCJpEOo=; b=itAu9FbXVgxw1+
	6/R74ZCIX+5Wzuds23aj+cZkFrpwwfGsVd9pyzb65rygRN8B3jbXP2Olx//YCsT8JXBYKbptMi4FG
	bSc//dGwBJPvL3omLzw1uKvXSbtnbv0XAvwSznpqj7MfHr/4o/TGpbgOT50yYg7i0JFGhiE00tFni
	Bm93xRbfUvtJ7jCdWD+yK0skZP7aTERaPxhrEG5WdbSr69THIdtr4+y3mlH+INBk2tKYS+jEYT0po
	ZwjitP66yW0iANQCI6qp/x51nA2H4gvZsXvPkottz0bwAh9KbE9sK/OmOv1NhGMm6zDWO0U29Fcyw
	cljyL9mimgSAvHB6EFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMF11-0059Zr-2e; Thu, 11 Aug 2022 20:42:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMF0x-0059YK-Mr
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 20:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660250568; x=1691786568;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3vLg0+mCLeA9SwStgXq4peShfVMTd4/tmJM/4oGMcLY=;
  b=JvEpAYqcPS2WSZGFEi/QwMtTKuiFRrQz0L2lysl6DMkyXOKliGBFmq7f
   JqyI+hi5GtPm73YS9VVEKlYl1Mv7U4A3zaPgOmJmoL4G2p+CZLn4dkY43
   2vFA53MsC4gfEMdyGfwD7KMesPb9J9TWCFXVEhzKyb1yGNcINvQe79i51
   nsCLNYPQZNffr4UbLYI9NcmzICyEnbt/ZPQBuc9LUGhpjM0CNhf7JKq+x
   uUBhqGdkaQq3sjYbUoIasFVoXpVMeqP+DXGLN3yji8k/gGMc5vScHgsWR
   My3UJqSKutskqFdDRHks8O/+Tiz72zAJl2rfJjfpMW7C8Y+lDAX5osGI9
   A==;
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="175915797"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2022 13:42:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 11 Aug 2022 13:42:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 13:42:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oChPk1YMSyQbF3p8izORiuBKfSZtaCVPJb/qqVzMu+D4sf0fDU2o1vOjR6bgHgMVpRxF0KqBcbWi+HPiVQO1tRIXkQSTyAi/Bi7fSkYcRahTfQ/QjT/21kipbxcWitYvNtrtsc5wcwwDvynMXWJ2Wtvk60TtKLWGnXDts/zwm69JGh2jed0ICc+mmUwKRQyfTwH6ba8uxGGCHUd+dAx1dO5Y2tIW4dp8nTYSLElO1FmhkwTm62dnQoKcnEzoko9ALqnfDTXGoj7eHcCEaSULu5gKWFApiuJTMn+mlE8PwaRc6kNEzqYs6zjnvjNVi50XLTGC/rK6c0SXSkBylVUNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vLg0+mCLeA9SwStgXq4peShfVMTd4/tmJM/4oGMcLY=;
 b=GsRWGmqCyOeez5ilw0yfjpf/Og6rrhLhiJ0YoG2/2VAIAI2UE8dvvWoRmtP4hcWN/xE5O49+Woaht6mftzTCcZyF8xZwxO4TOvCLhmr1D26VH9SwwQ0/hNcqrM7aqlKupAFP6w6KDMhCJIe5OdYb/HIjUUqpe+32sG2YayY4j1dDjiKG1jVN6xiuzt74OPTqK0Aq75Tf6MKw90iHLNYuGOCUMLlGXkbaQku2bGG3ohbt1I8qxp3pzm9Byv223ykhuIPnElUzYTilPpho7UW25hMoU/go6Kfs/XVDgBENbUGt8sfs6xcsC7pLBoV4cDcSa/82cuikP59MVCespO7ytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vLg0+mCLeA9SwStgXq4peShfVMTd4/tmJM/4oGMcLY=;
 b=rLwBJlYfEvPWD8zpcWhisFz+RglhhH74HhUdmntQpl8uftJoKmQAJU3EhtUSJ045FRBB9kYRV2DjTF8WFhOuxBzBN8zOlAkG7Wzsdw+4dtm0XWBoc39opFuOMGQk+qPqzni/cykN/xTAUuPOanGY5W9dOwXq/DcMJ/OizrkP+2g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2829.namprd11.prod.outlook.com (2603:10b6:805:62::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Thu, 11 Aug
 2022 20:42:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 20:42:35 +0000
From: <Conor.Dooley@microchip.com>
To: <mail@conchuod.ie>, <Daire.McNamara@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: microchip: remove ti,fifo-depth property
Thread-Topic: [PATCH] riscv: dts: microchip: remove ti,fifo-depth property
Thread-Index: AQHYrcF/MxG6txRUrkKVM8A5bjQ2262qKkKA
Date: Thu, 11 Aug 2022 20:42:35 +0000
Message-ID: <b51b78c7-6b75-908e-53de-6585cdd32deb@microchip.com>
References: <20220811203207.179470-1-mail@conchuod.ie>
In-Reply-To: <20220811203207.179470-1-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 738be310-308e-4f7e-c3fa-08da7bda05f6
x-ms-traffictypediagnostic: SN6PR11MB2829:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o2NK8UmCgRoAJnpHdlsaPqcqKvLtuZH9NtWsUldaM7tsBhk9NRc+Ookk/eyNdDP1F/s2fcacTrWn7j6KH2hP8tulvMjGlW3lSMy+GAPrXOxxxC9V1ei6YtCI4ETkUq/R6w5PvwmvEcUQMQ4MoANXS0a+Sq4V/lEzjaUkU+3kM9xpyY1TMqUW2nMWA0QGXN6eGpPpqSWgvri7qTX19mxxOu6lRpMVXBjZQwKlDUwwTr2d8n1cpDn+UBJxqVnZyif1XOaupI0rN/0CwvJY4tFPrm2weGTGOwocE74fzm8urV2riJTrOMCczXt9C8c25F5o6ZLcNtY8EEWwR45f6fp5Aw4gVQFF5E5T9YyZItM7YZY2unH4IbWdVexxITIy8M2lIXLAe44HR5RHjG7UhWrFLTEPcTnzVehUgcIsCUL1waB3rEBfkKFPjbEACmoJqQ1/sQ1oIzeV9JIN+1+Mj2Gi5D6laU5lNJ9CpZqvX6IAmYfGgDmSICwFm8oAOHm5jkmhE/+GRD7hZPKIXZq/BwxG8Oe3310fuszK8U+m+TGtfAmUfo8JcNQf8VyYhxC8NKI1UJSjF6+1ZSmPE4r05VLe+Btqv4Bu1eoVn0BKRtJmVem2MzICuKEMzpVQsilkHDV1xPk64M7qkRES5l9s2gDTgMIGcfVDrPtRkp4hXylaOfSHHVpL87UsxXF7vBDQ+dfXb36Sg/nc1YQOMImsSGp/C5uk1eCd2JAk8wHiU80Dni/esxcbqRsaXW7ZEH0usWPzN59L9PimUD5Y+03sK1egvp8hlczKJlwkr7LCEPYfueRx2QiuBrsYVM8AOCub6UPmdIBCMY4NrtVvOXoZvFR0BwozkYaQ6qtBN7upTCzue6TkuUkXlrklnI7O6pU0KM83
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(136003)(396003)(346002)(66946007)(66446008)(316002)(8676002)(36756003)(4326008)(64756008)(5660300002)(76116006)(54906003)(31696002)(110136005)(66476007)(86362001)(66556008)(91956017)(122000001)(83380400001)(2906002)(186003)(8936002)(31686004)(38070700005)(38100700002)(6512007)(71200400001)(53546011)(26005)(41300700001)(478600001)(6486002)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnJWQ0hlSkU5ajVZZzJLMUhsd2VEaHJCaWI5Y0htZ0loVUpSMWNlN3JXQVFp?=
 =?utf-8?B?RUVPS1hldWt5QkxSeUdEd05lM1N3K0VoNWp2Y3hKeGg2bndVcTg4NnRYRG53?=
 =?utf-8?B?WDVGeTFaQXh1bUNUOWJyWkQxRSt5UkNCTHRYcTdULzlsSFhMZTFTY3NrUGVT?=
 =?utf-8?B?SVJUWGlaQnM2cDk2ck5vSUg4bW9IZE5weEk0eDV2SnlTSXpVRzlMdUlkVHVh?=
 =?utf-8?B?eFB2clRiUHZIUUJSSEdxWm1ReEFCTlE1S01ySGV0N2lZRWNiMVdrRnFrS21T?=
 =?utf-8?B?RVlsekNRNXFBODdFQ0hFejRIOVNmNTAyUHdBWkpkSVRyVXdiNGNOdXZ5QVZv?=
 =?utf-8?B?S0lpUmQ3ZnlBWTJvTUZGTG45cUFHSkE2YTFheWgzdzUxSUg3akJqZEd2Tjdo?=
 =?utf-8?B?YjFDemdFVDVoYUNXWkgzMmNCaVlzMUJaVFFJWmxjenl2cFhlK3Q3cjduMDkv?=
 =?utf-8?B?bTdsckxFeGlUWTNvcUpmWDFlRjhiVldiWlAxajNkZi9JTWRCOTBiMVZmWU4z?=
 =?utf-8?B?V1l6UE5BbUJRc3dNK1JQNDN1T1RqaDNxa09qeGhZeis3aUNHZ0ZyUlorS3ZJ?=
 =?utf-8?B?M3Z3amNib3YwUk9CM0RiZFUrdGhZNGtuWWZsdjh0TDllOGdwUFovWExFYW1T?=
 =?utf-8?B?RmRIK3k2Wk9IQi93dDN2VVVEd1h3WjZlbFgxdUNqcGFEOGJMR1hwQXEvV3Nt?=
 =?utf-8?B?OCtsY2UzeG0vNHAvYXgyN1dMNGJxQVB3RVVQakFkSzdxNnBxOW1BVWNjaWha?=
 =?utf-8?B?MkY2UlJLOHZUOHhjQ0p2RXFOT0NIV25kM3JIN1ZrSFdWak1rRUFhdEpTNFls?=
 =?utf-8?B?QkdmVW40NXJXeEREVHFWSWcvWllGQ25kR2kvSTExYVpBMjJIQ1RRb3hnUEtE?=
 =?utf-8?B?L2NiRGZyYlY4SEZpeFRLdExSMmcwOHJ2TjNQbktmVFlyd0RuYll4My9YTGhr?=
 =?utf-8?B?OVgyWDR0K3o3V1JkQ2NzUkFHbEhUM2tHNmFISlFCZU1mcVl3RHR4bHdZYndD?=
 =?utf-8?B?SmlyeXo4Z053QU9HZWZmVzF2djdmRDdmWnNFR1JobzduWWVTT25kRHBiVkti?=
 =?utf-8?B?Y0JtUFhXQ01SbFcvSDVxNmZpRERCNGdWVjBxemJTSENTMUtlWmxPbGtBdFU4?=
 =?utf-8?B?eW10RUVSaG5WRzZoVisvWnpnSFgwbW4rbnoycGtCMktYODhrbmpxWlcyODhG?=
 =?utf-8?B?T2JPVExYcmpiQ3kxQnU1dnRQSFFuS1JQdjkxcTljRmd1QlRjeE5sOXhGK1NV?=
 =?utf-8?B?WHpOc3JHaTdPd3FRL3RETk05aTR1RXZmb0V5d1Vzck03WVNOQVNzai9qUG92?=
 =?utf-8?B?NktoNU9CcEx0V0lubEdJQU5mVmhiNWtiNHAwZ0ZEdy81TnJzaXM4SWNnTGo1?=
 =?utf-8?B?VklFdFMwdnptLzV2bXovcXRrREc4V2ZDNjVzRmhWeU5FY25sc2NtU0N5UUdB?=
 =?utf-8?B?MjVLL2FsZGhyZUhxNFhXWnY2ZXRqREozczBsZnVuRGhPODBoaFNEN2tncTZN?=
 =?utf-8?B?WEhjSEJ2RTFwelpMSS9pSUU2cWcrTnJqcFpCM1ptUkN6L2tRRUU0MlRZS0hH?=
 =?utf-8?B?RXFlck1BZG5KZjhEYXBlbmlzc0MwVU4yd3ZXRWIyK3lCejRuc3JWTzB0OFdL?=
 =?utf-8?B?SFpUMFY5Q2srTHBDOVhPM0ZhU1pxVzVYZm5QaUZCVkxLNUFGam9OTkxPdktR?=
 =?utf-8?B?U21qZEp5UWdkNHFoeGJyVmV2SVk0blU3cFZWNGtucVhBbk1FYm5YTTdTUFdW?=
 =?utf-8?B?UUM3QnZDNlA0VEtESTdLWFZaa1ZZTXJXN1VGQWh5eGZYeU5rU2RoaWJGR3Fr?=
 =?utf-8?B?UWlBOEtOcGVJbWZGd2p3cXJVRlJUcVVkdUlTdFYvbVI2SWV6RG5ONmRUaU5n?=
 =?utf-8?B?RXRUb2Q0Y0NuRFhJb2dXekYrWE5nWnY4YU02ajNZZUlab1ZENjQzVCtFRHVx?=
 =?utf-8?B?QlFvYTNDR2Z5S253OFVzRXlnNUpMU3FQeVFkeFRsTXIwOWhLNmtubXEzWVA2?=
 =?utf-8?B?VGNXVVlDZ2sxR2FocmtRQUlDMDM4Vk0vRVBBRCtGN3NNZlUrRVRhMCs5TFJC?=
 =?utf-8?B?QkRKSmxZMGZxUTlSMkRUbTVWbnVHM1JhOVpBam1MTkhpSXVXdkNwcG9ZdXNy?=
 =?utf-8?Q?OvhEJGCYkg6pnhcOnwoeHuSJa?=
Content-ID: <631625596A41344E8BEFD68585582BA6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738be310-308e-4f7e-c3fa-08da7bda05f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 20:42:35.8866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tfSYRC3VS71fUyBrWveb6JoVXb87X7rb1zYcTL2+n0DNCRKk7rvq2qN2gqkk+vLSAp16Fsiv2d9T/APmzn9zKxC5XLT5u+YzDshNpmR37Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_134247_778302_C3648569 
X-CRM114-Status: GOOD (  18.79  )
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

On 11/08/2022 21:32, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Upgrading dt-schema to v2022.08 brings with it better handling of
> unevaluatedProperties, exposing a previously undetected missing
> property in the cadence macb dt-binding:
> 
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: ethernet@20112000: ethernet-phy@8: Unevaluated properties are not allowed ('ti,fifo-depth' was unexpected)
>         From schema: Documentation/devicetree/bindings/net/cdns,macb.yaml
> 
> I know what you're thinking, the binding doesn't look to be the problem
> and I agree. I am not sure why a TI vendor property was ever actually
> added since it has no meaning... just get rid of it.
> 
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")

Fixes: bc47b2217f24 ("riscv: dts: microchip: add the sundance polarberry")

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 2 --
>  arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> index 044982a11df5..ee548ab61a2a 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -84,12 +84,10 @@ &mac1 {
> 
>         phy1: ethernet-phy@9 {
>                 reg = <9>;
> -               ti,fifo-depth = <0x1>;
>         };
> 
>         phy0: ethernet-phy@8 {
>                 reg = <8>;
> -               ti,fifo-depth = <0x1>;
>         };
>  };
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> index 82c93c8f5c17..dc11bb8fc833 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> @@ -54,12 +54,10 @@ &mac1 {
> 
>         phy1: ethernet-phy@5 {
>                 reg = <5>;
> -               ti,fifo-depth = <0x01>;
>         };
> 
>         phy0: ethernet-phy@4 {
>                 reg = <4>;
> -               ti,fifo-depth = <0x01>;
>         };
>  };
> 
> --
> 2.37.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
