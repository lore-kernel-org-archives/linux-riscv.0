Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E1BC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MT8ksJpvORDoTsp246IvibMp/BmMDXJzcuR/YZoaq4=; b=X86hSVnMLInqww
	8Eprhms+Ybfk9+YvfNLOirDCZjRKRVxcnxNTOApHcgOQKiDQilw8hns913HIeEJw62Qd1wss8X34a
	Z2l7yMhKzs6l/7IFtpQDGQBW+UgZisGgt3tDL7fnq9zPk7maZbwGpDI9BPkbnNpQn+Xpyyw6b6Ivd
	ZFLyt0sg2DB55Kp+bMvWRjRAC/RQdNyRqkUau6/oqUAGGTbgtzwVWKCDsSJGClLxlsKLjHbmkio5E
	ckTumCN2GtNuajdiy3q37/LgcTA4Pr7HWNmeV46Mt9GbNTMIJFKlxxXh16WEkiHzBehThAeQ2B6mR
	erZM7fAOJvV76a+oGEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLAoX-00GH04-Ir; Mon, 08 Aug 2022 22:01:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLAoT-00GGxi-R3
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 22:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659996091; x=1691532091;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J6l+LNMBKID0iJrfPHb/LlICyGZEpbj7HFp2Az0q77s=;
  b=lfD69bTZ1pE2KZz7XzI6ZbZljQveJslJDzdYdd8xND4QIesiyzKx0067
   o0MzJh+ZRHBoizFdAkyJoesiRb7CST1X7BVyp5cGcJDCkm1W0RkfXLMiV
   mmfgJnjU53XbupvGLSr4BskycNxGX4U33eNEcMMoYMT+bRqCxHciuMubR
   1fRuuQRqiIVl+bCink4owHIKaLk306SCtnOY/uroQLmruGgo6vQyqnR55
   MFid0Hr+MLGAet9m1tP3kIjUP2LprpQKPQIajQcjI7CZj1OgunkjvokWe
   4jF4fpt/Krl6b8lA2eN+DddcIsr4YqnfkY/En1a+D09A552IbF4y5FRgH
   g==;
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; 
   d="scan'208";a="175434128"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Aug 2022 15:01:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 8 Aug 2022 15:01:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 8 Aug 2022 15:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrErFCzR/VAyAZhVtq2IIyrLB1vM4ndc95EuknpW2feBnjqMERbjrGE2ibXoemVp/nf93Hq2aNH+6r+qYMuUOUFblgXbFxFa3eoSrwTPYxN1HkFPf965Lq6xRQeuVnkT0L01B6oL9t/NUJrcN2GB+52+PCJSGlw5XKi+k6XbsiczG4kRT6oZMvF102yaT+8k38c/EMc8U7dkxpYt8odbEUJq9b9DeirDVEHvkOcPKPk2LDuIGTlVozszGJ69FrKQ4TNlSq2RswbhfPFnNJtG0Tp92VBTjWrNucLyxTtUW8q3V+/btPdKcSzuMQaFWH8Bl/XP0tLxsHiiEJyKeXTKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6l+LNMBKID0iJrfPHb/LlICyGZEpbj7HFp2Az0q77s=;
 b=kIHqY8LyCorySkq+5jn0abEsDMSHpIynFoLWBhxgYcvLNTfRvVVh5Aoi6xqlHnsDig8A3Co9mS/hqZ2kSVtwWBxSMFfKrs6ZBlSd1y6rm2NURLbTIkcQewmbD19nnpVai6cGeuGPGtshpLN58lPpMmblMQxlrBTlbHUMQAaHO1eSwhhn9QMf5MbIW6pSh5mIOSyxJHQJlGOeevzyCq9Mx5hwLanffBVgqiw2I45VZ8F4ArdfALGk1T3awVDXlB0o3+G15q5xrWiC2S/pgODNyn6SwRBluw94NK7Ih+KUMpG6IH91izigY9ra7IpAbUl9vcl4TLmuzkVnT1igfUqFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6l+LNMBKID0iJrfPHb/LlICyGZEpbj7HFp2Az0q77s=;
 b=V3CpHvh/YdTVnWQJqBzl5q1e8wK/NgqPvyQikLi7YMLEO2mdu2H/fowem/cW84bIB4Eqkk7lplMQgT5oBRtPk91weK3/D7Wlp+MT1nJjUz6z9Gtv6RXTSfGo1e2j89+KI8l3jCgiPLAdAKKUDtnpZ+g8j3apl/qcOFZqLpexfoU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 22:01:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 22:01:11 +0000
From: <Conor.Dooley@microchip.com>
To: <jrtc27@jrtc27.com>
CC: <tglx@linutronix.de>, <maz@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<daniel.lezcano@linaro.org>, <anup@brainfault.org>,
	<Conor.Dooley@microchip.com>, <guoren@kernel.org>, <sagar.kadam@sifive.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Thread-Topic: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Thread-Index: AQHYqOiQvE59vmIAhkiZ1sZQKraNy62li3AAgAAHfIA=
Date: Mon, 8 Aug 2022 22:01:11 +0000
Message-ID: <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
In-Reply-To: <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65a2e27b-690d-4461-381b-08da79898176
x-ms-traffictypediagnostic: SA2PR11MB5082:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: msISlLUjjBDFFi94kRarVCFkqYz4DcO1alzkrvEqVraO7uU+HNf7lTFSrSNfclbutLpB42WDP/VjdjD85yFXwng9E6NuUbasDZ/s/WaNz5GLYvwA1gsYyLR6rPias358vgfKKMUjjtePN/AO6zERscGK17dB1cYrYgW58bACLs6S6F52bAh/OK8v1wxZsXtEF51LRKRiaus76iDyPTEi1+n48fZAGsTJg8mSExIIR3Ck+GA0wzZ1AbzvcSNnOYdAgZ+XSdWJ/1e6NtMpG481sHv7PwwOlyX45d+q4S8jgMqjQZNaXC2s0JGx1SBPQL7rmo1wScewdW3XhF5Nn4wR/3R1WH0dJ9F7o+cifQzDBYutLcNWZSHv3Blu7P8jx52fTZVygInhXx6d4lc/duEeCu6kzc2RKGt5livARxmi42WVJqFMkQB5yL6Z56V146xMdyr6kWJPU4p1HXu6Hi0b6rLOUKUv/kb1K7hS9NomuHa1Bd6LXpO5dh1wKfvyAyE3AnhZm3HpYyKKfzBjLfXjOKCMBwjG336mGkUXGFMdkUMDp55qHOukXrQ5mAs66tfkdO3zLoiZGIJvOXCghKGtRMUQewdRlXRXWRC+I7dMWhBDsx1/ph5VR8m3QKod1dWiY4d7L8gYw1x6c5iQ3OVshmB66lcSDqgw+e9L+InUdw+Oqn/eRmUZsp6lcY6jr0rVbOS22dTluJ5Dny9u0MGWxdgnRKMcTlJmbuk+smKPlTxMh3Tk1ZvC9wMUSoEoGReTa8gAOCxAfzPb6/tjL4mjjzzm8vcm0THyPq0ue7YIrhu1nbu77HXN0ZopgAtptP75MPu7JoicIWdiA7NaTBpUG7dMMW7tZZKmuF3reg5fsj4JGFRPBdS60fD8g/pSgV2C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(346002)(136003)(8936002)(71200400001)(53546011)(41300700001)(5660300002)(2616005)(186003)(316002)(6916009)(36756003)(31696002)(6506007)(6512007)(7416002)(26005)(86362001)(31686004)(38100700002)(38070700005)(83380400001)(4326008)(91956017)(66556008)(478600001)(64756008)(6486002)(76116006)(66946007)(8676002)(66476007)(66446008)(15650500001)(2906002)(122000001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ditaK0MvRnJtNHUxelB2TzRqYUM5RnBZT2RkMDhEblpXTFJjcUQzb2s3WDdK?=
 =?utf-8?B?cGpIU3Y0bUQwajBGc3hDSXNyei90T3pFT2FKNnVFNnlZSnhadmFRbkc3bEZM?=
 =?utf-8?B?eGVvNG16WGcwTzhPRDFmcHhPbzdkdjVpS0lzTGRiSFlNNkFrMWhHRTN6QVlP?=
 =?utf-8?B?YTh2NU5rMS8rZFloVW5lZUJNVkk3ZHFTUTRJa0lpZTl6OTdyMWpUNjd0THJD?=
 =?utf-8?B?SWhXbnc4QmhaYnprNEJWa2NGTCtHOENmdGRnUml4ZHVGR0g5bHN3VzNlUzJZ?=
 =?utf-8?B?bjNKTU5iejZZRmxxYU1KSGRrVi9zZmlKYmRDd3ZmeXU0VkVRVDZqL0xUcFZF?=
 =?utf-8?B?S3NFNjFVWURsUTBaOXNVNGVEQlYxYjhSZTlFSGpvbnpTNWsvUlRMaGlxaHFH?=
 =?utf-8?B?akxKSmd2TW4vSFpTZUVOejFrbEJGeTJSdEJLN3JoUnNGMklQZFltcmp6SUFN?=
 =?utf-8?B?S0dSNHVhUmg3NS9VNGNYWGU0VHZvY3hER1NxdHdnSmptVExlUWhWejZyV0hh?=
 =?utf-8?B?SnExYmdVbkc2WXdrV09LTUhIOVZaSjdOZ010MTVpaUJZaExEVFFuMUhZc05k?=
 =?utf-8?B?QVZMd3ZYaXFxc2pkdDdaN3BqWXFBanhNNzFhd0dudlpvSXlZdVVncmxNZXBF?=
 =?utf-8?B?ZmxMcGdBYVc3bVBYSFZjOVI4MWE0RTRsUFJKZXFQSEFGUFBBS2YwdHVSTHZG?=
 =?utf-8?B?T2l4ZlFnRWxlTGZNcmNkWkNHc3g3S1FUMmxha04yQ214RU04T0szemRWazVL?=
 =?utf-8?B?U1g5OUxuVmR2UlFiWGxqd0V6QTh5Q0Jxd0tJaThGVDZhd3JrZm8vaHdoK0Q0?=
 =?utf-8?B?Y1k2ZHlwbDJobU9SUldBc3VsU0JmeDhzYXg1NkJJalJmL1Y4eXh0YWN4Y1dU?=
 =?utf-8?B?cG9zbDA2Yko2RHpoQ0N4Qk1walZxd0dDZmdENHg4OWdWYXJXcDFOd0d3aVA5?=
 =?utf-8?B?bW8vRktkOExLUmRGUjB4WmVpVnlQRmg1OHRsTWNzTkppb203eHduY01rL2lS?=
 =?utf-8?B?K3lpdlcxSDZQcTBXREdBZWV1aWJxVFIrU3BlUE5Gd05mc0pzTExhZEZiSU5V?=
 =?utf-8?B?RGV6aWQ5MjJpRmxoZFZ5QlhSOENTd3NHUGo1dlAvRlI2TFNSOUN6SEF2THFh?=
 =?utf-8?B?S3dYU2FTTERrNk1sSCtaaHBsWXhsVlhGc08zd2pnMHJQV1EzTlY0WExOYlVV?=
 =?utf-8?B?YzMrOUtrcExHcEtDZ1dSdHdvNnNpOUVRRGUvNHZiMVo0ZUZhUG9iTFUvRHJR?=
 =?utf-8?B?UTJOaTVJWDZMRERLeXFZcXpuZTJnNHdRaU9vZ1hna1h4UVNhYlNsV2RvNm1s?=
 =?utf-8?B?TEN6YzhrclVmMkY0MysxSXlLVFRLWkVQaEF3VUhNYnY2Qkh2Rlk5WUZHWlZk?=
 =?utf-8?B?RE9VUDk1c1lMYkNZckk3SVJwbldzdGs3dTkzdUVlc3RIRGlWT0pNcVNhSG9V?=
 =?utf-8?B?UFl4ZHl3eE1FYWdTZndPOS90ZVUxZGpReHZWMk1RcWNUSExQU0ZEY0FBSkVP?=
 =?utf-8?B?RUNqdjU2OXEwQ3Y1Y0c0NGt4OTFibDdEdGZpcUkvajEvZHBTVGVXOU8wY3My?=
 =?utf-8?B?ZlVqbm1IRFAxWDBIK3R0YmswazhNdEJwYVVtQzhDQllHQU55M0o1UUwxRy81?=
 =?utf-8?B?YWxIUThldzB6WklzaFB3aXRKQWlTYmVBTHAvOUgzUVBvcUo1c3ZQa2M5N2ZJ?=
 =?utf-8?B?Qm9qckE5dEZoVU1EdWdpSVQ1OGovQy9GSmgvZ1ErN2ZIZ1JnQ1lXdTVRY0Rq?=
 =?utf-8?B?UkhWcHRHd3BNSGx5UGlWR0kvVWhZZTlDdldrWkNvMVJJWUl0RVQ1bDAyK2VP?=
 =?utf-8?B?OUFwVHE3eUdiVU9laUE1cmh6YUFiZFZjV0hmSmRRLzhkb2FBb1dyd21WRmVS?=
 =?utf-8?B?eEk0Y0NqSmZ3NGlnWG92M2pnZWRhemFxV0g0OVd5S1FKd1JnUlVJQmhQbkNh?=
 =?utf-8?B?NFhzcE5PZEZHcmF2dEtFRVB1bG1kOWJidkZGWW5MUjgzTkE4THE3ZnEreXhq?=
 =?utf-8?B?YVZrcWRkUzAyZEl0bnlIUjNPb0l1T3NYclFjZVBxcDJQNnZ1TWhQeUJrbmVU?=
 =?utf-8?B?eUxXRkZSazNGdXd0aHkrdTdVZHMzUElCOHF2L0RpVFcwa2lyK0xYMjVaSDd2?=
 =?utf-8?Q?YKkZtfnZUMYZJNuJHakIWaggU?=
Content-ID: <EEC662626BF8D744965DE4B2151DBA4E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a2e27b-690d-4461-381b-08da79898176
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 22:01:11.5210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JfWn/mVvfdrJ3nUdOUIuwa1BZUGzF0emexroSZpAFtYCL1dVEumU/Hd2VSarRju+HoaNq06BUiBedjZ6+NbV4OUt6i18jy1rOufuEP+OaV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_150130_195226_BC139754 
X-CRM114-Status: GOOD (  18.96  )
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

On 08/08/2022 22:34, Jessica Clarke wrote:
> On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The device trees produced automatically for the virt and spike machines
>> fail dt-validate on several grounds. Some of these need to be fixed in
>> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
>>
>> Patches been sent that fix the QEMU issues [0], but a couple of them
>> need to be fixed in the kernel's dt-bindings. The first patches add
>> compatibles for "riscv,{clint,plic}0" which are present in drivers and
>> the auto generated QEMU dtbs.
> 
> IMO the correct thing is to have QEMU use a qemu,plicX rather than to
> weaken the requirement that a non-generic compatible be used. Otherwise
> you end up with QEMU using something that's marked as deprecated and
> either the warning remains and annoys people still or it becomes too
> weak and people ignore it when creating real hardware.

It's already in a driver so I figure it should be in the bindings too.

In arm's virt.c they use the generic gic compatible & I don't see any
evidence of other archs using "qemu,foo" bindings. I suppose there's
always the option of just removing the "riscv,plic0" from the riscv's
virt.c

> 
>> The final patch adds some new ISA strings
>> which needs scruitiny from someone with more knowledge about what ISA
>> extension strings should be reported in a dt than I have.
> 
> Listing every possible ISA string supported by the Linux kernel really
> is not going to scale...

Yeah, totally correct there. Case for adding a regex I suppose, but I
am not sure how to go about handling the multi-letter extensions or
if parsing them is required from a binding compliance point of view.
Hoping for some input from Palmer really.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
