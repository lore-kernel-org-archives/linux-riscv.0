Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3DCECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpkhBo0azKEiGM48UssNf3gwzk3v1ciEuTs77MvG+z8=; b=PrbbX4NDFZwng+
	uhLbIKrJwb1q0+qYZJcrmDXH+k8o19PZrlF5BoY3WxAGcvmE5YhBB+hplPP1UudvIdWvHTKfTpxWE
	seUmq3edUuvTyUbPuqZEONXXU6PfHavtndEuYZG5ahfpa8Qofxd6WCS9nw2La/ptF+KFj46nVDpzB
	I0LJVnQzYbRjMBL0BfnDrFGzuVyTwo2drZPP4/MAiKlwqmcj0c9TFq3f1+256NK5T8Plv6SrX9w3x
	4qrhxeCKZFJSz9tr2eKVRvSQvPo6xCMr3pAhdLH0po02Ntgajw6l6IFEUroTe1FUqORJVWqSav54I
	zVgT6GCA64qPAut9AdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9RS-006vlq-Qr; Fri, 02 Sep 2022 16:22:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9RP-006vhW-0F
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 16:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662135766; x=1693671766;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=G+uI7ZhoVTv0G3UnwmRRej9I/GaxvpHqc37vQDAO1BA=;
  b=H810x3LlwGJSWeOm4JwyKTX0Ii7O0T1X1L8mLMg2ue27d7CWCYwyqxwe
   Z9xoEeL/S0IUXS0GKGnecFtKOnTLmH8yZ3rtT5HBS5dEarQXsCuE1vyH7
   rlQPLzDudlHUs6wi6yH14M7EaYNPaoV6GKf2NcB00ojRlMXx4nqYJWOh2
   yrs5ICOJSYRF8KhWxM/vKh8BP7/sM5O9fEaT+hdnXy1XTlGf3YJXjwNFs
   zjyBnR/dRfxciuxf65GgugvUQl2d2LJalq9AZrMlq2h/6Ig5k4uLwvHIp
   nWj4NoPRKmFKBOl4snYv5qTRIYhRZ9Ql4+Oph4udD6lYbddyTGdPPmsBV
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="175406902"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 09:22:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 09:22:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 09:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isQmnlwZ+6ymmCxz6vWgjH6C5sW+GCZFxfuNR7oWIe7s7NyB0f76jDI4KRqs8gS9o9/saEb9sbtQAvn7rtXg1UcWAxDzI86JCf3geo1F8WOWujXzzn20PFlUBrvINb1kGl/83uwiGm0z8bkgbDSdCDjexdbVDGnr0O4dA9T8CWND2ZTSpXO/HTfc1v+wLAfn+2w3dUB/l8v/nEk12EmfXUFIADerEuXPizzyYePGJYIptmVitGZmqMBy3P5KNDTo+9Ml2GWpJdZwtm0Twr+LYKNRS9dU9fXFI2Gsn1HWrvzEXLIb1qZJbAFH18tYrLCsHeH2+1A/tKWw68PPNUbviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+uI7ZhoVTv0G3UnwmRRej9I/GaxvpHqc37vQDAO1BA=;
 b=ZS2M+OYirnDD7d/yxe5UuCAQZX27oN+Lm10zUCjZhV4RM4kNOO1QP/GvJDfYU6flpMznA8n36oFqaseLqOTcRmYFAKph28xKvwdzIa3DRN+fCtC4RZuDSRP0pgTfBbXGIF9Yd12rhvgZaOrvUwdox8sQZSqt3lGuNvahvhPLBbYAizIgfuIUfIw55WtkGrI47f+6gl6y6MZoG4ci/coXYun05alaQ/yARwQGD/fz/cRfbz4V/nCUVLPOVhzy2EhIHhbWLDK9vqYxWmiHmbxDI5wNMDOYp9rmxq5Yz5Yjq4Ymx3+bTEyP3JCLpKEF2Ausl9kcF2YYij7nBO7eT1XSug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+uI7ZhoVTv0G3UnwmRRej9I/GaxvpHqc37vQDAO1BA=;
 b=TXe9YPyWkwlZGP9XIqpQTboiP3GI/7miUTpbO3EQzu87a2yo8e0Gy5/zO3ajyNQnS+fPfz+7ux1yhYe6TbCs482aGaWiLhZ6l9viFKZES/Acy2DRg5x1lCb/h87sAjSG0AejyfDsL2BmWdTCD7wdD3aSz3R7YkeW2IqpN0NoSLo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB3646.namprd11.prod.outlook.com (2603:10b6:208:f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 16:22:22 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.016; Fri, 2 Sep 2022
 16:22:22 +0000
From: <Conor.Dooley@microchip.com>
To: <vladimir.isaev@syntacore.com>, <linux-arch@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <atishp@atishpatra.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<anup@brainfault.org>
CC: <ajones@ventanamicro.com>
Subject: Re: [PATCH v3] riscv: Fix permissions for all mm's during mm init
Thread-Topic: [PATCH v3] riscv: Fix permissions for all mm's during mm init
Thread-Index: AQHYvrTMgmHvyyFJk0WgMDlPWFbNm63MUvIA
Date: Fri, 2 Sep 2022 16:22:22 +0000
Message-ID: <49acc483-a356-5db1-c326-39c1eb2162a3@microchip.com>
References: <20220902101312.220350-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20220902101312.220350-1-vladimir.isaev@syntacore.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44af124b-7d77-4560-f806-08da8cff50c0
x-ms-traffictypediagnostic: MN2PR11MB3646:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ifSi8+Vc1/djV8WAwf6NfHJHk3VMb3ZF69XcK3PoyT290WPV67nGU9e8wyLJZg/WD9vqJBu1mwlnjMYsC+id3dOpoFfPGbJOXISqwtFPSQ8a7ShBSaDYh4rOQ/xCE5b2YsNfAFDfXx1qpoIrqKpRwk4xI77TyAtH3syeSE0QLqE7OxmVzjA7id4rKFZHxxVgwtHfkIgPjDa/+acYjlNk1Ohovsdp2XEraf4TqwgJZXUF17+vyysIpjrEzaGufttk9yXMluTsVFt/VwI3uQJjGHjsFDZpO60BANAmvHAwyzWWLqqv2crAFZenxrfVZ1/owTSLshXn1OmUaGC7TIReqioW6ULsPuH7v75MmJeAerOD2A5ztfSqTastIh1PzGXHLmQSzYTpj9ouF7av1rG6FrD/1QvOrcN9s0aMe6IQTva9DlrOrJiCibeHu8yaHRfj5Ks7Gxpu0/RgRqVvXSu3phrkgcD3pjMXj4BMYZLSpfs8Hi1D9zCgD2G5Q8jTyDvCaHTdTyGZVmxCb2uz92pZvOQRhh0NqSWIHXgvlvc/ZOlYCxp2QzLKmFcQO0sSdFsy+9W4z91VKnG/9tENXYREXKMo0sfB814iUgN9BOr6fFj5UAoWqgCR7jx1FTepeMcZSn/z7F5YGOFBKgwbcMebEDazfXKZIelkY8bUaxdynEV+53/I5ymQkj7CQClLxJsmT2ClUMngX1qB4jfiMkY0PLsAY9IVRwIh/L4vqFwIaSjoUDIp34TO22gwcgkULpYgxsYi0L1DSCKZl3KgpJPIIVr9Zui12eC9AJ4YHJUKat2rWH1olZdWZZej/0e711Q0nMTcguOsgwkqxqMZKAUHI9lsR4DdFfTejlgPFxvgoNw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(366004)(396003)(376002)(136003)(2616005)(31686004)(2906002)(38070700005)(186003)(36756003)(26005)(6512007)(66556008)(91956017)(66446008)(64756008)(66476007)(8936002)(5660300002)(8676002)(76116006)(4326008)(66946007)(6486002)(966005)(316002)(110136005)(71200400001)(478600001)(41300700001)(6506007)(53546011)(122000001)(38100700002)(45080400002)(86362001)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXFTdE9GS1ZUUHNhSTNac3NFUlNEdFJJZDE5QlRJY1p1RWcyM3l1UVlNNFJy?=
 =?utf-8?B?TzRXanBWRnRYQ05WTWYzS01EUWoxQ1RYVitHSXprbW1jeXVzZkNyVFAwcUc5?=
 =?utf-8?B?OEFybXdsWXVCOFNwSTFCZys3eTkzbDd4cEJqL0VRQjlnaUZjb0tHZjJqZ0lX?=
 =?utf-8?B?dGRiZ2FLN2ZIVnFBaWd6UmxHTXFqMlBGSG5oY3pFZGtHTjBycTBtVDRmRmRB?=
 =?utf-8?B?cEJ3V2JtMWQ0TmJGSlhTYnpvV0lLcjRCL3ZoRC9PZ25FaTZha1dRK0JPSzMy?=
 =?utf-8?B?Y2NrakpINGtrUWJXQ3JqOWI4T1ZUUkhuYk5ibkw0L0dQQTBqbHhKQWtWTU5H?=
 =?utf-8?B?TkRFUVp6bEtnTWxiT0RRelpaeVc0SkRkcTZ2dXlSam5kVzgzQXdpV0pUT3Br?=
 =?utf-8?B?MWdpb2ttaGVUUWloRVoyTVdLNEU1MFd2dEpqbDFsWjBIZzhteDdPaHVObmJi?=
 =?utf-8?B?L01oYkFxQmJXdnNXNENsbDA1UWkxcm9Dd1FOQ0djbC9oSDA1Z2ZoUDB5bDVO?=
 =?utf-8?B?ZzJtOU5KNFltcXVMTE1lamJEWXY4VW5nbTlsV3UwRml0dXRTaU1YSlN1dGtD?=
 =?utf-8?B?NXFpR0V3OG5pVE5kbzREaFhKWnRyT3VvSTRqY0VqczBsQ2dEeXBmbXFyeFZa?=
 =?utf-8?B?UkZMK1gxNG1VUUo4Ym9EVEMxMG92ZFpyTDRCYlVCaGNhYmxDRkFOdW9UWFdX?=
 =?utf-8?B?QS9LQ0NxUXRRTUFuUjVaVWt5SEdkR0pGVTRsVGxQZm8vQzhDSUZHenhQQW00?=
 =?utf-8?B?eEtnVnlWckgvUUNrUnhkQlZxcVZPR2JpbENFb1FzWWE3Mjk4SVpDVVhETUVH?=
 =?utf-8?B?ZXBuWWdiOS9ZRlpUVXowM0cyM0toME1KZlIycjFYL3F0RzlzVHdWL2pFTElu?=
 =?utf-8?B?RllGSGt4YlIxS0pIcDlhS0FZRXdBNC9ncFNpVVFYWUpMNjJPTVN1OUhTQjJL?=
 =?utf-8?B?WlpYTmxTQlkvTzNDS3RRTTJyN1JsWWlOb3YvbCtacVdrYU1SaTBDR001eW1J?=
 =?utf-8?B?b0tPcTAzTEE0NTdDbTU0dFpkWWU1ZGtoSmRlWXBrcVowVlpmeHdGOUd4M3lS?=
 =?utf-8?B?N2pUNWhqeUkxNHRUbHViNURYMVZWQWdxYWE4TExQLzlWRGFkTXRtd2wwU3dC?=
 =?utf-8?B?ZTVrWm5UMXRzWGZCL2JIQmhsUUVhcmVzTEc0ZVN4alFtaFlhanlqVjk3ZGo1?=
 =?utf-8?B?dFVyWURHSTdRb2lERkI0ZXd4YnlHZ2dHMmJaZXZPZmMrVFpWTWNaZ0RRVVEv?=
 =?utf-8?B?SVJnYk4yd3UydjR5NlV5emQ5c2drbXJ5U1p4UWpTeEFSNFF0NFcweUlnZnpH?=
 =?utf-8?B?U2Z2RUtYUHVOZ2pvbGNRYXhmSUV5NWV4Y1hHVXJPNG9mL01KQllmaHd1UVJU?=
 =?utf-8?B?L1VhN05iQXlRUzAxcGtTdW16bE1JckNCQy9OUHhOdC83bW4xT21vclpzQWg5?=
 =?utf-8?B?a1pKNWJGZWdZY0pmMi8rRGxvYzZ3dzZlQ0thK0hwTjlUNWt1WEtpbWxQT2hl?=
 =?utf-8?B?WmJRWGpjeWxnSGtyNjBxb3BZeGRxMXNScEZRdExtcEptZ0tKdnVhcmFEdUMy?=
 =?utf-8?B?NDVPb1F4S3A2U2lEQ3pzVW15RkNNTG9qc1AvcXpsTFEvaDA2U3hzZEkxNW1u?=
 =?utf-8?B?Z3RhcEUzTDVxVVhDZ3RtVkJZSDBJN1VtRjMybTFCcDhKUGFTTzVYN1FwVjRV?=
 =?utf-8?B?WlRURDk0VlpJZFVzMGcwWVhNSkJ0QnJXY2EwcEJMR09rWUcvRDJJcU1DaG4z?=
 =?utf-8?B?TFFDa1Q0cWNZMkppSzI5c0NFbU5paVVVMFh3ZUpQOXZ1R0M4RDVLZmtpbGFJ?=
 =?utf-8?B?SUdQRXk5cXpIOVJSbHlxc1lrRGQ1Q0lwb1VKcy9oTUtjc0FwSmRPZmdINGYr?=
 =?utf-8?B?eDNsaFZ3WS9qWGI4Y09tMWtqVFJEUkdpUG5xT0dIblpWNVlzaHRqSDk0cTEz?=
 =?utf-8?B?VlZqSmk3bDJZazdMQjRQeG81cktqQ1RJRjBjUHltOHNPRlA0djFua1cvT3NB?=
 =?utf-8?B?QitWekFFVFZKTDZKS3BKRkMxYjRMOHFWY0tnRWlwU3hoWENHcFR4Z0kyWjZW?=
 =?utf-8?B?ZE56RjdLWSt3eWphSXRuWUI5VWFrcjlwMnBvVmt2QVR3bjJuTW9LSFZuVGVj?=
 =?utf-8?Q?tx0HNSrNpwRfPU7WqtbbVnTcS?=
Content-ID: <02520A2116A7B64A968FA02F4E6FE9AE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44af124b-7d77-4560-f806-08da8cff50c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 16:22:22.5094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yG2yf5auG8CvjmXpHqeqnOZZFwiRTJSxObd+KlA6kLjKZ8CBtCIaOVDBglzeWLVeK3S3qtb7VidAqwj/s7746IgybU6zN8UzAXvTCwsORhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_092247_196082_02D8A17A 
X-CRM114-Status: GOOD (  24.18  )
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

On 02/09/2022 11:13, Vladimir Isaev wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> It is possible to have more than one mm (init_mm) during memory
> permission fixes. In my case it was caused by request_module
> from drivers/net/phy/phy_device.c and leads to following Oops
> during free_initmem() on RV32 platform:
>      Unable to handle kernel paging request at virtual address c0800000
>      Oops [#1]
>      Modules linked in:
>      CPU: 0 PID: 1 Comm: swapper Not tainted 5.15.45
>      Hardware name: Syntacore SCR5 SDK board (DT)
>      epc : __memset+0x58/0xf4
>       ra : free_reserved_area+0xfa/0x15a
>      epc : c02b26ac ra : c00eb588 sp : c1c1fed0
>       gp : c1898690 tp : c1c98000 t0 : c0800000
>       t1 : ffffffff t2 : 00000000 s0 : c1c1ff20
>       s1 : c189a000 a0 : c0800000 a1 : cccccccc
>       a2 : 00001000 a3 : c0801000 a4 : 00000000
>       a5 : 00800000 a6 : fef09000 a7 : 00000000
>       s2 : c0e57000 s3 : c10edcf8 s4 : 000000cc
>       s5 : ffffefff s6 : c188a9f4 s7 : 00000001
>       s8 : c0800000 s9 : fef1b000 s10: c10ee000
>       s11: c189a000 t3 : 00000000 t4 : 00000000
>       t5 : 00000000 t6 : 00000001
>      status: 00000120 badaddr: c0800000 cause: 0000000f
>      [<c0488658>] free_initmem+0x204/0x222
>      [<c048d05a>] kernel_init+0x32/0xfc
>      [<c0002f76>] ret_from_exception+0x0/0xc
>      ---[ end trace 7a5e2b002350b528 ]---
> 
> This is because request_module attempted to modprobe module, so it created
> new mm with the copy of kernel's page table. And this copy won't be updated
> in case of 4M pages and RV32 (pgd is the leaf).
> 
> To fix this we can update protection bits for all of existing mm-s, the
> same as ARM does, see commit 08925c2f124f
> ("ARM: 8464/1: Update all mm structures with section adjustments").
> 
> Fixes: 19a00869028f ("RISC-V: Protect all kernel sections including init early")
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> Changes for v3:
>   - Add WARN_ON(state != SYSTEM_FREEING_INITMEM) to fix_kernel_mem_early()
>     to make sure that the function used only during permission fixes.
>   - Add comment to fix_kernel_mem_early().
> 
> Changes for v2:
>   - Fix commit message format.
>   - Add 'Fixes' tag.

Sweet, thanks.

Ran it through a 32bit build & been running with this applied on 64bit for
the afternoon & everything still seems to be intact. Therefore:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for you patch,
Conor.

> ---
>  arch/riscv/include/asm/set_memory.h | 20 ++--------
>  arch/riscv/kernel/setup.c           | 11 -----
>  arch/riscv/mm/init.c                | 29 +++++++++++---
>  arch/riscv/mm/pageattr.c            | 62 +++++++++++++++++++++++++----
>  4 files changed, 82 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index a2c14d4b3993..bb0f6b4ed86b 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -16,28 +16,16 @@ int set_memory_rw(unsigned long addr, int numpages);
>  int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
>  int set_memory_rw_nx(unsigned long addr, int numpages);
> -static __always_inline int set_kernel_memory(char *startp, char *endp,
> -                                            int (*set_memory)(unsigned long start,
> -                                                              int num_pages))
> -{
> -       unsigned long start = (unsigned long)startp;
> -       unsigned long end = (unsigned long)endp;
> -       int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
> -
> -       return set_memory(start, num_pages);
> -}
> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
> +                         pgprot_t clear_mask);
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> -static inline int set_kernel_memory(char *startp, char *endp,
> -                                   int (*set_memory)(unsigned long start,
> -                                                     int num_pages))
> -{
> -       return 0;
> -}
> +static inline void fix_kernel_mem_early(char *startp, char *endp,
> +                                       pgprot_t set_mask, pgprot_t clear_mask) { }
>  #endif
> 
>  int set_direct_map_invalid_noflush(struct page *page);
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 95ef6e2bf45c..17eae1406092 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -27,7 +27,6 @@
>  #include <asm/early_ioremap.h>
>  #include <asm/pgtable.h>
>  #include <asm/setup.h>
> -#include <asm/set_memory.h>
>  #include <asm/sections.h>
>  #include <asm/sbi.h>
>  #include <asm/tlbflush.h>
> @@ -318,13 +317,3 @@ static int __init topology_init(void)
>         return 0;
>  }
>  subsys_initcall(topology_init);
> -
> -void free_initmem(void)
> -{
> -       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> -               set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
> -                                 IS_ENABLED(CONFIG_64BIT) ?
> -                                       set_memory_rw : set_memory_rw_nx);
> -
> -       free_initmem_default(POISON_FREE_INITMEM);
> -}
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b56a0a75533f..978202712535 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -16,7 +16,6 @@
>  #include <linux/of_fdt.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/libfdt.h>
> -#include <linux/set_memory.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/crash_dump.h>
>  #include <linux/hugetlb.h>
> @@ -28,6 +27,7 @@
>  #include <asm/io.h>
>  #include <asm/ptdump.h>
>  #include <asm/numa.h>
> +#include <asm/set_memory.h>
> 
>  #include "../kernel/head.h"
> 
> @@ -714,10 +714,14 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
> 
>  void mark_rodata_ro(void)
>  {
> -       set_kernel_memory(__start_rodata, _data, set_memory_ro);
> -       if (IS_ENABLED(CONFIG_64BIT))
> -               set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
> -                                 set_memory_ro);
> +       pgprot_t set_mask = __pgprot(_PAGE_READ);
> +       pgprot_t clear_mask = __pgprot(_PAGE_WRITE);
> +
> +       fix_kernel_mem_early(__start_rodata, _data, set_mask, clear_mask);
> +       if (IS_ENABLED(CONFIG_64BIT)) {
> +               fix_kernel_mem_early(lm_alias(__start_rodata), lm_alias(_data),
> +                                    set_mask, clear_mask);
> +       }
> 
>         debug_checkwx();
>  }
> @@ -1243,3 +1247,18 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>         return vmemmap_populate_basepages(start, end, node, NULL);
>  }
>  #endif
> +
> +void free_initmem(void)
> +{
> +       pgprot_t set_mask = __pgprot(_PAGE_READ | _PAGE_WRITE);
> +       pgprot_t clear_mask = IS_ENABLED(CONFIG_64BIT) ?
> +                             __pgprot(0) : __pgprot(_PAGE_EXEC);
> +
> +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
> +               fix_kernel_mem_early(lm_alias(__init_begin),
> +                                    lm_alias(__init_end),
> +                                    set_mask, clear_mask);
> +       }
> +
> +       free_initmem_default(POISON_FREE_INITMEM);
> +}
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 5e49e4b4a4cc..74b8107ac743 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -5,6 +5,7 @@
> 
>  #include <linux/pagewalk.h>
>  #include <linux/pgtable.h>
> +#include <linux/sched.h>
>  #include <asm/tlbflush.h>
>  #include <asm/bitops.h>
>  #include <asm/set_memory.h>
> @@ -104,24 +105,69 @@ static const struct mm_walk_ops pageattr_ops = {
>         .pte_hole = pageattr_pte_hole,
>  };
> 
> -static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> -                       pgprot_t clear_mask)
> +static int __set_memory_mm(struct mm_struct *mm, unsigned long start,
> +                          unsigned long end, pgprot_t set_mask,
> +                          pgprot_t clear_mask)
>  {
>         int ret;
> -       unsigned long start = addr;
> -       unsigned long end = start + PAGE_SIZE * numpages;
>         struct pageattr_masks masks = {
>                 .set_mask = set_mask,
>                 .clear_mask = clear_mask
>         };
> 
> +       mmap_read_lock(mm);
> +       ret = walk_page_range_novma(mm, start, end, &pageattr_ops, NULL,
> +                                   &masks);
> +       mmap_read_unlock(mm);
> +
> +       return ret;
> +}
> +
> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
> +                         pgprot_t clear_mask)
> +{
> +       struct task_struct *t, *s;
> +
> +       unsigned long start = (unsigned long)startp;
> +       unsigned long end = PAGE_ALIGN((unsigned long)endp);
> +
> +       /*
> +        * In the SYSTEM_FREEING_INITMEM state we expect that all async code
> +        * is done and no new userspace task can be created.
> +        * So rcu_read_lock() should be enough here.
> +        */
> +       WARN_ON(system_state != SYSTEM_FREEING_INITMEM);
> +
> +       __set_memory_mm(current->active_mm, start, end, set_mask, clear_mask);
> +       __set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
> +
> +       rcu_read_lock();
> +       for_each_process(t) {
> +               if (t->flags & PF_KTHREAD)
> +                       continue;
> +               for_each_thread(t, s) {
> +                       if (s->mm) {
> +                               __set_memory_mm(s->mm, start, end, set_mask,
> +                                               clear_mask);
> +                       }
> +               }
> +       }
> +       rcu_read_unlock();
> +
> +       flush_tlb_kernel_range(start, end);
> +}
> +
> +static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> +                       pgprot_t clear_mask)
> +{
> +       int ret;
> +       unsigned long start = addr;
> +       unsigned long end = start + PAGE_SIZE * numpages;
> +
>         if (!numpages)
>                 return 0;
> 
> -       mmap_read_lock(&init_mm);
> -       ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
> -                                    &masks);
> -       mmap_read_unlock(&init_mm);
> +       ret = __set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
> 
>         flush_tlb_kernel_range(start, end);
> 
> --
> 2.37.2
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
