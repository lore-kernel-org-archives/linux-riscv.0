Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AB0C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 20:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOw3TlkKnoJvErQhE4ND9yO+iZ9Bt22ZazsVpfHrf04=; b=d/oRSITfO60P/w
	Gqk2T44QFHr6XYhNCVCXM07L/AAWCQ9wSVhL9laYLUZs5us3mXj0f+P4JsrvLap+UBeU8XHx6yj4Q
	Y0KrQLKuuckartqmjEQacfn5DllhBXuKfIMFmTmWNoZvpIng9Jub+Xaplzt7Ete7PNGfkeuV67/p6
	dflW5ss/sEz+pPuPaizvDmNFuqiQW4vqHspMkqxPq8Ai1+FSHaHYwlQT2I70bEdHwuFscNCwixyb8
	h5ZHxQxhTR2VnUTO8dOyTLaTeANsIvw5Yo172kazuTlFObOAJyZadGi6HQOavK8jjGvKGfGpIZSGv
	SBa3Rzi7lS0Elm0tLCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBMqa-00EiKb-N6; Tue, 12 Jul 2022 20:51:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBMqW-00EiDL-Tw
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 20:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657659065; x=1689195065;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XjzPKMP4nNJx0734SHImK8LI1jnpqj92sctUQOLjd/o=;
  b=JBB+tWSK+cCiCMLnMFnRls+1yP/PmY41dctec4yFe7iL0JMNn2/kY2vf
   BEfJhwQX6EXHjwPZDky8h1zHpRHwaTEjStHF1F7AMlh0KCbGdDPKJ9a+D
   NE/zBvJulhG8TTS4pm1pCB47O/BtAwqK5jIPFz5yOjDintSY7B3DwO0ye
   ojE7/JUuklnsu/x6GVVYwSdNqf9B6VzHwCGo7gdnwEkLZiw8Vmsl7jp0D
   udRfKacfBNLWph5zrjCFezDlrqgcK9qo32XjTAq/SqkqNqTSC7g/DAEg2
   5wBGiSSnO2M6zL+5GGIRJlBxGfGfO9h5vX5pEJB10dGgVMrtMAKukWjj/
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="164438243"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 13:51:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 13:50:56 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 13:50:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwhXDcKebulitclM0P3oDaWJoLvbKPXXkiEfR0uU7maWObGFq1jgkUyH8bdARiIa2Psc18Qe5DQQgYAsz4hkLOJkQsew7f4w6+Hzku7ZCspgElWaEzreUh5fS+DPc592Gog4UbVlIn6zrRGXm7P9rUHFDEAuPoNXCjRJv4g5RGuJsXsA2StWKzbvtpVuYvfAB2J4AdaRpAgKTCJzVfcq4IT2OXVX5mCXT6Md3rHfyrxzGsCzhro7pt5mnOdgWnChgNvnWje6h7BFjxitvw8ZU0f4h9j0xYSVnU8aYIcT8gyjPdrv2lWzIIHVRVOITHiyffwyyGjw9L5t00vy8GDzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjzPKMP4nNJx0734SHImK8LI1jnpqj92sctUQOLjd/o=;
 b=SHNMR22FHcKd4mmPQKQ8fzbkoEYPpTrHKl5FALdoYLiYd0tJO1ZL3pnbdF9NUZqCCGfhNkLg97p8UO5l/tNssuZfVYYnVBoHHHdr0Mo1SnPvQR1phwas/bN0GlO06mLwhDjr8GwpYjHcUOKqDtGElmEGXScpnkosa2d/MliRkivFcZZIuOaNuTSToc92hYeqFA0DKNeCzuxwoOJt18x8Kja7aa9sWp99gCMFJGYgUzJEeoBrKfFDt+KDiWehY4A1brc6FjSFNUkr/WJuYu8xfMUE7ZtokgDfZco3a3J8RjbBmE9/gcfQdss0VLEcAh5OE3/B2t9NcT/fRxLk929GcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjzPKMP4nNJx0734SHImK8LI1jnpqj92sctUQOLjd/o=;
 b=Rd3Cg1352G5iIZVqS1n+vFSVXY3SvOrYcfwxTC8PSgM1qHF2mXATT7DsHreuHfCHaXCZK1gxxRgARkwmZvhr3Hdt8off9r4+yYlvyhg5JRIgbIdJPGsBpMjEGtwA5Ro5PcpM/6hxNygfXFEGgBxUgE50oIPAn1fW/J9Nwj9d4xk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 20:50:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 20:50:54 +0000
From: <Conor.Dooley@microchip.com>
To: <yangyingliang@huawei.com>
CC: <Daire.McNamara@microchip.com>, <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next 2/2] spi: microchip-core: switch to use
 devm_spi_alloc_master()
Thread-Topic: [PATCH -next 2/2] spi: microchip-core: switch to use
 devm_spi_alloc_master()
Thread-Index: AQHYlfWKEaKO0rADDkGuzfTu66tTVK16xHiAgABxw4A=
Date: Tue, 12 Jul 2022 20:50:54 +0000
Message-ID: <687d4652-c231-bfa5-f76f-ac826ab1fe98@microchip.com>
References: <20220712135357.918997-1-yangyingliang@huawei.com>
 <20220712135357.918997-2-yangyingliang@huawei.com>
 <87581e76-ceb7-9efa-d6dd-5ad4fe66111a@microchip.com>
In-Reply-To: <87581e76-ceb7-9efa-d6dd-5ad4fe66111a@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15dc67eb-bac3-47f8-b013-08da64483692
x-ms-traffictypediagnostic: DM4PR11MB6382:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vsrK/BYwUi2SyJVG5Xf+svk6QsYyTtKmnIloid8FNH+0tmm3vQXU80+Xurbu+IMyvHRy49nqPhZZFQbZeiJ3ndAI0t7qVXJz6HOTV9JqV/3dOi6V6TwW5wxj0pPxNAqVnzrZ80LguurR5oB9xZuC3Csmjk7mU+7ti/y+PCqePMXxPusUx5BU6rsT3pAJg1M988qu9ykCxli1c6i6dd4qySY4kv3ZEQ7pNTYaCkBcFHHAReExZ2+Y9gdNhLgxQFpLGjtjZvKu3apLRo38dT5gaIdFKWQw3Bpx5zTAsKN/A/Tw7Ar6cJs7KLKLiSJmA+HjmJNqP3K8VbS9N3wzGd9i7CgPpzcWTA+Ypm651dHd9S0dvvwW7aemePMMZOnN/UlYo9asEJFRjWe1M6YQBT5h//lyFootuZ04d6w5FWyrS5l3IlXw5qgoSf7iWDexsXLQFTcXdVQQHCN6nNBd2Z42c8QBHGjI96iauONH7cehf9NvpStPzi44h4hBNZ/94X28krjUPH9lCGw1fmE+1q9ROQOUGSamzNTubHB1A7cDcqXhA/NeTaF8G9whiqyz3RVj8Zx7UFzatEBhbx8VNBnujhppXNXODSyCWnoR2F8PnDGVYJLEo4HJhX07iRsslUKdZ4nGPaYu2uXh+55QZUKMGRB8USym7QrHn/3q1MZIbZzLNSLhvdXQ+dEQtNSG8HNB7py7Ak6J2g7Nw3WOcXobx6T2j4pZABLsORIYfqLRD8cj75P4zOlwptRutCeZnhDF/BSx2/Ui5K8YaDO5l8qtLC75YxQGo9caRq5eNQRLihiSQxIHYI5/XAVY7e9AUcpkrPTSm9SKh7hlBvq3KeMZDZiUxo8OMpv/DRL6Jbo7SLiBHWPXz/16ThyCw7OxewjuxuUlWyFSl2MT+sjs9tvdr0vruh7kmAJr7TYg1utp8YM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(39860400002)(366004)(83380400001)(38070700005)(76116006)(71200400001)(6916009)(186003)(66556008)(31686004)(8676002)(54906003)(36756003)(66946007)(66446008)(4326008)(66476007)(122000001)(316002)(64756008)(91956017)(41300700001)(38100700002)(2906002)(6486002)(966005)(6506007)(86362001)(478600001)(26005)(53546011)(2616005)(5660300002)(8936002)(6512007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnNoclBDT3RTYmtOcFpaVStRUFpUdHRWb0oxUUZUOFdMdjRHN0dHakMra0Ra?=
 =?utf-8?B?Q1A4Z3AwbmpKQlYza3lQMVpwMjBPR1FzWlA3TXlSWmhtYkJYMktYK3M2NE1x?=
 =?utf-8?B?WDQvOUtrMjhtTG1ZcjN5eDBkYVBTR1QxZjFPNnEwT3ZFL1VyVk9mclhvR0Uz?=
 =?utf-8?B?SXpxem1vcHhOakZUYWtDU01kZ0JXOGd5Y285RDVaM1R1WlJwbFo4Nk1KNndK?=
 =?utf-8?B?WEVoVXc3SmwvcXR6Ujl3RTlESFV6SHdITmY3bFFhbk9oSkRnUlh2ZHY5ODJv?=
 =?utf-8?B?UmJFSFJqeHQ2VEI4alBFQUhLaFcvM2FVdTRjQ0xFdWw4eXh0Zjdha3BaYUNG?=
 =?utf-8?B?TStJODBFV2twU3hBSXpWNjI0RFVnU3haNkErWitCL2Vzc3F1VEtHajlCbFRh?=
 =?utf-8?B?bXErNUoxSzNwMGtBNUxQbTVveGlsUHpOVUVvb2QxWi9CdVpBVGF4ZStlQm4r?=
 =?utf-8?B?MUk5Qkc0VS8rY1pVVkVqVDZqT0NvZ0R3amtsYkE2cGtnWjJ0YlNPdk4xYkMw?=
 =?utf-8?B?Wi9INUxpTFhEaUl3UHBES1FZWjlnSENPSTdxdDc1bWF2dDJzeElKbXo2WklR?=
 =?utf-8?B?ZUZVWUw2cGMxbzdwSk5nSWFDRko1QzZ5R01JaWVDOEx0ekd4d2RPRHRHYlZ4?=
 =?utf-8?B?Wkx1K3VBeFV5dmRFYnV0VDlSRFQyT0NHTitpQ1lzaGtDUDMvUHJ2eEozSlFo?=
 =?utf-8?B?SlZySjl6SXZJbHNvSERkN1hCcmZhWjlqTU9NN0xVa0UwcmpCbnN2NGRtMjFC?=
 =?utf-8?B?VkZJTUJzcUEyODFDcTdmekN0Z0NZbUlCUXFTS3F0ajdjck9RL2xpUEVibzZN?=
 =?utf-8?B?bFFRSXVHd0ZJTTVPZmZpeXhXSUlPT3BnZU9GUFV4NnJramFMT05LZGRRRmhX?=
 =?utf-8?B?cVVPWVJQZ3pJSDhkTlJCSEdZaWMxcEh4dnlFME0xY2lXYmdwMmxiZjFEWUZr?=
 =?utf-8?B?eWhGV1pFeitveXE0amRTSm5ncU9ZM0piQXhPazZtYlY2Z3VHUnV3TE5VRHBv?=
 =?utf-8?B?cEN5SFd5TGFEcWlmSUZSSkZxV2pzWlU2UHlCckN5d3hFSWhudFR3Kzkza0VR?=
 =?utf-8?B?VFJjTWpmZW5HRWtVWFJlaDlKalNNdjNqQkR2aTZtRFA0UHJZa1Nnd3IrRzlS?=
 =?utf-8?B?c3VxQWNXWGRCeXg3MHJiYjRpWFg4OUlSNGJKckNvSjhGYjhUaEhJenIrMW9I?=
 =?utf-8?B?WG4xMFlKN2JMZ252ZnpsZXJyS1RTTEkzdHFuZDcydFhOd0c1MWd3aXdvK2Fy?=
 =?utf-8?B?dGFuZHoyd0xFbTR1eFYzSzdKc1ZqazhwWlZoSUxUcEp3VU1rWTNmdzRwS2pz?=
 =?utf-8?B?QXJpU1BaMy81bHNKZ3FDcmJrYW9Uem1rZG5lUERRZzYzb3JUdHRZZUs5U3Fm?=
 =?utf-8?B?M3ZtdkZ6STdPekZXcWd0Qk92Z2FwSmFtMDRNVDRhc0NhL0FDOEY2bUNCQzFH?=
 =?utf-8?B?SlVEVnZjRERjeXF0YkJYREZxL21JQ2xOY3pnUVRicXR5TmZGQjNQUU5SeWho?=
 =?utf-8?B?MnJxRjRvaVRTbjFYb3o5dlBtOUU2bkFwdWJFMkRlMXRuc081dVNMNDRKc0hS?=
 =?utf-8?B?OVh1U0g4dXo3STJGa1RTa0N3OXg0QjRUSk1raG5JN0tlenVUNnhGWDVHd3Vi?=
 =?utf-8?B?ODU4KzJWcFJHb0ZYczQxcGFwd2ZoVEx5eHc0R0FkeVV5aXNxWVpSeEFST1JJ?=
 =?utf-8?B?SVkrSmIwQmtiTmVwTGx3R2xkRjdBSSt6dS8rWDA1Z0xRSEV4REQ4TUdBckkx?=
 =?utf-8?B?Q0Qrek9JaDN0WlBIdzJ5b08wYXlvUDNLaFl0L3Zua3BxaC9VeC8rQnkxa28w?=
 =?utf-8?B?T1E2UWVuYjB6SXhpRnBDdURXV2tjMTRZMVlQckliVWlaYVhyK2FYMDZUTXZZ?=
 =?utf-8?B?RDU2MmQvaWlESEI0Z0pLMXV2TklrN3dnMysyQTE1VGpXQW1XdVNUWk9QQnRL?=
 =?utf-8?B?RENJU0NtZy9Kd3pTQml3MFBQTHM4eHNsY2ozd3VDYmVsSTNUMGhGSG1Ra3U5?=
 =?utf-8?B?empWdk5JMDdveUdlZmo1ZGFibGdzQ3NadzJXbi9qR0g0ZlBVMDh2ejZsT1Zz?=
 =?utf-8?B?bm5BSlJ1enZHQ0pxUTNac3ZwZU9qNVlDbms5NnBHbkl0djMzdDJpUjBEaXVy?=
 =?utf-8?B?UHpRM2RQZm9aRkVEQ2x1aGFsSXdZZGkwaVNwc01TMDNXZG1LT05rKzN3WXNC?=
 =?utf-8?B?OVE9PQ==?=
Content-ID: <61877F942F49BB4BA42CA22D65E53F5A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dc67eb-bac3-47f8-b013-08da64483692
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 20:50:54.1883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54xId2S3lbcjZgPcBP5szodgLR/lpzwWrGloi1VRlvLHoGmFDCb3wVRT25KVCUs3RBCdEjKwPNl85zgeaV5SNHDUuPCBmn8GEBNve/19dlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_135105_277542_CC989F5F 
X-CRM114-Status: GOOD (  24.00  )
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

On 12/07/2022 15:03, Conor.Dooley@microchip.com wrote:
> On 12/07/2022 14:53, Yang Yingliang wrote:
>> [Some people who received this message don't often get email from yangyingliang@huawei.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Switch to use devm_spi_alloc_master() to simpify error path.
> 
> Hey Yang,
> Thanks for trying to fix my mistakes!
> 
> Forgive my innocence here, but why is it okay to remove the
> spi_master_put() in remove() but not the one in the error path of
> the probe function?
> 
> If the devm_add_action_or_reset() in devm_spi_register_controller()
> fails won't the same thing apply to the probe error path?
> 
> IOW, I think this patch needs a fixes tag too b/c it also fixes a
> refcount underflow. Please correct me if I am misunderstanding.

Ahh, I just saw your revert of 59ebbe40fb51 ("spi: simplify
devm_spi register_controller"). With that, this makes a lot more
sense.

> 
> One other comment below.

This comment still applies for this patch. dev_err_probe would be
nice.

Thanks,
Conor.

> 
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/spi/spi-microchip-core.c | 20 +++++++-------------
>>   1 file changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
>> index c26767343176..1a24e47f8305 100644
>> --- a/drivers/spi/spi-microchip-core.c
>> +++ b/drivers/spi/spi-microchip-core.c
>> @@ -513,7 +513,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>>          u32 num_cs;
>>          int ret = 0;
>>
>> -       master = spi_alloc_master(&pdev->dev, sizeof(*spi));
>> +       master = devm_spi_alloc_master(&pdev->dev, sizeof(*spi));
>>          if (!master)
>>                  return dev_err_probe(&pdev->dev, -ENOMEM,
>>                                       "unable to allocate master for SPI controller\n");
>> @@ -535,36 +535,32 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>>          spi = spi_master_get_devdata(master);
>>
>>          spi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> -       if (IS_ERR(spi->regs)) {
>> -               ret = PTR_ERR(spi->regs);
>> -               goto error_release_master;
>> -       }
>> +       if (IS_ERR(spi->regs))
>> +               return PTR_ERR(spi->regs);
>>
>>          spi->irq = platform_get_irq(pdev, 0);
>>          if (spi->irq <= 0) {
>>                  dev_err(&pdev->dev, "invalid IRQ %d for SPI controller\n", spi->irq);
>> -               ret = -ENXIO;
>> -               goto error_release_master;
>> +               return -ENXIO;
> 
> Also these can now become dev_err_probe for further simplification?
> Thanks,
> Conor.
> 
>>          }
>>
>>          ret = devm_request_irq(&pdev->dev, spi->irq, mchp_corespi_interrupt,
>>                                 IRQF_SHARED, dev_name(&pdev->dev), master);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "could not request irq: %d\n", ret);
>> -               goto error_release_master;
>> +               return ret;
>>          }
>>
>>          spi->clk = devm_clk_get(&pdev->dev, NULL);
>>          if (IS_ERR(spi->clk)) {
>> -               ret = PTR_ERR(spi->clk);
>>                  dev_err(&pdev->dev, "could not get clk: %d\n", ret);
>> -               goto error_release_master;
>> +               return PTR_ERR(spi->clk);
>>          }
>>
>>          ret = clk_prepare_enable(spi->clk);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "failed to enable clock\n");
>> -               goto error_release_master;
>> +               return ret;
>>          }
>>
>>          mchp_corespi_init(master, spi);
>> @@ -583,8 +579,6 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>>   error_release_hardware:
>>          mchp_corespi_disable(spi);
>>          clk_disable_unprepare(spi->clk);
>> -error_release_master:
>> -       spi_master_put(master);
>>
>>          return ret;
>>   }
>> --
>> 2.25.1
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
