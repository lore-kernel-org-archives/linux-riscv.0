Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDD1C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACkhV+E3zq/l7SJ0RmiUuSzVDrHXNw2jpotu0o+s3+Q=; b=glYmbpszinCoYX
	jylQvRHfb4z8Cp5E+78dv0+K1vGaq6R4ulEJGZ5PaHxMi8JcmuElHnuHLXE64V9KUZmUnPZEGOjba
	N0OIRUIOwRzPjRgq+QBEtgPaZ2S4eVfPaQkrVYKijeNXdjmJx8nUaogZdhlnvqcEYlSvhofoKmoqK
	NKOC6JsEqckYN3CD686qFQ9+teR+l0VoIChPTGlJCKMGZGTSofrbiIwRO+srM+coMNHBuqVmqKMmE
	2CVGf2L7QRyqR1xwxWedpBrcvHTAzSfOcoQvaYRzCv15Ze8RK6+LIf5GDwhoAvhBeOdhwvhijTcem
	PJ1ggzQoznuLhYqjyLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMJn-006mQj-WA; Thu, 08 Sep 2022 18:32:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMJl-006mN5-Bt
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662661921; x=1694197921;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=iCGE4UkVXCojv+vwuckM71kQRFIlGCTeeoGlm9puctE=;
  b=ta01/0YuXNEHJu/5XfRoxFHV26oQlzmk/L80sYu/iKA8v/dV7i6AxNCH
   8Mc9/lj+DObCOQxAFEx3VHdsiOstrXaHDCd303nfPhAfJDaB2d62qC0rF
   CbZ8FuIYeE47Xz8DigLeYwWBFED4cqqef8JmNc48TGxlQKx/yMQ9cMJq8
   Ux4mJ6zYgrZxq/1ycWR4jMps6fv6J4l/0v0yeb12Vle8OlRjMJ8Cegsey
   uQF81yXU48n8YzseoeePUQld+xy7ShGqbghvhq7F/yUw7cIbefWZyCBCs
   Hj2BxI0ORGbMGvsIfZJLXtqc14fy8bM96zGUnn+nlkRgBaMwVGkMFbF/u
   g==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="179621330"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 11:32:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 11:32:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 8 Sep 2022 11:31:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SClFFkQRIIelPKJUySj6YBPzjyvSY4F/5A3fSSi19LdbKr+PytS//60cbrUc1pakBC4s/a1TTq59jWNjc/c7puoD/3XApll8C3KSFDAEkt/Qo85K4oUAG1ilx2OnhOE72zdzU1OJXHNfBtE481rTudU6JTR348YTKYaWd5+OFQ7PdKWi98TXj77/2KjEiPsR1WhOTRHrPCCouCr0fl72NPn+gOPjpGsiYHfLhWt7QxRIKE7GA59S+iD6rVb4YYQgywJRVAA5j+qC5W2XVhKAl1yD1Lzg3vmQG2Wzz7nUzstPPuDT8hU4D37R799o0O4aMqU96feYt9WtpH2+zPjO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCGE4UkVXCojv+vwuckM71kQRFIlGCTeeoGlm9puctE=;
 b=lcr2BUv5W/21XgnTDIE/A/e6SbRWRCcamwad4Vd5EB9A8mda/PGMJz6HbhrKp6W9YEiolzIo/ceLPlQcQURefSYlOfSUJomx+PTB5nklNVIOoIOA4iqvuCnfREcvpJPXdTFhK91zqtjtVYlZG2bRON4QQd2Dn3rY3k+nXN87V15RiYMX4cW+xkDA/jmgj6n7a3tJ1WEK2J4rADP33VngUxBeX9rnJY7Nkxoz7m1LsY+GZ+ArQSW7A7WLAFxWVKsTg0XK+vRwSy/WYC4gDH7FWAGe5gomgG4Z3sBHfscyn6P9Tx76UxLXQ4H49qTtWhZpOR+KiofoO3CJSN9yqgWRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCGE4UkVXCojv+vwuckM71kQRFIlGCTeeoGlm9puctE=;
 b=cH7lguoE1wFmIctCEg8Pwfu8yNFARJWvkNaTs5NsIC3lIew7NuA8XT+42sDAJtaAWg9PYlNIsALK4wAB1rkZeOxyVvk5j16qWhTov2wmqw+Stf6/763rtFQrknpU8r8XzHwW6bK6tT5mKL0avj0M+g/0YR859VGjKW/ysitwYmM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 8 Sep
 2022 18:31:57 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 18:31:57 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] soc: sifive: ccache: define the macro for the
 register shifts
Thread-Topic: [PATCH v3 6/6] soc: sifive: ccache: define the macro for the
 register shifts
Thread-Index: AQHYw5GdQ/sP9VRrjU2tIpDXDsXLg63V22qA
Date: Thu, 8 Sep 2022 18:31:57 +0000
Message-ID: <89e804ff-b451-c56a-a256-d3917e6c34b3@microchip.com>
References: <20220908144424.4232-1-zong.li@sifive.com>
 <20220908144424.4232-7-zong.li@sifive.com>
In-Reply-To: <20220908144424.4232-7-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SA2PR11MB5163:EE_
x-ms-office365-filtering-correlation-id: 6f799483-4715-44ec-c49f-08da91c86986
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2xtvxX8onyCrfTGg0ycus1jGTOAMs8M8QPnMkqCAzqMa8a2jtrasWlrOcy6ilbXhyxkZPkfLCgcet6pNGubdFd7+SrvcNI1RdVnD6deU/Y0W2FTVmbTqHpjoW9+VVc0KGf9FnCmKwOpVN/mQeEmJIT2bcjhdrdTp2rE8Zv7ftXe/lk5U1zHy1agtqNzgr7dFlhgc54WWjxRphJ4GSlrQliQK3vzlsr0rQPbkgu9oDn4KItFKNVAccyxRlWCBnsrZ1u87gUBd1gk4aV2i4yfTSrZ69y+60wF6Rd4xKGid03zH1XoBB3PKQqiwsH3g/ugtodkBjxDb1Ut+UbsCtwms3XYTt5IyQC4p46MkTgcZbvGZ70m0z4VNCyRSVRXM+/Zov1t2OlmTFn5J+vIZG/6TsQSBHKlWvERCnH0Xep0F2IpAp2FZdPdE/czYA6dt7yxBgLlofC77HU33QD3kngw4eddsC+vJfjAgCZpto6iL/W0JbGoM2WZBhXzvQeP7Yd21jRtNjrmYrkFTtycPyr+YMU0zpMFPN1qkAU/eB1xUWWEuza6iuxF8C+7opO1QSpnf+ppBPsIONi/etglqcmsiep85F4RmS7Wb+1VYiB64OS1GirycOB3deGCk0ZJw38gDuaCV87hAHCLFPRqWg7Ro9ahfRP91HQHKpj2rYHGu8A5dCpDYI5nfKAjw3VZhRdq8ty7KO1iOjN8S4x5+qrjRRBRopjW7qxey7amGMAzP8kv4T694e1bVvyX0LEiy5wLFU82PTs/64KCTUyzSJGJhA8k7HNzZ8YOKubkZdZSEB5kU8DAm/W/z7+F3jUOHRZCBC9tfnuoUaQmkvFFiAEgpss+K96zQQe1uVEwutRRJJTU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(396003)(366004)(346002)(6512007)(36756003)(66946007)(8676002)(91956017)(66556008)(76116006)(66446008)(31696002)(86362001)(921005)(316002)(64756008)(41300700001)(38070700005)(53546011)(83380400001)(6506007)(38100700002)(110136005)(26005)(186003)(508600001)(66476007)(122000001)(71200400001)(8936002)(2906002)(7416002)(31686004)(6486002)(5660300002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vm1pbjZNdzVGMXBIWE9ZTDFqKzB1dFRTVFNjbmlCdlRHTU5QaWpWaVpYS3lt?=
 =?utf-8?B?dUZhbmVaYXVKM2xzSENhTFdiVk9IUlBBMUoyK2U2Um04NnlHMktITlJ1UVl2?=
 =?utf-8?B?RWhWN0ZXSUZYRVRUNVMzSXgzUE5UK3UwRGhiOTdiRGlpWS9YeWhzQWpCUjN5?=
 =?utf-8?B?Q1U2aGZWSkljRVpSbUIvbzUwZlViVGcrS2Nrc210SG5MWXJEbG9RUndWcXhF?=
 =?utf-8?B?Vk9XcktEaVlXWHFKZXREVUdNTFpLU0R1Y2tiVmIzOGNLU2Q5NEZWajZXa0hV?=
 =?utf-8?B?L0RPV1FwZ0FIaEJIY3ZTWnp3QzYydlpIbm95K0UxdWF5L2VNM3g5cXhObXZx?=
 =?utf-8?B?NEVlQndSZitHT0JmK1BOS09DN3FxNjl6NGJMcFViRU9zTzZHeDB4bm11c2U4?=
 =?utf-8?B?Y2tGTCtLSUYrVUNSdXhxaTk4WjB0RGgycUtyWGdCRUlaNmIwRGwxS3NLejNM?=
 =?utf-8?B?RjlHQlVVTUEyTnJFYXZqZWs1WkVTbTVCMjEzaW1lcWtyWi9GcTBYTWhQWE1y?=
 =?utf-8?B?b1lOQ215U0RZOFdvMmdpSGtpdDBOS005NVJ2bFVKTmIybnJ6eW8rcHJTaG8x?=
 =?utf-8?B?WlNLbmJNRWlRQlRzemZnU1FZOWRPK1FjUXVZOG5UdTJwZzhuMFBKWk1hQUky?=
 =?utf-8?B?dDJOMGo4TXhpOSs2U1lWa0k2Z3RHZXN1WHRXemZpR0VHdkdDZFZoYmpJMWVY?=
 =?utf-8?B?d0ViWkFNaXBYTVZaT2tvOExHZWtGcEdjRzhPWHh4cTAxMjVvaHNkUW5oY3pt?=
 =?utf-8?B?MkZ5YWNzb2h4dmxodWtaVmFJUGFXQ3lQZTZteEZDVzZMeGxsMGJFMStYOW9o?=
 =?utf-8?B?WnVGRzdvZEo3UDdWVDlTSHlNaXJYSW1hSzQzd20xSFNSQmpjMjlIWmVmR2Zm?=
 =?utf-8?B?YWtwTDR2K050QjhiU0FuNExoMWJ3ZW5WL1pyNVVrQUlZSU05OEdKcENFWTVk?=
 =?utf-8?B?ZmNWTC9jSkU2RWVWdHFubFpEWkwwOUllS0NhV1NmSnN6cE55cklzMFcxSGhT?=
 =?utf-8?B?NiszdHcxOW11Y3dqN0NvUGs1bVQxaEdpQ0VwSUNDMUVMRHMvQXNXT2R1THRR?=
 =?utf-8?B?eGJBeFRZTERFcTVOOFZibHdWSkgvNlZSMVhOcGFuUHg4bVU1WnlNWkR4TlU4?=
 =?utf-8?B?aEwxZ3BHTEJlM1MycUhlN2xvMDBzRHpRTHdrL3NWODF6dmRmUEkrUXpwZExL?=
 =?utf-8?B?QWZ3QXZjRGdmM1N2ejJ5SHBjVVVURG82M2VKVXlUeEF5ZFo3L2lrc2dIbVAr?=
 =?utf-8?B?QmdNZ3J4Y1hEcFVsUjdCUWZJemQ2NFIvT3FRTjhUcXg5WmcrcG9OVXFaQUhu?=
 =?utf-8?B?S0RkQmhPMUo5VlZwU1hKdDJGejdNV01NU0RadUQxdVVSYTBsZUdkT25WVWJD?=
 =?utf-8?B?bVVQdGkvTnd0RUJjT1VGcVRRUit5elcyYTZhcUYzZC9EaTZCWmR6Z0lJNnVM?=
 =?utf-8?B?bWg1azFrSUgwbEpvMEN6eitVU2FBOUgyTnlvZmtCVis5Z0NWYjFFQzhzU1hn?=
 =?utf-8?B?ZHFMS3FmcFAxTmVtc3FndXNxcWh3bDZPdis5WEFrNG01R0JGK09tV3Q4QitK?=
 =?utf-8?B?UUw3Q3R5VUc0Zm9hTjFQT1JlSW9ub3p4dUVXUW5JZTlNYzJWZnNSUncrMkln?=
 =?utf-8?B?NVRUM1h6Z3lKNUU5ZS9EdWlMQjRER0taLzlrOEs3WmJzQy9zdDNEbXhYTFlG?=
 =?utf-8?B?M0Q5Z3YrVWMzMHRQK2FsbGNTKzhtSTJZS255bFlScFc4cWdpenNvbFdTTWR3?=
 =?utf-8?B?ZmRaVC9EbEExaFlnNkQ3czh6VUpkNVNDc2dUSDZVRFVUbFBtQ2RDcVFHbjVF?=
 =?utf-8?B?SzIvLzdhWDZ2Sm9DZVFQNEFVOEdralhPalk5bEMzQ3FxUmliZ1BVVlh3VkJT?=
 =?utf-8?B?QUQ1MlhwQ3NkRVQ3Q011b0JYK2Q2UjZwdTVDekdzWWpqaEQvZEZJaU12TmxO?=
 =?utf-8?B?QjE4dG9mcTFIUFVCYXlscEhEb01yZmtzaDgyY3pEeERoc0lvdU4rM3RmZzBz?=
 =?utf-8?B?N3BPM0hMQlh5K1hJTUMxVityLzVVRStza29FMHh2eEs5WFJDQzgzMkx1ZnVR?=
 =?utf-8?B?eXAwWDRkMHROMGZxb0JPYVRFSFYvZmZRYm13R0VRUXZPOEpBbTZUNVVnaHFn?=
 =?utf-8?B?NkRTc1JHbXRrdk9IUUtyR2NKMDl5Zld1SFI1RkljOVhlNEttN2FMZE1kclVU?=
 =?utf-8?B?SVE9PQ==?=
Content-ID: <8A7469996A794C4589C40870C4EF8BCF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f799483-4715-44ec-c49f-08da91c86986
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 18:31:57.5960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoAAAGr1LClYkfV1ojcQu7bhPX2icBDDHtGbMlIu5liZHe475jXldfp0OAWXKgYJDPvdEqQKBTur/NnvSAhnRdn0o7l/JYdoUmgZCZjKIE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_113201_433434_9F097952 
X-CRM114-Status: GOOD (  15.53  )
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

On 08/09/2022 15:44, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Define the macro for the register shifts, it could make the code be
> more readable
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>

Ahh my bad, I didn't realise you split it into another patch - sorry.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  drivers/soc/sifive/sifive_ccache.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index b3929c4d6d5b..0ddcc657c694 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_address.h>
>  #include <linux/device.h>
> +#include <linux/bitfield.h>
>  #include <asm/cacheinfo.h>
>  #include <soc/sifive/sifive_ccache.h>
> 
> @@ -33,6 +34,11 @@
>  #define SIFIVE_CCACHE_DATECCFAIL_COUNT 0x168
> 
>  #define SIFIVE_CCACHE_CONFIG 0x00
> +#define SIFIVE_CCACHE_CONFIG_BANK_MASK GENMASK_ULL(7, 0)
> +#define SIFIVE_CCACHE_CONFIG_WAYS_MASK GENMASK_ULL(15, 8)
> +#define SIFIVE_CCACHE_CONFIG_SETS_MASK GENMASK_ULL(23, 16)
> +#define SIFIVE_CCACHE_CONFIG_BLKS_MASK GENMASK_ULL(31, 24)
> +
>  #define SIFIVE_CCACHE_WAYENABLE 0x08
>  #define SIFIVE_CCACHE_ECCINJECTERR 0x40
> 
> @@ -87,11 +93,11 @@ static void ccache_config_read(void)
>         u32 cfg;
> 
>         cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> -
> -       pr_info("%u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
> -               (cfg & 0xff), (cfg >> 8) & 0xff,
> -               BIT_ULL((cfg >> 16) & 0xff),
> -               BIT_ULL((cfg >> 24) & 0xff));
> +       pr_info("%llu banks, %llu ways, sets/bank=%llu, bytes/block=%llu\n",
> +               FIELD_GET(SIFIVE_CCACHE_CONFIG_BANK_MASK, cfg),
> +               FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, cfg),
> +               BIT_ULL(FIELD_GET(SIFIVE_CCACHE_CONFIG_SETS_MASK, cfg)),
> +               BIT_ULL(FIELD_GET(SIFIVE_CCACHE_CONFIG_BLKS_MASK, cfg)));
> 
>         cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
>         pr_info("Index of the largest way enabled: %u\n", cfg);
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
