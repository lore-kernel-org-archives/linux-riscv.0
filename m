Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71115C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 23:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FIZC8NOeglKMZG7h3dwfotD8P3ey/I7CItVTUYB5Jw=; b=fFmY0Py5kIPjxI
	GMRyFn0nr0x+dzCcOCOyIgsYwfrUgjKQ8o5kkfgsGy4jFl9qZwIbAOWv915G4s2+gblXbKXVK/PWA
	KGzAH6VJF8VUF5GH0B3byqEx2GTheTowcbbTMNeK76Mr87I8EinJwRDk636vTqGv0e3KTYSEM07Df
	b1UF4gPs1d3g8GnTXGN75shcw5kBoojRY4KmP0oI+wX23nxk8zpaYvmbikuxOIzDh+RtrkfBGQVcp
	nZsi6ImkyJOozNTmXuL6+OFEaJGo2y3fsz2wOEOw6BDANEwRoe5qQtz7wJ/3S69AQeGP67X/3tgzV
	Z+bG507vpanQVVAuBtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o73LU-0022B4-LH; Thu, 30 Jun 2022 23:13:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o73LO-00228v-F5
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 23:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656630786; x=1688166786;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GheaHPNZSiD9lZ/VwxmLWqqq6RkC64WmSURgQ2qgFno=;
  b=O4WWMpNmEj46XlHWK7BohqPmgwRGc5X2tr8kmuw/h3PCTATYASiJGDA9
   sQijmI7Zkqh33/H/vO04WMOPAWn6BCLEQK4Phqd5vRFego13uNmvR3vmT
   w8Br9anLW3B7o1YTE/9VbVh7GLwtMo7iR1Jd/D6jesZ9VAm+PDbAn3AgL
   EjF9VZzzbhW/SDXDc6IgziYPFPjl8jiX/5Ug+DuP1pM7B9KMFg72qYKib
   mP9TNiCPP7yrKErUKYrfpPuyt6puC8iEWt9UXK0sgLPhiOm60c4O277Rs
   awBjK8lnUl7hkMFWWGXOVRYFQeksqNgQoFS827Xj0wplcDRfcdGR0322i
   g==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="170603292"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 16:12:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 16:12:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 16:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4PNscrJ1kBcLcO459+mr2c9PEBuJ9tjeyAy43B9xENn3smNnQT3zcwUCCoXVMuM1WlLmPAOJKmrQVPGqqpXjZZ50NfjIkIhm8eqpnF1Modh4O/4RY7LaleYOvaS/OP2I9K1ul6NxSPN0Ratc5VNQNHoRzqEk5QW+KKG88LmSSjibo8qnwRpvOOGG7sfnaLVhvosMJEC0VyFjIktt0ZBye6ApYyT4BJT502ud2FYYz8zm+dBBgX0cDfzk+Mak+mcaCE3wqUWG+/82xOidQccc6FBUb2huSRS+OVbppHQM+94d1ipdJ7LkdNkOxYGdacdZ35z/eZ+p4kaWoqqBDAeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GheaHPNZSiD9lZ/VwxmLWqqq6RkC64WmSURgQ2qgFno=;
 b=NiYO/5eEO05UsXHofS5GUf9iecz7X5tCOUC4MdBxgD07g7WcyjLReJJA68B3kQJ/XdQmRjG3Csx1YmW6dxRc+vWbzm4HZ/FpDBlNWEq7+lpoRCoDcx8JF0FHv3N6M0/ogysaB4VidlIQptCSdY2G11h07Nm3lJpriWEyAKrpnn5n9ysKfySlb83vRBuseq2sPLVyGZHyDqddQGYkicXaS+Ac+DsaNF/XMWcFYyRIAuyP6bnl9nFYLxUg6uAZFpa6r/uNgRRrFaW/H2Bnbo9VOjWlxTk8qpzvby5TJneDyrGsEZ2qKdl0OuGI6pZD+0JAjvRdvTr2wF215pJApUW6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GheaHPNZSiD9lZ/VwxmLWqqq6RkC64WmSURgQ2qgFno=;
 b=SQvm1qAC/80+ahrrjlAPAibTLyH5nwMUUrRdPf+Gd2YugdLYXKS9FAanQhwMP/h7yyUReF8fCzHDCk8ChkGucV+cxOdyrm3uOboIIJlIgGPFIlyiP0qctE0ISOH21Sutkbm8e2xNX5+q+7MNAALeiuAVQto52xG773LzMxSY5Cg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY5PR11MB6164.namprd11.prod.outlook.com (2603:10b6:930:27::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 23:12:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 23:12:54 +0000
From: <Conor.Dooley@microchip.com>
To: <fancer.lancer@gmail.com>, <mail@conchuod.ie>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <daniel.lezcano@linaro.org>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the number
 of interrupts
Thread-Topic: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Thread-Index: AQHYi+h3OU8MpvXbs0e9Pief7bAu5a1ogHUAgAAVk4A=
Date: Thu, 30 Jun 2022 23:12:53 +0000
Message-ID: <f7d64f1d-9fb8-6259-cd60-8bfc65636300@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-6-mail@conchuod.ie>
 <20220630215540.cifnzovya57bgbsw@mobilestation>
In-Reply-To: <20220630215540.cifnzovya57bgbsw@mobilestation>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a77bd506-d1b2-41ac-950a-08da5aee0fcb
x-ms-traffictypediagnostic: CY5PR11MB6164:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /rAiy++3e8odaq9I1HByAYf5F2qPBXFTNehJOlUEHF2fUJ0AvsXshTCmJSQo/KzqbGenTP4jbsxO6x3aTsYKSm94i/7TjqzK8yV6LYF3fFLEXPxx7YpapxUWILf4ceiMxiSd7UCGI1v6GZwb/87f79/crMM31JjYNpKrO2L1vmiZlx4uU66zfY3E+0hpQQO7WwmMIyM8Z1zNlsdKj1QH3Y+/iOpQMtysnhscA3Fgulhsf91cFQoxbLURredM9eAY+ApcHySQD/QMOkTyIzJ33oczc81zr/AGpDQ2vUfUCHKEhgmguzgf1b1pXKgy5m1C6zSKQqcFsuQESSbtK0eKPxRcGAn0WPb9fSKP+blTaME8ImdRyRfiXyNExg2FsIS6oKS+ZzoaKjjFkuLWZDoEjUYUMgoRmKKSU2i0SXVMni8aD6sfOAiE520Jon4GZnFdeEWlq+iQY/IlPV/j8qemiSywReavqeyNTiI7YLOsgw7KCfmcfN5ktvj4nQoAq18u6kSALVP1T2lPloxKzqsTc3eEHNAFAT6cHckQLunlfiEMCwPah0JqoPqxZZs7d0TRrItXuJn8MbIX/y5SebLtuLrhC4JHQ2OSOwD43Q903HJmH/ENLvMPe/Xo4Et57XaU5eeHNN5vBJoG+ume3aJBYsyDGn0glA7SUrSQ+e1YHzIyHCIa+rljUGJBr91WRnH3lO83g7ea2L+pGy/o+xvf/uF5QWgiL9WCSD3Mw3F6GOTeRN44bBmL1IJ2M1UC5tWy2f8AXMsaka9YufKMjKXKlJw9lmZLDW97TUtLkmAg9c0JdmgukZJg2gaReextXPX76ctbc2KVVT/GWVYZS/9P+O1jouPWBlnLeZ/gSAyg2iMKNBsjAu4dKiE1eEWbp14Yxjo60g4iL7SJtCbPnLo8HlSHHxriK2RMpc0H4gmiiTy0Onl8hDoGqxhm+IeSRQ7i
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(376002)(136003)(366004)(2906002)(6486002)(966005)(478600001)(6512007)(110136005)(8676002)(4326008)(71200400001)(316002)(26005)(2616005)(31686004)(53546011)(86362001)(36756003)(8936002)(31696002)(76116006)(66476007)(7406005)(66446008)(66556008)(66946007)(7416002)(91956017)(38100700002)(83380400001)(5660300002)(64756008)(54906003)(122000001)(6506007)(38070700005)(186003)(41300700001)(15398625002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1lROWpoanZSejBxUElIOUJVMnhMVjBlL2lGVjk3c2o1RnNmd3BtR0Z0aHpQ?=
 =?utf-8?B?aG5CY3QrU3hXckp0V0EzV2NvRy94M2JqOWRVNUM5ZS83aUF5bzNGQ2p0S21L?=
 =?utf-8?B?cmJna2x1bTE2RVk2UDBCK2dqamMrSmhrbDVhNmg3ZGdoUUtNa0JTT2taZkFi?=
 =?utf-8?B?bFZIWGxJeGttSTZDZlZBQmljQkF3UWtTQklDM2FuVTByaHVjQVBCZ0FZTVlG?=
 =?utf-8?B?dzRKMURZSWczUUFMRlJ0MlVCKzN6REczT2haOHdRYytCKzhXNUdkWWNYaFJ3?=
 =?utf-8?B?dFo2RmszRlV0VUpGQnI2MGJHME0zUW1NeVNlTmoycEdWYzF2NDN0am1kQjFX?=
 =?utf-8?B?VElYdUtCYTExbkVBdzA2MlZrTklrSHFjOUZpcmVoTmwvZnREODQ0QjZ5WEJQ?=
 =?utf-8?B?R1pyUDRPM0dueGJranB1bnpiM1BpTXRrSyt2cVV4VmkybWNVRmZDZ0I2Um92?=
 =?utf-8?B?YS80NjE0NVJoanJoS2l2VUJqcnhYRWRBZldybHlZQXp3M1VRTjRSNWZaYng3?=
 =?utf-8?B?ZEF2azVSV0c5VU5QZFNMVnlKOXJHV1NEcE5SSzM2S1FOdzRWRkEzWkFXVHpD?=
 =?utf-8?B?UForNXE0SVBWZllNRDd0aUQ2UmhmYWRyV1hyUnVSdjB2aUtKdzJpcTBQamNy?=
 =?utf-8?B?UThRcFdRYjE5NENvMG5IVVFEQm1Hb3dBalRiTC9VK09TTlRWT3ZxQ2svRVAx?=
 =?utf-8?B?Q3RLTG1KZnQ1SGIrTzJ1OHBPbGtRSFZOMGRWdHFCQ0tqSnVvb1dMeFpYOWhP?=
 =?utf-8?B?ZG9BZXorY1ZBRmdHNnBtVVVkSHFrelp5S0VOWmVOeWVQb2NnMFRnU1FkZE9W?=
 =?utf-8?B?QXUyaXFjVUdKbEVNNEUxTE8vT0pMUHhhSjFSOW1kZWFGTDc4NHdMZHJYeGI3?=
 =?utf-8?B?Z3VhNTBOMnlxdDNWb3htU3dPckFJZjZ5K21uSnhuNTk2MXBIQmxrZjY5TWdp?=
 =?utf-8?B?QzVPUEx5aXRGZy9hK0k1SDgwRjJCRGZjQUsxS1l5R0lCenhlUWZlcVJDMWdG?=
 =?utf-8?B?UHFwY3RNazdEWktQRHYwUlVvOFFTZXdyTXlQakFBclRTUFBsLzhUaFpkV2Vh?=
 =?utf-8?B?a3kvTkpRMUZseTljMWVGeUVpVjBka1dqZHZLeW1EWk1aeWdtQkNOcEpSd0pk?=
 =?utf-8?B?Ykk5Nk1ERGxsUVlFUVJKWENQb3RwUkZzK01yb0FWbkY1Zm1Ja1RqRmFnWXl4?=
 =?utf-8?B?d0xsVG1ab2JZVERWeGY0NTAwY1ZOUHVPSHVNTHJDN010bzNKbVYyYmo2TFRt?=
 =?utf-8?B?NEE3c29NMVE0dGVCYTVQRmMzekhFZW10ejVSUm1id3g4NDRoTnpWOVZFS0Y0?=
 =?utf-8?B?RXl4KytvTnpPQU8xUExYQjIxSjNseHZJb2ZkVm00SUt1dWl6elFjOEIyRmZH?=
 =?utf-8?B?RCtGL3o5WS80VVlnZnVaak10b1ZSMUJiR1B3UXBwdmdkTEdOTGJKSkRHY1RG?=
 =?utf-8?B?VSs4YlNFTVdrMmh6L1RHTXVUNnNxNlh3S0FwSGdkVjNZYW9aVWR4clUxNGJW?=
 =?utf-8?B?ZUZTclViTnptNVkvS21GZkZ0SEhSaVFWcjJDa2pBMUtVWW0rQXpyM3N5OVBk?=
 =?utf-8?B?M2xsc0tFUmdOYzNVUU9UQzFhL0tFM2pKNWZVS1lzV2lHdjNocE1waWNmRVBH?=
 =?utf-8?B?eGV5VlIyVWJZMkc4TlhZTG50VXUrcnVmWkhBeTg0VEp0dko4cElHR3ZMWm0y?=
 =?utf-8?B?WTU1ZUFXYjJEWVhmNWl3MU1kaXI0U2RBTGpNSW95cnNJMjNROElDQTVpOTR6?=
 =?utf-8?B?M1E4d2dUb0VZTkxCRGxoWCtOR28vOGczcEpVUDZiZjNtcU40YWprb2lqc3c0?=
 =?utf-8?B?Tk5uczJhQllLZEliZkxJbm4xZW5sb3BwejBZYlpmZmZEbzBWVEVBWmJ0UGJH?=
 =?utf-8?B?VW13eHNWcFhUY0xoSWU5OXVVSlA5R2FvZ1REeTdvcDdzY0Q0UytWdTN0WStQ?=
 =?utf-8?B?NFFGblQ0UFY4eUQrc0ZaejZLcWFrdWlmZUU0Qzc4QWVZUmJXZjJtcXZiTEJ2?=
 =?utf-8?B?WTJEZGY3bXhwYzdTaXdHdmc0eVN0UUJJSlRrdDJKbTgrYzE1TEhmNCtoRm1x?=
 =?utf-8?B?amViUWRHYnA4SUtIbEJ1WnZiY1RZbktSQXprTk5OdU5wK2FvUlhmc0dEQ1FG?=
 =?utf-8?B?SS9BODYrQXozRzkyMW9xS2c2enl5cVlMdDRpR0ZpYUN3ZlV1R0NoQ0hWSjlV?=
 =?utf-8?B?L3c9PQ==?=
Content-ID: <BAED936A9527EA448A01955AF45E8C93@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77bd506-d1b2-41ac-950a-08da5aee0fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 23:12:53.9750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J6ilMbXizmR5OnlPzgSBjCGvTdS4zIGh+DK3AH6OJBTyQf0tA1Vo0rstbCOoENSk1OLfQs0u/UnPfcpPYyDxD6jflbTV9S5E7bOgtLDKPsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_161306_728506_8B366226 
X-CRM114-Status: GOOD (  18.48  )
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

On 30/06/2022 22:55, Serge Semin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Jun 29, 2022 at 07:43:34PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
>> controller, but according to the documentation & devicetree it has 6
>> interrupts rather than the standard one. Support the 6 interrupt
>> configuration by unconditionally extending the binding to a maximum of
>> 8 per-channel interrupts thereby matching the number of possible
>> channels.
>>
>> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index 4324a94b26b2..e33ef22aec9c 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -34,7 +34,9 @@ properties:
>>        - const: axidma_apb_regs
>>
>>    interrupts:
> 
>> -    maxItems: 1
>> +    description: per channel interrupts
> 
> Description is inaccurate. It's either combined or per-channel IRQs.

I will change it to:
  interrupts:
    description: |
      If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
      will be per-channel interrupts. Otherwise, this is a single combined IRQ
      for all channels.
    minItems: 1
    maxItems: 8

How's that sound?


> 
> Other than that:
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> 
> -Sergey
> 
>> +    minItems: 1
>> +    maxItems: 8
>>
>>    clocks:
>>      items:
>> --
>> 2.36.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
