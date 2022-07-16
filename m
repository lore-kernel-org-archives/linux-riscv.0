Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26A1C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TeKdjwK8ICgCXPkO4VQYqpqiU6uhHESwnbWHE32YZJ8=; b=ytapGp4qAlcFug
	h1ExVPoiFoaSZNeRqDRkjq/p4dG+lH2r3CrILRqcw0E3Rm8q7Uous7zZJD07QM4NQcLeENv2DQZ/G
	XliNvz+P+TYreB7wFNGuo8tyZIw1a2L272YaLALMUHTrcyCj+JQd8ezICmRZUXnikhT+ZEsSh7TP9
	Vl3AN8mR7UktL85f/GKV0FbTMnb+WA18lfrAef6UFPQCd6xDX5+lhTgP8hFAnuBkscaUKt5kkj8qI
	bcBj0YaxZHDOSxdtjoo+OLo8E21bh8pgYhw1CoCYlbrQNQexRujzyYQMHXpLKPdNwXz0XyTrWTbEV
	1OQXDXZioio+vKnAciYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChvf-00GHF1-PW; Sat, 16 Jul 2022 13:33:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChvb-00GHBI-Vn
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 13:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657978432; x=1689514432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dPKVa0MTxM4jaKNwwAOkcGui+KkFVCP6/sCdVkJK6tc=;
  b=cBZXvl/gaVFHoGdVKCz2+IXdMrTQttP0w2Nds3sx/Tv0bbVZo4ZD3Kz+
   VrqMsr7KZJQEXgjg8iU2tAiyEZvTrKiNsdQN1B/I6KQ3n1waACMy5K+M7
   XnV9NcpzDQMmAAIx8ebKtcE1YhKM4ZNAPMqcKNy00Zt+NB3fS+9gzlGig
   gxukyXcmhEPsylT9Ce/PHR0UkS97CoHaPnE4jH1KpyJS+ojfS5+3bN6DG
   /BXLQhXhdrtNoIKtLJiI4eKUgrtK1YEbTdBKJRJD+H6kblNGt4MG5e2an
   t1DWkpsu1l61paZyOabiKkcEi30EuJvcvInwxhfoQ07uQpuj7q7GSBhfc
   g==;
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="165043591"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2022 06:33:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 16 Jul 2022 06:33:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 16 Jul 2022 06:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIyQDOGvLx4bzhpvvXU/7vASlsDCaeKoVgXfkrhn2kEmzJAxljjsz0LXz3f3I/hrE4uuWFKLgeSkSPLGNinHT/DvIP2+uqIZ1v085VQytcKJgx4fLdqIZpm1+azEUHGG2fk9ll1kCs9AnP8azCaCj4kvUWBLsLVgHbeBUi+w9A0S7I5Zn79WcKMdb0NlukBvS9aqjwrUmiUXs9EYeRNUQDOwsjamfP45TVf0L10fcRlkVFPSFKopse3qjKp5/XnNG7Wvtu81FmvkJzF/hpC3WEAcdzj71N3ZXsmye4cd8wn0Oq64AMyT5lvkrdZY3akrLC6BjTCwhZOwWxZG+LC9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPKVa0MTxM4jaKNwwAOkcGui+KkFVCP6/sCdVkJK6tc=;
 b=jx3lAqmAi0NjJYgtQivktrC0VBsdeObPAaCLx1eg9O4LRz+OWIvWl73/2uo5bQBT/YuMTUkznObhIdjc6Hr61DKxKb5B7TzfKABC9/Xh5U2h4oz929O6/L0z5TiLkFuAUsqYLlZJOrDKFfS2FKlDVxiHP6owgyMMuDuoWiFpwv7MxnipF/+SneV2ntFJtlA190JlzyyBRFKkZ5s9fIanDc7kw9d1AkDYueXbSRC4xDk3totWDr1NTIdiS5uP7Te6iBHetYEb40GkKm58vrNlrGOrglwaMZhYvybd32ijE5J0NkYi+KIIm//PN8z8vGs6pHiSFe7iVdQ4jhDL6/mvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPKVa0MTxM4jaKNwwAOkcGui+KkFVCP6/sCdVkJK6tc=;
 b=QnmwX3Sdi7NyqU39b+9z8GI3Ea+l2STqFSX0JXyt/w6R0quqUx8b5Ez2kNnQHMZoYLliIwquLlJ1XTjLXtzCvKHYk0zjiqmzapcCrnFqov9HIHE62J3N3LWf4x6Q2Hj8kLihHw9YYtQ9yP3ANupjwkVfzJcVi5+N0B0zuooJAY4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 16 Jul
 2022 13:33:37 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.021; Sat, 16 Jul 2022
 13:33:37 +0000
From: <Conor.Dooley@microchip.com>
To: <jszhang@kernel.org>, <panqinglin2020@iscas.ac.cn>
CC: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, <jeff@riscv.org>,
	<xuyinan@ict.ac.cn>
Subject: Re: [PATCH v2 1/4] riscv, mm: detect svnapot cpu support at runtime
Thread-Topic: [PATCH v2 1/4] riscv, mm: detect svnapot cpu support at runtime
Thread-Index: AQHYmPIn04M7JR9I7UWnhI0fNc61862A7ygAgAAQQAA=
Date: Sat, 16 Jul 2022 13:33:36 +0000
Message-ID: <7292971d-9048-2b83-40c5-29c0a930d094@microchip.com>
References: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
 <20220716085648.4156408-2-panqinglin2020@iscas.ac.cn>
 <YtKwjmbQmIMm4gEo@xhacker>
In-Reply-To: <YtKwjmbQmIMm4gEo@xhacker>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25c86783-8768-4a5e-e322-08da672fc983
x-ms-traffictypediagnostic: PH0PR11MB5110:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0BxRO787Zoz0074eWMJQfyfXu1y849zkbDOURBc5V2xe5erF1EGjqATbF3jA4DwQBz0cOdfp0Dz9Xm3CdG0w7fumdfVIziYnN+XlKt+H+vTIiGtYJtIF2I7LUJyvamFDhMedbmESwe5XQGBkn/Snv8DramdWM9AtIbzVdn0aep9c0/VJHybVKSb+5GlZ5ZAzwJvyPt4E+cUkzekPSlVtxGxQ9JYquzDrTHqS8ITe7hxutrmC5p4aNZahwJUShMhxBdus2Xvnny33l9LzmdbciltTGSX0w3Lm2KXFg/sSrvt3WkQ0FgTr+a3Yx0USPRu/LuihszCUlNRAtYqrm8A226FRacHUPlpocQXT5jWkLJugB5RYh5oK6f1KELbkECUS9yQJ7db7qe4gUhAGrmKodk6vK07KY5Q/W5H74SEDDQSe/lgoz0iQt1caG4rbYGanUl7RCapsusDylJqubc7D1O0rHjOurttWI5bN3qGrvQXgQV44Bx8PkDed9HLHbBGK0wwEbUsNdB7Lrhr2++otxwDBOzIE5Ohe2n784jUP/TCI7hvET/uzfWHnF0PDNumnWZ2Q1A8GN2V1eF1nQVVjwN1jHrv/XnjT+ZDRteA0SiCZpNA7RnYVQM84lmsbAYxBXzhVeyKqvl6SevCc3f2joqt1pgUwFJutevbjI1YSFXyYrvZ6FXyK1CllzN5Z8Zq3CewpYDURBqtr1mfYrVILWeaA2wsXCe31b/xqL0Nxo00EVtwzYsNn3NuJiPHy6ra+ImeA9lkACUX6V0uD/FK+a7Y/z81lnSk/c3iVM25r9hQtTvdB4MF8CNGbEB0RaTtqy5y6w9FMirIb1JlQjYd0ezb+f1a6gvnrObTBpYHS1db/bT/OFBxlThSQgVzchI6SQq8D1sLxvHJbbzbzgqLAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39850400004)(376002)(346002)(366004)(396003)(83380400001)(2906002)(66556008)(2616005)(38070700005)(186003)(36756003)(76116006)(66946007)(66446008)(64756008)(4326008)(8676002)(31686004)(8936002)(66476007)(91956017)(26005)(6512007)(5660300002)(478600001)(6506007)(41300700001)(31696002)(53546011)(38100700002)(86362001)(54906003)(71200400001)(316002)(6486002)(966005)(110136005)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDBYRnlGSE9Wc3ZWSkR3OXlDV1R1ai9sNm9nVCtaQVplbVVNWExFUHNPR2RD?=
 =?utf-8?B?K3hVVEdDdU53eDhxN1ZDV1NiV1FRZkl0YkRJZzkzYkx6bDhOVTkxLzQ1NWMx?=
 =?utf-8?B?LzlqNlZ4N3dqdW00Mi9EUWdDcFZjbHZ2NEdUNmdzSFQ1UDZlZnlqVnJ4YnVK?=
 =?utf-8?B?dDhWUkpnQU9kT25id2h2OXBzWGxyZEF3K3lxZEhya1NpbUN4WitsRDBuVnB4?=
 =?utf-8?B?bElCK0t6RFVOMitKVzlPc2JNdTk5c2MyYVNpbFplK0RLVjBDMW5XYnNXSHVu?=
 =?utf-8?B?TnFyVXBRT21HWEVaZDZoeS9nZ3N1ZERGNHcyRDBSRCsycUJ5NXN6dkhJSEVB?=
 =?utf-8?B?dHpFM2FJMkpWOVBuazhyNVg3ajFaNUZJUnhnMXdUd2hHMUlsRm1HOTRZTkxm?=
 =?utf-8?B?UzB3T0NTTkp1NCtkYkNDWXdmRE5zTklUd2VaZmp0ZUVUU1E1a09zNHlHTElF?=
 =?utf-8?B?WnliYVJRUVl2SGRwYXNnNS84SUE5YlF2cGJRL0QyN2NTemwyVnloQ011L0lE?=
 =?utf-8?B?ZGdkUTZ1aVB3YnRUdVk0YVRIaEFWSHB4cis5MEg0VGRuMjMwUVNURmJFakd6?=
 =?utf-8?B?VDFJYThxMkxWVEhKMjZkMENlK1pyZTVRUWNHVDRBT2d0bWUwZkcyRTliK3hR?=
 =?utf-8?B?Nlh2UXRSU0tLcEVBSnpqd3ZuVUx6bDRpbHcyZUFuM2daM3p1aWZ2Sk9ub09h?=
 =?utf-8?B?OVN5aWRHTUpOcUN6ZWlHdFVxNS9GRDlteXZDckNPbWxyelpLUmpzdmpEUWgv?=
 =?utf-8?B?OVc4b3NwU2lnMURjaCtUS1lFNlZnWS9SS2FsdWpla0V3aDhPallCakV5cnl1?=
 =?utf-8?B?UURlYlpOT2Fic0V3MFhpbFV1S0dhWWlBU1JkTU8yRE1jNVBxVWNCWkV5K29Y?=
 =?utf-8?B?YU9mK3NTbDlPb1J6NFN5MmhiU29mM09BZmwrOWJsTi9SRnRwZCtKWmVRYVpt?=
 =?utf-8?B?dVdhOURQNkpaVjgzY2xHNHB1UWg1UFNGaVQzZFdiTGNzV2U5Qmx0TU56NWxH?=
 =?utf-8?B?UXowc1pidlhxbXVMT0VzRWxzSjkwZ3IxL2tWNnhQYmRGVWdMMERpSzhJeWQ3?=
 =?utf-8?B?UGRFZEdWOStRWjlPdGFEd1liNlVJQytodUNINDZOQ29jMjkrWjUwQnVXc3kv?=
 =?utf-8?B?Y0hqQnVjTmdYSkFpOVIxV211NzI5dVBNVmpZRUZHTW1HSXo5Q2x6UEs2YWxu?=
 =?utf-8?B?UkR4NllzRVI5aG1pazlnNXd1VUtvWmRJUjZVYktsTnFwMmxRQnV6enpYYmpa?=
 =?utf-8?B?VURyY2hYYzNKZlREZHRLMklreUpmdDJ0S2llOS8zYy9QRE1JSE9BREVldXps?=
 =?utf-8?B?WmFxZEppVis1eHJSdm1tWXkrZzZaYXh5ejJoMXcvZy9NaG9hTHkvbGtXRXUr?=
 =?utf-8?B?bituSXYvTlh0Sm13OTQ3RDZzZytONk1rNllKV2hJRHhOaHg5K0p3VS9jbDF6?=
 =?utf-8?B?WUhHRFloL1BuMWd0N1NaamRYSjZ3RmdVMm9EWTRoNVg4QXZlVVNMK0VUVHlV?=
 =?utf-8?B?eUIzUVJMMEtMZUlQYkN1N3Ivb0tNYklPUjk0cDQrL1dXWm1veS84TFdiWUh1?=
 =?utf-8?B?ZjFXZ3EzQzFDZERlMExNSWNwNGE4ckVwUk9hMmt3T3lFU2dWazdzQ1BsTnVD?=
 =?utf-8?B?ZFYxNGtjY1BoZGVudUNUK1VXdmJIdkZJUnZXTzhmNC9jakF4UFJGZXR4UlIx?=
 =?utf-8?B?SzRQRW8yY0hsZnNvc1VZT29VdmpCZ21aY21CbDJIZ1NSNkJGNTF0Z21kVFVD?=
 =?utf-8?B?NFBCWHBIcFZDMHJrSGJFOXU3OU5tWkluNVpGQjB1TUdRek93di83YmE2VjY0?=
 =?utf-8?B?Nm9XUzRHb1J2Vm9kNFZjeG5tNTRsdHphcjd2YTRSVXQwR0RXK1Vib0hjR0pB?=
 =?utf-8?B?V0VSTFg3UHVtSU1kZnZYem5la3dEVFNWcW00YlVmYlcwMHVtS1RTYXJaZW03?=
 =?utf-8?B?N3JzRVJzcndMWC9PT1lONFMzRS9VWW9JbGIrRVVZMmRFbHU1OURBUVN2QWdr?=
 =?utf-8?B?cnlleVFQVTF2VEZBcHhvVjhOMHpDcXdLVVB2cUFTQmpEazlZb0VobVNWaThk?=
 =?utf-8?B?NEJEd2swWlA0R2RBVjFlczJPWmxZSitVZnVMcURCVjB4dmRkVTZVK3lQQVFT?=
 =?utf-8?Q?gpIN0Z2jz3wT1RieQLHBE/KkX?=
Content-ID: <49D9EADFAC705F4E87F18D15F303BB52@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c86783-8768-4a5e-e322-08da672fc983
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 13:33:36.7865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WSsZgmLAup76WP4Z8CKkz3MeCKbJU5WW54uCOTx2Ndf31CDEXwckX+bqtUPyYoWy0HFjBPakSw5pufo47aVZWf6oW4+rHkwWxfo7gjZD/7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_063352_365190_319CE55A 
X-CRM114-Status: GOOD (  20.14  )
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

On 16/07/2022 13:35, Jisheng Zhang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Sat, Jul 16, 2022 at 04:56:45PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> This patch add two erratas to enable/disable svnapot support, patches code
>> dynamicly when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
>> option is set. It will influence the behavior of has_svnapot function and
>> pte_pfn function. All code dependent on svnapot should make sure that has_svnapot
>> return true firstly.
>>
>> Also, this patch modifies PTE definition for Svnapot, and creates some functions in
>> pgtable.h to mark a PTE as napot and check if it is a Svnapot PTE.
>> Until now, only 64KB napot size is supported in draft spec, so some macros
>> has only 64KB version.
>>
>> Yours,
>> Qinglin
> 
> hmm, this "Yours ..." should be removed in commit msg

And while they're at it, they can drop the "This patch".

I might've said this on a v1 (I know I said it on someone's
v1 recently) that having "Also, this patch" makes it sound
like this should actually be two patches and not one.

Thanks,
Conor.

>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index b17fd4666b0c..c5e1629a6033 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -385,6 +385,13 @@ config FPU
>>
>>         If you don't know what to do here, say Y.
>>
>> +config SVNAPOT
>> +     bool "Svnapot support"
> 
> Do we add an config opition for each isa extension? That's not
> necessary. I think we'd better remove this CONFIG option and keep
> unified Image in mind.
> 
>> +     default n
>> +     help
>> +       Select if your CPU supports Svnapot and you want to enable it when
>> +       kernel is booting.
>> +
>>  endmenu # "Platform type"
>>  menu "Kernel features"
>> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
>> index 9e2888dbb5b1..84ad32075637 100644
>> --- a/arch/riscv/include/asm/errata_list.h
>> +++ b/arch/riscv/include/asm/errata_list.h
>> @@ -20,7 +20,8 @@
>>  #endif
>>
>>  #define      CPUFEATURE_SVPBMT 0
>> -#define      CPUFEATURE_NUMBER 1
>> +#define      CPUFEATURE_SVNAPOT 1
>> +#define      CPUFEATURE_NUMBER 2
>>
>>  #ifdef __ASSEMBLY__
>>
>> @@ -93,6 +94,27 @@ asm volatile(ALTERNATIVE(                                          \
>>  #define ALT_THEAD_PMA(_val)
>>  #endif
>>
>> +#define ALT_SVNAPOT(_val)                                            \
> 
> I believe SVNAPOT can be supported w/o ALTERNATIVE, static key mechanism
> would be much simpler.
> 
>> +asm(ALTERNATIVE("li %0, 0", "li %0, 1", 0,                           \
>> +             CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)                     \
>> +             : "=r"(_val) :)
>> +
>> +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)       \
>> +asm(ALTERNATIVE("and %0, %1, %2\n\t"                                 \
>> +             "srli %0, %0, %3\n\t"                                   \
>> +             "nop\n\tnop\n\tnop",                                    \
>> +             "srli t3, %1, %4\n\t"                                   \
>> +             "and %0, %1, %2\n\t"                                    \
>> +             "srli %0, %0, %3\n\t"                                   \
>> +             "sub  t4, %0, t3\n\t"                                   \
>> +             "and  %0, %0, t4",                                      \
>> +             0, CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)                  \
>> +             : "+r"(_val)                                            \
>> +             : "r"(_val),                                            \
>> +               "r"(_pfn_mask),                                       \
>> +               "i"(_pfn_shift),                                      \
>> +               "i"(_napot_shift))
>> +
>>  #endif /* __ASSEMBLY__ */
>>
>>  #endif
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index e48eebdd2631..292ab93321e3 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
>>  enum riscv_isa_ext_id {
>>       RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
>>       RISCV_ISA_EXT_SVPBMT,
>> +     RISCV_ISA_EXT_SVNAPOT,
>>       RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>>  };
>>
>> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
>> index 5c2aba5efbd0..e8463515a46c 100644
>> --- a/arch/riscv/include/asm/pgtable-64.h
>> +++ b/arch/riscv/include/asm/pgtable-64.h
>> @@ -74,6 +74,20 @@ typedef struct {
>>   */
>>  #define _PAGE_PFN_MASK  GENMASK(53, 10)
>>
>> +/*
>> + * [63] Svnapot definitions:
>> + * 0 Svnapot disabled
>> + * 1 Svnapot enabled
>> + */
>> +#define _PAGE_NAPOT_SHIFT 63
>> +#define _PAGE_NAPOT      (1UL << _PAGE_NAPOT_SHIFT)
>> +#define NAPOT_CONT64KB_ORDER 4UL
>> +#define NAPOT_CONT64KB_SHIFT (NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
>> +#define NAPOT_CONT64KB_SIZE (1UL << NAPOT_CONT64KB_SHIFT)
>> +#define NAPOT_CONT64KB_MASK (NAPOT_CONT64KB_SIZE - 1)
>> +#define NAPOT_64KB_PTE_NUM (1UL << NAPOT_CONT64KB_ORDER)
>> +#define NAPOT_64KB_MASK (7UL << _PAGE_PFN_SHIFT)
>> +
>>  /*
>>   * [62:61] Svpbmt Memory Type definitions:
>>   *
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 1d1be9d9419c..34c4be9de79e 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -284,10 +284,38 @@ static inline pte_t pud_pte(pud_t pud)
>>       return __pte(pud_val(pud));
>>  }
>>
>> +static inline bool has_svnapot(void) {
>> +     u64 _val;
>> +     ALT_SVNAPOT(_val);
>> +     return _val;
>> +}
>> +
>> +#ifdef CONFIG_SVNAPOT
>> +
>> +static inline unsigned long pte_napot(pte_t pte)
>> +{
>> +     return pte_val(pte) & _PAGE_NAPOT;
>> +}
>> +
>> +static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
>> +{
>> +     unsigned long napot_bits = (1UL << (order - 1)) << _PAGE_PFN_SHIFT;
>> +     unsigned long lower_prot =
>> +             pte_val(pte) & ((1UL << _PAGE_PFN_SHIFT) - 1UL);
>> +     unsigned long upper_prot = (pte_val(pte) >> _PAGE_PFN_SHIFT)
>> +                                << _PAGE_PFN_SHIFT;
>> +
>> +     return __pte(upper_prot | napot_bits | lower_prot | _PAGE_NAPOT);
>> +}
>> +#endif /* CONFIG_SVNAPOT */
>> +
>>  /* Yields the page frame number (PFN) of a page table entry */
>>  static inline unsigned long pte_pfn(pte_t pte)
>>  {
>> -     return __page_val_to_pfn(pte_val(pte));
>> +     unsigned long _val  = pte_val(pte);
>> +     ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
>> +                     _PAGE_PFN_MASK, _PAGE_PFN_SHIFT);
>> +     return _val;
>>  }
>>
>>  #define pte_page(x)     pfn_to_page(pte_pfn(x))
>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> index fba9e9f46a8c..9f1113fa2b96 100644
>> --- a/arch/riscv/kernel/cpu.c
>> +++ b/arch/riscv/kernel/cpu.c
>> @@ -89,6 +89,7 @@ int riscv_of_parent_hartid(struct device_node *node)
>>  static struct riscv_isa_ext_data isa_ext_arr[] = {
>>       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>>       __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>> +     __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>       __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>>  };
>>
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 1b3ec44e25f5..9f38b7d02f2a 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -198,6 +198,7 @@ void __init riscv_fill_hwcap(void)
>>                       } else {
>>                               SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>>                               SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
>> +                             SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>>                       }
>>  #undef SET_ISA_EXT_MAP
>>               }
>> @@ -259,6 +260,20 @@ static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
>>       return false;
>>  }
>>
>> +static bool __init_or_module cpufeature_probe_svnapot(unsigned int stage)
>> +{
>> +#ifdef CONFIG_SVNAPOT
>> +     switch (stage) {
>> +     case RISCV_ALTERNATIVES_EARLY_BOOT:
>> +             return false;
>> +     default:
>> +             return riscv_isa_extension_available(NULL, SVNAPOT);
>> +     }
>> +#endif
>> +
>> +     return false;
>> +}
>> +
>>  /*
>>   * Probe presence of individual extensions.
>>   *
>> @@ -273,6 +288,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>>       if (cpufeature_probe_svpbmt(stage))
>>               cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
>>
>> +     if (cpufeature_probe_svnapot(stage))
>> +             cpu_req_feature |= (1U << CPUFEATURE_SVNAPOT);
>> +
>>       return cpu_req_feature;
>>  }
>>
>> --
>> 2.35.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
