Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2247C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 16:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EmVAEg7/p/0xXOWvJYiHrSRTveDuDfxy6OvujGbyYk=; b=uKWDmtynem8QCU
	isu9MG0xvApsqt2U1nL/wdIBcj2ML+mmHjqxiEkoV/P+lGkmp4O3pTVkl+CZwCz+h3pdJkqOB7W1/
	JCZTgXjpk4eLpmTScDc126p3z+VixwciOIdiHs5hcpVh+IY6riz+yy05SshVSN5BkdEce5dCOA7Iw
	qe8gQgUeLl/j2eDaxH7kIKP12sqgHxhZYku15dzzbIVijCGx3E5LE3VwRKV9RobJoPqKXXWUSLads
	aCOfuVrkUkctyBJJlhYuAEtERIuqJsjG1jp7GTzPYvMX8Ia2USy7vGfvRa1OhU+xBDBDWwrQgQwCP
	tApdxsr9FqRiLYCy+U3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6xBT-000eQN-1H; Thu, 30 Jun 2022 16:38:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6xBQ-000ePm-MC
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 16:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656607104; x=1688143104;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tteHrIBCquRH9VAIG4EOyCC8OlEWekNMUvEKBboluEg=;
  b=J0PPvPXY7eVO+35f7Vi2mpVw5YjdwK09s/n9wJrpv4FWAewoi6rzRMt/
   CjZWzj7avqpvdgNANuobrxu2Ie7/sO3uK5uaohYpvd4VYI08o64ESc47z
   udcQ9isR6Z0UHbGud62uahS/DUsH3Y92k9TSNkcJK9+nas/amGnw+w0Yb
   dij0OgpJeOLf31dzYaEv42IXtFDGe0MB8EJxcvkqEeG/otHaLIdn/zizv
   GE/MiCpw9NUiO28gLIvtpBnZe9VfiS0u+AzdJbvAqTDMvQbPSc/ZoOfji
   V7Kcd770EK6aPEao9k21GFH8/VU1qsWF3FmCFPCMpU+vxalcWMMsYfEEv
   A==;
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="165868327"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 09:38:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 09:38:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 09:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hy8rh7QasHptcGqrBhqTEvjp4vWxxCmKX2OpWGZy3taGydk0orgWkc4+Zl656idDCp9UCZ62OUb/68jSvPQbFq78m4PWH0LEW4Pwin5op8GElmffv7Ea65v1t0z5uNZzSFNSgFzD2e8B0XSlRY93CtS/hkSWZpAayNFRZUG1+QwmoG06+IbkvOnC2bdF5m01KLON5Dbv956OuxQjL0EQwtuNAN0bxYhSTNFK4pFdEoI59Hh2DFzeKNcTyniylJbpd2TZuzV+0OhljOvBwHhhi6KxgQA7fKrFDUJWpQfPrAUnxjGDXAIFstHLMmLd/sJ2Zt5KyJvFCzLEYNh9GtlJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tteHrIBCquRH9VAIG4EOyCC8OlEWekNMUvEKBboluEg=;
 b=OLotvzhWQ1HLEPV30GJ2aI07Wr7bKqPaT3nZ/yEVisimoKuuR5YpIsalgSaAjDoDRHgYOQsnWOJKxR0ChfxzXm7+n91+pQKs6FguKmiZlyYEXf44P11uLk92n0dcMnQES8Lekp5Yy5Hg2AMQGh9nZa/+jqWAmPTi3KV9C8DzpUrp+e23rBMi19Wj7b3lhfEXpyuRl/b4IpLe8aa7TBGT9zsXYpj6165SkNhn6Sa1MLwnMUdzaXf6ctWtTRrOoasLC1hbCDrJBDigSXYEsoE3zDwoUMVNSd3OPK8qZjBXXCBxHwdeQcd3A0jxu6BUEtbfhQSkKO6eaUQz9PWxWENezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tteHrIBCquRH9VAIG4EOyCC8OlEWekNMUvEKBboluEg=;
 b=Fhuk67SFr6HrjqBkJ2c3Lj2CqVmjFlYRzyIgpTGoet2xd5+y+l/IgXyMcTjXDfcK9Ryk/slJS+pEaSRZ+pANbEQXk6qhdSR483mPbi4R0Jm3g4uBt/ywQnu7qe0CXI/+YP87NB5Htp13TJIavW8XKt51o7G5AdDAA4iueD0pAa8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1234.namprd11.prod.outlook.com (2603:10b6:404:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 16:38:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 16:38:20 +0000
From: <Conor.Dooley@microchip.com>
To: <Niklas.Cassel@wdc.com>, <mail@conchuod.ie>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
	<daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<masahiroy@kernel.org>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <dillon.minfei@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Topic: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Index: AQHYi+hg2HI7nJ4gGEWADL44nKFD2q1oJQgAgAACxAA=
Date: Thu, 30 Jun 2022 16:38:20 +0000
Message-ID: <a41eefe4-6152-6894-12ef-91b3cbf55b92@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
In-Reply-To: <Yr3PKR0Uj1bE5Y6O@x1-carbon>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65cb126f-9694-432e-d859-08da5ab6f13e
x-ms-traffictypediagnostic: BN6PR11MB1234:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WCRp48l9o3w7/GkTqpwZX67MM4ycs//eLx53CYXXyUGK04qWnp0wPw45RCO+jIJV1SY21x/P9DnllrpsK53i6tcdiQ0vTWRtrsu2X0cjaioT/bGWdbPuy70sDUd51eOiPUQ4vNYK9rdoqNFSzsXhpouY1WjkuzUEW7KM9zfihKYBugwT6LlFG2UVOUs0cMyk4uwmJmNdyTpqpz/4N9kjaO8fGcKCxWMofdvEjFG4KdNAbU0qj0t0wzJBNI0EvjuBs00+dPwxp0FABtvkdyZrCz7oyF9QvXnum1nFCgZ9ocQQ4bjisRryR57qwrT2VlUTljC/Ci+vxGu7mMkHhav05/BhlXFMQmrGqYj7zg132SOmoTrIk5sNuGqtn9b+8ocMednOFjWhZLYN0kYzdh6RaoD1jxG/NGjUGAwp8MV9gtAVqLc8I5sv1mo1MS+uDolDGks8Fl/deY9QE9q+PbN+ysqs6Q+J2Gn57KDKkHms9kOyzYh5t3Wr0wSv5Ycm2itj8In+YJJbuIEGalJTaW8ZZ1vaFa9xCVyocFrm1pRshRavQDyS1ptu39BeNVxkHsvrNGt1T/+EVUKQ2xU0Xyaplz7cLfhNltwxiD4FWjIYF36tZ2pRN1ZfHvNDFl3ChzFSgl25F7NZYoY8oUSvE5kiYUwiy03E4kVzOuyscFDSjV19vgKs6aIIlzRTjaL/wpYtKlNzTGNSOHahl96gjJIBWeUgel71XQ5HIVymINw2OCymb3lLfepit/Nvh4BdWJZencQxMt3BvT9aKkeZiuGCRxj+2FbxwBkCnoOmTQaCU3eUSF+VCRf+iKHeh2C2AbypfktEESbeICn28auKXfP6VV3rt4ul6zmHzhSBo3y/fZS2YceMW9Y+mlsUa8DYYyRN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(346002)(39860400002)(376002)(36756003)(31696002)(86362001)(7416002)(41300700001)(83380400001)(38100700002)(2616005)(6512007)(26005)(53546011)(6506007)(186003)(122000001)(38070700005)(7406005)(66476007)(316002)(64756008)(54906003)(76116006)(4326008)(478600001)(66556008)(8676002)(91956017)(71200400001)(6486002)(66946007)(2906002)(31686004)(5660300002)(8936002)(110136005)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjFaRmE2SUd4ek5VM0diRGhkaS9Vblo1NkRDdFcvYVZyVnI5eTI4ZDFueTJD?=
 =?utf-8?B?YklXazdFZDMwMWRTaklBY042eERsQ0xwaEhTWXlVdkRsTWsza0txcFVXSTgv?=
 =?utf-8?B?Y1RydGdhTDZtN0xSSVd5eWFTa0szOEZ5dUlHMlBheTk2NXRtRFh1YUFFZ1NC?=
 =?utf-8?B?TXJZODZ2VU4vQkFpOTZ1YUNPQ0kvVW05eWlPMXNkYTI3cXFSU3laem42dzZi?=
 =?utf-8?B?akc2Vk10Qmk2MWV4TVZocjZ4cTBqdGlCSWRzVm5ZRjN1Q2NHV3dRRktHemph?=
 =?utf-8?B?RTNENS82cU01TVo5RTZCRXd6NnM5OUQxRkttMEV2SG14RTI1bG1ydDQ1eEFO?=
 =?utf-8?B?RC9xK3VOb2tpak52ZXErWXYzOWY4TitBMkJOek9XREUwdGs3UHQzbDZxNHJZ?=
 =?utf-8?B?Q0NZN2NjRTNkOUx1alR4MW5VcjFjYzJETUVhbUJmSEJnWjdFdWtnQ2Z1NmNv?=
 =?utf-8?B?dEhDa0tXMTZZaG12Qkk4anVzMlJxZTZTSURDdTNUU0JTKy81cFkxRFlsRGJL?=
 =?utf-8?B?c0tKbEFrNXR2NkRxZmtZbkV3MkdzQWJmNHJoOHVxMUxEMDJsaUlLQkZ4bE9a?=
 =?utf-8?B?SEk5amhNMGNqVkpSYnhzQThRcVp2cHlKTHFkWDdWSmJuZzRWajdwbUxCRGxL?=
 =?utf-8?B?V1htRVVFdjhnSzladGpxOTVrN0MwRlFtUDE1R2Ztck9BNFFMa0FxR0RJTnlZ?=
 =?utf-8?B?V0k4UTNmSDk3V1BSaXFQeUU5em1aMkFPZFhUQ2YxMmFISitnYWpETkxRWHZI?=
 =?utf-8?B?c0R6SnJWRW0zTHF1TmoxS0xwUHdrNzg0UzN2R3ZjQWJ0c3JJeDF2ZzlLM3Ev?=
 =?utf-8?B?SmRDMnRDKzdCRHZLUm0wcmM1VUNOQWtoYlhKaGFSL2J1MUFWcTRiWFUxc2ZD?=
 =?utf-8?B?OUhLVDBWYWVoYkJrSlhOOVBOVWhZdGxQVFptQXd4UkhFdTk5c01lUHRKK3Ry?=
 =?utf-8?B?V2I1U05YZUJUN1g4NWVhV0Z3NHJUbVo0aE9pUEVwMXgrL2k2U0Q0U25WOFBV?=
 =?utf-8?B?c0ZmWXpCcitwWXBOT3JsRWdpcVUxTGFldCtYSTErWWJwM1N4UlZib1lFUlda?=
 =?utf-8?B?R2xBcTRrZ3l0R21mZ0J5eG40bGg5NGNYNk5RR3dwS3U0T0N2YTJkeXoyVHo4?=
 =?utf-8?B?TWVjd1NiU0ZMVjlaM0hhaFViSXhDRlhnWmlzQ3F2SmlzRDdsMENMTUE3MXNp?=
 =?utf-8?B?ZzZvVGRBcktkNGNLUlFGZkVOUHZBUGt4Y2NRc1JKbGtPNkRudXJ6UTJPK0Fi?=
 =?utf-8?B?eFg3b25MQ05Vd200RUE2R2NpWndYUUdUSHZRbXpjK1pZd0JMWURtd01McWFr?=
 =?utf-8?B?K0htVjFUWnJsNnJ5WS9MQU1LelVuV09pdXNOZHdwWElPUEg3WERyRmhNcWpY?=
 =?utf-8?B?SnVsam9aWXowSzVZTXBjQVBmRzlUSkx1R28rWXJFQzM5akEwMWlySTVtUG1T?=
 =?utf-8?B?U2tGQUc0TkgrVVFlSmN4OTdUbXRBcVdjNmJsZVJQWTZQYWdvYzU5eE1waitS?=
 =?utf-8?B?Y3Rjc2VlVmUycEZ3T29mK3Avamk4Ly9SVkwrVUUvYWRmSWdJTTdWMC9tSlhS?=
 =?utf-8?B?L1VkbUwwSW8reTlDOStJMkRRNVF6cTZvOWZWeEdoRVZGeU9MRHAxZEJmMjRI?=
 =?utf-8?B?Q05oK3psdmJaSW1FNlR4NmZLVEJYcTk5ci8vOG5CM2o5a2FSOFNUN0QvVkxN?=
 =?utf-8?B?YVM4SFdrQy9mbWVMMTdMZ2EyMENhMmtMQXA4RVEyWW5JZHFCbUZmV1lPUzdC?=
 =?utf-8?B?MHNNekxCMVRITGd1RzVWVGcvdEJaNTA0dXowN2p4UlNKUkJrc0t4ZlMvK0Iw?=
 =?utf-8?B?b1R1ZG1vUksvK1lBSXcydXJuak16QmNDWGhST0hFSkVYMXdjT2JVQ0pnU0Ew?=
 =?utf-8?B?U0tzaVRtMnp4UkFHdzVGVElJRHNJd0VxOXVFeld6WkFaM3J1TzhhQ1RwZEFr?=
 =?utf-8?B?NnFuUzNMYzJ1endRdVAxL0phK1FIS0ZGZFUxUHlXeXZVMUQ0VE15d0E5YklU?=
 =?utf-8?B?QXp6YitjbW1TS2xnMUNpZXc4Y3Y1L2x0MkFwMGd1dGVhRExrTTV1dTB5T2VL?=
 =?utf-8?B?ZlNYeHdMc1U2Nk9iNFI0VmJQTXg3aUtOWkZzSWJ2aEZoMnlCQlQ3ZjN2aGVr?=
 =?utf-8?B?dzFxT1lkcUFDNXdJTjBVNnlJeVNFY3o3TmozRFNnZEZVLzhaVWdFamwrOW9L?=
 =?utf-8?B?MGc9PQ==?=
Content-ID: <213C16B5BB266C468CE52E73E50F504C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cb126f-9694-432e-d859-08da5ab6f13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 16:38:20.3696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4L9S4tdTl8QTd9GtWlHCzhfPSOc4vLhjBUlrVUv0110LUw67n8ny7vw0AYqgYw1IYKSmi2ym7hYZVMPkkK7K7u3fKzrqs/Ge72lMXUUHqwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_093824_829300_AFD86B88 
X-CRM114-Status: GOOD (  19.56  )
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

On 30/06/2022 17:28, Niklas Cassel wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Hey all,
>> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
>> based boards. To make keeping it that way a little easier, I changed the
>> Canaan devicetree Makefile so that it would build all of the devicetrees
>> in the directory if SOC_CANAAN.
>>
>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
>> action. Since I sent v1, I tried to buy some since it's cheap - but could
>> out of the limited stockists none seemed to want to deliver to Ireland :(
>> I based the series on next-20220617.
>>
> 
> I first tried to apply your series on top of next-20220630,
> but was greeted by a bunch of different warnings on boot,
> including endless RCU stall warnings.
> However, even when booting next-20220630 without your patches,
> I got the same warnings and RCU stall.
> 
> So I tested your series on top of v5.19-rc4 +
> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
> spi-peripheral-props.yaml") cherry-picked,
> (in order to avoid conflicts when applying your series,)
> and the board was working as intended, no warnings or RCU stalls.
> 
> I tried both booting both via u-boot (with u-boots DTB)
> and booting the kernel (with an initrd) directly.
> I could successfully read data from the MMC in both cases.
> 
> Therefore:
> Tested-by: Niklas Cassel <niklas.cassel@wdc.com>

Thanks Niklas.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
