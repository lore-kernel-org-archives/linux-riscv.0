Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524C9C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 15:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BA5F611AB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 15:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BA5F611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s43ZdRbS03aGvxDDBYun5aJnwfyUsazQ5IprabKuS0M=; b=HB+KpWyLVpBYgZ
	xz5jK5ldeBcP4ZrgdC6s/NBbFSZvklvpdzjLdkTZYCqQ0IpPhcLtjH/zP2GLoJYFI7ArsMPHtNNVb
	X54WGhU6TrgSnL/0xFhaot/ByW7ZhiVM7LkEdz3sKTpno0/uu/dDQzCrNyi8qteuSbEXiaFCfr1dD
	UX7SL1+jx83zGmXUuhS1Ge8Qn/rvXlUc0Vv3ZExEmw8HFv1OaDnIsCSvHsbAUBw0idIv+HYkDDd5C
	NMWzwsSJGN4i3mwF/JnAyXyY07Ztf9T6myhTncYvHm/xn/k9BB13QucB9Lk4nqC+wKpx5OBINaH/z
	B6MDyefjpRKWQ/w2246A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3KLV-00Am4b-JQ; Tue, 13 Jul 2021 15:29:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3KLQ-00Am3I-Ui
 for linux-riscv@lists.infradead.org; Tue, 13 Jul 2021 15:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1626190152; x=1657726152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7if/kVDl2FcZtu3lvYkyVaNW9/Nv3aIEfZqmcIi2orc=;
 b=Lffei7dzs/WiULyG7AH4+GSp6I/FUK2WSNg1zqu6/p5cLpOTVh8D+2/w
 9p27f9AAObYCrx7GyeFdN3AKeuD1qR+DUHuNTtpM+2lX0Wgqp663DTtMp
 kmQcDyAEKShgoQYeZ9sDeBt9IyE8FH1VJFPzCRIdlwc5vcjZyW6YnX8VD
 Kw+4jATA5mOsFvFNvzEohSn1Xyx/I8OoQNJ3TGPcxvEtOGD3bIqGP+RhA
 8Yxux+83Y4JHSkczq31nvnd2QoAGxQ26KR6aCYj9+pY1YgTY941vq4VR6
 BJiI8UBk2JMlLD5O7k3lsio4n5JXpCZoJizx6LYh6hoxX/JCrXgEwNrfE Q==;
IronPort-SDR: Me46roF+JhqjHRukedxZ3vsZkrwglqWNhexXj4nCc9RBYgnkZATn4bTplKnQ5FormveD6vS+Q3
 rJSrtFRhM0Us4JHkL4ccNKAfVPvNwVEi2l0jVmosu0Q2YXA/ecZkiMIywaArhMCeZyI8CDYXCN
 Rfb6f+qOiFib242Kt2r7l4Gl2fV+fvDYi1c5QlWdIVCtDkwgidFnBenWysmu8aOuGlxJXBIUQk
 koI7ULKmRfELQ3sj2mMy4/rt8gU9FehDLuJHp4iCLSvGVeuKUlZMfZ2lmUoxbw2RGrseMSirc6
 QJE=
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="62067093"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jul 2021 08:29:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 08:29:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 13 Jul 2021 08:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bonx1loBe9on6kJ5Rcl1iRLZr7N4wnze57culeZShNso3wAW5SvTlGR75nUqVEz8V9kpF3pRdsZSemb1+WmyC7caT1fS/lnoLuNwwiv+Z+NKBjV7BzHjfP8v8cEtxOmA8VR+/qCQDpITWhiQOjFMYjzSpvIS0oGdSWBHcEHPCNQkt/6ekXHJMibxdWSnSschOib1tCroyY/m7jukxEQnITptl0pZGaZv+eYBG81TH1mRWgvW5Jr0Di9OMZqOhSlZDssBDx1MpVL54usbutZdFSEmmieaisO0hGejdridYz2rSpP2YbUhSZl+IEVWC/APXar5Oig77UvB0SKlX38PMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7if/kVDl2FcZtu3lvYkyVaNW9/Nv3aIEfZqmcIi2orc=;
 b=U03g4kWn+nraK6waid+nGQRpa+3QJQkKK/2sEZDhMioZOQtxpxBjrIyfZWh+TtGy3ZNSJhUbKGMwdK5RG1Ybv1DBlJB0ys4nuO/qPsXYAMVAM/nZJfMoRRer1EhBXp6ul7jIc+yqatk/xfERoizKtP4MWjfXBeqXkGV6ljX80hkXCQaJQI5zBF55Prq+ktlQhGAim1wjh/eYZykY4URx3BUF9K2VzSp0QADNLVb1DL582zj08W8b8RylfcHW8Os53nvWTHburQzHpK1nZ8sBsJl8Rr6bmj+W/DFg51z4Ezzx0QFhpFUPWswADXaLuIOXXpjFGeaFVtXvSmrJbMoHyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7if/kVDl2FcZtu3lvYkyVaNW9/Nv3aIEfZqmcIi2orc=;
 b=Zox3deGzPb0PGjHodPjp9jj4kTPx8qY65+GiRISXRTTy532S+2FuMtszsWFR6Uv6iHAbB6g6gzQgBKlZ1RBBQ+2LaGmI/cGxC0NUSlr8ho5VIeqkSMuLpHgLphIq8swZ9UOGnTXWFlkdGFfBe8deU5c3/hDQgUctUcHXqsFriyY=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 15:29:07 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::a825:537d:74ba:2aaf]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::a825:537d:74ba:2aaf%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:29:07 +0000
From: <Conor.Dooley@microchip.com>
To: <bmeng.cn@gmail.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <atish.patra@wdc.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>
Subject: Re: [PATCH 1/2] riscv: dts: microchip: Drop "clock-frequency"
 property of cpu nodes
Thread-Topic: [PATCH 1/2] riscv: dts: microchip: Drop "clock-frequency"
 property of cpu nodes
Thread-Index: AQHXYnVF06x5/3pZjk+WP/cBJfg+2atBMriA
Date: Tue, 13 Jul 2021 15:29:07 +0000
Message-ID: <32afd49a-28c4-3354-c15e-f1b0fcdd9591@microchip.com>
References: <20210616060251.398444-1-bmeng.cn@gmail.com>
In-Reply-To: <20210616060251.398444-1-bmeng.cn@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20bb976f-86a5-421b-a806-08d94612f4a2
x-ms-traffictypediagnostic: PH0PR11MB4806:
x-microsoft-antispam-prvs: <PH0PR11MB4806CCD2B692429E436FC58F98149@PH0PR11MB4806.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D8IbH1itUnuxPnDj3KYR49V3HuFORzXW6H/hgHZ72FyHtNEsANyjfMY2yFcKdD/9G7JgW/rSbwzMJ+rqgMPkoTC3bzEIQO5dxj9KHfajA5v9XzT2QPF2mxvKCEUt+W9nhmSroaw4vrCJ0WdAYbx6c0eTcpEfbc8kTQN0VUlRnqInmuMFWRiNW4UsJXVG+V8A1sRAhuKfMKte6nxmMaBMnAaug0i9nRVDvTeKujCjiDwgFo44kbuO689QY8LbGybMuP9+M/5+Xylgn5DbAwgC8rvRjDCKk3mG8VAedcjLR95kn+aykJdr+mvbTe/D4rQcbgHndNGowTUyDexNQV440cLcd484sd/ffsyr390lm8JwdZvfW03mzFqHVQK99BXP0mhTwz5syOorRuY5Py55tv0b/p5+f6r2KVl9GEo0p7O9OQkf7KOiUEfjvzQ00SCO7Oltag/527jFxCVge0moPJ02542dGS9EvM8/vXo69cXsnmWKaA2ATIPuv3Uqoc4rhS2B+1eOciR9R1ZWbCLrmHZp0S4WF0GSS0yWmJPOlQMgQDRv5+P1SjtFro27xi2KsQRBg1CHxpSZtmA8dxh8E1hJHcbopovtGelLGkygDZtiUMRIVp+W7GAcoNo/L3HG4ZAsNkVoTsHqgtbHA1Ts0Jm4mmZ9pCdW8to8DV+h7LosD7GYZxSUSud5GmaZk7UGXuUHXMQKTmYQzhZYJx0cLL5cP36Etd3dqgGyt5Mw6PfZN/TtTINMEBXuszrUkuGIH9n6tVvQFe1Cepm27yvW/kDkcixSFKJ7UhcAU/W4DHKOog+DaAaYhlYucZz8BF86
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(396003)(136003)(346002)(83380400001)(6486002)(2616005)(6506007)(53546011)(186003)(26005)(316002)(76116006)(91956017)(110136005)(4326008)(31686004)(8936002)(86362001)(66946007)(66476007)(2906002)(31696002)(36756003)(5660300002)(71200400001)(66446008)(66556008)(64756008)(8676002)(478600001)(966005)(38100700002)(6512007)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVVpNiszUTNuendWSVoxdHVXWTliWWVuYXY0UW9HYmpIT2U5b1FFTnRKN3lq?=
 =?utf-8?B?ZnIvZXkxeUIvZXlCNWsxVS8vRitxdWYxblV2VWoyM2dvTHF1U3VGNVF2NjZh?=
 =?utf-8?B?UmJhOGhWVVRrak9XR2JhRWxhbGpzcWJrVDBsRngyMHpWQ2VYWkdPUUo4aHdM?=
 =?utf-8?B?WkVwU28wVEdkQWtCbTNtWFBtMlJOTlMrYkI5WlBPSGZmT2l6aVRucFhXbnlB?=
 =?utf-8?B?VThuVm4vYklLR29xYzJKcUxJUHRPZyt4cWpzVDFxT2V6Mm9YMFZrMDdtUHVj?=
 =?utf-8?B?b3NHUXJoWUsxajBDNXhReEV6Smw5enV4VnlqNWtwb3B2bU43YlRZN2plVkxj?=
 =?utf-8?B?bjhjZzU0Nkt4bnlmbDNvekpuOHdlTktXcHhnOGZLQTc2RnFmZkdPQW4xNFd6?=
 =?utf-8?B?RWFTVXJsNFBJcHVQamhvK0xYNElBc1dWUjFqeGpFYk1aRGhtcGMzMmUzeHRM?=
 =?utf-8?B?amJMeWVxUHAvYS9MTHBqMExOOGI5Q0FyRkYwclFxUmlIOHNoMmIwU2RINW8v?=
 =?utf-8?B?WThVRUVHck8yL2lkSWtFakRmSmRlMVpUcXBUTjhFWEtFNm5YeDdicjVyWWNL?=
 =?utf-8?B?Y0xHV2ZzMFRtOTUwZGcrOThJNGw5RjFRbFc5YjFEWGxLb0R4eXBOOFB0b1V3?=
 =?utf-8?B?QWR1bWFHZ1ZlL2FFdHFqK1dxZHluYkYrYktqTXA1Uk9FeVJEZlNxbWdUcGFR?=
 =?utf-8?B?UjA5MnBaelZlVGlUYmljRHRBV0trcWRSOWF2RGlzTkZLVU9wWVYyMkI4bm0v?=
 =?utf-8?B?b0VCL0R0OGJ1bkZqVmNtTnlsOGdyNFZWV0VXTWI5WEhJNXR3emkxMzYvV0VY?=
 =?utf-8?B?aVlWcmpiYzdJaGYrN3dmdDMwTWpSSGlLOGhnRnJPNmI3MU1pMWRWL1paenRM?=
 =?utf-8?B?dVAyN0Vxb1JTS0txUmZ4dW81ajB5YU0yNE5mM243bWc0cEFmWlU1WmpSZ0NG?=
 =?utf-8?B?d3UrV09VQXVpem15Z2FYMHNMMWlUWDBiS1ZIYldlMkJ3V21mQzJOUEs2RzlF?=
 =?utf-8?B?QVdUQWxoNmpHZkdDS0d6M0R3Wjk5Q3FjNi9GNzRlMHRFWmloNUM4eDJ5M0xS?=
 =?utf-8?B?SEV6bUdJRlpZeENBc09YLzZKdkw0Rk1sZ2hPNnBMajN0Q093Wm9zMWw2eGU5?=
 =?utf-8?B?VmNjbDVwWC96Mkk4bUpGdTZlQWVXSGZHZjViOEFPc3VXUks1Y2xBVndGYU1J?=
 =?utf-8?B?d2hOWnkrZzhJQWVuRTBhYm95NkVrT3I4WlB4OHBCNGZHUzFXa21BUkNSWjkz?=
 =?utf-8?B?eUxPYmNYS2N6MHhhcW8vdzdDdDFIWWdVdjdFVCtvN01yemZ5OVBwRU5IaWY3?=
 =?utf-8?B?OFdTRWZPYzlsTzFiYXExbE5SR1B2bElWODVUNzJ1TmpSbjVxK0FHSWt2SkRN?=
 =?utf-8?B?MG56TzdDTXprZFpuWkxYL28vcUVBbDRTd3lrT1JRVkNWaWkyU1RjSUlKdEpT?=
 =?utf-8?B?eDVudjFnclFadkVKeDhvTWp4ZFFobU1FTXVKOGZSckdLd2trU240UlhPOGxv?=
 =?utf-8?B?VnFQTkV5dHlEc3p1dzZ2Z0pzK0NVWERaNEZTc2hNemd3T0lFZ0p0MmlZam1o?=
 =?utf-8?B?UTBlSVAzV3VTcGFYbFdFNVR2Zkc4eThrNmFlOWNlZWNSb2NOL3RvYlBOREY1?=
 =?utf-8?B?NTkxcjgxTE5aMkV6R0tiblA5N2xjRS82Z2pueUtGOTY1dVViRUU5UjhYK1ZV?=
 =?utf-8?B?UlRkb2JtN3JlNllkdVV6MDR1RWJOMUFEMUhCRkRYUW5HQllZeWlEekJZSkVv?=
 =?utf-8?Q?ND9RnZPK6XOkw/pJHo=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <C2AE8CE4D4B0284B9C81FB160FEDBFDF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bb976f-86a5-421b-a806-08d94612f4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 15:29:07.6286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t3/7+c51b3EIl+BXcwmSnccepZFPaARZdiNnW5k9kZJ/4LZZypauAQJdgDV5tJ+9n+ySRTLqot7F8lMRQkf037Y+C6MGEoBkZ8b4B2wfyQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_082913_123294_0D47E349 
X-CRM114-Status: GOOD (  14.38  )
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

On 16/06/2021 07:02, Bin Meng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The "clock-frequency" property of cpu nodes isn't required. Drop it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index b9819570a7d1..ee54878b3f89 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -17,7 +17,6 @@ cpus {
>                  #size-cells = <0>;
>
>                  cpu@0 {
> -                       clock-frequency = <0>;
>                          compatible = "sifive,e51", "sifive,rocket0", "riscv";
>                          device_type = "cpu";
>                          i-cache-block-size = <64>;
> @@ -35,7 +34,6 @@ cpu0_intc: interrupt-controller {
>                  };
>
>                  cpu@1 {
> -                       clock-frequency = <0>;
>                          compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>                          d-cache-block-size = <64>;
>                          d-cache-sets = <64>;
> @@ -62,7 +60,6 @@ cpu1_intc: interrupt-controller {
>                  };
>
>                  cpu@2 {
> -                       clock-frequency = <0>;
>                          compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>                          d-cache-block-size = <64>;
>                          d-cache-sets = <64>;
> @@ -89,7 +86,6 @@ cpu2_intc: interrupt-controller {
>                  };
>
>                  cpu@3 {
> -                       clock-frequency = <0>;
>                          compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>                          d-cache-block-size = <64>;
>                          d-cache-sets = <64>;
> @@ -116,7 +112,6 @@ cpu3_intc: interrupt-controller {
>                  };
>
>                  cpu@4 {
> -                       clock-frequency = <0>;
>                          compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>                          d-cache-block-size = <64>;
>                          d-cache-sets = <64>;
> --
> 2.25.1
>

Reviewed-by: conor dooley<conor.dooley@microchip.com>

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
