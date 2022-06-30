Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529ADC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 18:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJ2RSMRirmZIxbcvk+3B6p6QToGIfAPYqc3rT9AUkTE=; b=o04hE8frPJF/gg
	JaIeO8ivsRGLOgkVFxXRXqUT1F6fZ/TFs2i2aHablbOraFJ4Js+PqsktZtB7ILUHlkQE8Zwl6y7FA
	KDCXma3bYLzlE/a3x044AyPplveX7IUsuNgsP9SS8vtLm6el18Bc56N+vagiTqe7DXSUpqjK/obDZ
	0TPSJh5PHgPRJrs4cIIXYD86HaO9Au+v6xLhjG5W2Lh9zxbdat+pw8ENYp3fGbKTecXckVVgI08X0
	Hs25suD8jSUONjWlH250H9vVKElP1F2Ui4FfVYgMuSOEbhVxXyp0ClDAX0AdVwkC7ze0WeWSQ635n
	FmgCL1G7Etz5Jsg36zlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6yTs-000xhY-MC; Thu, 30 Jun 2022 18:01:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6yTo-000xgM-Fl
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 18:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656612088; x=1688148088;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FH+WKvDYKqG1am5u8c4OGIhHgn9z36ayLZaKt4/GB5g=;
  b=cxnMgbKPuYf1FlwzBiormkgNIEOWpuNOZwLDhpIsATXYJHAa5ILulXx+
   EHCcL/5thb9o1yAdew70dvAQVy6ph/zHejHAiax7K3SEWemflVQrFFiSB
   zMFefF8U2GNikRehUZMmkbpH+gd0XO4XaIUpEXznVcH/wStvuI4Q5vv2w
   6AUSN7qA/gaOgMONmh7BRWvRWsTo8pIs56PY0nTOPW+GrBoohJiqO2qie
   Sg2oWZ8mKRuXVvqQGc2mRrKKJ99N52REYYb8VGkWkc+dwD2A7wicaxQMi
   IMBsYuxxHsJjcJ/yPG63k/lZns6owxuMr2zzoQkq/5EaB/ZoPX2eqDOJ0
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="170299967"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 11:01:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 11:01:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 11:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKUm7j3rRgEyZVV2vPaTm9yRLNIekmFtu+BmFUsYxFygWOsXBd46tppH4me+lIWP5ONTuvg90R+JWfilh1NH6bOlM0AVml62J54uhd6NBFo1+OQ+CZSRmd+X19EVy9Ov/+ScCcRyx9JkbLiY90MwbCoLv3FEAiFR7Rt8FnMTXA/OngcoUmxBuwtqew88JNvnnv5aMnEGFbSx537v/cnA13XRHSWYnJGLvarsJDw/dBamrGOgSHvGqvKxm1o/HGgrr7ZKnzG4aCPwS5dURo0M4gPKdqGK8H2yz9r84RBooAtDEn4Fm+o7AXpuxvzV0ZACuz6W79mn5vzwo2xAeYHMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH+WKvDYKqG1am5u8c4OGIhHgn9z36ayLZaKt4/GB5g=;
 b=kZn9485haBxKCql5Y+yBPCx9HAzoA2vq8s2i/3wyoA59KHyyuL1NCzeprZpirA1b30Vs3WYuchdbneNSuu9DJxflpPSGwydOHOyoABJ1s4Y1bHqPgInUSzoPu60ZhfPPaJaF/v/bfu7ZZkYbNSDWIKPFjWeAGoAMjQ/H9gHlO9XmFzmze1XcKn7TwdRNPXhEDSQqX5U+PNaz2xKC58YS6PQ9W/WGQ73wHvM4jXUby7GNLQBghQK2u1vRS9FnB1vyxfE7kK7z7yBwLqL1b5nlBWHqKMogFw9b2aFLg1zxkleg7z06ChZ/YyHQWnelTIPxD5TsH11VG22JboqoUOM4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH+WKvDYKqG1am5u8c4OGIhHgn9z36ayLZaKt4/GB5g=;
 b=RRN4pByObCKSfSfIm3ZZZstIb5IvXutSOVEBsIjK887eNzJ/AL1Bcsv1NYVrJO65kNiN0U1WjSLx3zszsgSJRGarmoVTw5sn2yioNgNZjkQJJoEQ5mfbnhTzXW6L0mkb5+9oKYwv27RbQo/j2HscHjCKQgUX4czrFzCGaqrd434=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 18:01:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 18:01:09 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Niklas.Cassel@wdc.com>
CC: <mail@conchuod.ie>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <fancer.lancer@gmail.com>, <daniel.lezcano@linaro.org>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<dillon.minfei@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Topic: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Index: AQHYi+hg2HI7nJ4gGEWADL44nKFD2q1oJQgAgAAXtgCAAAIwAA==
Date: Thu, 30 Jun 2022 18:01:09 +0000
Message-ID: <d0634053-d882-fcb5-fd56-32dfbcf4d5ba@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon> <20220630175318.g2zmu6ek7l5iakve@bogus>
In-Reply-To: <20220630175318.g2zmu6ek7l5iakve@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e50f926-2088-458f-4dd4-08da5ac282e4
x-ms-traffictypediagnostic: LV2PR11MB6000:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: osmu58+T5CZW3TuALITDJ9e/SSCtSSiFF0gN3tiPlwCp+XJChTCuh+KdmzXMsgJOWHQum+LCNyz8UqunOzjZxaEr/ogi8oCInRAQmIuGRjBHKSq5fstgt0CsfxTSSvXnUk+SvC3k3QjIpL08gZFRea2CFvQNO3G9D96eR5sXQD77pkfzE+wqAEvhyqZdWf+Tk0XD6snHMneYuK+6jox+ZGrvVAVuUfHZSLJvkSm6zvyVBGzxQZanyXaTdXM2mMmCi70/afO9TZ8nAXKM9CLTcYjChZWyuEP8h5VOL/BEtL39jARcz8ohmAmOcIht3MNeStLgfpqzdaFXwmisInbaUituAH6p+hFLURPUz9SLbZX3cPBBp51H6m4hnrAFbPqotIpDB7HMCUEyWShFAyhdyOSMsbdbZ6UMw9FI3MFBJAx4KCqkO16Hy5MepV9Kv4tIF/HVPOv5SDzifinaW1C2wan2KbuQvnuepDu/WHj/qRqshHzwFFoOUPb1pak6lBz/MRTuh/ICFjdkvTQ1QP6SbW3o0SypkqJvhYJWrOcFBzZREh3Zh19ilqooZTr25Z/9AkCVT0PX3LyMa3sQAN+gWN2PnRd28IoQZWYHBGiTd/DXhdEyYHRn0b4wyY0UilXVoRlPZ6vDVS/h+9OPe8raxtenWBsLPMv2BuDH+cRUzaU7i/K8prAmBhrKFwQVmYCi9M1o8+6YmeWKbSVMvERTguFN63YzgR8pA82cVy59i7o2P8SyauwxAtrDuSXS6DhDP2F22oaj7Pfh2y//KIVteB/fdP113j8Q4kJJ2jEhFxlbsBtrtn2oMygza44i8TT4UkFZ4x4ZtAhpvHvmafV2PrIDbR3pYLJmxkEC+cw6U3fRNoKPquUdykT17xULxQTZs0E4IPK1NHqu1WlGLDtNLHu8Xq+zI8Bu+a08FVX6RWoy1cj05QxVz6suK8r2RgWs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(346002)(366004)(26005)(6486002)(2616005)(38100700002)(6506007)(122000001)(36756003)(38070700005)(41300700001)(6512007)(86362001)(478600001)(2906002)(54906003)(966005)(53546011)(110136005)(8676002)(7406005)(83380400001)(66556008)(31686004)(4326008)(66446008)(76116006)(66476007)(64756008)(91956017)(7416002)(31696002)(66946007)(5660300002)(186003)(8936002)(316002)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFVZUmxaVEtQVVJkdXlkY1dRTTA5NEdnWkw5M1NuNnp1V0k3Q1lWd3EyTzll?=
 =?utf-8?B?MVRIWWxXUzZsUVBLaWU5NE01a01rbWNWYSszUXp5TlF4TS8ySFhJZ1VET0xt?=
 =?utf-8?B?VHduQTFDUGZaeVFobklmZXNHeXpLdDcreS9qK0ttRVFGcGF6aEYwQjF2a1B5?=
 =?utf-8?B?MVN1Tm4rRENobkFqd0YxOFJnaHdaRnVEZE5hVC9YQVcxNG1oc2o3aWV1dVIz?=
 =?utf-8?B?cGNOcnJvVmVIc0hGYysyVUNyZzVoOGR1NC9yeS9udnhxTHJoYWF6cEtVOGh0?=
 =?utf-8?B?NUFEV2ZPbVJXSEt4cUJSQ0h4YTF6Qk5CZHJ2TGZQQnN3cmF0clQ0WDhsVmhn?=
 =?utf-8?B?VEdhZVRDdzZZS3VBWkt6WkkrODhLSDYrVFgrNGpNTmxRYldCOEt0WkNVUUsw?=
 =?utf-8?B?Rjh3ODR6S0lsQTlSMTZCTWpZODZSWTBtQVlqMlcxZnRWRGFQcHcvTTdpS0NC?=
 =?utf-8?B?WjJWODZ3R3l1aUttZVJCOUUvdGN1eHFyRkhNamtodHlzaUgzVHJZWUZWZ09E?=
 =?utf-8?B?a1JlUUhNZFVWUG5BQ3lsMUdsa1BiOE9VNkNOYW1jMzBiK1Z1RW9GME9NcTZN?=
 =?utf-8?B?ME9YaHU0aUpBUytLSWRBdHRnQmlkOGhXeEgxL1J3WDlPU2dSL2ppdk5kZ0xk?=
 =?utf-8?B?NjJnbzdzbW1lbnBuUnZkTzdqRGRBODhqQnhQd3BlQmNkNEpTenIycEVNVzE3?=
 =?utf-8?B?N094M3VOMUZsMU1CNUhNWGV2cFRrbHBPM1h0bHFsMmw4MHNNeWV1aklCN0xp?=
 =?utf-8?B?RC9JeVZvUlBkdmdHWEdGKzRXNU5WQXdhWVcyMnE5TUxocXdnOEhyYzdtTTBU?=
 =?utf-8?B?WkNrY2ZKMGkxZVhCaVl6S3k5Y1REYlAvcjk0QXhoRkVnSjJSY3ZKbjRZc2tG?=
 =?utf-8?B?TDZRczBNL3RKUkhRN0NoNzNJanRHZ0pybkM3aHY2ajk1MngxelBxbXhNN2VJ?=
 =?utf-8?B?Y1p5aEtxM2RMMk45UmtSdmtMaW9FNnY1V28xZTNKT280emxWQkJXUnZ6Vmsw?=
 =?utf-8?B?WWpkbGdzK3JhTldBNlp6cVBUVGpCQ3ZGVnZFMm5oMjZaM2RydVJPMFBiNUFv?=
 =?utf-8?B?d3JCdXh2Q1lmS29ndk5JcUFTVlFqd3Z0by8wNVYxR1Q2K0ZweCtxa3BZa25i?=
 =?utf-8?B?Tm1HeWlUVTczdkY2NmI3a2pJeERBenlaVXFnZTQ2Yzc4TTh0ZlBxcC9ZWVF3?=
 =?utf-8?B?WXU2SkYyL2ROcWgyRzV6MXNrNSs5UlBTRTZNaGpyMFZGWFdUWHdISnR2Qlds?=
 =?utf-8?B?Q001ejBScDN3T29LNzlkUkpVUTNMM2hqSVdTRnRhZS94dUF4dDZ0cG1zNHFG?=
 =?utf-8?B?cDRsbGJJR3Z0cWVHaVNTUUhYRjVFTFBXbjRtZGlrNG5WcU1DWU55MXBJZUxv?=
 =?utf-8?B?R2dOLzhMd1VLUThGY24zUnlqTmZWbG9nbXNLbGNrNzN0TG5henVrTHBMMEtN?=
 =?utf-8?B?eHZUVUc4R3pIZEROb2p2bTBPZmVFNHhlU1pTNnh6U2tEeU5JUk1IbmJZc25R?=
 =?utf-8?B?cGZOaFJOL3hnZHBwRHFjTHhQdTI2cDZrSGdNbjgwMUNFSFBrM0dnMDZhRkZW?=
 =?utf-8?B?bEoydzFid3ZZejNQOGZacDVJVHo0SGxHb3VBOXM0NWVQVUl0djVLdER0eGVP?=
 =?utf-8?B?L2JXNmZiQ1dYZmQwQmNFZkZxK01Hb3d3NVBiT0phQVFldU5RTDVrTVdOcEx6?=
 =?utf-8?B?VGJEYVdRRmR0NUtFZkVzN3dIdFQyb2RVUXRNVkNyelc5V0ovaGpJSXNiTW1s?=
 =?utf-8?B?MUZYRTNUdGVLdmRkcUNZeDA4Q09TbktQcGdaRjdObFl2dkNrUUFPTGNkSnRy?=
 =?utf-8?B?UUJKSlh5aks0REFxVURKb3h2SkxtVk5CWGpJTHB3YnhNNUFxaktkSURsZ05U?=
 =?utf-8?B?ejZsUjdQTnQzbnRaa0J6MldCbmdPK0tLVkM5TWlBalVjdjlsTU5GMUxpekFj?=
 =?utf-8?B?R2l3Z0JCMGRrRFNSVmlIOG50WVRQaEg5ZjNlQnhRY1hXSHNOY0FoS3d2NkJx?=
 =?utf-8?B?VXk3ejdjdFFYOVFkSk1RdnBZWlBlUFdNNzhydlhsRnBCUUlzNFlIVkJQODF1?=
 =?utf-8?B?bVJiUTE5ZmRIUGlaejdOOUw2ZUpHc1huMHBQQ043SlhzYTRUdDFjK3hzZzA0?=
 =?utf-8?B?Q3Y0Q1gvU1NtbHVaOFhDYzlOanl0YjVPand3OXA0bFZVVXlXZ2ZqdEh5aXc2?=
 =?utf-8?B?anc9PQ==?=
Content-ID: <01CA2EDD691DAA4885E338DD187AE053@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e50f926-2088-458f-4dd4-08da5ac282e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 18:01:09.1877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNYbpwNphhB0q+2iB/jZHHCa7H8JphKUDeGhs8b2xrNGtJHG7csvNzxqa/1UgrTGiOaNcYmGQ9FbanYPBmgYSEtygMzGpxU9k8SCpvgdP5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_110128_791854_22AF2A2C 
X-CRM114-Status: GOOD (  22.46  )
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

On 30/06/2022 18:53, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
>> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Hey all,
>>> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
>>> based boards. To make keeping it that way a little easier, I changed the
>>> Canaan devicetree Makefile so that it would build all of the devicetrees
>>> in the directory if SOC_CANAAN.
>>>
>>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
>>> action. Since I sent v1, I tried to buy some since it's cheap - but could
>>> out of the limited stockists none seemed to want to deliver to Ireland :(
>>> I based the series on next-20220617.
>>>
>>
>> I first tried to apply your series on top of next-20220630,
>> but was greeted by a bunch of different warnings on boot,
>> including endless RCU stall warnings.
>> However, even when booting next-20220630 without your patches,
>> I got the same warnings and RCU stall.
>>
> 
> Is it possible to share the boot logs please ?
> Conor is having issues with my arch_topology/cacheinfo updates in -next.
> I would like to know if your issue is related to that or not ?
> 
>> So I tested your series on top of v5.19-rc4 +
>> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
>> spi-peripheral-props.yaml") cherry-picked,
>> (in order to avoid conflicts when applying your series,)
>> and the board was working as intended, no warnings or RCU stalls.
>>
> 
> If possible can you give this branch[1] a try where my changes are and doesn't
> have any other changes from -next. Sorry to bother you.
> 
> Conor seem to have issue with this commit[2], so if you get issues try to
> check if [3] works.

FWIW, my problems with that are not on canaan hw.
Thanks,
Conor.

> 
> Regards,
> Sudeep
> 
> [1] https://git.kernel.org/sudeep.holla/c/ae85abf284e7
> [2] https://git.kernel.org/sudeep.holla/c/155bd845d17b
> [3] https://git.kernel.org/sudeep.holla/c/009297d29faa

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
