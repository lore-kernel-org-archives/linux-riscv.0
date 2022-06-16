Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A3BC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 06:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gln9fPrx7KkexW3gh2TG+YC3xNf+dKmyHeCApmT0Uxw=; b=liKAIfmi1Bu1DA
	my+DR+IUrN9v1RWo/Ln4qs3S1zzN49W7rvcccwly9unngnGZcxZ73hOTHa0xhBTja2OA23OmsDiss
	EO16/aVrMaMXk8kejMrIdClQcP2PK+cDZyF3NeSu1c5RTprsSk3NK299m//4jv9aI/tRx4GXLqrr6
	7VusV/pgO+0mjXIBF093XiTIwP+MZ3pJTHU+G1Tq89o0DuDksiuBEs0Pwcqg6r//vF8UsThgMFWrn
	YH/39ofYo/VPULFbZjUxQHPysZTfvzAVLS92yvdj/CQfrZiS2g4hnB73l/9pZ+DIMUp+/5su8fH5C
	awPqhPk6tlZhd59xQkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1izh-000itu-QZ; Thu, 16 Jun 2022 06:28:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1izd-000irh-Pd
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 06:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655360918; x=1686896918;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UEN2wQ2PcCAAHTpigNf3+waHDkNtiMp9/b9iY7PzDrc=;
  b=I1NPSCyhnNBFltiJQSkkm+k6L+HBLDbGiY/EBWZ9n1Ezy09FjhwEL3/F
   b5LoeBeZojACnvQ9qUiH3x92Kwru6ZiwUNMTqTg6w6FL/I76kDiEhLW6A
   vMnOzCdfEEyAHJpk2momnQhCOIFy7nIYp3xBZM0Sc7cGJHSxDAH+hHoFm
   VyVzxNm/mjQUmR/vVACzshUnzD0oWdLfENucuaegNTEEBygoOOIv+v96d
   y0xSAvfwJuGSD7n/Sxlq9MZrekPdN1eva+2LfUxNl7QcQE1kWkvk3+Ql5
   /SBPQT9LVxkN93cs6HxTjl1vq953e6mF54gPUe3ZsoGbzgw/PTze06uGM
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="168334642"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2022 23:28:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Jun 2022 23:28:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Jun 2022 23:28:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iy8ItVgqNRL0Dfzt06LOw1FZiyVmWmesKHHpWvPd1nuvSMJJ6If7iRqjmRBll6K/FkyCj2VMB+iUAJX+mE1uxurXQHABkMa8xiQPsyhP0HckuO3FxgXJ3mO1F0Nl/0OAX3B6oBgYjzxtYRfIXYWeoqVTCtdjcJQB/c0D/j9qF7MvlxCMOoXp8Ghz69IcnvsNg9jEtgiBV+27ReorCAhD0osEMPTDQlgWutk9y21jo08hm1yTbTlfoLo9dvPcxV+JQxY/Bkm/MoBsBeGpMd9d4mDpUrQZ/Xex/ua1zUH947phl6U4fznwymcEd3fOzA/CTr58/VJL/62R7LvgZISHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEN2wQ2PcCAAHTpigNf3+waHDkNtiMp9/b9iY7PzDrc=;
 b=TjzoAppvSeYy95WcoiiEiKgTldwxF77ei1yOSw+UY2xrglPmJ/mvGLEkvL5EAwWXWnOiUmiWmK6CZVGusCdkMpXoclq8x5pBH1XXcWh9P+/50trMDFG/Ny8lSrRuL4MI8wIAnz09wFwSpnKxRYEGxngb5rbLQr68azU4Ce4rjrgSfFJJaIj5MYvhuSsBz+E/NwERqa0DrJ3IxL9wfC5t5RdnrIiBPePdwQ5uCpQDY0C3AT1XRCyqr9aJtUDYFrFNk8uepvxVGVNxwsMVYpwdT75aLAXP9MV2v8V3wBihdalybJjzlqtyDUdmBSDX8RWGmLqtLn5GlipOfXq5L6vr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEN2wQ2PcCAAHTpigNf3+waHDkNtiMp9/b9iY7PzDrc=;
 b=BYtQBdVcTARrVff4hKQ2hqgwqHv0DbkocwRcwLenNSnfTDBX+D3VBygC+SlIkO/60Q8a9X80Vi1HCGHlwFDHunF4ZM9DQL7TTB1q+zn7j1Bguh0FjdzytY9YG+Av/kqvuyeh9LtnykeG8mvY4+9vmpYHEiEk7Ebhnl8NrDOHz38=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1678.namprd11.prod.outlook.com (2603:10b6:301:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Thu, 16 Jun
 2022 06:28:27 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 06:28:27 +0000
From: <Conor.Dooley@microchip.com>
To: <windhl@126.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lkp@intel.com>
Subject: Re: [PATCH v2] soc: sifive: (sifive_l2_cache) Add missing
 of_node_put()
Thread-Topic: [PATCH v2] soc: sifive: (sifive_l2_cache) Add missing
 of_node_put()
Thread-Index: AQHYgTyU734TRAppZ0+mlMW5BVjq3a1RkayA
Date: Thu, 16 Jun 2022 06:28:27 +0000
Message-ID: <7a4a3fed-333c-a7f4-070f-2e7e2b798810@microchip.com>
References: <20220616044915.3978097-1-windhl@126.com>
In-Reply-To: <20220616044915.3978097-1-windhl@126.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e520b33-f578-4542-b80f-08da4f616c67
x-ms-traffictypediagnostic: MWHPR11MB1678:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1678EE08ADF54A1113BA82AC98AC9@MWHPR11MB1678.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMXFw35OTs6XgmgDvlTrrlH1RsgbiTHWFR1R8mTSp6I8JgaEcnrLielwh0KrvkuvGHk57bwVBfqVSxA3bcbutIGoV4wIE3rqwBRuqBi5yBYj+4t2dXe+DVzFkPX0mmlNY3d4uVXIlribo8ROh87txthHuJo9KD+ql2h7U4Cw2zn+RrK/ltzWtV0w0QV7tEMNwICEbNhtqzcJ5EaZRPXC1mBtS9JLraW7hFtaVDe1IVpf3xlHA0mIQM8LOuwbEQTnLilx+7oCAtKiUTvJA2jfErg1z+3Dqkzr6aU3SalkXWcoVBW+ncVM30RUqO7Ggou4Ns5PBUG1+CY4YqTCN+ro3rI67sn7r1Hsia6wF348+dixQvyEqWEG/FGC193KSdYXcVq1RFRk9rDaoYMngaUCIdWHKOnxDtt66hFzVOeyYFbXFbw9lVoiMbhUk10R4749hNSRex75HZzptSHuOJrVWOdtemARG67F6Inmp94rsQjWthwos2q3CgaxmCrJJPhIfNsFakC/m1Asp2o+UlvNdA9WzAeYP/wcwY/PvL2GQb1LdtoFr2nw3refqWAoANJagqdJmGawaN+wej+O1PWEKKwZxu1/teoUw4lYu/THupCNFprqFoNNR7QsItn13VG6/NBPkwJL8JomByRmYchZc8pOQbeMXHa1115tHQRyo2AFZ7u00s6pGsQYAqipnDUfGJAirq1yLg/NSozVKm8u8zcyp+XIuBXXjy8OC55vhExDk00Mc3W0fNGYGvPIHfVQILTTUd/tx2m9ucml2u/swx/8apQAqq61Fq0CUx90q1KwtSIvMteLMfn85VvPVnpG4kyA/ojEw+p5XTnvXsFotoE1BszIx1L6Dd+TGFHK9D8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(5660300002)(2906002)(8936002)(31696002)(83380400001)(122000001)(38070700005)(53546011)(66556008)(6512007)(36756003)(66446008)(8676002)(64756008)(508600001)(71200400001)(6486002)(38100700002)(4326008)(6506007)(66946007)(316002)(76116006)(54906003)(2616005)(110136005)(186003)(91956017)(966005)(26005)(66476007)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkJicU5RYW00aGtQbWs3VjIzWUhxeER6V1hoSkJpMHA4M1BIdzk2c2t5b2Zt?=
 =?utf-8?B?OEdJbVc4eFQrZXdWaVdSVko4RUpQa3RzNWlwSnJGM0h3RHZwQklleHFZN1F3?=
 =?utf-8?B?R01XMGdqWDlwT0R1d095N1o5c2xVY0FtbGZpNU1sWWpQbWNlc0dhUmlFcXpJ?=
 =?utf-8?B?ekZoQ2dzRHdlLzJpYW1TUTMyM2ZJaXR4ZjhmU2U1bk5SMjF6MkgrUHVKakxZ?=
 =?utf-8?B?L01IbXlRcllESVF3Q3M0eHBxeno0UUNmZ1M1TVBiWFlGVkZjbjErRzRRWnR1?=
 =?utf-8?B?WkY5MExVeVRacW9Jbit6ak9SMWhETFVsY25EK0dZTFJpci9xUVR6YjdqZjdm?=
 =?utf-8?B?NHVudzFEa3JSanRwelAxWU5YZDd0eGo2VUdFSldEdnNPQVpZbnRZcWNacTZu?=
 =?utf-8?B?NmxOQ3hmVnlURi9qaTFPMDNkSEhyNHRNUDNOWUtibTF3Yms2K2ZSM1EzMkg3?=
 =?utf-8?B?UEpSTC9HSEZYM1dnbE1KWXRJcVZPTjlRZ0RNNllxUllXSjlRNHFXd1pkR1B2?=
 =?utf-8?B?THB1cXZCNDlSUUU5WG9CaVh5c3Z6OUsvMSs4aTdvZ2ljd3V4LzFnRUJsWEwy?=
 =?utf-8?B?ME9GUWs0emtBS2FralI5dGlVbytyWEI5VDJ2QUJzUk1NVjdPUFVTd0ZqNlEy?=
 =?utf-8?B?RXJEek4rNU4wL2xQRHdaV2VLRW9UNGdGNWVOaWZ1ald1Ni9KVGltcFJwNTlK?=
 =?utf-8?B?eExvdEVmdHFneDl5dExDQjRTVlcyaWQvQUFSMlF0YW9LdDhLN1NZMWQzMWR1?=
 =?utf-8?B?QlFickQ3SWM0YVRJZmtjQzhOWE9LdmgyUFJzYnZaVk42NXVVaW5TbUxhKzR6?=
 =?utf-8?B?c1VzR1o2a2FOb0VDcTV1SXd4SElhSGtQRy9jZEYrVFJ5TGRobW50K3B1MFVr?=
 =?utf-8?B?bnZ4ZWxiWjhaTUxNOGVqTm1MWUE4MnVjTTRqeXpmSW41eWRlMXZJQ0tNZ0NN?=
 =?utf-8?B?RzZ1d2d1UUtJY09QVkxtMVBNYVZmaEtGQ0J5N010ekI4eUx1cnRNRitRYnd2?=
 =?utf-8?B?ZUR0eU9NeW1nQmM4SzBZOEtQclAraEo3MXlsVkphMllOK0JLTUVpaXA0T0ty?=
 =?utf-8?B?Q1EzQVZDNFVobzF3RE5uU21LcmE1ZWd6ZVk0WU5tNmpOT09FY3dHaFd6OXBq?=
 =?utf-8?B?YmgvVmNKbmlyaEw1Q1kyUmQ5MTVMd250YnFod2RYRkExREY1UU40SlBmbUVr?=
 =?utf-8?B?U0NGdGV1dXFqdFZYdDFmTXBEVkF3QjN3L3lTaElHWHJyM0U5TjA1ZVhHZk03?=
 =?utf-8?B?c3lmS1I4enhJbk8rNm5nRG1UYlN4SGtyL2xvZVAvUVloUW9xVWpIMzJkK1lH?=
 =?utf-8?B?Q0MyZFhhTm5Sc2ZDUDcwNG0xd3FGYU9oOUlvUnVGTnhrK28yUStMalpjM09W?=
 =?utf-8?B?Sjh0eTV0ZzBZODUyZFFqYkM3cXAxQnJ3anNCRnQ4MnNpejlhdWo4SXZLbjBO?=
 =?utf-8?B?Z0kzaGJvZnNtQmRHZFZFUmVQMXRkZ3k3NEpxM05yZmpkcHVYcW9Eb1VYejgv?=
 =?utf-8?B?REFFRnpOWFFuSGJHTkx5RGZ6UDlCWjA5SCtVdGdlVGlKekxIR09kNVhmdlhP?=
 =?utf-8?B?cXBpd0RVYUJEWnN6Z2FWTElXOVFTRWlaLzlwcG1zWmFJUEZPeG16a0ZGd3FV?=
 =?utf-8?B?WWxvOEhJcHlpcmhJOWl3d0prM3BucDkzTjQwKzBBbmt6T09uNk9VaGpSMHd4?=
 =?utf-8?B?N1dsbEc1VVkyWHVsdDJPK0lIUVdkb3VTMmVkUDgxVVFudCt5Tlk0YlB6elBN?=
 =?utf-8?B?WVpEZGxWdEhjNzlIT2VrQ01iYk9iandxVjE3bVJuaEhadlkxWjhzMGxxUHcv?=
 =?utf-8?B?VlVrbEQvbytTUFNPY2ZVK2ExdEREc1VVcTFZYVpBN3FOSEpnNHY2QkxNYUlC?=
 =?utf-8?B?d0wyVUp2RUgweDV5eTNzRGFXMVdPeHZsekVVdTA3aWNWSEZYL3QzbXQvekZv?=
 =?utf-8?B?cGJmanFlQ2w2NEdQVjNXODhYdXlzemNGTkxtYUVwUTF0Y0NENzdsMEFaQmdV?=
 =?utf-8?B?MDFnSTNyS2pKYlFaMVY2TkxNQ2N5YXJWekFtRXRnaTJ5WTdUUis5K1U1djIw?=
 =?utf-8?B?U2paRDJheDkxTHlLdi9mWDl3WmNDSEZwaVFNZmR6MWRpaHJHQmpZczJCM0px?=
 =?utf-8?B?Ri9UNXR0RDYvWXhYaXZqcFFqYWRnTjVTWlQ5eDNRcjNGKzd0ZVFhNWVWUXBt?=
 =?utf-8?B?UFkzQ0g5TmM0RGpqRDR0bUVQL25vak1IUCtyRFRabEZmd0I5U3dsMVd1SXVs?=
 =?utf-8?B?UHpOSklLS3RINUdjL0tVQlhzTU1wVnc1V1F2SEhFUFlLanhnR2lFbGVDVy9s?=
 =?utf-8?B?ajM1ZWlkdnhWbnF6c3FvNmRFVnpjT09WT3g5TFJqalZqVGJVR2RwOXJKZUh5?=
 =?utf-8?Q?v2CTb4kXa1Bwsk98=3D?=
Content-ID: <C14DDEC23B06584DADD70C47D8984BB5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e520b33-f578-4542-b80f-08da4f616c67
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 06:28:27.5036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/Xi4J57ai0DYf7LwiHcbcEkvmRE4CyDjwMAZps0fm63Qqt4muuuEFytus0FLsW7YHyDWzlchC3lzHLjtfuKQZA7gwRdIclzBBmlHm9kCXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_232837_885902_05CD992C 
X-CRM114-Status: GOOD (  26.75  )
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

On 16/06/2022 05:49, Liang He wrote:
> [PATCH v2] soc: sifive: (sifive_l2_cache) Add missing of_node_put()

I figure you submitted a patch against hwmon & Guenter asked for
you to change the subject line? This is the hwmon style & the
brackets aren't needed in (most) other subsystems.

Thanks,
Conor.

> [You don't often get email from windhl@126.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> In sifive_l2_init(), of_find_matching_node() will return a node pointer
> with refcount incremented. We should use of_node_put() in each fail path
> or when it is not used anymore.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>   changelog:
> 
>   v2: (1) fix bug, introduced by v1 patch, reporeted by kernel-test-robot
>   v1: fix missing bug
> 
>   ps: Because of many local commit, when using --base for format-patch,
>       there are too many prerequest-patch-id. I wonder if it will lead to other
>       problems. So now, I send this commit still without --base.
> 
>   drivers/soc/sifive/sifive_l2_cache.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_l2_cache.c
> index 59640a1d0b28..e0e3d8b64c25 100644
> --- a/drivers/soc/sifive/sifive_l2_cache.c
> +++ b/drivers/soc/sifive/sifive_l2_cache.c
> @@ -202,17 +202,22 @@ static int __init sifive_l2_init(void)
>          if (!np)
>                  return -ENODEV;
> 
> -       if (of_address_to_resource(np, 0, &res))
> -               return -ENODEV;
> +       if (of_address_to_resource(np, 0, &res)) {
> +               ret = -ENODEV;
> +               goto out_put;
> +       }
> 
>          l2_base = ioremap(res.start, resource_size(&res));
> -       if (!l2_base)
> -               return -ENOMEM;
> +       if (!l2_base) {
> +               ret = -ENOMEM;
> +               goto out_put;
> +       }
> 
>          intr_num = of_property_count_u32_elems(np, "interrupts");
>          if (!intr_num) {
>                  pr_err("L2CACHE: no interrupts property\n");
> -               return -ENODEV;
> +               ret = -ENODEV;
> +               goto out_put;
>          }
> 
>          for (i = 0; i < intr_num; i++) {
> @@ -220,7 +225,8 @@ static int __init sifive_l2_init(void)
>                  rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
>                  if (rc) {
>                          pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
> -                       return rc;
> +                       ret = rc;
> +                       goto out_put;
>                  }
>          }
> 
> @@ -232,6 +238,10 @@ static int __init sifive_l2_init(void)
>   #ifdef CONFIG_DEBUG_FS
>          setup_sifive_debug();
>   #endif
> -       return 0;
> +       ret = 0;
> +
> +out_put:
> +       of_node_put(np);
> +       return ret;
>   }
>   device_initcall(sifive_l2_init);
> --
> 2.25.1
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
