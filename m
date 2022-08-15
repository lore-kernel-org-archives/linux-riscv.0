Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774F7C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcCxSNH6RUOi1CYJ0+S/96v29uyXXCupfRwWTfCb8Lo=; b=5FPN8yzANVb6bx
	xNvJlwaAbsXD+QvhLsf3poE8lJMPTWgaMDBeXElflEmLSmGP6c8VCgR9f3yQjjmOnts2tuCQJWXNV
	rnzaaaI+s6S9svaH+ufyQVmQJ14Py6dB1SMaM+CGHN0slUtEZLilbpdcfWclf4PFnHsGLHcs2jzDD
	aP2F9OAZORg61c14d1KriAdxbru4oJtoLHM/yN9Sp+smaWhuhGvZlENyJd20kjJEL85qJHCY9D36P
	4/1MRL/GVhESR8gDmunsnl6oyjXOrHwM7QOTv7NbfCVR98nEmrHnbFEkfcf3F3/InS0yFXia8NQ55
	m6R48UdhcKRffCEsGPcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfKx-003dCx-4u; Mon, 15 Aug 2022 19:01:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfJq-003cGu-FV
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660590010; x=1692126010;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uu79OLNHqQulrvwkP9vqWUMRkepNMv0P+uDaZRm+IzA=;
  b=QuQvfZI4lhnS9qkf0ruxhV66/bXyvgzV7j01QI1nOl8+Y/vhMXCBLWq9
   Ohf/FZuQLG8idoDQ7k9MDXL8M/xq3junehJNO3bZR92GciwEdD76m6Y/H
   4KD17Myo7BpiADVe0UQssFm+c4HKQZrXHh4Qxp5mfYAFkl4+iz8nrpPaV
   2KnYx4xP3Kal0HKJjiop+FWdV0KCgoUA+rlBwAlxjczNr2TuN7x5pIHRW
   WlJrP8duYMXJ1FTeRBSIeSL5M4lH+Fh+mlaIr929MKzh5Fii2uQ3b/hwL
   Nro2disvRsyrLrwFOBrPbulNNAhPlpq9XOPcpsIIxpBn4+1bRmWzbq2At
   g==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="186541876"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 12:00:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 12:00:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 12:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkSOCvM82kh4r0yhqlS2/fOtE5AmduE4Wh/O9hN17h2Hg+Z1Yvn1obuPjJqqBNnKaRkJwrEeuEl8v4Z6uHDboezYEA85plbMgsR9XcvfA+/n4Yuov4fRnAZYfrONW0K4NhZnsCBQbKKFQE4Hb0AR718m4s3hRgin4BZU0P0ZXoP1P//kZE4hRq6H4oFMDX3M4CPCDGuOdbzF6+1gvLaHggUX68oU+p5JLz0YaqdwETszA+JkvB2/UkhGHElNJlFUawD/hZViRuq/vJJInaVcxtWqnWF3DxZ4xBFfJMlxGYI9GZdehZN9qImXPWE5Ot2sVCMXIkMp1JW5Q9mFJJakow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu79OLNHqQulrvwkP9vqWUMRkepNMv0P+uDaZRm+IzA=;
 b=LDWm04RBS9cIcJZmuC5i/Ou6AEnYysqiV2ZHYcxbWmdRF/nEJZRvEdhWVaaQmRdc7cXbbHwUUn5/hAFjChXbiZMdrASYyTetAkOK7VotaFfOygiHe0x+GXOhbkJQeOZkIsoTT2sbQfEIJpyXqbjbzUNvytmIKPPzwFHcBq9+ZR9qxD5GszTKcye9kL6wo6fzFeVe1gh4OS207+sho7+FAj4WeiL5t1A5CuqRHlHS0xJRkotH5+8Tzmix31V3jG14ndJxMaurlJJQLGASgRQKo001jY7LbT2htemVYftl56dNIIFb4mTW4fQTPFVOj/kpLn1/CgAHk5Lm+Np8VStAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu79OLNHqQulrvwkP9vqWUMRkepNMv0P+uDaZRm+IzA=;
 b=VS3INe7UpqX+LQsNks/7YKSabpfdq26hFbmuJzNbvr6OrHbhqKawdVDI9Pqg9ZDMzwP8KrkBwpV9Esz/ba1pUMSBKjp/1+8/pXCe2w/KuAIzzCO69xhzKmrZo2cHsR1tZKghR77hPOIG17Df6Aj8sdB66hBr0vomSrYx97/ibW4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1457.namprd11.prod.outlook.com (2603:10b6:405:8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 19:00:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 19:00:05 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>
CC: <anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
Thread-Topic: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
Thread-Index: AQHYsLovHvp8srW8EUKH5nn4yyg3dq2wUQGA
Date: Mon, 15 Aug 2022 19:00:05 +0000
Message-ID: <07342070-d96c-59fc-f9dd-b65cd742d97a@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad885c45-039d-4f11-5ef9-08da7ef05ddd
x-ms-traffictypediagnostic: BN6PR11MB1457:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sCy4FNPfZU+ToL/aU7IiEtR8J3BMAtAHxL/raMj2lgpubWlVxFkgO9s880Cmmy/HY/r91xnH2y4b8o39vSAL2aOj9H7HvSjWRpiUr8R+s8VQYTiiT6hlssWLjnAG9HWS2fYCdEvkk0M9j6lO38CEPs7iuFaRtPrmaj+EGebMDVPAJBTN3ZSiPrdhHntGFMbzNng0OtmcayHv2W2IWjrfxUUV7Q5m+Fz7ae/Q9iKvZ0QfBBzoA3JszOPiAO0cN6b0Iarzg2u7Lqi/m3zaSVFjMCzxxcPrCsIBcC0Se04VH6EvdHoZ/2Bs2RF9fvjvHCtRFcaDZN7vH8M/lcGpUAhRlXamKYbodxaMiYqR1hUv3ihNMIVy6wXY85RYZPnj+fpT4CarJVO9DJQ/OY2ll0CdWEB69vMcic4Lem8RbXyFKi/y829FmxxQSuluySX2BH+KSN1atwAioo6S75DtaNHjsqVGo3ZPTLmpZfsImdJHOxa2zV2lR5GHm07Om5HXWdyfvBGh5IRwnnzabHD4ubm/SvmzPj8xiTucutpL+F46DFKmgdTd+GOG+rxFa70LXgvlTv5CFnGq+Ts/2qWKk0uKIwTcYuy63T9uaQXR6V66s61VJITjOrbCzuoiW/DKZmXypKVNN5xdZ9LwBLfubZFIL89dC8vsdcgwtHG9VK5PacFubyW2xaP2roa3Z+/I70kYJx/Ru3o6poTAozZZC+3RLVWlimnfZxyATP6oJEKpBPkmbnA6X1Cpxq/YZYInCsDCs4g4g8yY8Vu0Du74Swsq/pQfHDPbeaKLbUqXe8shIQGKmpvpXXmv+3m6vBRYNbDfzeNVvI6hZweQu1CcQ0tAaSEwz1YIKQTGxt3si/MjD/gjeyZ49UU4TTXxGNLHUeK++E5iUMu/LZi5/ijm0K3F3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(366004)(376002)(346002)(7416002)(38070700005)(54906003)(5660300002)(91956017)(316002)(66556008)(41300700001)(76116006)(110136005)(64756008)(31696002)(4326008)(66476007)(86362001)(6506007)(53546011)(8676002)(6512007)(36756003)(122000001)(31686004)(2906002)(66946007)(26005)(8936002)(66446008)(83380400001)(186003)(2616005)(478600001)(38100700002)(966005)(6486002)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDZDMGxOZUVoK01uWFNZZmZEWkoybXJBL0JMQzFkc2FnRmIvdFNkRE5ObXpD?=
 =?utf-8?B?THFaeTM5M0pPVU1OVVpRNWQvSmM5YlNTam9ocWZEUDR3bjlWUkFKaTZpWUNp?=
 =?utf-8?B?RFRlQ2tkbVhIVEJJOXh5ejJKTENVTGVmajIzNEROQmxDTVhzTUhnbk9BaEJG?=
 =?utf-8?B?ZDdXVzJUQ3VKb1orNUVnSTlQdXJjNGFZY2ZxYXpwamhXcTJpQ1IwUk9IalY4?=
 =?utf-8?B?K0dyRGRnekFsamhmME1HcjUwdVdldHJRSUt5NFhpRFowbUk1OENWMjBQcERl?=
 =?utf-8?B?bTBNUzd6ZU9ubHllRFIvbHJHOGMwS2YwSytmY0JpNStSdWROOUl5eHM0Sis2?=
 =?utf-8?B?U3l1Zk5kMEI0VGVBaEJ0R3U3TUlaVkJVdEVPSGw5cWV6Z3ZXcXY3cGJVMFdK?=
 =?utf-8?B?cGUxcDlERTJiazVxSnVmVmlJSEYrNWRaR2pFaU1xUDVJcE11MG4zNmRkUTZr?=
 =?utf-8?B?NFljZ3pUeTBQWTRyTXBzeTVpM2J0NDhHTmkzNlBWRDBicHp3ZFB3SFNtdWVp?=
 =?utf-8?B?cDEyRjVZWmdURkZRR3VBZzNFM0tDdE9hV3dPd0V4T2hER1MwTzhqZm5YOG1B?=
 =?utf-8?B?QzBCRzVNYkJobytsRUN3eFRSZlBPRGdpVHkzTWZYeWkyS0Y5SkJVTlB6eUdR?=
 =?utf-8?B?djNsUUNNWlpsK0EyKzlaL0NZOHFDbWE1RlZZRm5kRnFxYkpKZDUvM2RUMEV5?=
 =?utf-8?B?VlMzazNSRnFqSmxtZmlGNmZOb0EzM0NrUTlodEhYa3V6QlNlT2p5V04rUDhp?=
 =?utf-8?B?K0o4bUxFdXhkVEJWUnVkbjNqM3dueXRQRXdhaTdKYUlBaUZEV045TWN2RUZx?=
 =?utf-8?B?M0FiQThkYmJNOGtaVFh2T1hkbmsrZnYvTm9kVE1vS1JhdXh3Z05SZVdyUnp2?=
 =?utf-8?B?K05KRk8wMGF1WUh4aDhHMUdYWkhYYTZhckJyK1RsWFJLWGw5amY0Z2hFSFFT?=
 =?utf-8?B?aW1LUkdydTg2Z2FXWUY4eWZGSGh0RU1TNkxDZjFNUG1SaE1Xc01oRFdLTXVu?=
 =?utf-8?B?OE02Nlk0TGF6Z3NhVDRQRkNXVXp0MWJtWGxGV1gvWVl3VkFWU1B0K3ViR0dB?=
 =?utf-8?B?NWNrTnE1N0ttMWNFZGxIaStOdlJBNVRxUTFhd1J1eHhqNGpTc0hWV2dqWGtS?=
 =?utf-8?B?a0hnOFQ2V2t4dnhQL0xDU0ZDREJuZytVUEl2bXdHMFBBVzh4SDlZVGRqMi9n?=
 =?utf-8?B?NzVsZnVIdGJJbUVCYnI2aGRpQko0ejAvaS9ZNng2RitON29Gd3dKdjNPWEZ1?=
 =?utf-8?B?OUduTk9qM090NGltc0IySTJwQXhKVjBkRFl3Sy9Mc0tmUUR5NlMvQ3Z2YU1j?=
 =?utf-8?B?bnZkSkRoN3FVZXJaU3FEK3pJR0cxZERxZ2ZPOE12L1JYZDZuNE1qRXNqMHBv?=
 =?utf-8?B?eFFJQnlrOGJDdjFlRDV3YnBuZ3dqK3pRNUFVRkhFYXJmdlVFNnlWa285eVlZ?=
 =?utf-8?B?ZzlpZWVQalU3ZklPSzBmZi95OFNTdEs2eEVtR28rbS81L1RuUUhnWm0vRERO?=
 =?utf-8?B?MTkxR0UxQStLcVJQMUd1NjUvRXJicVpjWmR0VVhIaDZYcDBydlpiTGFMa05h?=
 =?utf-8?B?UHZWaFk0MHNBSjlITS9SUk0rUlFzYVhIODkvK2tTUnYzZVdpbmhOQVVTbEFB?=
 =?utf-8?B?NEVOSXEvWlpJb2FpSnlOOS9XQ1Q2Z1BjWlpJTVM0WnFSVDQ2N3ZySEdTU2J5?=
 =?utf-8?B?RHVsY3hneWJDL2x5NGtCRmtQdWxqc3pzODA0ZGFSZWZkNlM0Q052bUt4aGl6?=
 =?utf-8?B?WU5HY2JQSjRyZ2QwcWVEYTV2SmMyWnZ2KzVYY3RzUXU0bS91aDRpZW9QNmlH?=
 =?utf-8?B?d3JuNXE5OEZFWCtrRTVWbmU5NTVLU0FRT3lYSVNyMzRMYWh4VWkxbTR6RzVp?=
 =?utf-8?B?SkNoVXVIdmtEdnVSeHVBRFNOTlNzSEhEWGM2eWR3YzJmTFB2SEZtcjF3NlEz?=
 =?utf-8?B?am9ib0ZiaVZvWmJ4UjdLblBzN0dLN1VRektUQzRsTUR2VXd6a0NFWmY4OTk3?=
 =?utf-8?B?QTNqUXNWb3d3di9CaFpMa01YaVEzYU9lOHRpREt4dG8rQ0JiWExTVWVHajhi?=
 =?utf-8?B?bnBuK0l6QlB4dVJrQ3RIMFRoZmhBYndNWEo3RTM3ejVPUnVDSUtUamhLS29j?=
 =?utf-8?Q?M9HF8DH6coR08HXd9rkvAeaaU?=
Content-ID: <560E9390560B2C4FA7EE54F459634C47@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad885c45-039d-4f11-5ef9-08da7ef05ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 19:00:05.8073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+DWGFKme2Gno1egycAS62Q0hJdQQFyddfrvuNuCb8euCocCzvPMUqkDPmf+jKm3oQJnaQpUGCqce2x66eAPX3A3slZ4blkK8R68ZWbOqBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_120010_635320_FD55CB86 
X-CRM114-Status: GOOD (  20.86  )
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

On 15/08/2022 16:14, Lad Prabhakar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Enable the minimal blocks required for booting the Renesas RZ/Five
> SMARC EVK with initramfs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * New patch
> ---
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/renesas/Makefile          |  2 ++
>  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 16 ++++++++++
>  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 22 +++++++++++++
>  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 32 +++++++++++++++++++
>  5 files changed, 73 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi

Just to sort out some of my own confusion here - is the smarc EVK
shared between your arm boards and the riscv ones? Or just the
peripherals etc on the soc?

If it is the forver, does the approach suggested here for the
allwinner stuff make sense to also use for risc-v stuff with
shared parts of devicetrees?
https://lore.kernel.org/linux-riscv/3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com/

Would at least be interesting in hearing more opinions from the dt
people, Geert & Palmer. We have some SOM based stuff too with carriers
so I am interested in seeing how the cross platform part of that works
out.

Thanks,
Conor.

>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b0ff5fbabb0c 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -3,5 +3,6 @@ subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  subdir-y += microchip
> +subdir-y += renesas
> 
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/renesas/Makefile b/arch/riscv/boot/dts/renesas/Makefile
> new file mode 100644
> index 000000000000..2d3f5751a649
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043f01-smarc.dtb
> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> new file mode 100644
> index 000000000000..7428f643a9b3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a07g043.dtsi"
> +#include "rzfive-smarc.dtsi"
> +
> +/ {
> +       model = "Renesas SMARC EVK based on r9a07g043f01";
> +       compatible = "renesas,smarc-evk", "renesas,r9a07g043f01", "renesas,r9a07g043";
> +};
> diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> new file mode 100644
> index 000000000000..4a4acde6a2a7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK SOM
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/ {
> +       chosen {
> +               bootargs = "ignore_loglevel";
> +       };
> +
> +       memory@48000000 {
> +               device_type = "memory";
> +               /* first 128MB is reserved for secure area. */
> +               reg = <0x0 0x48000000 0x0 0x38000000>;
> +       };
> +};
> +
> +&extal_clk {
> +       clock-frequency = <24000000>;
> +};
> diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> new file mode 100644
> index 000000000000..4864a2a62d6b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK carrier board
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +#include "rzfive-smarc-som.dtsi"
> +
> +/ {
> +       aliases {
> +               serial0 = &scif0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +};
> +
> +&pinctrl {
> +       scif0_pins: scif0 {
> +               pinmux = <RZG2L_PORT_PINMUX(6, 4, 6)>, /* TxD */
> +                        <RZG2L_PORT_PINMUX(6, 3, 6)>; /* RxD */
> +       };
> +};
> +
> +&scif0 {
> +       pinctrl-0 = <&scif0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
