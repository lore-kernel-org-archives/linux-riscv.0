Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B113C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olRGpIPAsVgJKL91ZlNXLbgDNx7StZGfjiRzTggRFWc=; b=iOqY/zBx0W0axO
	5VkEzoWmopp9/JIEMdRxwFWeHnngw0kfveZM+nZtbJ69cndaUClKJI6Y8Msw3Ykj2Ro2Ll2050xjb
	rHsXuoq4Ieh/v/Ug9gciDs8qq31aU6H4WvXKOq2YFcJ4w4vCStorqI9CFLQM4kixUfPIe1ShRFCCk
	UC+GWWDDeaW+7DpupVxhjjIglv1QZYsN+xgxUhuTdwR5Gyaop37C+B0MyMLDGko6mKqh72JDaL3q8
	Jo+86v/LHnhPYUzAxgZJspaY78qa+y73e+iEAIfi+eu5F6s50ZvsS0VvKMU/8GiQcd9sUJGfvD4BS
	3lj9OVNb0pdRkTv62aow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBerL-005Qzg-B3; Wed, 13 Jul 2022 16:05:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBer7-005QrO-Vd; Wed, 13 Jul 2022 16:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657728294; x=1689264294;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kQcy4xpVZZ58iJdJY0UQUyxq4snYTpgBS7Dq+aj7JOk=;
  b=OUkbhvKlBcw0l+H7BfXawPOwh72wNaHFE8gXpbekAwE64HhThQuQSpyn
   PdOUgf2i1ckCEZVxMjH2eXmYTj9C1d+raOa53YpmbJ3hMHW76IrhCbJip
   Ah6fAzMCs7fyyFZKDdR+ObElB9r0v0fxNCyZ7GAsd63YPfCbOiCsS/HYD
   aoCBoOB+RLQUSQkspijhTyXNGsNCi+RV03tHAYqFEG0jRrsCOGows/Dz3
   KOaYd7lhJWX6cOD5t6xqvqy8GaLw0WIDmCDxMptLnvR5M4e+w3xVUPh4n
   mMb/BG8ESQC9D2SHhm+yHuMJYxwTCBHYtWRPZxnfWum2fAYvTFVj6aBLq
   A==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="164582822"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 09:04:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 09:04:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 09:04:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWox2Si+ZkOJT7XOMSavT/udMzhWTGXKI+z0bYC1coH2nS1p3uxqUaylToVaQDfgvvEXhtkkMX9uUKF2Xn+gAZgF4oc1sAybCDYA8Z8o7JX/UdvFd2Q0srzZwB+ygQQ5yRRK+s2aaQGl0eUsmgki7pJgS3y9NL/bllw+Y9EJvzSgoIUbvL8bSl7yWT1cUX+j2EeLUz7S5wxfbj0CvSLOGARYstqfsXqOA82ax1L5+LQ5nSyQz+Hga/NKMmzsrBfEjNs+GzmB/96QwmTPBBLrlrYeQQIht0I0POhycpdT48HIMcPdsa6bX5CmPjLfEeIGkqE8MmANo1w3dgjKAh+uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQcy4xpVZZ58iJdJY0UQUyxq4snYTpgBS7Dq+aj7JOk=;
 b=jPrf0DH6UZYAX8FnFJk8H8ASf4ayadgQAiPWlony//ufdCR0o95Re8fVtx78WaV7p3BFfOT/uSmupUpkt1nNyL9uUru/OFDXt87BpSbc9pzIMstwB6QsfXhqRjP02m8GhWHRUh5vOIxxAftHCVvrSz4p9fhw62LHf/aqdm3ORTFzch3ImdC3p4PWjjgtfFGZDOIahYoYYQ/aoLLExgp0UAkmbGqvgnqsA2S7Izkf8nfudO5YgKMEKneSinBPkTKa0VTBgTbyNHQEHZvfYkxv6mNL89xPMGeiCKfPxyacKoimtXBT4S19gESZt7lkmET0vay24j3IdH6nnKzEU00s6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQcy4xpVZZ58iJdJY0UQUyxq4snYTpgBS7Dq+aj7JOk=;
 b=uxAwwlBtX1/ogwPdqq6JaAhM26vCRfVBYyowg5YQY1+REzwD00sTYfNQhvRYWvcPdRhRiqNCqpU2A8xPubouIfvDsGvW1tZ7o50aw/utXHOwmoB8dhrUD091/Q14NL3RTKqVV7MMj+fcseMl3JlaaJkrMSpvGzqQpW3UvnahqW4=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Wed, 13 Jul
 2022 16:04:39 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 16:04:39 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <ionela.voinescu@arm.com>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Topic: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Index: AQHYlr1LjktvAhTwm0O5ibr9nGIi2q18dweA
Date: Wed, 13 Jul 2022 16:04:39 +0000
Message-ID: <56f0c3a4-74cd-098a-7bdb-88480be366c2@microchip.com>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
In-Reply-To: <20220713133344.1201247-1-sudeep.holla@arm.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a2710c0-4e98-42dc-7b30-08da64e96406
x-ms-traffictypediagnostic: CO1PR11MB4899:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OeGa0DqeKO065M+dCnN425h/w7Ky+tM978neFBkUD6+O8kkb6Va5cvpiM5JVyCTfREeHQXYZZZ2f49e3iiPRqscXl+p/EJvhTekoDTgBSjNQp9es7wsVtgQgoGEESWcmxOu6kJxmQd6zIyUYo+uTLsljsM513otncTcXxGrqUUuWDBHFKXYCQMEHAZRcR/cHw4alZHAnRNAlooHHoT0IVTeCwWScRjw1xl9SHZVh6PLIIStKqLvb+JB/lnqbQD7Pq1GwyZxV4PHL0gtHdAwUHLAZYlUuQ3ERoOqJzbsBUm9X/249CnFnDxnwhV0E7T4pDE2vKaQJ72Xqbms6E4JVLWrVdU0cbbpFVGUlWK9bvnlmpWdObuheJ6EBi0LJi1lMEFWS7tpWXfXQ+ZvgYDAildvwzBnaGzaVJMXZ6NFg4GJnWrtmA+ZA//P7cx41usVyHZ1g5iWLeVle4KbGTPkXW2CQmga9MpmAPvK8ZRU1PSYWqnemEECoxkUAQ3x/6XXL2ci1UXuGNTt5+ZQhZ3p8oy7I1tsgh00yfx4sfbPJayR/9WxjGngn/rFpxzfk4GiTWazBnQpvLxA+vbTwGy2KDa1oE7kVrRybmVN5Ktxbdn2uwLEd7xFUrBrqphzu28eXTlrJihmS6h6F6DtVumZLFV6SCi0/OnVu1e6kG44X87FwFTYS/QyRMTtUbQU6WXjdIWiR/P+JnWa1fuYeT8c324esiPQVQFEhYx6wJfRTykJA+ZGpxjhsdLV76HgN5qhwvXHIVL96GkECGeJgDzK9H6LGomF51X5IDNDGDtD7Tp0Bt/4XOEBXbV8wke8vf487ZPooMMnSXz9wyAoJc6XwmzTVyvS/Zbh4yvQ/txG2YaQNhQZoQQxCWBG6Mo1fGXw7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(396003)(366004)(376002)(53546011)(64756008)(66446008)(41300700001)(66556008)(6506007)(26005)(6512007)(66946007)(66476007)(76116006)(6486002)(316002)(5660300002)(54906003)(86362001)(478600001)(110136005)(91956017)(71200400001)(31696002)(122000001)(38100700002)(38070700005)(2616005)(83380400001)(8676002)(31686004)(8936002)(2906002)(36756003)(186003)(4744005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG8vOFZ5SGo4aWE2S0dIS1JlWEkwL3J0ZDlvT1V0R1piQVVLSkwwSzZISll2?=
 =?utf-8?B?YkJRbFZyMm56SmdUaHJGNzBaM1BxMnpWMFRhOTZoMFprc1V6YUx4VUN0dVR4?=
 =?utf-8?B?MlNSU0ZTK0luREpZNkoyVU0rbDNnZmFpVVVGOVVLanJJSDNUMTRTcG50NTZo?=
 =?utf-8?B?ekxYTWtidURDM1E5R20rWUtmVjNobjlBR0RRTE85QVFmTzk3U3NCbDlkMjhm?=
 =?utf-8?B?Q0FvbWVzSG9WNzVzUTB5TjlsRGxuWWlsc3RJdzdtaUQ0WjlaNnFEMURWRlY1?=
 =?utf-8?B?aHlhaWxoWDRDazNSZFdqQ0FUNXAramJkUG1IM1hjc2FYNWFtb3I1MTRSU2xT?=
 =?utf-8?B?Tm9RbGptNlJBM2toYUE4SE5LQkNEejRlSEpGeFQ0S0FFeStyWUpEdlVvTG85?=
 =?utf-8?B?QTVEamxwejJrcnZ0SDNHbnE5SUMwV3N4MDBJcVVrM1k5L0lMcFpqV0Zpa1p4?=
 =?utf-8?B?dlB4TlQ0YmErOUZPVExqUUNZVFhvMkZlMWtBV1BZdU9pTXE5b3l6UElFL2NB?=
 =?utf-8?B?NzQrT1EyV0ZjcVBwQnFqdXcvMERCUExOODJzN2drQnE5NzdoYWxZc29jbnlX?=
 =?utf-8?B?d0J1aExsb1BON3IxUGtMOTJCa3Jnd3NaaVcyeFVBVnErVmpFZFV5emQ4M3lO?=
 =?utf-8?B?S3VsMFlPYmc2Y1o3dmxmOWZuK3FzckljZ1VZWU1RMXVmaGJuRXNacE5ybUF1?=
 =?utf-8?B?NUNOd0xNYytDdC9paExRM2lkdmV2eDRzUXJCcFVUQ2ZGem1qc0dBREdDbnlw?=
 =?utf-8?B?bEtnZjFkOVpxeW0wTzc5SWtzaWhwb1QvVFU5U0E0cEFQR1kveitRbkJ1OVk1?=
 =?utf-8?B?QUxmakozRHAyN3F0ckRPRy9qNVgvK2ZkUi9TclZSS0tpK01uY05RSVNkWDJ6?=
 =?utf-8?B?blV6b0ZNUTZXSkpFZlNEYVl1WDdWZkEyOCt3RmoyUzFtMnU2TmNFQUZxNVZo?=
 =?utf-8?B?c0pEdE9RODc0bDRIR2hDZjE2TldhYXYxVnV2cFRESjJRWC8wanpGQW5rNjFR?=
 =?utf-8?B?M001SHVHL1hCbDNtWHZLaVZ2RVdYSExMOHQ2TnhIZWd5WENSbThhL3Q2dk5I?=
 =?utf-8?B?L0k3UnlNOENlSE9VczlWOWJUREdIQnlPb1hEdkM1N20rOUpmQjJCOGhSYWd3?=
 =?utf-8?B?Wmt3RUdqYmsxZVhPR0NxYk90SHJ1THczNWk0ekZsMHVQTS8xQnRhU1RaSGQr?=
 =?utf-8?B?TUlDRm41TUc3RGMrLzIyOXZ2NENraE5jRE5pR0hwRlVXN2s5WVgwNmFZMWhH?=
 =?utf-8?B?Rm5yaHAzZkRxSFpmYVRxNnZKWm9yMVlLTkxXNlVoZ2ZXV1BLRnFjdGx3aHp1?=
 =?utf-8?B?OTloQVJuMlMxc1hiaHlrUzA1Vm9SVmNEbElYSnVYMjdaUzlVWXFzSjViMUVB?=
 =?utf-8?B?azhDMUtuY2M1c1RHUTRVaSt1UXNSeVlyNEtKd2Vtdmt3TEFocXNFT2VzNEdi?=
 =?utf-8?B?Y1p6L2NITDRNRE93dlJiOGp3NmVWMEFQaGRlcDJoeUVZT3IvZGRIZk1UVXV5?=
 =?utf-8?B?T21DdG84NG9oR0xlTWdaZURiS0JVcUVsY2JERDNGQUo0dVBHT29YL1FObWVp?=
 =?utf-8?B?NEZZZGI0TGg3N1dsaDJvUHpMMTdGeGFrR0paTE1YYnFiaFZOOTI4OU1kaFBt?=
 =?utf-8?B?Ym9VNG5DVkZGTTlEVVRySmR0ek1MQmZ0WGZQWGRpY0hTb0NWVEp5cnRZZWlR?=
 =?utf-8?B?cXpVNDF0bVdNTk1BT1A1YS9vdExocUNjTWNVRG5ZdSttRFVYejJaOC9JRDh6?=
 =?utf-8?B?RzZnQUp0eXpLdEROa3J5MFRFWnI3RjZhdk1McVd5ZFBtbkpaSFBxT1drTzVy?=
 =?utf-8?B?Z2x6NTZCOS9TQ0duSU9IZFFBUTc2YVp5ZytzSCtqWGttbzFxdmF5RlZ1V2Z0?=
 =?utf-8?B?dXlzUnpEUW5XUlFWSHNjbW4wMi9RMk5qWXdILzNOUVIxZHRpWjlaNUdNSTB0?=
 =?utf-8?B?aFJRdjhqUTYzV0xuSVluK0ZiS2FnTnpVdGVMRVFxVEJPOXZwSFhvenZ4UFlH?=
 =?utf-8?B?WDhTeXZhSGRNaXRzOEVDMDh3TVplSDdWNlVaV0pUZUtwTnhrc1dCYWNoMW9l?=
 =?utf-8?B?bExEL0hxWU1qVU9GT0NOTytQTUUyZmpQNTZuenc3TEF3ZDF4UFFJb2F5UzhI?=
 =?utf-8?B?RS96dUxzV2R2c090TWdXeHV3cG1jcytlN21xOUI2UlgxODNXcUQ3QUR1eSty?=
 =?utf-8?B?M3c9PQ==?=
Content-ID: <15ED19A8C79F514AB52DE4B0B0DA1067@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2710c0-4e98-42dc-7b30-08da64e96406
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 16:04:39.4338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVHDccOhiWzVGjfn9Cw+PNsI9VI+uOnjwBAMS0/i+lNk4MxgcWNWHq3N4Eb6pbO7aqIje3Y2inPpTiPSWXh1JoPqWqkckCTso8Wtpp9MMOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_090454_116743_F8B3277F 
X-CRM114-Status: GOOD (  15.62  )
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

On 13/07/2022 14:33, Sudeep Holla wrote:
> Hi Conor,
> 
> Ionela reported an issue with the CPU hotplug and as a fix I need to
> move the call to detect_cache_attributes() which I had thought to keep
> it there from first but for no reason had moved it to init_cpu_topology().
> 
> Wonder if this fixes the -ENOMEM on RISC-V as this one is called on the
> cpu in the secondary CPUs init path while init_cpu_topology executed
> detect_cache_attributes() for all possible CPUs much earlier. I think
> this might help as the percpu memory might be initialised in this case.
> 
> Anyways give this a try, also test the CPU hotplug and check if nothing
> is broken on RISC-V. We noticed this bug only on one platform while

Coll, will give it a go tomorrow probably. I have a swiotlb issue that's
broken my boot to find first :/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
