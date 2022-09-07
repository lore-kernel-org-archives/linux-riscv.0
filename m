Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D1EC38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agaBeUWEzxzjOB0GvIfgjvQ/xNOSBQwQIIkoAqi9jo0=; b=GN7I0mQwOn7Gnl
	SpGhjt/7kumKxjdfdPmV549nI3rRddAyfDROZAaqN26UZBHKjSgenCGNMhHHH0K+/pFZ7SQkC3Dqm
	NiwD6AlgrY/AMdLHrN9w1OvuHfSFRpFVbAlOg46+11Mt7TIFxYKgVZtA1Y8hJQ5YYgky/nPMd5wK1
	7GoGDEy+VcHvpWojpkUgMNgp7um3KPOH+C3UVygVnNq32I2W4NVTfWEUByPb7H8s2S9BxWsVNKnjD
	os0MdAs3HYsFUrLk9uwxQX9WdW/zY+ih+WVM2Qs7sxKHqO6gF5Bw6UPLoH1Bw9NAgoiiztt4nRi0/
	ykKeYhOrrBYR0uzoOJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVy27-007ofm-NM; Wed, 07 Sep 2022 16:36:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVy22-007obA-2s
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 16:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662568565; x=1694104565;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tvI2zzPjltIDW6QUaT0yJE8itGLsQb+U9kYMWRRGqyI=;
  b=POmyDsDm5t5ppAm1Fq0rsAsaS8Q+bYqkei6lHZSpyCjAeyUbxDaGkSqL
   ubGMo6nWd02/AkJ/lHlM+9ABMEmrIS71/bjmigBFubYOC43jiEX48p178
   j0C2mrg1HMLu7vBWmqXzQEc71AZk5D2XpVrojOJsq7IWPyjhycRTWxBIC
   eIrexJOkUkzwrjWtyypSNAjgPNnn+poe10Lmr//tBoTMC7PqF++YRg857
   DwHJCVtN381fU71u0nZZrC374ILeu4ZatucSYZ5cI4PJcuionoP0kw8Ti
   sVBxL21Sy2vLAVD3e5xROCYKxcxE9VP72F8Q5F+aIl0KYKl2axY62UAwI
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="176049535"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 09:35:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 09:35:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 09:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLXtAMUmKbNDy4dHWa+PLp7B3jJ22hiftV1eQsmWIpGQORV+0TXN83ZTRMxRKYTB3kcIF+bJRzP88qDIv2qhZ+3N1mojmoXoQY3T70Vsw8F0U4HQgZsuiPRPf81FOXFe0i12Uxc/6tkJqMkZEq5cnK/sDssk5USrnNm/s785cV4mTkpNReOY43ZOCoqhqLy3xvBjxZKCynL/4BWCM5RkKrXfrttmiinNtpFJyd/wJicwYrfntudGV3GND4wz+bVp36yVvYs57dAZaXqnMP05JMJqf4y4w7NUC6hMPzmRcIKFYWoU5epBkMX9hGyIlSPsuWqycCl3TsAZy4YosPwJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvI2zzPjltIDW6QUaT0yJE8itGLsQb+U9kYMWRRGqyI=;
 b=cSriqCQ1Vi1LKwgcgx14FmBXya/Ae55pBBQlWP6rJgPiLWlLYYXpEBR222KPcAgTj6Icz0U7/O+J9R1Lxe0PAQas4sxM3xOFFjbhVKrKSTYhmWsiySCNE5YGrTjF1y2/hQtQNoom8Nv0g+Q9+RIUgVElAeVb2go6GvvLyGYSLqLig5BT8ZWvPrOJP70PqlzQJguUhMRXnYG10Ug1II6gIXhQjvnVTE1LDowtbvd92xWKrMPmqnS8vp8NCeX0U2uREAr20v7t5e/5LZToqiknym6Ue+pcjK3xdTJoJNeE+siIvriezzPSnewORWTCxg9+RXkyfauHO3FiyqGGS982Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvI2zzPjltIDW6QUaT0yJE8itGLsQb+U9kYMWRRGqyI=;
 b=iVu/XtNgjd3n3eIPftT3uNRB/t/g3vIHCsJ/Ilx7krV3xLIhedUrrywwURqKPmNmJ/uahkI+eDfXW4dBeyLL60Imc7t72vi001pzor2TOXtiaR3UlIc5x5HuZMJI7mSmhtHYYZcKCk3XIZY0nocy7OlWmeptWDNvVZLlP1g/HRA=
Received: from SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20)
 by SN6PR11MB2862.namprd11.prod.outlook.com (2603:10b6:805:5b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Wed, 7 Sep
 2022 16:35:50 +0000
Received: from SA2PR11MB5163.namprd11.prod.outlook.com
 ([fe80::1169:5ec9:62a8:d220]) by SA2PR11MB5163.namprd11.prod.outlook.com
 ([fe80::1169:5ec9:62a8:d220%5]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 16:35:50 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>
CC: <samuel@sholland.org>, <guoren@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lkp@intel.com>
Subject: Re: [PATCH] riscv: make t-head erratas depend on MMU
Thread-Topic: [PATCH] riscv: make t-head erratas depend on MMU
Thread-Index: AQHYwtGjWFgnBf3Kq0easQ/4mXN9Fa3UKiKA
Date: Wed, 7 Sep 2022 16:35:50 +0000
Message-ID: <861b6cf0-c120-212f-43d8-3431551fe871@microchip.com>
References: <20220907154932.2858518-1-heiko@sntech.de>
In-Reply-To: <20220907154932.2858518-1-heiko@sntech.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3633ea50-a297-44f7-358a-08da90ef063b
x-ms-traffictypediagnostic: SN6PR11MB2862:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AExSxhJkJZ/Edd0g+siWTe4iRaXDx+DYqvS+ZQP/3gQ4Urj6WTOATFhTc0kl7srg7bmuxW3xUbqSHzXKEtnQcuEjwSatnz9sJ/TNz4FxAZUuYAF9cOC4/LSO8fl42UQVlVsQMNPqk5Ola/ZIVUYZeSj5anoCvWMKYnY4o3STFYCHk3ClSPIvEbi8GKybxKjIHFS0XWXHBcyzuMRzAmNiterq/asVupb6c6OsIpscXTuYlv17yvULePhwa23FxxL2sOd59ZeJ1+WW7mRiGCkfrRKIQsD490W0mn9JSNHa1cTcLUjHwCQwGbG1c/nuloFkqIKgmumPM8/tc8cNn4RbXfvGUs92qNMx9P3582H9+MZvCxuP89Hp9S3apwyLZ2hMi8lTk/dqz8+jhNQrGpBQvSKLAjub84BrM3p+g7ItnTix06Nx6hJUk3xKsbuOytNQBKSVn5eVi61wLUUuIoBQ9cjngYi//44xGMe3GISi7gcztF7RXmuT+Z0i0BBIM/7FyxE2DAmPXosGlH0og9VE8BkQJTXG+PAKZn7IoaEL0R5TfDoDCiMDmnVx7S9LoeZZqMHJZhw5vbAvuOh/F1pJHXztqcFm9wzLSdjbNLSW7AexxdMwmbGOdnNI9Dpi9o5tPrQ8b5XzHvHPriyamZVpbdpQpGyV2kWqsjo3+7NcgLGEpW3HFdRqT12wqN/o52/welHGHNVnJYrkNNDD4m7disD24xgplY2AwCkIVtF3CLuuJ15DVcu36h0dRkkkIbw+GehpD1gYD/xmV1yZnOYY++cf2gjR+1ROh4xF6//27SeSGb+c2+7+zXj/Tp8HL9m27b1Lny17S0591IlIT9dKaRwxvW7fI93URgGXMH3z1GTYVj7yUTLXVlhZlwRbaEbaw2EElYecXGVX9Dn7TZfmiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5163.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(396003)(136003)(346002)(39860400002)(966005)(4326008)(86362001)(66946007)(64756008)(71200400001)(76116006)(66476007)(8676002)(91956017)(316002)(110136005)(478600001)(5660300002)(26005)(41300700001)(6512007)(31686004)(6486002)(53546011)(6506007)(54906003)(66556008)(66446008)(38070700005)(31696002)(2906002)(2616005)(8936002)(36756003)(38100700002)(186003)(83380400001)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEYxcmhQaVN2ZEJMZUpDUnZmZ0QzM2RyVmg3aVYyNzc2bHN5OXNyS2YrME9U?=
 =?utf-8?B?S1Y0NEFUZnowRzlEZkpYSy9oaDRhNWtRY1JjVVp4UEZiSTdkTy9EZHUwcUY2?=
 =?utf-8?B?aG4zYVdyWnhaN1lwTlNOVGhZZUZFbmhOMzJpZGh4VXdpQlU2TlJ6ZkVrTHp6?=
 =?utf-8?B?TVNxcmo2V2tUVHJ3a1VEbURLUkRKZk0zaVNhTGtRT1NEcGdsQ09Oa09OQUZu?=
 =?utf-8?B?RFNpc0NHc2pES01EaVBSSjB3VkVRRzdjblI2cE9MbGFNbFhRaCtUNFJ1aURM?=
 =?utf-8?B?clE3bnFtczVpMHN2RTJ5dmw4QWpuSFg3cUZyQjdraUxINmxPKzhiS081dUVR?=
 =?utf-8?B?ekdrazNaNzhhU21Kakp6ckkxOGxqSTF2K1htV09pczgxQytXTHRocmdJQ09L?=
 =?utf-8?B?U3BFT3lkL05NZmFhbFJGTDdMSWhkWHZvQ0ZrenhaWVE2OXhjbk1iUDYwK214?=
 =?utf-8?B?ZGZ2VTFUaFQ1dFpBOEl1blNvbTRDZ0E4ZGtMSUNFb25nZmluT29CY1NqQlp5?=
 =?utf-8?B?TmdSMTJhS1BUbmRrUys5dEwxNmYxRVZhR1BmOUVmVTdvcml3czZRek1GYlBB?=
 =?utf-8?B?N1FRK1dhVUlOYmJWeStyZFdLZmFZTDJ3dWlLSTQ0MG1waXdRU0pvdFBOQVV0?=
 =?utf-8?B?T2JLdExmTEUvZTRlblZlbGdqbTBORTBJRkRFWUxhN05md3laY0RUdFdyNnMr?=
 =?utf-8?B?VDZ4SHBWT0d0K1NDdzIwZGM5YVRCSS9FcGpiRWlyNHNnNkt0Y2dxR3JXYmxs?=
 =?utf-8?B?amdYeXB2Z2ErSklhUUd1anhsbjY2T3BuY0ZIRTZpU0pENmZUOFZJZWoram85?=
 =?utf-8?B?emx2UDZ1VmtJNUtTZFFrcTJYZ0pudWJtWlp1cHJDR2hYcGh2azVYY3IzTGho?=
 =?utf-8?B?UlBHamJ3YTl4R3Z0blNGL0FiNFpPUHIzeUpQbXJhZ25WY2p2VkFQQ3owZElI?=
 =?utf-8?B?dll2VFd5QW9PYnBnaVJDMzVvWjNCaE0rbWdzWEZGYnlsejMwczZlelp6ZWx6?=
 =?utf-8?B?UXIvYm9iVm1rMGxtS0pXSmlnTTlhSFp1N3ZqTmxUZlRBZEhydnQrSCtlY3Ns?=
 =?utf-8?B?UkthVXRpVGJndm1KTHZKakpjaktFK24xaml3TmRRRXZBUG5yVE5xMk9mZHh6?=
 =?utf-8?B?WUJGb0wrTXBEcjJvbTFValYyZ2JZckJITW9ZMTV5Y1orTlpQSUJzMTEvdENC?=
 =?utf-8?B?eUVreHRtUE9VVTU4QncwcmlkYURDWUc3RC9KUys2YnMyRTZHL2lkQXFQS2Jp?=
 =?utf-8?B?Mmk3NWZONWdBWjg3Y3E4UzVaWGREUUtQWjRYNHZseGpWTVpDUmFCYk1UY1A5?=
 =?utf-8?B?NjFhbEtVWUorWmRGMEdkckFaN0N0QnNONU9NSm90bUFpL1VMeEErMmJDQTRB?=
 =?utf-8?B?QmlNUXBjMjdFTHdFTVozeHNpZm5GaWo0emovSjRVVHdwamErRGkvMTFCaElM?=
 =?utf-8?B?d2RWVjZoT01acW1aeC9RZG1OSmlxR3lOYUZqc2tNeEtkbndPSWJzQUx3UXRR?=
 =?utf-8?B?UE85RTYzeUF2T2I0WkxqclB4bU1QWmpQdndyYUlGOG5nbk9Jb3ZqaThValFj?=
 =?utf-8?B?clZmWmFXekhLQTMwVUFRL2FONXNEQUUrZzFwV00wa040Rk43MFdGWHNvMk0x?=
 =?utf-8?B?Q3pZWW5nL1hCWEM5aFJwQ0dqUTIxdEVKNFJjS2c5M002ZHJWZnNJbWJnaXdR?=
 =?utf-8?B?Y3JqS05SQjVZRnRtODg5RTl2eWIxemt6cC9maGg2SjNyWVp2YjZOS3grSHVw?=
 =?utf-8?B?YkdxWWtmNmI1VUpsMU4xNDVKMkE5TnVNYkpqUmV5ZVlEQVVqNlN4Y3IvUzl6?=
 =?utf-8?B?QWwycmh0NGVwbnQwNXFWTG1wT0dwS200VXJyMUE0NS9NNUZLVUZjdUdkOXZF?=
 =?utf-8?B?V01aTEFQOFZkSDBlb2QzMkxxSGhXSUkyVUI3YjdIMERKcmdkNXlUMWZQRlRU?=
 =?utf-8?B?dnVpNW5PTDlwTERrUEQ0VHlwemZDeU5KSS9jdHc2MTdHa2pkQ0VwR2thWE1y?=
 =?utf-8?B?TkNxYXp0NmFqc3g0cHM3RE0wMlppRzh2QzVDSEVZK2RDQWs0R1ZBZjRJdUFj?=
 =?utf-8?B?WlpxaDJERU1IM1dhQmZTaXFmQUVmeHd2eW11eWhOQW1hSmkxUVh3Zy9nVVZu?=
 =?utf-8?Q?HpkigIpjqgcemIk2IsCT1pwlk?=
Content-ID: <C8B45EC54958CB47B89C97B9F1F5E0A2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5163.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3633ea50-a297-44f7-358a-08da90ef063b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 16:35:50.2004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CKVBvviBVGLlJXuPn7vSJaP/MUn7TtavI3lebciI1/MlcK1KfF5CXIYdQK8lghNDhA1l8R1eN9Hm35rBbnf6DhT51c/pM8hXq4h+7ki1PA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_093606_420417_9FCF2C98 
X-CRM114-Status: GOOD (  19.70  )
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

On 07/09/2022 16:49, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Both basic extensions of SVPBMT and ZICBOM depend on CONFIG_MMU.
> Make the T-Head errata implementations of the similar functionality
> also depend on it to prevent build errors.
> 
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Fixes: d20ec7529236 ("riscv: implement cache-management errata for T-Head SoCs")
> Reported-by: kernel test robot <lkp@intel.com>

In case anyone cares:
Link: https://lore.kernel.org/all/202209070536.lIefsBuR-lkp@intel.com/

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/Kconfig.erratas | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index 6850e9389930..f3623df23b5f 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -46,7 +46,7 @@ config ERRATA_THEAD
> 
>  config ERRATA_THEAD_PBMT
>         bool "Apply T-Head memory type errata"
> -       depends on ERRATA_THEAD && 64BIT
> +       depends on ERRATA_THEAD && 64BIT && MMU
>         select RISCV_ALTERNATIVE_EARLY
>         default y
>         help
> @@ -57,7 +57,7 @@ config ERRATA_THEAD_PBMT
> 
>  config ERRATA_THEAD_CMO
>         bool "Apply T-Head cache management errata"
> -       depends on ERRATA_THEAD
> +       depends on ERRATA_THEAD && MMU

"Random" thought/question:
These two (and the sifive) errata all use oneliner depends
but the PMU series of yours has:
config ERRATA_THEAD_PMU
	bool "Apply T-Head PMU errata"
	depends on ERRATA_THEAD
	depends on RISCV_PMU_SBI

What's the rationale behind not oneliner-ing that one?

That's obviously orthogonal to this patch though, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>         select RISCV_DMA_NONCOHERENT
>         default y
>         help
> --
> 2.35.1
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
