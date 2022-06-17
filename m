Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1DFC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 11:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbwhfgRzNqqISGIbPWy9C2SLBBpZDs2w6CagSGcy66Y=; b=KsCQ8M5u4angP2
	PcNQn3d9HbnFFUZJG1/sNiJY5tZ1Jk9Qul/116GrcLAuHScTjw6j5oqaRX1wePU8NHRTmW80l3Uhe
	Kkg78Pz7xRQnLfddP+j4WNTWWyM0fDDqGMwNvnZ0+fmwkJd1bQ77pS9d485hNK4dO7jlDZvhBStUu
	9eWYnis1owGDRkSjtr7yyjCnCb9EpiTkP3iOcsNpCnfsRatPp+cDoQw+bZlcT2TqDeO4+FwTqmEP4
	ZNhPA/+fBp5FMXS9lFUjMfbgqAezjkHgFq1oqM5sG8wXePJoVy+Ujw85EHlW+8iC5Xh75WSdffstx
	1INO4f7O24dQHYT150HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2AUX-007RU4-3S; Fri, 17 Jun 2022 11:50:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2AUT-007RSy-VJ
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 11:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655466617; x=1687002617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V1UCbZNQeGFuIWVeR2AQt4dW1+llsvy7w2i2Cebtmbc=;
  b=PhG+jYzHibW0WkIcxbrkLHpEkG3vxKyM1O7P8Eijsbp3nfEggyuIOjUB
   FwxTztOIHLoOEI0cVD6wUn+/DLXLqszLFIqhd/Qk4H4du3gKgRymET7Kc
   dDA4uQxoP4yHAdDmxJBm/n8oYRspyZp95dzfsVodLJmTCl4vAx4VJTsdi
   yrMCNG/ve6g6UzxgKAzUtVb/jy2fNI2uJIIdpnVY8E0maT3eBRvcbmEnI
   2YMiGXeav74On94fTK7hCaDv7pc+d6i4gpYQRdD2eRrmgtSVvWs7sdZRY
   sA5NX4qHYbCIzlhV4w3ipLJKLFoQE2f5frVO1JNbg0Sc06Dd1pufGgda4
   g==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="168530293"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jun 2022 04:50:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Jun 2022 04:50:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 17 Jun 2022 04:50:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU2S5R0xECH56yy7NYhgXf31tW9bneqiZj9j4MJsoZcpaqHImrBTbE+L+5u4KozEfF7AOnmF212PE+sBnGW1GWLAS2VseQK+GKwEmdfjUvtv0XtJnNOrHMwQkylv21ZQp7lGoGMi5iGhgg5CaApqJiHuTqaxQF8Kkae4E9OT72k2niHtTq3ZUpfeSWSN+cFqwEO8W3uEKMD9hR7SQLlN3ObNnuBTvkNRixdt6dbnuubMMo1dtDr1wD6m8CxYSLDH016EUu6+9HfdOf31LoU1qOUAvIhmuY8exred5mOkV1Br4FVKc4txq4GtpgkaYpzSrVIRCo3L/0nlfm2ARvqzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1UCbZNQeGFuIWVeR2AQt4dW1+llsvy7w2i2Cebtmbc=;
 b=HIPiuHWXQztXwkiT3au3/psXvYgJ8bNqf6tR5nRtRSAQABUf0usTU/FZz4QYbTuLDaALp5T5xrkxpHxuHh5uco/Q+oqP+L/PJ0cujQ5+XGI55+Hxr/UYZpKnnOiWwXlNMa7s352+CHKUY85VWobFQzhruEwWM6OllQzqKN8pR0gtcc6IoQALRwtZQREm1uYHOWdBN9Pul0cJJ2B5HbmHma/Kx7+MZzfKTSPgsdIWUOdhW2QuxsVw1NBcohQnHy1n8gMz7B7eW4FYK+4UG63uJ1hP1s5gDW/+5mD4IBdM4hHQw9Kcr4kkc1Ea5mZADyanMGtUWEUpcoXxfdPDzPYGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1UCbZNQeGFuIWVeR2AQt4dW1+llsvy7w2i2Cebtmbc=;
 b=lTYBMYqBY1AN0wJ58k7yuOVuNhvnhqvqg4OnVLV5Y4/pzNz9a6eju6C4eoovt2K18H/FvO5LhWnrDc/MOIi+6vaGTojO4VEYalK3kpo2MOmx43bkd3mbXaNcaDXWOifWsflPbFsKEYnIG09u4dZ4PUSqiZ4Os5NCVYOJd17X1ts=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3245.namprd11.prod.outlook.com (2603:10b6:805:be::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 11:50:14 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Fri, 17 Jun 2022
 11:50:13 +0000
From: <Conor.Dooley@microchip.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<lee.jones@linaro.org>
CC: <Daire.McNamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 0/2] Add support for Microchip's pwm fpga core
Thread-Topic: [PATCH v3 0/2] Add support for Microchip's pwm fpga core
Thread-Index: AQHYgj/xR/Z8Ogp3NEW1l6/5WqQ9pq1Te+GA
Date: Fri, 17 Jun 2022 11:50:13 +0000
Message-ID: <a2d97203-dd8a-69ea-fdb5-b25f3937163f@microchip.com>
References: <20220617114442.998357-1-conor.dooley@microchip.com>
In-Reply-To: <20220617114442.998357-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86e9adf3-02d4-4b55-3f18-08da50578a49
x-ms-traffictypediagnostic: SN6PR11MB3245:EE_
x-microsoft-antispam-prvs: <SN6PR11MB324533790819D0CE45B6D6C498AF9@SN6PR11MB3245.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fa+CYmsQieCdhAb5Jg8yTFkp9mKTrdjjbZFdryftU/Oz/5AzoSXNvCaDKxG6yy7sU7SfO9dzSHDh/tvo9GCDowdUzNELI7QD2F3BYvEfteI4qW6x7fXAIHZfef834Qt4kNVwgmZBjmL4wjAhqFERbatb0p/w9+cnQ33tyJ6lr14nYzYE906+dKOTN69ETGEUt9lTVdUueX9//S8FWmev2pqzWYtOp4ky34u+mR90swDxveoUqj/uP0QHIQNnUvf0Btn6f34S8tCnmnd2RbRAUtn9CgJeelMittWs2T6yccV+j23O6WPyCh0SkhWMDYQF4cj3J+/P0KfKsBCq9pwgG76vxscSsb1BmgfCNYh+LaNIpovBAYWlTGYJ2e7Nseq5U9StQwZD0qrjO7LtXXDAuaE8L/fNTpmGQRQrBnZDK+pqKwjRgxYY+7Ci5NAJUoNgbvxQfgs6/6XKeRj+OQFKImgU7IhTlOgoh4/R832ZQxtusWF+N5i/g4pP35cGw9jYYuP74pCKrGHVr7PtCH4mf8AkIr8+GPL6HxRX9yPo5/U0mAeHDChdLY+bdG1C9/qZABZehExqw+TUE0WbhBKmXyL4DQTkiPCHhYysNOFBQSED0yZ5w6ODV27zPMpzpd89GPbY7ubzNPIZZT6Ijj5/RIt7ADt4IpQg46zfnCTRkAYT9K9bF9pwFoYmTpMZdQuaMicraYJU0LfM4gjEI2C7Q55vCyogVdvpk6z2OqoKFrpuUOmeEvEpwDMyF68t/wVeku4sH8JFZRlRz6FXZGtylw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(53546011)(5660300002)(6486002)(8936002)(6506007)(31686004)(64756008)(66556008)(8676002)(38070700005)(4326008)(66446008)(66946007)(76116006)(122000001)(54906003)(498600001)(31696002)(110136005)(86362001)(66476007)(91956017)(316002)(71200400001)(186003)(2616005)(83380400001)(36756003)(6512007)(2906002)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dklxc1N1Z2dlUzlpRzVVUkdKS1lGcFNMaW8reHVnSStmTGNCeHhiWFNNcWpu?=
 =?utf-8?B?eHA4WVlVbEp1T0dxZEpDckcxdFVGTDBwSEtIai8vdjVkUnNhM2cvN0g1Zkpn?=
 =?utf-8?B?VWMxS2djRlNWam1rN0dZQWp3WDJHRGdnNk9NczF4TGppNjBZNXlYdWw1R0RN?=
 =?utf-8?B?TmhRWmc2eTRLSEZKc2U0cWFzZGw3T0Z5NU13OWVKd0JHNEcxaXhqQWI3T1Ri?=
 =?utf-8?B?L2dMRW5FRzU5bE4zOGJ3YnpOSzhremhnaEtzYlltcy9PaHNQakxkUnBzN1ll?=
 =?utf-8?B?OVBtWHpHS1U1b2tjQkdxWEErMTZLNmp3R3orM3U1SVN0cysvZU4yRDdIZFZu?=
 =?utf-8?B?b05qa3pOL0RQSDJRc2NLdWNDTzFpWEU3WWo3ckNEZXFHWk5EMkRzeXVsZGRQ?=
 =?utf-8?B?NDdIQW8zNW9RZDdpS2kydXBTb01VMC8xamVlM3ptQjRhb2JVbFg5aGdIVEtn?=
 =?utf-8?B?UHZsOVVKOWNrYWFXVkRQdk1pek5CdnlKOTRrWHZ2dm1HbEJxTVE5aU1rNzVm?=
 =?utf-8?B?UlE0Tks4b1dhM2ZicXl3UkY2NjROaHd6Unpyaml2YzNpNU5tcFJZK0RsbXp6?=
 =?utf-8?B?UjZETUpERXE0MVMxUk82bHpnMTZ6RG56RnhHc0loWi9lSVJPZUY3cjVmbmIx?=
 =?utf-8?B?em45QXFFL3lXSE1SL0NTMzh6U0Y1dUszZ0dUK3BZUHlQdnBmOTVCV1E3alpN?=
 =?utf-8?B?bjVmbEZONDQ5VE5rVXk2Q0xiWW5KOWY4Z3hjRldnVUZlVmowK3BMR0o1MW5t?=
 =?utf-8?B?QzhUU1RLR3R0SlB6ZC9RSjVHY285WGlGbnJIRFJkM3ZnRWljTzE0L3Q0WEU5?=
 =?utf-8?B?TTJwNkZwa2JFcUU4TFdXRU5sOUltblJpRjNXYVN3V01vSUQrRUxtYkIzWjVl?=
 =?utf-8?B?eWlsSFJsdmxYcUpCc0FwdzBVT3M4RHVBRUg2QS9JVlJMMFA3TjBUUDc5LzJj?=
 =?utf-8?B?RHhUV21FQjhiUXM4TGZMRzkrTXJrSVBVV0lCOHVPcGZWZlpSWEJieHpQa2Zk?=
 =?utf-8?B?KzhCMldlZ2trNUZmOUNRSVo3YlNOdm9BdmtCOE1xa00yV0duVjBmNmdnRkM4?=
 =?utf-8?B?ckpVZTNLbzJrNDZKdmJHQVkzeERWNnBVVlkzVnFwOTE3K3o3MXZ0ZHlReUxp?=
 =?utf-8?B?UVB1N0VvV2o1Q2FFR2FzTGNGRVVqQnRnb3dTVDA5cFBSZkhNOTM0aUNBb055?=
 =?utf-8?B?SWlRN0EzR0ZzY2FtYUFzZ3VTNldORlJleTF2d1lGcXVGZkhlRzV0VWhYSnY0?=
 =?utf-8?B?eGZyOCt3dDlRUU9BWVVoandnU3Q4WThYSVFOTEtyYkJ3aXh5Y0dXZW9vdGFG?=
 =?utf-8?B?Q1dhQTViQkN3SUhtV3dyNUxhaFFYYU9oU1o0R095Tjc5T2tQMVFJQzJiN2xU?=
 =?utf-8?B?K1Y5dm91VURMU1dGbUF0YU9KYWlpWUJYd21XQTB5Zjl3UE96V3ZQSWowSVVO?=
 =?utf-8?B?MUgvSklHN0lDWEFUbUtXOGFPSHgvWGhOeFJEMGhpczc3aWt3K3Nkc09rdnpr?=
 =?utf-8?B?Y1dwS1VnOEtjVUF6RkNJc1FuaDZHSUtseStoS2VRekdOcWxILzJEZ3B3WUUz?=
 =?utf-8?B?akwwR0tZaUhCb0NPekd4cVBkYjRlOWZ1MWJvS3paZ0k2RUNEZkNWS3d5L3RV?=
 =?utf-8?B?Z3plUmhQWmJoa0ViSjd1aVdxZWVrRmVlc0dkTEdiOGEyemhtTHVUaHBuSGtR?=
 =?utf-8?B?VEcxb3Ryb1BDcHRKSDZWdVBDaU5naWxXaFFEeVZOTW5wTHpsSCszeFZPLzN3?=
 =?utf-8?B?MUlJUHloTW01K3o3VHNYajF4NXpuZ1AvK0QzNXA4TEFxaTlnYkJYVTlZWFUv?=
 =?utf-8?B?aDdBeUcwVEdUTElWWHNQMlBKQUovZkVLSml1TTBETDJSd3NEa2VwSUt3UVVl?=
 =?utf-8?B?ejlkUjFnUHpMRWs2QXBQR09CSW1DSlVQRUJtK2dGbTRsU0dJWDlSTG42Z0tm?=
 =?utf-8?B?aktFU2hSUGtLcGg0RFVJdWlmT2d3NTN6cTRSbVFzc0FWMG9nR0h2dmZjU1FF?=
 =?utf-8?B?Q28rVThrdzZTblF5YVIwUHMvbkxYWEU3OFZpTU5xQWRQQnBnZkN4ZGpkNU85?=
 =?utf-8?B?QVhnMEszNTRHelZSVW9PaUlISEQ4WlpTYk9GSSt1OEc2MEg0Z1NsWVRiVUlz?=
 =?utf-8?B?U2pnSjFJRnFTNGhEVHJxUzFDZGVWVTZUS0VKc0RML2ZTSGtndDNKbFNwMXR1?=
 =?utf-8?B?eCtqaWUyZUEvWXE3SFVGTFV2NDRoOXgyN2NialdVelZQbDRQWm9URGxFRWxO?=
 =?utf-8?B?UmtGdERYVlo2UElQaVR6NUNvYkdiaFlGYndvN3VuMHIyM3hLRFlDMnpjeVB1?=
 =?utf-8?B?T1dGdG1CNm5wRnpvOUVXeGg2azZ0MW5QZFdyUm5UU2V1V1VpMzIwaXo4enVF?=
 =?utf-8?Q?DiHRaLLMMhfSOMHs=3D?=
Content-ID: <3EDD57088E9254438F452D2B7D612A84@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e9adf3-02d4-4b55-3f18-08da50578a49
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 11:50:13.8309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWDlWGwEhgQWOJlEot+mzh+geRzAZlNn1xNvE1LoXbgMG+KsEsWpwqR3AB2CzsBYQH72wfE6BWu38c1notIa5bnb2/u1mv7bQVxDIPsSJkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_045018_271362_9D9A53E2 
X-CRM114-Status: GOOD (  22.78  )
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

On 17/06/2022 12:44, Conor Dooley wrote:
> Hey Uwe,
> Got a ~v2~ v3 for you...
> I added some comments explaining the calculations and a documentation link
> so hopefully things are a bit easier to follow.
> 
> Code wise, I went through and sorted out a bunch of issues that cycling
> through the different periods/duties threw up. Along the way I found
> some other problems - especially with the longer periods which I have
> fixed. I also added a write to the sync register in the apply function,
> which will resolve to a NOP for channels without "shadow registers".
> 
> Other than that, I managed to ditch the mchp_core_pwm_registers struct
> entirely but had to add a short delay before reading back the registers
> in order to compute the duty.
> 
> Thanks,
> Conor.

*sigh* yet again I forgot to mention the potential maintainers conflict
with spi-next..

> 
> Changes from v2:
> - fix percieved idempotency and rounding issues when shadow registers were
>    enabled
> - use do_div() for divide of u64 tmp in apply_period()
> 
> Changes from v1:
> - account for edge "quirk" while inverted
> - block changing enabled channels' period
> - document the hardware/driver limitations
> - rearrange get_state() more logically
> - fix cast sizes in get_state()
> - fix remove() and probe error paths
> - delete mchp_core_pwm_registers
> - simplify .apply() logic
> - don't warn in calculate_base()
> - fix period calculation
> - fix duty cycle calculation
> - add COREPWM prefix to defines
> - add a documentation link
> 
> Conor Dooley (2):
>    pwm: add microchip soft ip corePWM driver
>    MAINTAINERS: add pwm to PolarFire SoC entry
> 
>   MAINTAINERS                      |   1 +
>   drivers/pwm/Kconfig              |  10 +
>   drivers/pwm/Makefile             |   1 +
>   drivers/pwm/pwm-microchip-core.c | 325 +++++++++++++++++++++++++++++++
>   4 files changed, 337 insertions(+)
>   create mode 100644 drivers/pwm/pwm-microchip-core.c
> 
> 
> base-commit: 61114e734ccb804bc12561ab4020745e02c468c2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
