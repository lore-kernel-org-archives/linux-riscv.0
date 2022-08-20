Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8115FC25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3j8gmKoDPXZPAfTGkQOO69kgSVIZlDTkIwBsfdgBgVo=; b=uhkvyFfjRO2VDc
	y7RLG5qTVDpc7ntqQWD+GIi3dnzrb13pzyeHEIJqLcrSYZnDzIJXUG2kXqIEv1r+rDn5eJlCXq2mr
	TVef6fDyh2WHlQfUUC6I3ZGG009c51pHd6YQEsaeEcU3gmyrRQ4OgWjZ6ybs4BJp5w88xL2Eol0lE
	3AwAjWIiMHvzObxEpMzzktv1HVqWpbqhJHEmSU/hyRP0mxQyYTDZU3Jw8K8RInCTuatayfttvAq5b
	l1BuIYMFSTAvQiLvjLN4Mk8cGASNGxYCVJIpnDMeJU/P/H2jE8Nip3WRZgEoYCHLcDEDzmFnI5OuV
	mBskmujYQVZAEV4i2eug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPKAd-005H7j-RG; Sat, 20 Aug 2022 08:49:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPKAV-005GoT-Qn
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 08:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660985363; x=1692521363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3v7yDDo++E80tSLplaPrsOKoKsp8iDNFHZ86pUKVPeQ=;
  b=usYKKXCn1U7l3EegX+cp6vk7DwwD0Qx72qLEWqkW04/MQvSFqVVQP6J0
   9Neis/YeOLw5QZ9WYrUKGsxB57fKw8FvKcjGfxsMX+R8kEuqonhkCNC65
   7/qwVEF9UruTFmywQqbvrru8jP0PDqnaeuMDHGK3lsEeQxcQ6aci+TMWH
   Kbr2/WYFVKom1EGy8EF6OlLsqlFXPkk+kVD/I/GqxvwbUNo+yDFLTCx6W
   Wk5YFsGVPM+pdg1e3NEgJlUa8LBIrusljydROvaDZLkOsxgTvpjrYJa/y
   YJWwWhxn0MIRC2MlnOoK19QFF+6ytOO3cQ3rWkdfPpG+GUSIaHm8EgAnx
   g==;
X-IronPort-AV: E=Sophos;i="5.93,250,1654585200"; 
   d="scan'208";a="177170143"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Aug 2022 01:49:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 20 Aug 2022 01:49:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sat, 20 Aug 2022 01:49:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0IiJ1RN5Uz8QkL1pby68nkIceHyBYwUZI2dA1sgoS6M2Raba5xzpFZ7RHS/oQ2d1rQpS0DOcsyF7MkHCWJBm5Jh9QAv2wh6Xi0HKY/7+A5SFnmA2s81NCdRfdI1aE17OwY9aP7CF5JwDCcLY8hLn17ULi0Dj4Ha7zpwmIguYtP5W9VDQbmBvM2hDUruc/iMbqyBjllGh7YyYfUHe9qC66ERkYqfo7DZrmBNH3LVfRuKjrS98l7NfV/ywl8+TxiOmtbMZUm900N/r8krFFq6TTv35xBs/FtdUwQk+LlJZKx2aAIhOEG6Nng5yIPHK0smGXsKLhOka/WAV+Wl2VTHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v7yDDo++E80tSLplaPrsOKoKsp8iDNFHZ86pUKVPeQ=;
 b=JtC38/xK1S8rWLyRBlmL+CFfULC68mfV97/5eTM+fj6ZP3jotoq3fzNebU8M406oyjo4hDFAtvncsfsIFG7j7DE4HrcllqcAkaGDX2aPrGhvO5TUieRtHIlHDZg2uxx/NFAqNhKA6fLNQ6IE46kWd8TFYaP9uJ6S/MqmQ/PN50DzLUpW2iK27xsF8tkuMmjDGr7xmN5m0s7OLi8y4koXHwTV7D74AAWOnSW5wRErTUAeX/3QxqXQpGIoBlNelbIPemFd5oexNBafGibiqFcfT49myhs1QqIOs+GDYkEgo0pC4hBfXYZx8U4+n3MsFr09+fbCW1FrW9sGQIDFh794cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v7yDDo++E80tSLplaPrsOKoKsp8iDNFHZ86pUKVPeQ=;
 b=JvxftCyP0b04BLSDqLQSOryw8CHcInOck/8L0vZWL1tT4mxGrz6P4zNCSU7WLLXskYhVLHJX/h4Qnpl/zabV1kuMnwmZ0qrSDw6TGpfMW+u9gq+LzniSVt6gmLPsx6UYHOr+XwNGWA8Dkh+ofK8Ukh4hdvazOxZLErqlWfi6pi8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Sat, 20 Aug 2022 08:49:12 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Sat, 20 Aug 2022
 08:49:11 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <Conor.Dooley@microchip.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>,
	<anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 5/8] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Topic: [PATCH v2 5/8] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Index: AQHYsLouMPh7rdo3sEeVwwyr+jl3hq22lMeAgADsSwCAAADogA==
Date: Sat, 20 Aug 2022 08:49:11 +0000
Message-ID: <47cec683-dc17-7aa2-3511-b0244020d571@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <e9b00bb5-bb78-091f-9c10-96c156690469@microchip.com>
 <CAMuHMdUGttswcSGeOdrJLeoZLmoeKhm7R82L-3wLJnagmZ4dBA@mail.gmail.com>
In-Reply-To: <CAMuHMdUGttswcSGeOdrJLeoZLmoeKhm7R82L-3wLJnagmZ4dBA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 692da858-4824-44d8-1773-08da8288da76
x-ms-traffictypediagnostic: DM4PR11MB6216:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ghx7rtZq/VxXYFWxuzDJRZIzONTjOBPyZaXwRJgfaFK/jgyoQhWo5w9+rFXBCenktgRntBlcN30fTGun+JjynjPPVNhc+KDlCF9Txsq1RFMNs9eBGDZbbhjaMeV67b/OdmArcbngBclDUWRWQnbeXFB7zIQtcmhE7oLVTor0fDEmKjN1vV3wgd+u57+ov49q1cdAcSYc42ZhE+INrAn0v3G46cow2PhEOPU6QkozLGbcSazPrKMruoBPfHBXqZzNaLwtZmJo6MiEcHDLdMYKHzgtYdxmJfjX94aDXJXmr4J1GzPa5wipqvrND6eE9CXxsbOOFmnhpcILugSq+Bldwu+3yuxT+VO7bPeqbPcwT9JtSEoRn47kU9Bv4rmKZJG4hGn+XmT8ts4d7r3eqTOeWsWtRIbztfC4KrOE67jbZCLkVJawchxKy9d6fGODvLXMk2pFIpXxTkefpSv7dSPG9oFp0NZkfLDdyVuku66+GqS8VFoH9jgmuVHtIIo2bCF/W2Vs0CzrKqbONQd9O2oXjhzioj4l3/aCXeqepGdteYyA52QIpSeQ9+AnkokRkOnYySx6K+Rm3GyAByvs4yzuztw78lumsriOTTgVz710ie1tMrat3+4ma9IEycpEHmkiRQtfwfxlhx2pCes1G1HEomIJznpVmflDMQlF38JXFkzpLouxXQXmcrd5Rdr+705zNT6T18MYeirFRyLs+8xoD6HFELqWXXujTarOqikAwLUPJe/yq1rmkDDcXkYQcXeMMN595RKtMzYWvkEajrLexSEmk5pLpdfnIwSeOePV7UQytvtTYXXeIJEEJLufVjGybyeGqo1nRAdw7vbdtgSu9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(136003)(366004)(396003)(2616005)(38100700002)(38070700005)(83380400001)(122000001)(186003)(5660300002)(8936002)(7416002)(91956017)(76116006)(4326008)(66946007)(66476007)(66446008)(66556008)(8676002)(2906002)(6486002)(86362001)(53546011)(6506007)(26005)(6512007)(316002)(478600001)(41300700001)(110136005)(71200400001)(36756003)(54906003)(64756008)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1FtTUtHSWdva1BTTjRuNUM4NkhXSW5TODR3L0tlSkdocVgyUWxyS2lERHFs?=
 =?utf-8?B?QUhrQk5Sc1VpKzk5SmVRdEt0Tng3RlJaYUZDRXFmaVk3eWM1TUxQZjBmOTVy?=
 =?utf-8?B?ZzJJR2h1c2tvWG9NczFMNkJSYWt5dWZUejhhUy9ZdTlBYVpoNkpzZ1U5WG11?=
 =?utf-8?B?Z0o4SitaWTJEY1VKdWgvSGhNNlRzOUNiMlJ3MFBHUUJtczhCSTduWTY0bVFV?=
 =?utf-8?B?akp1L2F4cVdoK1E0N2RvOWxkSzBodysrU040bytIUGp5bzFYelhGY3k3YVRn?=
 =?utf-8?B?T0RtRmtnQWZpZTVqS2k3VGN2b0RjMnlicCtybk1VWHBlL1lPdStRTjM1cDg1?=
 =?utf-8?B?U0pXc2VaYzFDam1rNlFXeUlYR3RLd0ZveHlnT3RZZUVRVjZLaCtVVml2cE1r?=
 =?utf-8?B?bWcxQ09TdGJHenVwTElENVZDZTlIU3BsaVJ0OE80OE8xRUZ1WWw4eFdYR3N1?=
 =?utf-8?B?TlNtMWNiOGhQTkJtWmFjbUtNTmJRNlR1V3UyWmhHeVRGbUtmZElqcm0zNElH?=
 =?utf-8?B?eFA3aC9jc1ZqTXZIYi8wU3FGNktmSXlEcGhTT3g5MFBqWHF3ZUdXR3NXSHNo?=
 =?utf-8?B?dVpnSWhJT1BLTWROa0ZvdFJndFMvTVBnYlBIbFBUNEZHZmRQeERpU2IxVXhz?=
 =?utf-8?B?OXpFaWpvSmFqb084MWZoK01OeG0xSHQ4UmMrandaVSt6RlFRYjhtSVgrZjhP?=
 =?utf-8?B?azJaQ25UUTNNaDczY015bzBlOTJqclIzbUdQVUViN0hCZkR2Sit5SWM1N3g4?=
 =?utf-8?B?UnZXOEV0YUJOMnpjQ2hQbjFaTjRvb0RnaEQ1UFVuSTlEMTY0VWxQTFd5S2lY?=
 =?utf-8?B?Q3FlTCt1bzNJRE9sVnlYalhGZXAzSUxQMHJYZG5PTmlNQ2dkY3FTOXdHb0Q1?=
 =?utf-8?B?dlVVbm03MU1pUzJPOVZqWVExSWdFNXVyRE5wV2lHTmFjWThYeHlOY3IxcTh0?=
 =?utf-8?B?dTgwRDlSampJWTdvVGFYQmZqQzFidU95OGI0NUY1YjdJNmJ1YnYwRVhDRnA1?=
 =?utf-8?B?b0dTV3EzRHg3NkpNaTZ2TDNNbVZaU0w5c0lMbEN5U2h2ME5vTTlNSCsrVWxI?=
 =?utf-8?B?MUlzdVRvejU0dkRCUm96dENoa2dMTW8xOEVjOXlKQjVBbGlFaS9NcU15YnN2?=
 =?utf-8?B?NWE4Q1FuckhWdU1CaFF2UkFrOVBIRGxYeG5RVXU4TmdNdlFmVHp6QXIvalZU?=
 =?utf-8?B?b1FMT3Z5bkt4RmtjQVpFV09TN01jOXhTaG43NGpQU016U3M4VVRzY2pVU3Bv?=
 =?utf-8?B?UzIxcElVWG16T3FCVU0vaERNNnJUNExoZFRtZHVDNlVlbFBMLzc5cWRYTFY2?=
 =?utf-8?B?TjJ3aXRnWlcrUC93Vlg5TDQ0elphcmFlQzgwS095b0YxQkFsYzNPeUVpSUdO?=
 =?utf-8?B?b09iSk4zblp1cE9ja2hCQ3ZQYWxlN3M1REswUzhnM0lPbFBnMGppWVkzRzg0?=
 =?utf-8?B?Q25iUFRFV3JObEErUlJuS3VjUnI5VzFES2YrbDV6Z1l4SUZZWVVVRUZZMGNz?=
 =?utf-8?B?UzhrWlFDSjREVnYrT21nUHRsRkF1WlhlcWcvZVhheldkWlFHN1BMMisxOWxW?=
 =?utf-8?B?ZFlQb0NZNmFTNW1TZ1QyMDAzNFZNOEpnaGRWK2R5MFBpWVNMeldNRFdEVnFI?=
 =?utf-8?B?S0xNYVJJd1hrMjF5TlRaMjRlSU5PS3pFT3RLYzR3a1gxWnBFbkluMzk2ZUVs?=
 =?utf-8?B?MnZYYXdMaDQ4OHlaWWdTeVo2Rzduem4vdXNTeHZCVy9ZR1pHOGkyOEpBOWRh?=
 =?utf-8?B?YURseVg3YWoycm5xV09BLzA0RW5XVXhEazFBVjRUOU5lRmtKSEorK2dlY0U1?=
 =?utf-8?B?ajhKU0d0ZWJPdmljNmhPNnhEWnQyc1plZitLVjBHOHU5eEZqNi8xNXNEOWVq?=
 =?utf-8?B?RkNEeE1GU3NhM0xCK2h5N3VGN2VrTlJHSlhDSGpPLy9vM0RWU3VYMVIyNXBD?=
 =?utf-8?B?S09PcUVmVUVzY2xBTjFYd2cvTHB3TTJsaTVzd3hGMTU0ZVJjbnNGQzd6Sngv?=
 =?utf-8?B?NHRjUTNwTHh2Y20xZ2tWcE4rRGZ2V09ySHRmUi9iV1h0VVJtMTFyZXZqVG5U?=
 =?utf-8?B?dVNhUEU0NEVKTlNuWld6MjJrWjFHZXJodEFaUW42L0crbnN2Nm54WURoT1hS?=
 =?utf-8?Q?uwsyQ4IyQA1uztD/nn/1P5Tac?=
Content-ID: <3C7ADF21D94C6A45A3B995BA0C64284D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692da858-4824-44d8-1773-08da8288da76
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 08:49:11.8056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZH3J5VfzjNl5zeFztyK/z8gqx95dzy/b5A0OV3vgQY0g3+U802Qc4lUBjBAfsWjgiFA4xDJXy6GqvwVoln5noyZaLMJrqw/oK9P3BPiEhwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_014924_198200_CCD9EC12 
X-CRM114-Status: GOOD (  22.06  )
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

On 20/08/2022 09:45, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Fri, Aug 19, 2022 at 8:40 PM <Conor.Dooley@microchip.com> wrote:
>> On 15/08/2022 16:14, Lad Prabhakar wrote:
>>> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
>>> Single).
>>>
>>> Below is the list of IP blocks added in the initial SoC DTSI which can be
>>> used to boot via initramfs on RZ/Five SMARC EVK:
>>> - AX45MP CPU
>>> - CPG
>>> - PINCTRL
>>> - PLIC
>>> - SCIF0
>>> - SYSC
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> v1->v2
>>> * Dropped including makefile change
>>> * Updated ndev count
>>> ---
>>>  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++
>>>  1 file changed, 121 insertions(+)
>>>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
>>>
>>> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
>>> new file mode 100644
>>> index 000000000000..b288d2607796
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
>>> @@ -0,0 +1,121 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +/*
>>> + * Device Tree Source for the RZ/Five SoC
>>> + *
>>> + * Copyright (C) 2022 Renesas Electronics Corp.
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +#include <dt-bindings/clock/r9a07g043-cpg.h>
>>> +
>>> +/ {
>>> +     compatible = "renesas,r9a07g043";
>>> +     #address-cells = <2>;
>>> +     #size-cells = <2>;
>>> +
>>> +     /* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
>>> +     extal_clk: extal-clk {
>>> +             compatible = "fixed-clock";
>>> +             #clock-cells = <0>;
>>> +             /* This value must be overridden by the board */
>>> +             clock-frequency = <0>;
>>
>> What's the value in having the clock-frequency here if the board .dtsi
>> overwrites it? dtbs_check will complain if someone forgets to fill it
>> IIUC & what the missing frequency means is also kinda obvious, no?
> 
> Some external clocks may be optional. Hence "dtbs_check" will complain
> if no "clock-frequency" is missing.

Right, seems reasonable enough.

> 
>>
>> That aside, by convention so far we have put things like extals or
>> reference clocks below the /cpus node. Could you do the same here too
>> please?
> 
> Really? We've been putting them at the root node for a long time,
> since the separate "clocks" grouping subnode was deprecated.
> The extal-clk is not even part of the SoC, so it should definitely
> not be under the /cpus node.

Under may have been a confusing choice of words, I meant "physically"
under it in the file. Maybe after would have been a better choice of
words? I wasn't suggesting you put it inside the CPUs node.
Does that make more sense?
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
