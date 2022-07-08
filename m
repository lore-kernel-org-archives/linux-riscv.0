Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C8AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 22:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsDDaTOW1J4q6CAzRY7WEeLfMqeAMnauST2rN63Hf8E=; b=Ag+oRxOWufHuSh
	Qr9RvKaDCbr9CF4BHwLTDq2M2HA6z3IePYt/UQvqMB7VD7Tij+slzetWtT5Q5o1Us3e4dI0KHbvmq
	K+5Zc4rL8xin5UtgYRoea8kTEWbI6Njo/cINrE3VBrR8cEyhJgIxfR0DSc1DuLjL0WeLcsOXFpSro
	KOFkJU1wyHi9uLK1dEap7uyB/524Rv3h8RLD+O4ebMfOP9mDGSaT06VeQ1/CAMqqslOZyPcwRiAna
	yyQP618kD9njnifes88zf9Y2H09kE3U5xxjFPOQMvw5lq2dduv7R+fS0yGYZ38NHcS0+Viux2BeVA
	jGX+DQ6BOxSqRhhiIiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9wVG-006Cz3-Lt; Fri, 08 Jul 2022 22:31:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9wVC-006Cwu-HY
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 22:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657319471; x=1688855471;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=UuXQFoDiM30Cmj9NBv5FOJ7FliqX+8cTPAHAptJZa+A=;
  b=xfmr6jBGm842GDTYiaemIZgNSDhK2+VEHgPigF1hcEPEW7mEaqjZeYti
   1Y3HefGBN+LuyzVPe+FK/iy2Gw/ifSs9jqqzYCFHDf2oud1kOIRLWdUYm
   YOFraCgwUYJ7acExpHHj8WFVEzwt3HuO/3WzldWh42nPQsPx+LjqOEh/+
   Rt8wqWmvRoRybYF91xUOMA9X9FsleGvyzGfWvN4jf2N1ik3lGI7blYXfu
   xjYapOCAcT7+tzqanZTjGbHwG+cru+77/6rPp2U186uXYylDrDVjyPoHW
   sBELOEb5yRCEprNRsFWg7TC0Gl3JI3yNufH/5XHN7SXPPOTyMdfsOJM2l
   A==;
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="163992975"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 15:31:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 15:30:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 8 Jul 2022 15:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9ZSHC669UTAdD7hwYZK4JnAxRU42oc5zvaRyq5nynuScZf9SPeGEYtyzl9/Ty0ueDMKf46dPtNmqQMoWmqITZ033uytxy4lfxXK3OLC6CPytRc8c33teHY8l6dt95ttq6JTSiJ+87UI4Npsc+4nlc1gAtiYEmTLnX8nGZydnzXoTKlLQcUbb727/vDMBHrwaS8AVPjhc1U2Qt8HRfSyzNgEb1EQmTzg3p2kBDFziiubmn559KRtL116lhuAQ/8PFNzKW9uNBKX2FG9kTOzH2E/B0wOyaOJzxQs0/yD2X+XmqTjh9ckBkb0gL63q014ax/F9bLbqCU85qyjTlCp2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuXQFoDiM30Cmj9NBv5FOJ7FliqX+8cTPAHAptJZa+A=;
 b=akQhEH7vy+50a+jhfD3fcDTrO6XJC10ZhT5uHSBUFvXpl1n0/EJQgRA3gOrkIuSQ05NquZl4DyrP0UOUJhNmsaviRuNGODg642S571jXbp3RLuWrc0qwwCGnKQG2CszHtw5YHieA5wO0q16zH0gUz6ieoXEQ0HAR1cdsWGJDDY/bIQ/gYrvC2oQQ6FvWSxx8PksFmFnXGmM1Y7jGhkIuj6HyIAOXtinSUKW3xIC/3LTrKINi127Tj7xBgYvojpgFxL3YRqbXrMHduLkb6arnhyq3JAqSnrZCjkE3uOGL5rCYu6lQ96bh2Dpv8tFLCfwqB08gxo6/u3sOKsOgk9Wq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuXQFoDiM30Cmj9NBv5FOJ7FliqX+8cTPAHAptJZa+A=;
 b=o+CYbVta228Eklr4IbILTYVe8gpfAYG8WlQdGMLdhok8ae8lXtT7UE9nEBQNtlG8bdlmKJlWVErbpj3h8ZWnkXgPeFCiwDriDc1xfkvjsfaMQN96sAp5xNeyHqC5u93PUSNMRx1oaOR+783+wsvvw0wMwzwKrlDzTETxUnGnM4o=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5645.namprd11.prod.outlook.com (2603:10b6:a03:3b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 22:30:46 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 22:30:46 +0000
From: <Conor.Dooley@microchip.com>
To: <ZephRay@outlook.com>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: always honor the CONFIG_CMDLINE_FORCE when parsing
 dtb
Thread-Topic: [PATCH] riscv: always honor the CONFIG_CMDLINE_FORCE when
 parsing dtb
Thread-Index: AQHYkwb6Xt0fxugHH0q3a6opYrWrl6106gUAgAAIrYCAABv6gA==
Date: Fri, 8 Jul 2022 22:30:45 +0000
Message-ID: <3b8456b2-2d77-9d7e-484e-ae653d480dbe@microchip.com>
References: <PSBPR04MB3991F5AF4EEA354A658A3BAAB1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
 <737467de-c8a9-75e0-3f78-a6ab0860a6e8@microchip.com>
 <PSBPR04MB3991AB52F91641D073FD3FABB1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
In-Reply-To: <PSBPR04MB3991AB52F91641D073FD3FABB1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4011aad-0043-443e-5361-08da61318044
x-ms-traffictypediagnostic: SJ0PR11MB5645:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ESH+5/XTgJamgxFCbgWPBMJHs0NhUdw0MsqkpM9WsfCDREHq08P3lIhkuAfdZ3vDOKEav20XRM6WroACM4bb5Mnx8mKuX17VfyySfP+uogk/AQiBOhsBVcjZai2RBWFIVO7XHxMKsyxO3HGrNurCOWBQqOxXSfmOHhdZzOov6tSRnfgJF8T83qnBCzZ3hRqxnq/kVz0nhYs8eFNg2l0hnFzpNFiiapgtg5ud1KHKJ7iMte4hx+ax+HQ2QuOAyIU4Tf90yLbSJr2Oik48p0D+lbToSOunJOgoXHOgOGvuSPhwZ8m+gqBeBHXwyS/MdR7/mp7LGDGmRDyC3CdK1VhHT7cFLlKRY2lUdqcgxAacDRxSGwuWaH+BOgbZR0RdkW+yyAzVRuUlfnNHzozNq+0ZEajmbr7Zf2FtUbv14tRlz6Q8Tdi4hdsOhI9FIQs3+5FQXY4dKlWCg8qzpThFAwW7SDtdpFh4VXPCmv3e1lzBDtX/uzZd/h2DgCtUYXSyLyeaWawUv0dLyzdG4UUKnbnDzHSODOB+lzHiIUUeec3Q8j/+xjhcquWtywj5FK9jIkjPnO32lBfkKcOpYybo+Q9XaaJFySp8/gxmrWAE0g1AUq2Aozjef59Me0vdoVFGY2Kp/NW921CTwK7QJa0vxQctjHl/yAopLlNl8LpUX/pz4IB+fhE9HdUp+uR7v+AGnzgK4c/7tGVdeDESazcxwtOZ9AazOQccsHGWVC7mlgNbq8pHiHEeslwQy2A2eI+d9UCTWRI7MiHHNtkWjfPcP3bHs2pez94XHfUSfoW6jGk1WBHc7Ze1qZTrmsvYAQ1FM2gMYELdhYMr3knxj5l4t3XuUV/i6mVhIsxr0Bgrd4El5eHqczTDuttHjVAm6HpW24bmIezQ4ZUVJmgyssvDzWn5HVWYoj5gEB/GDbtw/GvFQnw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(366004)(39860400002)(396003)(66946007)(66556008)(66446008)(8676002)(966005)(91956017)(83380400001)(76116006)(64756008)(38070700005)(66476007)(2616005)(6486002)(478600001)(316002)(26005)(6512007)(6506007)(41300700001)(53546011)(31696002)(45080400002)(110136005)(86362001)(71200400001)(186003)(8936002)(38100700002)(36756003)(2906002)(122000001)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0lxek5BL2xkQlR3ejJBVmNVTEgzU1pUNTJFNVphQ250YTBHaE5RT21GNjYv?=
 =?utf-8?B?K3RnZmRtd1JicFJ2czB6WE5JVUh3c3JqV29kMlA3OGJ6ZWlMOFJ6QWJtTTBw?=
 =?utf-8?B?cmZSRHNJUzlaWjdYT0Q0TElYT09QMzZEc2wvOTlYTWQ5MmJ2K3Q1ZGMyelY0?=
 =?utf-8?B?NXE2eDFOWDRVTTJ4WUZSTTN5Y3VZbWdKWG45eXlXQmRHbGpLcUVsZVd4bmxC?=
 =?utf-8?B?ajJyVnc4YUUxT2hFSEhNWUsrZ1M2aXl2NXNQWEdWU2xsRkdLT1pBMzhZT1Bq?=
 =?utf-8?B?aEFFYWZPQno0MnlTNTdDUDh5SGd4WmNFZW5tSGdkcnEwZysxUkdZcGowV3d4?=
 =?utf-8?B?bngzKzk2QW10TEcwUFpxbzdFRExLeTNlRzZiMW1JbkxrZGRNRWp3VGpTU1E2?=
 =?utf-8?B?NitHR2l5RWg5KysvNW1vaWZlbTVxOWEzc1cxcUpjcExYdmJwQTdacE1peElE?=
 =?utf-8?B?dEJLY0FJWWw0dnZYZ1U5SzlyTk4xbWcxVWRYbEYydWZ4a1FaM0RDOWRuR0hn?=
 =?utf-8?B?bFh6ZmVPa1dPK2RDa0J1RU1waDNRMlNyWEhIOGxLWEdYbVp1VGJMOUJ2UWt3?=
 =?utf-8?B?K0pkREFWQ3ZTd2VPQWxZRzF2UHZYVENwZ2NFUFJrVDVEOEFRc0liL0lRS2ZZ?=
 =?utf-8?B?aURnbnEvMkZVMnU5cGJpb295WkFmTi9hS3Z3VEp0MHQyWGxzYm9sS28xOGN2?=
 =?utf-8?B?Q1lONTFsalZhaHBQTzY4STNBVGtZbVI5amNrSFZ0RGdtc0VNUHBVWnpNNmx2?=
 =?utf-8?B?ZnRNSE5rU1gzM0RPLzZXYjZsOFQyNVlLNVhQQ1hzZGF5OFkzY1g3MEE3QXJP?=
 =?utf-8?B?SXRadFJ0WVFoN2pXYmRSVmh0TTYzVU9IM1ZRRnJqYkFtNzFUbHdPZEEzN0V6?=
 =?utf-8?B?RVBOMUtsZHlDN3dxOE9hMW5NaDNKQUgxNnN4YW9KWGdYNmF6elVaM3l6TnhW?=
 =?utf-8?B?bC9FT016MFlabWZXK25EM0hMS28zNndrSjRHSSs1TUpHMnVDbzFzNTVBbW9i?=
 =?utf-8?B?OHBEZlEwMFErdVhOWlN6RVRJOHJENHdzRWhzaE9GaE1LYlFIZEVMRnliOHkr?=
 =?utf-8?B?dHdncmhoUHc0ZGFqWHM2RUY1bEY4c0VCNThIejJib3BrRUovYTNETWRXenp2?=
 =?utf-8?B?ZEw1Z0tyWkpsM2JBM2x5QmRtUWhHWHBsaUNSY2tuaTBaRUwrODdsZHA4OW1R?=
 =?utf-8?B?UlVRR3AvNmVBYlpmaE8zNDRaQndMVU5DNmlqZVM5QWJ4Y1hMa3dzaHRZM01u?=
 =?utf-8?B?RzhBempnR0FHdE5KVmEySDVpeEd2UERxWXlFRWpjK3YyUVlGK3Y5akFuQ3RH?=
 =?utf-8?B?WXRHdWRRYWF4Y0VZcHVzZzNaU3YxWG5WY1NIeUpHYnMzUy9CcEVyK2hlU2xy?=
 =?utf-8?B?L0JJbk9aTkNCZFo3VE0wd0RtdWdWbXkyeWlSMWQwVDlOcmNUcXl4b3lBeHNk?=
 =?utf-8?B?K3RKZjBJNGtzcnZYRlNvRDFqc3lueVordkFBWGl1N2pPVjMyVTkxMXBvbzZx?=
 =?utf-8?B?L3JqNzJOYmRCaFlUSTBlUyt4SkpYT3B6ejVhQjBSNFZrdkNMaHpUVWpXOEhl?=
 =?utf-8?B?Yi95OStYeklTWDZtbGxwdTRHRDNtSDlra2NkTXY1YXZxU3lhRTdSRzRNOEY2?=
 =?utf-8?B?L1NtSndsK0s2T2h0MWh1K3A4T1pkT0owLzliY3VoQ21kUlZWQVVoVDRITDI1?=
 =?utf-8?B?SjZDZVVuQXBjUG9pcGtGRnV1U2MraUVWYW0xWFgxYlNYUUluN0lHSEdqdzlz?=
 =?utf-8?B?RnNiNURxOE14TmEyZW5tTWJyeWE0cXlYc2NUTHppNTZSM2dTMHV4dlJNQlQv?=
 =?utf-8?B?Um9uZzU0M2kzSWlXbjJlVk9idTdCbjZoYTZiWjdERU5XRTVZSWx6RXVqWWxT?=
 =?utf-8?B?LzJmYXI2RFhCL3ZncHF6TTFOY3drdm0rVGNpaXhYWUVyNnREbGdXSXN2YXls?=
 =?utf-8?B?ckN3SGhIMmEzQWM5QkhmczQvYzBLcVFWOHhNV0N0NVJqcEVkRGlNV0ZnWnA4?=
 =?utf-8?B?NmVOVUNjUUlyakZTTnlBOGFodmtMZjhmL3JrN0pVZzVPNmZ1NU1xU2R2ZFVB?=
 =?utf-8?B?MGdkZXh1ejh2WUFKR2Izc3Q3cGpYOUZHOStEM3lPQ3k1S0duYjh6amxaVEdK?=
 =?utf-8?B?aVg3Z2NKQm03MDczYWVvRUVGbVBPVTE4Q3NIZXk3WnJwZlRvY1BMNGhJVzFz?=
 =?utf-8?B?dHc9PQ==?=
Content-ID: <308CA5B0E72542438F065284068D89DC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4011aad-0043-443e-5361-08da61318044
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 22:30:45.8974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DaPLbtsz8SkIHMHuPFkcK4+qQFrjZjxj4Kmi2c6jBI7Khvk4s4EHO20NbUKDV3MEgjYi5QBZz3wmtH1MHvjgUXTxRHLY4en3WpILO5w6yE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_153110_942722_D8A393C7 
X-CRM114-Status: GOOD (  27.49  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDgvMDcvMjAyMiAyMTo1MCwgV2VudGluZyBaaGFuZyB3cm90ZToNCj4gCQ0KPiBZb3UgZG9u
J3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gemVwaHJheUBvdXRsb29rLmNvbS4gTGVhcm4gd2h5IHRo
aXMgaXMgaW1wb3J0YW50IDxodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb24+DQo+IAkNCj4gDQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiBI
aSBDb25vciwNCj4gDQo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBjb21tZW50cy4gSSBoYXZlIGNv
bmZpZ3VyZWQgbXkgZ2l0IHRvIHVzZQ0KPiBnZXRfbWFpbnRhaW5lcnMgdG8gcG9wdWxhdGUgdGhl
IFRPIGFuZCBDQyBsaXN0LCBpdCBzaG91bGQgd29yaw0KPiBiZXR0ZXIgbm93Lg0KDQpZZWEsIHRo
ZSBuZXcgcGF0Y2ggbG9va3MgYmV0dGVyIC0gdGhhbmtzIQ0KDQo+IEkgaGF2ZSBhbHNvIGFkZGVk
IHRoZSBGaXhlcyB0byB0aGUgY29tbWl0IG1lc3NhZ2UsIGZpeGVkDQo+IHRoZSBzdHlsZSBpc3N1
ZSBwb2ludGVkIG91dCBieSB0aGUgLS1zdHJpY3Qgb3B0aW9uIGFuZCBzZW50IGEgbmV3DQo+IHBh
dGNoLg0KDQpKdXN0IEZZSSwgc2hvdWxkIGp1c3QgYWxzbyBmaWd1cmUgb3V0IGhvdyB0byBzZW5k
IHBsYWludGV4dCBlbWFpbHMuDQpJZiB5b3UgY2FuJ3QgZmlndXJlIG91dCBob3cgdG8gZG8gdGhh
dCB3aXRoIG91dGxvb2suIEkga25vdw0KRXZvbHV0aW9uIGFuZCBUaHVuZGVyYmlyZCBhcmUgYm90
aCBjYXBhYmxlIG9mIGJ1dCBtaWdodCBub3QgYmUNCndvcnRoIGluc3RhbGxpbmcgaWYgeW91IGRv
bid0IGludGVuZCBjb250cmlidXRpbmcgbXVjaC4NCkluIHRoZSBjYXNlLCB5b3UgY2FuIHVzZSB0
aGUgc2VuZC1lbWFpbCBjb21tYW5kcyBmcm9tIGxvcmUgdG8gc2VuZA0KcmVwbGllcywgZWc6DQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNzM3NDY3ZGUtYzhhOS03NWUwLTNmNzgtYTZhYjA4
NjBhNmU4QG1pY3JvY2hpcC5jb20vI1INCg0KVGhhbmtzLA0KQ29ub3IuDQoNCj4gDQo+IFRoYW5r
cywNCj4gV2VudGluZw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKkZyb206KiBDb25vci5E
b29sZXlAbWljcm9jaGlwLmNvbSA8Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+ICpTZW50
OiogRnJpZGF5LCBKdWx5IDgsIDIwMjIgMTY6MTkNCj4gKlRvOiogemVwaHJheUBvdXRsb29rLmNv
bSA8emVwaHJheUBvdXRsb29rLmNvbT47IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcg
PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+DQo+ICpTdWJqZWN0OiogUmU6IFtQQVRD
SF0gcmlzY3Y6IGFsd2F5cyBob25vciB0aGUgQ09ORklHX0NNRExJTkVfRk9SQ0Ugd2hlbiBwYXJz
aW5nIGR0Yg0KPiDCoA0KPiBIZXkgV2VudGluZywNCj4gSSBzZWUgeW91J3ZlIGp1c3QgQ0MnZWQg
dGhlIGxpc3QgYnV0IG5vdCB0aGUgbWFpbnRhaW5lcnMuDQo+IElmIHlvdSBydW4gZ2V0X21haW50
YWluZXJzIGluIHRoZSBzY3JpcHRzIGRpcmVjdG9yeSwgeW91J2xsIGdldA0KPiBhIGxpc3Qgc3Bh
dCBvdXQgb2YgdGhlIHJpZ2h0IHBlb3BsZSB0byBDQy4NCj4gDQo+IE9uIDA4LzA3LzIwMjIgMjE6
MDksIFdlbnRpbmcgWmhhbmcgd3JvdGU6DQo+PiBXaGVuIENPTkZJR19DTURMSU5FX0ZPUkNFIGlz
IGVuYWJsZWQsIGNtZGxpbmUgcHJvdmlkZWQgYnkNCj4+IENPTkZJR19DTURMSU5FIGFyZSBhbHdh
eXMgdXNlZC4gVGhpcyBhbGxvd3MgQ09ORklHX0NNRExJTkUgdG8gYmUNCj4+IHVzZWQgcmVnYXJk
bGVzcyBvZiB0aGUgcmVzdWx0IG9mIGRldmljZSB0cmVlIHNjYW5uaW5nLg0KPj4gDQo+PiBUaGlz
IGVzcGVjaWFsbHkgZml4ZXMgdGhlIGNhc2Ugd2hlcmUgYSBkZXZpY2UgdHJlZSB3aXRob3V0IHRo
ZQ0KPiANCj4gWW91IG1lbnRpb24gYSBmaXguIERvIHlvdSBrbm93IHdoYXQgY29tbWl0IHRoaXMg
Zml4ZXM/DQo+IA0KPj4gY2hvc2VuIG5vZGUgaXMgc3VwcGxpZWQgdG8gdGhlIGtlcm5lbC4gSW4g
c3VjaCBjYXNlcywNCj4+IGVhcmx5X2luaXRfZHRfc2NhbiB3b3VsZCByZXR1cm4gdHJ1ZS4gQnV0
IGluc2lkZQ0KPj4gZWFybHlfaW5pdF9kdF9zY2FuX2Nob3NlbiwgdGhlIGNtZGxpbmUgd29uJ3Qg
YmUgdXBkYXRlZCBhcyB0aGVyZQ0KPj4gaXMgbm8gY2hvc2VuIG5vZGUgaW4gdGhlIGRldmljZSB0
cmVlLiBBcyBhIHJlc3VsdCwgQ09ORklHX0NNRExJTkUNCj4+IGlzIG5vdCBjb3BpZWQgaW50byBi
b290X2NvbW1hbmRfbGluZSBldmVuIGlmIENPTkZJR19DTURMSU5FX0ZPUkNFDQo+PiBpcyBlbmFi
bGVkLiBUaGlzIGNvbW1pdCBhbGxvd3MgcHJvcGVybHkgdXBkYXRlIGJvb3RfY29tbWFuZF9saW5l
DQo+PiBpbiB0aGlzIHNpdHVhdGlvbi4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogV2VudGluZyBa
aGFuZyA8emVwaHJheUBvdXRsb29rLmNvbT4NCj4+IC0tLQ0KPj7CoCBhcmNoL3Jpc2N2L2tlcm5l
bC9zZXR1cC5jIHwgNSArKy0tLQ0KPj7CoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMNCj4+IGluZGV4IGYwZjM2YTRhMGU5
Yi4uNmU4YWFhMWZmN2M3IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAu
Yw0KPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYw0KPj4gQEAgLTI1MSwxMCArMjUx
LDkgQEAgc3RhdGljIHZvaWQgX19pbml0IHBhcnNlX2R0Yih2b2lkKQ0KPj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2luZm8oIk1hY2hpbmUgbW9kZWw6
ICVzXG4iLCBuYW1lKTsNCj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkdW1wX3N0YWNrX3NldF9hcmNoX2Rlc2MoIiVzIChEVCkiLCBuYW1lKTsNCj4+wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuOw0KPj4gLcKgwqDCoMKgIH0NCj4+ICvCoMKgwqDCoCB9IGVsc2UNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfZXJyKCJObyBEVEIgcGFzc2VkIHRvIHRoZSBrZXJuZWxc
biIpOw0KPiANCj4gUnVubmluZyBvbmUgb2YgdGhlIG90aGVyIHNjcmlwdHMgKGNoZWNrcGF0Y2gu
cGwgd2l0aCB0aGUgLS1zdHJpY3QNCj4gb3B0aW9uKSB3aWxsIGNvbXBsYWluIGFib3V0IHRoaXM6
DQo+IENIRUNLOiBVbmJhbGFuY2VkIGJyYWNlcyBhcm91bmQgZWxzZSBzdGF0ZW1lbnQNCj4gIzQx
OiBGSUxFOiBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jOjI1NDoNCj4gK8KgwqDCoMKgwqDCoCB9
IGVsc2UNCj4gDQo+IFRoYW5rcywNCj4gQ29ub3IuDQo+IA0KPj7CoCANCj4+IC3CoMKgwqDCoCBw
cl9lcnIoIk5vIERUQiBwYXNzZWQgdG8gdGhlIGtlcm5lbFxuIik7DQo+PsKgICNpZmRlZiBDT05G
SUdfQ01ETElORV9GT1JDRQ0KPj7CoMKgwqDCoMKgwqDCoCBzdHJzY3B5KGJvb3RfY29tbWFuZF9s
aW5lLCBDT05GSUdfQ01ETElORSwgQ09NTUFORF9MSU5FX1NJWkUpOw0KPj7CoMKgwqDCoMKgwqDC
oCBwcl9pbmZvKCJGb3JjaW5nIGtlcm5lbCBjb21tYW5kIGxpbmUgdG86ICVzXG4iLCBib290X2Nv
bW1hbmRfbGluZSk7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
