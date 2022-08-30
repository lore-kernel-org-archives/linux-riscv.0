Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D65DC0502F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RSjP47NE+XgQBP8Bi6pUbt3kNyNm8hhlogRNUbmtMY=; b=gvLNQqg2pNPxX0
	94s128U+6/2i8gWrT7ozZW6bq+ATcrwxra1ZYckO3deOklaMMAp2SQaSEqtRXb06KCgyNAivYLfVC
	og8KDXML3l0SEaxlHSbkLtPfxBUT5Llz2hY0FfjWQcDEJGB9jSZsL5lBlwBJXV8sOMyHJcd4XzlEb
	GA8SblEDuV00ULV0xc+pUbXER6SuIP4+n7PfavRfJY1jXZsjUPbKwGLzg53+OWDickXO666xgaTw7
	67AxXUOtMO0q12KdekKxUG0VQG0rScdRW8nxX3fW5VxVI4Y8bV6py11vlBPzL2aq7pgFIT+zkDGxZ
	FP8SA65CVNcuCyUjbScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwer-00FEZW-Iv; Tue, 30 Aug 2022 08:31:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwen-00FEX8-9L
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 08:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661848297; x=1693384297;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=+9w0toKn/A4t9X8QnuQ46DslQ1IxFeKO2iNJs2Caw5U=;
  b=PYkJKDeIhKw7wjXovLDu/27C+9M5pIJoKzBVuzUd9JAX2DYV6+UpLW+B
   W9jbc+JxToFpS9/BDVOeA6HFucNgYh2FweOE+W7+kp5ch/Nh9pI7Evjf9
   hGwF1Jug10D/C35uKhd8q0mWROgAMWAcdwrhjATD1v+c6xNk463FZVnB5
   2NyHEmmEN4eBkP4dhBvhTUIN+mUbSuQfnxwbBux3ySyJbWwmLa8ZibAQ1
   PLbjaWHpxgvdgQf6LhU7az1jN0bIGe/FB/g5fMiXAvd/mUNX9EcE41XjE
   NGfHWpgHg8CnZ2kmOoETZ0pIkBdU4vsncsjkcVQKkE/rDIERa0EbhU0s/
   A==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="174771602"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 01:31:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 01:31:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 01:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIqCb4wyzWWMHIk/HUx6hpOFaZtxh4Hp1Zi4HUc5OAobggCY+oMiLztDlakO1YLCn1HceBxPmwxsIH/wfWJR/FScV9NI27ieTrgBVQb6u5bAnrZG7ORPJK+F3N0vbyD86IuBvig4N+6Yg2IS1kvtb7nGKtSuLaCB0P726gdebSYlwx7Bz2HgWcbvH9bP/Voxz2lYeDLcBFfFEp8sAtdvtgGMXpqp3SeYYCmgYK7jP+UT9Tk54HUksXcKDR+LjzNOOtEIGVkG1V1iF79OCHpzHAM7GDojn1qj7vpdh+DMT3oZoi5ZoymYiQSmHhXyexX13tkrhY0yUze++ITXHyj8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9w0toKn/A4t9X8QnuQ46DslQ1IxFeKO2iNJs2Caw5U=;
 b=EBGtfCvVpuY4NzD3sy3/tP8CX3sLrvqweZtRfv2B/7wPkMBrqnSQ1vpiTIF+MYrORVUIezEc5Ec8c6CUW0QzJndxM9WSHm+faO5HCxLfWjkNlN8Y41WeGySmpKpnmz9fhzJhJdESQ5VkRUqwwBHZMLg207SWQZZ2+A0uttlUTpGq0aqePD71o5QFfbyCL5tlk7ThGn65lHe4pE4MI1s0s4ztjnRDofyzIFwkpvvJQ+8i3KlWAoIXyBIrqYq4BHALpcU7SspSjbWL22QEHysEv9hwvXvjYvXYHvRpwd6mKD3JPo5uzoRnI1ybXTm2HlAS5sh3EhwCvnPKr71XwTE9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9w0toKn/A4t9X8QnuQ46DslQ1IxFeKO2iNJs2Caw5U=;
 b=hXI7eH0tIpSkrJJNeLH1tPgRcXlQCyrw9iF7H9iO2PBva2QvN9Tif0YcIrth41haOiEN7UUZ1wDXcqw7tEozfRBSNySfMMvKWA/o8O5CXduZjAidyFIFFoIOO8+QifY/C9rvAt6wvGZMxXIuGQydo2HW3F8A0SMMIp0hF7ISLV8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1753.namprd11.prod.outlook.com (2603:10b6:3:10d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Tue, 30 Aug
 2022 08:31:32 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 08:31:32 +0000
From: <Conor.Dooley@microchip.com>
To: <vladimir.isaev@syntacore.com>, <linux-arch@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Fix permissions for all mm's during mm init
Thread-Topic: [PATCH] riscv: Fix permissions for all mm's during mm init
Thread-Index: AQHYvEa/ZCOQkPuwK0CORJxDg4lnra3HGj2AgAAC8oA=
Date: Tue, 30 Aug 2022 08:31:32 +0000
Message-ID: <6e0aee65-37f4-ffa5-9adc-039ff3085b07@microchip.com>
References: <20220830075900.510105-1-vladimir.isaev@syntacore.com>
 <26ec07d5-14ac-f77c-00a7-23ea77ebeef6@microchip.com>
In-Reply-To: <26ec07d5-14ac-f77c-00a7-23ea77ebeef6@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 319dd300-485c-46c6-37fd-08da8a620b5b
x-ms-traffictypediagnostic: DM5PR11MB1753:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S9Lu2sPYDfYUVnaiuWK0aGO5JfxsesmhGcaLHKrWUNHz8Ex7Nckwvlmfysn3NuVCeRuRJ+yDhTxaLOoNtwcx06PSG/LJ+GAYTJE6mXdqN9ZxCx2pcQLznPB7sTwE3dCMtQzWoDLfITEyJA6NONvBeZMeQs8ERCinLIxU/XCGZvqJOndwwbSCprOE1VljghMoJ6TERPaqU+4vIUwPjaJaLDgRHWfNRG0vLA01kmUdblZmN+bt+tIJbTZ9MguVFddpGank8hY6F8e/AHTaQ09izB8iSnboelN9Fbf5/qWJzdaWtMfvLdpqcsO1seL3OqAyxrFYAHBLoH8XX+rRABnTwj6UpQHzy6hAwKy/SrCG7c8Bnuoi37sBSA4lstUAP+GNjF9lJahDyzbOgqXRHCe5BvzjKZso+mYjDFaJIHvIIi2sAxL+8ryVLhsY4ablh7hiTf31vRZAxmclbgudbIba+2wYDigZjDLJfK8/SdQWN5z1YbephNOf0y11L/KoZxAbOq+6jZNCH9G6nPFGg4Rh5fjuU9Mp3N6bPydNamu+e355lOdb0AgjFrU7GjE22McHu2hL5SwPsYwFZMyC9+yk8pvWOKkLeFyECtL+y86JzTGdWkRt4At6YDStCwLqivZaZQxuEEOPuUn7NG0hGwjpqKvHy1HG1wMKCBmXCiqxZspTiIkEg3QJNYIfXWjMB0mCWfzAiXYNE1X7QQUCpVLAKJR0vd3o/gjl7wUlMiIylElbt8HTj3HpbOIYwRYR5uJr4Y5/7QAov/Gi28WzQ3Uwb2WC7OwzKsMhpWYVldxj/VYJ7DCQcDR9Ww83slkfAHSmYr+b/AmVHMQoYvAOPZd3PQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(366004)(136003)(346002)(86362001)(6486002)(53546011)(26005)(31696002)(71200400001)(478600001)(6506007)(966005)(41300700001)(6512007)(186003)(83380400001)(38100700002)(122000001)(38070700005)(2616005)(76116006)(64756008)(66446008)(110136005)(66556008)(8936002)(5660300002)(8676002)(91956017)(66476007)(66946007)(31686004)(316002)(45080400002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0R6d1A5VXlXQVcrbE1vUlJYSkp4dnJWbU4xL1k4emd4TlFHL2JXUGUrY0lx?=
 =?utf-8?B?aWZJL3drZDMwaXVZeUxqdmNPSkR2Q2xSR2RSNEZPdnBzcU1tcDNYWlVWMG1r?=
 =?utf-8?B?SVNXTnJUSUxEdjBIMjJOamI1NTZlN1ZubGN1QVNPZU9vUmlEVUlOUXc2V1NY?=
 =?utf-8?B?S1lLcjltVzIrek1GRG9JT01lVnYzU1I2TS9veVNIS0p2dExLNzQrTStHT25R?=
 =?utf-8?B?WXZSdEYzVkVIUlgybWFhUit2N3FFcVFVa212Nzd0U1RlWjAyVFR3M3FDUFhE?=
 =?utf-8?B?SzZwY1BQSzNHWTZxMnhLd3FaQlFFOEVrUGJ6NWp6RDNQUTlNVG11V01MU09I?=
 =?utf-8?B?aE5qVktzUFRMWVRmTnpMTk1USTNMK1NXY29sYS9peFNoMDcwTER1NThJR3ow?=
 =?utf-8?B?S29WK0RJSm1lb3d4NzIxRTc2ZUkxL0lSeE9FUUhWOHIxUUVVSnN2NC9XbnNU?=
 =?utf-8?B?WDdPWGhqZk81UUhXbHpKT3lBRFpjWjBIU2lVVm0wbG82Q3RORUtwOFIrTEJx?=
 =?utf-8?B?bldnM1o5WXZhQ1N6ZFR5REwyOW5rYTFnaEE2R001YkFyZVVPaCtGL0Q3RHFY?=
 =?utf-8?B?bjluR3dHeFh1ZzJOaUJwWVViNmJmUEZ1SXYvbGk3MUU5ZXBlWjdBcC9UTmVo?=
 =?utf-8?B?NmZMOWVQM01ZUktoT3dGREQ4bHpiWVJnSUJ2UWxXUk1pSDJrUkwvVWo2K3BR?=
 =?utf-8?B?dDRZeWZvUlZDUCtIZVZ1dlFjYjhRT1JRMDFEbG5nUHVlZ0lNTzkweXpHeHY1?=
 =?utf-8?B?VUptS1A2K0ZaVy9WN3J3cXYzZkFnZ1JkVzBKZzJaNTZKQmtvOWhTbVJBdnJo?=
 =?utf-8?B?b2Q0akpUc1EvZm9yTTU1cHA5dHRucVU5SGpEMWlUaUVZV2Y0VmFxbUZEbmc0?=
 =?utf-8?B?UHIxYUpoQUFvdzNPSG9ZVjlYWVFNdjEvbXpjRVZFNS8yTWxRQVhNTUY1MU1D?=
 =?utf-8?B?VzQzcndXbkFHUW1jdUpKdUs2RWZlOU90S0VhRHNxZGIycmdEMEV5bTZ2YVJJ?=
 =?utf-8?B?TUVpakJjUDJyUzM5aHd6OVc1SGFlWXdoYndwN0ViZVFsSmVQalpJZVhhREt6?=
 =?utf-8?B?d2FQRFA2YjRtaXYrS25RUUF3WlU2emhkU0xOZnZLTDVJb2FTVlBKTVlhNFh5?=
 =?utf-8?B?YUZEODcvaE9pN3VobU96cERhbVVkTFNtdUZ5elRQRGpRbnNNOHgxR1V4MWUx?=
 =?utf-8?B?MWs1Z2JRRVcvQWR4WVkzaEl6VGptRjNRL2VEaGNCZG1SeEEzZU53YmdBZ0xB?=
 =?utf-8?B?SmF1cDdpOUp0SnhVYUVXeUN5RFdBTklRU0hNV2ZxaXJvYXpoelhjNWhzTllk?=
 =?utf-8?B?ODM4QVl3QlQ2R09HS2p5WlJZVmlGd0c0R2llbjZsZGdMYmRaemhScTVQRmE1?=
 =?utf-8?B?UG9ucU4vUmVjMDdhU2VWRTBOcU5JOWRRLzh1T0RHcjkvRTdXa1dLeTRXNEIy?=
 =?utf-8?B?Ym9BOWVoTzF4R3ZrN1RhK1d1SUFsUVZHMFVPRUYvT1JwNnh6ZmozeVdjbURv?=
 =?utf-8?B?eExnZW1KRXEzTldRdlM5VCtaVGlTL2FHcGpvLzl4T2hITWJGMmlUb0NEWkxM?=
 =?utf-8?B?QzV6N1VVZWJMY2xWeGwxSkdUa2xGYnFLVElxcDdtU0hwbTZ2dUxYc093U0Jz?=
 =?utf-8?B?dTVxR0s1Z2xVQlJXVys5enNvQmpVbTg3QWJWS1FRUm1PcGM5THQ5RWFTRUNH?=
 =?utf-8?B?ei9tcGkrZlJ0dHYzVjhZSm1OQlgxbmFtZHJMdXRVT3JWOTVBdHQ2cm95NUZK?=
 =?utf-8?B?UnBwRDhNOGU5S3R6bHlWejh1QURGYVdVVFkrZmkwTEFhS3BmNHBPWElkY3kv?=
 =?utf-8?B?aFFVZVNDRWV5MmFINGVNWG5JMUdBKzI5Zkp2MDB6aFIwSWJhbnFiNm5BVDlN?=
 =?utf-8?B?bHJLb0N1Vks4N1BoZVBvMks2dlRrT0p0WWVhRG1sdGNqS2NyOGNwZlpRcjdy?=
 =?utf-8?B?VDZNZlVmdlNianV6ekgzUStIU1dMNEdKNVROQnlTUkQvd0QwNW16SnV5YXZK?=
 =?utf-8?B?ZXZVejBFajZ5UXFXN3JFbUk5NVlpLzBRa2ZWSmF3N0N1cWJnYnVqa3hxZ1Qz?=
 =?utf-8?B?cHpURW01UlhvZzRHbE5xdE9XSmgvWTAxQlVXd1hiRTdXZVZuUkRoTzJDc0lQ?=
 =?utf-8?Q?ar7xdZ2xiKFCFlTl3WAkU/sEg?=
Content-ID: <03E7CB087F063F4D9A857F5A6A833C98@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 319dd300-485c-46c6-37fd-08da8a620b5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 08:31:32.7833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWu1jMwbAd38RTaS6NEA7zNlDobCmiRX4wxHULA/kT6gX5nvWplIDt7I2gzWNePcqyaZsYj+Qqh7k9ROXqaW7hgfRd1SVmUkABcAME3Nytk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_013137_461235_0F0091F0 
X-CRM114-Status: GOOD (  18.66  )
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

On 30/08/2022 09:21, Conor.Dooley@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hey Vladimir,
> 
> On 30/08/2022 08:59, Vladimir Isaev wrote:
>> [You don't often get email from vladimir.isaev@syntacore.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> It is possible to have more than one mm (init_mm) during memory
>> permission fixes. In my case it was caused by request_module
>> from drivers/net/phy/phy_device.c and leads to following Oops
>> during free_initmem() on RV32 platform:
>>        Unable to handle kernel paging request at virtual address c0800000
>>        Oops [#1]
>>        Modules linked in:
>>        CPU: 0 PID: 1 Comm: swapper Not tainted 5.15.45
>>        Hardware name: Syntacore SCR5 SDK board (DT)
>>        epc : __memset+0x58/0xf4
>>         ra : free_reserved_area+0xfa/0x15a
>>        epc : c02b26ac ra : c00eb588 sp : c1c1fed0
>>         gp : c1898690 tp : c1c98000 t0 : c0800000
>>         t1 : ffffffff t2 : 00000000 s0 : c1c1ff20
>>         s1 : c189a000 a0 : c0800000 a1 : cccccccc
>>         a2 : 00001000 a3 : c0801000 a4 : 00000000
>>         a5 : 00800000 a6 : fef09000 a7 : 00000000
>>         s2 : c0e57000 s3 : c10edcf8 s4 : 000000cc
>>         s5 : ffffefff s6 : c188a9f4 s7 : 00000001
>>         s8 : c0800000 s9 : fef1b000 s10: c10ee000
>>         s11: c189a000 t3 : 00000000 t4 : 00000000
>>         t5 : 00000000 t6 : 00000001
>>        status: 00000120 badaddr: c0800000 cause: 0000000f
>>        [<c0488658>] free_initmem+0x204/0x222
>>        [<c048d05a>] kernel_init+0x32/0xfc
>>        [<c0002f76>] ret_from_exception+0x0/0xc
>>        ---[ end trace 7a5e2b002350b528 ]---
>>
>> This is because request_module attempted to modprobe module, so it created
>> new mm with the copy of kernel's page table. And this copy won't be updated
>> in case of 4M pages and RV32 (pgd is the leaf).
>>
>> To fix this we can update protection bits for all of existing mm-s, the same as
>> ARM does, see 08925c2f124f1 ('ARM: 8464/1: Update all mm structures with section adjustments').
>>
>> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> 
> What is the appropriate fixes tag for this patch?

Also, you should run scripts/{checkpatch,get_maintainer}.pl before sending
your patch - many of the lines in your commit are too long & you did not CC
any of the maintainers :/

Hope that helps,
Conor.


> 
>> ---
>>    arch/riscv/include/asm/set_memory.h | 20 +++--------
>>    arch/riscv/kernel/setup.c           | 11 ------
>>    arch/riscv/mm/init.c                | 29 ++++++++++++---
>>    arch/riscv/mm/pageattr.c            | 55 ++++++++++++++++++++++++-----
>>    4 files changed, 75 insertions(+), 40 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
>> index a2c14d4b3993..bb0f6b4ed86b 100644
>> --- a/arch/riscv/include/asm/set_memory.h
>> +++ b/arch/riscv/include/asm/set_memory.h
>> @@ -16,28 +16,16 @@ int set_memory_rw(unsigned long addr, int numpages);
>>    int set_memory_x(unsigned long addr, int numpages);
>>    int set_memory_nx(unsigned long addr, int numpages);
>>    int set_memory_rw_nx(unsigned long addr, int numpages);
>> -static __always_inline int set_kernel_memory(char *startp, char *endp,
>> -                                            int (*set_memory)(unsigned long start,
>> -                                                              int num_pages))
>> -{
>> -       unsigned long start = (unsigned long)startp;
>> -       unsigned long end = (unsigned long)endp;
>> -       int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
>> -
>> -       return set_memory(start, num_pages);
>> -}
>> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
>> +                         pgprot_t clear_mask);
>>    #else
>>    static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>>    static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>>    static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>>    static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>>    static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
>> -static inline int set_kernel_memory(char *startp, char *endp,
>> -                                   int (*set_memory)(unsigned long start,
>> -                                                     int num_pages))
>> -{
>> -       return 0;
>> -}
>> +static inline void fix_kernel_mem_early(char *startp, char *endp,
>> +                                       pgprot_t set_mask, pgprot_t clear_mask) { }
>>    #endif
>>
>>    int set_direct_map_invalid_noflush(struct page *page);
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 95ef6e2bf45c..17eae1406092 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -27,7 +27,6 @@
>>    #include <asm/early_ioremap.h>
>>    #include <asm/pgtable.h>
>>    #include <asm/setup.h>
>> -#include <asm/set_memory.h>
>>    #include <asm/sections.h>
>>    #include <asm/sbi.h>
>>    #include <asm/tlbflush.h>
>> @@ -318,13 +317,3 @@ static int __init topology_init(void)
>>           return 0;
>>    }
>>    subsys_initcall(topology_init);
>> -
>> -void free_initmem(void)
>> -{
>> -       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
>> -               set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
>> -                                 IS_ENABLED(CONFIG_64BIT) ?
>> -                                       set_memory_rw : set_memory_rw_nx);
>> -
>> -       free_initmem_default(POISON_FREE_INITMEM);
>> -}
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index b56a0a75533f..978202712535 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -16,7 +16,6 @@
>>    #include <linux/of_fdt.h>
>>    #include <linux/of_reserved_mem.h>
>>    #include <linux/libfdt.h>
>> -#include <linux/set_memory.h>
>>    #include <linux/dma-map-ops.h>
>>    #include <linux/crash_dump.h>
>>    #include <linux/hugetlb.h>
>> @@ -28,6 +27,7 @@
>>    #include <asm/io.h>
>>    #include <asm/ptdump.h>
>>    #include <asm/numa.h>
>> +#include <asm/set_memory.h>
>>
>>    #include "../kernel/head.h"
>>
>> @@ -714,10 +714,14 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
>>
>>    void mark_rodata_ro(void)
>>    {
>> -       set_kernel_memory(__start_rodata, _data, set_memory_ro);
>> -       if (IS_ENABLED(CONFIG_64BIT))
>> -               set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
>> -                                 set_memory_ro);
>> +       pgprot_t set_mask = __pgprot(_PAGE_READ);
>> +       pgprot_t clear_mask = __pgprot(_PAGE_WRITE);
>> +
>> +       fix_kernel_mem_early(__start_rodata, _data, set_mask, clear_mask);
>> +       if (IS_ENABLED(CONFIG_64BIT)) {
>> +               fix_kernel_mem_early(lm_alias(__start_rodata), lm_alias(_data),
>> +                                    set_mask, clear_mask);
>> +       }
>>
>>           debug_checkwx();
>>    }
>> @@ -1243,3 +1247,18 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>           return vmemmap_populate_basepages(start, end, node, NULL);
>>    }
>>    #endif
>> +
>> +void free_initmem(void)
>> +{
>> +       pgprot_t set_mask = __pgprot(_PAGE_READ | _PAGE_WRITE);
>> +       pgprot_t clear_mask = IS_ENABLED(CONFIG_64BIT) ?
>> +                             __pgprot(0) : __pgprot(_PAGE_EXEC);
>> +
>> +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>> +               fix_kernel_mem_early(lm_alias(__init_begin),
>> +                                    lm_alias(__init_end),
>> +                                    set_mask, clear_mask);
>> +       }
>> +
>> +       free_initmem_default(POISON_FREE_INITMEM);
>> +}
>> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
>> index 5e49e4b4a4cc..10a4ee313083 100644
>> --- a/arch/riscv/mm/pageattr.c
>> +++ b/arch/riscv/mm/pageattr.c
>> @@ -5,6 +5,7 @@
>>
>>    #include <linux/pagewalk.h>
>>    #include <linux/pgtable.h>
>> +#include <linux/sched.h>
>>    #include <asm/tlbflush.h>
>>    #include <asm/bitops.h>
>>    #include <asm/set_memory.h>
>> @@ -104,24 +105,62 @@ static const struct mm_walk_ops pageattr_ops = {
>>           .pte_hole = pageattr_pte_hole,
>>    };
>>
>> -static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
>> -                       pgprot_t clear_mask)
>> +static int __set_memory_mm(struct mm_struct  *mm, unsigned long start,
>> +                          unsigned long end, pgprot_t set_mask,
>> +                          pgprot_t clear_mask)
>>    {
>>           int ret;
>> -       unsigned long start = addr;
>> -       unsigned long end = start + PAGE_SIZE * numpages;
>>           struct pageattr_masks masks = {
>>                   .set_mask = set_mask,
>>                   .clear_mask = clear_mask
>>           };
>>
>> +       mmap_read_lock(mm);
>> +       ret = walk_page_range_novma(mm, start, end, &pageattr_ops, NULL,
>> +                                   &masks);
>> +       mmap_read_unlock(mm);
>> +
>> +       return ret;
>> +}
>> +
>> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
>> +                         pgprot_t clear_mask)
>> +{
>> +       struct task_struct *t, *s;
>> +
>> +       unsigned long start = (unsigned long)startp;
>> +       unsigned long end = PAGE_ALIGN((unsigned long)endp);
>> +
>> +       __set_memory_mm(current->active_mm, start, end, set_mask, clear_mask);
>> +       __set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
>> +
>> +       rcu_read_lock();
>> +       for_each_process(t) {
>> +               if (t->flags & PF_KTHREAD)
>> +                       continue;
>> +               for_each_thread(t, s) {
>> +                       if (s->mm) {
>> +                               __set_memory_mm(s->mm, start, end, set_mask,
>> +                                               clear_mask);
>> +                       }
>> +               }
>> +       }
>> +       rcu_read_unlock();
>> +
>> +       flush_tlb_kernel_range(start, end);
>> +}
>> +
>> +static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
>> +                       pgprot_t clear_mask)
>> +{
>> +       int ret;
>> +       unsigned long start = addr;
>> +       unsigned long end = start + PAGE_SIZE * numpages;
>> +
>>           if (!numpages)
>>                   return 0;
>>
>> -       mmap_read_lock(&init_mm);
>> -       ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
>> -                                    &masks);
>> -       mmap_read_unlock(&init_mm);
>> +       ret = __set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
>>
>>           flush_tlb_kernel_range(start, end);
>>
>> --
>> 2.37.2
>>
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
