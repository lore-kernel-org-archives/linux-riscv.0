Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECA7C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfPEvr76Gmo8E2OZCntUcCnyGIHxg0gvI++SkMOwSco=; b=knAsRB7BLrAxi1
	ojFH3TmIf1RGqP9zuIXuk9bkj8Dqm6bZ4IWDa4kiIeRX6p2TWJ1j7upjl6scGY8OoyvGeBlfw2pQG
	cJBpl7DsZqCl2j0gE9EbLVjafeUg7nYRKliecQ/PiDgmrd+hyC7EtcYjO6qLs3QUPmFzQAyIr2PQ4
	pi1sXnE4WB/h8jFPKnD8NVIlvef0PG2lWq0YIjxjWJyvA/UzgyqMR+SpmyLVD571V8WbdLtzGGwDx
	iNqJJhREgQkOZxC2Iv/S9hPgi9v83Sdb/gDLJl4sCk0CSYDy38JoDlOAyMQ6tJqSRvfvo0XKRcqQV
	zSFCeUJttX1Uu/cCFjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xg4-00BJtd-5K; Sat, 18 Jun 2022 12:35:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xg0-00BJrJ-Lf
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655555744; x=1687091744;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fDT49E8UQeNTe1111UJ6CK9tUQvQ+aw3BhSkeHrYIqE=;
  b=DJo6f2i8SHf88IViL0ODW/gKRHzA+lBxaiaa3lQ/cq7MRvPKnDgVNAeq
   qrCiORRlXfFRHP2UmJzJLI0DP0HdyhssOEUW0RO39u/XAv5Jzf4Z0Kxqt
   lp7tB8314ay/cHkawAn/81XLNwB3dC63yroUmCKlYqJAHrP2N8zsc54fd
   1XGZz5662R45by1zTI2EcF9hPCz4y5I2sFd7Eq4WW1bj2DjXA7IhdwAwi
   2SlaED0Spc6axpXySP2fnNKTaFv9HRBksHo3JC4gb7g092CzKlLtxd0sm
   0A8mtn0SWbNfV4OTdAVLVggJTOEQp2qFjS+yLdfB1LOhI15EUuWj1RWwO
   g==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="100644470"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jun 2022 05:35:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 18 Jun 2022 05:35:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 18 Jun 2022 05:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWCc9+pUO0GLaYNBv/Xu96TxsGYmqA6MMc9k7KXRDFXGWmr9Iqh7rMr7yMIFcrMLCQ6ZbAn9O8pvKCQ2BeNbFpcJdZnWc/KnCY6NS1w4bb3de9rpoBUf4RmzlOdjUCnkv1FLkLNgwX/XsdbAKSmmcC3VezQP981b1QXk5VfX+T/1JlYvuuurLps6WIbPEH8GPCeKMEd3UTUF+XDvVLzoV/o8S3ZI0F+G8pwXqlG3+Y18NA7eQ9zdfVAyWPS3w+YqPIv5dtXjyvcYGIEx0aH+Qde5kMSiuN9E6Kj0vMGFqEe1cYt9JorXhrGZsvLfTeDNf7P7jO+Yayi+xUnfcnpmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDT49E8UQeNTe1111UJ6CK9tUQvQ+aw3BhSkeHrYIqE=;
 b=J+CwOvJJsJ2D+OyYBXz3o067Ji0BeZNYR5M/V2pBIxqScKoqlwboSCgkQvbNpm+szKs+04HXbC/XX4LJ32RfvqokER+stWb+nE33a/3qPf/chhDDj4f2IzzVjnMlJmkjCAhJcIbuLQ11DwrCl2R6pAMPq4Lnr4QdAVgu5YBvMcZdWWrMNW5XAwextjLr19E+grgwydojSOBD3RHCU/VFYjtaWe6RQTBewc+BFfG8S6l0XPRpvg5K4zIhYSIPKDp9gE4x+nwcSj0mAp+JW0G9ggPdx804H9fvvsJh1mtolYiFxYcOeBDknipmv/z2Sk4J++jgxt3tn9CnTpUnSV/TAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDT49E8UQeNTe1111UJ6CK9tUQvQ+aw3BhSkeHrYIqE=;
 b=EK4MJ1Qq34mHcCc6UQF1YKZiwnHNnGZHesB6Y8YENDP7G/0GvlthFxztz+UwHUOL3JAAKunshrE8MPDp9axdzGO9isq0ywoTkwc/p2m06X/Rm982w4pux+EmK9/MA6Yyqg4G/nkGB9mZUgcqFumEMVzpPRmZs5e2iP2d8lRwjQs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1350.namprd11.prod.outlook.com (2603:10b6:903:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Sat, 18 Jun
 2022 12:35:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.018; Sat, 18 Jun 2022
 12:35:33 +0000
From: <Conor.Dooley@microchip.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
	<daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>
CC: <tglx@linutronix.de>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Conor.Dooley@microchip.com>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>, <jee.heng.sia@intel.com>,
	<joabreu@synopsys.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-spi@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1VGa+A
Date: Sat, 18 Jun 2022 12:35:33 +0000
Message-ID: <a71a2bea-b906-625a-573b-a59adb4cbdfb@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
In-Reply-To: <20220618123035.563070-8-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12d4d30f-d130-4428-80ef-08da512709ce
x-ms-traffictypediagnostic: CY4PR11MB1350:EE_
x-microsoft-antispam-prvs: <CY4PR11MB1350E785140E265BF80A01BD98AE9@CY4PR11MB1350.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2CLEC5IVGgcv5x8Crsrsj66OKNDSG7EwlgFKEDFYW7d+E3YSAQYq+nQiTRXpg+ch6spyA3FCZKVf/MOChaL+ZuFcjbQkeoUYZAtp0FPWXJpPiljlYgcpWA3h+zUmf1Su4jpHaT+iecKWj2aYOcwUPwefaM0udM8fgCCiGvQjiXm3S30mlBz4dPyysd+GMeD+DHOctMvZ+E7x7J8WPhF+8ZQhJxQudkdGxRuhN6WGxiBpImzwJ+3LR7wi2k9bhPFMnzSjkD88mN6MwYCMXAkFIxHxZbVkIbcmi+BInCqhqR8txK6baj77RHSlshXjacGtQmrPlKHvTzlV87IBYDUOBXV3M3j86TPiROBUr2DFKpaDBOCKqDZ7zlrhyfb103k+CsYDmXC6NwWlhL5N2p+2yo/Yb+l8cL2D3fOzbhGj5epeSydzLMfqntMByFSU+Xk7ZijEzUXhMfhWJjBYHj2fZYgJVLtb+pMYVqBheFjY06jv1yc8/evVrXcqdg3BOifVqoWgXbWU1zuWi+m8MeclW80mVFc7JXFjj8emVMeS2F9WnTSLzMU5O/jT33ug2XL7u4gK9cLKXPnejHusR63PaKZdLkACWQD+jTYL/q0tkKchbYESBXgWf66WTcjLj9qSiwSr6mg5N1hhrdKlHrMpYnYkBsN6L4JQ7d5/uDvnVqBO68Cf3NAFjM46WznncWcWCM2tYfxktKB5z8J33ze78c+dgXScvAzXpw+1Fn+yiKzQCufnbGX940K38LWQJL/Ij6wUFG/GvHnvips/xVukiqeL92jqjUQvanhAKBYkAkc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(110136005)(2906002)(31686004)(71200400001)(54906003)(36756003)(2616005)(6512007)(5660300002)(7416002)(6486002)(7406005)(186003)(66556008)(66946007)(86362001)(64756008)(4326008)(76116006)(8936002)(66476007)(316002)(38100700002)(53546011)(122000001)(6506007)(498600001)(66446008)(83380400001)(38070700005)(8676002)(26005)(31696002)(91956017)(921005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTd3NVVZelJGU3NlVGZqYUVyU0VIUlZYNUhUb3ZnajdiR1VpYVB1eXhyZm5h?=
 =?utf-8?B?czFtemw4aWhVL1RTdnQ3TmZIa3VYbzZ1NGlzSnN1V2ROQzBGYWk0YjBEUTV6?=
 =?utf-8?B?Y2V5L090VXFPNTM0YnZxTURkQm0yR2pWcFIvM1BNOEZiaDk1Q1VTZU9JY2Er?=
 =?utf-8?B?dEU4Tnk2WkdqdTdsK3ZEYlpvY1B3RHFiSzFDbDhoOWtpeDU0VXoxRE9TQzY5?=
 =?utf-8?B?a2FSWGpCSUhNNWVnK0VLeHgzNXVEU1FzMnhUK3dSaXpYU2htQVY4ZmphWXR0?=
 =?utf-8?B?UDFkc1lVZDFoNW1FVGtGT2NvWktLeThpaXFFd3J5T1dObGxZd010RVFScVRq?=
 =?utf-8?B?SVJOWDBhNnZrdjJJYzA5RGtMZ3Jwc0ZacjVKRkpyMVZuRG5pNUdsY2Z3MlA3?=
 =?utf-8?B?Mk92TDF4am5qTkZtVndBQlc4RDFXZDZyZDFRa0RTSmNaNGJCQ0RQUTBGcFh5?=
 =?utf-8?B?aElFcUFJc0xrMXpxTlFucHFBK3VoYWNSUXF6dWNQa1Bnd24vc2E5YjR5VzFO?=
 =?utf-8?B?MCszWVVETUtibGI3QzNURUpNbTk2WHV1RUhyRXd2SmRUd0t4MGR4eVdhcEl4?=
 =?utf-8?B?bFpGNDZ2MjZuL2swY2xjSElsNFVZaUtFZlZVTUJPYy9qOFUrc1NIYXdMaVQ0?=
 =?utf-8?B?TTJnNU8xS3Mrc2o5WklZYlJndkhxS2VXdC9yQ0duN3lkSUUvUGJwZFZ4VHlt?=
 =?utf-8?B?UElGQ01UeWVVMU9SQ1FobENueFozbG4rc3llME14MkxPS3ZrY3BlSUpBQ3I1?=
 =?utf-8?B?YmtCb3FRcVFJc0Vmc3FCL0Y5am5QdThBKzdGdjM5cjVpK21lUHVqaStPRU9S?=
 =?utf-8?B?R2pRU3NQYkxsTExKZUhGMmVqRkNmclp5TVdCWjBDb3cwdEM1YldkL2RnSUN5?=
 =?utf-8?B?cnpJOTlGU0J4RUNpRXFpRjF0eEtVVXVwejdUMDJwUXJOT3c0N01OUjd6UnNq?=
 =?utf-8?B?TTladE9zM0JpOVRJdDFNOUZvenBaZFdjYll5NUhPQ1dYRWtDRGNMczhHMGxk?=
 =?utf-8?B?SU13eitSaFNIbHYyTVRXTDI3TGhrUzJjSFVaa0IzVi91OUlTQnRVS0FjbmxK?=
 =?utf-8?B?djd4SHdINVdjeWo5alJ6d0lPdUhoZUUyN0J1S0RjY1oyTTJvWlAzWnFpaWVj?=
 =?utf-8?B?cU9kRkt0ZTJZd1U1dXRxK2YrajRXdmlXanVaNjdsazJiekZZTm81RVhoQm50?=
 =?utf-8?B?cVQvYUtRTERqVVQ3blNOMThVWWgzRjlYc3NEdFpBZ25ISitrcFJrWlR1cmJ2?=
 =?utf-8?B?TzdyUEwwSjJzZnVuVytaaEpFM2RTN201cmJPdXoyYmVwQW9sWERkaWJOYXV3?=
 =?utf-8?B?aVZxbTdqa1JKSFBEVFhhTVV2TlFSendOMU5ER3U0My9FU01HUmVsZmlTT3Bj?=
 =?utf-8?B?cjY2a1A3QndMd1NhUHV1cXJxdXhRdEMxaWU2Y2RGZ3VMbHNodnBTTEI5R3BL?=
 =?utf-8?B?bVl1YitqajNPdERnVHN0dEEyT3JjQXdHOVdlTFRNT3ZWT1pIWVk5cUR2UzNv?=
 =?utf-8?B?U1AwOSt1cThPeDZxTzZaSFFIVnA0Sm90U0xjYXJqOThocGtLT1NJQTY1MEwv?=
 =?utf-8?B?bHk2WEwwVGs5NnJUSlBaUzBobUN0ZitEWkZLYWJYQTFWYnU5WmJ6c1lUYm04?=
 =?utf-8?B?dkxsTXZ6M2Z2NnAxWGVraXI5aThvL0NEQ3Fhb0VCYWRlTFVqME15RUlQSkdJ?=
 =?utf-8?B?SGZabFVUSDdBNEhMb3FjS3N1Ri9KVitjdWVzTlRSeWNScUZ0R0xicGlWSXRh?=
 =?utf-8?B?ZnMxUVN0VERpQnRIdjh6UXZsYU53UUNjZnZZSUhTczFUNHdRTkwyaUwwVkpM?=
 =?utf-8?B?ZzlWWGpzaWpjRkdSRFIrTVdKcnRWZEhTSWkxanI2QVo5SWJrRCs0TVFpcVda?=
 =?utf-8?B?eTVQQ0szZ3RvZFBKTXJCNzMvaU9wN2VFazZ5ZFdSNW9PYmp5YTVIOEh6TnhG?=
 =?utf-8?B?UytCWXFoQjFYclo0MFptTGhUNG1CeDlsbXovN1o3dXlrZkw2N0pScWtnRGE2?=
 =?utf-8?B?aktwbHZVWGxsWVlNam5pQ3Rzd3FaTFoza1FzNmcwcjdHV2tBd3VnT0RDanpi?=
 =?utf-8?B?aGFRd1FvaVM3VE1YN0lBM2lJYTRrbXY4VUc3RlFXWXBjeHp4UXdsNitwNjVi?=
 =?utf-8?B?Y01rQ3ZsUUk2OU5LKzJNTDNNbkFKVVZ0RWdtUFp0MU5CTDVoL29XUlI4OTJ6?=
 =?utf-8?B?NlY4UldwRzFta0MxSHNmOGJDaEZHZlVtMXRNRkt1Tk5nbndINjQyVjJPYXlF?=
 =?utf-8?B?emdwVUhMTFZTSkgyYWhFeUhSWllTdG1BS2t2am45citsWVluaStlS29QN0Vx?=
 =?utf-8?B?TXh1bDc2Z2xIcjNhMHpOK01iTXZjb2wzWnpuSk9uOTJ2TlBleE5EaEttL2JX?=
 =?utf-8?Q?7ShmlrBD71jBuK8s=3D?=
Content-ID: <82BCB53E30790B43AA198ED5D0364B29@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d4d30f-d130-4428-80ef-08da512709ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2022 12:35:33.5511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYhSvMXk1cErPlefVeB9NDUWdyNrtb01iEeDM31Hbp7JY0hL7u87DTjSTOjP5aqO94CzjA6PtMqpV6hFg4kMCnEE5wITLvmEa17SCBPap50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053545_010713_7C5FB5EE 
X-CRM114-Status: GOOD (  15.07  )
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


On 18/06/2022 13:30, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 memory node has a compatible string that does not match with
> any driver or dt-binding & has several non standard properties.
> Replace the reg names with a comment and delete the rest.

Gah, should've fixed that during rebase.
I'm sure there'll need to be (at least) a v2 & I'll wait rather
than resend.
Thanks,
Conor.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 44d338514761..287ea6eebe47 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>  
>  	sram: memory@80000000 {
>  		device_type = "memory";
> -		compatible = "canaan,k210-sram";
>  		reg = <0x80000000 0x400000>,
>  		      <0x80400000 0x200000>,
>  		      <0x80600000 0x200000>;
> -		reg-names = "sram0", "sram1", "aisram";
> -		clocks = <&sysclk K210_CLK_SRAM0>,
> -			 <&sysclk K210_CLK_SRAM1>,
> -			 <&sysclk K210_CLK_AI>;
> -		clock-names = "sram0", "sram1", "aisram";
>  	};
>  
>  	clocks {
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
