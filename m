Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730E9C0502C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 22:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSOPZembYJe9Tkdn6hLNsxKjjc5JaVeDRr95P9M1NgI=; b=T5ZWSBWlQvTPvD
	KGjKOQmtU3gc4T00GvUYPfrBuBNqUPrqW7khfUgkiIp4r3OZiXzLx6QTen9VKqP5vccaOLw4NbmLj
	p8NwIbs4FcmvkjpY2w6QbFnK5W4R39xOHFgVUhsxMZFLOILqI5ix5zaohGCfZeQ+nRGI1lcRpWNDH
	eJUon5XwmOdBWns7/8JmcOSDMKPILyvl9DSuOk5FqjCJjkwGlm363wR14p/bUEKqcIf32s3maUPtg
	ABP46oWQJXHNunrJ8v3TqWjHX6mVGA8u0fbj2SvxP5A4A+hCwbqQ8rYVJCONiPRKaKoEDH5cEYFHU
	0erkKMYmuSuXkIU+yeXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRhTo-00DlHO-SQ; Fri, 26 Aug 2022 22:07:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRhTk-00DlDP-NI
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 22:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661551624; x=1693087624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i3yCyrZpbAbe0raoQEsSTbx7W3kzOChwUQbNqeNiii0=;
  b=f5b6yrGYh7I9bvzaHt9qC2L+HaotPQlO7xMBFrFRwKdrFRn4NKOIdoNH
   se6GUyct3b0TTeCFLmvx+DTTKKhEcWGWdLNOeC9NBq6YgMhVAV8nifZS9
   Ir6MKsqH1PwIeeAvNrxzNQ+anot5g0+LbBoLWIhdSSEM3R9ICSIOaNUfP
   BImA3cGGCoF9ClS7/Zz2qui8W2qfSlAEtu6+2b+/0pjKcF3mqa/j2NLkD
   /NwASWRzo1Ugvx6DmZdWMHJkkT/U5WtXhXX+PEacJIsILMPwlauQUo1eB
   8I79799HhoyEq2LhGKQBHSb2Ma4c0id8H/TUZ92C3stjtrVRnAkMNhI44
   w==;
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; 
   d="scan'208";a="110974210"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 15:06:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 15:06:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 26 Aug 2022 15:06:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MD+zdCwOmUIIzmFzskJy/mg4kTF/Cqd0es9TPqfm3SNzR4PxOPdxnC/ci2C5DR1fzIl8/ytWsDR6wMMTQLx+u20XRUhHozn3LNzisFlE4kI7pjDMdOAvbXM96fp8jLEZYVmvl5Zr0U7poz2be/PoRe7vAgUlKwNnuPubvVRenZLGD8zVRs2rD99JXB21X09U6G2S/TUcabTPwaRDBSJNtaIdyBX4+c9EP5q1nmSz3/i9aOj4TWGyOaABzyUuxrwVZSIcEv6HwKznitEP1snVCQ3XjPw2v/+12XNi6QejzRuY8k7GUYCac/3QeMpDfPVMmrhuWbIWyC8n6bcwyUOPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3yCyrZpbAbe0raoQEsSTbx7W3kzOChwUQbNqeNiii0=;
 b=iIcyRlMbBoZknPZRLTRdU78PNPsOtP4MBFQIM9RTrnQRXb2kfNEHzvwvUtYC4Xx3XqA9Bl0gx+35dtFvAy7LdtSGP37v+yAZg4JusJ5vz85Oi6njZaJY1LnlmeFpUwKUzyzpamvEif6o88UDpo+YDfBKZJdoZyilCbYTY0C9M8j9IGqN0v4vtSJbxa6p5TgKFqJjkmt06uMUkeJieUYubzWBJFhpbymJ7LpQrm0DDFK2T1bcCe7ZaOMcHwAj17WGXrgAJr1AM33Y17tZdfLVNqN8Zl51IkKUXW0WlUVGo8vtzLjpeg5UOAqixJG2LfOy3/gGn0aa59e4qaFvN/YuaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3yCyrZpbAbe0raoQEsSTbx7W3kzOChwUQbNqeNiii0=;
 b=rM0QAj2I38wyZtBtZk+zOzJmC2yg719ZfN86kYxeg6QetAu91gvJEJgHEU1IOptEKPWBaFQSEhhGHLae0BJ6ozuqbbUlQOJT2QkedGa7742bvvW9kYXDu32RpPsvmoBCy4miy8Y0VsezsjgBrWE7Q7qh+NeX8gJgB1LRYE0y6DQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 26 Aug
 2022 22:06:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 22:06:53 +0000
From: <Conor.Dooley@microchip.com>
To: <geomatsi@gmail.com>, <linux-riscv@lists.infradead.org>,
	<atishp@atishpatra.org>, <mark.rutland@arm.com>, <will@kernel.org>
CC: <anup@brainfault.org>, <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <sergey.matyukevich@syntacore.com>,
	<atishp@rivosinc.com>
Subject: Re: [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
Thread-Topic: [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
Thread-Index: AQHYuYtpUI77r2WEBkGbhmIdER/euK3BvTWA
Date: Fri, 26 Aug 2022 22:06:53 +0000
Message-ID: <70656978-546f-c14d-96a9-8dc7d8dcf9aa@microchip.com>
References: <20220826203443.823906-1-geomatsi@gmail.com>
 <20220826203443.823906-2-geomatsi@gmail.com>
In-Reply-To: <20220826203443.823906-2-geomatsi@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fd224eb-f562-4895-f9cb-08da87af48bf
x-ms-traffictypediagnostic: PH8PR11MB7000:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zwg6vC0xutaihbmu1VyLs8MHwddLppnFQkwUJqrZIj8QYTfxzcmAO+HzjaSLzs9U4Fp8naRdxNfGB7xL/uXpcMBB7Cxf7s6lc2fIXN9FaSbS+V7nJ0qC0on+huSDKpoP5Z+o/D9Gds+MH9r7cyYUrThqYvFb8AOgFLZ4gZhRNyoLxWqTbx4WLigpNgBzHf9pCMzNfAlg1aA/iflWFcpf2Eh6LstGE//4ZedW1UweAkqE/ll2I2MSfkA6i/T6ivx5jkH72dQsZC1HCF9SMhL3gl8sQL2aiK+iDYV32m0ZlagoLuyrMl49YMadPSEGqxuFIxuD/aVidHVnXvK65YFjdkAf7s5I+nihssSVljYBvNPNS9Y3pF2P/MFxiLEU5gn6exJtDKA7lZEuwteoIctdf2PpxIsEqc56PNcXUbS34UTpDC/3hLTlfGhJX7ufep2stgKBeKaVjidG2rYZx0L3b/JROp2c3Y7CQI7KqMUozHvwCjHlj5utoL9pmLU1VF+nO1w5yf3H7j8FWlm/1rBTM8gzO7QNXmfWhFQZRqt1SfZ3J2FOtLJC+eHCRTWzDtEAHolb02EyOPF138Zo8NXKL6ybxGeIfTWFPqdVqzy4WkbAfEHPv2lMdhOoRyuxinGZkV87xLO1k0zzwJxNJndZbHIAudJ+7pE2JGUMZLPr9tVvbW9afh/cieI3NwYIbll29wR/fAYNOKebbGDzjGwixYK6xAlbsZMO0ePtoj9rTsOAOdipOIBIQH4daGSLzZV0Azh33Tc3OWuUfsmjLWkMbByoqev+xzpNC43AR54ZrQBiJ2xcrs5FBGRoCIx1i4/FDNNdpS9Nip8615I8LUeCLAgo8gJdNh/nwfT8GLzWnjw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(366004)(396003)(39860400002)(346002)(64756008)(6506007)(2616005)(71200400001)(186003)(316002)(2906002)(6512007)(26005)(36756003)(31686004)(83380400001)(53546011)(38100700002)(86362001)(31696002)(110136005)(91956017)(76116006)(5660300002)(4326008)(8676002)(966005)(6486002)(8936002)(122000001)(478600001)(7416002)(54906003)(41300700001)(38070700005)(66556008)(66446008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUJZd2tvWDg4VmM1aTQ3bExCLzNQNUtIalhOZURCUTRLQzlJbEg3QWRxR3JQ?=
 =?utf-8?B?NmhWVzNob0dKY0ljV2ZSWFNtalJSU21pOHZJUmxwU1pWK0JDcXA2VzhkRkYw?=
 =?utf-8?B?ejN2Q1lCQkpjc2NVT0hSbDEyN0h2Z3gyYmhvVVBuaENpQ3RZbkVnZ3FDS2xE?=
 =?utf-8?B?VlozbXRjREVzUVNmTWdzUS9Sakwyd2Q5bmh6QUlENXBJc2I1OUJzWUQrTE5p?=
 =?utf-8?B?bFVhbmtZcG1LcVVWSDUrTmtCSVRrN01ZSUNmU3dIM1ZXeSsyYUVaUjQ4N2R5?=
 =?utf-8?B?WDhLUlJYMWZFN2tTeEk4UWg4c2EvL0IxRWRqa0l0aVFwQTRmT005VXFkKzNE?=
 =?utf-8?B?UzY1TzEzWkFWYWJPR0YxaEY2QnViSFByYUMyckhxNmMyQUpUYXQrYUdsY2lu?=
 =?utf-8?B?NnVhWmxodUU0a2thUVRVSHloUGdRMCt1akt1MExZM1hFajFUU1pxb2FMb2NC?=
 =?utf-8?B?V3dnS2RJUTdyUnF0Q2RBZnljUThLZkg4QjNpV05UbWxpUWl3ZmFseTBjWSsv?=
 =?utf-8?B?NzhMTVNvUndCbStTUUpVU3JkTEZlbVJHb1h0ZDdKeW42MlF3RExOS0pCaWFq?=
 =?utf-8?B?ZVdnSnJUZWVleW5lWjk3bXJ6d1dHTGphektQQmNCUDlHcytxRVNYOFQ1cktu?=
 =?utf-8?B?ajBWYzdWOVdOb3FFaHA2dTh6RExmRHVObWlzZ1YrZ2JHSVY5KzVPUW81N0pq?=
 =?utf-8?B?RmZoMUVubEZjNnBCeHc0Q3hBUVo4VzNwOHJQMnlTQmd0cGwyOXFYN2tpK01O?=
 =?utf-8?B?SjM2eHExaDNtZEwwQWNSWExFcjJMdGRnQ01ac2pzbG5hY0U0RkV0TUpobklx?=
 =?utf-8?B?RHFRUWYvdUN5TFpQRnRGOE5ta0ZqbTNaZFdlcjZTQmlOY1BZMlNSNU8zdkpr?=
 =?utf-8?B?QVM0Ym00RktjN1ZRc3ZKMitrVmJuSUVvek5LU09WTEZoekUzdEZ1NFJsWW4r?=
 =?utf-8?B?c3Zsd01RTEs5MzdGSFBhM3lSbDE1MTBlNHNENU1pK3JrSHdzT05oQk02QXBN?=
 =?utf-8?B?ZXZodG1GVkFDdE1MZWJIcEtMOEptZVo2KzFpUWxiM0gzM3ZwbzZUWE1LVmln?=
 =?utf-8?B?czZKNDJjTzNRNGljTU5ZTnlGV2YwdmNmSUtnWjVBUkRicm9jeTJnTE80MXc5?=
 =?utf-8?B?RDFzOEtlK2pCRG85VVR1Q0s5RkNUSGxHOWxrRThPVitvK1FxWG1DaGxadS9Q?=
 =?utf-8?B?TW5COE5FQnllSjFTWlJGcU45WHE1M0ZlUmNaRU0wVC9abklaVTBFaU9MSXJF?=
 =?utf-8?B?dmNJL3dXam1MTnJ3Q2ZWZFRlZ1ZaaVk4RnVtUk1FcWtuZlJNdlZLWndPaHlI?=
 =?utf-8?B?YUF3MGJ0Nk9CY2JnbDV4bmJyNVdsV2MraTRpYzVRWlR4Ymd2SjVzcnJMekVE?=
 =?utf-8?B?cGNCOXIwUmxFR04vODJadTA5c3BXQTczSDFxQ2dZSk8rWDB6MXVYR0ZZT1k0?=
 =?utf-8?B?VlM2YWNsNFlIaGF6RE1Eanhoa1V5ME5zQ2dsVGFaYTN4M0UrdDkzUzdwenMw?=
 =?utf-8?B?MXg5VTZlR2ZTSUQray9uRi9zR1I5Um1yRkxUQm5LT0VWOGkvQ0E4SVd3MkI3?=
 =?utf-8?B?UWhPVlJkbkhGT0FYN3ltMlJXbHFkUmw1aDJRczZYU1ZYck45eUJKc09zZ3VU?=
 =?utf-8?B?YkxxRzdOL2ROZit2L3UzSjd2cmQyUEh2N3M1M0hkZVF3TmNHUmg4YytCWHVH?=
 =?utf-8?B?RVJlUTdhd3BYVTVGbHBNTUdOZ1VlQ0tLczNSUWNWYVNtOUsvcE9TQlM0NGR3?=
 =?utf-8?B?S08vSSsxa1hCZHJncGI4bWpFcis4Ry9zd1pnWXlDY3JiMUFnSlZTcEdIU1N3?=
 =?utf-8?B?KytZZjhER3ovUE5WaStRTE1sTFJxaFA4WDFBOFNUNGtoelhRNjQ0WnhIV1NU?=
 =?utf-8?B?T2FCV3hVd01xUjlHK1pFUys4NmUxemhIUm4vWWhqUFVjZjg3NU5aNDlkOGFN?=
 =?utf-8?B?eDAwZEZIMVY4VzVOUkxZbjJsaWpzMkhmOFkzTWgxUXJFZFhWUnpaNFc0ZjdL?=
 =?utf-8?B?bytCYmVrTjRVZG5aT3M5WVQ3VU9HM1ZrSmkrdENDTVEzeXpRRlREVkRZaGRz?=
 =?utf-8?B?WWVJM0dLdlhmTk1tUjlPRTJRcDNLdXc5dGx5dVMwdXMvYklGS0lMZ2piTS9a?=
 =?utf-8?B?aE9ENFY4akMzYkI0eXJJZnRQeEY5TWIyWkFBQnd4TTBaKzRCZ1pSTWV2SElU?=
 =?utf-8?B?cWc9PQ==?=
Content-ID: <85B76C6D40DBCD4EB95C9092D614F79B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd224eb-f562-4895-f9cb-08da87af48bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 22:06:53.5757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: znEwxpi9UpKlkufAAFfDjyWnqDJcIRjSrpj7Uw2v1tJNQMRMTZOKoNQmHZj55W91iG7fNtZ1mxKDv0tqzjOM8gZYkHlUrZ2gmAocQr0NeTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_150705_082477_FBA0879F 
X-CRM114-Status: GOOD (  25.88  )
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

On 26/08/2022 21:34, Sergey Matyukevich wrote:
> [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
                               ^^^ (see below)
> 
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> 
> The root cause could be related to the interpretation of the number of
> counters reported by SBI firmware. For instance, if we assume that unused
> timer counter with index 1 is not reported, then the range is correct
> and larger array needs to be allocated.

I found this to be confusingly worded, had to read it a few times before
I understood what you meant. Maybe it's just late on a Friday, I think the
theorycrafting about why the code looks how it does got me lol

> This is not the case though since SBI firmware is supposed to report the
> total number of firmware and hardware counters including special or
> unused ones like the timer counter. So just fix the range in for-loop.
                                              ^^^
I see "fix" mentioned twice here, what commmit does it fix?
Thanks,
Conor.

> 
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 6f6681bbfd36..8de4ca2fef21 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -473,7 +473,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
>         if (!pmu_ctr_list)
>                 return -ENOMEM;
> 
> -       for (i = 0; i <= nctr; i++) {
> +       for (i = 0; i < nctr; i++) {
>                 ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
>                 if (ret.error)
>                         /* The logical counter ids are not expected to be contiguous */
> --
> 2.37.1
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
